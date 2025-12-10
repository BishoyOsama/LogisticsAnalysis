/* Dim_customer */
CREATE VIEW
  `your_project.olist_ecommerce.Dim_customers` AS
SELECT
  customer_id,
  customer_unique_id,
  customer_zip_code_prefix,
  customer_city,
  customer_state
FROM
  `your_project.olist_ecommerce.customers`


/* Dim_sellers */
CREATE VIEW
  `your_project.olist_ecommerce.Dim_sellers` AS
SELECT
  seller_id,
  seller_zip_code_prefix,
  seller_city,
  seller_state
FROM
  `your_project.olist_ecommerce.sellers`

/* Dim_products */
CREATE VIEW
  `your_project.olist_ecommerce.Dim_products` AS
SELECT
  product_id,
  product_category_name,
  product_photos_qty,
  product_weight_g,
  product_length_cm,
  product_height_cm,
  product_width_cm
FROM
  `your_project.olist_ecommerce.order_products`

/* Dim_orders */
CREATE VIEW
  `your_project.olist_ecommerce.Dim_orders` AS
SELECT
  order_id,
  order_status
FROM
  `your_project.olist_ecommerce.orders`

/* Fact_payments */
CREATE VIEW
  `your_project.olist_ecommerce.Fact_payments` AS
SELECT
  order_id,
  payment_sequential,
  payment_type,
  payment_installments, 
  payment_value
FROM
  `your_project.olist_ecommerce.order_payments`

/* Fact_order_line_items */
CREATE VIEW
  your_project.olist_ecommerce.Fact_order_line_items AS
SELECT
  ol.order_id,
  ol.order_item_id,
  ol.product_id,
  ol.seller_id,
  ol.shipping_limit_date,
  ol.price,
  ol.freight_value,
  o.customer_id,
  o.order_purchase_timestamp,
  o.order_approved_at,
  o.order_delivered_carrier_date,
  o.order_delivered_customer_date,
  o.order_estimated_delivery_date
FROM
  `your_project.olist_ecommerce.order_items` AS ol
LEFT JOIN
  `your_project.olist_ecommerce.orders` AS o
ON
  ol.order_id = o.order_id