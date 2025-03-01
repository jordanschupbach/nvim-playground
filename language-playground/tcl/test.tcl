# Basic Pong Game in Tcl/Tk
package require Tk

set mainWindow [tk::frame .main]

set width 1200
set height 800

wm geometry . 1200x800
# wm title $mainWindow "Tcl/Tk Pong"

set paddle_width 10
set paddle_height 60
set ball_size 10

# Initialize paddles and ball positions
set paddle1_y [expr {($height - $paddle_height) / 2}]
set paddle2_y [expr {($height - $paddle_height) / 2}]
set ball_x [expr {$width / 2}]
set ball_y [expr {$height / 2}]
set ball_dx 2
set ball_dy 2

# # Create main window and canvas
set canvas [canvas $mainWindow.canvas -width $width -height $height -bg white]
pack $canvas
focus $canvas

# Draw paddles and ball
proc draw {} {
    global paddle1_y paddle2_y ball_x ball_y
    .pong.canvas delete all
    .pong.canvas create rectangle 10 $paddle1_y 20 [expr {$paddle1_y + $paddle_height}] -fill black
    .pong.canvas create rectangle [expr {$width - 20}] $paddle2_y [expr {$width - 10}] [expr {$paddle2_y + $paddle_height}] -fill black
    .pong.canvas create oval $ball_x $ball_y [expr {$ball_x + 10}] [expr {$ball_y + 10}] -fill black
}

# Update ball position
proc update_ball {} {
    global ball_x ball_y ball_dx ball_dy width height paddle1_y paddle2_y paddle_height

    set ball_x [expr {$ball_x + $ball_dx}]
    set ball_y [expr {$ball_y + $ball_dy}]

    # Collision with top and bottom
    if {$ball_y <= 0 || $ball_y >= $height - 10} {
        set ball_dy [expr {-1 * $ball_dy}]
    }

    # Collision with paddles
    if {($ball_x <= 20 && $ball_y > $paddle1_y && $ball_y < $paddle1_y + $paddle_height) ||
        ($ball_x >= $width - 20 && $ball_y > $paddle2_y && $ball_y < $paddle2_y + $paddle_height)} {
        set ball_dx [expr {-1 * $ball_dx}]
    }

    # Reset ball if it goes out of bounds
    if {$ball_x < 0 || $ball_x > $width} {
        set ball_x [expr {$width / 2}]
        set ball_y [expr {$height / 2}]
    }

    draw
    after 20 update_ball
}

# Move paddles
bind $canvas <KeyPress-w> {set paddle1_y [expr {$paddle1_y - 10}]}
bind $canvas <KeyPress-s> {set paddle1_y [expr {$paddle1_y + 10}]}
bind $canvas <KeyPress-Up> {set paddle2_y [expr {$paddle2_y - 10}]}
bind $canvas <KeyPress-Down> {set paddle2_y [expr {$paddle2_y + 10}]}

# Start the game
draw
update_ball
# 
# # Run the application
# wm resizable $w 0 0
