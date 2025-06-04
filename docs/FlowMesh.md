# FlowMesh Overview

FlowMesh is an API-only automation tool that features a node-based editor for building workflows. The repository hosts the Go microservices that implement the backend for FlowMesh.

## Core Features

- **GraphEditorService** - core editor functionality.
- **InputIntegrationService** - registry of ingestion nodes.
- **OutputIntegrationService** - registry of loading nodes.
- **ProcessModuleService** - registry of process nodes.

## Project Management Services

- **ProjectService** - administers projects.
- **IdentityService** - internal representation of known entities with integration to external identity providers (IDPs).
- **RelationshipService** - manages relationships between users, projects, and other entities.

This document serves as the initial outline of the system and its core services.

