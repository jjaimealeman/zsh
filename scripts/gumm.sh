#!/bin/bash

convert_jpg_to_webp_with_gum() {
	file=$(find . -maxdepth 1 -iname "*.jpg" -o -iname "*.webp" | sed 's|./||' | gum choose)

	# Check if the user selected a file
	if [ -z "$file" ]; then
		echo "No file selected or no JPG or WEBP files found." | gum write
		return 1
	fi

	# Proceed with conversion if a file is selected
	if [[ -f "$file" && ("${file##*.}" == "jpg" || "${file##*.}" == "webp") ]]; then
		output_file="${file%.*}.webp"
		if cwebp "$file" -o "$output_file"; then
			# printf "Conversion complete: %s" "$output_file" | gum write
			echo
			printf "Conversion complete: $output_file"
		else
			# printf "Conversion failed for file: %s" "$file" | gum write
			echo
			gum write "Conversion failed for file."
		fi
	else
		# echo "The selected file does not exist or is not a JPEG or WEBP image." | gum write
		echo "The selected file does not exist or is not a JPEG or WEBP image."
	fi
}

resize_image() {
	# Use gum to select a file
	file=$(find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \) | gum choose)

	# Check if the user selected a file
	if [ -z "$file" ]; then
		echo "No file selected." | gum write
		return 1
	fi

	# Prompt for aspect ratio preference
	aspect_ratio=$(gum input --placeholder "Maintain aspect ratio? (yes/no)")

	if [ "$aspect_ratio" = "yes" ]; then
		# Prompt for either width or height
		width_or_height=$(gum input --placeholder "Enter either width or height")

		# Calculate the other dimension based on the original image's aspect ratio
		if [ "$width_or_height" = "width" ]; then
			width=$(gum input --placeholder "Enter the width")
			height=$(identify -format "%[fx:h/w*$width]" "$file")
		elif [ "$width_or_height" = "height" ]; then
			height=$(gum input --placeholder "Enter the height")
			width=$(identify -format "%[fx:w/h*$height]" "$file")
		else
			echo "Invalid input. Please enter either 'width' or 'height'." | gum write
			return 1
		fi
	else
		# Prompt for both width and height
		width=$(gum input --placeholder "Enter the width")
		height=$(gum input --placeholder "Enter the height")
	fi

	# Check if width and height are integers
	if ! [[ "$width" =~ ^[0-9]+$ ]] || ! [[ "$height" =~ ^[0-9]+$ ]]; then
		echo "Width and height must be integers." | gum write
		return 1
	fi

	# Perform the resize operation
	filename=$(basename "$file")
	extension="${filename##*.}"
	filename_without_extension="${filename%.*}"
	new_filename="${filename_without_extension}_${width}x${height}.${extension}"
	new_file="${file%/*}/${new_filename}"
	convert "$file" -resize "${width}x${height}" "$new_file"

	# Check if the convert command was successful
	if [ $? -eq 0 ]; then
		echo "Image resized to ${width}x${height} pixelss." | gum write
	else
		echo "Image resize failed." | gum write
	fi
}

# Call the resize function
# resize_image
