import 'package:gestion_inventario/src/item.dart';

var json = """[
  {
    "id": 1,
    "nombre": "Laptop Dell",
    "descripcion": "Laptop para uso empresarial",
    "numero_serie": "ABC123456",
    "estado": "Nuevo",
    "ubicacion": "Oficina",
    "imagen": "images/assets/01.jpg"
  },
  {
    "id": 2,
    "nombre": "Impresora HP",
    "descripcion": "Impresora láser a color",
    "numero_serie": "XYZ987654",
    "estado": "Usado",
    "ubicacion": "Bodega",
    "imagen": "images/assets/01.jpg"
  },
  {
    "id": 3,
    "nombre": "Teclado Logitech",
    "descripcion": "Teclado inalámbrico con retroiluminación",
    "numero_serie": "KBD123456",
    "estado": "Nuevo",
    "ubicacion": "Oficina",
    "imagen": "images/assets/01.jpg"
  },
  {
    "id": 4,
    "nombre": "Teclado Logitech",
    "descripcion": "Teclado inalámbrico con retroiluminación",
    "numero_serie": "KBD123457",
    "estado": "Nuevo",
    "ubicacion": "Oficina",
    "imagen": "images/assets/01.jpg"
  },
  {
    "id": 5,
    "nombre": "Impresora Epson",
    "descripcion": "Impresora multifunción a color",
    "numero_serie": "PRN456789",
    "estado": "Nuevo",
    "ubicacion": "Bodega",
    "imagen": "images/assets/01.jpg"
  },
  {
    "id": 6,
    "nombre": "Mesa de Escritorio",
    "descripcion": "Mesa de madera con cajones",
    "numero_serie": "DSK789012",
    "estado": "Usado",
    "ubicacion": "Oficina",
    "imagen": "images/assets/01.jpg"
  },
  {
    "id": 7,
    "nombre": "Teléfono VoIP",
    "descripcion": "Teléfono IP para conferencias",
    "numero_serie": "PHN345678",
    "estado": "Nuevo",
    "ubicacion": "Sala de conferencias",
    "imagen": "images/assets/01.jpg"
  }
]""";
final inventario = itemInventarioFromJson(json);
