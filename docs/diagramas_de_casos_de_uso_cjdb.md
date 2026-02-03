# Diagramas de Casos de Uso (Use Case Diagrams)

Proyecto: **Banco de Datos de Empleos Comunitarios (CJDB)**  
Basado en: Acta de Constitución del Proyecto y ERS

---

## 1. Introducción

Este documento describe los **diagramas de casos de uso** del sistema CJDB, representando gráficamente las interacciones entre los **actores** y el **sistema**, con el objetivo de:

- Clarificar el alcance funcional del MVP.
- Servir como puente entre los requerimientos (ERS) y el diseño técnico.
- Facilitar la comprensión del sistema a partes no técnicas.

Los diagramas se definen utilizando **PlantUML**, permitiendo su versionado y mantenimiento mediante Markdown.

---

## 2. Actores del Sistema

De acuerdo con los documentos base, el sistema CJDB contempla los siguientes actores:

- **Visitante**: Usuario no autenticado que navega ofertas públicas.
- **Buscador de Empleo**: Usuario registrado que busca y postula a ofertas.
- **Empleador**: Usuario registrado que publica y gestiona ofertas laborales.
- **Administrador**: Rol con privilegios elevados para moderación y control.
- **Sistema de Correo** (Actor externo): Servicio utilizado para verificación y notificaciones.

---

## 3. Diagrama General de Casos de Uso

Este diagrama muestra una vista de alto nivel del sistema CJDB y sus principales interacciones.

```plantuml
@startuml
left to right direction

actor Visitante
actor "Buscador de Empleo" as Buscador
actor Empleador
actor Administrador
actor "Sistema de Correo" as Mail

rectangle CJDB {
  Visitante -- (Ver ofertas públicas)

  Buscador -- (Registrarse)
  Buscador -- (Iniciar sesión)
  Buscador -- (Buscar ofertas)
  Buscador -- (Postular a oferta)
  Buscador -- (Gestionar perfil)

  Empleador -- (Registrarse)
  Empleador -- (Iniciar sesión)
  Empleador -- (Publicar oferta)
  Empleador -- (Editar / Cerrar oferta)
  Empleador -- (Gestionar perfil empresarial)

  Administrador -- (Moderar ofertas)
  Administrador -- (Gestionar usuarios)
  Administrador -- (Suspender usuarios)
}

(Registrarse) ..> Mail : <<include>>
(Postular a oferta) ..> Mail : <<include>>

@enduml
```

---

## 4. Casos de Uso – Buscador de Empleo

### Descripción
El Buscador de Empleo es el actor central del flujo de búsqueda y postulación laboral.

### Casos principales

```plantuml
@startuml
actor "Buscador de Empleo" as Buscador

rectangle CJDB {
  Buscador -- (Registrarse)
  Buscador -- (Validar correo electrónico)
  Buscador -- (Iniciar sesión)
  Buscador -- (Crear / Editar perfil)
  Buscador -- (Subir CV en PDF)
  Buscador -- (Buscar ofertas)
  Buscador -- (Ver detalle de oferta)
  Buscador -- (Postular a oferta)
}

(Registrarse) --> (Validar correo electrónico)
(Postular a oferta) ..> (Ver detalle de oferta) : <<include>>

@enduml
```

---

## 5. Casos de Uso – Empleador

### Descripción
El Empleador interactúa con el sistema para gestionar su identidad corporativa y el ciclo de vida de las ofertas laborales.

```plantuml
@startuml
actor Empleador

rectangle CJDB {
  Empleador -- (Registrarse)
  Empleador -- (Validar correo electrónico)
  Empleador -- (Iniciar sesión)
  Empleador -- (Gestionar perfil empresarial)
  Empleador -- (Crear oferta laboral)
  Empleador -- (Editar oferta)
  Empleador -- (Cerrar oferta)
  Empleador -- (Ver postulaciones)
}

(Crear oferta laboral) ..> (Gestionar perfil empresarial) : <<include>>

@enduml
```

---

## 6. Casos de Uso – Administrador

### Descripción
El Administrador asegura el correcto funcionamiento, seguridad y legitimidad de la plataforma.

```plantuml
@startuml
actor Administrador

rectangle CJDB {
  Administrador -- (Iniciar sesión)
  Administrador -- (Revisar ofertas reportadas)
  Administrador -- (Eliminar oferta fraudulenta)
  Administrador -- (Suspender usuario)
  Administrador -- (Reactivar usuario)
  Administrador -- (Auditar actividad)
}

(Revisar ofertas reportadas) --> (Eliminar oferta fraudulenta)

@enduml
```

---

## 7. Relación con Requerimientos (Trazabilidad)

| Caso de Uso | Requerimiento ERS |
|------------|------------------|
| Registrarse | RF-01 |
| Gestionar perfil empleador | RF-02 |
| Gestionar perfil buscador | RF-03 |
| Postular a oferta | RF-04 |
| Moderación administrativa | RF-05 |

---

## 8. Notas Finales

- Estos diagramas representan el **estado del MVP**, no funcionalidades futuras.
- Cualquier caso de uso adicional deberá ser evaluado contra el Acta de Constitución para evitar *scope creep*.
- El uso de PlantUML permite mantener este documento sincronizado con la evolución del sistema.

---

**Fin del Documento**

