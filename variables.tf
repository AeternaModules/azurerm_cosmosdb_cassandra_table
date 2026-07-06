variable "cosmosdb_cassandra_tables" {
  description = <<EOT
Map of cosmosdb_cassandra_tables, attributes below
Required:
    - cassandra_keyspace_id
    - name
    - schema (block):
        - cluster_key (optional, block):
            - name (required)
            - order_by (required)
        - column (required, block):
            - name (required)
            - type (required)
        - partition_key (required, block):
            - name (required)
Optional:
    - analytical_storage_ttl
    - default_ttl
    - throughput
    - autoscale_settings (block):
        - max_throughput (optional)
EOT

  type = map(object({
    cassandra_keyspace_id  = string
    name                   = string
    analytical_storage_ttl = optional(number)
    default_ttl            = optional(number)
    throughput             = optional(number)
    schema = object({
      cluster_key = optional(object({
        name     = string
        order_by = string
      }))
      column = list(object({
        name = string
        type = string
      }))
      partition_key = object({
        name = string
      })
    })
    autoscale_settings = optional(object({
      max_throughput = optional(number)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_cassandra_tables : (
        length(v.schema.column) >= 1
      )
    ])
    error_message = "Each column list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_cassandra_tables : (
        v.default_ttl == null || (v.default_ttl >= -1)
      )
    ])
    error_message = "must be at least -1"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_cassandra_tables : (
        length(v.schema.partition_key.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_cassandra_tables : (
        v.schema.cluster_key == null || (length(v.schema.cluster_key.name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_cassandra_tables : (
        v.schema.cluster_key == null || (contains(["Asc", "Desc"], v.schema.cluster_key.order_by))
      )
    ])
    error_message = "must be one of: Asc, Desc"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_cosmosdb_cassandra_table's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.CosmosEntityName] len(value) < 1 || len(value) > 255
  # path: cassandra_keyspace_id
  #   source:    [from cosmosdb.ValidateCassandraKeyspaceID] !ok
  # path: cassandra_keyspace_id
  #   source:    [from cosmosdb.ValidateCassandraKeyspaceID] err != nil
  # path: analytical_storage_ttl
  #   source:    validation.All(...) - no translation rule yet, add one
  # path: schema.column.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: schema.column.type
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: throughput
  #   source:    [from validate.CosmosThroughput] value < 400
  # path: throughput
  #   source:    [from validate.CosmosThroughput] value%100 != 0
  # path: autoscale_settings.max_throughput
  #   source:    [from validate.CosmosMaxThroughput] !ok
  # path: autoscale_settings.max_throughput
  #   source:    [from validate.CosmosMaxThroughput] v < 1000
  # path: autoscale_settings.max_throughput
  #   source:    [from validate.CosmosMaxThroughput] v%1000 != 0
}

