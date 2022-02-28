Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EADFD4C72A3
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 18:27:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76A7E1866;
	Mon, 28 Feb 2022 18:27:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76A7E1866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646069276;
	bh=KL9sSsNwfMod5QfjbGFli18h6k2ka3hUsSB3g2yf5Os=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y/8ZoLi5CBoXzfspQ6xarqMv4CrRfnSwmhY4FZAn/thaHHhnleSFlL+MP1s2/vvuS
	 sMIVlzvpcTcyeRVG5EGOpj640p3zl0anGXd+HlR4KJYaoYza2tRx5eEbXY/w6n6tBL
	 HYnM9ge4uY+5qLTdiaMiuWzXc41HhvNYXdlwC+vE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F740F8051A;
	Mon, 28 Feb 2022 18:25:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58E04F80128; Mon, 28 Feb 2022 18:25:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A997F80128
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 18:25:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A997F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="K+n/iswA"
Received: by mail-wm1-x334.google.com with SMTP id r10so6113769wma.2
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 09:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FmiziqktK1UrOgPFNs78A4lHVO3Bduu86Seb9OC3k1c=;
 b=K+n/iswAmZ36iYyamoHmNZHrTZnMxXeQtaEPylc+co1LNZ4a0PiQWszAfkrk8SLwgj
 HCd2KxQ/G3O9OyJS7ymWIl4DC5VZss/oUTAU1gCJ9P5qmWtAOyYwtL1GQ+HOPxT1VyGa
 mTZ98GgZfeK8KzcF2OuMNNVGU0JvX0GWJPeF2hIzxYZ+C1GOSRj5kK/5vmEGOFG2QFXv
 JJzemBOuNiDULBbVfeJlFYvUXHmPzptAXh/JGE0VDQRxCJIaz/tgPKO2+kcgdfIdfVas
 SxUeFz5WHIj/n4HAKEeZI3zoH82nusaeWDdLacpkBlBKjQKUvun0I+L/jXpqZPf8JlE9
 VJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FmiziqktK1UrOgPFNs78A4lHVO3Bduu86Seb9OC3k1c=;
 b=6XTzQAHvZjOJkNZ3vLy4Jun/hTuEMrFz2lq8pZet8UtGZURjZRcB3lY83Ccrrlm62O
 ZQK8DavWFg94Hfq7SuXLAV3+ZGQywB2lwjUmsjx8vsCNSvCBh/iiVLvPDWW8vwy/x+Q8
 biXHaIqlxl/pKaVjKqF05YywCSemA0as1hV+oEVp0ktYfmZc1O8dCPZt7z9Y4aWXIYuD
 +Xt9625Dcwaw42sTLrQItjL1y6aqaCIlZOKX4d8eyaC0rWUxI9NyAz/TRtX6xXtpGRbP
 B11RrnTSk7KfJNePAkI9soNaglSWfRmPaHD/yTJ6gAXnZD1ejpkrl8XWtvqQu/68bxja
 FKuA==
X-Gm-Message-State: AOAM5315Tvyjhc5kTdCb4R0W/pfje4oef0x3ey7ce/Ju90Ftn5pISTg8
 kEP0hXC0TWTVSvbiQOf2BzdL9w==
X-Google-Smtp-Source: ABdhPJwN+7DvfLFriQmU6bf7VkKjU3vUUHF2S5mpLJH74nHkyMflLKGXjM3VbQkL9njttDpa3TNgRQ==
X-Received: by 2002:a05:600c:4615:b0:381:c68:e8f8 with SMTP id
 m21-20020a05600c461500b003810c68e8f8mr14077589wmo.117.1646069143234; 
 Mon, 28 Feb 2022 09:25:43 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a7bcd15000000b0034efd01ee16sm11514124wmj.42.2022.02.28.09.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:25:42 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh+dt@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH v3 3/3] soundwire: qcom: add in-band wake up interrupt support
Date: Mon, 28 Feb 2022 17:25:28 +0000
Message-Id: <20220228172528.3489-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220228172528.3489-1-srinivas.kandagatla@linaro.org>
References: <20220228172528.3489-1-srinivas.kandagatla@linaro.org>
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
SoundWire Slave on the bus would initiate this by pulling the data line high,
while the clock is stopped.

Add support to this wake up interrupt.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 50 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 810232686196..e893aee1b057 100644
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
@@ -1491,6 +1536,11 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 
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

