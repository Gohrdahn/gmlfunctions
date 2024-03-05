/// @desc This function executes a normal draw_text_transformed_color() function, but adds functionality for both a background highlight and a drop shadow!

/// @param			{String}				txt_string				The text string to draw.
/// @param			{Constant.GMFont}		font					The desired font to use for the text.	
/// @param			{Array[Real]}			align_params			The desired alignments of the string: [HAlign, VAlign].
/// @param			{Real}					txt_x					The desired x position of the string.
/// @param			{Real}					txt_y					The desired y position of the string.	
/// @param			{Real}					size_mod				The desired size multipliers of both the text string and the drop shadow: [X-Scale, Y-Scale].
/// @param			{Array[Real]}			text_params				The four desired text colors and alpha: [#Color1, #Color2, #Color3, #Color4, Alpha].	
/// @param			{Array[Real]}			back_params				The desired sprite, subimg, color and alpha of the string's background "highlight": [Sprite, Sub-Image, #Color, Alpha].
/// @param			{Bool}					enable_shadow			Should the text cast a shadow?
/// @param			{Array[Real]}			shadow_params			The desired drop shadow colors, alpha and distance from the text [#Color1, #Color2, #Color3, #Color4, Alpha, Distance].
/// @param			{Real}					h_border				The desired number of pixels to add to the background border horizontally.
/// @param			{Real}					v_border				The desired number of pixels to add to the background border vertically.
/// @param			{Real}					offset_x				The desired offset from the desired x position of the string.
/// @param			{Real}					offset_y				The desired offset from the desired x position of the string.

function draw_text_plus(txt_string, font, align_params, txt_x, txt_y, size_mod = [txt_size_one, txt_size_one], text_params = [ #FFFFFF, #FFFFFF, #FFFFFF, #FFFFFF, 1], back_params = [spr_square, 2, #000000, range_convert(175)], enable_shadow = false, shadow_params = [ #000000, #000000, #000000, #000000, 0, 2], h_border = 5, v_border = 5, offset_x = 0, offset_y = 0)
{
	
	var sw = string_width(txt_string);
	var sh = string_height(txt_string);
	
	var sha_diff; // Used to center the text and its shadow better when the shadow is enabled.
	
	if (enable_shadow) {sha_diff = (shadow_params[5] / 2);}
	else			   {sha_diff = 0;}
	
	draw_set_font(font);
	draw_set_halign(align_params[0]);
	draw_set_valign(align_params[1]);
	
	switch (align_params[0])
	{
		case fa_left:
		{
			switch (align_params[1])
			{
				case fa_top:    {draw_sprite_stretched_ext(back_params[0], back_params[1], (txt_x + offset_x) - (h_border / 2), (txt_y + offset_y) - (v_border / 2), (sw * size_mod[0]) + h_border, (sh * size_mod[1]) + v_border, back_params[2], back_params[3]);} break;
				case fa_middle: {draw_sprite_stretched_ext(back_params[0], back_params[1], (txt_x + offset_x) - (h_border / 2), (txt_y + offset_y) - (((sh * size_mod[1]) / 2) + (v_border / 2)), (sw * size_mod[0]) + h_border, (sh * size_mod[1]) + v_border, back_params[2], back_params[3]);} break;
				case fa_bottom: {draw_sprite_stretched_ext(back_params[0], back_params[1], (txt_x + offset_x) - (h_border / 2), (txt_y + offset_y) - ((sh * size_mod[1]) + (v_border / 2)), (sw * size_mod[0]) + h_border, (sh * size_mod[1]) + v_border, back_params[2], back_params[3]);} break;
			}
			
			if (enable_shadow) {draw_text_transformed_color((txt_x + offset_x) + sha_diff, (txt_y + offset_y) + sha_diff, txt_string, (size_mod[0]), (size_mod[1]), 0, shadow_params[0], shadow_params[1], shadow_params[2], shadow_params[3], shadow_params[4]);}
								draw_text_transformed_color((txt_x + offset_x) - sha_diff, (txt_y + offset_y) - sha_diff, txt_string, (size_mod[0]), (size_mod[1]), 0, text_params[0], text_params[1], text_params[2], text_params[3], text_params[4]);
		
		} break;
		
		case fa_center:
		{
			switch (align_params[1])
			{
				case fa_top:    {draw_sprite_stretched_ext(back_params[0], back_params[1], (txt_x - ((sw * size_mod[0]) / 2)) + (offset_x - (h_border / 2)), (txt_y + offset_y) - (v_border / 2), (sw * size_mod[0]) + h_border, (sh * size_mod[1]) + v_border, back_params[2], back_params[3]);} break;
				case fa_middle: {draw_sprite_stretched_ext(back_params[0], back_params[1], (txt_x - ((sw * size_mod[0]) / 2)) + (offset_x - (h_border / 2)), (txt_y + offset_y) - (((sh * size_mod[1]) / 2) + (v_border / 2)), (sw * size_mod[0]) + h_border, (sh * size_mod[1]) + v_border, back_params[2], back_params[3]);} break;
				case fa_bottom: {draw_sprite_stretched_ext(back_params[0], back_params[1], (txt_x - ((sw * size_mod[0]) / 2)) + (offset_x - (h_border / 2)), (txt_y + offset_y) - ((sh * size_mod[1]) + (v_border / 2)), (sw * size_mod[0]) + h_border, (sh * size_mod[1]) + v_border, back_params[2], back_params[3]);} break;
			}
			
			
			if (enable_shadow) {draw_text_transformed_color((txt_x + offset_x) + sha_diff, (txt_y + offset_y) + sha_diff, txt_string, (size_mod[0]), (size_mod[1]), 0, shadow_params[0], shadow_params[1], shadow_params[2], shadow_params[3], shadow_params[4]);}
								draw_text_transformed_color((txt_x + offset_x) - sha_diff, (txt_y + offset_y) - sha_diff, txt_string, (size_mod[0]), (size_mod[1]), 0, text_params[0], text_params[1], text_params[2], text_params[3], text_params[4]);
		
		} break;
			
		case fa_right:
		{
			switch (align_params[1])
			{
				case fa_top:    {draw_sprite_stretched_ext(back_params[0], back_params[1], (txt_x + offset_x) - ((sw * size_mod[0]) + (h_border / 2)), (txt_y + offset_y) - (v_border / 2), (sw * size_mod[0]) + h_border, (sh * size_mod[1]) + v_border, back_params[2], back_params[3]);} break;
				case fa_middle: {draw_sprite_stretched_ext(back_params[0], back_params[1], (txt_x + offset_x) - ((sw * size_mod[0]) + (h_border / 2)), (txt_y + offset_y) - (((sh * size_mod[1]) / 2) + (v_border / 2)), (sw * size_mod[0]) + h_border, (sh * size_mod[1]) + v_border, back_params[2], back_params[3]);} break;
				case fa_bottom: {draw_sprite_stretched_ext(back_params[0], back_params[1], (txt_x + offset_x) - ((sw * size_mod[0]) + (h_border / 2)), (txt_y + offset_y) - ((sh * size_mod[1]) + (v_border / 2)), (sw * size_mod[0]) + h_border, (sh * size_mod[1]) + v_border, back_params[2], back_params[3]);} break;
			}
			
			
			if (enable_shadow) {draw_text_transformed_color((txt_x + offset_x) + sha_diff, (txt_y + offset_y) + sha_diff, txt_string, (size_mod[0]), (size_mod[1]), 0, shadow_params[0], shadow_params[1], shadow_params[2], shadow_params[3], shadow_params[4]);}
								draw_text_transformed_color((txt_x + offset_x) - sha_diff, (txt_y + offset_y) - sha_diff, txt_string, (size_mod[0]), (size_mod[1]), 0, text_params[0], text_params[1], text_params[2], text_params[3], text_params[4]);
				
		} break;
	}
}