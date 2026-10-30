view: locations {
  sql_table_name: public.locations ;;

  dimension: location_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.location_id ;;
  }
  dimension: location_name {
    type: string
    sql: ${TABLE}.location_name ;;
  }
  dimension: tax_rate {
    type: number
    sql: ${TABLE}.tax_rate ;;
  }

  measure: count {
    type: count
    label: "Locations"
  }
}
