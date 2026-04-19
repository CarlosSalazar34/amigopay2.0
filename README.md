# 🚀 AmigoPay 2.0 - Gestión de Finanzas Colaborativas

---

### 🎓 Dedicatoria Especial
*Este proyecto está dedicado a mi profesor de programación, **Piero**. Aunque AmigoPay 2.0 pueda parecer un proyecto sencillo, para mí representa la culminación de **5 años de camino en el mundo de la programación**. Es el resultado de mucho aprendizaje y esfuerzo, y un paso firme hacia lo que pronto será su lanzamiento oficial en la **App Store** y **Play Store**.*

---

Una plataforma integral para **gestionar presupuestos, registrar gastos y dividir cuentas** de forma automática y transparente entre amigos. 

Este proyecto combina una aplicación móvil de alto rendimiento con una potente API en la nube.

---

## 🏗️ Arquitectura del Sistema

El ecosistema de AmigoPay está dividido en dos grandes bloques:

### 📱 Frontend (App Móvil)
- **Framework:** [Flutter](https://flutter.dev) (Material Design 3).
- **Diseño:** Estética premium con modo claro/oscuro, degradados y efectos de *glassmorphism*.
- **Estado:** Gestión de persistencia local con `SharedPreferences`.
- **Navegación:** Flujos de Onboarding, Registro y Dashboard principal.

### ☁️ Backend (API & Cloud)
- **Framework:** [FastAPI](https://fastapi.tiangolo.com) (Python).
- **Base de Datos:** PostgreSQL alojada en **Railway**.
- **Despliegue:** API alojada en **Vercel** ([Link de Producción](https://amigopay-backend.vercel.app)).
- **ORM:** SQLAlchemy para gestión eficiente de datos.

---

## ✨ Características Principales

### ✅ Implementadas y Funcionando
- **Onboarding Interactivo:** Carrusel de bienvenida para nuevos usuarios.
- **Registro Real:** Creación de cuenta sincronizada con el backend (Nombre/Email).
- **Gestión de Movimientos:** Registro dinámico de ingresos y gastos con cálculo de balance en tiempo real.
- **Sistema de Notificaciones:** Historial de actividad automático (cada movimiento genera una alerta).
- **Perfil de Usuario:** Gestión de datos personales y cierre de sesión.
- **Navegación Fluida:** Basada en Slivers para una experiencia de desplazamiento "native-feel".

---

## 🛠️ Tecnologías Utilizadas

| Componente | Tecnología |
|------------|------------|
| Frontend | Flutter / Dart |
| Estilos | Google Fonts (Outfit) / Animations Package |
| Backend | FastAPI / Uvicorn |
| DB Cloud | Railway (PostgreSQL) |
| Hosting API | Vercel |

---

## 🚀 Instalación y Desarrollo

### Requisitos
- Flutter SDK (Última versión estable)
- Python 3.10+ (Para el backend local)

### 1. Levantar el Backend (Local)
```bash
cd backend
pip install -r requirements.txt
python main.py
```

### 2. Ejecutar la App (Frontend)
```bash
cd frontend
flutter pub get
flutter run
```

### 3. Generar APK de Producción
Si quieres el instalador final listo para tu teléfono:
```bash
cd frontend
flutter build apk --release
```

---

## 📁 Estructura de Carpetas

```bash
amigopay2.0/
├── backend/               # Servidor Python FastAPI
│   ├── main.py           # Endpoints y lógica de API
│   ├── models.py         # Modelos de BD y Esquemas Pydantic
│   ├── database.py       # Configuración SQLALchemy (Railway)
│   └── vercel.json       # Configuración para despliegue en Vercel
├── frontend/              # App Flutter
│   ├── lib/
│   │   ├── components/   # Widgets reutilizables (UI)
│   │   ├── pages/        # Pantallas (Onboarding, Home, Profile, etc.)
│   │   └── services/     # Comunicación con la API
│   └── android/          # Configuración nativa con permisos de internet
└── README.md
```

---

## 📞 Contribuciones
Este proyecto es una evolución de AmigoPay 1.0, enfocada en la robustez del backend y una experiencia de usuario moderna. Si tienes ideas o mejoras, ¡eres bienvenido a colaborar!

---
**Última actualización:** Abril 2026