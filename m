Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAC222FA5B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 22:50:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4586516A1;
	Mon, 27 Jul 2020 22:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4586516A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595883047;
	bh=pW+dmpeW0GH3qk/Sw8xs7K8ACtT404J7nnnCoYsf1wY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NZJuug/wahpYssQRmkCGdit08HDOOdwJQnLd/qhwk4wf9E81Ujw7tWJ8dXyic2+bv
	 KdZpnnDK8ukgj5kXW0KxgKYbNZOP+/9O6Jzu9+geTHu/F3GkzQc2NyczPrGJHDtZlI
	 aacIwt3QnGvjK9xcJ+IiRDgFi9M6J7LN4iUm6C08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 693B9F800AD;
	Mon, 27 Jul 2020 22:49:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1E2AF80171; Mon, 27 Jul 2020 22:49:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5454F800DE
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 22:48:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5454F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="iLaBtnq6"
Received: by mail-pg1-x543.google.com with SMTP id k27so10625798pgm.2
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 13:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cl8j7GopTyZRJUUXdEXAzgEZa0nsCpMSIg/iqYNRNJI=;
 b=iLaBtnq6xWHbjfS9QuQUioSxC170WYAeutNLBQNmsMY9Y5mX4ojCA5wgEOGVS8YKK9
 Zhnmc63uw2QgH+kTs90etqDqnzopdR3s57ppLc/b3RXAl9YxGF4x5P9vW410qZyxeU2i
 R+g6Sc76SziFatI+tH9MDVVyPtjHG+78wlE+8NCVMYjAnwkxd/aKj7o6Rt6VqK1KCHgF
 At2PEyVi6sodJmb7NuOz8V4OBbZeHTxo5y6EW6OMyaRfqm0t3Oi722HGRLk2BkUdLW61
 EQixGImDS8VRcz0HoTaUwecOxP0DX793COr0JYu0+mJVUGI+Lczxa3N7Ck35M4FfNScp
 +kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cl8j7GopTyZRJUUXdEXAzgEZa0nsCpMSIg/iqYNRNJI=;
 b=AuWuAOz5EH4Zrm1KxAxbnTvY8EMoje9JcBOu2gVNtaYqfWq7baOJytq5vVsSAeQMoz
 26fTxUD6NWMnmvms9mOrTf0VQoZGTgeYC8GazuV9LNLPDmq30407XZvtHCkWv5Qahna/
 PAT8vqtBf0DRbX0C9EHmHwIlyhb1lAtX4XR905JuQCf1Axezbhh1PxF26LYljcBrsLtR
 Os+Hr9lJLhR3wWkTomTTkcuc3xooDQ0VhTaugFxSzEvrmLAw5lD+UeJe2iDQzgYvT2X/
 7XQQV6rPW8S0JpnCqCk4X08hmQuASe1/eDkQvnsMIs7mOpS2n/PDeE1VlELY9Ux45bqd
 x7VQ==
X-Gm-Message-State: AOAM532kYz+U2XqCNL9RmFW5nD9MsFTNta+t6h5e8q6RHIN6HiS0Acy3
 HAj3fn5QR2EYZLQVwt020WqPRw==
X-Google-Smtp-Source: ABdhPJzCJt3/kFYjKdCkjcIMaqcvuRRHbskkoYcAp1VnT157e73YyUuEdxYzSE508CB7pOpy9v5aTQ==
X-Received: by 2002:aa7:9f46:: with SMTP id h6mr2443306pfr.321.1595882934807; 
 Mon, 27 Jul 2020 13:48:54 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id n15sm535816pjf.12.2020.07.27.13.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 13:48:54 -0700 (PDT)
Date: Mon, 27 Jul 2020 13:45:21 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: ????????? <wenhu.wang@vivo.com>
Subject: Re: [PATCH] soc: qmi: allow user to set handle wq to hiprio
Message-ID: <20200727204521.GB229995@builder.lan>
References: <AMoAtwB9DXJsyd-1khUpzqq9.1.1595862196133.Hmail.wenhu.wang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AMoAtwB9DXJsyd-1khUpzqq9.1.1595862196133.Hmail.wenhu.wang@vivo.com>
Cc: ohad@wizery.com, linux-wireless@vger.kernel.org,
 alsa-devel@alsa-project.org, elder@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, ath11k@lists.infradead.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, sibis@codeaurora.org, netdev@vger.kernel.org,
 kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon 27 Jul 08:03 PDT 2020, ????????? wrote:

> Currently the qmi_handle is initialized single threaded and strictly
> ordered with the active set to 1. This is pretty simple and safe but
> sometimes ineffency. So it is better to allow user to decide whether
> a high priority workqueue should be used.

Can you please describe a scenario where this is needed/desired and
perhaps also comment on why this is not always desired?

Regards,
Bjorn

> 
> Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
> ---
>  drivers/net/ipa/ipa_qmi.c             | 4 ++--
>  drivers/net/wireless/ath/ath10k/qmi.c | 2 +-
>  drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
>  drivers/remoteproc/qcom_sysmon.c      | 2 +-
>  drivers/slimbus/qcom-ngd-ctrl.c       | 4 ++--
>  drivers/soc/qcom/pdr_interface.c      | 4 ++--
>  drivers/soc/qcom/qmi_interface.c      | 9 +++++++--
>  include/linux/soc/qcom/qmi.h          | 3 ++-
>  samples/qmi/qmi_sample_client.c       | 4 ++--
>  9 files changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
> index 5090f0f923ad..d78b0fe6bd83 100644
> --- a/drivers/net/ipa/ipa_qmi.c
> +++ b/drivers/net/ipa/ipa_qmi.c
> @@ -486,7 +486,7 @@ int ipa_qmi_setup(struct ipa *ipa)
>  	 */
>  	ret = qmi_handle_init(&ipa_qmi->server_handle,
>  			      IPA_QMI_SERVER_MAX_RCV_SZ, &ipa_server_ops,
> -			      ipa_server_msg_handlers);
> +			      ipa_server_msg_handlers, 0);
>  	if (ret)
>  		return ret;
>  
> @@ -500,7 +500,7 @@ int ipa_qmi_setup(struct ipa *ipa)
>  	 */
>  	ret = qmi_handle_init(&ipa_qmi->client_handle,
>  			      IPA_QMI_CLIENT_MAX_RCV_SZ, &ipa_client_ops,
> -			      ipa_client_msg_handlers);
> +			      ipa_client_msg_handlers, 0);
>  	if (ret)
>  		goto err_server_handle_release;
>  
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index 5468a41e928e..02881882b4d9 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -1034,7 +1034,7 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
>  
>  	ret = qmi_handle_init(&qmi->qmi_hdl,
>  			      WLFW_BDF_DOWNLOAD_REQ_MSG_V01_MAX_MSG_LEN,
> -			      &ath10k_qmi_ops, qmi_msg_handler);
> +			      &ath10k_qmi_ops, qmi_msg_handler, 0);
>  	if (ret)
>  		goto err;
>  
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index c00a99ad8dbc..91394d58d36e 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -2397,7 +2397,7 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
>  
>  	ab->qmi.target_mem_mode = ATH11K_QMI_TARGET_MEM_MODE_DEFAULT;
>  	ret = qmi_handle_init(&ab->qmi.handle, ATH11K_QMI_RESP_LEN_MAX,
> -			      &ath11k_qmi_ops, ath11k_qmi_msg_handlers);
> +			      &ath11k_qmi_ops, ath11k_qmi_msg_handlers, 0);
>  	if (ret < 0) {
>  		ath11k_warn(ab, "failed to initialize qmi handle\n");
>  		return ret;
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index 8d8996d714f0..4ec470e424ef 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -614,7 +614,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>  	}
>  
>  	ret = qmi_handle_init(&sysmon->qmi, SSCTL_MAX_MSG_LEN, &ssctl_ops,
> -			      qmi_indication_handler);
> +			      qmi_indication_handler, 0);
>  	if (ret < 0) {
>  		dev_err(sysmon->dev, "failed to initialize qmi handle\n");
>  		kfree(sysmon);
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 743ee7b4e63f..ba76691fc5a5 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -446,7 +446,7 @@ static int qcom_slim_qmi_init(struct qcom_slim_ngd_ctrl *ctrl,
>  		return -ENOMEM;
>  
>  	rc = qmi_handle_init(handle, SLIMBUS_QMI_POWER_REQ_MAX_MSG_LEN,
> -				NULL, qcom_slim_qmi_msg_handlers);
> +				NULL, qcom_slim_qmi_msg_handlers, 0);
>  	if (rc < 0) {
>  		dev_err(ctrl->dev, "QMI client init failed: %d\n", rc);
>  		goto qmi_handle_init_failed;
> @@ -1293,7 +1293,7 @@ static int qcom_slim_ngd_qmi_svc_event_init(struct qcom_slim_ngd_ctrl *ctrl)
>  	int ret;
>  
>  	ret = qmi_handle_init(&qmi->svc_event_hdl, 0,
> -				&qcom_slim_ngd_qmi_svc_event_ops, NULL);
> +				&qcom_slim_ngd_qmi_svc_event_ops, NULL, 0);
>  	if (ret < 0) {
>  		dev_err(ctrl->dev, "qmi_handle_init failed: %d\n", ret);
>  		return ret;
> diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
> index bdcf16f88a97..cc1cb90c1968 100644
> --- a/drivers/soc/qcom/pdr_interface.c
> +++ b/drivers/soc/qcom/pdr_interface.c
> @@ -685,7 +685,7 @@ struct pdr_handle *pdr_handle_alloc(void (*status)(int state,
>  
>  	ret = qmi_handle_init(&pdr->locator_hdl,
>  			      SERVREG_GET_DOMAIN_LIST_RESP_MAX_LEN,
> -			      &pdr_locator_ops, NULL);
> +			      &pdr_locator_ops, NULL, 0);
>  	if (ret < 0)
>  		goto destroy_indack;
>  
> @@ -696,7 +696,7 @@ struct pdr_handle *pdr_handle_alloc(void (*status)(int state,
>  	ret = qmi_handle_init(&pdr->notifier_hdl,
>  			      SERVREG_STATE_UPDATED_IND_MAX_LEN,
>  			      &pdr_notifier_ops,
> -			      qmi_indication_handler);
> +			      qmi_indication_handler, 0);
>  	if (ret < 0)
>  		goto release_qmi_handle;
>  
> diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
> index 1a03eaa38c46..01160dbfc4d0 100644
> --- a/drivers/soc/qcom/qmi_interface.c
> +++ b/drivers/soc/qcom/qmi_interface.c
> @@ -609,6 +609,7 @@ static struct socket *qmi_sock_create(struct qmi_handle *qmi,
>   * @recv_buf_size: maximum size of incoming message
>   * @ops:	reference to callbacks for QRTR notifications
>   * @handlers:	NULL-terminated list of QMI message handlers
> + * @hiprio:	whether high priority worker is used for workqueue
>   *
>   * This initializes the QMI client handle to allow sending and receiving QMI
>   * messages. As messages are received the appropriate handler will be invoked.
> @@ -617,9 +618,11 @@ static struct socket *qmi_sock_create(struct qmi_handle *qmi,
>   */
>  int qmi_handle_init(struct qmi_handle *qmi, size_t recv_buf_size,
>  		    const struct qmi_ops *ops,
> -		    const struct qmi_msg_handler *handlers)
> +		    const struct qmi_msg_handler *handlers,
> +		    unsigned int hiprio)
>  {
>  	int ret;
> +	unsigned int flags = WQ_UNBOUND;
>  
>  	mutex_init(&qmi->txn_lock);
>  	mutex_init(&qmi->sock_lock);
> @@ -647,7 +650,9 @@ int qmi_handle_init(struct qmi_handle *qmi, size_t recv_buf_size,
>  	if (!qmi->recv_buf)
>  		return -ENOMEM;
>  
> -	qmi->wq = alloc_workqueue("qmi_msg_handler", WQ_UNBOUND, 1);
> +	if (hiprio)
> +		flags |= WQ_HIGHPRI;
> +	qmi->wq = alloc_workqueue("qmi_msg_handler", flags, 1);
>  	if (!qmi->wq) {
>  		ret = -ENOMEM;
>  		goto err_free_recv_buf;
> diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
> index e712f94b89fc..24062fd7163d 100644
> --- a/include/linux/soc/qcom/qmi.h
> +++ b/include/linux/soc/qcom/qmi.h
> @@ -244,7 +244,8 @@ int qmi_add_server(struct qmi_handle *qmi, unsigned int service,
>  
>  int qmi_handle_init(struct qmi_handle *qmi, size_t max_msg_len,
>  		    const struct qmi_ops *ops,
> -		    const struct qmi_msg_handler *handlers);
> +		    const struct qmi_msg_handler *handlers,
> +		    unsigned int hiprio);
>  void qmi_handle_release(struct qmi_handle *qmi);
>  
>  ssize_t qmi_send_request(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
> diff --git a/samples/qmi/qmi_sample_client.c b/samples/qmi/qmi_sample_client.c
> index c9e7276c3d83..a91d1633ea38 100644
> --- a/samples/qmi/qmi_sample_client.c
> +++ b/samples/qmi/qmi_sample_client.c
> @@ -463,7 +463,7 @@ static int qmi_sample_probe(struct platform_device *pdev)
>  
>  	ret = qmi_handle_init(&sample->qmi, TEST_DATA_REQ_MAX_MSG_LEN_V01,
>  			      NULL,
> -			      qmi_sample_handlers);
> +			      qmi_sample_handlers, 0);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -590,7 +590,7 @@ static int qmi_sample_init(void)
>  	if (ret)
>  		goto err_remove_debug_dir;
>  
> -	ret = qmi_handle_init(&lookup_client, 0, &lookup_ops, NULL);
> +	ret = qmi_handle_init(&lookup_client, 0, &lookup_ops, NULL, 0);
>  	if (ret < 0)
>  		goto err_unregister_driver;
>  
> -- 
> 2.17.1
> 
> 
> 
