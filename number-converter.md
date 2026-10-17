---
layout: default
title: "Number Converter"
description: "Convert any number into the modern standardized Yoruba Number System."
permalink: /number-converter/
---
<div class="number-converter-wrapper">
    <div class="converter-container">
        <h1>Yoruba Number New System Converter</h1>
        <p class="converter-intro">Type any number to see how it is written in the standardized modern Yoruba number system.</p>
        
        <div class="input-group">
            <input type="text" id="numberInput" placeholder="Enter a number (1-999,999,999,999,999,999,999)" autofocus>
        </div>
        
        <div class="result" id="result">
            <div id="yorubaOutput">Yoruba word will appear here...</div>
        </div>
        
        <div class="range-info">Supports numbers from 1 to 999,999,999,999,999,999,999</div>

        <div class="creator-info">
            <p><strong>System created by:</strong> Hakeem O. Adeniyan (Ọ̀dú Owó Bámirẹ́)</p>
            <p class="copyright">© 2025 Yoruba Number New System Converter. All rights reserved.</p>
        </div>
    </div>
</div>

<style>
/* Styles scoped specifically for this converter so it matches your site */
.number-converter-wrapper {
    padding: 3rem 1.5rem;
    display: flex;
    justify-content: center;
}

.converter-container {
    background: white;
    padding: 2rem;
    border-radius: var(--radius, 8px);
    box-shadow: 0 4px 15px rgba(0,0,0,0.08);
    border-top: 4px solid var(--ochre, #c8810a);
    width: 100%;
    max-width: 650px;
}

.converter-container h1 {
    color: var(--indigo-900, #1a1a4e);
    text-align: center;
    font-size: 1.5rem;
    margin-bottom: 0.5rem;
}

.converter-intro {
    text-align: center;
    color: #666;
    margin-bottom: 1.5rem;
    font-size: 0.9rem;
}

.input-group {
    margin: 20px 0;
}

#numberInput {
    width: 100%;
    padding: 15px;
    font-size: 1.1rem;
    border: 2px solid #ddd;
    border-radius: var(--radius, 8px);
    box-sizing: border-box;
    font-family: var(--font-body, sans-serif);
    transition: border-color 0.2s;
}

#numberInput:focus {
    border-color: var(--ochre, #c8810a);
    outline: none;
}

.result {
    margin-top: 20px;
    padding: 20px;
    background-color: #fdfdfd;
    border-radius: var(--radius, 8px);
    border: 1px solid #eee;
    border-left: 5px solid var(--indigo-700, #2d2d7a);
    font-size: 18px;
    min-height: 40px;
    display: flex;
    align-items: center;
}

#yorubaOutput {
    width: 100%;
}

.yoruba-text {
    font-family: var(--font-display, serif);
    font-size: 1.4rem;
    color: var(--indigo-900, #1a1a4e);
    font-weight: bold;
    line-height: 1.4;
}

.error {
    border-left-color: #e74c3c !important;
    color: #e74c3c !important;
}

.range-info {
    margin-top: 10px;
    font-size: 0.75rem;
    color: #888;
    text-align: center;
}

.creator-info {
    margin-top: 30px;
    padding-top: 20px;
    border-top: 1px solid #eee;
    text-align: center;
    font-size: 0.85rem;
    color: #555;
}

.copyright {
    margin-top: 5px;
    font-size: 0.75rem;
    color: #999;
}

@media (max-width: 600px) {
    .number-converter-wrapper { padding: 1.5rem 1rem; }
    .converter-container { padding: 1.5rem; }
    .yoruba-text { font-size: 1.2rem; }
}
</style>

<script>
    // YOUR UNIQUE YORUBA NUMBER MAPPING
        const yorubaNumbers = {
            // === NUMBERS 1-99 (UNIQUE NAMES) ===
            1: "ení", 2: "èjì", 3: "ẹ̀ta", 4: "ẹ̀rin", 5: "àr  n", 6: "ẹ̀fà", 7: "èje", 8: "ẹ̀jọ", 9: "ẹ̀sán", 10: "ẹ̀wá",
            11: "ọ̀kànlá", 12: "èjìlá", 13: "ẹ̀tàlá", 14: "ẹ̀rìnlá", 15: "àrùndógún", 16: "ẹ̀rìndógún", 17: "ẹ̀tàdógún", 18: "èjìdógún", 19: "ọ̀kàndógún",
            20: "ogún", 21: "ogún-ení", 22: "ogún-èjì", 23: "ogún-ẹ̀ta", 24: "ogún-ẹ̀rin", 25: "ogún-àrún", 26: "ogún-ẹ̀fà", 27: "ogún-èje", 28: "ogún-ẹ̀jọ", 29: "ogún-ẹ̀sán",
            30: "ọgbọ̀n", 31: "ọgbọ̀n-ení", 32: "ọgbọ̀n-èjì", 33: "ọgbọ̀n-ẹ̀ta", 34: "ọgbọ̀n-ẹ̀rin", 35: "ọgbọ̀n-àrún", 36: "ọgbọ̀n-ẹ̀fà", 37: "ọgbọ̀n-èje", 38: "ọgbọ̀n-ẹ̀jọ", 39: "ọgbọ̀n-ẹ̀sán",
            40: "ogójì", 41: "ogójì-ení", 42: "ogójì-èjì", 43: "ogójì-ẹ̀ta", 44: "ogójì-ẹ̀rin", 45: "ogójì-àrún", 46: "ogójì-ẹ̀fà", 47: "ogójì-èje", 48: "ogójì-ẹ̀jọ", 49: "ogójì-ẹ̀sán",
            50: "àádọ́ta", 51: "àádọ́ta-ení", 52: "àádọ́ta-èjì", 53: "àádọ́ta-ẹ̀ta", 54: "àádọ́ta-ẹ̀rin", 55: "àádọ́ta-àrún", 56: "àádọ́ta-ẹ̀fà", 57: "àádọ́ta-èje", 58: "àádọ́ta-ẹ̀jọ", 59: "àádọ́ta-ẹ̀sán",
            60: "ọgọ́ta", 61: "ọgọ́ta-ení", 62: "ọgọ́ta-èjì", 63: "ọgọ́ta-ẹ̀ta", 64: "ọgọ́ta-ẹ̀rin", 65: "ọgọ́ta-àrún", 66: "ọgọ́ta-ẹ̀fà", 67: "ọgọ́ta-èje", 68: "ọgọ́ta-ẹ̀jọ", 69: "ọgọ́ta-ẹ̀sán",
            70: "àádọ́rin", 71: "àádọ́rin-ení", 72: "àádọ́rin-èjì", 73: "àádọ́rin-ẹ̀ta", 74: "àádọ́rin-ẹ̀rin", 75: "àádọ́rin-àrún", 76: "àádọ́rin-ẹ̀fà", 77: "àádọ́rin-èje", 78: "àádọ́rin-ẹ̀jọ", 79: "àádọ́rin-ẹ̀sán",
            80: "ọgọ́rin", 81: "ọgọ́rin-ení", 82: "ọgọ́rin-èjì", 83: "ọgọ́rin-ẹ̀ta", 84: "ọgọ́rin-ẹ̀rin", 85: "ọgọ́rin-àrún", 86: "ọgọ́rin-ẹ̀fà", 87: "ọgọ́rin-èje", 88: "ọgọ́rin-ẹ̀jọ", 89: "ọgọ́rin-ẹ̀sán",
            90: "àádọ́rùn-ún", 91: "àádọ́rùn-ún-ení", 92: "àádọ́rùn-ún-èjì", 93: "àádọ́rùn-ún-ẹ̀ta", 94: "àádọ́rùn-ún-ẹ̀rin", 95: "àádọ́rùn-ún-àrún", 96: "àádọ́rùn-ún-ẹ̀fà", 97: "àádọ́rùn-ún-èje", 98: "àádọ́rùn-ún-ẹ̀jọ", 99: "àádọ́rùn-ún-ẹ̀sán",

            // === SPECIAL NAMES FOR 100-900 ===
            100: "ọgọ́rùn-ún kan", 200: "ọgọ́rùn-ún méjì", 300: "ọgọ́rùn-ún mẹ́ta", 400: "ọgọ́rùn-ún mẹ́rin", 
            500: "ọgọ́rùn-ún márùn-ún", 600: "ọgọ́rùn-ún mẹ́fà", 700: "ọgọ́rùn-ún méje", 800: "ọgọ́rùn-ún mẹ́jọ", 900: "ọgọ́rùn-ún mẹ́sàn-án",

            // === SPECIAL NAMES FOR 1000-19000 ===
            1000: "ẹgbẹ̀rún kan", 2000: "ẹgbẹ̀rún méjì", 3000: "ẹgbẹ̀rún mẹ́ta", 4000: "ẹgbẹ̀rún mẹ́rin", 5000: "ẹgbẹ̀rún márùn-ún", 
            6000: "ẹgbẹ̀rún mẹ́fà", 7000: "ẹgbẹ̀rún méje", 8000: "ẹgbẹ̀rún mẹ́jọ", 9000: "ẹgbẹ̀rún mẹ́sàn-án",
            10000: "ẹgbẹ̀rún mẹ́wàá", 11000: "ẹgbẹ̀rún mọ́kànlá", 12000: "ẹgbẹ̀rún méjìlá", 13000: "ẹgbẹ̀rún mẹ́tàlá", 14000: "ẹgbẹ̀rún mẹ́rìnlá",
            15000: "ẹgbẹ̀rún márùndógún", 16000: "ẹgbẹ̀rún mẹ́rìndógún", 17000: "ẹgbẹ̀rún mẹ́tàdógún", 18000: "ẹgbẹ̀rún méjìdógún", 19000: "ẹgbẹ̀rún mọ́kàndógún",

            // === SPECIAL NAMES FOR 1,000,000-19,000,000 ===
            1000000: "ẹgbẹ̀rúngbẹ̀rún kan", 2000000: "ẹgbẹ̀rúngbẹ̀rún méjì", 3000000: "ẹgbẹ̀rúngbẹ̀rún mẹ́ta", 4000000: "ẹgbẹ̀rúngbẹ̀rún mẹ́rin", 
            5000000: "ẹgbẹ̀rúngbẹ̀rún márùn-ún", 6000000: "ẹgbẹ̀rúngbẹ̀rún mẹ́fà", 7000000: "ẹgbẹ̀rúngbẹ̀rún méje", 8000000: "ẹgbẹ̀rúngbẹ̀rún mẹ́jọ", 9000000: "ẹgbẹ̀rúngbẹ̀rún mẹ́sàn-án",
            10000000: "ẹgbẹ̀rúngbẹ̀rún mẹ́wàá", 11000000: "ẹgbẹ̀rúngbẹ̀rún mọ́kànlá", 12000000: "ẹgbẹ̀rúngbẹ̀rún méjìlá", 13000000: "ẹgbẹ̀rúngbẹ̀rún mẹ́tàlá", 14000000: "ẹgbẹ̀rúngbẹ̀rún mẹ́rìnlá",
            15000000: "ẹgbẹ̀rúngbẹ̀rún márùndógún", 16000000: "ẹgbẹ̀rúngbẹ̀rún mẹ́rìndógún", 17000000: "ẹgbẹ̀rúngbẹ̀rún mẹ́tàdógún", 18000000: "ẹgbẹ̀rúngbẹ̀rún méjìdógún", 19000000: "ẹgbẹ̀rúngbẹ̀rún mọ́kàndógún",

            // === SPECIAL NAMES FOR 1,000,000,000-19,000,000,000 ===
            1000000000: "eṣú kan", 2000000000: "eṣú méjì", 3000000000: "eṣú mẹ́ta", 4000000000: "eṣú mẹ́rin", 
            5000000000: "eṣú márùn-ún", 6000000000: "eṣú mẹ́fà", 7000000000: "eṣú méje", 8000000000: "eṣú mẹ́jọ", 9000000000: "eṣú mẹ́sàn-án",
            10000000000: "eṣú mẹ́wàá", 11000000000: "eṣú mọ́kànlá", 12000000000: "eṣú méjìlá", 13000000000: "eṣú mẹ́tàlá", 14000000000: "eṣú mẹ́rìnlá",
            15000000000: "eṣú márùndógún", 16000000000: "eṣú mẹ́rìndógún", 17000000000: "eṣú mẹ́tàdógún", 18000000000: "eṣú méjìdógún", 19000000000: "eṣú mọ́kàndógún",

            // === SPECIAL NAMES FOR 1,000,000,000,000-19,000,000,000,000 ===
            1000000000000: "ẹgbẹ̀rúnṣú kan", 2000000000000: "ẹgbẹ̀rúnṣú méjì", 3000000000000: "ẹgbẹ̀rúnṣú mẹ́ta", 4000000000000: "ẹgbẹ̀rúnṣú mẹ́rin", 
            5000000000000: "ẹgbẹ̀rúnṣú márùn-ún", 6000000000000: "ẹgbẹ̀rúnṣú mẹ́fà", 7000000000000: "ẹgbẹ̀rúnṣú méje", 8000000000000: "ẹgbẹ̀rúnṣú mẹ́jọ", 9000000000000: "ẹgbẹ̀rúnṣú mẹ́sàn-án",
            10000000000000: "ẹgbẹ̀rúnṣú mẹ́wàá", 11000000000000: "ẹgbẹ̀rúnṣú mọ́kànlá", 12000000000000: "ẹgbẹ̀rúnṣú méjìlá", 13000000000000: "ẹgbẹ̀rúnṣú mẹ́tàlá", 14000000000000: "ẹgbẹ̀rúnṣú mẹ́rìnlá",
            15000000000000: "ẹgbẹ̀rúnṣú márùndógún", 16000000000000: "ẹgbẹ̀rúnṣú mẹ́rìndógún", 17000000000000: "ẹgbẹ̀rúnṣú mẹ́tàdógún", 18000000000000: "ẹgbẹ̀rúnṣú méjìdógún", 19000000000000: "ẹgbẹ̀rúnṣú mọ́kàndógún",

            // === SPECIAL NAMES FOR 1,000,000,000,000,000-19,000,000,000,000,000 ===
            1000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú kan", 2000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú méjì", 3000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú mẹ́ta", 4000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú mẹ́rin", 
            5000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú márùn-ún", 6000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú mẹ́fà", 7000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú méje", 8000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú mẹ́jọ", 9000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú mẹ́sàn-án",
            10000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú mẹ́wàá", 11000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú mọ́kànlá", 12000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú méjìlá", 13000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú mẹ́tàlá", 14000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú mẹ́rìnlá",
            15000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú márùndógún", 16000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú mẹ́rìndógún", 17000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú mẹ́tàdógún", 18000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú méjìdógún", 19000000000000000: "ẹgbẹ̀rúngbẹ̀rúnṣú mọ́kàndógún",

            // === SPECIAL NAMES FOR QUINTILLIONS (1-19) ===
            1000000000000000000: "yẹ̀pẹ̀ kan", 2000000000000000000: "yẹ̀pẹ̀ méjì", 3000000000000000000: "yẹ̀pẹ̀ mẹ́ta", 4000000000000000000: "yẹ̀pẹ̀ mẹ́rin", 
            5000000000000000000: "yẹ̀pẹ̀ márùn-ún", 6000000000000000000: "yẹ̀pẹ̀ mẹ́fà", 7000000000000000000: "yẹ̀pẹ̀ méje", 8000000000000000000: "yẹ̀pẹ̀ mẹ́jọ", 9000000000000000000: "yẹ̀pẹ̀ mẹ́sàn-án",
            10000000000000000000: "yẹ̀pẹ̀ mẹ́wàá", 11000000000000000000: "yẹ̀pẹ̀ mọ́kànlá", 12000000000000000000: "yẹ̀pẹ̀ méjìlá", 13000000000000000000: "yẹ̀pẹ̀ mẹ́tàlá", 14000000000000000000: "yẹ̀pẹ̀ mẹ́rìnlá",
            15000000000000000000: "yẹ̀pẹ̀ márùndógún", 16000000000000000000: "yẹ̀pẹ̀ mẹ́rìndógún", 17000000000000000000: "yẹ̀pẹ̀ mẹ́tàdógún", 18000000000000000000: "yẹ̀pẹ̀ méjìdógún", 19000000000000000000: "yẹ̀pẹ̀ mọ́kàndógún"
        };

        // Convert regular numbers to BigInt for the mapping keys
        const yorubaNumbersBigInt = new Map();
        Object.keys(yorubaNumbers).forEach(key => {
            yorubaNumbersBigInt.set(BigInt(key), yorubaNumbers[key]);
        });

        function convertToYoruba(number) {
            // Direct lookup for numbers that have exact names
            if (yorubaNumbersBigInt.has(number)) {
                return yorubaNumbersBigInt.get(number);
            }

            // Helper function to handle remainder
            function addRemainder(baseResult, remainder) {
                if (remainder > 0n) {
                    const remainderText = convertToYoruba(remainder);
                    if (remainderText && !remainderText.includes("not defined")) {
                        return baseResult + " " + remainderText;
                    }
                }
                return baseResult;
            }

            // Handle combination numbers (101-999 that aren't exact hundreds)
            if (number > 100n && number < 1000n) {
                const hundreds = (number / 100n) * 100n;
                const remainder = number % 100n;
                if (yorubaNumbersBigInt.has(hundreds) && remainder > 0n) {
                    return addRemainder(yorubaNumbersBigInt.get(hundreds), remainder);
                }
            }

            // Handle combination numbers (1001-19999 that aren't exact thousands)
            if (number > 1000n && number < 20000n) {
                const thousands = (number / 1000n) * 1000n;
                const remainder = number % 1000n;
                if (yorubaNumbersBigInt.has(thousands) && remainder > 0n) {
                    return addRemainder(yorubaNumbersBigInt.get(thousands), remainder);
                }
            }

            // === THOUSANDS RANGE (1,000 - 999,999) ===
            
            // Handle numbers from 20,000 to 99,999
            if (number >= 20000n && number < 100000n) {
                const part = number / 1000n;
                const remainder = number % 1000n;
                const partText = convertToYoruba(part);
                return addRemainder(partText + " ẹgbẹ̀rún", remainder);
            }

            // Handle numbers from 100,000 to 199,999 - FIXED
            if (number >= 100000n && number < 200000n) {
                const part = number / 1000n;
                const remainder = number % 1000n;
                if (part === 100n) {
                    // Special case: 100,000 exactly
                    return addRemainder("ọgọ́rùn-ún kan ẹgbẹ̀rún", remainder);
                } else {
                    const partText = convertToYoruba(part);
                    return addRemainder(partText + " ẹgbẹ̀rún", remainder); // FIXED: Removed extra "ọgọ́rùn-ún kan"
                }
            }

            // Handle numbers from 200,000 to 999,999
            if (number >= 200000n && number < 1000000n) {
                const part = number / 1000n;
                const remainder = number % 1000n;
                const partText = convertToYoruba(part);
                return addRemainder(partText + " ẹgbẹ̀rún", remainder);
            }

            // === MILLIONS RANGE (1,000,000 - 999,999,999) ===
            
            // Handle exact millions with remainders (1,000,000 - 9,999,999)
            for (let x = 1; x <= 9; x++) {
                const start = BigInt(x) * 1000000n;
                const end = start + 100000n;
                if (number >= start && number < end) {
                    const millions = (number / 1000000n) * 1000000n;
                    const remainder = number % 1000000n;
                    if (yorubaNumbersBigInt.has(millions) && remainder > 0n) {
                        return addRemainder(yorubaNumbersBigInt.get(millions), remainder);
                    }
                }
            }

            // Handle combination millions (1,100,000 - 19,999,999)
            if (number >= 1100000n && number < 20000000n) {
                const millions = (number / 1000000n) * 1000000n;
                const remainder = number % 1000000n;
                if (yorubaNumbersBigInt.has(millions) && remainder > 0n) {
                    return addRemainder(yorubaNumbersBigInt.get(millions), remainder);
                }
            }

            // Handle numbers from 20,000,000 to 99,999,999
            if (number >= 20000000n && number < 100000000n) {
                const part = number / 1000000n;
                const remainder = number % 1000000n;
                const partText = convertToYoruba(part);
                return addRemainder(partText + " ẹgbẹ̀rúngbẹ̀rún", remainder);
            }

            // Handle numbers from 100,000,000 to 199,999,999 - FIXED
            if (number >= 100000000n && number < 200000000n) {
                const part = number / 1000000n;
                const remainder = number % 1000000n;
                if (part === 100n) {
                    return addRemainder("ọgọ́rùn-ún kan ẹgbẹ̀rúngbẹ̀rún", remainder);
                } else {
                    const partText = convertToYoruba(part);
                    return addRemainder(partText + " ẹgbẹ̀rúngbẹ̀rún", remainder); // FIXED
                }
            }

            // Handle numbers from 200,000,000 to 999,999,999
            if (number >= 200000000n && number < 1000000000n) {
                const part = number / 1000000n;
                const remainder = number % 1000000n;
                const partText = convertToYoruba(part);
                return addRemainder(partText + " ẹgbẹ̀rúngbẹ̀rún", remainder);
            }

            // === BILLIONS RANGE (1,000,000,000 - 999,999,999,999) ===
            
            // Handle exact billions with remainders
            for (let x = 1; x <= 9; x++) {
                const start = BigInt(x) * 1000000000n;
                const end = start + 100000000n;
                if (number >= start && number < end) {
                    const billions = (number / 1000000000n) * 1000000000n;
                    const remainder = number % 1000000000n;
                    if (yorubaNumbersBigInt.has(billions) && remainder > 0n) {
                        return addRemainder(yorubaNumbersBigInt.get(billions), remainder);
                    }
                }
            }

            // Handle combination billions (1,100,000,000 - 19,999,999,999)
            if (number >= 1100000000n && number < 20000000000n) {
                const billions = (number / 1000000000n) * 1000000000n;
                const remainder = number % 1000000000n;
                if (yorubaNumbersBigInt.has(billions) && remainder > 0n) {
                    return addRemainder(yorubaNumbersBigInt.get(billions), remainder);
                }
            }

            // Handle numbers from 20,000,000,000 to 99,999,999,999
            if (number >= 20000000000n && number < 100000000000n) {
                const part = number / 1000000000n;
                const remainder = number % 1000000000n;
                const partText = convertToYoruba(part);
                return addRemainder(partText + " eṣú", remainder);
            }

            // Handle numbers from 100,000,000,000 to 199,999,999,999 - FIXED
            if (number >= 100000000000n && number < 200000000000n) {
                const part = number / 1000000000n;
                const remainder = number % 1000000000n;
                if (part === 100n) {
                    return addRemainder("ọgọ́rùn-ún kan eṣú", remainder);
                } else {
                    const partText = convertToYoruba(part);
                    return addRemainder(partText + " eṣú", remainder); // FIXED
                }
            }

            // Handle numbers from 200,000,000,000 to 999,999,999,999
            if (number >= 200000000000n && number < 1000000000000n) {
                const part = number / 1000000000n;
                const remainder = number % 1000000000n;
                const partText = convertToYoruba(part);
                return addRemainder(partText + " eṣú", remainder);
            }

            // === TRILLIONS RANGE (1,000,000,000,000 - 999,999,999,999,999) ===
            
            // Handle exact trillions with remainders
            for (let x = 1; x <= 9; x++) {
                const start = BigInt(x) * 1000000000000n;
                const end = start + 100000000000n;
                if (number >= start && number < end) {
                    const trillions = (number / 1000000000000n) * 1000000000000n;
                    const remainder = number % 1000000000000n;
                    if (yorubaNumbersBigInt.has(trillions) && remainder > 0n) {
                        return addRemainder(yorubaNumbersBigInt.get(trillions), remainder);
                    }
                }
            }

            // Handle combination trillions (1,100,000,000,000 - 19,999,999,999,999)
            if (number >= 1100000000000n && number < 20000000000000n) {
                const trillions = (number / 1000000000000n) * 1000000000000n;
                const remainder = number % 1000000000000n;
                if (yorubaNumbersBigInt.has(trillions) && remainder > 0n) {
                    return addRemainder(yorubaNumbersBigInt.get(trillions), remainder);
                }
            }

            // Handle numbers from 20,000,000,000,000 to 99,999,999,999,999
            if (number >= 20000000000000n && number < 100000000000000n) {
                const part = number / 1000000000000n;
                const remainder = number % 1000000000000n;
                const partText = convertToYoruba(part);
                return addRemainder(partText + " ẹgbẹ̀rúnṣú", remainder);
            }

            // Handle numbers from 100,000,000,000,000 to 199,999,999,999,999 - FIXED
            if (number >= 100000000000000n && number < 200000000000000n) {
                const part = number / 1000000000000n;
                const remainder = number % 1000000000000n;
                if (part === 100n) {
                    return addRemainder("ọgọ́rùn-ún kan ẹgbẹ̀rúnṣú", remainder);
                } else {
                    const partText = convertToYoruba(part);
                    return addRemainder(partText + " ẹgbẹ̀rúnṣú", remainder); // FIXED
                }
            }

            // Handle numbers from 200,000,000,000,000 to 999,999,999,999,999
            if (number >= 200000000000000n && number < 1000000000000000n) {
                const part = number / 1000000000000n;
                const remainder = number % 1000000000000n;
                const partText = convertToYoruba(part);
                return addRemainder(partText + " ẹgbẹ̀rúnṣú", remainder);
            }

            // === QUADRILLIONS RANGE (1,000,000,000,000,000 - 999,999,999,999,999,999) ===
            
            // Handle exact quadrillions with remainders
            for (let x = 1; x <= 9; x++) {
                const start = BigInt(x) * 1000000000000000n;
                const end = start + 100000000000000n;
                if (number >= start && number < end) {
                    const quadrillions = (number / 1000000000000000n) * 1000000000000000n;
                    const remainder = number % 1000000000000000n;
                    if (yorubaNumbersBigInt.has(quadrillions) && remainder > 0n) {
                        return addRemainder(yorubaNumbersBigInt.get(quadrillions), remainder);
                    }
                }
            }

            // Handle combination quadrillions (1,100,000,000,000,000 - 19,999,999,999,999,999)
            if (number >= 1100000000000000n && number < 20000000000000000n) {
                const quadrillions = (number / 1000000000000000n) * 1000000000000000n;
                const remainder = number % 1000000000000000n;
                if (yorubaNumbersBigInt.has(quadrillions) && remainder > 0n) {
                    return addRemainder(yorubaNumbersBigInt.get(quadrillions), remainder);
                }
            }

            // Handle numbers from 20,000,000,000,000,000 to 99,999,999,999,999,999
            if (number >= 20000000000000000n && number < 100000000000000000n) {
                const part = number / 1000000000000000n;
                const remainder = number % 1000000000000000n;
                const partText = convertToYoruba(part);
                return addRemainder(partText + " ẹgbẹ̀rúngbẹ̀rúnṣú", remainder);
            }

            // Handle numbers from 100,000,000,000,000,000 to 199,999,999,999,999,999 - FIXED
            if (number >= 100000000000000000n && number < 200000000000000000n) {
                const part = number / 1000000000000000n;
                const remainder = number % 1000000000000000n;
                if (part === 100n) {
                    return addRemainder("ọgọ́rùn-ún kan ẹgbẹ̀rúngbẹ̀rúnṣú", remainder);
                } else {
                    const partText = convertToYoruba(part);
                    return addRemainder(partText + " ẹgbẹ̀rúngbẹ̀rúnṣú", remainder); // FIXED
                }
            }

            // Handle numbers from 200,000,000,000,000,000 to 999,999,999,999,999,999
            if (number >= 200000000000000000n && number < 1000000000000000000n) {
                const part = number / 1000000000000000n;
                const remainder = number % 1000000000000000n;
                const partText = convertToYoruba(part);
                return addRemainder(partText + " ẹgbẹ̀rúngbẹ̀rúnṣú", remainder);
            }

            // === QUINTILLIONS RANGE (1,000,000,000,000,000,000 - 999,999,999,999,999,999,999) ===
            
            // Handle exact quintillions with remainders
            for (let x = 1; x <= 9; x++) {
                const start = BigInt(x) * 1000000000000000000n;
                const end = start + 100000000000000000n;
                if (number >= start && number < end) {
                    const quintillions = (number / 1000000000000000000n) * 1000000000000000000n;
                    const remainder = number % 1000000000000000000n;
                    if (yorubaNumbersBigInt.has(quintillions) && remainder > 0n) {
                        return addRemainder(yorubaNumbersBigInt.get(quintillions), remainder);
                    }
                }
            }

            // Handle combination quintillions (1,100,000,000,000,000,000 - 19,999,999,999,999,999,999)
            if (number >= 1100000000000000000n && number < 20000000000000000000n) {
                const quintillions = (number / 1000000000000000000n) * 1000000000000000000n;
                const remainder = number % 1000000000000000000n;
                if (yorubaNumbersBigInt.has(quintillions) && remainder > 0n) {
                    return addRemainder(yorubaNumbersBigInt.get(quintillions), remainder);
                }
            }

            // Handle numbers from 20,000,000,000,000,000,000 to 99,999,999,999,999,999,999
            if (number >= 20000000000000000000n && number < 100000000000000000000n) {
                const part = number / 1000000000000000000n;
                const remainder = number % 1000000000000000000n;
                const partText = convertToYoruba(part);
                return addRemainder(partText + " yẹ̀pẹ̀", remainder);
            }

            // Handle numbers from 100,000,000,000,000,000,000 to 199,999,999,999,999,999,999 - FIXED
            if (number >= 100000000000000000000n && number < 200000000000000000000n) {
                const part = number / 1000000000000000000n;
                const remainder = number % 1000000000000000000n;
                if (part === 100n) {
                    return addRemainder("ọgọ́rùn-ún kan yẹ̀pẹ̀", remainder);
                } else {
                    const partText = convertToYoruba(part);
                    return addRemainder(partText + " yẹ̀pẹ̀", remainder); // FIXED
                }
            }

            // Handle numbers from 200,000,000,000,000,000,000 to 999,999,999,999,999,999,999
            if (number >= 200000000000000000000n && number <= 999999999999999999999n) {
                const part = number / 1000000000000000000n;
                const remainder = number % 1000000000000000000n;
                const partText = convertToYoruba(part);
                return addRemainder(partText + " yẹ̀pẹ̀", remainder);
            }

            return `Name for ${number} not defined yet - add it to the mapping!`;
        }

        // Get DOM elements
        const numberInput = document.getElementById('numberInput');
        const yorubaOutput = document.getElementById('yorubaOutput');
        const resultDiv = document.getElementById('result');

        // Function to format number with commas
        function formatNumberWithCommas(numberString) {
            return numberString.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        // Function to remove commas for processing
        function removeCommas(numberString) {
            return numberString.replace(/,/g, '');
        }

        // Add event listener for input formatting
        numberInput.addEventListener('input', function() {
            const inputValue = this.value;
            const cursorPosition = this.selectionStart;
            
            // Remove commas to get the raw number
            const rawValue = removeCommas(inputValue);
            
            // Format with commas
            const formattedValue = formatNumberWithCommas(rawValue);
            
            // Update the input value
            this.value = formattedValue;
            
            // Restore cursor position (adjust for added commas)
            const commaCountBefore = (inputValue.substring(0, cursorPosition).match(/,/g) || []).length;
            const commaCountAfter = (formattedValue.substring(0, cursorPosition).match(/,/g) || []).length;
            const newCursorPosition = cursorPosition + (commaCountAfter - commaCountBefore);
            this.setSelectionRange(newCursorPosition, newCursorPosition);

            // Process the raw value for conversion
            if (!rawValue || !/^\d+$/.test(rawValue)) {
                yorubaOutput.textContent = "Please enter a valid positive number";
                resultDiv.classList.add('error');
                return;
            }

            try {
                const value = BigInt(rawValue);
                if (value < 1n || value > 999999999999999999999n) {
                    yorubaOutput.textContent = "Please enter a number between 1 and 999,999,999,999,999,999,999";
                    resultDiv.classList.add('error');
                    return;
                }
                
                resultDiv.classList.remove('error');
                const yorubaWord = convertToYoruba(value);
                gtag('event', 'use_number_converter', { 'number_typed': rawValue });
                yorubaOutput.innerHTML = `<span class="yoruba-text">${yorubaWord}</span>`;
            } catch (error) {
                yorubaOutput.textContent = "Number too large or invalid";
                resultDiv.classList.add('error');
            }
        });

        // Input validation
        numberInput.addEventListener('blur', function() {
            const inputValue = removeCommas(this.value);
            if (inputValue && /^\d+$/.test(inputValue)) {
                try {
                    const value = BigInt(inputValue);
                    if (value < 1n) this.value = "1";
                    if (value > 999999999999999999999n) this.value = formatNumberWithCommas("999999999999999999999");
                } catch (error) {
                    this.value = "1";
                }
            }
        });

        // Focus the input field when page loads
        window.addEventListener('load', function() {
            numberInput.focus();
        });

        // Test function to verify fixes
        function testNumbers() {
            const testNumbers = [
                105000n,        // 105,000
                105000000n,     // 105,000,000
                105000000000n,  // 105,000,000,000
                105000000000000n, // 105,000,000,000,000
                105000000000000000n, // 105,000,000,000,000,000
                105000000000000000000n // 105,000,000,000,000,000,000
            ];
            
            console.log("Testing fixed numbers:");
            testNumbers.forEach(num => {
                const result = convertToYoruba(num);
                console.log(`${num}: ${result}`);
            });
        }

        // Uncomment to run tests
        // testNumbers();
</script>
