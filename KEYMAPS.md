# 🎹 GUIDE DES RACCOURCIS CLAVIER - NEOVIM

*Généré le 15 octobre 2025 - Configuration moderne et optimisée*

---

## 📑 LÉGENDE

| Symbole | Signification |
|---------|---------------|
| `<leader>` | Touche leader = `<Space>` |
| `<M-*>` | Meta/Alt + touche |
| `<C-*>` | Ctrl + touche |
| `<S-*>` | Shift + touche |
| `<A-*>` | Alt + touche |

---

## 🚀 RACCOURCIS GÉNÉRAUX

### 💾 **FICHIERS & SAUVEGARDE**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<leader>w` | Normal | Sauvegarder le fichier |
| `<leader>q` | Normal | Quitter |
| `<leader>Q` | Normal | Forcer quitter tout |
| `<C-s>` | Normal/Insert/Visual | Sauvegarder rapidement |

### 🔄 **UTILITAIRES SYSTÈME**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<leader>R` | Normal | Recharger la configuration |
| `<leader>L` | Normal | Ouvrir Lazy (gestionnaire plugins) |
| `<leader>nh` | Normal | Effacer surlignage recherche |

---

## 🪟 NAVIGATION FENÊTRES

### 🧭 **DÉPLACEMENT ENTRE FENÊTRES**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<C-h>` | Normal/Terminal | Aller à la fenêtre de gauche |
| `<C-j>` | Normal/Terminal | Aller à la fenêtre du bas |
| `<C-k>` | Normal/Terminal | Aller à la fenêtre du haut |
| `<C-l>` | Normal/Terminal | Aller à la fenêtre de droite |

### 📏 **REDIMENSIONNEMENT FENÊTRES**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<C-Up>` | Normal | Augmenter hauteur (+2) |
| `<C-Down>` | Normal | Diminuer hauteur (-2) |
| `<C-Left>` | Normal | Diminuer largeur (-2) |
| `<C-Right>` | Normal | Augmenter largeur (+2) |

---

## ✏️ ÉDITION DE TEXTE

### 🔄 **DÉPLACEMENT DE LIGNES**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<A-j>` | Normal/Visual | Déplacer ligne(s) vers le bas |
| `<A-k>` | Normal/Visual | Déplacer ligne(s) vers le haut |

### 📐 **INDENTATION**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<` | Visual | Indenter vers la gauche |
| `>` | Visual | Indenter vers la droite |

### 🎯 **SÉLECTION**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<leader>sa` | Normal | Sélectionner tout le fichier |

---

## 🧭 NAVIGATION DANS LE TEXTE

### 📖 **DÉFILEMENT OPTIMISÉ**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<C-d>` | Normal | Demi-page vers le bas (centré) |
| `<C-u>` | Normal | Demi-page vers le haut (centré) |
| `J` | Normal | Joindre lignes (optimisé) |

### 🔍 **RECHERCHE AMÉLIORÉE**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `n` | Normal | Résultat suivant (centré) |
| `N` | Normal | Résultat précédent (centré) |

---

## 📋 PRESSE-PAPIER & CHEMINS

### 📁 **COPIE DE CHEMINS**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<leader>pp` | Normal | Copier chemin relatif |
| `<leader>pP` | Normal | Copier chemin absolu |
| `<leader>pf` | Normal | Copier nom du fichier |
| `<leader>pd` | Normal | Copier répertoire parent |

---

## 🎮 MODES D'INSERTION & COMMANDES

### ⌨️ **SORTIE MODE INSERTION**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `jk` | Insert | Retour au mode normal |
| `kj` | Insert | Retour au mode normal |

### 📝 **NAVIGATION LIGNE DE COMMANDE**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<C-j>` | Command | Commande suivante |
| `<C-k>` | Command | Commande précédente |

---

## 🖥️ TERMINAL INTÉGRÉ

### 🔄 **CONTRÔLE TERMINAL**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<ESC>` | Terminal | Sortir du mode terminal |
| `<C-@>` | Normal/Terminal | Toggle floaterm |
| `<C-n>` | Terminal | Nouveau terminal |

### 🪟 **NAVIGATION DEPUIS TERMINAL**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<C-h/j/k/l>` | Terminal | Navigation entre fenêtres |

---

## 🤖 INTELLIGENCE ARTIFICIELLE (COPILOT)

### ✨ **SUGGESTIONS COPILOT**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<M-l>` | Insert | Accepter suggestion complète |
| `<M-j>` | Insert | Accepter mot suivant |
| `<M-k>` | Insert | Accepter ligne complète |
| `<M-]>` | Insert | Suggestion suivante |
| `<M-[>` | Insert | Suggestion précédente |
| `<C-]>` | Insert | Ignorer suggestion |

### 🎛️ **CONTRÔLE COPILOT**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<leader>cp` | Normal | Ouvrir panel Copilot |
| `<leader>cc` | Normal | Toggle Copilot on/off |  
| `<leader>cs` | Normal | Status Copilot |

---

## 🔍 RECHERCHE & NAVIGATION (TELESCOPE)

### 🗂️ **RECHERCHE DE FICHIERS**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<leader>ff` | Normal | Trouver fichiers |
| `<leader>fg` | Normal | Recherche globale (grep) |
| `<leader>fb` | Normal | Liste des buffers |
| `<leader>fr` | Normal | Fichiers récents |
| `<leader>fh` | Normal | Tags d'aide |
| `<leader>fc` | Normal | Commandes disponibles |
| `<leader>fs` | Normal | Rechercher mot sous curseur |

---

## 🗂️ EXPLORATEUR DE FICHIERS (NEO-TREE)

### 🌳 **NAVIGATION ARBORESCENTE**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<leader>ee` | Normal | Toggle explorateur |
| `<leader>ef` | Normal | Focus sur explorateur |

---

## 🌿 CONTRÔLE DE VERSION (GIT)

### 📝 **HUNKS (MODIFICATIONS)**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `]c` | Normal | Hunk suivant |
| `[c` | Normal | Hunk précédent |
| `<leader>hs` | Normal/Visual | Stage hunk |
| `<leader>hr` | Normal/Visual | Reset hunk |
| `<leader>hS` | Normal | Stage buffer complet |
| `<leader>hu` | Normal | Undo stage hunk |
| `<leader>hR` | Normal | Reset buffer complet |

### 👀 **VISUALISATION**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<leader>hp` | Normal | Prévisualiser hunk |
| `<leader>hb` | Normal | Blame ligne complète |
| `<leader>tb` | Normal | Toggle blame ligne |
| `<leader>hd` | Normal | Diff this |
| `<leader>hD` | Normal | Diff this ~ |
| `<leader>td` | Normal | Toggle deleted |

---

## 📦 GESTION DES BUFFERS

### 🔄 **NAVIGATION BUFFERS**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<Tab>` | Normal | Buffer suivant |
| `<S-Tab>` | Normal | Buffer précédent |

### ❌ **FERMETURE BUFFERS**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<leader>bd` | Normal | Supprimer buffer |
| `<leader>bD` | Normal | Forcer suppression buffer |
| `<leader>bA` | Normal | Fermer tous les autres buffers |

---

## 🩺 DIAGNOSTICS & LSP

### 🔍 **NAVIGATION DIAGNOSTICS**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<leader>sd` | Normal | Afficher diagnostics ligne |
| `[d` | Normal | Diagnostic précédent |
| `]d` | Normal | Diagnostic suivant |

---

## 🛠️ OUTILS SPÉCIALISÉS

### 📋 **TROUBLE (DIAGNOSTICS)**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<leader>xx` | Normal | Toggle diagnostics |
| `<leader>xX` | Normal | Buffer diagnostics |

### 🗺️ **MINIMAP**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<leader>mm` | Normal | Toggle minimap |

### 🔧 **MEGATOGGLER**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<leader>m` | Normal | Menu des toggles |

### 📖 **MARKDOWN (PREVIEW)**
*Disponible uniquement dans les fichiers Markdown*
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<leader>mp` | Normal | Toggle preview |
| `<leader>ms` | Normal | Démarrer preview |
| `<leader>me` | Normal | Arrêter preview |

### 📦 **STORE**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<leader>st` | Normal | Ouvrir Store |

---

## 🎛️ TERMINAL FLOTTANT (FLOATERM)

### 🖥️ **GESTION TERMINAUX**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<leader>tf` | Normal | Toggle terminal |
| `<leader>tn` | Normal | Nouveau terminal |
| `<leader>tk` | Normal | Tuer terminal |
| `<leader>tp` | Normal | Terminal précédent |
| `<leader>tN` | Normal | Terminal suivant |

### ⚡ **RACCOURCIS RAPIDES**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<C-@>` | Normal/Terminal | Toggle terminal |
| `<C-é>` | Terminal | Terminal suivant |
| `<C-&>` | Terminal | Terminal précédent |

### 📜 **DÉFILEMENT TERMINAL**
| Raccourci | Mode | Action |
|-----------|------|--------|
| `<PageUp/Down>` | Terminal | Page Up/Down |
| `<S-Up/Down>` | Terminal | Scroll haut/bas |

---

## 💡 CONSEILS D'UTILISATION

### 🎯 **RACCOURCIS ESSENTIELS À RETENIR**
1. **Navigation** : `<C-h/j/k/l>` - universels pour fenêtres
2. **Copilot** : `<M-l>` - accepter suggestions IA
3. **Fichiers** : `<leader>ff` - recherche rapide
4. **Sauvegarde** : `<C-s>` - sauvegarde universelle
5. **Terminal** : `<C-@>` - accès terminal rapide

### 🚀 **WORKFLOW RECOMMANDÉ**
1. Ouvrir avec `<leader>ff` (telescope)
2. Naviguer avec `<C-h/j/k/l>` (fenêtres)
3. Éditer avec aide Copilot `<M-l/j/k>`
4. Sauvegarder avec `<C-s>`
5. Git avec `<leader>h*` (hunks)

### 🔧 **PERSONNALISATION**
- Tous les raccourcis sont configurés dans `lua/config/keymaps.lua` et `lua/plugins/*/`
- Utilisez `:WhichKey` pour explorer les raccourcis disponibles
- La touche leader (`<Space>`) est optimisée pour l'ergonomie

---

*Configuration testée et optimisée - Aucun conflit de raccourcis* ✅