data {
  int<lower=1> N;
  real x[N];
  vector[N] y;
}
transformed data {
   profile("tdata");
   real sum_y = sum(y);
}
parameters {
  real<lower=0> rho;
  real<lower=0> alpha;
  real<lower=0> sigma;
}
transformed parameters {
   profile("transformed parameters", 1);
   matrix[N, N] cov1 = gp_exp_quad_cov(x, alpha, rho);
}
model {
   matrix[N, N] cov;
   matrix[N, N] L_cov;
   {
      profile("cov_exp_quad");
      cov =   gp_exp_quad_cov(x, alpha, rho)
                        + diag_matrix(rep_vector(sigma, N));
   }
   {
      profile("cholesky_decompose");
      L_cov = cholesky_decompose(cov);
   }   
   {
      profile("multi_normal_cholesky");
      rho ~ gamma(25, 4);
      alpha ~ normal(0, 2);
      sigma ~ normal(0, 1);

      y ~ multi_normal_cholesky(rep_vector(0, N), L_cov);
   }
   
}