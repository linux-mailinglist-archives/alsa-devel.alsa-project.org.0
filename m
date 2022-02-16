Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0D34B89CE
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 14:26:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0871192C;
	Wed, 16 Feb 2022 14:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0871192C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645018006;
	bh=J4prxN0I9BRmOlV3+x5DXhpGMDI77t3xw9m5Msu9sBA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YdTbwYPh7OoTypu48HfJAWVdrMDCgtv2heXhHSBSWMHzXS7j7TuSBQbInYiVhoH/3
	 jr2DcQ/qwpf2o2qZLMSeETr7mXB7cZvS5N0Fo5xpId3PBMjMZbgDE2uon+csxa0nFv
	 zgvMXUutjJJcf77q9wa3FyCWHDI4IEVXFwjLOyvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3811EF8012E;
	Wed, 16 Feb 2022 14:25:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DE66F80128; Wed, 16 Feb 2022 14:25:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F7FCF80118
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 14:25:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F7FCF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="PwqrpOos"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645017934; x=1676553934;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Nxttcr31p2W61Gm3SX8vHvFy59FlP2h71nyWJI7l0ak=;
 b=PwqrpOoswfb4Oi5Q7M2ujwQRxVmosCWz+lzHfvVw1qpuqd8ICFlsKFS9
 exy1+OK7Ith2WLX0uKLtQFgREnedXlkP6QbJOZoUM5jl5ijGTt5kkChCP
 GjrLBavkS9mxHSNkE3LjWNBkAx1Nl+eG/8Fqa6qFwaCWwiz1hBXwQaDZg k=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Feb 2022 05:25:28 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 05:25:27 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 05:25:26 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 16 Feb 2022 05:25:20 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [PATCH] ASoC: codec: wcd938x: Update CTIA/OMTP switch control
Date: Wed, 16 Feb 2022 18:54:52 +0530
Message-ID: <1645017892-12522-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Convert gpio api's to gpio descriptor api's in CTIA/OMTP switch control.
Remove redundant NULL checks in swap_gnd_mic function.

Fixes: 013cc2aea0f6 ("ASoC: codec: wcd938x: Add switch control for selecting CTIA/OMTP Headset")

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
---
 sound/soc/codecs/wcd938x.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 08d16a9..88a39e1 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -6,6 +6,7 @@
 #include <linux/platform_device.h>
 #include <linux/device.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/pm_runtime.h>
 #include <linux/component.h>
@@ -194,7 +195,7 @@ struct wcd938x_priv {
 	int ear_rx_path;
 	int variant;
 	int reset_gpio;
-	int us_euro_gpio;
+	struct gpio_desc *us_euro_gpio;
 	u32 micb1_mv;
 	u32 micb2_mv;
 	u32 micb3_mv;
@@ -4203,22 +4204,11 @@ static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component, bool activ
 
 	struct wcd938x_priv *wcd938x;
 
-	if (!component) {
-		dev_err(component->dev, "%s component is NULL\n", __func__);
-		return false;
-	}
-
 	wcd938x = snd_soc_component_get_drvdata(component);
-	if (!wcd938x) {
-		dev_err(component->dev, "%s private data is NULL\n", __func__);
-		return false;
-	}
 
-	value = gpio_get_value(wcd938x->us_euro_gpio);
+	value = gpiod_get_value(wcd938x->us_euro_gpio);
 
-	gpio_set_value(wcd938x->us_euro_gpio, !value);
-	/* 20us sleep required after changing the gpio state*/
-	usleep_range(20, 30);
+	gpiod_set_value(wcd938x->us_euro_gpio, !value);
 
 	return true;
 }
@@ -4236,16 +4226,15 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 		return wcd938x->reset_gpio;
 	}
 
-	wcd938x->us_euro_gpio = of_get_named_gpio(dev->of_node, "us-euro-gpios", 0);
-	if (wcd938x->us_euro_gpio < 0) {
-		dev_err(dev, "Failed to get us-euro-gpios gpio: err = %d\n", wcd938x->us_euro_gpio);
-	} else {
-		cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
-		gpio_direction_output(wcd938x->us_euro_gpio, 0);
-		/* 20us sleep required after pulling the reset gpio to LOW */
-		usleep_range(20, 30);
+	wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
+						GPIOD_OUT_LOW);
+	if (IS_ERR(wcd938x->us_euro_gpio)) {
+		dev_err(dev, "us-euro swap Control GPIO not found\n");
+		return PTR_ERR(wcd938x->us_euro_gpio);
 	}
 
+	cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
+
 	wcd938x->supplies[0].supply = "vdd-rxtx";
 	wcd938x->supplies[1].supply = "vdd-io";
 	wcd938x->supplies[2].supply = "vdd-buck";
-- 
2.7.4

