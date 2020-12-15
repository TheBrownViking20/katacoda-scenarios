## TfidfVectorizer
`CountVectorizer` is a simple method for encoding text but it has some shortcomings. Articles and propositions like "the", "and", "is", "on", etc. can frequently occur in documents and as these words don't provide much context about the documents, it is not ideal for them to be the high frequency elements in the vectors. `TfidfVectorizer` can solve this. TFIDF or term frequency–inverse document frequency is a statistic that expresses how important a word is to a document in a collection of documents. Term Frequency associates words with their frequencies in the document while inverse document frequency highlights the words which are frequent in very few specific documents as opposed to words like "the" and "and", which are likely to appear in most documents. For example, in a given set of documents, words like "cinnamon" and "cilantro" can be considered important as they only appear in documents containing food recipes or words like "capacitive" and "megapixel" can be considered important as they only appear in articles about smartphones.

Let's see an example of `TfidfVectorizer`. Copy the following code to the editor:

<pre class="file" data-filename="la.py" data-target="replace">
# Importing TfidfVectorizer
from sklearn.feature_extraction.text import TfidfVectorizer

# Using two documents
text = [
    "Two roads diverged in a wood and I took the one less traveled by, and that has made all the difference.",
    "The best way out is always through."
]

# A TfidfVectorizer object
vectorizer = TfidfVectorizer()

# This method tokenizes text and generates vocabulary
vectorizer.fit(text)

print("Generated Vocabulary:")
print(vectorizer.vocabulary_)

print("\nNumber of words in the document:")
print(len(text[0].split()) + len(text[1].split()))

print("\nNumber of words in the vocabulary:")
print(len(vectorizer.vocabulary_))

print("\nInverse document frequency:")
print(vectorizer.idf_)

# Transforming document into a vector based on vocabulary
vector = vectorizer.transform(text)

print("\nShape of the transformed vectors:")
print(vector.shape)

print("\nVector representation of the documents:")
print(vector.toarray())
</pre>

Run `la.py` using the following command:

`python3 la.py`{{execute}}

In the output of the above code, "the" is the 17th element of the inverse document frequency vector and has the lowest IDF value. This is due to the fact that it appears in both documents. All other words in the vocabulary only occur in one document. The elements in vector representations have been normalized between 0 and 1.

Let's see an example with more documents. Copy the following code to the editor:

<pre class="file" data-filename="la.py" data-target="replace">
# Importing TfidfVectorizer
from sklearn.feature_extraction.text import TfidfVectorizer

# Using two documents
text = [
    "Two roads diverged in a wood and I took the one less traveled by, and that has made all the difference.",
    "The best way out is always through.",
    "The best things and best people rise out of their separateness."
]

# A TfidfVectorizer object
vectorizer = TfidfVectorizer()

# This method tokenizes text and generates vocabulary
vectorizer.fit(text)

print("Generated Vocabulary:")
print(vectorizer.vocabulary_)

print("\nNumber of words in the document:")
print(sum([len(i.split()) for i in text]))

print("\nNumber of words in the vocabulary:")
print(len(vectorizer.vocabulary_))

print("\nInverse document frequency:")
print(vectorizer.idf_)

# Transforming document into a vector based on vocabulary
vector = vectorizer.transform(text)

print("\nShape of the transformed vectors:")
print(vector.shape)

print("\nVector representation of the documents:")
print(vector.toarray())
</pre>

Run `la.py` using the following command:

`python3 la.py`{{execute}}

The word, "the" still has the lowest inverse document frequency and now words like "and", "best" and "out" also have lower frequencies. All other words are important and unique to their respective documents.