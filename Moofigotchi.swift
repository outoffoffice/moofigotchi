// Moofigotchi – MG-1: ein Hundekuh-Tamagotchi als kleines Stück Hardware für macOS.
// Drei Tasten (A ◀ · W ● · D ▶), Symbolleiste im LCD, Beachball-Spiel, Spaziergang, Druckerhaus.
// Bauen & starten: ./moofigotchi   (kompiliert beim ersten Start automatisch)

import AppKit
import Foundation

// MARK: - Sprites (aus den Referenz-Skizzen gerastert)
// '#' Kontur · '.' Fell/Papier · 'e' Auge · b p r o y g Regenbogen · l m x Tönungen
let dogA: [String] = [
    "                         ###                ",
    "                         ####               ",
    "                         ##.#     ###       ",
    "                         ##..##  #..#       ",
    "                         ##...#  #..#       ",
    "                         ##...####..#       ",
    "                         ##.......###       ",
    "                          #.........##      ",
    "                          #..........##     ",
    "                         ##...........#     ",
    "####                     ##......ee...###   ",
    "##.#                     #.......ee......#  ",
    "##.#                    #.................##",
    "##.#                    ##................##",
    "##..#                  ##.................##",
    "##..#                 ##..................##",
    " #...#              ###gyo...............###",
    " #....################ggyooo........####### ",
    " ##....##############...yooorp....#######   ",
    "  ##.....############.....oorppbb##         ",
    "   #......##########.......orppbb#          ",
    "   #.......#########..........pbb#          ",
    "   ###.....########.............##          ",
    "   ###.....########.............##          ",
    "   #........######.............###          ",
    "   #.........####.............####          ",
    "   #.........................#####          ",
    "   #.........................#####          ",
    "  ##.........................####           ",
    "  ##..........................###           ",
    "  ##...........................#            ",
    "  ##......##########..........#             ",
    "  ##.....#############..#.....#             ",
    "  ##.....##..#    ####..#.....#             ",
    " ##.....##..#       ##..#.....#             ",
    " #.....#...#        ##..#.....#             ",
    " #.....#...#        ##..#.....#             ",
    " #.....#...#        ##..#.....#             ",
    " #.....#...#         #...#....##            ",
    " #.....#...#         ##..##....##           ",
    " #......#..##        ##..##.....##          ",
    " ##......####        ######.....##          ",
    " ###########          ############          ",
    "  #######                 #######           ",
]
let dogB: [String] = [
    "                         ###                ",
    "                         ####               ",
    "                         ##.#     ###       ",
    "                         ##..##  #..#       ",
    "                         ##...#  #..#       ",
    "                         ##...####..#       ",
    "                         ##.......###       ",
    "                          #.........##      ",
    "                          #..........##     ",
    "                         ##...........#     ",
    "####                     ##......ee...###   ",
    "##.#                     #.......ee......#  ",
    "##.#                    #.................##",
    "##.#                    ##................##",
    "##..#                  ##.................##",
    "##..#                 ##..................##",
    " #...#              ###gyo...............###",
    " #....################ggyooo........####### ",
    " ##....##############...yooorp....#######   ",
    "  ##.....############.....oorppbb##         ",
    "   #......##########.......orppbb#          ",
    "   #.......#########..........pbb#          ",
    "   ###.....########.............##          ",
    "   ###.....########.............##          ",
    "   #........######.............###          ",
    "   #.........####.............####          ",
    "   #.........................#####          ",
    "   #.........................#####          ",
    "  ##.........................####           ",
    "  ##..........................###           ",
    "  ##...........................#            ",
    "  ##......##########..........#             ",
    "  ##.....#############..#.....#             ",
    "  ##.....##..#    ####..#.....#             ",
    " ##.....##..#       ##..#.....#             ",
    " #.....#...#        ##..#.....#             ",
    "  #.....#...#      ##..#.....#              ",
    "  #.....#...#      ##..#.....#              ",
    "  #.....#...#       #...#....##             ",
    "  #.....#...#       ##..##....##            ",
    "  #......#..##      ##..##.....##           ",
    "  ##......####      ######.....##           ",
    "  ###########        ############           ",
    "   #######               #######            ",
]
let dogSleep: [String] = [
    "                         ###                ",
    "                         ####               ",
    "                         ##.#     ###       ",
    "                         ##..##  #..#       ",
    "                         ##...#  #..#       ",
    "                         ##...####..#       ",
    "                         ##.......###       ",
    "                          #.........##      ",
    "                          #..........##     ",
    "                         ##...........#     ",
    "####                     ##......ee...###   ",
    "##.#                     #.......ee......#  ",
    "##.#                    #.................##",
    "##.#                    ##................##",
    "##..#                  ##.................##",
    "##..#                 ##..................##",
    " #...#              ###gyo...............###",
    " #....################ggyooo........####### ",
    " ##....##############...yooorp....#######   ",
    "  ##.....############.....oorppbb##         ",
    "   #......##########.......orppbb#          ",
    "   #.......#########..........pbb#          ",
    "   ###.....########.............##          ",
    "   ###.....########.............##          ",
    "   #........######.............###          ",
    "   #.........####.............####          ",
    "   #.........................#####          ",
    "   #.........................#####          ",
    "  ##.........................####           ",
    "  ##..........................###           ",
    "  ##...........................#            ",
    "  ##......##########..........#             ",
    "      #..##..#             #..##..#         ",
    "      ########             ########         ",
]
let dogSit: [String] = [
    "                         ###                ",
    "                         ####               ",
    "                         ##.#     ###       ",
    "                         ##..##  #..#       ",
    "                         ##...#  #..#       ",
    "                         ##...####..#       ",
    "                         ##.......###       ",
    "                          #.........##      ",
    "                          #..........##     ",
    "                         ##...........#     ",
    "                         ##......ee...###   ",
    "                         #.......ee......#  ",
    "                        #.................##",
    "                        ##................##",
    "                       ##.................##",
    "                      ##..................##",
    "                   ####gyo...............###",
    "                 #####ggyooo........####### ",
    "               ######...yooorp....#######   ",
    "             ##..####.....oorppbb##         ",
    "            ##...####......orppbb#          ",
    "           ##....####.........pbb#          ",
    "          ##.....####...........##          ",
    "         ##.......###...........##          ",
    "         #.........##..........###          ",
    "        ##..........#.........####          ",
    "        #....................#####          ",
    "       ##....................#####          ",
    "       #.....................####           ",
    "      ##.......#..............###           ",
    "      #.......#................#            ",
    "      #......#................#             ",
    "     ##.....#........#..#.....#             ",
    "     #.....#.......###..#.....#             ",
    "     #....#........ ##..#.....#             ",
    "    ##....#........ ##..#.....#             ",
    "    #.....#........ ##..#.....#             ",
    "    #.....#........ ##..#.....#             ",
    "    #......#.......  #...#....##            ",
    "    #......#.......  ##..##....##           ",
    "### #.......#######  ##..##.....##          ",
    "#..###............#  ######.....##          ",
    " ##################   ############          ",
    "                          #######           ",
]
let dogChew: [Int: String] = [14: "##..#                  ##............#######"]
let MOOF_W = 22, MOOF_H = 22, MOOF_SLEEP_H = 17   // logische Einheiten (1 = 2 feine Pixel)
let miniMoof: [String] = [
    "            ###       ",
    "            #######   ",
    "            ##.##.#   ",
    "            ##...##   ",
    "            ##....##  ",
    "##          ##..##.## ",
    "##          #........#",
    "#.#        ##........#",
    "#.##########yo....####",
    "##.########.yorp##### ",
    " #...#####...orp#     ",
    " ##..#####......#     ",
    " #....###......##     ",
    " #............###     ",
    " #............###     ",
    " #...#####.....#      ",
    " #..#######.#..#      ",
    "##.####   #.#..#      ",
    "#..#.#    #.#..#      ",
    "#..#.#    ####.##     ",
    "##..###   ####..#     ",
    "######     ######     ",
]
let miniMoofB: [String] = [
    "            ###       ",
    "            #######   ",
    "            ##.##.#   ",
    "            ##...##   ",
    "            ##....##  ",
    "##          ##..##.## ",
    "##          #........#",
    "#.#        ##........#",
    "#.##########yo....####",
    "##.########.yorp##### ",
    " #...#####...orp#     ",
    " ##..#####......#     ",
    " #....###......##     ",
    " #............###     ",
    " #............###     ",
    " #...#####.....#      ",
    " #..#######.#..#      ",
    "##.####   #.#..#      ",
    " #..#.#  ###..#       ",
    " #..#.#   #.#.##      ",
    " #..###   ###..##     ",
    " ######   #######     ",
]
let printerHouse: [String] = [
    "         ####################               ",
    "         #...................##             ",
    "         ##....................##           ",
    "         #......................#           ",
    "        ##...............m....#.#           ",
    "        #.#.....................#           ",
    "        #.......................#           ",
    "        #.......................#           ",
    "        #.#.....................#           ",
    "        #.....................#.#           ",
    "        #.......................#           ",
    "        #.#.....................#           ",
    "      ###.....................#.####        ",
    "      ..#.#...m.................#..###      ",
    "    ##.##mmmmmmmmmmmmmmmmmmmmm###....###    ",
    "    #..##....................####......##   ",
    "  ###...............................m....## ",
    "  #.......................##.m#...........# ",
    " ##################################....mmmm#",
    " #...mmmmmmmmmmmmmmmmmmmmmmmmmm...#mmmm...m#",
    "##..gg............................#.......m#",
    "##..yy............................#....mmmm#",
    "##..oo........mmmmmmmm............#mmmm.m.m#",
    "##..rr......mmxxxxxxxmmm..#..#....#mm#m.m.m#",
    "##..pp......m.xxxxxxxxxm.#........#mm#m.m.m#",
    "##..bb.....m.xxxxxxxxxxmm#.##.....#mm#m.mmm#",
    "##.........mxxxxxxxxxxxxm.........#mm#mmmmm#",
    "##..........xxxxxxxxxxxxm.........#mmmmmmmm#",
    "##..........xxxxxxxxxxxxm.........#mmmmmmmm#",
    "##..........xxxxxxxxxxxxm.........#m#mm#mm##",
    "##..........xxxxxxxxxxxxm.........#mmmmm### ",
    " #.........mxxxxxxxxxxxxm.........#mmm###   ",
    " ###########............###############     ",
    "   #################################        ",
]
let clouds: [[String]] = [
    ["     ####      ", "    ########   ", "  ############ ", "############## ", "###############", " ##############", "   ########### ", "   #########   ", "       ####    "],
    ["    ###    ", "   #####   ", " ########  ", "########## ", "###########", " ##########", "  ######## ", "   ######  "],
    ["      ###           ", "     #####   ###    ", "  ######### #####   ", " #################  ", "####################", " ################## ", "   ##############   "],
    ["     ###     ", "    #####    ", "    #####    ", "   #######   ", "  ########   ", "  #########  ", " ########### ", "#############", "#############", " ############", "  ########## ", "   #######   "],
    ["            ###     ", "          ######    ", "       ##########   ", "   ###############  ", "################### ", "   #################", "      ############  ", "         #######    "],
    ["     ####      ", "    #    ###   ", "  ##        ## ", "##           # ", "#             #", " ##           #", "   #        ## ", "   ####    #   ", "       ####    "],
    ["    ###    ", "   #   #   ", " ##     #  ", "#        # ", "#         #", " #        #", "  #      # ", "   ######  "],
    ["      ###          ", "     #   #   ###   ", "  ###     # #   #  ", " #         #     # ", "#                 #", " ##              # ", "   ##############  "],
    ["     ###     ", "    #   #    ", "    #   #    ", "   #     #   ", "  #      #   ", "  #       #  ", " #         # ", "#           #", "#           #", " #          #", "  #       ## ", "   #######   "],
    ["          ###    ", "        ##   #   ", "     ###      #  ", " ####          # ", "#               #", " ####           #", "    ###       ## ", "       #######   "],
]
let plants: [[String]] = [
    ["   ##   ", " ###### ", "## # ###", "# # # ##", " ###### ", "   ##   ", "  ####  "],
    ["   ##  ##   ", " ### ## ### ", "# # # # # ##", " # # # # ## ", "  ########  ", "     ##     "],
    ["     #      ", "     #      ", "  #  #  #   ", "   # #  #   ", "#  # # #   #", " #  ## #  # ", "  # ###  #  ", "   # ## #   ", "    ####    "],
    ["      #  ", "     #   ", "    # #  ", "   # #   ", "  # # ## ", " # ###   ", "  # # ###", "## ###   ", " ## # ## ", "   ###   ", "    #    "],
    ["    ##    ", "  ### ##  ", " # # # ## ", "##  # #  #", "# # #  # #", " ### ## # ", "   # #    ", "    #     ", "    #     ", "    #     ", "   # #    "],
    ["  #  ", "  #  ", " ### ", " # # ", "# # #", "## ##", "# # #", " ### ", " ### ", "  #  ", "  #  ", "  #  "],
    ["    #    ", "    #    ", "   ###   ", "  #####  ", "   # #   ", "  # # #  ", " ####### ", "  #   #  ", " # # # # ", "# # # # #", "    #    ", "    #    "],
    ["  ##    ##  ", "    #  #    ", " ### ## ### ", "#   ####   #", "   #  # #   ", "  #   #  #  ", "      #     ", "     #      ", "     #      ", "     #      ", "    ###     "],
    ["   ####   ", " ## #  ## ", "# # #  # #", "# #  # # #", "# #  # # #", "# #  #   #", "#    #   #", "     #    ", "     #    ", "     #    ", "     #    "],
    ["    #   # ", "#   # # # ", " #  #  #  ", "  # # #  #", "#  # #  # ", " ## #  #  ", "   ## #   ", "    ##    ", "    #     ", "    #     ", "   ###    "],
    ["   ####   ", " ##    ## ", "#   #    #", "# #   #  #", "#        #", " #  #  ## ", "  ## ##   ", "    ##    ", "    #     ", "    #     ", "   ###    "],
    ["   ##   ", "   ##   ", "   ##  #", "#  ##  #", "#  ##  #", "#  #####", "#####   ", "   ##   ", "   ##   ", "   ##   ", "  ###   "],
    ["   # #   ", " #  #  # ", "  ## ##  ", "# # # # #", "  ## ##  ", " #  #  # ", "   # #   ", "    #    ", " ## # ## ", "  ####   ", "    #    ", "    #    "],
    ["   #   ", " # # # ", "  # #  ", "## # ##", "  # #  ", " # # # ", "   #   ", "## # ##", " ##### ", "   #   ", "   #   "],
    ["# # #      ", "#####      ", " ###  # # #", "  #   #####", "  #    ### ", "# #     #  ", " ##     #  ", "  #    #   ", "   #  #    ", "     #     "],
    ["     #      ", "    ###     ", "     #      ", " #   #    # ", "###  #   ###", " #   #    # ", "  #  #   #  ", "  # ## # #  ", "   # ## #   ", "    ## #    ", "     ##     "],
]

// Kleine Sprites im logischen Raster (1 Punkt = 2×2 feine Pixel)
let hay = [" #.#.##.# ", "##########", "#..#..#..#", "##########", "#.#..#..##", "##########"]
let cookie = ["  ####  ", " #....# ", "#.##...#", "#....#.#", "#.#....#", "#...##.#", " #....# ", "  ####  "]
// Häufchen (fein): Kringel mit Spitze
let poopPile = ["    ##      ", "   #xx#     ", "    #xx#    ", "   ######   ", "  #xxxxxx#  ", "  #xxxxxx#  ", "  ########  ", " #xxxxxxxx# ", "#xxxxxxxxxx#", " ########## "]
let heart = [" ## ## ", "#######", "#######", " ##### ", "  ###  ", "   #   "]
let pill = [" ##### ", "#.....#", "#.....#", "#######", "#######", " ##### "]
let sun = ["   #   ", " #   # ", "  ###  ", "#######", "  ###  ", " #   # ", "   #   "]
let moon = ["  ###  ", " ##.   ", "##.    ", "##.    ", "##.    ", " ##.   ", "  ###  "]
let bubble = [" ### ", "#...#", "#...#", " ### "]
let zee = ["####", "  # ", " #  ", "####"]

// Feine Sprites für den Spaziergang
let junkBone = ["##      ##", "#.######.#", " #......# ", "#.######.#", "##      ##"]
let junkCan = [" #### ", "#mmmm#", "#....#", "#.rr.#", "#.rr.#", "#....#", "#mmmm#", " #### "]
let trafficRed = ["#######", "#.rrr.#", "#.rrr.#", "#.....#", "#.xxx.#", "#.xxx.#", "#######",
                  "   #   ", "   #   ", "   #   ", "   #   ", "   #   ", "   #   ", "   #   ", "   #   ",
                  "   #   ", "   #   ", "   #   ", "  ###  "]
let trafficGreen = trafficRed.enumerated().map { i, r in
    i == 1 || i == 2 ? r.replacingOccurrences(of: "r", with: "x") : (i == 4 || i == 5 ? r.replacingOccurrences(of: "x", with: "g") : r)
}
let catA = ["#   #          ", "##.##        # ", "#...#       #  ", "#e.e#       #  ", " #..#########  ",
            " #..........#  ", "  #.........#  ", "  #.##...#.##  ", "  #.#    #.#   ", "  ###    ###   "]
let catB = Array(catA.prefix(8)) + [" #.#      #.#  ", " ###      ###  "]

// Menü-Symbole (fein, Tinte)
let iconFeed = ["#########", "# # # # #", "#########", "## ### ##", "#########", "# # # # #", "#########"]
let iconSnack = ["  #####  ", " #     # ", "# #   # #", "#   #   #", "# #    ##", " #  #  # ", "  #####  "]
let iconPlay = ["#      ", "###    ", "#####  ", "#######", "#####  ", "###    ", "#      "]
let iconClean = ["      ## ", "     #  #", "  ##  ## ", " #  #    ", " #  #  # ", "  ##  # #", "       # "]
let iconMedic = ["  #####   ", " #   ###  ", "#    #### ", "#    #### ", " #   ###  ", "  #####   "]
let iconLight = ["  ####", " ##   ", "##    ", "##    ", "##    ", " ##   ", "  ####"]
let iconSetup = ["   # #   ", " ####### ", " ##   ## ", "###   ###", " ##   ## ", " ####### ", "   # #   "]
let iconBack = ["   #      ", "  ##      ", " #########", "##########", " #########", "  ##      ", "   #      "]
let iconBall = ["  ###  ", " # # # ", "#  #  #", "#######", "#  #  #", " # # # ", "  ###  "]
let iconWalk = ["  #   #  ", " ### ### ", "  #   #  ", "#   #   #", "   ###   ", "  #####  ", "  #####  ", "   # #   "]

struct MenuItem { let id: String; let label: String; let icon: [String] }
let mainMenu: [MenuItem] = [
    MenuItem(id: "feed", label: "feed", icon: iconFeed),
    MenuItem(id: "snack", label: "snack", icon: iconSnack),
    MenuItem(id: "play", label: "play", icon: iconPlay),
    MenuItem(id: "clean", label: "clean", icon: iconClean),
    MenuItem(id: "medic", label: "medicine", icon: iconMedic),
    MenuItem(id: "light", label: "light", icon: iconLight),
    MenuItem(id: "setup", label: "settings", icon: iconSetup),
]
let playMenu: [MenuItem] = [
    MenuItem(id: "back", label: "back", icon: iconBack),
    MenuItem(id: "ball", label: "beach ball", icon: iconBall),
    MenuItem(id: "walk", label: "go for a walk", icon: iconWalk),
]

func flip(_ rows: [String]) -> [String] { rows.map { String($0.reversed()) } }

/// pose: A, B (laufen), sit, down, sleep
func moofSprite(_ pose: String, eyesClosed: Bool, chew: Bool) -> [String] {
    var rows: [String]
    switch pose {
    case "sleep", "down": rows = dogSleep
    case "sit": rows = dogSit
    case "B": rows = dogB
    default: rows = dogA
    }
    if chew && (pose == "A" || pose == "B") { for (i, r) in dogChew { rows[i] = r } }
    let eyeRows = rows.indices.filter { rows[$0].contains("e") }
    for (k, i) in eyeRows.enumerated() {
        rows[i] = rows[i].replacingOccurrences(of: "e", with: eyesClosed && k == 0 ? "." : "#")
    }
    return rows
}

// MARK: - Pixel-Matrix

// Werte: 0 aus · 1 Tinte · 2…7 Regenbogen · 8 Weiß · 9/10/11 Tönung hell/mittel/dunkel · 12 Papierlicht
let INK: UInt8 = 1, WHITE: UInt8 = 8, T1: UInt8 = 9, T2: UInt8 = 10, T3: UInt8 = 11, PAPER: UInt8 = 12

/// Logische Koordinaten (48×36) für Spiel & alte Sprites, gerendert auf 2× feinem Raster (96×72).
struct Grid {
    let w: Int, h: Int
    var px: [UInt8]
    init(_ lw: Int, _ lh: Int) { w = lw * 2; h = lh * 2; px = Array(repeating: 0, count: w * h) }
    static func value(_ c: Character, fine: Bool) -> UInt8? {
        switch c {
        case " ": return nil
        case "#", "e": return INK
        case "b": return 2
        case "p": return 3
        case "r": return 4
        case "o": return 5
        case "y": return 6
        case "g": return 7
        case ".": return fine ? WHITE : 0
        case "l": return T1
        case "m": return T2
        case "x": return T3
        case "w": return PAPER
        default: return 0
        }
    }
    func at(_ x: Int, _ y: Int) -> UInt8 { x >= 0 && x < w && y >= 0 && y < h ? px[y * w + x] : 0 }
    mutating func setF(_ x: Int, _ y: Int, _ v: UInt8 = INK) {
        if x >= 0 && x < w && y >= 0 && y < h { px[y * w + x] = v }
    }
    mutating func set(_ x: Int, _ y: Int, _ v: UInt8 = INK) {
        setF(x * 2, y * 2, v); setF(x * 2 + 1, y * 2, v); setF(x * 2, y * 2 + 1, v); setF(x * 2 + 1, y * 2 + 1, v)
    }
    mutating func blit(_ rows: [String], _ x: Int, _ y: Int, flipped: Bool = false) {
        for (dy, row) in (flipped ? flip(rows) : rows).enumerated() {
            for (dx, c) in row.enumerated() { if let v = Grid.value(c, fine: false) { set(x + dx, y + dy, v) } }
        }
    }
    /// fein, 1:1 – '#' wird zu `ink` (für getönte Bäume etc.)
    mutating func blitFine(_ rows: [String], _ x: Int, _ y: Int, flipped: Bool = false, ink: UInt8 = INK, scale: Int = 1) {
        for (dy, row) in (flipped ? flip(rows) : rows).enumerated() {
            for (dx, c) in row.enumerated() {
                guard var v = Grid.value(c, fine: true) else { continue }
                if v == INK { v = ink }
                for sy in 0..<scale { for sx in 0..<scale { setF(x + dx * scale + sx, y + dy * scale + sy, v) } }
            }
        }
    }
    mutating func hline(_ x0: Int, _ x1: Int, _ y: Int) { for x in (x0 * 2)...(x1 * 2 + 1) { setF(x, y * 2 + 1) } }
    mutating func hlineF(_ y: Int, _ v: UInt8 = INK) { for x in 0..<w { setF(x, y, v) } }
    mutating func dither(_ y0: Int, _ y1: Int) {
        guard y0 <= y1 else { return }
        for y in stride(from: y0 * 2, through: y1 * 2 + 1, by: 2) {
            for x in 0..<w where (x + y / 2) % 2 == 0 { setF(x, y) }
        }
    }
    /// Apple-Wartekreisel, im Uhrzeigersinn drehend
    mutating func beachball(_ cx: Double, _ cy: Double, _ r: Double, _ phase: Double) {
        let order: [UInt8] = [6, 5, 4, 3, 2, 7]   // ab 12 Uhr im Uhrzeigersinn: gelb orange rot lila blau grün
        for y in Int(cy - r - 1)...Int(cy + r + 1) {
            for x in Int(cx - r - 1)...Int(cx + r + 1) {
                let dx = Double(x) + 0.5 - cx, dy = Double(y) + 0.5 - cy
                guard dx * dx + dy * dy <= r * r else { continue }
                var a = atan2(dy, dx) + .pi / 2 - phase
                a = a.truncatingRemainder(dividingBy: 2 * .pi); if a < 0 { a += 2 * .pi }
                setF(x, y, order[min(5, Int(a / (.pi / 3)))])
            }
        }
    }
}

// MARK: - Hintergründe (Einstellungen)

let backdropNames = ["plain", "horizon", "rings", "grid", "waves"]

/// füllt die feinen Zeilen 0..<bottom
func drawBackdrop(_ g: inout Grid, _ kind: Int, bottom: Int) {
    let w = g.w
    switch kind {
    case 1:   // Horizont mit Streifen
        let hz = bottom * 45 / 100
        for y in 0..<hz where y % 2 == 0 {
            let dens = 2 + (hz - y) / 6
            for x in 0..<w where (x + y / 2) % dens == 0 { g.setF(x, y, T1) }
        }
        for x in 0..<w { g.setF(x, hz + (x % 4 < 2 ? 0 : 1), T2) }
        var yy = hz + 3, gap = 6
        while yy < bottom {
            for x in 0..<w { g.setF(x, yy, gap < 3 ? T3 : T2) }
            for y in (yy + 1)..<min(bottom, yy + gap) where y % 2 == 0 { for x in 0..<w where (x + y / 2) % 2 == 0 { g.setF(x, y, T1) } }
            yy += gap; gap = max(2, gap - 1)
        }
    case 2:   // Ringe
        let cx = Double(w) + 22, cy = Double(bottom) * 0.38
        for y in 0..<bottom {
            for x in 0..<w {
                let d = hypot(Double(x) - cx, Double(y) - cy)
                let m = d.truncatingRemainder(dividingBy: 14)
                if m < 1.6 { g.setF(x, y, T2) }
                else if Int(d / 14) % 2 == 0 && (x + y) % 3 == 0 && y % 2 == 0 { g.setF(x, y, T1) }
            }
        }
    case 3:   // Perspektiv-Raster
        let hz = bottom * 42 / 100
        for y in 0..<hz where y % 2 == 0 {
            let dens = 2 + (hz - y) / 5
            for x in 0..<w where (x + y / 2) % dens == 0 { g.setF(x, y, T1) }
        }
        for x in 0..<w { g.setF(x, hz, T3) }
        for y in (hz + 1)..<bottom { for x in 0..<w where (x + y) % 2 == 0 { g.setF(x, y, T1) } }
        var k = 1.0
        while true {
            let yy = hz + Int(k * k * 0.9); if yy >= bottom { break }
            for x in 0..<w { g.setF(x, yy, T2) }
            k += 1
        }
        let vx = Double(w) / 2
        for i in -8...8 {
            let x1 = vx + Double(i) * 18
            for y in (hz + 1)..<bottom {
                let t = Double(y - hz) / Double(bottom - hz)
                g.setF(Int(vx + (x1 - vx) * t * 1.6), y, T2)
            }
        }
    case 4:   // Wellen
        for y in 0..<bottom {
            for x in 0..<w {
                let v = Double(x) * 0.42 - Double(y) + 7 * sin(Double(x) * 0.045) + 200
                let t = v.truncatingRemainder(dividingBy: 16)
                if t < 1.4 { g.setF(x, y, T3) }
                else if t > 9 && (x + y) % 2 == 0 { g.setF(x, y, t > 13 ? T2 : T1) }
                else if t > 5 && (x + y) % 4 == 0 && y % 2 == 0 { g.setF(x, y, T1) }
            }
        }
    default: break
    }
}

// MARK: - Spielstand (kompatibel zur Python-Version)

struct PetState: Codable {
    var name: String
    var born: Double
    var last_seen: Double
    var hunger: Double
    var fun: Double
    var energy: Double
    var clean: Double
    var sleeping: Bool
    var sick: Bool
    var poops: [Int]
    var poop_timer: Double
    var xp: Int
    var moofs: Int
    var fed: Int
    var cleaned: Int
    var cookies_recent: Double
    var highscore: Int
    var streak: Int
    var last_visit: String
    var achievements: [String]
    var walk_best: Int?
    var walks: Int?
}

let savePath = ProcessInfo.processInfo.environment["MOOF_SAVE"]
    ?? (NSHomeDirectory() as NSString).appendingPathComponent(".moofigotchi.json")

func now() -> Double { Date().timeIntervalSince1970 }
func clamp(_ v: Double) -> Double { max(0, min(100, v)) }
func levelOf(_ xp: Int) -> Int { 1 + Int((Double(xp) / 25).squareRoot()) }
func rnd() -> Double { Double.random(in: 0..<1) }
func currentHour() -> Int {
    if let h = ProcessInfo.processInfo.environment["MOOF_HOUR"], let v = Int(h) { return v }
    return Calendar.current.component(.hour, from: Date())
}
func isNight() -> Bool { let h = currentHour(); return h >= 20 || h < 7 }

let dayFormatter: DateFormatter = {
    let f = DateFormatter()
    f.locale = Locale(identifier: "en_US_POSIX")
    f.dateFormat = "yyyy-MM-dd"
    return f
}()
func todayString() -> String { dayFormatter.string(from: Date()) }

func defaultState(_ name: String) -> PetState {
    let t = now()
    return PetState(name: name, born: t, last_seen: t, hunger: 80, fun: 80, energy: 90, clean: 100,
                    sleeping: false, sick: false, poops: [], poop_timer: 0, xp: 0, moofs: 0, fed: 0,
                    cleaned: 0, cookies_recent: 0, highscore: 0, streak: 1, last_visit: todayString(),
                    achievements: [], walk_best: 0, walks: 0)
}

let titles = ["puppy", "calf", "dogcow", "moof pro", "farm star", "pixel legend", "grand master of dogcows"]
let achievementList: [(String, String)] = [
    ("first_moof", "first moof!"), ("pet_100", "cuddle pro"), ("fed_25", "hay delivery"),
    ("score_20", "ball juggler"), ("score_50", "spinning wheel of joy"), ("streak_3", "regular"),
    ("streak_7", "best friends"), ("clean_10", "stable master"), ("level_5", "farm star"),
    ("night_owl", "night owl"), ("walk_perfect", "good dog!"), ("walk_10", "trail blazer"),
]
let thoughts: [String: [String]] = [
    "happy": ["moof.", "moof moof!", "i'm a dog. and a cow.", "1 bit is plenty.",
              "cmd-s is love.", "i have 72 dpi feelings.", "mooo… uh, woof!",
              "life is good.", "have you saved today?", "walk? walk!? walk!!"],
    "hungry": ["some hay would be nice…", "my tummy rumbles in mono.", "cookies? please?"],
    "bored": ["bored…", "wanna play ball?", "let's go for a walk!"],
    "tired": ["*yawn*", "so sleepy…", "a nap would be nice."],
    "dirty": ["something smells funny.", "clean up, maybe?", "eww."],
    "sick": ["i don't feel well…", "need medicine…", "*cough*"],
]

// MARK: - Spiellogik

struct Particle { var x: Double; var y: Double; var sprite: [String]; var ttl: Int }
struct WalkEvent { var x: Double; var kind: Int; var resolved = false; var failed = false; var walk = 0.0 }  // 0/1 Müll, 2 Ampel, 3 Katze
enum Mode { case pet, settings, countdown, ball, walk, result }
enum Minigame { case ball, walk }
enum Btn { case left, ok, right, back }

let COLS = 48, ROWS = 36            // logisch
let FW = 96, FH = 72                // fein
let HOME_GROUND = ROWS - 5          // logische Bodenlinie zu Hause
let GAME_FLOOR = 64                 // feine Unterkante im Spiel
let DOG_X_WALK = 4                  // feine x-Position beim Spaziergang

@MainActor
final class Game {
    var st: PetState
    var x = 6.0, target: Int? = nil, facing = 1, walkFrame = 0, blink = 0
    var action: (name: String, ends: Double)? = nil
    var hop = 0, tick = 0, cloudX = 0.0, cloudX2 = 30.0
    var particles: [Particle] = []
    var sayText = "", sayUntil = 0.0
    var toastText = "", toastUntil = 0.0
    var nextThought = now() + 6, lastSave = now()
    var food: (sprite: [String], stage: Int)? = nil
    var flash = 0
    var quitRequested = false
    var moofBox = (x: 0, y: 0, w: 0, h: 0)
    var onPinToggle: (() -> Void)?
    var pinned = false

    // Menü
    var mode = Mode.pet
    var menuIndex = 0, inPlayMenu = false
    var barPressedUntil = 0.0, labelUntil = 0.0
    var settingsRow = 0
    var backdrop = UserDefaults.standard.integer(forKey: "backdrop")

    // Minispiele
    var minigame = Minigame.ball
    var leftHeld = false, rightHeld = false
    var modeStart = 0.0, lastStep = now(), acc = 0.0
    var score = 0, lives = 3, gameFlash = 0, aborted = false
    var resultText = ""
    // Ball
    var gx = 37.0, jumpY = 0.0, jumpV = 0.0
    var bx = 48.0, by = 10.0, bvx = 0.0, bvy = 0.0, spin = 0.0, ballWait = 0.0
    // Spaziergang
    var scroll = 0.0, walkT = 0.0, events: [WalkEvent] = [], nextEvent = 2.5
    var pose = "A", poseUntil = 0.0, good = 0, total = 0, shake = 0, stepAcc = 0.0

    var menu: [MenuItem] { inPlayMenu ? playMenu : mainMenu }

    init(_ st: PetState, isNew: Bool) {
        self.st = st
        if backdrop < 0 || backdrop >= backdropNames.count { backdrop = 0 }
        greeting(isNew)
    }

    func save() {
        st.last_seen = now()
        let enc = JSONEncoder()
        enc.outputFormatting = [.prettyPrinted, .sortedKeys]
        if let data = try? enc.encode(st) {
            try? data.write(to: URL(fileURLWithPath: savePath), options: .atomic)
        }
    }

    func say(_ t: String, _ secs: Double = 3.5) { sayText = t; sayUntil = now() + secs }
    func toast(_ t: String) { toastText = t; toastUntil = now() + 4 }
    func busy() -> Bool { if let a = action { return now() < a.ends }; return false }

    func giveXP(_ n: Int) {
        let before = levelOf(st.xp)
        st.xp += n
        let after = levelOf(st.xp)
        if after > before {
            toast("level \(after) · \(titles[min(after - 1, titles.count - 1)])")
            hearts(5)
        }
    }

    func unlock(_ key: String) {
        guard !st.achievements.contains(key) else { return }
        st.achievements.append(key)
        let name = achievementList.first { $0.0 == key }?.1 ?? key
        toast("★ achievement: \(name)")
    }

    func hearts(_ n: Int) {
        for _ in 0..<n {
            let hx = x + (facing > 0 ? Double(MOOF_W - 6) : 0) + Double(Int.random(in: -4...4))
            particles.append(Particle(x: hx, y: Double(4 + Int.random(in: 0...4)), sprite: heart, ttl: 14 + Int.random(in: 0...8)))
        }
    }

    func greeting(_ isNew: Bool) {
        if isNew { say("hi! i'm \(st.name.lowercased()). moof.", 5); return }
        let hours = min(72, max(0, (now() - st.last_seen) / 3600))
        simulate(hours * 3600 * 0.5, offline: true)
        if let last = dayFormatter.date(from: st.last_visit),
           let today = dayFormatter.date(from: todayString()) {
            let gap = Calendar.current.dateComponents([.day], from: last, to: today).day ?? 0
            if gap == 1 { st.streak += 1 } else if gap > 1 { st.streak = 1 }
        }
        st.last_visit = todayString()
        say(hours >= 1 ? "there you are! gone \(Int(hours)) h. moof." : "moof. good to see you.", 5)
        if currentHour() < 4 { unlock("night_owl") }
    }

    func simulate(_ dt: Double, offline: Bool = false) {
        let h = dt / 3600
        if st.sleeping {
            st.energy = clamp(st.energy + 25 * h)
            st.hunger = clamp(st.hunger - 3 * h)
            st.fun = clamp(st.fun - 2 * h)
            if st.energy >= 100 && !offline && !isNight() {
                st.sleeping = false; flash = 3
                say("all rested! moof.")
            }
        } else {
            st.energy = clamp(st.energy - 6 * h)
            st.hunger = clamp(st.hunger - 8 * h)
            st.fun = clamp(st.fun - 10 * h)
        }
        st.clean = clamp(st.clean - (3 + 4 * Double(st.poops.count)) * h)
        st.cookies_recent = max(0, st.cookies_recent - 1.5 * h)
        if st.sick { st.fun = clamp(st.fun - 4 * h) }

        st.poop_timer += h
        while st.poop_timer > 1.5 && st.poops.count < 3 {
            st.poop_timer -= 1.5
            st.poops.append(Int.random(in: 0...100))
        }
        if st.poops.count >= 3 { st.poop_timer = min(st.poop_timer, 1.5) }

        var risk = 0.0
        if st.hunger < 10 { risk += 1 }
        if st.clean < 15 { risk += 1 }
        if st.cookies_recent > 4 { risk += 2 }
        if risk > 0 && !st.sick && rnd() < risk * 0.25 * min(1, h * 6 + (offline ? 1 : 0)) {
            st.sick = true
            if !offline { say("i don't feel so good…") }
        }
        if !offline && !st.sleeping && st.energy < 5 && mode == .pet {
            st.sleeping = true; flash = 3
            say(isNight() ? "off to my printer… zzz" : "*flop* just a quick snooze…")
        }
    }

    func moodKey() -> String {
        if st.sick { return "sick" }
        let lows = [(st.hunger, "hungry"), (st.fun, "bored"), (st.energy, "tired"), (st.clean, "dirty")]
        let m = lows.min { $0.0 < $1.0 }!
        return m.0 < 35 ? m.1 : "happy"
    }

    func moodLabel() -> String {
        if st.sleeping { return isNight() ? "sleeping" : "snoozing" }
        if st.sick { return "sick" }
        let avg = (st.hunger + st.fun + st.energy + st.clean) / 4
        for (lim, w) in [(80.0, "overjoyed"), (60, "content"), (40, "so-so"), (20, "grumpy")] where avg >= lim {
            return w
        }
        return "miserable"
    }

    // Takt: 20 fps
    func step() {
        let t = now()
        var dt = t - lastStep
        lastStep = t
        if flash > 0 { flash -= 1 }
        if gameFlash > 0 && mode != .ball { gameFlash = 0 }
        if dt > 2 { simulate(dt); dt = 0; acc = 0 }   // Mac war im Ruhezustand
        switch mode {
        case .pet, .settings:
            acc += dt
            while acc >= 0.1 { acc -= 0.1; updatePet(0.1) }
        case .countdown:
            simulate(dt)
            if t - modeStart > 2.4 { mode = minigame == .ball ? .ball : .walk; modeStart = t; flash = 2 }
        case .ball:
            simulate(dt); tick += 1; updateBall(min(dt, 0.1))
        case .walk:
            simulate(dt); tick += 1; updateWalk(min(dt, 0.1))
        case .result:
            simulate(dt); tick += 1; spin += dt * 7
        }
        if t - lastSave > 30 { save(); lastSave = t }
    }

    func updatePet(_ dt: Double) {
        let t = now()
        tick += 1
        simulate(dt)
        cloudX = (cloudX + 0.35).truncatingRemainder(dividingBy: Double(FW + 40))
        cloudX2 = (cloudX2 + 0.2).truncatingRemainder(dividingBy: Double(FW + 40))

        for i in particles.indices { particles[i].y -= 0.6; particles[i].ttl -= 1 }
        particles.removeAll { $0.ttl <= 0 }

        if blink > 0 { blink -= 1 } else if rnd() < 0.03 { blink = 2 }

        if st.sleeping && tick % 14 == 0 {
            let zx = isNight() ? Double(COLS - 14) : x + (facing > 0 ? Double(MOOF_W - 4) : 0)
            particles.append(Particle(x: zx, y: isNight() ? 13 : 16, sprite: zee, ttl: 12))
        }

        hop = 0
        if busy(), let a = action {
            if a.name == "happy" { hop = tick % 4 < 2 ? 2 : 0 }
            if a.name == "eat", food != nil { food!.stage = max(0, min(3, Int((a.ends - t) / 0.7))) }
        } else {
            if action?.name == "eat" { food = nil }
            action = nil
            if !st.sleeping {
                // nachts steht rechts das Druckerhaus – Moof bleibt davor
                let maxX = isNight() ? (FW - printerHouse[0].count) / 2 - MOOF_W + 4 : COLS - MOOF_W - 1
                if target == nil && rnd() < 0.02 && !st.sick { target = Int.random(in: 0...max(0, maxX)) }
                if let tg = target {
                    let d = Double(tg) - x
                    if abs(d) < 1 { target = nil } else {
                        facing = d > 0 ? 1 : -1
                        x += Double(facing)
                        walkFrame ^= 1
                    }
                }
                x = max(0, min(x, Double(maxX)))
            }
        }

        if t > nextThought && t > sayUntil {
            nextThought = t + Double.random(in: 15...35)
            if !st.sleeping && mode == .pet, let list = thoughts[moodKey()] { say(list.randomElement()!) }
        }

        if st.streak >= 3 { unlock("streak_3") }
        if st.streak >= 7 { unlock("streak_7") }
        if levelOf(st.xp) >= 5 { unlock("level_5") }
    }

    // MARK: Aktionen

    func asleepCheck() -> Bool {
        if st.sleeping { say("grmpf… i'm sleeping!"); return true }
        return false
    }

    func feed(cookie isCookie: Bool) {
        if asleepCheck() || busy() { return }
        if st.hunger > 95 { say("i'm stuffed!"); return }
        target = nil
        if isCookie {
            st.hunger = clamp(st.hunger + 8); st.fun = clamp(st.fun + 12)
            st.cookies_recent += 1
            food = (cookie, 3)
            say(st.cookies_recent < 4 ? "cookies! nom." : "one more… *urgh*")
        } else {
            st.hunger = clamp(st.hunger + 25)
            food = (hay, 3)
            say(["nom, hay.", "crunch crunch", "fresh from the field!"].randomElement()!)
        }
        st.poop_timer += 0.4
        st.fed += 1
        if st.fed >= 25 { unlock("fed_25") }
        action = ("eat", now() + 2.8)
        giveXP(3)
    }

    func pet() {
        if asleepCheck() || busy() { return }
        st.moofs += 1
        st.fun = clamp(st.fun + 4)
        unlock("first_moof")
        if st.moofs >= 100 { unlock("pet_100") }
        say(["moof!", "moof.", "mooooof.", "♥ moof ♥", "hehe, that tickles!"].randomElement()!, 2)
        hearts(2)
        action = ("happy", now() + 1.2)
        giveXP(1)
    }

    func toggleSleep() {
        st.sleeping.toggle()
        target = nil
        flash = 3
        if st.sleeping { say(isNight() ? "good night… into my printer. zzz" : "just a little snooze… zzz", 2.5) }
        else { say(st.energy > 60 ? "lights on. moof." : "awake already?! *yawn*") }
    }

    func cleanUp() {
        if busy() { return }
        let n = st.poops.count
        st.poops = []
        st.clean = clamp(st.clean + 35 + 10 * Double(n))
        st.cleaned += n
        if st.cleaned >= 10 { unlock("clean_10") }
        for _ in 0..<6 {
            particles.append(Particle(x: Double(Int.random(in: 0...40)), y: Double(22 + Int.random(in: 0...6)),
                                      sprite: bubble, ttl: 10 + Int.random(in: 0...10)))
        }
        say(n > 0 ? "squeaky clean!" : "fresh and clean!")
        giveXP(2 + n)
    }

    func medicine() {
        if asleepCheck() || busy() { return }
        if !st.sick { say("but i'm not sick!"); return }
        st.sick = false; st.cookies_recent = 0
        st.fun = clamp(st.fun - 5)
        food = (pill, 3)
        action = ("eat", now() + 2.0)
        say("yuck! …but better.")
        giveXP(2)
    }

    // MARK: Eingabe (drei Tasten: ◀ · ● · ▶)

    func press(_ b: Btn) {
        switch mode {
        case .pet:
            switch b {
            case .left: menuIndex = (menuIndex + menu.count - 1) % menu.count; labelUntil = now() + 2
            case .right: menuIndex = (menuIndex + 1) % menu.count; labelUntil = now() + 2
            case .ok: barPressedUntil = now() + 0.18; activate(menu[menuIndex].id)
            case .back: if inPlayMenu { inPlayMenu = false; menuIndex = 2 }
            }
        case .settings:
            switch b {
            case .left: settingsRow = (settingsRow + 2) % 3
            case .right: settingsRow = (settingsRow + 1) % 3
            case .ok:
                if settingsRow == 0 {
                    backdrop = (backdrop + 1) % backdropNames.count
                    UserDefaults.standard.set(backdrop, forKey: "backdrop")
                } else if settingsRow == 1 { onPinToggle?() } else { mode = .pet }
            case .back: mode = .pet
            }
        case .countdown:
            if b == .back { mode = .pet }
        case .ball:
            switch b {
            case .left: leftHeld = true
            case .right: rightHeld = true
            case .ok: if jumpY == 0 { jumpV = -70 }
            case .back: aborted = true; endGame()
            }
        case .walk:
            switch b {
            case .left: command(0)
            case .ok: command(1)
            case .right: command(2)
            case .back: aborted = true; endGame()
            }
        case .result:
            if now() - modeStart > 0.8 { leaveResult() }
        }
    }

    func release(_ b: Btn) {
        if b == .left { leftHeld = false }
        if b == .right { rightHeld = false }
    }

    func activate(_ id: String) {
        switch id {
        case "feed": feed(cookie: false)
        case "snack": feed(cookie: true)
        case "play":
            if asleepCheck() { return }
            inPlayMenu = true; menuIndex = 1; labelUntil = now() + 2
        case "clean": cleanUp()
        case "medic": medicine()
        case "light": toggleSleep()
        case "setup": mode = .settings; settingsRow = 0
        case "back": inPlayMenu = false; menuIndex = 2
        case "ball": startGame(.ball)
        case "walk": startGame(.walk)
        default: break
        }
    }

    /// Tastatur-Kürzel (auch für den Testmodus)
    func key(_ c: String) {
        switch c {
        case "a": press(.left); release(.left)
        case "d": press(.right); release(.right)
        case "w", "\r": press(.ok)
        case "x": press(.back)
        case " ": if mode == .pet { pet() } else { press(.ok) }
        case "t": onPinToggle?()
        case "q": if mode == .pet || mode == .settings { quitRequested = true } else { press(.back) }
        default: break
        }
    }

    // MARK: Minispiele

    func startGame(_ g: Minigame) {
        if st.sleeping { say("grmpf… i'm sleeping!"); return }
        if st.sick { say("too sick to play…"); return }
        if st.energy < 15 { say("too tired… *yawn*"); return }
        minigame = g
        inPlayMenu = false; menuIndex = 2
        mode = .countdown; modeStart = now(); flash = 3
        score = 0; lives = 3; aborted = false; leftHeld = false; rightHeld = false
        sayUntil = 0
        if g == .ball {
            gx = Double(FW / 2 - 11); jumpY = 0; jumpV = 0
            bx = Double(FW / 2); by = 8; bvx = 8; bvy = 0; ballWait = 0
        } else {
            scroll = 0; walkT = 0; events = []; nextEvent = 2.5; pose = "A"; poseUntil = 0
            good = 0; total = 0; shake = 0
        }
    }

    func updateBall(_ dt: Double) {
        let r = 5.5
        if leftHeld { gx -= 58 * dt; facing = -1 }
        if rightHeld { gx += 58 * dt; facing = 1 }
        gx = max(0, min(gx, Double(FW - 22)))
        if jumpV != 0 || jumpY < 0 {
            jumpV += 300 * dt; jumpY += jumpV * dt
            if jumpY >= 0 { jumpY = 0; jumpV = 0 }
        }
        spin += dt * 7
        if gameFlash > 0 { gameFlash -= 1 }
        if ballWait > 0 {
            ballWait -= dt
            if ballWait <= 0 { bx = gx + 11; by = 8; bvx = Double.random(in: -14...14); bvy = 0 }
            return
        }
        let grav = 95 + Double(min(score, 40)) * 2.2
        bvy += grav * dt
        bx += bvx * dt; by += bvy * dt
        if bx < r { bx = r; bvx = abs(bvx) }
        if bx > Double(FW) - r { bx = Double(FW) - r; bvx = -abs(bvx) }
        if by < r { by = r; bvy = abs(bvy) }
        let top = Double(GAME_FLOOR - 21) + jumpY
        if bvy > 0 && by + r >= top && by + r <= top + 9 && bx >= gx - 3 && bx <= gx + 25 {
            by = top - r
            let rel = (bx - (gx + 11)) / 13
            bvx = max(-55, min(55, bvx * 0.35 + rel * 48))
            bvy = -(82 + Double(min(score, 30)) * 1.2) * (jumpY < -1 ? 1.18 : 1)
            score += 1
            if score >= 20 { unlock("score_20") }
            if score >= 50 { unlock("score_50") }
        }
        if by + r >= Double(GAME_FLOOR + 1) {
            lives -= 1; gameFlash = 4; ballWait = 1.0; by = Double(GAME_FLOOR) - r
            if lives <= 0 { endGame() }
        }
    }

    func walkScreenX(_ e: WalkEvent) -> Double { e.x - scroll - (e.kind == 3 ? e.walk : 0) }

    func updateWalk(_ dt: Double) {
        let t = now()
        walkT += dt
        if shake > 0 { shake -= 1 }
        let posing = t < poseUntil
        if !posing {
            pose = "A"
            let speed = 15 + walkT * 0.12
            scroll += speed * dt
            stepAcc += speed * dt
            if stepAcc > 4 { stepAcc = 0; walkFrame ^= 1 }
        }
        for i in events.indices where events[i].kind == 3 && !events[i].failed { events[i].walk += 12 * dt }
        if walkT >= nextEvent && walkT < 48 {
            let kind = [0, 1, 2, 2, 3, 3].randomElement()!
            events.append(WalkEvent(x: scroll + Double(FW) + 10, kind: kind))
            total += 1
            nextEvent = walkT + Double.random(in: 3.6...5.2)
        }
        let mouth = Double(DOG_X_WALK + 40)
        for i in events.indices where !events[i].resolved && !events[i].failed {
            if walkScreenX(events[i]) < mouth - 6 { failEvent(i) }
        }
        events.removeAll { walkScreenX($0) < -40 }
        if walkT >= 50 && events.allSatisfy({ $0.resolved || $0.failed || walkScreenX($0) < 0 }) { endGame() }
    }

    func activeEvent() -> Int? {
        let mouth = Double(DOG_X_WALK + 40)
        return events.indices.first { i in
            let e = events[i]; let sx = walkScreenX(e)
            return !e.resolved && !e.failed && sx < mouth + 34 && sx > mouth - 8
        }
    }

    /// 0 = leave it, 1 = sit, 2 = down
    func command(_ c: Int) {
        let words = ["leave it!", "sit!", "down!"]
        guard let i = activeEvent() else {
            if c == 0 { say("leave what?", 1.5) } else { pose = c == 1 ? "sit" : "down"; poseUntil = now() + 0.9; say("…okay?", 1.2) }
            return
        }
        let want = events[i].kind <= 1 ? 0 : (events[i].kind == 2 ? 1 : 2)
        if c == want {
            events[i].resolved = true; good += 1
            if c == 1 { pose = "sit"; poseUntil = now() + 1.6 }
            if c == 2 { pose = "down"; poseUntil = now() + 1.8 }
            say(["good dog!", "\(words[c]) – yes!", "perfect.", "such a good moof!"].randomElement()!, 1.6)
            score += 1
        } else {
            say("huh? \(words[c])…?", 1.4)
            score = max(0, score - 1)
        }
    }

    func failEvent(_ i: Int) {
        events[i].failed = true
        switch events[i].kind {
        case 0, 1:
            say("*munch* …ew. that was trash.", 2.2)
            st.clean = clamp(st.clean - 10); st.cookies_recent += 1
        case 2:
            say("moof ran across on red!", 2.2); shake = 6
        default:
            say("WOOF! moof chased the cat!", 2.2); shake = 8
        }
    }

    func endGame() {
        let wasWalk = mode == .walk || minigame == .walk
        if mode == .countdown { mode = .pet; return }
        if wasWalk {
            let perfect = good == total && total >= 6
            st.walks = (st.walks ?? 0) + 1
            st.walk_best = max(st.walk_best ?? 0, good)
            if perfect { unlock("walk_perfect") }
            if (st.walks ?? 0) >= 10 { unlock("walk_10") }
            st.fun = clamp(st.fun + 15 + Double(good) * 3)
            st.energy = clamp(st.energy - 15)
            st.hunger = clamp(st.hunger - 8)
            giveXP(5 + good * 2)
            resultText = aborted ? "walk cut short. \(good)/\(total) good."
                : "walk done! \(good)/\(total) good. " + (perfect ? "good dog!" : (good * 2 >= total ? "nice!" : "keep training."))
        } else {
            let record = score > st.highscore
            st.highscore = max(st.highscore, score)
            st.fun = clamp(st.fun + 15 + min(35, Double(score) * 1.5))
            st.energy = clamp(st.energy - 12)
            st.hunger = clamp(st.hunger - 6)
            giveXP(5 + score)
            resultText = "\(score) bounce\(score == 1 ? "" : "s")" + (record && score > 0 ? " · new record!" : "")
                + (lives <= 0 ? " the ball got away." : "")
        }
        mode = .result; modeStart = now(); flash = 3; sayUntil = 0; gameFlash = 0
    }

    func leaveResult() {
        mode = .pet; flash = 3
        say(score >= 8 ? "that was great!" : "again?", 3)
        action = ("happy", now() + 1.5)
        hearts(3)
        lastStep = now()
    }

    // MARK: Szenen

    func scene() -> Grid {
        switch mode {
        case .pet, .settings: return petScene()
        case .walk: return walkScene()
        case .countdown: return minigame == .walk ? walkScene() : ballScene()
        case .ball: return ballScene()
        case .result: return resultScene()
        }
    }

    func petScene() -> Grid {
        var c = Grid(COLS, ROWS)
        let ground = HOME_GROUND
        let night = isNight()
        drawBackdrop(&c, backdrop, bottom: ground * 2)
        c.hline(0, COLS - 1, ground)
        c.dither(ground + 2, ROWS - 1)
        if night {
            c.blit(moon, COLS - 10, 1)
            let stars = [(3, 2), (9, 5), (16, 1), (22, 4), (29, 2), (34, 6), (12, 7)]
            for (i, s) in stars.enumerated() where (tick / 5 + i * 3) % 11 != 0 { c.set(s.0, s.1) }
        } else {
            c.blit(sun, COLS - 10, 1)
        }
        c.blitFine(clouds[5], Int(cloudX) - 20, 4, ink: T2)
        c.blitFine(clouds[7], Int(cloudX2) - 20, 16, ink: T2)
        // kleine Pflanzen am Boden
        c.blitFine(plants[0], 2, ground * 2 - 6, ink: T3)
        c.blitFine(plants[1], 70, ground * 2 - 5, ink: T3)
        // Druckerhaus nachts
        let houseX = FW - printerHouse[0].count - 1, houseY = ground * 2 + 1 - printerHouse.count
        if night { c.blitFine(printerHouse, houseX, houseY) }
        for (i, seed) in st.poops.enumerated() {
            let px = (2 + (seed * 7 + i * 13) % (COLS - 10)) * 2
            c.blitFine(poopPile, px, ground * 2 + 1 - poopPile.count)
            // Duftlinien, leicht wabernd
            let ph = (tick / 4 + i) % 2
            for (k, sx) in [3, 7].enumerated() {
                for y in 0..<4 { c.setF(px + sx + ((y + ph + k) % 2), ground * 2 - poopPile.count - 2 - y, T2) }
            }
        }
        let mx = Int(x)
        var my: Int
        if st.sleeping && night {
            // Moof schläft im Drucker: geschlossene Augen in der Tür
            for (ex, ey) in [(15, 27), (16, 27), (19, 27), (20, 27)] { c.setF(houseX + ex, houseY + ey, WHITE) }
            moofBox = (houseX / 2, houseY / 2, printerHouse[0].count / 2, printerHouse.count / 2)
        } else if st.sleeping {
            my = ground - MOOF_SLEEP_H + 1
            c.blitFine(moofSprite("sleep", eyesClosed: true, chew: false), mx * 2, my * 2, flipped: facing < 0)
            moofBox = (mx, my, MOOF_W, MOOF_SLEEP_H)
        } else {
            let eating = busy() && action?.name == "eat"
            let closed = blink > 0 || (busy() && action?.name == "happy")
            let legs = (target != nil && walkFrame == 1) ? "B" : "A"
            my = ground - MOOF_H + 1 - hop
            c.blitFine(moofSprite(legs, eyesClosed: closed, chew: eating && tick % 4 < 2), mx * 2, my * 2, flipped: facing < 0)
            moofBox = (mx, my, MOOF_W, MOOF_H)
        }
        if let f = food, f.stage > 0 {
            let fh = max(1, f.sprite.count * f.stage / 3)
            let fx = mx + (facing > 0 ? MOOF_W - 2 : -f.sprite[0].count + 2)
            c.blit(Array(f.sprite.suffix(fh)), fx, ground - fh + 1)
        }
        for p in particles { c.blit(p.sprite, Int(p.x), Int(p.y)) }
        return c
    }

    func ballScene() -> Grid {
        var c = Grid(COLS, ROWS)
        drawBackdrop(&c, backdrop, bottom: GAME_FLOOR + 1)
        c.hlineF(GAME_FLOOR + 1)
        for y in stride(from: GAME_FLOOR + 3, to: FH, by: 2) { for x in 0..<FW where (x + y / 2) % 2 == 0 { c.setF(x, y) } }
        let moving = (leftHeld || rightHeld) && (tick / 3) % 2 == 0
        c.blitFine(moving ? miniMoofB : miniMoof, Int(gx), GAME_FLOOR - 21 + Int(jumpY), flipped: facing < 0)
        if ballWait <= 0 || tick % 4 < 2 { c.beachball(bx, by, 5.5, spin) }
        return c
    }

    func walkScene() -> Grid {
        var c = Grid(COLS, ROWS)
        let horizon = 40, meadow = 50, path = 57
        // ferne Hügel
        for x in 0..<FW {
            let wx = Double(x) + scroll * 0.25
            let top = horizon + Int(3 * sin(wx / 17) + 2 * sin(wx / 7))
            for y in top..<meadow where (x + y) % 2 == 0 { c.setF(x, y, T1) }
            c.setF(x, top, T2)
        }
        // kleine Bäume in der Ferne
        let farIdx = [4, 8, 10, 0, 9, 7]
        let farOff = scroll * 0.5
        var k = Int(floor(farOff / 19)) - 1
        while Double(k) * 19 - farOff < Double(FW) {
            let spr = plants[farIdx[((k % farIdx.count) + farIdx.count) % farIdx.count]]
            c.blitFine(spr, Int(Double(k) * 19 - farOff), meadow - spr.count + 1, ink: T2)
            k += 1
        }
        // Wiese
        for y in meadow..<path { for x in 0..<FW where (x + y) % 2 == 0 || y % 3 == 0 { c.setF(x, y, T1) } }
        // große Bäume + Büsche
        let bigIdx = [7, 4, 10, 9, 8, 15]
        var j = Int(floor(scroll / 53)) - 1
        while Double(j) * 53 - scroll < Double(FW) {
            let spr = plants[bigIdx[((j % bigIdx.count) + bigIdx.count) % bigIdx.count]]
            let sx = Int(Double(j) * 53 - scroll)
            c.blitFine(spr, sx, path - spr.count * 2, scale: 2)
            c.blitFine(plants[1], sx + 30, path - 6, ink: T3)
            j += 1
        }
        // Weg
        for y in path..<(GAME_FLOOR + 1) {
            for x in 0..<FW { c.setF(x, y, PAPER) }
            for x in 0..<FW where (x * 7 + y * 13 + Int(scroll)) % 23 == 0 { c.setF(x, y, T1) }
        }
        c.hlineF(path, T3)
        c.hlineF(GAME_FLOOR + 1)
        for y in stride(from: GAME_FLOOR + 3, to: FH, by: 2) { for x in 0..<FW where (x + y / 2) % 2 == 0 { c.setF(x, y, T2) } }
        // Ereignisse
        for e in events {
            let sx = Int(walkScreenX(e))
            switch e.kind {
            case 0, 1:
                if e.failed { continue }
                let s = e.kind == 0 ? junkBone : junkCan
                c.blitFine(s, sx, GAME_FLOOR - s.count + 1)
            case 2:
                let s = e.resolved ? trafficGreen : trafficRed
                c.blitFine(s, sx + 6, GAME_FLOOR - s.count - 2)
            default:
                let s = (tick / 4) % 2 == 0 ? catA : catB
                c.blitFine(s, sx, GAME_FLOOR - s.count + 1)
            }
        }
        // Moof
        let dx = DOG_X_WALK + (shake > 0 ? (shake % 2 == 0 ? 2 : -2) : 0)
        let spr: [String]
        if pose == "sit" { spr = moofSprite("sit", eyesClosed: false, chew: false) }
        else if pose == "down" { spr = moofSprite("down", eyesClosed: false, chew: false) }
        else { spr = moofSprite(walkFrame == 1 ? "B" : "A", eyesClosed: false, chew: false) }
        c.blitFine(spr, dx, GAME_FLOOR - spr.count + 1)
        // Aufmerksamkeit: "!" über dem Kopf
        if activeEvent() != nil && tick % 6 < 4 {
            for y in 0..<5 { c.setF(dx + 38, 12 + y) }
            c.setF(dx + 38, 18)
        }
        return c
    }

    func resultScene() -> Grid {
        var c = Grid(COLS, ROWS)
        drawBackdrop(&c, backdrop, bottom: GAME_FLOOR + 1)
        c.hlineF(GAME_FLOOR + 1)
        if minigame == .ball {
            c.beachball(Double(FW / 2), 40, 9, spin)
        } else {
            let s = moofSprite("sit", eyesClosed: tick % 40 < 2, chew: false)
            c.blitFine(s, (FW - s[0].count) / 2, GAME_FLOOR - s.count + 1)
        }
        return c
    }

    // MARK: Texte fürs LCD

    func headerRight() -> String {
        switch mode {
        case .ball, .countdown where minigame == .ball:
            return "\(score)  " + String(repeating: "♥", count: max(0, lives)) + String(repeating: "♡", count: 3 - max(0, lives))
        case .walk, .countdown:
            return "\(good)/\(total) good  \(max(0, 50 - Int(walkT)))s"
        case .settings: return "settings"
        case .result: return minigame == .ball ? "beach ball" : "walk"
        case .pet:
            return now() < labelUntil ? menu[menuIndex].label : moodLabel()
        }
    }

    func bubbleText() -> String {
        let t = now()
        if t < toastUntil { return toastText }
        switch mode {
        case .countdown:
            let n = Int(t - modeStart)
            let hint = minigame == .ball ? "keep the beach ball up!" : "◀ leave it · ● sit · ▶ down"
            return ["3 …", "2 …", "1 …"][min(n, 2)] + "  " + hint
        case .result: return resultText
        case .settings: return ""
        default: return t < sayUntil ? sayText : ""
        }
    }

    /// Hinweise für die Tastenleiste (statt Symbolen)
    func barHints() -> [String]? {
        switch mode {
        case .settings: return ["◀ up", "● change", "down ▶"]
        case .ball, .countdown where minigame == .ball: return ["◀ left", "● jump", "right ▶"]
        case .walk, .countdown: return ["◀ leave it", "● sit", "down ▶"]
        case .result: return ["", "● continue", ""]
        case .pet: return nil
        }
    }

    func itemEnabled(_ id: String) -> Bool {
        switch id {
        case "medic": return st.sick
        case "clean": return true
        case "light", "setup", "back": return true
        default: return !st.sleeping
        }
    }
}

// MARK: - Darstellung: MG-1

// LCD-Symbole für die Werte (5×5)
let statIcons: [[String]] = [
    ["#.#.#", "#.#.#", "#####", "..#..", "..#.."],   // hunger
    [".#.#.", "#####", "#####", ".###.", "..#.."],   // spaß
    ["...##", "..##.", ".####", ".##..", "##..."],   // energie
    ["..#..", ".###.", "#####", "#####", ".###."],   // hygiene
]

struct Bits { let w: Int; let h: Int; let on: [Bool] }

/// Rastert Text 1-Bit (ohne Kantenglättung) – Geneva 9 wie im alten System.
@MainActor var textCache: [String: Bits] = [:]
@MainActor func rasterize(_ s: String, bold: Bool = false) -> Bits {
    let key = (bold ? "b|" : "r|") + s
    if let b = textCache[key] { return b }
    if textCache.count > 600 { textCache.removeAll() }
    let font = NSFont(name: "Geneva", size: 9) ?? NSFont.monospacedSystemFont(ofSize: 9, weight: .regular)
    let a = NSAttributedString(string: s, attributes: [.font: font, .foregroundColor: NSColor.white, .kern: bold ? 2.0 : 1.0])
    let w = max(1, Int(ceil(a.size().width)) + 1), h = max(1, Int(ceil(a.size().height)))
    var on = [Bool](repeating: false, count: w * h)
    if let ctx = CGContext(data: nil, width: w, height: h, bitsPerComponent: 8, bytesPerRow: w,
                           space: CGColorSpaceCreateDeviceGray(), bitmapInfo: 0) {
        ctx.setShouldAntialias(false); ctx.setAllowsAntialiasing(false); ctx.setShouldSmoothFonts(false)
        NSGraphicsContext.saveGraphicsState()
        NSGraphicsContext.current = NSGraphicsContext(cgContext: ctx, flipped: false)
        a.draw(at: .zero)
        NSGraphicsContext.restoreGraphicsState()
        if let d = ctx.data?.assumingMemoryBound(to: UInt8.self) {
            for i in 0..<(w * h) { on[i] = d[i] > 127 }
        }
    }
    let b = Bits(w: w, h: h, on: on)
    textCache[key] = b
    return b
}

func hex(_ v: UInt32, _ a: CGFloat = 1) -> NSColor {
    NSColor(srgbRed: CGFloat((v >> 16) & 0xFF) / 255, green: CGFloat((v >> 8) & 0xFF) / 255,
            blue: CGFloat(v & 0xFF) / 255, alpha: a)
}

let rainbow = [hex(0x009DDC), hex(0x963D97), hex(0xE03A3E), hex(0xF5821F), hex(0xFDB827), hex(0x61BB46), hex(0xF7F7F0)]

struct Palette {
    let body0, body1, print, dim, accent, brandDot, bezel, bezelPrint, lcd0, lcd1, px: NSColor
    let caps: [NSColor]          // schwarz, orange, grau
    let recess: NSColor, rimLight: CGFloat
    static let dark = Palette(
        body0: hex(0x333335), body1: hex(0x232325), print: hex(0xE8E6E0), dim: hex(0x85847F),
        accent: hex(0xFF5A1F), brandDot: hex(0xB5F01E), bezel: hex(0x111112), bezelPrint: hex(0x8A8A86),
        lcd0: hex(0xC6CAB6), lcd1: hex(0xB4B8A3), px: hex(0x1C2018),
        caps: [hex(0x1A1A1B), hex(0xFF5A1F), hex(0x6E6E73)],
        recess: hex(0x000000, 0.45), rimLight: 0.1)
    static let light = Palette(
        body0: hex(0xF0EFEA), body1: hex(0xDDDBD4), print: hex(0x262624), dim: hex(0x8E8C85),
        accent: hex(0xFF5A1F), brandDot: hex(0x8CC800), bezel: hex(0x1A1A1B), bezelPrint: hex(0x8A8A86),
        lcd0: hex(0xCBCEBD), lcd1: hex(0xB8BCA8), px: hex(0x1C2018),
        caps: [hex(0x232325), hex(0xFF5A1F), hex(0x8E8E93)],
        recess: hex(0x000000, 0.14), rimLight: 0.75)
}

struct HWKey { let letter: String; let glyph: String; let cap: Int; let btn: Btn }
let hwKeys: [HWKey] = [
    HWKey(letter: "A", glyph: "◀", cap: 0, btn: .left),
    HWKey(letter: "W", glyph: "●", cap: 1, btn: .ok),
    HWKey(letter: "D", glyph: "▶", cap: 2, btn: .right),
]

@MainActor
final class MoofView: NSView {
    let game: Game
    static let bodySize = NSSize(width: 432, height: 600)
    static let size = NSSize(width: 440, height: 600)

    let pitch: CGFloat = 7                          // logisch
    let fp: CGFloat = 1.75, fdot: CGFloat = 1.42    // Text-Punkte

    // Layout
    var bodyRect: NSRect { NSRect(origin: .zero, size: MoofView.bodySize) }
    let bezelRect = NSRect(x: 24, y: 70, width: 384, height: 400)
    var glassRect: NSRect { NSRect(x: bezelRect.minX + 14, y: bezelRect.minY + 22, width: bezelRect.width - 28, height: 364) }
    var matrixOrigin: NSPoint { NSPoint(x: glassRect.minX + 10, y: glassRect.minY + 44) }
    var barRect: NSRect { NSRect(x: glassRect.minX + 10, y: matrixOrigin.y + 252 + 8, width: 336, height: 50) }
    func keyCenter(_ i: Int) -> NSPoint { NSPoint(x: 236 + 68 * CGFloat(i), y: bezelRect.maxY + 62) }
    let pwrRect = NSRect(x: 428, y: 152, width: 10, height: 38)   // Seitentaste (Klickfläche)

    var holdKey: Int? = nil, pressedKey: Int? = nil, pressedUntil = 0.0
    var pinned = false { didSet { game.pinned = pinned } }
    var poweringOff = false, powerOffAt = 0.0, pwrDown = false
    var grain: (dark: Bool, image: NSImage)?

    init(game: Game) {
        self.game = game
        super.init(frame: NSRect(origin: .zero, size: MoofView.size))
    }
    required init?(coder: NSCoder) { fatalError() }

    override var isFlipped: Bool { true }
    override var acceptsFirstResponder: Bool { true }
    override func acceptsFirstMouse(for event: NSEvent?) -> Bool { true }

    var isDark: Bool { effectiveAppearance.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua }
    var pal: Palette { isDark ? .dark : .light }
    override func viewDidChangeEffectiveAppearance() { grain = nil; needsDisplay = true }

    // MARK: Druck auf dem Gehäuse

    @discardableResult
    func printText(_ s: String, _ x: CGFloat, _ y: CGFloat, size: CGFloat = 7.5, weight: NSFont.Weight = .semibold,
                   color: NSColor, kern: CGFloat = 1.1, mono: Bool = false, align: Int = 0, measure: Bool = false) -> CGFloat {
        let font = mono ? NSFont.monospacedSystemFont(ofSize: size, weight: weight) : NSFont.systemFont(ofSize: size, weight: weight)
        let a = NSAttributedString(string: s, attributes: [.font: font, .foregroundColor: color, .kern: kern])
        let w = a.size().width - kern
        if !measure {
            let dx = align == 0 ? 0 : (align == 1 ? -w / 2 : -w)
            a.draw(at: NSPoint(x: x + dx, y: y))
        }
        return w
    }

    func grainImage() -> NSImage {
        if let g = grain, g.dark == isDark { return g.image }
        let dark = isDark
        let img = NSImage(size: bounds.size, flipped: true) { r in
            var gen = SystemRandomNumberGenerator()
            for _ in 0..<9000 {
                (Bool.random(using: &gen) ? NSColor.white : NSColor.black)
                    .withAlphaComponent(CGFloat.random(in: 0.02...(dark ? 0.05 : 0.05), using: &gen)).setFill()
                NSRect(x: CGFloat.random(in: 0..<r.width, using: &gen), y: CGFloat.random(in: 0..<r.height, using: &gen),
                       width: 0.6, height: 0.6).fill()
            }
            return true
        }
        grain = (isDark, img)
        return img
    }

    // MARK: Zeichnen

    override func draw(_ dirtyRect: NSRect) {
        guard let ctx = NSGraphicsContext.current?.cgContext else { return }
        let p = pal
        NSColor.clear.setFill(); bounds.fill()
        drawPowerButton(p)
        drawBody(p)
        drawBezel(p)
        drawLCD(ctx, p)
        for i in hwKeys.indices { drawKey(p, i) }
        drawBrand(p)
    }

    func drawBody(_ p: Palette) {
        let r = bodyRect.insetBy(dx: 1, dy: 1)
        let body = NSBezierPath(roundedRect: r, xRadius: 30, yRadius: 30)
        NSGradient(starting: p.body0, ending: p.body1)?.draw(in: body, angle: 90)
        NSGraphicsContext.saveGraphicsState()
        body.addClip()
        grainImage().draw(in: bounds)
        NSGradient(colors: [NSColor.white.withAlphaComponent(isDark ? 0.05 : 0.35), .clear])?
            .draw(in: NSRect(x: 0, y: 0, width: bodyRect.width, height: 80), angle: 90)
        NSGraphicsContext.restoreGraphicsState()
        NSColor.white.withAlphaComponent(p.rimLight).setStroke()
        let rim = NSBezierPath(roundedRect: r.insetBy(dx: 1, dy: 1), xRadius: 29, yRadius: 29)
        rim.lineWidth = 1; rim.stroke()
        NSColor.black.withAlphaComponent(isDark ? 0.7 : 0.22).setStroke()
        body.lineWidth = 1; body.stroke()

        for (sx, sy) in [(18.0, 18.0), (bodyRect.width - 18, 18.0), (18.0, bodyRect.height - 18), (bodyRect.width - 18, bodyRect.height - 18)] {
            drawScrew(CGFloat(sx), CGFloat(sy), p)
        }
        // Lautsprecher oben rechts
        let gx0 = bodyRect.width - 120, gy0: CGFloat = 26
        for row in 0..<6 {
            for col in 0..<13 {
                let cx = gx0 + CGFloat(col) * 6.4, cy = gy0 + CGFloat(row) * 6.4
                NSColor.white.withAlphaComponent(isDark ? 0.06 : 0.7).setFill()
                NSBezierPath(ovalIn: NSRect(x: cx - 1.4, y: cy - 0.9, width: 2.8, height: 2.8)).fill()
                NSColor.black.withAlphaComponent(isDark ? 0.8 : 0.42).setFill()
                NSBezierPath(ovalIn: NSRect(x: cx - 1.4, y: cy - 1.4, width: 2.8, height: 2.8)).fill()
            }
        }
        // PWR-Beschriftung + LED an der Seite
        let attention = game.st.sick || [game.st.hunger, game.st.fun, game.st.energy, game.st.clean].min()! < 25
        let ledOn = !poweringOff && (!attention || (game.tick / 6) % 2 == 0)
        let led = NSRect(x: bodyRect.maxX - 15, y: pwrRect.midY - 2.5, width: 5, height: 5)   // mittig zur Taste
        if ledOn {
            NSGraphicsContext.saveGraphicsState()
            let g = NSShadow(); g.shadowOffset = .zero; g.shadowBlurRadius = 5; g.shadowColor = p.accent; g.set()
            p.accent.setFill(); NSBezierPath(ovalIn: led).fill()
            NSGraphicsContext.restoreGraphicsState()
        } else {
            hex(0x3A2A22).setFill(); NSBezierPath(ovalIn: led).fill()
        }
        NSGraphicsContext.saveGraphicsState()
        let t = NSAffineTransform()
        t.translateX(by: led.midX, yBy: pwrRect.maxY + 14)   // gleiche Achse wie die LED
        t.rotate(byDegrees: 90)
        t.concat()
        let lh = NSFont.systemFont(ofSize: 6, weight: .bold)
        printText("PWR", 0, -(lh.ascender - lh.descender) / 2 - 0.65, size: 6, weight: .bold, color: p.dim, kern: 1.6, align: 1)
        NSGraphicsContext.restoreGraphicsState()
    }

    /// Seitentaste wie beim Smartphone: ragt aus der Kante, wandert beim Drücken hinein
    func drawPowerButton(_ p: Palette) {
        let down = pwrDown || poweringOff
        let out: CGFloat = down ? 1.5 : 3.4
        let r = NSRect(x: bodyRect.maxX - 6, y: pwrRect.minY, width: 6 + out, height: pwrRect.height)
        let b = NSBezierPath(roundedRect: r, xRadius: 2.6, yRadius: 2.6)
        NSGraphicsContext.saveGraphicsState()
        let sh = NSShadow(); sh.shadowOffset = NSSize(width: 0.5, height: -1); sh.shadowBlurRadius = 1.5
        sh.shadowColor = NSColor.black.withAlphaComponent(0.45); sh.set()
        hex(isDark ? 0x4A4A4E : 0xB8B8BC).setFill(); b.fill()
        NSGraphicsContext.restoreGraphicsState()
        let metal = isDark ? [hex(0x3A3A3D), hex(0x6A6A6F), hex(0x48484C)] : [hex(0xA9A9AD), hex(0xE2E2E5), hex(0xBDBDC1)]
        NSGradient(colors: metal)?.draw(in: b, angle: 0)
        NSColor.white.withAlphaComponent(isDark ? 0.25 : 0.6).setFill()
        NSRect(x: r.minX, y: r.minY + 1.2, width: r.width - 1.5, height: 0.7).fill()
        NSColor.black.withAlphaComponent(0.25).setFill()
        NSRect(x: r.minX, y: r.maxY - 1.6, width: r.width - 1.5, height: 0.7).fill()
    }

    func drawScrew(_ x: CGFloat, _ y: CGFloat, _ p: Palette) {
        p.recess.setFill(); NSBezierPath(ovalIn: NSRect(x: x - 4.5, y: y - 4.5, width: 9, height: 9)).fill()
        let h = NSBezierPath(ovalIn: NSRect(x: x - 3.6, y: y - 3.6, width: 7.2, height: 7.2))
        NSGradient(starting: isDark ? hex(0x5E5E62) : hex(0xF4F4F2), ending: isDark ? hex(0x323235) : hex(0xA9A8A3))?.draw(in: h, angle: 90)
        NSColor.black.withAlphaComponent(0.45).setStroke()
        let t = NSBezierPath()
        for k in 0..<3 {
            let a = CGFloat(k) * .pi / 3 + 0.4
            t.move(to: NSPoint(x: x - cos(a) * 1.8, y: y - sin(a) * 1.8))
            t.line(to: NSPoint(x: x + cos(a) * 1.8, y: y + sin(a) * 1.8))
        }
        t.lineWidth = 0.9; t.stroke()
    }

    func drawBezel(_ p: Palette) {
        let b = NSBezierPath(roundedRect: bezelRect, xRadius: 14, yRadius: 14)
        NSGraphicsContext.saveGraphicsState()
        let sh = NSShadow(); sh.shadowOffset = NSSize(width: 0, height: -1); sh.shadowBlurRadius = 1
        sh.shadowColor = NSColor.white.withAlphaComponent(isDark ? 0.06 : 0.8); sh.set()
        p.bezel.setFill(); b.fill()
        NSGraphicsContext.restoreGraphicsState()
        NSGradient(starting: NSColor.white.withAlphaComponent(0.06), ending: .clear)?.draw(in: b, angle: 90)

        let y = bezelRect.minY + 7.5
        let lw = printText("1-BIT COMPANION", bezelRect.minX + 16, y, size: 6, weight: .bold, color: p.bezelPrint, kern: 1.3)
        let right = "DOT MATRIX WITH STEREO MOOF"
        let rw = printText(right, 0, 0, size: 6, weight: .bold, color: p.bezelPrint, kern: 1.3, measure: true)
        let rx = bezelRect.maxX - 16 - rw
        printText(right, rx, y, size: 6, weight: .bold, color: p.bezelPrint, kern: 1.3)
        let x0 = bezelRect.minX + 16 + lw + 14, x1 = rx - 14
        p.accent.withAlphaComponent(0.9).setFill(); NSRect(x: x0, y: y + 3, width: (x1 - x0) * 0.55, height: 1).fill()
    }

    func drawBrand(_ p: Palette) {
        let y = bezelRect.maxY + 44
        let bw = printText("MG-1", 40, y, size: 20, weight: .heavy, color: p.print, kern: -0.2)
        NSGraphicsContext.saveGraphicsState()
        let g = NSShadow(); g.shadowOffset = .zero; g.shadowBlurRadius = 4; g.shadowColor = p.brandDot.withAlphaComponent(0.8); g.set()
        p.brandDot.setFill(); NSBezierPath(ovalIn: NSRect(x: 40 + bw + 7, y: y + 10, width: 6, height: 6)).fill()
        NSGraphicsContext.restoreGraphicsState()
        printText("MOOFIGOTCHI", 41, y + 28, size: 6.5, weight: .semibold, color: p.dim, kern: 2.2)
    }

    func isPressed(_ i: Int) -> Bool { holdKey == i || (pressedKey == i && now() < pressedUntil) }

    func drawKey(_ p: Palette, _ i: Int) {
        let k = hwKeys[i]
        let c = keyCenter(i)
        let r: CGFloat = 21
        let down = isPressed(i)
        let well = NSBezierPath(ovalIn: NSRect(x: c.x - r - 4, y: c.y - r - 4, width: 2 * r + 8, height: 2 * r + 8))
        p.recess.setFill(); well.fill()
        let dy: CGFloat = down ? 1.4 : 0
        let capR = NSRect(x: c.x - r, y: c.y - r + dy, width: 2 * r, height: 2 * r)
        let cap = NSBezierPath(ovalIn: capR)
        let base = p.caps[k.cap]
        NSGraphicsContext.saveGraphicsState()
        let sh = NSShadow()
        sh.shadowOffset = NSSize(width: 0, height: down ? -0.5 : -2.5)
        sh.shadowBlurRadius = down ? 1.5 : 4
        sh.shadowColor = NSColor.black.withAlphaComponent(isDark ? 0.7 : 0.32); sh.set()
        (down ? base.blended(withFraction: 0.1, of: .black)! : base).setFill(); cap.fill()
        NSGraphicsContext.restoreGraphicsState()
        NSGradient(colors: [NSColor.white.withAlphaComponent(k.cap == 0 ? 0.08 : 0.25), .clear,
                            NSColor.black.withAlphaComponent(0.15)])?.draw(in: cap, angle: 90)
        NSGraphicsContext.saveGraphicsState()
        NSBezierPath(rect: NSRect(x: capR.minX, y: capR.minY, width: capR.width, height: capR.height * 0.45)).addClip()
        NSColor.white.withAlphaComponent(k.cap == 0 ? 0.12 : 0.4).setStroke()
        let hl = NSBezierPath(ovalIn: capR.insetBy(dx: 0.8, dy: 0.8)); hl.lineWidth = 0.8; hl.stroke()
        NSGraphicsContext.restoreGraphicsState()

        let ly = c.y + r + 10
        let lw = printText(k.letter, 0, 0, size: 7, weight: .bold, color: p.dim, kern: 0, measure: true)
        let gw = printText(k.glyph, 0, 0, size: 7, weight: .bold, color: p.accent, kern: 0, measure: true)
        let x0 = c.x - (lw + 3 + gw) / 2
        printText(k.letter, x0, ly, size: 7, weight: .bold, color: p.dim, kern: 0)
        printText(k.glyph, x0 + lw + 3, ly, size: 7, weight: .bold, color: p.accent, kern: 0)
    }

    // MARK: LCD

    func addBits(_ b: Bits, _ x: CGFloat, _ y: CGFloat, _ path: CGMutablePath) {
        for yy in 0..<b.h { for xx in 0..<b.w where b.on[yy * b.w + xx] {
            path.addRect(CGRect(x: x + CGFloat(xx) * fp, y: y + CGFloat(yy) * fp, width: fdot, height: fdot))
        } }
    }

    func wrap(_ s: String, _ maxPx: Int) -> [String] {
        guard !s.isEmpty else { return [] }
        var lines: [String] = [], cur = ""
        for w in s.split(separator: " ") {
            let cand = cur.isEmpty ? String(w) : cur + " " + w
            if !cur.isEmpty && rasterize(cand).w > maxPx { lines.append(cur); cur = String(w) } else { cur = cand }
        }
        if !cur.isEmpty { lines.append(cur) }
        return lines
    }

    func addSprite(_ rows: [String], _ x: CGFloat, _ y: CGFloat, _ pch: CGFloat, _ d: CGFloat, _ path: CGMutablePath) {
        for (ry, row) in rows.enumerated() {
            for (rx, c) in row.enumerated() where c == "#" {
                path.addRect(CGRect(x: x + CGFloat(rx) * pch, y: y + CGFloat(ry) * pch, width: d, height: d))
            }
        }
    }

    func drawLCD(_ ctx: CGContext, _ p: Palette) {
        let g = glassRect
        let glass = NSBezierPath(roundedRect: g, xRadius: 5, yRadius: 5)
        NSGradient(starting: p.lcd0, ending: p.lcd1)?.draw(in: glass, angle: -70)
        let fade: CGFloat = poweringOff ? max(0, 1 - CGFloat(now() - powerOffAt) / 0.35) : 1
        let st = game.st

        let on = CGMutablePath(), ghost = CGMutablePath(), onM = CGMutablePath(), cut = CGMutablePath()
        let tones = (0..<4).map { _ in CGMutablePath() }
        let colors = (0..<7).map { _ in CGMutablePath() }

        // Kopfzeile + Werte
        let hy = g.minY + 9
        addBits(rasterize(st.name.uppercased(), bold: true), g.minX + 10, hy, on)
        let hb = rasterize(game.headerRight())
        addBits(hb, g.maxX - 10 - CGFloat(hb.w) * fp, hy, on)
        let vy = g.minY + 31
        let colW = (g.width - 20) / 4
        for (i, v) in [st.hunger, st.fun, st.energy, st.clean].enumerated() {
            let x = g.minX + 10 + CGFloat(i) * colW
            addSprite(statIcons[i], x, vy, fp, fdot, on)
            let n = Int((v / 12.5).rounded())
            let blinkOff = v < 25 && game.tick % 10 < 5
            for k in 0..<8 {
                let r = CGRect(x: x + 14 + CGFloat(k) * 7.4, y: vy, width: 5.4, height: 5 * fp - 0.3)
                if k < n && !blinkOff { on.addRect(r) } else { ghost.addRect(r) }
            }
        }

        // Szene
        let grid = game.scene()
        let mo = matrixOrigin
        let knock = lcdText(on, cut)
        let fpch = pitch / 2, fd = fpch - 0.45
        for y in 0..<grid.h {
            for x in 0..<grid.w {
                let raw = grid.px[y * grid.w + x]
                let r = CGRect(x: mo.x + CGFloat(x) * fpch, y: mo.y + CGFloat(y) * fpch, width: fd, height: fd)
                if !knock.isEmpty && knock.contains(where: { $0.intersects(r) }) { ghost.addRect(r); continue }
                if game.flash >= 2 { on.addRect(r); onM.addRect(r); continue }
                if game.flash == 1 || (game.mode == .ball && game.gameFlash > 0 && game.gameFlash % 2 == 0) { ghost.addRect(r); continue }
                switch raw {
                case 0: ghost.addRect(r)
                case INK: on.addRect(r); onM.addRect(r)
                case 2...8: colors[Int(raw) - 2].addRect(r); onM.addRect(r)
                default: tones[Int(raw) - 9].addRect(r)
                }
            }
        }

        // Leiste unten
        drawBar(on, ghost, cut, tones[1])

        // Zeichnen: Geister, Tönungen, Schatten, Saum, Tinte, Farben
        ctx.setFillColor(p.px.withAlphaComponent(0.045 * fade).cgColor); ctx.addPath(ghost); ctx.fillPath()
        for (i, a) in [0.14, 0.27, 0.5].enumerated() {
            ctx.setFillColor(p.px.withAlphaComponent(CGFloat(a) * fade).cgColor); ctx.addPath(tones[i]); ctx.fillPath()
        }
        ctx.setFillColor(NSColor.white.withAlphaComponent(0.5 * fade).cgColor); ctx.addPath(tones[3]); ctx.fillPath()
        ctx.saveGState()
        ctx.translateBy(x: 1.1, y: 1.4)
        ctx.setFillColor(p.px.withAlphaComponent(0.15 * fade).cgColor)
        ctx.addPath(on); ctx.fillPath()
        ctx.restoreGState()
        for (dx, col) in [(-0.75, hex(0xE0219C)), (0.75, hex(0x7EDB1E))] {
            ctx.saveGState()
            ctx.translateBy(x: CGFloat(dx), y: 0)
            ctx.setFillColor(col.withAlphaComponent(0.5 * fade).cgColor)
            ctx.addPath(onM); ctx.fillPath()
            ctx.restoreGState()
        }
        ctx.setFillColor(p.px.withAlphaComponent(0.9 * fade).cgColor); ctx.addPath(on); ctx.fillPath()
        ctx.setFillColor(p.lcd0.withAlphaComponent(fade).cgColor); ctx.addPath(cut); ctx.fillPath()
        for (i, path) in colors.enumerated() {
            ctx.setFillColor(rainbow[i].withAlphaComponent(0.95 * fade).cgColor); ctx.addPath(path); ctx.fillPath()
        }


        // Nachts schlafend: Licht aus
        if game.st.sleeping && isNight() {
            NSGraphicsContext.saveGraphicsState(); glass.addClip()
            p.px.withAlphaComponent(0.22).setFill(); g.fill()
            NSGraphicsContext.restoreGraphicsState()
        }

        // Glas: Innenschatten + Reflex
        NSGraphicsContext.saveGraphicsState()
        glass.addClip()
        let frame = NSBezierPath(rect: g.insetBy(dx: -20, dy: -20))
        frame.append(glass.reversed)
        let sh = NSShadow(); sh.shadowOffset = NSSize(width: 0, height: -2); sh.shadowBlurRadius = 6
        sh.shadowColor = NSColor.black.withAlphaComponent(0.55); sh.set()
        NSColor.black.setFill(); frame.fill()
        NSGraphicsContext.restoreGraphicsState()
        NSGraphicsContext.saveGraphicsState()
        glass.addClip()
        let sheen = NSBezierPath()
        sheen.move(to: NSPoint(x: g.minX, y: g.minY))
        sheen.line(to: NSPoint(x: g.minX + g.width * 0.62, y: g.minY))
        sheen.line(to: NSPoint(x: g.minX + g.width * 0.22, y: g.maxY))
        sheen.line(to: NSPoint(x: g.minX, y: g.maxY))
        sheen.close()
        NSGradient(starting: NSColor.white.withAlphaComponent(isDark ? 0.08 : 0.14), ending: NSColor.white.withAlphaComponent(0))?
            .draw(in: sheen, angle: 60)
        NSGraphicsContext.restoreGraphicsState()
    }

    /// Symbolleiste mit Zuständen: normal · ausgewählt (Ecken) · gedrückt (invertiert) · inaktiv (getönt)
    func drawBar(_ on: CGMutablePath, _ ghost: CGMutablePath, _ cut: CGMutablePath, _ dimmed: CGMutablePath) {
        let b = barRect
        let fpch = pitch / 2, fd = fpch - 0.45
        if let hints = game.barHints() {
            let slot = b.width / CGFloat(hints.count)
            for (i, h) in hints.enumerated() where !h.isEmpty {
                let bits = rasterize(h)
                addBits(bits, b.minX + slot * (CGFloat(i) + 0.5) - CGFloat(bits.w) * fp / 2, b.midY - CGFloat(bits.h) * fp / 2, on)
            }
            return
        }
        let items = game.menu
        let slot = b.width / CGFloat(items.count)
        let pressed = now() < game.barPressedUntil
        for (i, it) in items.enumerated() {
            let cx = b.minX + slot * (CGFloat(i) + 0.5)
            let iw = CGFloat(it.icon.map(\.count).max() ?? 0) * fpch, ih = CGFloat(it.icon.count) * fpch
            let ix = (cx - iw / 2 / fpch * fpch).rounded(), iy = (b.midY - ih / 2).rounded()
            let box = CGRect(x: cx - slot / 2 + 3, y: b.minY + 3, width: slot - 6, height: b.height - 6)
            let sel = i == game.menuIndex
            if sel && pressed {
                on.addRect(box)
                addSprite(it.icon, ix, iy, fpch, fd, cut)
            } else {
                addSprite(it.icon, ix, iy, fpch, fd, game.itemEnabled(it.id) ? on : dimmed)
            }
            if sel && !pressed {
                // Ecken-Klammern
                let L: CGFloat = 7, t: CGFloat = 1.8
                for (x0, y0, sx, sy) in [(box.minX, box.minY, 1.0, 1.0), (box.maxX, box.minY, -1.0, 1.0),
                                         (box.minX, box.maxY, 1.0, -1.0), (box.maxX, box.maxY, -1.0, -1.0)] {
                    let hx = sx > 0 ? x0 : x0 - L, vy = sy > 0 ? y0 : y0 - L
                    on.addRect(CGRect(x: hx, y: sy > 0 ? y0 : y0 - t, width: L, height: t))
                    on.addRect(CGRect(x: sx > 0 ? x0 : x0 - t, y: vy, width: t, height: L))
                }
            }
        }
    }

    /// Sprechtext & Einstellungen als LCD-Punkte direkt im Display; liefert die freizustellenden Flächen.
    func lcdText(_ on: CGMutablePath, _ cut: CGMutablePath) -> [CGRect] {
        let mo = matrixOrigin
        var knock: [CGRect] = []
        if game.mode == .settings {
            let rows: [(String, String)] = [
                ("background", "< " + backdropNames[game.backdrop] + " >"),
                ("always on top", game.pinned ? "on" : "off"),
                ("back", ""),
            ]
            let panel = CGRect(x: mo.x + 16, y: mo.y + 36, width: 304, height: CGFloat(rows.count) * 24 + 36)
            knock.append(panel)
            addBits(rasterize("SETTINGS", bold: true), panel.minX + 8, panel.minY + 6, on)
            on.addRect(CGRect(x: panel.minX + 8, y: panel.minY + 27, width: panel.width - 16, height: 1.4))
            for (i, r) in rows.enumerated() {
                let y = panel.minY + 36 + CGFloat(i) * 24
                let sel = i == game.settingsRow
                if sel { on.addRect(CGRect(x: panel.minX + 4, y: y - 3, width: panel.width - 8, height: 22)) }
                addBits(rasterize(r.0), panel.minX + 10, y, sel ? cut : on)
                let vb = rasterize(r.1)
                addBits(vb, panel.maxX - 10 - CGFloat(vb.w) * fp, y, sel ? cut : on)
            }
        }
        let text = game.bubbleText()
        if !text.isEmpty {
            let centered = game.mode == .result || game.mode == .countdown
            for (i, l) in wrap(text, 182).prefix(3).enumerated() {
                let b = rasterize(l), w = CGFloat(b.w) * fp
                let x = centered ? mo.x + (336 - w) / 2 : mo.x + 4
                let y = mo.y + (centered ? 14 : 4) + CGFloat(i) * 18
                addBits(b, x, y, on)
                knock.append(CGRect(x: x - 4, y: y - 2, width: w + 8, height: 19))
            }
        }
        return knock
    }

    // MARK: Eingabe

    func btnFor(_ e: NSEvent) -> Btn? {
        switch e.keyCode {
        case 123, 0: return .left           // ← A
        case 124, 2: return .right          // → D
        case 126, 13, 36, 76: return .ok    // ↑ W ⏎
        case 53: return .back               // esc
        default: return nil
        }
    }

    func index(of b: Btn) -> Int? { hwKeys.firstIndex { $0.btn == b } }

    override func keyDown(with e: NSEvent) {
        if e.modifierFlags.contains(.command) { super.keyDown(with: e); return }
        if let b = btnFor(e) {
            let holdMode = game.mode == .ball
            if e.isARepeat && (holdMode || b == .ok || b == .back) { return }
            if let i = index(of: b) { holdKey = i }
            game.press(b)
        } else if !e.isARepeat, let c = e.charactersIgnoringModifiers?.lowercased(), !c.isEmpty {
            game.key(c)
        }
        needsDisplay = true
        if game.quitRequested { powerOff() }
    }

    override func keyUp(with e: NSEvent) {
        if let b = btnFor(e) {
            game.release(b)
            if let i = index(of: b), holdKey == i { holdKey = nil; pressedKey = i; pressedUntil = now() + 0.05 }
        }
    }

    func keyAt(_ p: NSPoint) -> Int? {
        hwKeys.indices.first { i in let c = keyCenter(i); return hypot(p.x - c.x, p.y - c.y) <= 25 }
    }

    override func mouseDown(with e: NSEvent) {
        let pt = convert(e.locationInWindow, from: nil)
        if pwrRect.insetBy(dx: -6, dy: -4).contains(pt) { pwrDown = true; needsDisplay = true; return }
        if let i = keyAt(pt) {
            holdKey = i
            game.press(hwKeys[i].btn)
            needsDisplay = true
            return
        }
        // Symbol in der Leiste antippen = auswählen + auslösen
        if game.mode == .pet, barRect.contains(pt) {
            let i = Int((pt.x - barRect.minX) / (barRect.width / CGFloat(game.menu.count)))
            if i >= 0 && i < game.menu.count { game.menuIndex = i; game.press(.ok) }
            return
        }
        if game.mode == .result && glassRect.contains(pt) { game.press(.ok); return }
        let mo = matrixOrigin
        let gx = Int(floor((pt.x - mo.x) / pitch)), gy = Int(floor((pt.y - mo.y) / pitch))
        let b = game.moofBox
        if game.mode == .pet && gx >= b.x + 2 && gx < b.x + b.w - 2 && gy >= b.y && gy < b.y + b.h {
            game.pet(); needsDisplay = true
            return
        }
        window?.performDrag(with: e)
    }

    override func mouseUp(with e: NSEvent) {
        if pwrDown {
            pwrDown = false
            if pwrRect.insetBy(dx: -6, dy: -4).contains(convert(e.locationInWindow, from: nil)) { powerOff() }
            needsDisplay = true
            return
        }
        if let i = holdKey {
            game.release(hwKeys[i].btn)
            pressedKey = i; pressedUntil = now() + 0.06
        }
        holdKey = nil
        needsDisplay = true
    }

    func powerOff() {
        guard !poweringOff else { return }
        poweringOff = true; powerOffAt = now()
        game.say("moof… good night.", 2)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) { NSApp.terminate(nil) }
    }

    override func resetCursorRects() {
        for i in hwKeys.indices {
            let c = keyCenter(i)
            addCursorRect(NSRect(x: c.x - 24, y: c.y - 24, width: 48, height: 48), cursor: .pointingHand)
        }
        addCursorRect(pwrRect.insetBy(dx: -6, dy: -4), cursor: .pointingHand)
        addCursorRect(barRect, cursor: .pointingHand)
    }
}

// MARK: - App

func makeIcon() -> NSImage {
    NSImage(size: NSSize(width: 512, height: 512), flipped: true) { _ in
        let body = NSBezierPath(roundedRect: NSRect(x: 76, y: 36, width: 360, height: 440), xRadius: 70, yRadius: 70)
        NSGraphicsContext.saveGraphicsState()
        let sh = NSShadow(); sh.shadowOffset = NSSize(width: 0, height: -10); sh.shadowBlurRadius = 18
        sh.shadowColor = NSColor.black.withAlphaComponent(0.4); sh.set()
        hex(0x2A2A2C).setFill(); body.fill()
        NSGraphicsContext.restoreGraphicsState()
        NSGradient(starting: hex(0x3A3A3D), ending: hex(0x222224))?.draw(in: body, angle: 90)
        hex(0x111112).setFill(); NSBezierPath(roundedRect: NSRect(x: 104, y: 70, width: 304, height: 270), xRadius: 26, yRadius: 26).fill()
        let lcd = NSRect(x: 124, y: 92, width: 264, height: 226)
        NSGradient(starting: hex(0xC6CAB6), ending: hex(0xB4B8A3))?.draw(in: NSBezierPath(roundedRect: lcd, xRadius: 8, yRadius: 8), angle: -70)
        let spr = moofSprite("A", eyesClosed: false, chew: false)
        let p: CGFloat = 4.4, ox = lcd.midX - CGFloat(spr[0].count) * p / 2, oy = lcd.midY - CGFloat(spr.count) * p / 2
        for (y, row) in spr.enumerated() {
            for (x, c) in row.enumerated() {
                guard let v = Grid.value(c, fine: true) else { continue }
                (v == INK ? hex(0x1C2018, 0.9) : rainbow[Int(v) - 2]).setFill()
                NSRect(x: ox + CGFloat(x) * p, y: oy + CGFloat(y) * p, width: p - 0.6, height: p - 0.6).fill()
            }
        }
        for (i, col) in [hex(0x1A1A1B), hex(0xFF5A1F), hex(0x6E6E73)].enumerated() {
            let c = NSPoint(x: 196 + CGFloat(i) * 70, y: 400)
            NSGraphicsContext.saveGraphicsState()
            let s = NSShadow(); s.shadowOffset = NSSize(width: 0, height: -4); s.shadowBlurRadius = 6
            s.shadowColor = NSColor.black.withAlphaComponent(0.5); s.set()
            col.setFill(); NSBezierPath(ovalIn: NSRect(x: c.x - 25, y: c.y - 25, width: 50, height: 50)).fill()
            NSGraphicsContext.restoreGraphicsState()
        }
        return true
    }
}

final class DeviceWindow: NSWindow {
    override var canBecomeKey: Bool { true }
    override var canBecomeMain: Bool { true }
}

@MainActor
final class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    var view: MoofView!
    var game: Game!
    var timer: Timer?
    var pinItem: NSMenuItem!

    func applicationDidFinishLaunching(_ n: Notification) {
        let args = Array(CommandLine.arguments.dropFirst())
        var name = "Moofi"
        if let i = args.firstIndex(of: "--name"), i + 1 < args.count { name = String(args[i + 1].prefix(20)) }

        var isNew = false
        var st: PetState
        if let data = FileManager.default.contents(atPath: savePath),
           let loaded = try? JSONDecoder().decode(PetState.self, from: data) {
            st = loaded
            if CommandLine.arguments.contains("--name") { st.name = name }
        } else {
            st = defaultState(name); isNew = true
        }
        game = Game(st, isNew: isNew)
        game.onPinToggle = { [weak self] in self?.togglePin() }
        game.flash = 5

        buildMenu()
        view = MoofView(game: game)
        window = DeviceWindow(contentRect: NSRect(origin: .zero, size: MoofView.size),
                              styleMask: [.borderless, .miniaturizable], backing: .buffered, defer: false)
        window.title = "Moofigotchi"
        window.isOpaque = false
        window.backgroundColor = .clear
        window.hasShadow = true
        window.isMovableByWindowBackground = true
        window.contentView = view
        window.isReleasedWhenClosed = false
        if !window.setFrameUsingName("MoofigotchiMG1") { window.center() }
        window.setFrameAutosaveName("MoofigotchiMG1")
        window.makeKeyAndOrderFront(nil)
        window.makeFirstResponder(view)
        window.invalidateShadow()
        NSApp.applicationIconImage = makeIcon()
        NSApp.activate(ignoringOtherApps: true)

        let t = Timer(timeInterval: 1.0 / 20, repeats: true) { [weak self] _ in
            MainActor.assumeIsolated { self?.frame() }
        }
        RunLoop.main.add(t, forMode: .common)
        timer = t

        // Testmodus: --snapshot datei.png [--dark|--light] [--keys adwx…]
        if let i = args.firstIndex(of: "--snapshot"), i + 1 < args.count {
            let out = args[i + 1]
            if args.contains("--dark") { NSApp.appearance = NSAppearance(named: .darkAqua) }
            if args.contains("--light") { NSApp.appearance = NSAppearance(named: .aqua) }
            window.setFrameOrigin(NSPoint(x: -3000, y: -3000))
            if let k = args.firstIndex(of: "--keys"), k + 1 < args.count {
                for ch in args[k + 1] { game.key(String(ch)) }
            }
            let wait = Double(ProcessInfo.processInfo.environment["MOOF_WAIT"] ?? "1.5") ?? 1.5
            DispatchQueue.main.asyncAfter(deadline: .now() + wait) {
                MainActor.assumeIsolated {
                    if let k = ProcessInfo.processInfo.environment["MOOF_KEYS2"] { for ch in k { self.game.key(String(ch)) } }
                    let wait2 = Double(ProcessInfo.processInfo.environment["MOOF_WAIT2"] ?? "0") ?? 0
                    DispatchQueue.main.asyncAfter(deadline: .now() + wait2) {
                        MainActor.assumeIsolated {
                            self.view.display()
                            if let rep = self.view.bitmapImageRepForCachingDisplay(in: self.view.bounds) {
                                self.view.cacheDisplay(in: self.view.bounds, to: rep)
                                try? rep.representation(using: .png, properties: [:])?.write(to: URL(fileURLWithPath: out))
                            }
                            exit(0)
                        }
                    }
                }
            }
        }
    }

    func frame() {
        game.step()
        view.needsDisplay = true
        if game.quitRequested { view.powerOff() }
    }

    func buildMenu() {
        let main = NSMenu()
        let appItem = NSMenuItem()
        main.addItem(appItem)
        let m = NSMenu()
        pinItem = NSMenuItem(title: "Always on Top", action: #selector(togglePinAction), keyEquivalent: "t")
        pinItem.target = self
        m.addItem(pinItem)
        m.addItem(.separator())
        m.addItem(withTitle: "Quit Moofigotchi", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        appItem.submenu = m
        let winItem = NSMenuItem()
        main.addItem(winItem)
        let wm = NSMenu(title: "Window")
        let close = NSMenuItem(title: "Power Off", action: #selector(powerOffAction), keyEquivalent: "w")
        close.target = self
        wm.addItem(close)
        let mini = NSMenuItem(title: "Minimize", action: #selector(miniAction), keyEquivalent: "m")
        mini.target = self
        wm.addItem(mini)
        winItem.submenu = wm
        NSApp.mainMenu = main
    }

    @objc func togglePinAction() { togglePin() }
    @objc func powerOffAction() { view.powerOff() }
    @objc func miniAction() { window.miniaturize(nil) }

    func togglePin() {
        let pinned = window.level != .floating
        window.level = pinned ? .floating : .normal
        window.collectionBehavior = pinned ? [.canJoinAllSpaces, .fullScreenAuxiliary] : []
        pinItem.state = pinned ? .on : .off
        view.pinned = pinned
        game.say(pinned ? "i'll stay on top. moof." : "okay, i'll step back.", 2.5)
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ s: NSApplication) -> Bool { true }
    func applicationWillTerminate(_ n: Notification) { game.save() }
}

// Nur eine Instanz gleichzeitig
let lockFD = open(savePath + ".lock", O_CREAT | O_RDWR, 0o644)
if lockFD >= 0 && flock(lockFD, LOCK_EX | LOCK_NB) != 0 {
    print("moof. moofigotchi is already running.")
    exit(0)
}

MainActor.assumeIsolated {
    let app = NSApplication.shared
    let delegate = AppDelegate()
    app.delegate = delegate
    app.setActivationPolicy(.regular)
    withExtendedLifetime(delegate) { app.run() }
}
