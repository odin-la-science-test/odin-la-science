# Guide de déploiement Backend sur Render

## Étape 1 : Créer un compte Render
1. Allez sur https://render.com
2. Créez un compte (gratuit pour commencer)
3. Connectez votre compte GitHub

## Étape 2 : Créer un nouveau Web Service

### Via le Dashboard Render :
1. Cliquez sur "New +" → "Web Service"
2. Connectez votre repository GitHub : `odin-la-science-test/odin-la-science`
3. Render détectera automatiquement que c'est un projet Java

### Configuration du service :

**Informations de base :**
- **Name** : `ols-backend` (ou le nom de votre choix)
- **Region** : Choisissez la région la plus proche (Europe West pour la France)
- **Branch** : `master`
- **Root Directory** : `backend`

**Build & Deploy :**
- **Runtime** : `Java`
- **Build Command** : 
  ```bash
  mvn clean package -DskipTests
  ```
- **Start Command** : 
  ```bash
  java -jar target/*.jar
  ```

**Plan :**
- Choisissez "Free" pour commencer (le service s'endort après 15 min d'inactivité)
- Ou "Starter" ($7/mois) pour un service toujours actif

## Étape 3 : Variables d'environnement

Dans la section "Environment" de votre service Render, ajoutez :

### Variables obligatoires :
```
SPRING_PROFILES_ACTIVE=prod
PORT=8080
JWT_SECRET=votre-secret-jwt-super-securise-minimum-32-caracteres
CORS_ALLOWED_ORIGINS=https://votre-frontend-vercel.vercel.app
```

### Pour JWT_SECRET :
Générez une clé sécurisée (minimum 32 caractères) :
```bash
# Sur Windows PowerShell
-join ((65..90) + (97..122) + (48..57) | Get-Random -Count 32 | % {[char]$_})
```

## Étape 4 : Déployer

1. Cliquez sur "Create Web Service"
2. Render va :
   - Cloner votre repository
   - Installer Java 21 et Maven
   - Exécuter `mvn clean package`
   - Démarrer l'application avec `java -jar`
3. Le déploiement prend environ 5-10 minutes

## Étape 5 : Vérifier le déploiement

Une fois déployé, votre backend sera accessible à :
```
https://ols-backend.onrender.com
```

Testez les endpoints :
- Health check : `https://ols-backend.onrender.com/actuator/health`
- Swagger UI : `https://ols-backend.onrender.com/swagger-ui.html`
- API : `https://ols-backend.onrender.com/api/`

## Étape 6 : Configurer le Frontend

Mettez à jour l'URL de l'API dans votre frontend Vercel :

Dans Vercel, ajoutez la variable d'environnement :
```
VITE_API_URL=https://ols-backend.onrender.com
```

## Option : Ajouter une base de données PostgreSQL

Si vous voulez utiliser PostgreSQL au lieu de H2 :

1. Dans Render, créez une nouvelle "PostgreSQL Database"
2. Copiez l'URL de connexion (DATABASE_URL)
3. Ajoutez ces variables d'environnement au Web Service :
   ```
   DATABASE_URL=postgresql://...
   ```
4. Modifiez `application-prod.properties` pour utiliser PostgreSQL :
   ```properties
   spring.datasource.url=${DATABASE_URL}
   ```

## Déploiements automatiques

Render redéploiera automatiquement votre backend à chaque push sur la branche `master`.

## Logs et monitoring

- Consultez les logs en temps réel dans le dashboard Render
- Section "Logs" de votre service
- Section "Metrics" pour voir l'utilisation CPU/RAM

## Limites du plan gratuit

- Le service s'endort après 15 minutes d'inactivité
- Premier démarrage peut prendre 30-60 secondes
- 750 heures/mois gratuites
- Pour un service toujours actif : passez au plan Starter ($7/mois)

## Troubleshooting

### Le build échoue
- Vérifiez que Java 21 est bien configuré
- Vérifiez les logs de build dans Render

### L'application ne démarre pas
- Vérifiez les logs de démarrage
- Vérifiez que JWT_SECRET est bien défini
- Vérifiez que PORT=8080

### Erreurs CORS
- Vérifiez que CORS_ALLOWED_ORIGINS contient l'URL de votre frontend Vercel
- Format : `https://votre-app.vercel.app` (sans slash à la fin)

## Support

- Documentation Render : https://render.com/docs
- Support Render : https://render.com/support
