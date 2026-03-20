# 🚀 Guide de déploiement rapide

## 📋 Résumé
- **Frontend** → Vercel (gratuit)
- **Backend** → Render (gratuit avec limitations)

---

## 1️⃣ BACKEND sur Render (5 minutes)

### Étape A : Créer le compte
1. Allez sur **https://render.com**
2. Cliquez sur "Get Started" → Connectez-vous avec GitHub
3. Autorisez Render à accéder à vos repositories

### Étape B : Créer le service
1. Dans le dashboard Render, cliquez sur **"New +"** → **"Web Service"**
2. Sélectionnez le repository : **`odin-la-science-test/odin-la-science`**
3. Cliquez sur **"Connect"**

### Étape C : Configuration
Remplissez les champs suivants :

| Champ | Valeur |
|-------|--------|
| **Name** | `ols-backend` |
| **Region** | Europe (Frankfurt) ou Europe (Paris) |
| **Branch** | `master` |
| **Root Directory** | `backend` |
| **Runtime** | Java |
| **Build Command** | `mvn clean package -DskipTests` |
| **Start Command** | `java -jar target/*.jar` |

### Étape D : Variables d'environnement
Cliquez sur **"Advanced"** → **"Add Environment Variable"**

Ajoutez ces 3 variables :

```
SPRING_PROFILES_ACTIVE = prod
PORT = 8080
JWT_SECRET = MonSecretSuperSecurise123456789012
```

⚠️ **Important** : Changez `JWT_SECRET` par une valeur unique et sécurisée (minimum 32 caractères)

### Étape E : Choisir le plan
- **Free** : Gratuit, le service s'endort après 15 min d'inactivité
- **Starter** : $7/mois, toujours actif

Cliquez sur **"Create Web Service"**

### Étape F : Attendre le déploiement
- Le déploiement prend 5-10 minutes
- Vous verrez les logs en temps réel
- Quand c'est terminé, vous verrez "Live" en vert

### Étape G : Tester
Votre backend sera accessible à : `https://ols-backend.onrender.com`

Testez dans votre navigateur :
- `https://ols-backend.onrender.com/actuator/health` → Devrait retourner `{"status":"UP"}`
- `https://ols-backend.onrender.com/swagger-ui.html` → Interface Swagger

**✅ Backend déployé !** Notez l'URL : `https://ols-backend.onrender.com`

---

## 2️⃣ FRONTEND sur Vercel (3 minutes)

### Étape A : Créer le compte
1. Allez sur **https://vercel.com**
2. Cliquez sur "Sign Up" → Connectez-vous avec GitHub

### Étape B : Importer le projet
1. Dans le dashboard Vercel, cliquez sur **"Add New..."** → **"Project"**
2. Sélectionnez le repository : **`odin-la-science-test/odin-la-science`**
3. Cliquez sur **"Import"**

### Étape C : Configuration
Remplissez les champs suivants :

| Champ | Valeur |
|-------|--------|
| **Project Name** | `ols-frontend` |
| **Framework Preset** | Vite |
| **Root Directory** | `frontend` |
| **Build Command** | `npm run build` |
| **Output Directory** | `dist` |

### Étape D : Variable d'environnement
Cliquez sur **"Environment Variables"**

Ajoutez cette variable :

```
VITE_API_URL = https://ols-backend.onrender.com
```

⚠️ Remplacez par l'URL de votre backend Render (sans slash à la fin)

### Étape E : Déployer
Cliquez sur **"Deploy"**

Le déploiement prend 2-3 minutes.

### Étape F : Tester
Votre frontend sera accessible à : `https://ols-frontend.vercel.app`

**✅ Frontend déployé !**

---

## 3️⃣ CONFIGURER CORS (Important!)

Le backend doit autoriser les requêtes du frontend.

### Dans Render :
1. Allez dans votre service backend
2. Cliquez sur **"Environment"**
3. Ajoutez une nouvelle variable :

```
CORS_ALLOWED_ORIGINS = https://ols-frontend.vercel.app
```

⚠️ Remplacez par l'URL exacte de votre frontend Vercel

4. Cliquez sur **"Save Changes"**
5. Le service va redémarrer automatiquement (1-2 minutes)

---

## 🎉 C'est terminé !

Votre application est maintenant en ligne :
- **Frontend** : https://ols-frontend.vercel.app
- **Backend** : https://ols-backend.onrender.com

### Identifiants de test :
- Email : `admin@example.com`
- Mot de passe : `1234`

---

## 🔄 Déploiements automatiques

À chaque fois que vous poussez du code sur GitHub (branche `master`) :
- Render redéploiera automatiquement le backend
- Vercel redéploiera automatiquement le frontend

---

## ⚠️ Limitations du plan gratuit Render

- Le backend s'endort après 15 minutes d'inactivité
- Le premier démarrage après inactivité prend 30-60 secondes
- 750 heures/mois gratuites

**Solution** : Passez au plan Starter ($7/mois) pour un service toujours actif

---

## 🆘 Problèmes courants

### Le backend ne répond pas
- Attendez 30-60 secondes (démarrage après inactivité)
- Vérifiez les logs dans Render

### Erreur CORS
- Vérifiez que `CORS_ALLOWED_ORIGINS` contient l'URL exacte du frontend
- Pas de slash à la fin de l'URL

### Le frontend ne se connecte pas au backend
- Vérifiez que `VITE_API_URL` pointe vers le bon backend
- Testez l'URL du backend dans votre navigateur

---

## 📚 Documentation complète

Pour plus de détails, consultez :
- [RENDER_DEPLOYMENT.md](./RENDER_DEPLOYMENT.md) - Guide détaillé Render
- [README.md](./README.md) - Documentation du projet
