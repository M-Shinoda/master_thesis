#!/bin/zsh

# PDFファイルのパス
COVER_PDF="top/修士論文_表紙.pdf"
MAIN_PDF="pdf/format.pdf"
OUTPUT_PDF="pdf/修士論文_24AMJ18_篠田征美.pdf"

# ファイルの存在確認
if [[ ! -f "$COVER_PDF" ]]; then
    echo "❌ エラー: $COVER_PDF が見つかりません"
    exit 1
fi

if [[ ! -f "$MAIN_PDF" ]]; then
    echo "❌ エラー: $MAIN_PDF が見つかりません"
    exit 1
fi

# PDFを結合
echo "🔗 PDFを結合中: $COVER_PDF + $MAIN_PDF -> $OUTPUT_PDF"
pdfunite "$COVER_PDF" "$MAIN_PDF" "$OUTPUT_PDF"

if [[ $? -eq 0 ]]; then
    echo "✅ PDF結合完了: $OUTPUT_PDF"
else
    echo "❌ エラー: PDF結合に失敗しました"
    exit 1
fi
