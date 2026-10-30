view: customers {
  sql_table_name: public.customers ;;
  label: "Customers"
  description: "A customer is a person who has placed at least one order. Customers without orders are not in this table."

  dimension: customer_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.customer_id ;;
  }
  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }
  dimension: customer_type {
    type: string
    sql: ${TABLE}.customer_type ;;
    description: "'new' for a customer with exactly one order, 'returning' for more than one."
  }
  dimension_group: first_ordered {
    type: time
    timeframes: [date, month, year]
    sql: ${TABLE}.first_ordered_at ;;
  }

  measure: count {
    type: count
    label: "Customers"
    description: "Distinct customers (people with at least one order)."
  }
  measure: returning_customers {
    type: count
    filters: [customer_type: "returning"]
    description: "Customers with more than one order."
  }
  measure: lifetime_spend {
    type: sum
    sql: ${TABLE}.lifetime_spend ;;
    value_format_name: usd
    description: "Total spend across all of a customer's orders, including tax."
  }
}
