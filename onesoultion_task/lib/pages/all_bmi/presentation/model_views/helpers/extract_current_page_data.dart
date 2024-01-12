List<Map<String, dynamic>> extractCurrentPageData(
    List<Map<String, dynamic>> bmiDataList, int currentPage, int itemsPerPage) {
  return bmiDataList.sublist(
    currentPage * itemsPerPage,
    (currentPage + 1) * itemsPerPage <= bmiDataList.length
        ? (currentPage + 1) * itemsPerPage
        : bmiDataList.length,
  );
}
