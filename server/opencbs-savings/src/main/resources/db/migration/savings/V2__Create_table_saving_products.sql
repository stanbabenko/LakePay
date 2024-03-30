create table saving_products (
  id                         bigserial      primary key,
  name                       varchar(200)   not null unique,
  code                       varchar(32)    not null unique,
  availability               int            not null,
  currency_id                int            not null references currencies (id),
  initial_amount_min         decimal(14, 2) not null,
  initial_amount_max         decimal(14, 2) not null,
  interest_rate_min          decimal(8, 4)  not null,
  interest_rate_max          decimal(8, 4)  not null,
  interest_accrual_frequency varchar(32)    not null,
  posting_frequency          varchar(32)    not null,
  capitalized                boolean        not null default false,
  deposit_amount_min         decimal(14, 2) not null,
  deposit_amount_max         decimal(14, 2) not null,
  deposit_fee_rate_min       decimal(14, 2),
  deposit_fee_rate_max       decimal(14, 2),
  deposit_fee_flat_min       decimal(14, 2),
  deposit_fee_flat_max       decimal(14, 2),
  withdrawal_amount_min      decimal(14, 2) not null,
  withdrawal_amount_max      decimal(14, 2) not null,
  withdrawal_fee_rate_min    decimal(14, 2),
  withdrawal_fee_rate_max    decimal(14, 2),
  withdrawal_fee_flat_min    decimal(14, 2),
  withdrawal_fee_flat_max    decimal(14, 2),
  transfer_amount_min        decimal(14, 2) not null,
  transfer_amount_max        decimal(14, 2) not null,
  transfer_fee_rate_min      decimal(14, 2),
  transfer_fee_rate_max      decimal(14, 2),
  transfer_fee_flat_min      decimal(14, 2),
  transfer_fee_flat_max      decimal(14, 2),
  management_fee_rate_min    decimal(14, 2),
  management_fee_rate_max    decimal(14, 2),
  management_fee_flat_min    decimal(14, 2),
  management_fee_flat_max    decimal(14, 2),
  management_fee_frequency   varchar(32)    not null,
  entry_fee_rate_min         decimal(14, 2),
  entry_fee_rate_max         decimal(14, 2),
  entry_fee_flat_min         decimal(14, 2),
  entry_fee_flat_max         decimal(14, 2),
  close_fee_rate_min         decimal(14, 2),
  close_fee_rate_max         decimal(14, 2),
  close_fee_flat_min         decimal(14, 2),
  close_fee_flat_max         decimal(14, 2)
);

create table saving_product_accounts (
  id                bigserial   primary key,
  type              varchar(50) not null,
  saving_product_id int         not null  references saving_products (id),
  account_id        int         not null  references accounts (id)
);