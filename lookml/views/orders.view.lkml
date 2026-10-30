view: orders {
  sql_table_name: public.orders ;;
  label: "Orders"

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }
  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }
  dimension: location_id {
    type: string
    sql: ${TABLE}.location_id ;;
  }
  dimension_group: ordered {
    type: time
    timeframes: [date, week, month, quarter, year]
    sql: ${TABLE}.ordered_at ;;
  }
  dimension: order_total {
    type: number
    value_format_name: usd
    sql: ${TABLE}.order_total ;;
    description: "Order amount in USD including tax."
  }
  dimension: is_food_order {
    type: yesno
    sql: ${TABLE}.is_food_order ;;
  }

  measure: count {
    type: count
    label: "Orders"
    description: "Number of orders."
  }
  measure: gross_revenue {
    type: sum
    label: "Gross Revenue"
    sql: ${order_total} ;;
    value_format_name: usd
    description: "Sum of order totals including tax. Use order_items.revenue for revenue excluding tax."
  }
  measure: tax_paid {
    type: sum
    sql: ${TABLE}.tax_paid ;;
    value_format_name: usd
    description: "Sum of tax collected on orders."
  }
  measure: average_order_value {
    type: average
    label: "Average Order Value"
    sql: ${order_total} ;;
    value_format_name: usd
    description: "Average order total including tax."
  }
  measure: food_orders {
    type: count
    filters: [is_food_order: "yes"]
    description: "Orders that contain at least one food item."
  }
}
