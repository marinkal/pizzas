function something(){
	//alert("hello, everyone!!!")

		var x=window.localStorage.getItem("aaa")   
		 x=x*1+1
		  window.localStorage.setItem("aaa",x)   
		//alert(x)
}

$(function(){
	update_orders_input()
	update_orders_button()
})

function add_to_cart(id){
	key = 'product_'+id
	var x = window.localStorage.getItem(key);
	x = x * 1 + 1
	window.localStorage.setItem(key,x)
	//alert('items in your cart '+count_elements_in_cart())
	update_orders_input()
	update_orders_button()
}

function count_elements_in_cart()
{
	var total = 0
	for(var i=0;i<window.localStorage.length;i++){

		var key = window.localStorage.key(i);
		var value =window.localStorage.getItem(key)
		if (key.indexOf('product_')==0)total += value*1
	}
	return total
}


function cart_get_orders()
{
	var orders = '';
	for(var i=0;i<window.localStorage.length;i++){

		var key = window.localStorage.key(i);
		var value =window.localStorage.getItem(key)
		if (key.indexOf('product_')==0)orders = orders + key +'='+value+","
	}
	return orders
}

function update_orders_input()
{
	var orders=cart_get_orders()
	$("#orders_input").val(orders)
}

function update_orders_button(){
	text = 'Cart('+count_elements_in_cart()+')'
	$("#bcart").val(text)
}