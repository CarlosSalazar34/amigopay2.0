# AmigoPay 2.0

Una aplicación Flutter moderna para **repartir y gestionar gastos entre amigos** de forma fácil, rápida y equitativa.

## 📋 Descripción del Proyecto

AmigoPay es una aplicación diseñada para que grupos de amigos puedan compartir gastos comunes y mantener un registro de quién debe pagar a quién. Perfecto para viajes, cenas compartidas, gastos de casa o cualquier actividad grupal donde los gastos necesitan ser divididos equitativamente. El proyecto está construido con **Flutter**, asegurando compatibilidad multiplataforma (iOS, Android, Web, Windows, macOS, Linux).

## ✨ Características Implementadas

### ✅ Completadas

#### **1. Estructura Base de la Aplicación**
- ✓ Configuración inicial de proyecto Flutter
- ✓ Material Design 3 implementado con tema personalizado
- ✓ ColorScheme con colores corporativos (azules y morados)

#### **2. Navegación Principal**
- ✓ Bottom Navigation Bar con 3 secciones principales:
  - **Inicio**: Dashboard con balance general y bienvenida
  - **Historial**: Sección para ver historial de gastos compartidos (estructura lista)
  - **Mi Cartera**: Sección para ver tus deudas y quién te debe (estructura lista)
- ✓ Cambio dinámico entre vistas
- ✓ Indicadores visuales de sección activa

#### **3. Interfaz de Usuario (AppBar)**
- ✓ AppBar personalizado con:
  - Logo "AmigoPay" (azul, 27px, bold)
  - Botón de menú (icono hamburguesa)
  - Botón de notificaciones
  - Bordes redondeados en la base
  - Sombra profesional
  - Fondo blanco

#### **4. Página de Inicio (Homepage)**
- ✓ Saludo personalizado ("Bienvenido otra vez, Carlos Salazar")
- ✓ Resumen del balance total de gastos compartidos (AmountCard)
- ✓ Layout responsive con padding adecuado

#### **5. Componentes Reutilizables**
- ✓ **AmountCard**: Tarjeta de resumen de balance con:
  - Gradient azul-gris
  - Icono de billetera
  - Formato monetario ($) con total a pagar/recibir
  - Altura y padding optimizados
  - Bordes redondeados

### 🔄 En Progreso

- Funcionalidad del menú lateral (Drawer)
- Sistema de notificaciones
- Integración de datos reales del backend

### 📋 Por Implementar

- [ ] Crear nueva cuenta/usuario
- [ ] Autenticación y login
- [ ] Crear y unirse a grupos de amigos
- [ ] Registrar gastos compartidos
- [ ] Calcular quién debe a quién
- [ ] Marcar deudas como pagadas
- [ ] Historial detallado de gastos
- [ ] Sistema de notificaciones
- [ ] Conexión con API backend
- [ ] Configuración de perfil
- [ ] Dark mode
- [ ] Internacionalización (i18n)

## 📦 Estructura del Proyecto

```
amigopay2.0/
├── frontend/                    # Aplicación Flutter principal
│   ├── lib/
│   │   ├── main.dart           # Punto de entrada y configuración principal
│   │   ├── pages/
│   │   │   └── homepage.dart   # Página principal con dashboard
│   │   └── components/
│   │       └── amount_card.dart # Componente reutilizable de tarjeta balance
│   ├── android/                # Configuración Android
│   ├── ios/                    # Configuración iOS
│   ├── macos/                  # Configuración macOS
│   ├── linux/                  # Configuración Linux
│   ├── windows/                # Configuración Windows (si aplica)
│   ├── test/                   # Tests de la aplicación
│   └── pubspec.yaml           # Dependencias Flutter
├── LICENSE
└── README.md
```

## 🛠 Tecnologías y Dependencias

- **Flutter**: ^3.10.7
- **Material Design 3**
- **Dart**: Lenguaje base de Flutter
- **Cupertino Icons**: ^1.0.8 (iconografía iOS/Material)

## 🚀 Primeros Pasos

### Requisitos Previos

- **Flutter SDK**: Versión 3.10.7 o superior
- **Dart SDK**: Incluido con Flutter
- Emulador Android/iOS o dispositivo físico

### Instalación

1. **Clonar el repositorio**
   ```bash
   git clone <repository-url>
   cd amigopay2.0/frontend
   ```

2. **Obtener dependencias**
   ```bash
   flutter pub get
   ```

3. **Ejecutar la aplicación**
   ```bash
   flutter run
   ```

   O especificar plataforma:
   ```bash
   flutter run -d <device-id>
   ```

### Listar dispositivos disponibles
```bash
flutter devices
```

## 🎨 Temas y Colores

| Elemento | Color | Código |
|----------|-------|--------|
| Primario | Azul | `Colors.blue` |
| Secundario | Morado Oscuro | `Colors.deepPurple` |
| Accent Gradient | Azul-Gris | `#2399FA` a `#3E5275` |
| Fondo | Blanco | `Colors.white` |
| Texto Secundario | Gris | `Colors.grey` |
básico | ✅ Completado | 100% |
| Estructura Base Navigation | ✅ Completado | 100% |
| Componentes UI | ✅ En Progreso | 30% |
| Gestión de Grupos | ⏳ Pendiente | 0% |
| Sistema de Gastos Compartidos | ⏳ Pendiente | 0% |
| Cálculo de Deudas | ⏳ Pendiente | 
| Fase | Estado | Avance |
|------|--------|--------|
| Diseño UI/UX | ✅ Completado | 100% |
| Estructura Base | ✅ Completado | 100% |
| Componentes | ✅ En Progreso | 30% |
| Integración Backend | ⏳ Pendiente | 0% |
| Testing | ⏳ Pendiente | 0% | (valor de prueba)
- El balance inicial es $12,220.03 (valor de prueba para demo)
- Las secciones de Historial y Mi Cartera son placeholders sin contenido dinámico
- Drawer y notificaciones aún no tienen funcionalidad
- El sistema de autenticación aún no está implementado
- No hay conexión a backend en esta fase

- El nombre de usuario está hardcodeado actualmente como "Carlos Salazar"
- El balance inicial es $12,220.03 (valor de prueba)
- Las secciones de Historial y Mi Cartera son placeholders
- Drawer y notificaciones aún no tienen funcionalidad

## 📱 Plataformas Soportadas

- ✅ iOS
- ✅ Android
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 📞 Contacto y Contribuciones

Para reportar issues o contribuir al proyecto, por favor crea un issue o pull request.

---

**Última actualización**: Marzo 2026