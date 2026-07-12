output "cosmosdb_cassandra_tables_id" {
  description = "Map of id values across all cosmosdb_cassandra_tables, keyed the same as var.cosmosdb_cassandra_tables"
  value       = { for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : k => v.id }
}
output "cosmosdb_cassandra_tables_analytical_storage_ttl" {
  description = "Map of analytical_storage_ttl values across all cosmosdb_cassandra_tables, keyed the same as var.cosmosdb_cassandra_tables"
  value       = { for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : k => v.analytical_storage_ttl }
}
output "cosmosdb_cassandra_tables_autoscale_settings" {
  description = "Map of autoscale_settings values across all cosmosdb_cassandra_tables, keyed the same as var.cosmosdb_cassandra_tables"
  value       = { for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : k => v.autoscale_settings }
}
output "cosmosdb_cassandra_tables_cassandra_keyspace_id" {
  description = "Map of cassandra_keyspace_id values across all cosmosdb_cassandra_tables, keyed the same as var.cosmosdb_cassandra_tables"
  value       = { for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : k => v.cassandra_keyspace_id }
}
output "cosmosdb_cassandra_tables_default_ttl" {
  description = "Map of default_ttl values across all cosmosdb_cassandra_tables, keyed the same as var.cosmosdb_cassandra_tables"
  value       = { for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : k => v.default_ttl }
}
output "cosmosdb_cassandra_tables_name" {
  description = "Map of name values across all cosmosdb_cassandra_tables, keyed the same as var.cosmosdb_cassandra_tables"
  value       = { for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : k => v.name }
}
output "cosmosdb_cassandra_tables_schema" {
  description = "Map of schema values across all cosmosdb_cassandra_tables, keyed the same as var.cosmosdb_cassandra_tables"
  value       = { for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : k => v.schema }
}
output "cosmosdb_cassandra_tables_throughput" {
  description = "Map of throughput values across all cosmosdb_cassandra_tables, keyed the same as var.cosmosdb_cassandra_tables"
  value       = { for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : k => v.throughput }
}

