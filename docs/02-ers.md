# Especificación de Requerimientos de Software (ERS)

Proyecto: **Banco de Datos de Empleos Comunitarios (CJDB)**

---

## Control del Documento

- **ID del Proyecto:** CJDB-0312-0305-2526
- **Versión:** 1.2 (Revisión Detallada)
- **Fecha de Emisión:** 04 de febrero de 2026
- **Preparado por:** Analista de Sistemas – Edith Hernández
- **Dirigido a:** Raven Studio (Desarrollo) y Gabriel Moreno (PM / Sponsor)

---

## 1. Introducción

Esta Especificación de Requerimientos de Software (ERS) define de manera exhaustiva los **requerimientos funcionales, no funcionales y restricciones técnicas** necesarias para el desarrollo del **Banco de Datos de Empleos Comunitarios (CJDB)**.

El documento establece un contrato técnico entre las partes interesadas y el equipo de desarrollo, sirviendo como base para:

- Diseño del sistema.
- Planificación de tareas de desarrollo.
- Validación funcional.
- Pruebas de aceptación del usuario (UAT).

El CJDB busca mitigar la desconexión laboral existente en la comunidad mediante una plataforma web centralizada que permita la interacción directa entre empleadores locales y buscadores de empleo.

---

### 1.1 Propósito

El propósito de este documento es definir, con un nivel técnico detallado, el comportamiento esperado del sistema CJDB, incluyendo:

- Funcionalidades visibles al usuario.
- Restricciones operativas.
- Atributos de calidad del sistema.
- Límites explícitos del alcance del MVP.

Este documento **no describe implementaciones técnicas específicas**, sino los resultados y comportamientos que el sistema debe cumplir.

---

### 1.2 Alcance

El alcance del sistema CJDB está estrictamente delimitado por el **Acta de Constitución del Proyecto**, con el objetivo explícito de prevenir desviaciones de alcance (*scope creep*).

#### El sistema INCLUYE (In-Scope):

- **Gestión de Usuarios:** Registro, validación de identidad básica y gestión de perfiles para dos roles diferenciados:
  - Empleadores
  - Buscadores de Empleo

- **Mercado Laboral Digital:**
  - Publicación de ofertas laborales.
  - Búsqueda filtrada de vacantes.
  - Postulación digital directa.

- **Administración y Moderación:**
  - Panel de control administrativo.
  - Herramientas de moderación de contenido.
  - Gestión básica de seguridad.

#### El sistema EXCLUYE (Out-of-Scope):

- Procesamiento de pagos, nóminas o compensaciones.
- Verificación legal, judicial o policial de antecedentes.
- Servicios auxiliares (redacción de CV, capacitaciones, intermediación laboral).
- Desarrollo de aplicaciones nativas (iOS / Android). El alcance se limita a **Web / PWA**.

---

## 2. Descripción General

Esta sección describe el contexto operativo del sistema, su rol dentro del entorno tecnológico existente y las funciones de alto nivel que debe desempeñar.

---

### 2.1 Perspectiva del Producto

El CJDB se concibe como una **solución SaaS (Software as a Service)** independiente, diseñada bajo una arquitectura **serverless** para minimizar costos operativos y facilitar la escalabilidad.

Dado el perfil demográfico objetivo, el sistema adoptará una filosofía **"Mobile-First"**, priorizando la experiencia en dispositivos móviles sin sacrificar funcionalidad en escritorio.

El acceso a la plataforma se realizará exclusivamente a través de navegadores web modernos.

---

### 2.2 Funciones del Sistema

A nivel macro, el sistema CJDB deberá soportar las siguientes funciones críticas:

- **F-01 – Gestión de Identidad y Acceso:**
  - Registro seguro de usuarios.
  - Recuperación de credenciales.
  - Validación de cuentas mediante correo electrónico.

- **F-02 – Bolsa de Trabajo Digital:**
  - Creación, edición, republicación y cierre de ofertas laborales por parte de empleadores.
  - Persistencia de estados de ofertas (Borrador, Activa, Cerrada).

- **F-03 – Motor de Búsqueda:**
  - Filtrado de ofertas por categoría, tipo de contrato y rango salarial.

- **F-04 – Postulación Directa:**
  - Envío de candidaturas vinculando perfil y CV del buscador.
  - Notificaciones automáticas a las partes involucradas.

- **F-05 – Moderación y Control:**
  - Auditoría de contenido publicado.
  - Bloqueo de usuarios malintencionados.
  - Eliminación de ofertas fraudulentas.

---

## 3. Requerimientos Específicos

Esta sección detalla los requerimientos funcionales y no funcionales con un nivel de granularidad suficiente para el diseño, desarrollo y validación del sistema.

---

### 3.1 Requerimientos Funcionales (RF)

Los requerimientos funcionales describen **qué debe hacer el sistema**, incluyendo entradas, procesos y salidas esperadas.

---

#### RF-01 – Registro y Validación de Usuarios

- El sistema debe permitir el **autoregistro** de usuarios.
- El registro requerirá una dirección de correo electrónico válida.
- El sistema enviará un **token de verificación** al correo registrado.
- Hasta validar el correo, el usuario no podrá:
  - Publicar ofertas.
  - Postular a ofertas.

**Nota técnica (Precondición):** La validación del correo mediante el token es obligatoria para ejecutar acciones como **publicar ofertas** o **postular a ofertas** (RF-01). El sistema deberá registrar de forma auditable el estado y la fecha de validación del correo, y enviar notificaciones por correo en eventos relevantes (p. ej. confirmación de cuenta, notificación de postulación recibida). Estos comportamientos están modelados en los diagramas de casos de uso mediante el caso `Validar correo electrónico` y el actor `Sistema de Correo`.

---

#### RF-02 – Gestión de Perfil de Empleador

- El sistema debe permitir a los empleadores:
  - Crear y editar su identidad corporativa.
  - Definir nombre comercial, logo, descripción y sitio web.
- El empleador podrá gestionar el ciclo de vida de sus ofertas:
  - Borrador
  - Activa
  - Cerrada

---

#### RF-03 – Gestión de Perfil de Buscador

- El sistema debe permitir a los buscadores:
  - Crear y actualizar un perfil profesional digital.
  - Cargar un archivo de Currículum Vitae.
- Restricciones del archivo CV:
  - Formato obligatorio: **PDF**.
  - Tamaño máximo permitido: **5 MB**.

---

#### RF-04 – Motor de Postulación Unificada

- El sistema debe permitir que un buscador postule a una oferta con **un solo clic**.
- El sistema debe validar internamente:
  - Que el usuario esté autenticado.
  - Que no exista una postulación previa del mismo usuario a la misma oferta.

---

#### RF-05 – Moderación Administrativa

- El sistema debe proveer una vista exclusiva para administradores.
- Desde esta vista, el administrador podrá:
  - Listar usuarios y ofertas reportadas.
  - Ejecutar acciones como:
    - Suspender usuario.
    - Dar de baja una oferta.

---

### 3.2 Requerimientos No Funcionales (RNF)

Los RNF definen **atributos de calidad**, restricciones técnicas y estándares mínimos de operación.

---

#### RNF-01 – Resiliencia y Disponibilidad

- El sistema deberá diseñarse para operar continuamente.
- Deberá garantizar un **SLA de disponibilidad del 99.5% mensual**.
- Se deberán minimizar tiempos de inactividad durante horarios laborales.

---

#### RNF-02 – Ciberseguridad y Protección de Datos

- Toda comunicación cliente-servidor deberá:
  - Estar cifrada mediante **HTTPS (TLS 1.2 o superior)**.
- Las contraseñas de usuario deberán almacenarse utilizando:
  - Algoritmos de hash robustos (ej.: bcrypt o Argon2).

---

#### RNF-03 – Usabilidad y Adaptabilidad

- La interfaz gráfica deberá ser **completamente responsiva**.
- El sistema deberá ser funcional en pantallas desde **320 px de ancho**.
- No deberá existir scroll horizontal forzado.

---

#### RNF-04 – Rendimiento

- El tiempo de carga inicial (**First Contentful Paint**) no deberá exceder:
  - **2 segundos** en conexiones móviles 4G estándar.

---

## 4. Estructura de Módulos (Diseño del Sistema)

Esta sección organiza los requerimientos en módulos lógicos para facilitar la arquitectura y asignación de tareas.

---

### 4.1 Módulo de Autenticación (Auth)

- Gestión de sesiones y seguridad.
- Formularios de login y registro.
- Lógica de tokens JWT o sesiones equivalentes.
- Recuperación de contraseña.
- Verificación de correo electrónico.

---

### 4.2 Módulo de Gestión de Ofertas (Jobs Management)

- Funcionalidad CRUD completa de ofertas laborales.
- Validación de formularios de empleo.
- Gestión de estados de vacantes.

---

### 4.3 Módulo de Postulación y Búsqueda (Core / Public)

- Buscador con filtros dinámicos.
- Vista de detalle de oferta.
- Carga y asociación de CV.
- Lógica de asociación Usuario–Oferta.

---

### 4.4 Módulo de Administración (Back-Office)

- Panel privado para roles con permisos elevados.
- Gestión de usuarios.
- Auditoría de contenido.
- Métricas básicas de uso.

---

## 5. Restricciones y Suposiciones

### 5.1 Restricciones

- **Restricción Presupuestaria:**
  - El costo total de desarrollo e infraestructura inicial está limitado a **$10,000 USD**.
  - Se prohíbe el uso de licencias empresariales con costos recurrentes elevados.

- **Restricción de Formatos:**
  - La carga de documentos se limita exclusivamente a archivos **PDF** para mitigar riesgos de malware y almacenamiento.

---

### 5.2 Suposiciones

- Los usuarios contarán con acceso a navegadores web modernos.
- Los servicios de correo electrónico externos estarán disponibles y operativos.
- La infraestructura cloud seleccionada cumplirá con los SLA definidos.

---

**Fin del Documento**

