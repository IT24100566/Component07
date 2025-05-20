package com.ismysystem.inventorystocksystem.Service;

import com.ismysystem.inventorystocksystem.Model.Supplier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SupplierService {
    private List<Supplier> suppliers;

    public SupplierService() {
        this.suppliers = new ArrayList<>();
        // Dummy data
        suppliers.add(new Supplier(1L, "Supplier A", "123-456-7890", "suppliera@example.com"));
        suppliers.add(new Supplier(2L, "Supplier B", "987-654-3210", "supplierb@example.com"));
    }

    public List<Supplier> getAllSuppliers() {
        // Return sorted suppliers by ID using merge sort
        List<Supplier> sortedSuppliers = new ArrayList<>(suppliers);
        sortedSuppliers = mergeSort(sortedSuppliers);
        return sortedSuppliers;
    }

    public Supplier getSupplierById(Long id) {
        return suppliers.stream()
                .filter(supplier -> supplier.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    public void addSupplier(Supplier supplier) {
        if (supplier.getId() == null) {
            long newId = suppliers.isEmpty() ? 1 : suppliers.get(suppliers.size() - 1).getId() + 1;
            supplier.setId(newId);
        }
        suppliers.add(supplier);
    }

    public void updateSupplier(Supplier supplier) {
        suppliers.replaceAll(s -> s.getId().equals(supplier.getId()) ? supplier : s);
    }

    public void deleteSupplier(Long id) {
        suppliers.removeIf(supplier -> supplier.getId().equals(id));
    }

    // Merge Sort Implementation for sorting by Supplier ID
    private List<Supplier> mergeSort(List<Supplier> list) {
        if (list.size() <= 1) {
            return list;
        }

        int mid = list.size() / 2;
        List<Supplier> left = mergeSort(new ArrayList<>(list.subList(0, mid)));
        List<Supplier> right = mergeSort(new ArrayList<>(list.subList(mid, list.size())));

        return merge(left, right);
    }

    private List<Supplier> merge(List<Supplier> left, List<Supplier> right) {
        List<Supplier> merged = new ArrayList<>();
        int i = 0, j = 0;

        while (i < left.size() && j < right.size()) {
            if (left.get(i).getId() <= right.get(j).getId()) {
                merged.add(left.get(i));
                i++;
            } else {
                merged.add(right.get(j));
                j++;
            }
        }

        // Append remaining elements
        while (i < left.size()) {
            merged.add(left.get(i));
            i++;
        }
        while (j < right.size()) {
            merged.add(right.get(j));
            j++;
        }

        return merged;
    }
}
