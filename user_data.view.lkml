view: user_data {
  derived_table: {
    sql: select id
    ,first_name
    ,last_name
    ,left(first_name,1) as first_name_first_letter
    ,right(first_name,1) as first_name_last_letter
    ,left(last_name,1) as last_name_first_letter
    ,right(last_name,1) as last_name_last_letter
    ,email
    ,split_part(email, '@',2) as email_domain
    ,age
    ,city
    ,state
    ,country
    ,zip
    ,latitude
    ,longitude
    ,gender

    from users;;
  }

  dimension: user_id {
    label: "User ID"
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: gender {
    label: "Gender"
    type:  string
    sql: ${TABLE}.gender ;;
  }

  dimension: age {
    label: "Customer Age"
    type: number
    sql: ${TABLE}.age ;;

  }

  dimension: first_name {
    label: "First Name"
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    label: "Last Name"
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: first_name_first_letter {
    label: "First Name's First Letter"
    type: string
    sql: ${TABLE}.first_name_first_letter ;;
  }

  dimension: first_name_last_letter {
    label: "First Name's Last Letter"
    type: string
    sql: ${TABLE}.first_name_last_letter ;;
  }

  dimension: last_name_first_letter {
    label: "Last Name's First Letter"
    type: string
    sql: ${TABLE}.last_name_first_letter ;;
  }

  dimension: last_name_last_letter {
    label: "Last Name's Last Letter"
    type: string
    sql: ${TABLE}.last_name_last_letter ;;
  }

  dimension: email {
    label: "Email Address"
    type:  string
    sql:  ${TABLE}.email ;;
  }

  dimension: email_domain {
    label: "Email Domain"
    type: string
    sql: ${TABLE}.email_domain ;;
  }


}


