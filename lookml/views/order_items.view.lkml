view: order_items {
  sql_table_name: public.order_items ;;

  dimension: order_item_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.order_item_id ;;
  }
  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }
  dimension: is_food_item {
    type: yesno
    sql: ${TABLE}.is_food_item ;;
  }

  measure: revenue {
    type: sum
    label: "Revenue"
    sql: ${TABLE}.product_price ;;
    value_format_name: usd
    description: "Revenue excluding tax: the sum of product prices of the items sold."
  }
  measure: gross_profit {
    type: number
    sql: ${revenue} - ${supply_cost} ;;
    value_format_name: usd
    description: "Revenue excluding tax minus the cost of supplies."
  }
  measure: supply_cost {
    type: sum
    sql: ${TABLE}.supply_cost ;;
    value_format_name: usd
  }
}
