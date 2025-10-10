#NoEnv
#SingleInstance Force
; ================================================================================
; AutoHotkey TTBuddyAI Script v.1.0
; by Aleksandrs M. Orrin (aka r.n. Aleksander Mamajevs)
; ================================================================================
;
; DESCRIPTION
; This AutoHotkey script is designed to speed up copy, paste, and other frequently used operations, relying exclusively on the top row of the keyboard together with the Tab key—without using Ctrl, Alt, or Shift. The project originated from a personal interest in improving comfort and speed at work, especially in situations where standard modifiers are inconvenient or unavailable.
; Additional fresh ideas and user experiences can be found by occasionally visiting forums dedicated to automation tools and modern AI systems. The script helps to simplify routine tasks and discover new approaches to workflow management.
;
; PHILOSOPHY
; - The main principle is to make work easier and faster through simplicity: all functions are available with one hand, using just the Tab key as a modifier together with the top row of keys.
; - This solution is well-suited for working in low-light conditions, when tired, or when traditional key combinations pose difficulties.
; - It's important not only to adopt ideas but also to share your own experiences and solutions to maintain the balance of the professional community.
; - The faster efficient solutions are adopted and spread, the higher the collective productivity becomes.
;
; ================================================================================
; HOTKEYS:
; ================================================================================
;
; CORE OPERATIONS:
; Tab + 1     → Copy
; Tab + 2     → Paste
; Tab + 3     → Cut
; Tab + 4     → Select All
;
; TEXT EDITING:
; Tab + Q     → Delete to the Left (Shift+Backspace)
; Tab + W     → Delete to the Right
; Tab + Z     → Undo (Ctrl+Z)
; Tab + S     → Shift + Enter
; Tab + D     → Shift + Enter
; Tab + G     → Enter
; Tab + H     → Enter
;
; NAVIGATION & SELECTION:
; Tab + E     → Select one letter Left
; Tab + R     → Select one letter Right
; Tab + C     → Select one word Left
; Tab + V     → Select one word Right
;
; PROTECTION:
; Shift + Tab → Shift + Tab (preserved)
; Alt + F4    → F11 (prevents accidental closing)
; F4          → F11 (additional protection)
;
; SCRIPT CONTROL:
; ScrollLock              → Suspend/Resume script toggle
; Ctrl+Alt+Shift+Win+F12  → Emergency exit
;
; ================================================================================
; MNEMONICS:
; ================================================================================
; Remember the complete mantra: "Ta-n, Ta-dy, Ta-z, Ta-La"
; • Ta-n  = Tab+1 = Copy (one)
; • Ta-dy = Tab+2 = Paste (double)
; • Ta-z  = Tab+3 = Cut (cutS)
; • Ta-La = Tab+4 = Select All
;
; ================================================================================
; APPLICATIONS:
; ================================================================================
; • Professional text editing
; • Coding and development
; • Working in darkness (evening/night)
; • Quick copying between multiple windows
; • File management operations
; • Emergency situations (smoke, poor visibility)
; • Space stations (working in gloves/zero gravity)
; • Accessibility (limited mobility/elderly users)
;
; ================================================================================
; TECHNICAL DETAILS:
; ================================================================================
; • Quick Tab press works normally
; • Holding Tab activates command mode
; • Smart context detection for different operations
; • Alt+Tab temporarily unavailable (use ScrollLock to pause)
; • Works equally well with text and files
; • No finger gymnastics required
;
; ================================================================================
; WORKFLOW EXAMPLE:
; ================================================================================
; 1. Hold Tab (do not release during the operation)
; 2. In Window1: Double-click a word → Press "1" (copy)
; 3. Switch to Window2: Click the destination → Press "2" (paste)
; 4. Press "S" for a new line (still holding Tab) — now simply moves the cursor to a new line within the prompt input field, so you can continue typing in the AI engine UI without accidentally sending the message.
;    This way, you can keep adding lines to your prompt without worrying about accidentally pressing Enter. The "Enter" key itself has been moved closer to the center of the keyboard for intentional use.
; 5. Repeat — achieve a 2x-4x speed increase!
;
; ================================================================================
; SYSTEM REQUIREMENTS:
; ================================================================================
; -  Windows 7/8/10/11
; -  AutoHotkey v1.1+ or v2.0+
; -  Script execution permissions
; -  That favorite AI answer engine UI you choose for your current work (or a forum chat window).
;
; ================================================================================
; LICENSE:
; ================================================================================
; Free to use and modify
; Preserve authorship when distributing
;
; ================================================================================
; CONTACT:
; ================================================================================
; GitHub: https://github.com/alexanderM23/TTBuddyAI
;
; ================================================================================
; VERSION & DATE:
; ================================================================================
; Version: 1.0
; Created: 2021-2025
; Last Updated: 2025-10-10
;
; ================================================================================
; SETTINGS
; ================================================================================

; Basic settings for reliability
SendMode Input
SetWorkingDir, %A_ScriptDir%

; ================================================================================
; CODE BEGINS BELOW
; ================================================================================
#IfWinActive
Tab & 1::Send ^{c}						; Tab - Top1						Copy to Clipboard (Ctrl - C)
Tab & 2::Send ^{v}						; Tab - Top2						Paste from Clipboard (Ctrl - V)
Tab & 3::Send ^{x}						; Tab - Top3						Cut to Clipboard (Ctrl - X)
Tab & 4::Send ^{a}						; Tab - Top4						Select All (Ctrl - A)

Tab & q::Send +{VK08}					; Tab - Q							Shift + Backspace
Tab & w::Send {VK2E}					; Tab - W							Delete

Tab & e::Send +{Left}					; Tab - E							Select one letter to the Left
Tab & r::Send +{Right}					; Tab - R							Select one letter to the Right

Tab & c::Send ^+{Left}					; Tab - C							Select one word to the Left
Tab & v::Send ^+{Right}					; Tab - V							Select one word to the Right

Tab & z::Send ^{z}						; Tab - Z							Undo last operation (Ctrl - Z)

Tab & s::Send +{Enter}					; Tab - S							Shift + Enter
Tab & d::Send +{Enter}					; Tab - D							Shift + Enter

Tab & g::Send {Enter}					; Tab - G							Enter
Tab & h::Send {Enter}					; Tab - H							Enter

+Tab::+Tab								; Shift - Tab						Send: Shift - Tab
return

; ================================================================================
; CLOSE PROTECTION - "Safety Net" Feature
; ================================================================================
; Prevents accidental program closure during high-speed work
; Alt+F4 and F4 are redirected to harmless F11 (fullscreen toggle)
;
; WHY: When working fast with Tab combinations, it's easy to slip and hit Alt+F4
; This saves you from losing unsaved work due to accidental window closure
; ================================================================================
!F4::F11   ; Alt+F4 → F11 (close protection)
F4::F11    ; F4 → F11 (extra safety)
return

^!+#F12::ExitApp ; press CTRL+ALT+SHIFT+WIN+F12 buttons phisicaly for Quick Script Exit
ScrollLock::Suspend, Toggle ; press ScrollLock for Suspend Toggle
return

Tab::
	Send {Tab}
	return
