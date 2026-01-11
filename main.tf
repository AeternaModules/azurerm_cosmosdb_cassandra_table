resource "azurerm_cosmosdb_cassandra_table" "cosmosdb_cassandra_tables" {
  for_each = var.cosmosdb_cassandra_tables

  cassandra_keyspace_id  = each.value.cassandra_keyspace_id
  name                   = each.value.name
  analytical_storage_ttl = each.value.analytical_storage_ttl
  default_ttl            = each.value.default_ttl
  throughput             = each.value.throughput

  schema {
    dynamic "cluster_key" {
      for_each = each.value.schema.cluster_key != null ? [each.value.schema.cluster_key] : []
      content {
        name     = cluster_key.value.name
        order_by = cluster_key.value.order_by
      }
    }
    column {
      name = each.value.schema.column.name
      type = each.value.schema.column.type
    }
    partition_key {
      name = each.value.schema.partition_key.name
    }
  }

  dynamic "autoscale_settings" {
    for_each = each.value.autoscale_settings != null ? [each.value.autoscale_settings] : []
    content {
      max_throughput = autoscale_settings.value.max_throughput
    }
  }
}

