test_that("make_glmnet_model works", {
    glmnet_model <- suppressWarnings(make_glmnet_model(bc_data, bc_subtypes, cores=20))
    expect_type(glmnet_model, "list")
}
