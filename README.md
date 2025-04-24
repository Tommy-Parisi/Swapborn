## Swapborn — GDD

### 1. Game Overview
- **Title:** Swapborn  
- **Genre:** 2D Platformer / Puzzle  
- **Elevator Pitch:**  
  > “Begin your journey through The Depths: the treacherous caves of the goblin people. The environment is almost as deadly as the goblins. But death is not the end. In Swapborn, occupy the body of the closest NPC upon your demise, and perhaps you can learn that evil isn’t so black and white.”

### 2. Story & Setting
- **Setting:** A sprawling subterranean cave system (“The Depths”) carved out by goblin civilizations over millennia.  
- **Premise:** You wake up as a human stranded underground, searching for resources (ores/oil) to take “home.” As you press deeper, the truth emerges—that the goblins have lived here long before humans arrived.  
- **Twist:** The goblin “enemies” are defending their ancestral home, and your human mission is the invader’s. By swapping into goblin bodies you’ll begin to see both sides.

### 3. Player Character
- **Start Form:** Human  
- **Goal:** Navigate multi-layered puzzles by dying in strategic spots, triggering environmental reactions, then inhabiting the nearest NPC.

### 4. Core Mechanics

#### 4.1 Death & Swap  
- **Natural Hazards Only:** No manual “swap” button—death must be caused by spikes, crushers, cliffs, traps, combat, etc.  
- **Automatic Targeting:** Upon death, you instantly occupy the *nearest* NPC, no selection UI.  
- **Death as Progression:** Each death triggers an event (e.g. bridge collapse, gate opening, machinery activation) *only* when performed in the correct location or manner.

#### 4.2 NPC Archetypes (for reference)  
- **Scout:** Small, nimble. Use to reach vents & high ledges.  
- **Worker:** Strong, can push blocks & activate pressure plates.  
- **Soldier:** Durable, can clear enemy paths with simple AI-driven combat decisions.  
- **Hacker:** Avoids danger, can interface with terminals & disable traps.

### 5. Puzzle Structure
In each segment of Level 1 (and beyond), the player must:
1. **Analyze the room**: Spot hazards and NPC patrol routes.  
2. **Decide where to die**: Position yourself to land nearest the needed NPC.  
3. **Trigger the death-puzzle**: Your demise causes a chain reaction (e.g., lever falls, platform resets).  
4. **Inhabit & advance**: As the new NPC, use its unique ability to solve the next part.

### 6. Level 1 “Vertical Fragment” (Refined)
A vertical shaft broken into four chambers, each teaching one NPC type:

1. **Chamber A (Scout Intro):**  
   - Hazard: Spike pit at the bottom.  
   - Death spot: Jump into a shallow fissure to die, positioning you nearest a Scout on an upper ledge.  

2. **Chamber B (Worker Intro):**  
   - Hazard: Rolling boulder trap.  
   - Death spot: Let the boulder catch you next to a box; as Worker, push it to hold open the gate above.  

3. **Chamber C (Soldier Intro):**  
   - Hazard: Goblin ambush.  
   - Death spot: Lure goblins around a corner, die near a Soldier—whose arrival triggers them to rout and clear a path.  

4. **Chamber D (Hacker Intro & Exit):**  
   - Hazard: Electrified floor grid.  
   - Death spot: Fall next to a terminal; as Hacker, disable the grid to unlock the exit hatch.

At the top–exit, a quick cutscene reveals more of the goblins’ world and hints at the larger moral twist.

### 7. Narrative & Visual Style
- **Tone:** Mysterious, atmospheric, morally gray.  
- **Art Direction:** Clean, minimal platformer art—limited palette, sharp silhouettes, subtle environmental details (dripping water, flickering torches).  
- **Camera:**  
  - **During play:** Tight follow on current body.  
  - **On death:** Smooth zoom out to reveal the nearest NPC standing in the environment, then zoom back in as control transfers.


---

### 8. Brainstorm Additions (April 24)

- **Title:** Swapborn  
- **Genre:** 2D platformer / puzzle  

**Narrative Setup:**  
“Begin your journey through The Depths: the treacherous caves of the goblin people. The environment is almost as deadly as the goblins. But death is not the end. In Swapborn, occupy the body of the closest NPC upon your demise, and perhaps you can learn that evil isn't so black and white.”

- **Player starts as a human**
- **Death of the player must be necessary** — not a swap mechanic, but a narrative and mechanical puzzle tool.
- **Strategic Deaths:** 
  - Sometimes you must die as a Soldier to fight as another Soldier.
  - Sometimes you must die in a certain spot to become a specific NPC.
- **Swap mechanic:** You always turn into the closest NPC upon death.
- **Narrative arc:** 
  - Story has an overarching moral twist.
  - Humans are mining for ores or oil in the goblin caves.
  - Goblins have lived there for millennia.
  - Eventually, the story reveals the humans are the aggressors.
- **Camera Effect on Death:**
  - Camera zooms out on death to show surroundings and the nearest NPC.
  - Camera then zooms back in as the player occupies that NPC.

**Puzzle Setup Recap:**
In every decision point, the puzzle design should involve at least one of the following:
- Figuring out **which NPC** you need to become.
- Figuring out **where to die** to become the right NPC.
- Figuring out **how to die** (e.g., triggering a trap, aggro-ing a guard, etc.).
- Ensuring every death **causes a reaction** in the level (i.e., gate opening, path being cleared, enemy repositioning, etc.).



---

## 8. Brainstorm Additions (April 24)

- **Title:** Swapborn  
- **Genre:** 2D platformer / puzzle  

**Narrative Setup:**  
“Begin your journey through The Depths: the treacherous caves of the goblin people. The environment is almost as deadly as the goblins. But death is not the end. In Swapborn, occupy the body of the closest NPC upon your demise, and perhaps you can learn that evil isn't so black and white.”

- **Player starts as a human**
- **Death of the player must be necessary** — not a swap mechanic, but a narrative and mechanical puzzle tool.
- **Strategic Deaths:** 
  - Sometimes you must die as a Soldier to fight as another Soldier.
  - Sometimes you must die in a certain spot to become a specific NPC.
- **Swap mechanic:** You always turn into the closest NPC upon death.
- **Narrative arc:** 
  - Story has an overarching moral twist.
  - Humans are mining for ores or oil in the goblin caves.
  - Goblins have lived there for millennia.
  - Eventually, the story reveals the humans are the aggressors.
- **Camera Effect on Death:**
  - Camera zooms out on death to show surroundings and the nearest NPC.
  - Camera then zooms back in as the player occupies that NPC.

**Puzzle Setup Recap:**
In every decision point, the puzzle design should involve at least one of the following:
- Figuring out **which NPC** you need to become.
- Figuring out **where to die** to become the right NPC.
- Figuring out **how to die** (e.g., triggering a trap, aggro-ing a guard, etc.).
- Ensuring every death **causes a reaction** in the level (i.e., gate opening, path being cleared, enemy repositioning, etc.).

---

## 9. Core Gameplay Pillar: Soul Decay System

### Concept
Death is a tool, but overuse corrupts your soul. Each level has a limited **Soul Integrity**, and careless death leads to permanent reset.

### Mechanics
- **Soul Integrity Bar**: HUD indicator that degrades with each death.
- **Soft Cap**: Most levels solvable within 3–5 deaths.
- **Hard Cap**: At 10 deaths, level collapses — cinematic rewind and reset.
- **Echo Shrines**: Optional mid-level checkpoints that restore Soul Integrity.

### Puzzle Impact
- Forces efficient thinking.
- Encourages optimization and replayability.
- Some levels may require intentional sacrifice of a death, making the rest more challenging.

### Fail States
- **Overused Soul**: Player dies too often.
- **Unsolvable Puzzle**: Essential paths destroyed, wrong NPCs, etc.

---

## 10. Meta Puzzle Concepts

### The Falling Echo
Die in Room A → fall through Room B → land in Room C and swap into correct NPC mid-fall.

### The Chain of Three
Three rooms, each requires you to die as a specific NPC in sequence to progress the next.

### Echo Delay
Delayed soul transfers require timing your death so the NPC is in the correct spot upon arrival.

### Remember Me
Some NPCs retain flashbacks — swapping into them gives hints for puzzles in later rooms.

