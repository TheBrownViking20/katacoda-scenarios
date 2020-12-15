## Text as vectors
Today, we have chatbots all over the internet that have simplified and automated processes like sales, onboarding, etc., for thousands of organizations. We have artificial intelligence based question answering systems that are beating benchmark scores set by human beings. We have deep learning models that are capable of generating entire essays that are indistinguishable from human-written ones. All these tasks require large amounts of training data but how do algorithms and machine learning models understand human-written text data. The answer is vectors. 

Vectors are the fundamental entity in the field of linear algebra and are responsible for rapid development in the field of Natural Language Processing in the last few decades. Any document, sentence or even a word in a given dataset is represent as a unique vector, its configuration is decided by the other vectors in the dataset (vocabulary). 

## Natural Language Processing
According to [Wikipedia](https://en.wikipedia.org/wiki/Natural_language_processing), Natural Language Processing (NLP) is a subfield of linguistics,  computer science, and artificial intelligence concerned with the interactions between computers and human language, in particular how to program computers to process and analyze large amounts of natural language data. NLP is a vast field with many tasks, features and utilites but we are only going to focus on different processes used to encode text data and process it.

## Bag-of-Words model
A simple model for encoding text is the Bag-of-Words model. This model ignores the order of occurence of words in the given data and focuses on the frequency of their occurence. Each word is represented by a unique number. This way, any document can be expressed as a fixed-length vector, its length being equal to the vocabulary of the data i.e., the total number  of distinct words in the data.

Let's study some methods that extend the Bag-of-Words model to encode text data. 

## CountVectorizer
We can use a `CountVectorizer` object provided by `Scikit-Learn` to express a document in the form of a vector based on word counts of the words present in the generated vocablury. Let's see an example. Copy the following code to the editor:

<pre class="file" data-filename="la.py" data-target="replace">
# Importing CountVectorizer
from sklearn.feature_extraction.text import CountVectorizer

# Using only one document
text = ["Two roads diverged in a wood and I took the one less traveled by, and that has made all the difference."]

# A CountVectorizer object
vectorizer = CountVectorizer()

# This method tokenizes text and generates vocabulary
vectorizer.fit(text)

print("Generated Vocabulary:")
print(vectorizer.vocabulary_)

print("\nNumber of words in the document:")
print(len(text[0].split()))

print("\nNumber of words in the vocabulary:")
print(len(vectorizer.vocabulary_))

# Transforming document into a vector based on vocabulary
vector = vectorizer.transform(text)

print("\nShape of the transformed vector:")
print(vector.shape)

print("\nVector representation of the document:")
print(vector.toarray())
</pre>

Run `la.py` using the following command:

`python3 la.py`{{execute}}

In the above code, we provided only one document to our `CountVectorizer` object. This document contained 21 words. Fitting out `CountVectorizer` object tokenized this document and generated vocabulary. This vocabulary contained 17 distinct words ("and" and "the" were repeated 2 times). All words are in lowercase and punctuation has been removed. Once we transformed our document with `CountVectorizer`, we got a vector containing 17 elements. This is equal to the number of words in the generated vocabulary. A unique number is assigned to each word in the vocabulary. If a word is assigned a number *i* in the vocabulary, it will be represented in any generated vector on the *i* + 1 th position, its value being its number of occurences in the document. In the given vector, "all" is assigned the number 0 due to alphabetical order and so it appears as the first element in the vector. Its value is 1 is it occurs only once. Similarly, the word "and" is assigned number and so it appears as the second element in the vector. Its value is 2 as it appears twice.     

Let's see an example with more documents. Copy the following code to the editor:

<pre class="file" data-filename="la.py" data-target="replace">
# Importing CountVectorizer
from sklearn.feature_extraction.text import CountVectorizer

# Using two documents
text = [
    "Two roads diverged in a wood and I took the one less traveled by, and that has made all the difference.",
    "The best way out is always through."
]

# A CountVectorizer object
vectorizer = CountVectorizer()

# This method tokenizes text and generates vocabulary
vectorizer.fit(text)

print("Generated Vocabulary:")
print(vectorizer.vocabulary_)

print("\nNumber of words in the document:")
print(len(text[0].split()) + len(text[1].split()))

print("\nNumber of words in the vocabulary:")
print(len(vectorizer.vocabulary_))

# Transforming document into a vector based on vocabulary
vector = vectorizer.transform(text)

print("\nShape of the transformed vectors:")
print(vector.shape)

print("\nVector representation of the documents:")
print(vector.toarray())
</pre>

Run `la.py` using the following command:

`python3 la.py`{{execute}}

Now, the vocabulary contains 23 words due to the addition of another document. The two generated vectors now have 23 elements each. Some elements in both vectors are 0 as some words are exclusive to a document.