# Banco de Datos de Empleos Comunitarios (CJDB)

> Documentación oficial del proyecto — plataforma web para la conexión directa entre empleadores locales y buscadores de empleo dentro de la comunidad.

---

## Descripción general

El Banco de Datos de Empleos Comunitarios (CJDB) es una iniciativa destinada a diseñar, desarrollar y desplegar una plataforma web que facilite la **publicación, búsqueda y postulación** a vacantes en el ámbito comunitario, con énfasis en accesibilidad, transparencia y eficiencia.

Este repositorio contiene los artefactos formales de ingeniería del proyecto (Acta de Constitución, Especificación de Requerimientos, diagramas UML, y otros), destinados a:

- Soportar el desarrollo y la validación técnica del MVP.
- Proveer material para auditoría de alcance y requerimientos.
- Servir de base para futuras iteraciones y ampliaciones del producto.

**Nota:** Los documentos y diagramas incluyen la precondición de **validación por correo electrónico** (RF-01) para acciones como publicar o postular; el actor `Sistema de Correo` y el caso de uso `Validar correo electrónico` están representados en los diagramas de casos de uso.

**Última actualización:** 3 de febrero de 2026

---

## Estructura de la documentación

Los documentos se presentan en el orden lógico del ciclo de vida del proyecto:

### 1️⃣ Gestión del Proyecto

- 📄 **[Acta de Constitución del Proyecto](01-chart.md)**  
  Documento base que define objetivos, alcance, cronograma, presupuesto, riesgos y criterios de éxito del proyecto.

### 2️⃣ Análisis de Requerimientos

- 📄 **[Especificación de Requerimientos de Software (ERS)](02-ers.md)**  
  Define de manera detallada los requerimientos funcionales, no funcionales, restricciones y estructura modular del sistema CJDB.

### 3️⃣ Modelado Funcional

- 📄 **[Diagramas de Casos de Uso](03-useCases.md)**  
  Representación gráfica de las interacciones entre los actores del sistema y las funcionalidades del MVP, utilizando UML y PlantUML.
**Diagramas renderizados:**

<div class="diagram-gallery">
  <a href="img/useCases/UC-01-general.svg" target="_blank" title="UC-01 — Vista general">
    <img src="img/useCases/UC-01-general.svg" alt="UC-01 — Vista general" class="img-thumbnail">
  </a>
  <a href="img/useCases/UC-02-searcher.svg" target="_blank" title="UC-02 — Buscador de Empleo">
    <img src="img/useCases/UC-02-searcher.svg" alt="UC-02 — Buscador de Empleo" class="img-thumbnail">
  </a>
  <a href="img/useCases/UC-03-employer.svg" target="_blank" title="UC-03 — Empleador">
    <img src="img/useCases/UC-03-employer.svg" alt="UC-03 — Empleador" class="img-thumbnail">
  </a>
  <a href="img/useCases/UC-04-admin.svg" target="_blank" title="UC-04 — Administrador">
    <img src="img/useCases/UC-04-admin.svg" alt="UC-04 — Administrador" class="img-thumbnail">
  </a>
</div>
---

## 🧭 Alcance del MVP

El alcance documentado corresponde estrictamente al **Producto Mínimo Viable (MVP)** definido en el Acta del Proyecto. Funcionalidades fuera de este alcance no forman parte de esta documentación y se consideran para fases posteriores.

---

## 🛠️ Tecnologías y Herramientas de Documentación

- **Markdown** – Documentación estructurada y versionable.
- **PlantUML** – Modelado UML (casos de uso, y futuros diagramas).
- **GitHub Pages** – Publicación de la documentación.
- **Git** – Control de versiones.

---

## 👤 Autor y Roles

- **Autor / Project Manager / Sponsor:** Gabriel Moreno  
- **Analista de Sistemas:** Edith Hernández

---

## 📎 Notas Finales

- Esta documentación se encuentra en evolución controlada.
- Cualquier modificación deberá mantener coherencia con el Acta de Constitución.
- Los diagramas PlantUML pueden visualizarse como código fuente o como diagramas renderizados según la configuración del entorno.

---

© 2026 – Proyecto CJDB