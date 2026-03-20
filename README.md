# Odin La Science - Monorepo

Ce monorepo contient le frontend et le backend de l'application Odin La Science.

## Structure du projet

```
odin-la-science-monorepo/
├── frontend/          # Application React + Vite
├── backend/           # API Spring Boot
├── package.json       # Scripts du monorepo
├── vercel.json        # Configuration Vercel (frontend uniquement)
└── README.md
```

## Déploiement

### Frontend (Vercel)
Le frontend peut être déployé sur Vercel :
1. Connectez votre repository GitHub à Vercel
2. Vercel détectera automatiquement la configuration dans `vercel.json`
3. Le frontend sera déployé automatiquement

**Configuration Vercel :**
- Root Directory : `frontend`
- Build Command : `npm run build`
- Output Directory : `dist`
- Variable d'environnement : `VITE_API_URL=https://votre-backend.onrender.com`

### Backend (Render)
⚠️ **Important** : Vercel ne supporte pas Java/Spring Boot. Le backend doit être déployé sur Render.

**Guide complet de déploiement : voir [RENDER_DEPLOYMENT.md](./RENDER_DEPLOYMENT.md)**

**Résumé rapide :**
1. Créez un compte sur https://render.com
2. Créez un nouveau "Web Service"
3. Connectez le repository GitHub
4. Configuration :
   - Root Directory : `backend`
   - Build Command : `mvn clean package -DskipTests`
   - Start Command : `java -jar target/*.jar`
   - Variables d'environnement :
     - `SPRING_PROFILES_ACTIVE=prod`
     - `JWT_SECRET=votre-secret-securise`
     - `CORS_ALLOWED_ORIGINS=https://votre-frontend.vercel.app`

**Alternatives à Render :**
- **Railway** : https://railway.app
- **Heroku** : https://heroku.com
- **AWS Elastic Beanstalk**
- **Google Cloud Run**

#### Configuration Backend pour le déploiement
Le backend utilise H2 en mémoire pour le développement. Pour la production, vous pouvez :
- Continuer avec H2 (déjà configuré dans `application-prod.properties`)
- Ou configurer PostgreSQL dans Render (voir guide de déploiement)

## Développement local

### Prérequis
- Node.js 18+
- Java 21
- Maven 3.8+

### Installation

```bash
# Installer les dépendances du frontend
npm run install:frontend

# Installer les dépendances du backend
npm run install:backend
```

### Lancer en développement

```bash
# Frontend (port 3000)
npm run dev:frontend

# Backend (port 8080)
npm run dev:backend
```

### Build

```bash
# Build frontend
npm run build:frontend

# Build backend
npm run build:backend
```

## Accès

- Frontend : http://localhost:3000
- Backend API : http://localhost:8080
- Swagger UI : http://localhost:8080/swagger-ui.html
- H2 Console : http://localhost:8080/h2-console

## Identifiants de test

Tous les comptes utilisent le mot de passe : `1234`

- Admin : `admin@example.com`
- Étudiant : `student@example.com`
- Professionnel : `pro@example.com`
- Invité : `guest@example.com`
