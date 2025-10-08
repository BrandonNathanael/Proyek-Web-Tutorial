<?php
/**
 * YouTube utility functions for extracting video IDs and generating thumbnail URLs
 */

/**
 * Extract YouTube video ID from various YouTube URL formats
 * 
 * @param string $url YouTube URL
 * @return string|false Video ID or false if not found
 */
function extractYouTubeVideoId($url) {
    // Remove any whitespace
    $url = trim($url);
    
    // Pattern for youtu.be/VIDEO_ID
    if (preg_match('/youtu\.be\/([a-zA-Z0-9_-]+)/', $url, $matches)) {
        return $matches[1];
    }
    
    // Pattern for youtube.com/watch?v=VIDEO_ID
    if (preg_match('/youtube\.com\/watch\?v=([a-zA-Z0-9_-]+)/', $url, $matches)) {
        return $matches[1];
    }
    
    // Pattern for youtube.com/embed/VIDEO_ID
    if (preg_match('/youtube\.com\/embed\/([a-zA-Z0-9_-]+)/', $url, $matches)) {
        return $matches[1];
    }
    
    // Pattern for youtube.com/v/VIDEO_ID
    if (preg_match('/youtube\.com\/v\/([a-zA-Z0-9_-]+)/', $url, $matches)) {
        return $matches[1];
    }
    
    return false;
}

/**
 * Generate YouTube thumbnail URL
 * 
 * @param string $videoId YouTube video ID
 * @param string $quality Thumbnail quality (default, mqdefault, hqdefault, sddefault, maxresdefault)
 * @return string Thumbnail URL
 */
function getYouTubeThumbnail($videoId, $quality = 'mqdefault') {
    if (empty($videoId)) {
        return 'assets/default-course.jpg';
    }
    
    $validQualities = ['default', 'mqdefault', 'hqdefault', 'sddefault', 'maxresdefault'];
    if (!in_array($quality, $validQualities)) {
        $quality = 'mqdefault';
    }
    
    return "https://img.youtube.com/vi/{$videoId}/{$quality}.jpg";
}

/**
 * Check if URL is a YouTube link
 * 
 * @param string $url URL to check
 * @return bool True if YouTube URL
 */
function isYouTubeUrl($url) {
    return preg_match('/(youtube\.com|youtu\.be)/i', $url);
}

/**
 * Get course thumbnail with fallback logic
 * 
 * @param string $imagePath Course image path (could be YouTube URL, image URL, etc.)
 * @param string $title Course title for alt text
 * @return array Array with 'src' and 'alt' keys
 */
function getCourseThumbnail($imagePath, $title = '') {
    $imagePath = trim($imagePath);
    
    // If it's a YouTube URL, get the thumbnail
    if (isYouTubeUrl($imagePath)) {
        $videoId = extractYouTubeVideoId($imagePath);
        if ($videoId) {
            return [
                'src' => getYouTubeThumbnail($videoId),
                'alt' => $title ?: 'Course Thumbnail',
                'isVideo' => true,
                'videoId' => $videoId
            ];
        }
    }
    
    // If it's a direct image URL or file path
    if (preg_match('/\.(jpg|jpeg|png|gif|webp)$/i', $imagePath)) {
        return [
            'src' => $imagePath,
            'alt' => $title ?: 'Course Thumbnail',
            'isVideo' => false
        ];
    }
    
    // Default fallback
    return [
        'src' => 'assets/default-course.jpg',
        'alt' => $title ?: 'Course Thumbnail',
        'isVideo' => false
    ];
}
?>
