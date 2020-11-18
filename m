Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E44B2B828F
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 18:05:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 247381735;
	Wed, 18 Nov 2020 18:05:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 247381735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605719157;
	bh=F69Xyt/TSqS62YVM3A/8ledP27iyXRS61kITEKYaPe4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uq6AesntXBLZp7jFildu7qRoa9htCEnsp9sPjgXg022qmz4ju3C3EN7gxyfZ/FYIE
	 rJ5QHJAAMb/I7H2A7HaUf4AsXDNE64AtSNZ/E0gmR0kXnh+0/xw15Q8uIQzjPYtSV2
	 awc9W18pA+8UpyZpfQ0BvjKBE1IOJuZ9jjUDfEHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33CA4F80168;
	Wed, 18 Nov 2020 18:03:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87B6AF8019D; Wed, 18 Nov 2020 18:03:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFCF9F800EE
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 18:03:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFCF9F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Cwomn+wx"
Received: by mail-wm1-x343.google.com with SMTP id w24so3397643wmi.0
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 09:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/woKeC5KGNH7T/xAX1AxjALkVqvprR8gaAK4xA3oo5s=;
 b=Cwomn+wxk4TpP9Q1CovJ8LXgrq/XaZVqHwkTs9e7Z2XG4LL1ZV0Kg96ssuPfZh3SqJ
 8hObLgj8AAoBhJ4FEC4GOsShwySqBDt74C2VOoZ/QjgpJAjZejaCAbk7U1AXU7ma4kQH
 Rsfi+e855GEX30rE0v73w1djExqiYkNukF9x7s0+yg2CG7l2KXAOuM0rFhkOP0ZRrHng
 v3YVM2X96ucTKh57Za3qXcvbnRTg+IVPw6oGmkPA2P5Jx5fDMppED3eRR3DIS6G06xaY
 MaR2b+Ylcsz9WgIthC8vwt2I6CbTeupO3lZ3bwKtlldOHE01e4u1bnSXy9mwYhqXwqVu
 VVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/woKeC5KGNH7T/xAX1AxjALkVqvprR8gaAK4xA3oo5s=;
 b=uEkjVBAZChq7XYIPU5GrgPR6bVQtusYWZ55aC+7VsZqTxPOsoClUos7HUZJHfnzGgR
 c7Hr8St6J23aw1JepcSTDrFPBJqRvT1die+QksURws5Q5AVwXO7890C3IQZ4NPhTs5Ab
 7KwDXLdNpAs/r8wHqepbQ00HOE7fNC9MGetdI7FGJ7/vo4WKS6zofw0GMRaSVijJDfZl
 UuREkWE8SIct6JL10LtITz3c/EsRjLYIL1psootPaOkmlOgo/vMunxCnzmFdHE8RW9Ku
 /zj3LpbuIKXoRrlBkxS01Bn6PgWpzxulNfFZOMml00GUIbCdsEDbDUJlS1gB+GsxYxC8
 6pkg==
X-Gm-Message-State: AOAM532MBUpqFSKI3BSLYSB8p19agy2Y7B6wx4FaVibIZrggsTa2jdvV
 J/luIgv4OkAFLaLTPN4J52KbHQ==
X-Google-Smtp-Source: ABdhPJxpYksQa3n/Yd7hzS4PjipFts8SYkUlPiPMNc5G3xr8yEGbze95pQFeIwLcQmIPZBYri1H/ow==
X-Received: by 2002:a05:600c:290a:: with SMTP id
 i10mr1035685wmd.187.1605718999252; 
 Wed, 18 Nov 2020 09:03:19 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x13sm44233wmi.20.2020.11.18.09.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 09:03:17 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: srinivas.kandagatla@linaro.org,
	srini@kernel.org
Subject: [PATCH 2/2] slimbus: qcom-ngd-ctrl: add Protection Domain Restart
 Support
Date: Wed, 18 Nov 2020 17:02:46 +0000
Message-Id: <20201118170246.16588-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201118170246.16588-1-srinivas.kandagatla@linaro.org>
References: <20201118170246.16588-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
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

Add support to protection domain restart. Protection domain restart
would also restart the service just like SSR.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/slimbus/Kconfig         |  1 +
 drivers/slimbus/qcom-ngd-ctrl.c | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/slimbus/Kconfig b/drivers/slimbus/Kconfig
index 7c950948a9ec..060a2c65978a 100644
--- a/drivers/slimbus/Kconfig
+++ b/drivers/slimbus/Kconfig
@@ -26,6 +26,7 @@ config SLIM_QCOM_NGD_CTRL
 	depends on ARCH_QCOM || COMPILE_TEST
 	select QCOM_QMI_HELPERS
 	select QCOM_RPROC_COMMON
+	select QCOM_PDR_HELPERS
 	help
 	  Select driver if Qualcomm's SLIMbus Satellite Non-Generic Device
 	  Component is programmed using Linux kernel.
diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index f62693653d2b..d8decb345e9d 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/io.h>
 #include <linux/soc/qcom/qmi.h>
+#include <linux/soc/qcom/pdr.h>
 #include <net/sock.h>
 #include "slimbus.h"
 
@@ -166,6 +167,7 @@ struct qcom_slim_ngd_ctrl {
 	struct mutex ssr_lock;
 	struct notifier_block nb;
 	void *notifier;
+	struct pdr_handle *pdr;
 	enum qcom_slim_ngd_state state;
 	dma_addr_t rx_phys_base;
 	dma_addr_t tx_phys_base;
@@ -1382,6 +1384,7 @@ static int qcom_slim_ngd_ssr_pdr_notify(struct qcom_slim_ngd_ctrl *ctrl,
 {
 	switch (action) {
         case QCOM_SSR_BEFORE_SHUTDOWN:
+	case SERVREG_SERVICE_STATE_DOWN:
 		/* Make sure the last dma xfer is finished */
 		mutex_lock(&ctrl->tx_lock);
 		if (ctrl->state != QCOM_SLIM_NGD_CTRL_DOWN) {
@@ -1393,6 +1396,7 @@ static int qcom_slim_ngd_ssr_pdr_notify(struct qcom_slim_ngd_ctrl *ctrl,
 		mutex_unlock(&ctrl->tx_lock);
                 break;
         case QCOM_SSR_AFTER_POWERUP:
+	case SERVREG_SERVICE_STATE_UP:
 		schedule_work(&ctrl->ngd_up_work);
 		break;
         default:
@@ -1412,6 +1416,12 @@ static int qcom_slim_ngd_ssr_notify(struct notifier_block *nb,
 	return qcom_slim_ngd_ssr_pdr_notify(ctrl, action);
 }
 
+static void slim_pd_status(int state, char *svc_path, void *priv)
+{
+	struct qcom_slim_ngd_ctrl *ctrl = (struct qcom_slim_ngd_ctrl *)priv;
+
+	qcom_slim_ngd_ssr_pdr_notify(ctrl, state);
+}
 static int of_qcom_slim_ngd_register(struct device *parent,
 				     struct qcom_slim_ngd_ctrl *ctrl)
 {
@@ -1499,6 +1509,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	struct qcom_slim_ngd_ctrl *ctrl;
 	struct resource *res;
 	int ret;
+	struct pdr_service *pds;
 
 	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
 	if (!ctrl)
@@ -1549,6 +1560,18 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	init_completion(&ctrl->qmi.qmi_comp);
 	init_completion(&ctrl->qmi_up);
 
+	ctrl->pdr = pdr_handle_alloc(slim_pd_status, ctrl);
+	if (IS_ERR(ctrl->pdr)) {
+		dev_err(dev, "Failed to init PDR handle\n");
+		return PTR_ERR(ctrl->pdr);
+	}
+
+	pds = pdr_add_lookup(ctrl->pdr, "avs/audio", "msm/adsp/audio_pd");
+	if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
+		dev_err(dev, "pdr add lookup failed: %d\n", ret);
+		return PTR_ERR(pds);
+	}
+
 	platform_driver_register(&qcom_slim_ngd_driver);
 	return of_qcom_slim_ngd_register(dev, ctrl);
 }
@@ -1565,6 +1588,7 @@ static int qcom_slim_ngd_remove(struct platform_device *pdev)
 	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
+	pdr_handle_release(ctrl->pdr);
 	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
 	qcom_slim_ngd_enable(ctrl, false);
 	qcom_slim_ngd_exit_dma(ctrl);
-- 
2.21.0

