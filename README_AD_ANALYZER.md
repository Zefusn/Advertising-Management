# Ad Log Analyzer

## Usage

1. Copy Android Studio logs
2. Save to a text file
3. Drag the log file to `ad_final.bat`

Or run from command line:
```
ad_final.bat log_file.txt
```

## Expected Ad Flow

- 40101: Ad Request
- 40201: Fill Success
- 40301: Display
- 40303: Value Report
- 40402: Close

## Example Output

```
[40101] Ad Request: 1
[40201] Fill Success: 1
[40301] Display: 1
[40303] Value Report: 1
[40402] Close: 1

Flow Check:
-----------
[OK] Ad flow is NORMAL
```

## Files

- `ad_final.bat` - Main analyzer script
- `test_ad_log.txt` - Test log with complete flow
- `test_incomplete.txt` - Test log with missing events
