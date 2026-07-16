output "cosmosdb_cassandra_tables_id" {
  description = "Map of id values across all cosmosdb_cassandra_tables, keyed the same as var.cosmosdb_cassandra_tables"
  value       = { for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : k => v.id if v.id != null && length(v.id) > 0 }
}
output "cosmosdb_cassandra_tables_analytical_storage_ttl" {
  description = "Map of analytical_storage_ttl values across all cosmosdb_cassandra_tables, keyed the same as var.cosmosdb_cassandra_tables"
  value       = { for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : k => v.analytical_storage_ttl if v.analytical_storage_ttl != null }
}
output "cosmosdb_cassandra_tables_autoscale_settings" {
  description = "Map of autoscale_settings values across all cosmosdb_cassandra_tables, keyed the same as var.cosmosdb_cassandra_tables"
  value       = { for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : k => v.autoscale_settings if v.autoscale_settings != null && length(v.autoscale_settings) > 0 }
}
output "cosmosdb_cassandra_tables_cassandra_keyspace_id" {
  description = "Map of cassandra_keyspace_id values across all cosmosdb_cassandra_tables, keyed the same as var.cosmosdb_cassandra_tables"
  value       = { for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : k => v.cassandra_keyspace_id if v.cassandra_keyspace_id != null && length(v.cassandra_keyspace_id) > 0 }
}
output "cosmosdb_cassandra_tables_default_ttl" {
  description = "Map of default_ttl values across all cosmosdb_cassandra_tables, keyed the same as var.cosmosdb_cassandra_tables"
  value       = { for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : k => v.default_ttl if v.default_ttl != null }
}
output "cosmosdb_cassandra_tables_name" {
  description = "Map of name values across all cosmosdb_cassandra_tables, keyed the same as var.cosmosdb_cassandra_tables"
  value       = { for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : k => v.name if v.name != null && length(v.name) > 0 }
}
output "cosmosdb_cassandra_tables_schema" {
  description = "Map of schema values across all cosmosdb_cassandra_tables, keyed the same as var.cosmosdb_cassandra_tables"
  value       = { for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : k => v.schema if v.schema != null && length(v.schema) > 0 }
}
output "cosmosdb_cassandra_tables_throughput" {
  description = "Map of throughput values across all cosmosdb_cassandra_tables, keyed the same as var.cosmosdb_cassandra_tables"
  value       = { for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : k => v.throughput if v.throughput != null }
}

