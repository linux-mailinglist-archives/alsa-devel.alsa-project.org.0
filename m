Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2594BD926
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 11:43:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7782516C6;
	Mon, 21 Feb 2022 11:42:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7782516C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645440226;
	bh=ZIhgnwpiwk7h7w5Yw9JLt4K4maT0eOv5++sTxlEmwRk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HldSHeoDhNXxYnqnXvi06OvaMVNGA8QdDpKa8gNAm1G1M+kI0A13JpHSoiiPDMf8Q
	 zxLCIk4GdzbZSbwkE64r3IRfg5XGyb2FJ2YnP7OafOE6nv9KG/aAgCzYq3IDl2W50u
	 tC+eiirDjairjHgkbLzJkUyOPkwJYIW3Mv6x2XlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEFF2F8051D;
	Mon, 21 Feb 2022 11:41:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CF5BF8051C; Mon, 21 Feb 2022 11:41:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C795F80118
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 11:41:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C795F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aMCfeRwM"
Received: by mail-wm1-x32c.google.com with SMTP id n8so9234813wms.3
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 02:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fMcxbuw6I6KTX07OCnquH99Hzxoc4oIUIzEIajyR3Yc=;
 b=aMCfeRwMKXBIimw4TBzFj85xCm0lDCzNtDN3dZXJfWrWc8IMyECCsBq1jslJuMWLHy
 HPqXKulqgipa6mBmEnn3JkU1Fzyysnl3d0uPk8ZcCK1uB2h8QWIoIFz0Oi7aOSn6UyJT
 jz7UkphKfHQ3vkotJZQMqe7nz7jpjJwpJfEAC+zJnixrP10IOWuqj98gYkPjuJ+gC/vH
 jojjMJ7onKKHgKWFrmqLjvfC3Ey2hNdM8ls6yx7buwvz4XLb+g8y70tgum0Y585u3hTP
 DEHw8byPVcc2LGlL7ssk8DcnqRAAFhU3VhBKjF50BmesxaMG4BKmUTE8wbIEHCVz+nm1
 Mjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fMcxbuw6I6KTX07OCnquH99Hzxoc4oIUIzEIajyR3Yc=;
 b=BgACF+uf9WqAt2JhZccSq8p339sSoow/bzdWmRzwfts2mIriK27KnzAKiUBY1EyeQL
 Nux1EHy9wRIz5qz2/IIuXGq7mxWEz088h0yDX1aJ/+t9+5plqjidXnzQYcJYZISNUcat
 M4d1Hj5A2/G5HYmZNdbxTgC/jl0tj7kQ7hXhFBoz9U24c24bCT33dt7ljewIDJaz5MFt
 Mc5OQAQ+5sRx47PDsPQS52UuNuNKfoW8FI1idDtkrCD3+g2ok26DUGwU9n4sQndwj2wP
 TuSXeP/xCqcfgsu3qeteviKo44+FbO8Lb3y5pGzz1iNHy4/4BJk+XZbD6bUaWiXjv9eU
 6NNg==
X-Gm-Message-State: AOAM532OclQgBKSykVQ9G2YD+uHVc4njiK+yIk+wdNCUib0OH28OIx7/
 SDi3kQjVh+UsGkfdLA40nH1fQQ==
X-Google-Smtp-Source: ABdhPJxXek3z/IqIcPNmes42fE7hmTRzBr2LPQ2Ztup4nG4rhEXOxSj7rikJ7T2bKIhQwvS4iJMWGw==
X-Received: by 2002:a05:600c:1583:b0:346:3f83:6b8 with SMTP id
 r3-20020a05600c158300b003463f8306b8mr16940773wmf.75.1645440102448; 
 Mon, 21 Feb 2022 02:41:42 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b0037c06fe68casm7584817wmq.44.2022.02.21.02.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 02:41:42 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh+dt@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 3/3] soundwire: qcom: add wake up interrupt support
Date: Mon, 21 Feb 2022 10:41:27 +0000
Message-Id: <20220221104127.15670-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220221104127.15670-1-srinivas.kandagatla@linaro.org>
References: <20220221104127.15670-1-srinivas.kandagatla@linaro.org>
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
Controller from Low power clock stop state.

Add support to this wake up interrupt.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 65 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3b2eb95a7e96..b9b76031307b 100644
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
@@ -503,6 +505,46 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
 	return 0;
 }
 
+static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
+{
+	struct qcom_swrm_ctrl *swrm = dev_id;
+	int ret = IRQ_HANDLED;
+	struct sdw_slave *slave;
+
+	clk_prepare_enable(swrm->hclk);
+
+	if (swrm->wake_irq > 0) {
+		if (!irqd_irq_disabled(irq_get_irq_data(swrm->wake_irq)))
+			disable_irq_nosync(swrm->wake_irq);
+	}
+
+	/*
+	 * resume all the slaves which must have potentially generated this
+	 * interrupt, this should also wake the controller at the same time.
+	 * this is much safer than waking controller directly that will deadlock!
+	 */
+	list_for_each_entry(slave, &swrm->bus.slaves, node) {
+		ret = pm_runtime_get_sync(&slave->dev);
+		if (ret < 0 && ret != -EACCES) {
+			dev_err_ratelimited(swrm->dev,
+					    "pm_runtime_get_sync failed in %s, ret %d\n",
+					    __func__, ret);
+			pm_runtime_put_noidle(&slave->dev);
+			ret = IRQ_NONE;
+			goto err;
+		}
+	}
+
+	list_for_each_entry(slave, &swrm->bus.slaves, node) {
+		pm_runtime_mark_last_busy(&slave->dev);
+		pm_runtime_put_autosuspend(&slave->dev);
+	}
+err:
+	clk_disable_unprepare(swrm->hclk);
+	return IRQ_HANDLED;
+}
+
+
 static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 {
 	struct qcom_swrm_ctrl *swrm = dev_id;
@@ -1340,6 +1382,19 @@ static int qcom_swrm_probe(struct platform_device *pdev)
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
@@ -1424,6 +1479,11 @@ static int swrm_runtime_resume(struct device *dev)
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
 	int ret;
 
+	if (ctrl->wake_irq > 0) {
+		if (!irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
+			disable_irq_nosync(ctrl->wake_irq);
+	}
+
 	clk_prepare_enable(ctrl->hclk);
 
 	if (ctrl->clk_stop_bus_reset) {
@@ -1485,6 +1545,11 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 
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

