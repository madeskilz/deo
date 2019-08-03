<?php $this->load->view("applicant/inc/header") ?>
<style>
    .sit_name {
        display: none;
    }
</style>
<div id="main-content">
    <div class="container">
        <div class="block-header">
            <div class="row">
                <div class="col-lg-6 col-md-8 col-sm-12">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:;"><i class="icon-home"></i></a></li>
                        <li class="breadcrumb-item active">Payment</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="row clearfix body">
                <div class="col-md-12">
                    <?php $this->load->view("err-inc/msg") ?>
                </div>
                <?php if (!$details->paid_application_fee) : ?>
                    <div class="col-md-12">
                        <p>
                            This is a payment of a nonrefundable fee of five thousand naira (&#8358; 5,000) only made on line with verve or master Card (ATM card).
                        </p>
                        <p>Alternatetively, you can pay into:</p>

                        <h6>Account Name: DEO GRATIAS INSTITUTE</h6>
                        <h6>Account NO: 1015208263</h6>
                        <h6>BANK: Zenith Bank</h6>

                    </div>
                    <div class="col-md-6">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th>
                                        Payment Details:
                                    </th>
                                    <td>
                                        Application Fee
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        Amount:
                                    </th>
                                    <td>
                                        &#8358; 5,000
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        Processing Fee:
                                    </th>
                                    <td>
                                        &#8358; 2,000
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        Total:
                                    </th>
                                    <td>
                                        &#8358; 7,000
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-6 row">
                        <div class="col-md-6">
                            <img src="<?= base_url("assets/logo/images.png") ?>" class="img-responsive" />
                        </div>
                        <div class="text-center col-md-6">
                            <img src="<?= base_url("assets/logo/mam.png") ?>" class="img-responsive" /><br />
                            <button class="btn btn-success btn-lg" id="payOnline">Pay Online</button>
                            <button class="btn btn-info btn-lg">Pay in Bank</button>
                        </div>
                    </div>
                <?php endif; ?>
                <?php if (count($payments) > 0) : ?>
                    <div class="col-md-12" style="margin-top:20px;">
                        <h4>Payment History</h4>
                        <table class="paymentsTable table">
                            <thead>
                                <tr>
                                    <th>S/N</th>
                                    <th>Payment</th>
                                    <th>Amount</th>
                                    <th>Date Initiated</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $cc = 1;
                                foreach ($payments as $payment) : ?>
                                    <tr>
                                        <td><?= $cc ?></td>
                                        <td><?= get_payment_type($payment->type) ?></td>
                                        <td><?= $payment->amount + $payment->charge ?></td>
                                        <td><?= neatDate($payment->date_initiated) ?></td>
                                        <td>
                                            <?php if ($payment->payment_status === "pending") : ?>
                                                <?php if ($payment->method === "online") : ?>
                                                    <?= $payment->payment_status ?> <a href="<?= base_url("payment/verifyOnlinePayment/$payment->id") ?>">Verify</a>
                                                <?php else : ?>
                                                    <?= $payment->payment_status ?> <a href="<?= base_url("payment/verifyBankPayment/$payment->id") ?>">Verify</a>
                                                <?php endif; ?>
                                            <?php else : ?>
                                                <?= $payment->payment_status ?>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                    <?php $cc++;
                                endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>
<?php $this->load->view("applicant/inc/footer") ?>