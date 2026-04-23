# Design System Strategy

## 1. Overview & Creative North Star
The Creative North Star for this design system is **"The Precision Architect."** 

This system moves away from the generic "SaaS dashboard" aesthetic and toward a high-end, editorial experience that reflects the intersection of human engineering and artificial intelligence. It is designed to feel like a high-performance IDE blended with a premium technical journal.

We break the "template" look by leaning into **Intentional Asymmetry**. Layouts should avoid perfect 50/50 splits. Instead, we use "The Offset": hero elements that bleed off the grid, or text blocks that utilize wide-margin white space to create a sense of intellectual breathing room. The visual identity is defined by depth, tonal layering, and technical accents—like subtle grid overlays—that remind the user they are in a space of high-level engineering.

## 2. Colors
Our palette is rooted in deep slates and technical teals, utilizing the Material Design convention to manage functional depth.

*   **Primary Roles:** We use `primary` (#1e5667) and `primary_container` (#3a6e80) to anchor the brand’s authority.
*   **The "No-Line" Rule:** Explicitly prohibit the use of 1px solid borders to define sections. Boundaries must be created through background color shifts. For example, a `surface_container_low` (#edf4ff) section should sit directly against a `surface` (#f7f9ff) background.
*   **Surface Hierarchy & Nesting:** Treat the UI as a physical stack. A page begins on `surface`. Elements requiring prominence (like a code editor block) are nested in `surface_container`. Secondary cards within that block use `surface_container_high`. This "nesting" creates natural focus without visual clutter.
*   **The "Glass & Gradient" Rule:** To achieve a high-tech "AI" feel, use Glassmorphism for floating navigation or overlays. Utilize `surface_container_highest` at 70% opacity with a `20px` backdrop-blur. 
*   **Signature Textures:** Main CTAs use an animated multi-stop gradient (`135deg`, `primary` → `primary_container` → `#2b7082` → `tertiary`) with `background-size: 300% 300%` and a 12-second `gradientBreathe` keyframe. This keeps the CTA section alive without feeling busy.

## 3. Typography
The typography system balances technical precision with editorial elegance.

*   **Display & Headlines:** We use **Space Grotesk**. Its slightly geometric, wide-aperture characters evoke "engineering" and "code." Use `display-lg` (3.5rem) with tight letter-spacing (-0.02em) for high-impact brand moments.
*   **Body & Utility:** **Inter** handles all long-form reading and UI labels. Inter’s neutrality ensures that even complex technical documentation remains approachable.
*   **Identity through Scale:** We create authority by using extreme contrast in scale. A `display-lg` headline should often be paired with a `label-md` "kicker" text above it, creating an hierarchy that feels curated rather than accidental.

## 4. Elevation & Depth
Depth in this design system is achieved through **Tonal Layering** rather than traditional drop shadows.

*   **The Layering Principle:** Stacking tiers of containers creates a "soft lift." A `surface_container_lowest` (#ffffff) card placed on a `surface_container_low` (#edf4ff) background provides sufficient contrast for the eye to perceive elevation without an artificial shadow.
*   **Ambient Shadows:** If a floating element (like a modal) requires a shadow, it must be "Ambient." Use a blur value of `32px` to `64px` with a 6% opacity. The shadow color should be a tinted version of `on_surface` (#091d2e), never pure black.
*   **The "Ghost Border" Fallback:** If a layout requires a boundary for accessibility, use a "Ghost Border." Apply `outline_variant` (#c0c8cc) at 15% opacity. This creates a suggestion of a container rather than a hard cage.
*   **Glassmorphism & Depth:** Use semi-transparent `surface_container` layers to allow background "Engineering Grids" to subtly bleed through. This integrates the content into the environment.
*   **Grid Motion:** The hero engineering grid drifts one full tile (24px) on a 20-second linear loop via `gridDrift`. The movement is imperceptible as an animation but adds subconscious life to the background.

## 5. Motion & Animation

Motion reinforces the "Precision Architect" identity. Every animation should feel **purposeful and restrained** — never decorative for its own sake.

### Principles
*   **Scroll-triggered reveals:** Content enters the viewport with a `fadeUp` transition (opacity 0→1, translateY 24px→0, 0.6s `cubic-bezier(0.22, 1, 0.36, 1)`). This is applied via JavaScript `IntersectionObserver` adding the class `.is-visible` to `.reveal` elements.
*   **Stagger grids:** When multiple sibling items appear together (`.grid--4`, `.grid--3`, `.timeline`), each child gets a `transitionDelay` increment of `90ms` (capped at index 4 = 360ms total). This prevents the "wall of content" effect.
*   **Accent bar grow:** The 2px teal left-bar on `.block`, `.timeline-item`, and `.proof-card` scales from `scaleY(0)` to `scaleY(1)` with a 200ms delay after its parent reveals. This anchors the eye before the text is read.
*   **Photo float:** The hero profile frame runs a perpetual `floatPhoto` keyframe (translateY 0 → -8px → 0, 7s ease-in-out) starting 1.5s after page load. Keeps the portrait alive without distracting from the headline.
*   **Nav underline:** A 1.5px `primary`-colored underline slides in on hover (`scaleX(0→1)`, 0.2s) for nav links. Replaces the blunt background highlight with a more editorial feel.

### Durations & Easing
*   **Reveals:** `0.6s cubic-bezier(0.22, 1, 0.36, 1)` — fast start, overshoot feel without actual overshoot.
*   **Accent bars:** `0.5s` same easing, `200ms` delay.
*   **Micro-interactions (hover lifts, underlines):** `0.15s–0.2s ease`.
*   **Ambient loops (grid drift, gradient breathe, photo float):** `7s–20s` — long enough to be subconscious.

### Accessibility
*   All scroll-reveal transitions and ambient loops are disabled under `@media (prefers-reduced-motion: reduce)`.
*   Elements are shown immediately (`.is-visible` added without transition) when `IntersectionObserver` is unavailable.

## 6. Components

### Buttons
*   **Primary:** Gradient fill (`primary` to `primary_container`), `on_primary` text, `md` (0.375rem) roundedness.
*   **Secondary:** No background. Use a "Ghost Border" and `primary` text.
*   **States:** On hover, primary buttons should increase in tonal brightness (use `primary_fixed_dim`) rather than getting darker.

### Chips
*   **Technical Chips:** Use `secondary_container` (#cfe2f9) with `label-md` Inter text. Keep roundedness to `sm` (0.125rem) to maintain a sharper, more "engineered" look than standard pill shapes.

### Input Fields
*   **Structure:** No bottom line or full-box border. Use a subtle `surface_container_highest` background. 
*   **Focus State:** Transition the background to `surface_container_lowest` and apply a 1px "Ghost Border" using the `primary` color at 40% opacity.

### Cards & Lists
*   **The "No-Divider" Rule:** Forbid 1px lines between list items. Separate items using `16px` of vertical white space or by alternating background tints between `surface_container_low` and `surface_container`.
*   **Data-Viz Accents:** Incorporate 2px wide vertical "accent bars" using the `tertiary` (#235661) color on the left edge of cards to denote "AI-generated" or "Active" content. These bars animate in (`scaleY`) when the card scrolls into view — see §5 Motion.

### Tooltips
*   Use `inverse_surface` (#203243) with `on_tertiary_fixed` text. The sharp contrast ensures high-tech legibility for complex engineering terms.

## 7. Do's and Don'ts

### Do:
*   **Use Asymmetry:** Place a large headline on the left and a small technical detail (like a grid coordinate or version number) far to the right.
*   **Embrace White Space:** Give typography room to breathe. The more complex the training topic, the more white space the UI should provide.
*   **Use Subtle Grids:** Overlay a faint 24px grid pattern (using `outline_variant` at 5% opacity) on hero backgrounds to emphasize the "Engineering" theme.

### Don't:
*   **Don't use "Card-it-is":** Do not put every piece of content in a white box with a shadow. Use background shifts and typography to define sections.
*   **Don't use 100% Opacity Lines:** Avoid harsh separators. They break the fluid, high-end editorial flow.
*   **Don't use generic iconography:** Icons should be thin-stroke (1px or 1.5px) and sharp, matching the `outline` token's weight. Avoid "bubbly" or heavily rounded icon sets.