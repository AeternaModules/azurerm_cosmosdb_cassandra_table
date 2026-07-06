output "cosmosdb_cassandra_tables" {
  description = "All cosmosdb_cassandra_table resources"
  value       = azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables
}
output "cosmosdb_cassandra_tables_analytical_storage_ttl" {
  description = "List of analytical_storage_ttl values across all cosmosdb_cassandra_tables"
  value       = [for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : v.analytical_storage_ttl]
}
output "cosmosdb_cassandra_tables_autoscale_settings" {
  description = "List of autoscale_settings values across all cosmosdb_cassandra_tables"
  value       = [for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : v.autoscale_settings]
}
output "cosmosdb_cassandra_tables_cassandra_keyspace_id" {
  description = "List of cassandra_keyspace_id values across all cosmosdb_cassandra_tables"
  value       = [for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : v.cassandra_keyspace_id]
}
output "cosmosdb_cassandra_tables_default_ttl" {
  description = "List of default_ttl values across all cosmosdb_cassandra_tables"
  value       = [for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : v.default_ttl]
}
output "cosmosdb_cassandra_tables_name" {
  description = "List of name values across all cosmosdb_cassandra_tables"
  value       = [for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : v.name]
}
output "cosmosdb_cassandra_tables_schema" {
  description = "List of schema values across all cosmosdb_cassandra_tables"
  value       = [for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : v.schema]
}
output "cosmosdb_cassandra_tables_throughput" {
  description = "List of throughput values across all cosmosdb_cassandra_tables"
  value       = [for k, v in azurerm_cosmosdb_cassandra_table.cosmosdb_cassandra_tables : v.throughput]
}

