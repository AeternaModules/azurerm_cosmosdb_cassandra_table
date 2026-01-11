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
      column = object({
        name = string
        type = string
      })
      partition_key = object({
        name = string
      })
    })
    autoscale_settings = optional(object({
      max_throughput = optional(number)
    }))
  }))
}

