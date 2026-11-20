# Kylin model checklist

1. Create a project.
2. Sync the Hive tables (`orders`, `customers`) into Kylin.
3. Create a data model that joins `orders.customer_id` to `customers.id`.
4. Choose `ordered_at` as the partition column and `country` as a dimension.
5. Add `SUM(total)` as a measure.
6. Build the cube and wait for the job to finish.
7. Run the aggregation query and inspect the execution plan in the web UI.
