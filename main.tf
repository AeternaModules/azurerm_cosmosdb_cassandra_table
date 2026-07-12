resource "azurerm_cosmosdb_cassandra_table" "cosmosdb_cassandra_tables" {
  for_each = var.cosmosdb_cassandra_tables

  cassandra_keyspace_id  = each.value.cassandra_keyspace_id
  name                   = each.value.name
  analytical_storage_ttl = each.value.analytical_storage_ttl
  default_ttl            = each.value.default_ttl
  throughput             = each.value.throughput

  schema {
    dynamic "cluster_key" {
      for_each = each.value.schema.cluster_key != null ? each.value.schema.cluster_key : []
      content {
        name     = cluster_key.value.name
        order_by = cluster_key.value.order_by
      }
    }
    dynamic "column" {
      for_each = each.value.schema.column
      content {
        name = column.value.name
        type = column.value.type
      }
    }
    dynamic "partition_key" {
      for_each = each.value.schema.partition_key
      content {
        name = partition_key.value.name
      }
    }
  }

  dynamic "autoscale_settings" {
    for_each = each.value.autoscale_settings != null ? [each.value.autoscale_settings] : []
    content {
      max_throughput = autoscale_settings.value.max_throughput
    }
  }
}

