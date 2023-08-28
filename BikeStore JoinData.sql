--joining column from multiple table

SELECT 
    ord.order_id,
    ord.order_date,
    CONCAT(cus.first_name, ' ', cus.last_name) AS customers_name,
    cus.city,
    cus.state,
    pro.product_name,
    cat.category_name,
    sto.store_name,
    CONCAT(sta.first_name, ' ', sta.last_name) AS sales_rep,
    bra.brand_name,
    SUM(ite.quantity) AS 'total_units',
    SUM(ite.quantity * ite.list_price) AS 'revenue'
    FROM sales.orders ord 
    JOIN sales.customers cus 
    ON ord.customer_id = cus.customer_id
    JOIN sales.order_items ite 
    ON ord.order_id = ite.order_id
    JOIN production.products pro 
    ON ite.product_id = pro.product_id
    JOIN production.categories cat 
    ON pro.category_id = cat.category_id
    JOIN sales.stores sto 
    ON ord.store_id = sto.store_id
    JOIN sales.staffs sta
    ON sto.store_id = sta.store_id
    JOIN production.brands bra 
    ON pro.brand_id = bra.brand_id
    GROUP BY
        ord.order_id,
        ord.order_date,
        CONCAT(cus.first_name, ' ', cus.last_name),
        cus.city,
        cus.state,
        pro.product_name,
        cat.category_name,
        sto.store_name,
        CONCAT(sta.first_name, ' ', sta.last_name),
        bra.brand_name

