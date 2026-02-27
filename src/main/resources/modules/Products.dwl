%dw 2.0

type Product = {
    id: Number,
    name: String,
    category: String,
    price: Number,
    stock: Number
}

fun toTypedProduct(p) =
    {
        id:      (p.id default "0") as Number,
        name:    p.name default "",
        category: p.category default "",
        price:   (p.price default "0") as Number,
        stock:   (p.stock default "0") as Number
    }

fun toTypedProducts(list) =
    list map (p) -> toTypedProduct(p)

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