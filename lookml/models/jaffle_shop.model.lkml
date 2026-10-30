connection: "jaffle_warehouse"
label: "Jaffle Shop"

include: "/views/*.view.lkml"

datagroup: daily_refresh {
  sql_trigger: SELECT CURRENT_DATE ;;
  max_cache_age: "24 hours"
}

explore: orders {
  label: "Orders"
  description: "Every order placed at a jaffle shop location, with the customer who placed it and its items."
  sql_always_where: ${orders.order_total} >= 0 ;;
  join: customers {
    type: left_outer
    relationship: many_to_one
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
  }
  join: order_items {
    type: left_outer
    relationship: one_to_many
    sql_on: ${orders.order_id} = ${order_items.order_id} ;;
  }
  join: locations {
    type: left_outer
    relationship: many_to_one
    sql_on: ${orders.location_id} = ${locations.location_id} ;;
  }
}

explore: customers {
  label: "Customers"
  description: "One row per customer who has placed at least one order, with lifetime spend."
}
