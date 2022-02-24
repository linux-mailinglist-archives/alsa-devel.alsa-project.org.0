Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 882FE4C2D29
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 14:34:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2874918AA;
	Thu, 24 Feb 2022 14:33:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2874918AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645709649;
	bh=0GNaqiuZce92SnhE10pZqo6Dhe5BFplwdHA4+pch4Yw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hbQo5tEOLTCZ0JfD0KURcuL3xPQ9tn36fBEW8fg/3kdeKeTNHOxij7xB+HPkLrwwF
	 KwZVY5liFfiNsTWqoYcuhfD8gO6nN0/r74F5CYrfJHUdh51EF+S0SzdoIi5PVF+Wby
	 OZC8mq2xCVU0wMhJuGVakWuPjs4HIEFGCxcmwFqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D1F2F80533;
	Thu, 24 Feb 2022 14:31:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A48D5F80534; Thu, 24 Feb 2022 14:31:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82D06F800F3
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 14:31:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82D06F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="d3jWz7NM"
Received: by mail-wr1-x431.google.com with SMTP id d28so3074335wra.4
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 05:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eOe0YnAdLFHik7V4l++pHUQcqVB92bCJ4fKDKTqumAI=;
 b=d3jWz7NM9/ixBCcxoiUKpPidsC8v0hfIQsWzpdfC+4pBY+imxCFSOqqq0RtNqsOIPm
 bMjX1hp0/EPg3KY5TNxy3Srbo5ts/6mU9Pxpi1cLRuBajCRHjpBYDFtgRQ85nnLiRSOi
 1+e5AYWvfQwTROpUGj6H+KIzBPwtSKv1DeU1KvZdnZgg7HBdtujX2ynmNE9fyZUv1Atp
 hAWwtZziOokMcVvmZsIuOhVi4Q6zcu32p9XnrEMa4TAKgEtmfdBkk+wRJDYROvOHCU9C
 yinaiGAAhxNInMFlwYjzRzvE/54mZ4aufUuu5coiwfiJSbzUmqtYphDBLHzpdGcU+WBj
 U0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eOe0YnAdLFHik7V4l++pHUQcqVB92bCJ4fKDKTqumAI=;
 b=ObF77nXJxwpBZTrNrYLJqRcGryoVY6DWFvac5A2IwtrqiXcyHbtW2wi1GbPDT+Ck1p
 OKAvqbQ07KfPjjf9VaGONAyvpEyzEODEnIE+iHygoKGPUFbUHW4ZaR0DYrlISJThycdt
 Y0Lh8kpTETy+goVDGU6/3hwEXo0kQbvytPBijW3DRHDwO5pADaXyEezAY7b5A1Pfzm2q
 qJS2B8ZG/imq/Fue+E+ovxA9vxDJAT0YUATlD7ymfjSy+NkrDx3CsTuiUQHXv8n4VE42
 naDptwbOQrB5DVbbkVXg/4DPtPLYID+g/z07q/Db/bL0HXjLlk80nbZwz1kzG/TDmRQJ
 LQcw==
X-Gm-Message-State: AOAM5328beaaJl80W/+2t3OpXRgL213sVH8xpbRa/v8JfUrpeTRdnNEG
 B7R0W6y3Fvj06AvSlZkeDMO4mC1e9Ci2tw==
X-Google-Smtp-Source: ABdhPJyxZhsO/2C3JbMTC+G1EMu26FRFHXVbiK+TxK/F2Y5ihVCIuofd5+7GeozbNaaelrqIwQxNBA==
X-Received: by 2002:a05:6000:8b:b0:1ee:1c9d:92a0 with SMTP id
 m11-20020a056000008b00b001ee1c9d92a0mr1414602wrx.677.1645709503861; 
 Thu, 24 Feb 2022 05:31:43 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05600c4ba100b003810c690ba2sm2019142wmp.3.2022.02.24.05.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 05:31:43 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh+dt@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH v2 3/3] soundwire: qcom: add in-band wake up interrupt support
Date: Thu, 24 Feb 2022 13:31:25 +0000
Message-Id: <20220224133125.6674-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220224133125.6674-1-srinivas.kandagatla@linaro.org>
References: <20220224133125.6674-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

Some of the Qualcomm SoundWire Controller instances like the ones that are
connected to RX path along with Headset connections support Waking up
Controller from Low power clock stop state using SoundWire In-band interrupt.
SoundWire Slave on the bus would intiate this by pulling the data line high,
during clock stop condition.

Add support to this wake up interrupt.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 50 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 2c763a9f088f..27cfe4e05206 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -14,6 +14,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/slimbus.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
@@ -154,6 +155,7 @@ struct qcom_swrm_ctrl {
 	u8 rd_cmd_id;
 	int irq;
 	unsigned int version;
+	int wake_irq;
 	int num_din_ports;
 	int num_dout_ports;
 	int cols_index;
@@ -503,6 +505,31 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
 	return 0;
 }
 
+static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
+{
+	struct qcom_swrm_ctrl *swrm = dev_id;
+	int ret;
+
+	ret = pm_runtime_get_sync(swrm->dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_err_ratelimited(swrm->dev,
+				    "pm_runtime_get_sync failed in %s, ret %d\n",
+				    __func__, ret);
+		pm_runtime_put_noidle(swrm->dev);
+	}
+
+	if (swrm->wake_irq > 0) {
+		if (!irqd_irq_disabled(irq_get_irq_data(swrm->wake_irq)))
+			disable_irq_nosync(swrm->wake_irq);
+	}
+
+	pm_runtime_mark_last_busy(swrm->dev);
+	pm_runtime_put_autosuspend(swrm->dev);
+
+	return IRQ_HANDLED;
+}
+
+
 static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 {
 	struct qcom_swrm_ctrl *swrm = dev_id;
@@ -1340,6 +1367,19 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
+	ctrl->wake_irq = of_irq_get(dev->of_node, 1);
+	if (ctrl->wake_irq > 0) {
+		ret = devm_request_threaded_irq(dev, ctrl->wake_irq, NULL,
+						qcom_swrm_wake_irq_handler,
+						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+						"swr_wake_irq", ctrl);
+		if (ret) {
+			dev_err(dev, "Failed to request soundwire wake irq\n");
+			goto err_init;
+		}
+	}
+
+
 	ret = sdw_bus_master_add(&ctrl->bus, dev, dev->fwnode);
 	if (ret) {
 		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
@@ -1424,6 +1464,11 @@ static int swrm_runtime_resume(struct device *dev)
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
 	int ret;
 
+	if (ctrl->wake_irq > 0) {
+		if (!irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
+			disable_irq_nosync(ctrl->wake_irq);
+	}
+
 	clk_prepare_enable(ctrl->hclk);
 
 	if (ctrl->clock_stop_not_supported) {
@@ -1487,6 +1532,11 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 
 	usleep_range(300, 305);
 
+	if (ctrl->wake_irq > 0) {
+		if (irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
+			enable_irq(ctrl->wake_irq);
+	}
+
 	return 0;
 }
 
-- 
2.21.0

