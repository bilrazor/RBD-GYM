from django.shortcuts import render
from django.http import HttpResponse , JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import *
import json
from django.conf import settings
import uuid
from django.http import JsonResponse
from django.contrib.auth.hashers import check_password
import datetime
from django.utils import timezone
from .models import Tcategorias
from .models import Tproductos
from .models import Tcarrito
from django.views.decorators.csrf import csrf_exempt
from .models import Tpedidos
from datetime import datetime
# Create your views here.
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

	#Luego, obtiene el valor del encabezado "sessionToken" de la solicitud.
	token = request.headers.get('sessionToken')
	print(session_token)
	#Busca un objeto de la tabla Tpersona con el idpersona proporcionado en la URL.
	user = Tpersona.objects.get(session_token=token)
	#Verifica si el valor del encabezado "sessionToken" es válido comparándolo con el session_token almacenado en la tabla Tpersona.
	if not token or token != user.session_token:
		 return JsonResponse({"error": "Token de sesión inválido"}, status=401)
	jsonpeticion = json.loads(request.body)
	lista = Tcarrito.objects.all()
	pedidos = Tpedidos()
	for fila_sql in lista:
		pedidos.productosid = fila_sql.productosid
		pedidos.fecha = datetime.now()
		pedidos.cantidad = fila_sql.cantidad
		pedidos.idpersona = persona.idpersona
		pedidos.save()
	Tcarrito.objects.all().delete()

	return JsonResponse({"200":"OK"}, safe=False)

def ComprarPlan(request):
	#Luego, obtiene el valor del encabezado "sessionToken" de la solicitud.
	token = request.headers.get('sessionToken')
	print(session_token)
	#Busca un objeto de la tabla Tpersona con el idpersona proporcionado en la URL.
	user = Tpersona.objects.get(session_token=token)
	#Verifica si el valor del encabezado "sessionToken" es válido comparándolo con el session_token almacenado en la tabla Tpersona.
	if not token or token != user.session_token:
		return JsonResponse({"error": "Token de sesión inválido"}, status=401)
	if request.method == 'POST':
		return HttpResponse(status="200")
	else:
		return HttpResponse(status="401")

@csrf_exempt
def Cart(request):
	#Luego, obtiene el valor del encabezado "sessionToken" de la solicitud.
	token = request.headers.get('sessionToken')
	#Busca un objeto de la tabla Tpersona con el idpersona proporcionado en la URL.
	user = Tpersona.objects.get(session_token = token)
	#Verifica si el valor del encabezado "sessionToken" es válido comparándolo con el session_token almacenado en la tabla Tpersona
	if not token or token != user.session_token:
		return JsonResponse({"error": "Token de sesión inválido"}, status=401)
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
	#Luego, obtiene el valor del encabezado "sessionToken" de la solicitud.
	token = request.headers.get('sessionToken')
	print(session_token)
	#Busca un objeto de la tabla Tpersona con el idpersona proporcionado en la URL.
	user = Tpersona.objects.get(session_token=token)
	#Verifica si el valor del encabezado "sessionToken" es válido comparándolo con el session_token almacenado en la tabla Tpersona.
	if not token or token != user.session_token:
		return JsonResponse({"error": "Token de sesión inválido"}, status=401)
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

# Create your views here.
@csrf_exempt
def users(request):
    data = json.loads(request.body)
    if request.method == 'POST':
        nombre = data.get('nombre')
        correo = data.get('correo')
        password = data.get('password')
        passwordConfirm = data.get('passwordConfirm')

        # Validar que todos los campos esten completos
        if None in (nombre, correo, password, passwordConfirm):
            return JsonResponse({'error': 'Faltan parametros'}, status=400)
        # Validar que las contraseñas coincidan
        if password != passwordConfirm:
            return JsonResponse({'error': 'Las contraseñas no coinciden'}, status=400)
        
        # Validar que la contraseña tenga al menos 8 caracteres
        if len(password) < 8:
            return JsonResponse({'error': 'La contraseña debe tener al menos 8 caracteres'}, status=400)
        # Validar que el correo sea de Gmail o Hotmail
        
        if not correo.endswith('@gmail.com') and not correo.endswith('@hotmail.com'):
            return JsonResponse({'error': 'El correo debe ser de Gmail o Hotmail'}, status=400)
        
        # Validar que el usuario no exista
        if Tpersona.objects.filter(correo=correo).exists():
            return JsonResponse({'error': 'El usuario ya existe'}, status=409)

        # Crear el usuario
        user = Tpersona(nombre=nombre, correo=correo, password=password)
        user.set_password(password)
        user.save()

      
        return JsonResponse({'OK': 'El usuario registrado'}, status=201)

    return HttpResponse(status=405)

 
    
@csrf_exempt
def sessions(request):
    #Verificar si el método de la petición es POST. Si no lo es, no hace nadaç
    
    if request.method == 'POST':
        
        #Carga los datos enviados en el cuerpo de la petición como un diccionario de 
        # Python utilizando json.loads(request.body).
        data = json.loads(request.body)
        
        #Obtiene los valores de "correo" y "password" del diccionario.
        correo = data.get('correo')
        password = data.get('password')
        #Verifica si ambos valores existen. Si alguno de ellos falta, devuelve una 
        # respuesta JSON con un error indicando que faltan parámetros.
        if not all([correo, password]):
            return JsonResponse({'error': 'Parámetros faltantes: correo y password son requeridos'}, status=400)
        #Intenta obtener un usuario de la base de datos con el correo especificado. 
        # Si el usuario no existe, devuelve  una respuesta JSON con un error indicando 
        # que el usuario no fue encontrado.
        try:
            user = Tpersona.objects.get(correo=correo)
        except Tpersona.DoesNotExist:
            return JsonResponse({'error': 'Usuario no encontrado'}, status=401)
        #Verifica si la contraseña enviada coincide con la contraseña almacenada 
        # en la base de datos para ese usuario. Si no coincide, devuelve una respuesta JSON con un error indicando que la contraseña es incorrecta.
        if check_password(password, user.password):
            #Genera un token de sesión único y una fecha de expiración para ese token.
            session_token = uuid.uuid4()
                 
            Tpersona.objects.filter(idpersona=user.idpersona).update(session_token=str(session_token))
            #Verifica si la fecha actual es mayor que la fecha de expiración. Si es así, devuelve una 
            # respuesta JSON con un error indicando que el token ha caducado.
            
            #Devuelve una respuesta JSON con los datos del usuario, incluyendo el ID de la 
            # persona, el token de sesión y la fecha de expiración.
            data = {'idpersona': user.idpersona, 'sessionToken': str(session_token)}
          
        else:
            return JsonResponse({'error': 'Contraseña incorrecta'}, status=401)
    
    
    return JsonResponse(data, status=200)
    


@csrf_exempt

def profile(request,idpersona):
        
    # La función verifica si la solicitud es de tipo GET.
    if request.method == 'GET':
        #Luego, obtiene el valor del encabezado "sessionToken" de la solicitud.
        session_token = request.headers.get('sessionToken')
        print(session_token)
        #Busca un objeto de la tabla Tpersona con el idpersona proporcionado en la URL.
        user = Tpersona.objects.get(idpersona=idpersona)
        #Verifica si el valor del encabezado "sessionToken" es válido comparándolo con el session_token almacenado en la tabla Tpersona.
        if not session_token or session_token != user.session_token:
            return JsonResponse({"error": "Token de sesión inválido"}, status=401)
        #Si el token de sesión es válido, se crea un diccionario con los datos del usuario (dni, nombre, correo, dirección, teléfono y contraseña).
        data = {
            'dni': user.dni,
            'nombre':user.nombre,
            'correo': user.correo,
            'direccion': user.direccion,
            'telefono': user.telefono,
            'password':user.password
        }
        #Finalmente, se devuelve una respuesta JSON con los datos del usuario.
        return JsonResponse(data)

 
            
@csrf_exempt         
def datos(request, idpersona):

    if request.method == 'PUT':
        # Recupera los datos enviados en la solicitud
        data = json.loads(request.body.decode("utf-8"))
        # Recupera el usuario con idpersona
        try:
            user = Tpersona.objects.get(idpersona=idpersona)
        except Tpersona.DoesNotExist:
            return JsonResponse({'error': 'El usuario con idpersona {} no existe'.format(idpersona)}, status=400)
        # Actualiza los datos del usuario con los datos recibidos
 
        print(data.get("password"))
        print(data.get("nombre"))
        if data.get("nombre") != '':
            user.nombre = data.get("nombre")
        if data.get("correo") != '' :
            user.correo = data.get("correo") 
        if data.get("dni") != '' :
            user.dni = data.get("dni")
        if data.get("direccion") != '':    
            user.direccion = data.get("direccion")
        if data.get("telefono") != '':  
            user.telefono = data.get("telefono")
        if data.get("password") != '':  
            user.password = data.get("password")
            user.set_password(data.get("password"))
        print(user.nombre)
        print(user.correo)
        user.save()
        # Devuelve una respuesta vacía para indicar que la operación se realizó con éxito
        return JsonResponse({'mensaje': 'Perfil actualizado exitosamente'}, status=200)

 def obtener_listado_clases(request):
      lista = Tclases.objects.all()
      respuesta_final = []
      for fila_sql in lista:
          diccionario = {}
          diccionario['id'] = fila_sql.id
          diccionario['nombre'] = fila_sql.nombre
          diccionario['horarios'] = fila_sql.horarios
          diccionario['imagen'] = fila_sql.imagen
          respuesta_final.append(diccionario)
      return JsonResponse(respuesta_final, safe=False)

def obtener_listado_pedidos(request):
        if request.method == 'GET':
            session_token = request.headers.get('sessionToken')
        if session_token != 'sessionToken':
            return JsonResponse({'error': 'SessionToken inválido'}, status=401)
        
        # Obtener todos los pedidos de la base de datos
        pedidos = Tpedidos.objects.all()
        
        orders = []
        
        # Iterar sobre cada pedido y agregar la información necesaria al arreglo 'orders'
        for pedido in pedidos:
            items = []
            # Obtener todos los productos relacionados con el pedido actual
            productos = Tproductos.objects.filter(productosid=1)
            # Iterar sobre cada producto y agregar la información necesaria al arreglo 'items'
            for producto in productos:
                item = {
                    "name": producto.descripcion,
                    "quantity": producto.color,
                    "unitPrice": producto.descripcion,
                    "productId": producto.productosid
                }
                items.append(item)
            
            order = {
                "orderDate": pedido.fecha,
                "items": items
            }
            orders.append(order)
        
        return JsonResponse(orders, safe=False)

@csrf_exempt
def get_clases(request, id_clase):
    if request.method == 'GET':
        clase = Tclases.objects.get(id=id_clase)
        respuesta_final = {
            "id": clase.id,
            "nombre": clase.nombre,
            "imagen": clase.imagen,
            "horarios": clase.horarios
        }
    return JsonResponse(respuesta_final, safe=False)

def reserva_clases(request)
    elif request.method == 'POST':
        persisted_token = request.headers.get('SessionToken')
        if not persisted_token:
            return JsonResponse({'error': 'SessionToken not found'}, status=401)
            clase = Tclases.objects.get(id=id_clase)
            return JsonResponse({'error': 'Clase not found'}, status=400)
        # Validate SessionToken

        # Update clase data
        data = json.loads(request.body)
        clase.fecha = data.get('fecha')
        clase.horarios = data.get('horarios')
        clase.save()

        return JsonResponse({'status': 'success'})
	# Create your views here.

