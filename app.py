from flask import Flask, request, jsonify

import spacy
from spacy.lang.en.stop_words import STOP_WORDS
from string import punctuation
from heapq import nlargest

app = Flask(__name__)


def summarizer(rawdocs):
    stopwords = list(STOP_WORDS)
    # print(stopwords)
    NLP = spacy.load('en_core_web_sm')
    doc = NLP(rawdocs)
    # print(doc)
    tokens = [token.text for token in doc]
    # print(tokens)
    word_freq = {}
    for word in doc:
        if word.text.lower() not in stopwords and word.text.lower() not in punctuation:
            if word.text not in word_freq.keys():
                word_freq[word.text] = 1
            else:
                word_freq[word.text] += 1

    # print(word_freq)

    max_freq = max(word_freq.values())
    # print(max_freq)

    for word in word_freq.keys():
        word_freq[word] = word_freq[word]/max_freq  # unitfrequency

    # print(word_freq)

    sentence_tokens = [sentence for sentence in doc.sents]
    # print(sentence_tokens)

    sent_scores = {}
    for sentence in sentence_tokens:
        for word in sentence:
            if word.text in word_freq.keys():
                if sentence not in sent_scores.keys():
                    sent_scores[sentence] = word_freq[word.text]
                else:
                    sent_scores[sentence] += word_freq[word.text]
    # print(sent_scores)

    select_length = int(len(sentence_tokens) * 0.2)
    # print(select_length)

    summary = nlargest(select_length, sent_scores, key=sent_scores.get)
    # print(summary)

    final_summary = [word.text for word in summary]
    summary = ' '.join(final_summary)
    # print(text)
    # print(summary)
    # print("length of original text",len(text.split(' ')))
    # print("length of summary text",len(summary.split(' ')))

    return summary, doc, len(rawdocs.split(' ')), len(summary.split(' '))


@app.route('/summarize', methods=['POST'])
def summarize():
    if request.method == 'POST':
        data = request.get_json()
        rawtext = data.get('rawtext')
        summary, _, len_original_text, len_summary = summarizer(rawtext)
        response_data = {
            'summary': summary,
            'len_original_text': len_original_text,
            'len_summary': len_summary
        }
        return jsonify(response_data)


if __name__ == "__main__":
    app.run(debug=True)
