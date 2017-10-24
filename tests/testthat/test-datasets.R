context("CABIOS 1995 datasets")

test_that("Protein data is correct", {
  expect_equal(exists('ProtComp'), TRUE);
  expect_is(ProtComp, 'data.frame');
  
  df <- ProtComp;
  expect_equal(ncol(df), 999);
  expect_equal(nrow(df),  20);

  summ <- summary(df[,1]);
  expect_equal(summ[['Mean']], 11.15);
  expect_equal(sd(df[,1]), 5.8604382807180);
});

test_that("Amino-acid data is correct", {
  expect_equal(exists('IndiceVals'), TRUE);
  expect_is(IndiceVals, 'data.frame');
  
  df <- IndiceVals;
  expect_equal(ncol(df), 402);
  expect_equal(nrow(df),  20);

  summ <- summary(df[,1]);
  expect_equal(summ[['Mean']], 4.418);
  expect_equal(sd(df[,1]), 0.2562662);
});
