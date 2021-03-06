AGSScriptModule        �  // This file is used with the Gabriel Knight-style
// Dialog system, as demonstrated in the AGS Video Tutorials
// on YouTube. (http://www.youtube.com/view_play_list?p=21DB402CB4DAEAEF)
// Author: densming
// Last Modification Date: 2009-04-25

function GKDialogSay(Character *c, const string text) {
  // This function displays the character's speech text in the correct
  // location on the screen.  We want the text to appear to the right of the
  // player character's portrait at the top of the screen, and to the left
  // of the secondary character's portrait at the bottom of the screen.

  int xpos, ypos, width, maxWidth = System.ScreenWidth * 3 / 4;

  if (c == player) {
    // This is the player character...
    
    // The xpos is 1/4 of the way across the screen.
    xpos = System.ScreenWidth / 4;
    // The ypos is at the top of the screen.
    ypos = 0;
    // The width is calculated in a normal way, and we add 7 to it for a buffer.
    width = GetTextWidth(text, eFontFont1) + 7;
    // Make sure the width isn't too large.
    if (width > maxWidth) width = maxWidth;
  }
  else {
    // This is the secondary character...
    
    // The width is calculated in a normal way, and we add 7 to it for a buffer.
    width = GetTextWidth(text, eFontFont1) + 7;
    // The xpos is set so the text is always just to the left of the character's
    // portrait.
    xpos = maxWidth - width;
    // The ypos is 60% of the way down the screen.
    ypos = System.ScreenHeight * 3 / 5;
    // If our xpos ended up less than 0, then our width is too big,
    // so set xpos to 0 and set the width to the maxWidth.
    if (xpos < 0) {
      xpos = 0;
      width = maxWidth;
    }
  }
  
  // Now we just use the SayAt function to have the character say the dialog
  // with the text appearing at the spot we just calculated!
  c.SayAt(xpos, ypos, width, text);
} 8  // This file is used with the Gabriel Knight-style
// Dialog system, as demonstrated in the AGS Video Tutorials
// on YouTube. (http://www.youtube.com/view_play_list?p=21DB402CB4DAEAEF)
// Author: densming
// Last Modification Date: 2009-04-25

import function GKDialogSay(Character *c, const string text); ��g
        ej��