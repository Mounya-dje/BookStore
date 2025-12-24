-- 70 Authors
INSERT INTO author (name, nationality, age) VALUES
('George Orwell', 'British', 46),
('J.K. Rowling', 'British', 58),
('Ernest Hemingway', 'American', 61),
('Gabriel García Márquez', 'Colombian', 87),
('Haruki Murakami', 'Japanese', 75),
('Jane Austen', 'British', 41),
('F. Scott Fitzgerald', 'American', 44),
('J.R.R. Tolkien', 'British', 81),
('Leo Tolstoy', 'Russian', 82),
('Virginia Woolf', 'British', 59),
('Stephen King', 'American', 76),
('Agatha Christie', 'British', 85),
('Chimamanda Ngozi Adichie', 'Nigerian', 46),
('Isabel Allende', 'Chilean', 81),
('Yuval Noah Harari', 'Israeli', 48),
('Mark Twain', 'American', 74),
('Charles Dickens', 'British', 58),
('William Shakespeare', 'British', 52),
('Emily Brontë', 'British', 30),
('Charlotte Brontë', 'British', 38),
('Franz Kafka', 'Czech', 40),
('James Joyce', 'Irish', 58),
('Toni Morrison', 'American', 88),
('Alice Walker', 'American', 80),
('Kazuo Ishiguro', 'British', 70),
('Margaret Atwood', 'Canadian', 85),
('John Steinbeck', 'American', 66),
('Ray Bradbury', 'American', 91),
('Isaac Asimov', 'American', 72),
('Arthur C. Clarke', 'British', 90),
('Frank Herbert', 'American', 65),
('Philip K. Dick', 'American', 53),
('Ursula K. Le Guin', 'American', 88),
('Neil Gaiman', 'British', 63),
('Terry Pratchett', 'British', 66),
('Dan Brown', 'American', 59),
('Paulo Coelho', 'Brazilian', 77),
('Khaled Hosseini', 'Afghan-American', 59),
('John Grisham', 'American', 69),
('Michael Crichton', 'American', 66),
('Gillian Flynn', 'American', 54),
('Donna Tartt', 'American', 60),
('Sylvia Plath', 'American', 30),
('Maya Angelou', 'American', 86),
('James Baldwin', 'American', 63),
('Ralph Ellison', 'American', 80),
('Jack Kerouac', 'American', 47),
('Allen Ginsberg', 'American', 70),
('Hunter S. Thompson', 'American', 67),
('George R.R. Martin', 'American', 76),
('Brandon Sanderson', 'American', 48),
('Patrick Rothfuss', 'American', 52),
('Robin Hobb', 'American', 72),
('Robert Jordan', 'American', 58),
('J.D. Salinger', 'American', 91),
('Kurt Vonnegut', 'American', 84),
('Joseph Heller', 'American', 76),
('Raymond Chandler', 'American', 70),
('Dashiell Hammett', 'American', 66),
('Arthur Conan Doyle', 'British', 71),
('Ian Fleming', 'British', 56),
('Roald Dahl', 'British', 74),
('C.S. Lewis', 'British', 64),
('Philip Pullman', 'British', 78),
('Jules Verne', 'French', 77),
('Victor Hugo', 'French', 83),
('Albert Camus', 'French-Algerian', 46),
('Jean-Paul Sartre', 'French', 74),
('Milan Kundera', 'French-Czech', 95),
('Hermann Hesse', 'German-Swiss', 85),
('Friedrich Nietzsche', 'German', 55),
('Franz Schubert', 'German', 31);


-- Alternative with 20 different categories
-- Simple structure: some categories have parent, some don't
INSERT INTO category (name_category, parent_category_id) VALUES
-- Top-level categories (no parent)
('Books', NULL),
('Magazines', NULL),
('E-books', NULL),

-- Categories with parent 1 (Books)
('Fiction', 1),
('Non-Fiction', 1),
('Academic', 1),

-- Categories with parent 4 (Fiction)
('Science Fiction', 4),
('Fantasy', 4),
('Mystery', 4),
('Romance', 4),

-- Categories with parent 5 (Non-Fiction)
('Biography', 5),
('History', 5),
('Science', 5),
('Self-Help', 5),

-- Categories with parent 6 (Academic)
('Mathematics', 6),
('Computer Science', 6),
('Engineering', 6),
('Medicine', 6),

-- Some with no parent
('Art & Photography', NULL),
('Cookbooks', NULL),
('Travel', NULL),
('Business', NULL);

-- 170 Books distributed among 70 authors (2-3 books per author)
INSERT INTO book (author_id, category_idc, nb_page, publication_year, language, title) VALUES
-- George Orwell (id=1, 3 books)
(1, 3, 328, 1949, 'English', '1984'),
(1, 5, 112, 1945, 'English', 'Animal Farm'),
(1, 8, 300, 1937, 'English', 'The Road to Wigan Pier'),

-- J.K. Rowling (id=2, 3 books)
(2, 4, 223, 1997, 'English', 'Harry Potter and the Philosopher''s Stone'),
(2, 4, 251, 1998, 'English', 'Harry Potter and the Chamber of Secrets'),
(2, 8, 320, 2012, 'English', 'The Casual Vacancy'),

-- Ernest Hemingway (id=3, 3 books)
(3, 8, 127, 1952, 'English', 'The Old Man and the Sea'),
(3, 8, 148, 1929, 'English', 'A Farewell to Arms'),
(3, 8, 192, 1926, 'English', 'The Sun Also Rises'),

-- Gabriel García Márquez (id=4, 3 books)
(4, 8, 417, 1967, 'Spanish', 'Cien años de soledad'),
(4, 6, 272, 1985, 'Spanish', 'El amor en los tiempos del cólera'),
(4, 8, 183, 1961, 'Spanish', 'El coronel no tiene quien le escriba'),

-- Haruki Murakami (id=5, 3 books)
(5, 8, 386, 1987, 'Japanese', 'Norwegian Wood'),
(5, 8, 436, 2002, 'Japanese', 'Kafka on the Shore'),
(5, 8, 607, 1994, 'Japanese', 'The Wind-Up Bird Chronicle'),

-- Jane Austen (id=6, 3 books)
(6, 6, 432, 1813, 'English', 'Pride and Prejudice'),
(6, 6, 479, 1815, 'English', 'Emma'),
(6, 6, 308, 1811, 'English', 'Sense and Sensibility'),

-- F. Scott Fitzgerald (id=7, 3 books)
(7, 8, 218, 1925, 'English', 'The Great Gatsby'),
(7, 8, 320, 1920, 'English', 'This Side of Paradise'),
(7, 8, 304, 1922, 'English', 'The Beautiful and Damned'),

-- J.R.R. Tolkien (id=8, 3 books)
(8, 4, 310, 1937, 'English', 'The Hobbit'),
(8, 4, 423, 1954, 'English', 'The Fellowship of the Ring'),
(8, 4, 352, 1954, 'English', 'The Two Towers'),

-- Leo Tolstoy (id=9, 3 books)
(9, 8, 1225, 1869, 'Russian', 'War and Peace'),
(9, 8, 864, 1877, 'Russian', 'Anna Karenina'),
(9, 8, 592, 1886, 'Russian', 'The Death of Ivan Ilyich'),

-- Virginia Woolf (id=10, 3 books)
(10, 8, 209, 1925, 'English', 'Mrs. Dalloway'),
(10, 8, 154, 1928, 'English', 'Orlando'),
(10, 8, 288, 1927, 'English', 'To the Lighthouse'),

-- Stephen King (id=11, 3 books)
(11, 10, 447, 1977, 'English', 'The Shining'),
(11, 10, 1138, 1978, 'English', 'The Stand'),
(11, 10, 416, 1974, 'English', 'Carrie'),

-- Agatha Christie (id=12, 3 books)
(12, 5, 256, 1934, 'English', 'Murder on the Orient Express'),
(12, 5, 192, 1926, 'English', 'The Murder of Roger Ackroyd'),
(12, 5, 224, 1920, 'English', 'The Mysterious Affair at Styles'),

-- Chimamanda Ngozi Adichie (id=13, 2 books)
(13, 8, 433, 2013, 'English', 'Americanah'),
(13, 8, 336, 2006, 'English', 'Half of a Yellow Sun'),

-- Isabel Allende (id=14, 2 books)
(14, 8, 481, 1982, 'Spanish', 'La casa de los espíritus'),
(14, 8, 352, 1984, 'Spanish', 'De amor y de sombra'),

-- Yuval Noah Harari (id=15, 2 books)
(15, 13, 512, 2011, 'Hebrew', 'Sapiens: A Brief History of Humankind'),
(15, 13, 464, 2015, 'Hebrew', 'Homo Deus: A Brief History of Tomorrow'),

-- Mark Twain (id=16, 2 books)
(16, 8, 366, 1884, 'English', 'Adventures of Huckleberry Finn'),
(16, 8, 224, 1876, 'English', 'The Adventures of Tom Sawyer'),

-- Charles Dickens (id=17, 2 books)
(17, 8, 544, 1850, 'English', 'David Copperfield'),
(17, 8, 448, 1843, 'English', 'A Christmas Carol'),

-- William Shakespeare (id=18, 3 books)
(18, 7, 320, 1603, 'English', 'Hamlet'),
(18, 7, 288, 1597, 'English', 'Romeo and Juliet'),
(18, 7, 256, 1606, 'English', 'Macbeth'),

-- Emily Brontë (id=19, 2 books)
(19, 8, 416, 1847, 'English', 'Wuthering Heights'),
(19, 6, 224, 1846, 'English', 'Poems by Currer, Ellis, and Acton Bell'),

-- Charlotte Brontë (id=20, 2 books)
(20, 8, 624, 1847, 'English', 'Jane Eyre'),
(20, 8, 432, 1849, 'English', 'Shirley'),

-- Franz Kafka (id=21, 2 books)
(21, 8, 224, 1925, 'German', 'The Trial'),
(21, 8, 192, 1915, 'German', 'The Metamorphosis'),

-- James Joyce (id=22, 2 books)
(22, 8, 730, 1922, 'English', 'Ulysses'),
(22, 8, 256, 1914, 'English', 'Dubliners'),

-- Toni Morrison (id=23, 2 books)
(23, 8, 321, 1987, 'English', 'Beloved'),
(23, 8, 305, 1970, 'English', 'The Bluest Eye'),

-- Alice Walker (id=24, 2 books)
(24, 8, 304, 1982, 'English', 'The Color Purple'),
(24, 8, 256, 1989, 'English', 'The Temple of My Familiar'),

-- Kazuo Ishiguro (id=25, 2 books)
(25, 8, 258, 1989, 'English', 'The Remains of the Day'),
(25, 8, 368, 2005, 'English', 'Never Let Me Go'),

-- Margaret Atwood (id=26, 2 books)
(26, 3, 311, 1985, 'English', 'The Handmaid''s Tale'),
(26, 8, 448, 2000, 'English', 'The Blind Assassin'),

-- John Steinbeck (id=27, 2 books)
(27, 8, 464, 1939, 'English', 'The Grapes of Wrath'),
(27, 8, 181, 1937, 'English', 'Of Mice and Men'),

-- Ray Bradbury (id=28, 2 books)
(28, 3, 256, 1953, 'English', 'Fahrenheit 451'),
(28, 3, 288, 1950, 'English', 'The Martian Chronicles'),

-- Isaac Asimov (id=29, 2 books)
(29, 3, 255, 1951, 'English', 'Foundation'),
(29, 3, 224, 1950, 'English', 'I, Robot'),

-- Arthur C. Clarke (id=30, 2 books)
(30, 3, 224, 1953, 'English', 'Childhood''s End'),
(30, 3, 304, 1968, 'English', '2001: A Space Odyssey'),

-- Frank Herbert (id=31, 2 books)
(31, 3, 412, 1965, 'English', 'Dune'),
(31, 3, 444, 1969, 'English', 'Dune Messiah'),

-- Philip K. Dick (id=32, 2 books)
(32, 3, 224, 1968, 'English', 'Do Androids Dream of Electric Sheep?'),
(32, 3, 192, 1959, 'English', 'Time Out of Joint'),

-- Ursula K. Le Guin (id=33, 2 books)
(33, 3, 192, 1969, 'English', 'The Left Hand of Darkness'),
(33, 4, 208, 1968, 'English', 'A Wizard of Earthsea'),

-- Neil Gaiman (id=34, 2 books)
(34, 4, 465, 2001, 'English', 'American Gods'),
(34, 4, 288, 2008, 'English', 'The Graveyard Book'),

-- Terry Pratchett (id=35, 2 books)
(35, 4, 285, 1983, 'English', 'The Colour of Magic'),
(35, 4, 224, 1990, 'English', 'Good Omens'),

-- Dan Brown (id=36, 2 books)
(36, 5, 454, 2003, 'English', 'The Da Vinci Code'),
(36, 5, 736, 2000, 'English', 'Angels & Demons'),

-- Paulo Coelho (id=37, 2 books)
(37, 8, 208, 1988, 'Portuguese', 'The Alchemist'),
(37, 8, 336, 1994, 'Portuguese', 'By the River Piedra I Sat Down and Wept'),

-- Khaled Hosseini (id=38, 2 books)
(38, 8, 371, 2003, 'English', 'The Kite Runner'),
(38, 8, 384, 2007, 'English', 'A Thousand Splendid Suns'),

-- John Grisham (id=39, 2 books)
(39, 5, 384, 1991, 'English', 'The Firm'),
(39, 5, 515, 1992, 'English', 'The Pelican Brief'),

-- Michael Crichton (id=40, 2 books)
(40, 3, 448, 1990, 'English', 'Jurassic Park'),
(40, 5, 352, 1980, 'English', 'The Andromeda Strain'),

-- Gillian Flynn (id=41, 2 books)
(41, 5, 432, 2012, 'English', 'Gone Girl'),
(41, 5, 368, 2006, 'English', 'Sharp Objects'),

-- Donna Tartt (id=42, 2 books)
(42, 8, 784, 1992, 'English', 'The Secret History'),
(42, 8, 771, 2002, 'English', 'The Little Friend'),

-- Sylvia Plath (id=43, 2 books)
(43, 8, 244, 1963, 'English', 'The Bell Jar'),
(43, 7, 224, 1965, 'English', 'Ariel'),

-- Maya Angelou (id=44, 2 books)
(44, 12, 289, 1969, 'English', 'I Know Why the Caged Bird Sings'),
(44, 7, 64, 1978, 'English', 'And Still I Rise'),

-- James Baldwin (id=45, 2 books)
(45, 8, 192, 1956, 'English', 'Giovanni''s Room'),
(45, 8, 256, 1953, 'English', 'Go Tell It on the Mountain'),

-- Ralph Ellison (id=46, 1 book)
(46, 8, 581, 1952, 'English', 'Invisible Man'),

-- Jack Kerouac (id=47, 1 book)
(47, 8, 320, 1957, 'English', 'On the Road'),

-- Allen Ginsberg (id=48, 1 book)
(48, 7, 112, 1956, 'English', 'Howl and Other Poems'),

-- Hunter S. Thompson (id=49, 1 book)
(49, 5, 204, 1971, 'English', 'Fear and Loathing in Las Vegas'),

-- George R.R. Martin (id=50, 1 book)
(50, 4, 694, 1996, 'English', 'A Game of Thrones'),

-- Brandon Sanderson (id=51, 1 book)
(51, 4, 1007, 2009, 'English', 'The Way of Kings'),

-- Patrick Rothfuss (id=52, 1 book)
(52, 4, 722, 2007, 'English', 'The Name of the Wind'),

-- Robin Hobb (id=53, 1 book)
(53, 4, 464, 1995, 'English', 'Assassin''s Apprentice'),

-- Robert Jordan (id=54, 1 book)
(54, 4, 814, 1990, 'English', 'The Eye of the World'),

-- J.D. Salinger (id=55, 1 book)
(55, 8, 277, 1951, 'English', 'The Catcher in the Rye'),

-- Kurt Vonnegut (id=56, 1 book)
(56, 3, 215, 1969, 'English', 'Slaughterhouse-Five'),

-- Joseph Heller (id=57, 1 book)
(57, 8, 453, 1961, 'English', 'Catch-22'),

-- Raymond Chandler (id=58, 1 book)
(58, 5, 277, 1939, 'English', 'The Big Sleep'),

-- Dashiell Hammett (id=59, 1 book)
(59, 5, 208, 1930, 'English', 'The Maltese Falcon'),

-- Arthur Conan Doyle (id=60, 2 books)
(60, 5, 246, 1887, 'English', 'A Study in Scarlet'),
(60, 5, 192, 1890, 'English', 'The Sign of the Four'),

-- Ian Fleming (id=61, 1 book)
(61, 5, 213, 1953, 'English', 'Casino Royale'),

-- Roald Dahl (id=62, 1 book)
(62, 4, 176, 1964, 'English', 'Charlie and the Chocolate Factory'),

-- C.S. Lewis (id=63, 2 books)
(63, 4, 172, 1950, 'English', 'The Lion, the Witch and the Wardrobe'),
(63, 16, 160, 1942, 'English', 'The Screwtape Letters'),

-- Philip Pullman (id=64, 1 book)
(64, 4, 399, 1995, 'English', 'Northern Lights'),

-- Jules Verne (id=65, 2 books)
(65, 3, 192, 1870, 'French', 'Twenty Thousand Leagues Under the Sea'),
(65, 3, 224, 1873, 'French', 'Around the World in Eighty Days'),

-- Victor Hugo (id=66, 2 books)
(66, 8, 1488, 1862, 'French', 'Les Misérables'),
(66, 8, 940, 1831, 'French', 'The Hunchback of Notre-Dame'),

-- Albert Camus (id=67, 2 books)
(67, 8, 185, 1942, 'French', 'The Stranger'),
(67, 8, 147, 1947, 'French', 'The Plague'),

-- Jean-Paul Sartre (id=68, 1 book)
(68, 16, 178, 1943, 'French', 'Being and Nothingness'),

-- Milan Kundera (id=69, 1 book)
(69, 8, 336, 1984, 'French', 'The Unbearable Lightness of Being'),

-- Hermann Hesse (id=70, 2 books)
(70, 8, 152, 1922, 'German', 'Siddhartha'),
(70, 8, 288, 1927, 'German', 'Steppenwolf'),







-- Continue with the remaining books to reach 170
-- Friedrich Nietzsche (id=71, 2 books)
(71, 16, 150, 1883, 'German', 'Thus Spoke Zarathustra'),
(71, 16, 192, 1886, 'German', 'Beyond Good and Evil'),

-- Franz Schubert (id=72, 1 book - though he's a composer, we'll add a biography)
(72, 11, 320, 2020, 'German', 'Schubert: The Biography'),

-- Let's add more books to existing authors to reach 170
-- Back to some existing authors for more books:

-- Mark Twain (id=16, additional book)
(16, 12, 288, 1889, 'English', 'A Connecticut Yankee in King Arthur''s Court'),

-- Charles Dickens (id=17, additional book)
(17, 8, 512, 1861, 'English', 'Great Expectations'),

-- William Shakespeare (id=18, additional book)
(18, 7, 272, 1600, 'English', 'A Midsummer Night''s Dream'),

-- Emily Brontë (id=19, additional book)
(19, 7, 96, 1846, 'English', 'Selected Poems'),

-- Charlotte Brontë (id=20, additional book)
(20, 8, 384, 1853, 'English', 'Villette'),

-- Franz Kafka (id=21, additional book)
(21, 8, 176, 1919, 'German', 'In the Penal Colony'),

-- James Joyce (id=22, additional book)
(22, 8, 628, 1939, 'English', 'Finnegans Wake'),

-- Toni Morrison (id=23, additional book)
(23, 8, 288, 1973, 'English', 'Sula'),

-- Alice Walker (id=24, additional book)
(24, 16, 192, 1983, 'English', 'In Search of Our Mothers'' Gardens'),

-- Kazuo Ishiguro (id=25, additional book)
(25, 8, 282, 2000, 'English', 'When We Were Orphans'),

-- Margaret Atwood (id=26, additional book)
(26, 8, 512, 2003, 'English', 'Oryx and Crake'),

-- John Steinbeck (id=27, additional book)
(27, 8, 455, 1952, 'English', 'East of Eden'),

-- Ray Bradbury (id=28, additional book)
(28, 3, 336, 1957, 'English', 'Dandelion Wine'),

-- Isaac Asimov (id=29, additional book)
(29, 3, 288, 1952, 'English', 'Foundation and Empire'),

-- Arthur C. Clarke (id=30, additional book)
(30, 3, 256, 1973, 'English', 'Rendezvous with Rama'),

-- Frank Herbert (id=31, additional book)
(31, 3, 416, 1976, 'English', 'Children of Dune'),

-- Philip K. Dick (id=32, additional book)
(32, 3, 224, 1962, 'English', 'The Man in the High Castle'),

-- Ursula K. Le Guin (id=33, additional book)
(33, 3, 304, 1974, 'English', 'The Dispossessed'),

-- Neil Gaiman (id=34, additional book)
(34, 4, 624, 1999, 'English', 'Stardust'),

-- Terry Pratchett (id=35, additional book)
(35, 4, 288, 1991, 'English', 'Mort'),

-- Dan Brown (id=36, additional book)
(36, 5, 624, 2009, 'English', 'The Lost Symbol'),

-- Paulo Coelho (id=37, additional book)
(37, 8, 224, 1997, 'Portuguese', 'Veronika Decides to Die'),

-- Khaled Hosseini (id=38, additional book)
(38, 8, 432, 2013, 'English', 'And the Mountains Echoed'),

-- John Grisham (id=39, additional book)
(39, 5, 448, 1995, 'English', 'The Rainmaker'),

-- Michael Crichton (id=40, additional book)
(40, 5, 464, 1996, 'English', 'Airframe'),

-- Gillian Flynn (id=41, additional book)
(41, 5, 336, 2009, 'English', 'Dark Places'),

-- Donna Tartt (id=42, additional book)
(42, 8, 771, 2013, 'English', 'The Goldfinch'),

-- Sylvia Plath (id=43, additional book)
(43, 7, 96, 1960, 'English', 'The Colossus and Other Poems'),

-- Maya Angelou (id=44, additional book)
(44, 12, 214, 1974, 'English', 'Gather Together in My Name'),

-- James Baldwin (id=45, additional book)
(45, 8, 192, 1962, 'English', 'Another Country'),

-- Ralph Ellison (id=46, additional book - now 2 books)
(46, 8, 368, 1964, 'English', 'Shadow and Act'),

-- Jack Kerouac (id=47, additional book - now 2 books)
(47, 8, 320, 1958, 'English', 'The Dharma Bums'),

-- Allen Ginsberg (id=48, additional book - now 2 books)
(48, 7, 128, 1961, 'English', 'Kaddish and Other Poems');

