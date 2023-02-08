from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from .models import Tcategorias
from .models import Tproductos
from .models import Tcarrito
from django.views.decorators.csrf import csrf_exempt
import json
import jwt
from .models import Tpersona
from .models import Tpedidos
from datetime import datetime
# Create your views here.

def secret():
	return "a"


@csrf_exempt
def getCategorias(request):
	lista = Tcategorias.objects.all()
	respuesta_final = []
	for fila_sql in lista:
		diccionario = {}
		diccionario['CategoriaId'] = fila_sql.categoriaid
		diccionario['Nombre'] = fila_sql.nombre
		respuesta_final.append(diccionario)
	return JsonResponse(respuesta_final,safe=False)

@csrf_exempt
def getProductosCategorias(request, id_categoria):
	cat = Tproductos.objects.filter(categoriaid = id_categoria)
	respuesta_final = []
	for fila_sql in cat:
		diccionario = {}
		diccionario['ProductosId'] = fila_sql.productosid
		diccionario['Nombre'] = fila_sql.nombre
		diccionario['Color'] = fila_sql.color
		diccionario['Precio'] = fila_sql.precio
		diccionario['Descripcion'] = fila_sql.descripcion
		diccionario['Imagen'] = fila_sql.imagen
		respuesta_final.append(diccionario)
	return JsonResponse(respuesta_final, safe=False)

@csrf_exempt
def getProducto(request, id_solicitado):
	lista = Tproductos.objects.get(productosid = id_solicitado)
	respuesta_final = {
		'ProductosId':lista.productosid,
		'Nombre': lista.nombre,
		'Color': lista.color,
		'Precio': lista.precio,
		'Descripcion': lista.descripcion,
		'Imagen': lista.imagen,
}
	return JsonResponse(respuesta_final, safe=False)

@csrf_exempt
def postCheckout(request):
#	secreto = secret()
#	SessionToken = request.META.get('SessionToken')
#	try:
#		payload = jwt.decode(SessionToken,secret,algorithms=['HS256'])
#	except jwt.exceptions.InvalidTokenError:
#		return HttpResponse(status=401)

	jsonpeticion = json.loads(request.body)
	lista = Tcarrito.objects.all()
	pedidos = Tpedidos()
	for fila_sql in lista:
		pedidos.productoid = fila_sql.productosid
		pedidos.fecha = datetime.now()
		pedidos.cantidad = fila_sql.cantidad
		pedidos.save()
	Tcarrito.objects.all().delete()

	return JsonResponse({"200":"OK"}, safe=False)

def ComprarPlan(request):
#	try:
#		secreto = secret()
#		SessionToken = request.META.get('SessionToken')
#		payload = jwt.decode(SessionToken,secret,algorithms=['HS256'])
#	except jwt.exceptions.InvalidTokenError:
#		return HttpResponse(status=401)
	if request.method == 'POST':
		return HttpResponse(status="200")
	else:
		return HttpResponse(status="401")

@csrf_exempt
def Cart(request):
#	try:
#		SessionToken = request.META.get('SessionToken')
#		secreto= secret()
#		payload = jwt.decode(SessionToken,secret,algorithms=['HS256'])
#	except jwt.exceptions.InvalidTokenError:
#			return HttpResponse(status=401)
	token = 1
	user = Tpersona.objects.get(idpersona = token)
	if request.method == 'POST':
		data = json.loads(request.body)
		lista = Tproductos.objects.get(productosid = data['ProductosId'])
		persona = Tpersona.objects.get(idpersona = token)
		carrito = Tcarrito()
		carrito.productosid =lista.productosid
		carrito.nombre = lista.nombre
		carrito.color = lista.color
		carrito.precio = lista.precio
		carrito.descripcion = lista.descripcion
		carrito.imagen = lista.imagen
		carrito.cantidad = 1
		carrito.idpersona = persona
		carrito.save()
		return JsonResponse({"200":"Ok"},safe=False)

	elif request.method == 'GET':
		carrito = Tcarrito.objects.all()
		respuesta_final = []
		for fila_sql in carrito:
			diccionario = {}
			diccionario['ProductosId'] = fila_sql.productosid
			diccionario['Nombre'] = fila_sql.nombre
			diccionario['Color'] = fila_sql.color
			diccionario['Precio'] = fila_sql.precio
			diccionario['Descripcion'] = fila_sql.descripcion
			diccionario['Imagen'] = fila_sql.imagen
			diccionario['Cantidad'] = fila_sql.cantidad
			diccionario['IdPersona'] = user.idpersona
			respuesta_final.append(diccionario)
		return JsonResponse(respuesta_final, safe=False)


@csrf_exempt
def destroyCart(request, id_carrito):
#	try:
#		SessionToken = request.META.get('SessionToken')
#		secreto = secret()
#		payload = jwt.decode(SessionToken,secret,algorith=['HS256'])
#	except jwt.exceptions.InvalidTokenError:
#		return HttpReponse(status=401)
	if request.method == 'DELETE':
		Tcarrito.objects.get(productosid = id_carrito).delete()
		return JsonResponse({"200":"OK"}, safe=False)

	elif request.method == 'PATCH':
		data = json.loads(request.body)
		carrito = Tcarrito.objects.get(productosid = id_carrito)
		carrito.cantidad = data.get('value')
		carrito.save()

		return JsonResponse({"200":"OK"}, safe=False)

def myFunc(e):
	return e['Precio']

@csrf_exempt
def SearchCategories(request, id_categoria):
	if request.method == 'GET':
		search= request.GET.get('search','')
		order = request.GET.get('sortby', 'name')
		tienda = Tproductos.objects.filter(nombre = search)
		respuesta_final = []
		for producto in tienda:
			diccionario = {}
			diccionario['ProductosId'] = producto.productosid
			diccionario['Nombre'] = producto.nombre
			diccionario['Color'] = producto.color
			diccionario['Precio'] = producto.precio
			diccionario['Descripcion'] = producto.descripcion
			diccionario['Imagen'] = producto.imagen
			respuesta_final.append(diccionario)

		if order == 'Precio':
			respuesta_final.sort(key = myFunc)
		elif order == 'Name':
			respuesta_final.sort()
		elif order == 'emaN':
			respuesta_final.sort(reverse=True)
	return JsonResponse(respuesta_final, safe=False)
