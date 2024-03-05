/// @function Converts a given value within the old range to a congruent value in the new range.

/// @param		{real}		range_value		The number to convert from the old range.
/// @param		{real}		old_range		The number of values within the old range (default is 255).
/// @param		{real}		new_range		The number of values within the new range (default is 1).

function range_convert(range_value, old_range = 255, new_range = 1)
{
	return (new_range / old_range) * range_value;
}
