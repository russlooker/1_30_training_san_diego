- dashboard: 130_training
  title: 1/30 Training
  layout: newspaper
  elements:
  - title: Percent of Rev from those under 21
    name: Percent of Rev from those under 21
    model: 1_30_san_diego
    explore: order_items
    type: single_value
    fields:
    - order_items.total_revenue
    - order_items.total_revenue_from_under_21
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: percent_under_21_by_rev
      label: Percent Under 21 by Rev
      expression: "${order_items.total_revenue_from_under_21}/${order_items.total_revenue}"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - order_items.total_revenue
    - order_items.total_revenue_from_under_21
    single_value_title: Percent of Rev from <21
    note_state: expanded
    note_display: below
    note_text: This is not filtered at a User Level
    row: 0
    col: 8
    width: 8
    height: 7
  - title: User Detail
    name: User Detail
    model: 1_30_san_diego
    explore: order_items
    type: looker_single_record
    fields:
    - users.first_name
    - users.last_name
    - users.age
    - users.can_drink
    - users.state
    - users.traffic_source
    sorts:
    - users.first_name
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      User ID: order_items.user_id
    row: 3
    col: 0
    width: 8
    height: 4
  - name: tile1
    type: text
    title_text: <img src="https://vignette.wikia.nocookie.net/uncyclopedia/images/9/94/Hp_logo.jpg"/>
    row: 0
    col: 16
    width: 8
    height: 7
  - title: New Tile
    name: New Tile
    model: 1_30_san_diego
    explore: order_items
    type: single_value
    fields:
    - order_items.hello
    sorts:
    - order_items.hello
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    row: 0
    col: 0
    width: 8
    height: 3
  filters:
  - name: User ID
    title: User ID
    type: field_filter
    default_value: ''
    model: 1_30_san_diego
    explore: order_items
    field: order_items.user_id
    listens_to_filters: []
    allow_multiple_values: true
    required: false
