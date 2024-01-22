# Video File Organizer Script

## Overview

**This Bash script is designed to organize video files, specifically those with the ".mkv" extension, by renaming and arranging them into directories based on unique names and season numbers.**

1. Make the script executable:

    ```bash
    chmod +x video_organizer.sh
    ```

2. Run the script:

    ```bash
    ./video_organizer.sh
    ```

## Notes

-   Before running the script, ensure that you have the `rename` command available.

-   The script assumes that video files follow a specific naming convention with season and episode numbers, such as "S01E01" for Season 1, Episode 1.

-   The script creates directories based on unique video names, excluding season and episode numbers. It may not handle all naming conventions, and adjustments may be needed based on your specific use case.

# Disclaimer

**USE AT YOUR OWN RISK**

This script is provided as-is, and the author makes no warranties, express or implied, regarding its accuracy, completeness, or suitability for any particular purpose.

Before running the script, it is strongly recommended to:

-   **Review and customize:** Understand the script's functionality and adapt it to your specific use case. This script may not cover all possible scenarios, and modifications may be necessary.

-   **Test in a safe environment:** Run the script on a small set of test data to verify its behavior and ensure it meets your expectations before applying it to a larger dataset.

By using this script, you acknowledge that you have read and understood the disclaimer, and you assume full responsibility for any consequences arising from its use.
