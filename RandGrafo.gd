extends Node



# Called when the node enters the scene tree for the first time.
func _ready():
	randGrafo(10, 0)
	pass # Replace with function body.

	
func randGrafo(n, p):
	var g = get_node("Grafo")
	seed(int(OS.get_ticks_msec()))
	#inicializa o grafo
	g.ready(n)
	#cria uma arvore aleatoria
	var seq = []
	var sortedseq = []
	var howmany = [0, 0]
	for i in range(n-2):
		var x = randi()%n
		seq.append(x)
		sortedseq.append(x)
		howmany.append(0)
	sortedseq.sort()
	var heap = [-1]
	var j = 0
	for i in range(n):
		if (j >= n - 2 or sortedseq[j] != i):
			insert_heap(heap, i)
		else:
			while (j < n - 2 and sortedseq[j] == i):
				j += 1
				howmany[i] += 1
	for i in range(n-2):
		var v = del_min_heap(heap)
		g.add_edge(v, seq[i])
		howmany[seq[i]] -= 1
		if(howmany[seq[i]] == 0):
			insert_heap(heap, seq[i])
	var y = del_min_heap(heap)
	var z = del_min_heap(heap)
	g.adjs[y][z] = true
	#adiciona mais arestas aleatoriamente
	for i in range(n):
		for k in range(i+1, n):
			if(randf() < p and i!= j):
				g.add_edge(i, k)
	#calcula  geno
	var genus = g.a - n + 1
	var total = 0
	#sorteia valores pros vertices
	for i in range(n-1):
		var val = randi()%(2*n + 1) - n + 1
		total += val
		g.add_val(i, val)
	g.add_val(n-1, genus - total)
	
	g.draw_edges()

# heap funcions
func insert_heap(heap, val):
	var k = heap.size()
	heap.append(val)
	while (k/2) > 0:
		if (heap[k] < heap[k/2]):
			var tmp = heap[k/2]
			heap[k/2] = heap[k]
			heap[k] = tmp
		k = k/2

func del_min_heap(heap):
	var retval = heap[1]
	var k = heap.size() - 1
	heap[1] = heap[k]
	heap.pop_front()
	var i = 1
	while (i*2 < k):
		var mc = min_heap(heap, i)
		if (heap[i] > heap[mc]):
			var tmp = heap[i]
			heap[i] = heap[mc]
			heap[mc] = tmp 
		i = mc
	return retval
		
func min_heap(heap, i):
	var k = heap.size() - 1
	if (i*2 + 1 > k):
		return i*2
	else:
		if heap[i*2] < heap[i*2 + 1]:
			return i*2
		else:
			return i*2 + 1
