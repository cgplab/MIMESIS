test_that("classification works", {
    predictions <- suppressMessages(classify_samples(bc_data))
    expect_length(predictions, 737)
    predictions <- suppressMessages(classify_samples(bc_data, method="rpc"))
    expect_length(predictions, 737)
})
