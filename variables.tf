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
      cluster_key = optional(list(object({
        name     = string
        order_by = string
      })))
      column = list(object({
        name = string
        type = string
      }))
      partition_key = list(object({
        name = string
      }))
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
        length(v.schema.partition_key) >= 1
      )
    ])
    error_message = "Each partition_key list must contain at least 1 items"
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
        alltrue([for item in v.schema.column : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_cassandra_tables : (
        alltrue([for item in v.schema.column : (length(item.type) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_cassandra_tables : (
        alltrue([for item in v.schema.partition_key : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_cassandra_tables : (
        v.schema.cluster_key == null || alltrue([for item in v.schema.cluster_key : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_cassandra_tables : (
        v.schema.cluster_key == null || alltrue([for item in v.schema.cluster_key : (contains(["Asc", "Desc"], item.order_by))])
      )
    ])
    error_message = "must be one of: Asc, Desc"
  }
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

