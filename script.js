document.addEventListener('DOMContentLoaded', () => {
    loadProducts();

    const form = document.getElementById('productForm');
    const addBtn = document.getElementById('addBtn');
    const updateBtn = document.getElementById('updateBtn');
    const resetBtn = document.getElementById('resetBtn');

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        const id = document.getElementById('productId').value;
        const product = {
            name: document.getElementById('name').value,
            category: document.getElementById('category').value,
            description: document.getElementById('description').value,
            rate: document.getElementById('rate').value
        };

        if (id) {
            updateProduct(id, product);
        } else {
            addProduct(product);
        }
    });

    resetBtn.addEventListener('click', () => {
        form.reset();
        document.getElementById('productId').value = '';
        addBtn.style.display = 'block';
        updateBtn.style.display = 'none';
    });
});

function loadProducts() {
    fetch('get_products.php')
        .then(response => response.json())
        .then(data => {
            const productList = document.getElementById('productList');
            productList.innerHTML = '';
            data.forEach(product => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.category}</td>
                    <td>${product.description}</td>
                    <td>${product.rate}</td>
                    <td>
                        <button class="edit" onclick="editProduct(${product.id})">Edit</button>
                        <button class="delete" onclick="deleteProduct(${product.id})">Delete</button>
                    </td>
                `;
                productList.appendChild(row);
            });
        });
}

function addProduct(product) {
    fetch('add_product.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(product)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            loadProducts();
            document.getElementById('productForm').reset();
        } else {
            alert('Error adding product');
        }
    });
}

function editProduct(id) {
    fetch(`get_products.php?id=${id}`)
        .then(response => response.json())
        .then(product => {
            document.getElementById('productId').value = product.id;
            document.getElementById('name').value = product.name;
            document.getElementById('category').value = product.category;
            document.getElementById('description').value = product.description;
            document.getElementById('rate').value = product.rate;
            document.getElementById('addBtn').style.display = 'none';
            document.getElementById('updateBtn').style.display = 'block';
        });
}

function updateProduct(id, product) {
    fetch('update_product.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id, ...product })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            loadProducts();
            document.getElementById('productForm').reset();
            document.getElementById('productId').value = '';
            document.getElementById('addBtn').style.display = 'block';
            document.getElementById('updateBtn').style.display = 'none';
        } else {
            alert('Error updating product');
        }
    });
}

function deleteProduct(id) {
    if (confirm('Are you sure you want to delete this product?')) {
        fetch(`delete_product.php?id=${id}`, { method: 'DELETE' })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    loadProducts();
                } else {
                    alert('Error deleting product');
                }
            });
    }
}