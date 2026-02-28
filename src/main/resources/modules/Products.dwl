%dw 2.0

type Product = {
    id: Number,
    name: String,
    category: String,
    price: Number,
    stock: Number
}

fun toTypedProduct(product) =
    {
        id:      (product.id default "0") as Number,
        name:    product.name default "",
        category: product.category default "",
        price:   (product.price default "0") as Number,
        stock:   (product.stock default "0") as Number
    }

fun toTypedProducts(list) =
    list map (product) -> toTypedProduct(product)

fun filterByCategory(products, category) =
    if (category == null or category == "")
        products
    else
        products filter (p) ->
            upper(p.category) == upper(category)

fun idExists(products, id) =
    !isEmpty(products filter (p) -> p.id == id)
    
fun addProduct(products: Array<Product>, newProduct: Product): Array<Product> =
    products ++ [newProduct]
    
fun incrementStock(products, id) =
    products map (p) ->
        if (p.id == id)
            p ++ { stock: p.stock + 1 }
        else
            p