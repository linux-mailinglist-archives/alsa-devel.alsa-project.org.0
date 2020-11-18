Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD002B828D
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 18:05:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF05D16DA;
	Wed, 18 Nov 2020 18:04:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF05D16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605719106;
	bh=tJQOmi+UW/ichw0zGmOgjiBehWMw8I3sNbNZBWY9nkQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=keqNhCOlXBDbmy+QNvcv4vg02IrnkBrQ/hOkmrLlhJ/f9njDALRdcoY/55Y4i8FAa
	 LCgVI6MRjM6sRi9ZvaGRzTb52SoFjf1hUZG04LaAIuPkHV1b9LmHJTB3FmZ16oKAm/
	 T5oWb4N9AyP8kOlsu9dGfXtSgplEsG08iJAmKlgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94EBCF8016E;
	Wed, 18 Nov 2020 18:03:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA0DAF8016E; Wed, 18 Nov 2020 18:03:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9916F80168
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 18:03:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9916F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PycsmBXT"
Received: by mail-wr1-x442.google.com with SMTP id u12so2985440wrt.0
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 09:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tHZNVtWV03wSSvt4VtOznFOQfn700bs7DZF5bDl/1hQ=;
 b=PycsmBXTWZTus1KYTPmF4oGleYgdhSLv1aXStm0xGjWjhKTnM1SCNSN0AwBOm1VT6A
 flIDpXbIoaJMUTcgkkEvXzBxD4nW2w0Z0BINIWH5CecWVZR448hJV0h889KMfaY5HGzH
 meWBkWmndzR0vsHkaJpUeY/2IkNR5T1sXFG+OdK86W/k6FbHSkXZvz69BftXR7CN6Yhg
 KoGxpqfutId+C7CZXoe+KpaZiY0rxKBtiiXfbL3KwCXZ04WGo7SB+be8AeYvdyfICLRl
 wa4EvZmNXNh2e25POTvTcmsoycB1forodFjpoRGl3KoHeksOF+TxmKL7fU/+9rpJg5Tt
 v7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tHZNVtWV03wSSvt4VtOznFOQfn700bs7DZF5bDl/1hQ=;
 b=k3yYEnmlLKipJWvbSjX3a+dJYIrljfxuBC+++gOJhgkXDXVfaUa0FRS/DLusgseSIR
 QEGxOd8riw7gZV1HIoOPtWCEhPxVcTKOi5e5m4Kva09swOKMxwDd9l8uMPmM3WLxCXuH
 KjP7IaKL9x+jgRrYUp1Ffcx7vtTQbbllqtOeZOemvhuLN9NiOp+MtRMweIQjU5I2gYBA
 7Pliw6pPbUXUorpuVh+CdIT8tENzcCeeNu9ZN+gF+w7NdXDdSdzgvT/u86tZ7jYRPzol
 jcw8Jj54HjZFUbiGeJrKz8QUOXMeJQrl5Na3Np7AtBnOn2RNiFopBA6WpGDuMeO+4JIf
 EDwA==
X-Gm-Message-State: AOAM532cvDmQbMq08MDvs8FsccXNt+MpiPyQNkXZPrjQlJr+w8fDGqy5
 SX2EXtnIsxe+nojrwo6sogNsGw==
X-Google-Smtp-Source: ABdhPJwEJ44xJF+widQnqNKYzPyysZEA4M2iF2krE5ccYKsEXq033m9D898E1yasLA+f2s1bf4jyZg==
X-Received: by 2002:adf:a198:: with SMTP id u24mr4381933wru.219.1605718997272; 
 Wed, 18 Nov 2020 09:03:17 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x13sm44233wmi.20.2020.11.18.09.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 09:03:16 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: srinivas.kandagatla@linaro.org,
	srini@kernel.org
Subject: [PATCH 1/2] slimbus: qcom-ngd-ctrl: add Sub System Restart support
Date: Wed, 18 Nov 2020 17:02:45 +0000
Message-Id: <20201118170246.16588-2-srinivas.kandagatla@linaro.org>
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

This patch adds SSR(SubSystem Restart) support which includes, synchronisation
between SSR and QMI server notifications. Also with this patch now NGD is taken
down by SSR instead of QMI server down notification.

NGD up path now relies on both SSR and QMI notifications and particularly
sequence of SSR up followed by QMI server up notification.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/slimbus/Kconfig         |  1 +
 drivers/slimbus/qcom-ngd-ctrl.c | 97 +++++++++++++++++++++++++++++++--
 2 files changed, 94 insertions(+), 4 deletions(-)

diff --git a/drivers/slimbus/Kconfig b/drivers/slimbus/Kconfig
index 8cd595148d17..7c950948a9ec 100644
--- a/drivers/slimbus/Kconfig
+++ b/drivers/slimbus/Kconfig
@@ -25,6 +25,7 @@ config SLIM_QCOM_NGD_CTRL
 	depends on HAS_IOMEM && DMA_ENGINE && NET
 	depends on ARCH_QCOM || COMPILE_TEST
 	select QCOM_QMI_HELPERS
+	select QCOM_RPROC_COMMON
 	help
 	  Select driver if Qualcomm's SLIMbus Satellite Non-Generic Device
 	  Component is programmed using Linux kernel.
diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 218aefc3531c..f62693653d2b 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -13,6 +13,9 @@
 #include <linux/slimbus.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/remoteproc/qcom_rproc.h>
 #include <linux/of.h>
 #include <linux/io.h>
 #include <linux/soc/qcom/qmi.h>
@@ -155,8 +158,14 @@ struct qcom_slim_ngd_ctrl {
 	struct qcom_slim_ngd_dma_desc txdesc[QCOM_SLIM_NGD_DESC_NUM];
 	struct completion reconf;
 	struct work_struct m_work;
+	struct work_struct ngd_up_work;
 	struct workqueue_struct *mwq;
+	struct completion qmi_up;
 	spinlock_t tx_buf_lock;
+	struct mutex tx_lock;
+	struct mutex ssr_lock;
+	struct notifier_block nb;
+	void *notifier;
 	enum qcom_slim_ngd_state state;
 	dma_addr_t rx_phys_base;
 	dma_addr_t tx_phys_base;
@@ -868,14 +877,18 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
 	if (txn->msg && txn->msg->wbuf)
 		memcpy(puc, txn->msg->wbuf, txn->msg->num_bytes);
 
+	mutex_lock(&ctrl->tx_lock);
 	ret = qcom_slim_ngd_tx_msg_post(ctrl, pbuf, txn->rl);
-	if (ret)
+	if (ret) {
+		mutex_unlock(&ctrl->tx_lock);
 		return ret;
+	}
 
 	timeout = wait_for_completion_timeout(&tx_sent, HZ);
 	if (!timeout) {
 		dev_err(sctrl->dev, "TX timed out:MC:0x%x,mt:0x%x", txn->mc,
 					txn->mt);
+		mutex_unlock(&ctrl->tx_lock);
 		return -ETIMEDOUT;
 	}
 
@@ -884,10 +897,12 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
 		if (!timeout) {
 			dev_err(sctrl->dev, "TX timed out:MC:0x%x,mt:0x%x",
 				txn->mc, txn->mt);
+			mutex_unlock(&ctrl->tx_lock);
 			return -ETIMEDOUT;
 		}
 	}
 
+	mutex_unlock(&ctrl->tx_lock);
 	return 0;
 }
 
@@ -1200,6 +1215,13 @@ static void qcom_slim_ngd_master_worker(struct work_struct *work)
 	}
 }
 
+static int qcom_slim_ngd_update_device_status(struct device *dev, void *null)
+{
+	slim_report_absent(to_slim_device(dev));
+
+	return 0;
+}
+
 static int qcom_slim_ngd_runtime_resume(struct device *dev)
 {
 	struct qcom_slim_ngd_ctrl *ctrl = dev_get_drvdata(dev);
@@ -1267,7 +1289,7 @@ static int qcom_slim_ngd_qmi_new_server(struct qmi_handle *hdl,
 	qmi->svc_info.sq_node = service->node;
 	qmi->svc_info.sq_port = service->port;
 
-	qcom_slim_ngd_enable(ctrl, true);
+	complete(&ctrl->qmi_up);
 
 	return 0;
 }
@@ -1280,10 +1302,9 @@ static void qcom_slim_ngd_qmi_del_server(struct qmi_handle *hdl,
 	struct qcom_slim_ngd_ctrl *ctrl =
 		container_of(qmi, struct qcom_slim_ngd_ctrl, qmi);
 
+	reinit_completion(&ctrl->qmi_up);
 	qmi->svc_info.sq_node = 0;
 	qmi->svc_info.sq_port = 0;
-
-	qcom_slim_ngd_enable(ctrl, false);
 }
 
 static struct qmi_ops qcom_slim_ngd_qmi_svc_event_ops = {
@@ -1333,6 +1354,64 @@ static const struct of_device_id qcom_slim_ngd_dt_match[] = {
 
 MODULE_DEVICE_TABLE(of, qcom_slim_ngd_dt_match);
 
+static void qcom_slim_ngd_down(struct qcom_slim_ngd_ctrl *ctrl)
+{
+	mutex_lock(&ctrl->ssr_lock);
+	device_for_each_child(ctrl->ctrl.dev, NULL,
+			      qcom_slim_ngd_update_device_status);
+	qcom_slim_ngd_enable(ctrl, false);
+	mutex_unlock(&ctrl->ssr_lock);
+}
+
+static void qcom_slim_ngd_up_worker(struct work_struct *work)
+{
+	struct qcom_slim_ngd_ctrl *ctrl;
+
+	ctrl = container_of(work, struct qcom_slim_ngd_ctrl, ngd_up_work);
+
+	/* Make sure qmi service is up before continuing */
+	wait_for_completion_interruptible(&ctrl->qmi_up);
+
+	mutex_lock(&ctrl->ssr_lock);
+	qcom_slim_ngd_enable(ctrl, true);
+	mutex_unlock(&ctrl->ssr_lock);
+}
+
+static int qcom_slim_ngd_ssr_pdr_notify(struct qcom_slim_ngd_ctrl *ctrl,
+					unsigned long action)
+{
+	switch (action) {
+        case QCOM_SSR_BEFORE_SHUTDOWN:
+		/* Make sure the last dma xfer is finished */
+		mutex_lock(&ctrl->tx_lock);
+		if (ctrl->state != QCOM_SLIM_NGD_CTRL_DOWN) {
+			pm_runtime_get_noresume(ctrl->dev);
+			ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
+			qcom_slim_ngd_down(ctrl);
+			qcom_slim_ngd_exit_dma(ctrl);
+		}
+		mutex_unlock(&ctrl->tx_lock);
+                break;
+        case QCOM_SSR_AFTER_POWERUP:
+		schedule_work(&ctrl->ngd_up_work);
+		break;
+        default:
+                break;
+        }
+
+        return NOTIFY_OK;
+}
+
+static int qcom_slim_ngd_ssr_notify(struct notifier_block *nb,
+				    unsigned long action,
+				    void *data)
+{
+	struct qcom_slim_ngd_ctrl *ctrl = container_of(nb,
+					       struct qcom_slim_ngd_ctrl, nb);
+
+	return qcom_slim_ngd_ssr_pdr_notify(ctrl, action);
+}
+
 static int of_qcom_slim_ngd_register(struct device *parent,
 				     struct qcom_slim_ngd_ctrl *ctrl)
 {
@@ -1397,6 +1476,7 @@ static int qcom_slim_ngd_probe(struct platform_device *pdev)
 	}
 
 	INIT_WORK(&ctrl->m_work, qcom_slim_ngd_master_worker);
+	INIT_WORK(&ctrl->ngd_up_work, qcom_slim_ngd_up_worker);
 	ctrl->mwq = create_singlethread_workqueue("ngd_master");
 	if (!ctrl->mwq) {
 		dev_err(&pdev->dev, "Failed to start master worker\n");
@@ -1444,6 +1524,11 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ctrl->nb.notifier_call = qcom_slim_ngd_ssr_notify;
+	ctrl->notifier = qcom_register_ssr_notifier("lpass", &ctrl->nb);
+	if (IS_ERR(ctrl->notifier))
+		return PTR_ERR(ctrl->notifier);
+
 	ctrl->dev = dev;
 	ctrl->framer.rootfreq = SLIM_ROOT_FREQ >> 3;
 	ctrl->framer.superfreq =
@@ -1457,9 +1542,12 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	ctrl->ctrl.wakeup = NULL;
 	ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
 
+	mutex_init(&ctrl->tx_lock);
+	mutex_init(&ctrl->ssr_lock);
 	spin_lock_init(&ctrl->tx_buf_lock);
 	init_completion(&ctrl->reconf);
 	init_completion(&ctrl->qmi.qmi_comp);
+	init_completion(&ctrl->qmi_up);
 
 	platform_driver_register(&qcom_slim_ngd_driver);
 	return of_qcom_slim_ngd_register(dev, ctrl);
@@ -1477,6 +1565,7 @@ static int qcom_slim_ngd_remove(struct platform_device *pdev)
 	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
+	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
 	qcom_slim_ngd_enable(ctrl, false);
 	qcom_slim_ngd_exit_dma(ctrl);
 	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);
-- 
2.21.0

