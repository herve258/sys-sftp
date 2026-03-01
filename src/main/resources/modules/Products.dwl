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
        name:    product.name default "" as String,
        category: product.category default "" as String,
        price:   (product.price default "0") as Number,
        stock:   (product.stock default "0") as Number
    }

fun toTypedProducts(list) =
    list map (product) -> toTypedProduct(product)

fun filterByCategory(products, category) =
    if (category == null or category == "")
        products
    else
        products filter (product) ->
            upper(product.category) == upper(category)

fun idExists(products, id) =
    !isEmpty(products filter (product) -> product.id == id)
    
fun addProduct(products: Array<Product>, newProduct: Product): Array<Product> =
    products ++ [newProduct]
    
fun incrementStock(products, id) =
    products map (product) ->
        if (product.id == id)
            product ++ { stock: product.stock + 1 }
        else
            product