Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7604D3A7B2A
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 11:50:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7A1C1684;
	Tue, 15 Jun 2021 11:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7A1C1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623750633;
	bh=0McE3Yhkyi8WifmcxHAHHnot1hUainufds9iOV3gjCA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JEgkF/QPayT8wgF/WQoYKVM3nkHkTfKAVDsLVwknk3D7XMQkgWENSpm4HSh90bXiH
	 d9gTEz+AcDmLFES4sivdWFVGNWsvEOP+MTiIhbZWXjWti4TtbYxevBpIACj3HwU6q4
	 dh0pwwOrAyZEXsh718fLns+sFLSWDhXwrnElAfi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40F9AF8025A;
	Tue, 15 Jun 2021 11:49:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81EC1F80171; Tue, 15 Jun 2021 11:49:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63E39F80113
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 11:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63E39F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="k6Io1xJW"
Received: by mail-wm1-x32e.google.com with SMTP id
 k5-20020a05600c1c85b02901affeec3ef8so1348578wms.0
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 02:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f5Ef4gTb6IG+2Rp0mfxvJGUVzw2jq0Fb0ytCRN/UGpA=;
 b=k6Io1xJWIKUJ/pf8bmL7BPSsKG15nKbO6LcBCCTsyC18dYvFU49kvKOO4Dc+OZLWq4
 aNEOSebC6lV/vQvjNW7zu8a1sJAOWhNgXZea/pfefRVX04A3AQL+PMiutACJjan4hCSG
 BOG77oPWqVWBNPLqcqpNlLzwqxFRWNWM5WZqFgeSqOIzHZsiZaT1WsGBzKJKeMtdfMxY
 DHNRjBAXjsWwzDwqur3mGTFHKDPqBLFOzJfm1yK7GbKTjpuq3zto1qoned05eF7eHN32
 YmGOaj3p6peNxu3fO4wQxraau0JsZGyOyNZNEpx+lYBrbOIotasUCGvOCGQVGw7FuCSh
 k5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f5Ef4gTb6IG+2Rp0mfxvJGUVzw2jq0Fb0ytCRN/UGpA=;
 b=dA9NltssltTc+qhJ+5CNVtP4acnHVdZLBJgFI7IRuBKrUIXG3uYKGW4sfXZBQC/ZcB
 Fw37K935NcyETjrt9b6SaNs/xBBk7MmE+DC8z0Rq5CYeG6DDOx+7BsLTYdNKLwghDfY+
 X5xJUNAP8ZxW/zTiKWtFKeTrkcmMuZD5suigkABOheaXemg8mhMOSrOgKRrT5B8EHB8G
 JGL6io6uB6vt24IgLwDZPI6AQHGQvyokX5MdO+2FPFBhM4N8LV0+nC6L5n5ZwxZyZjI8
 z6A1CH1yXrp6094dhQOIdY9KOn4LSIeFZCBmpsK3wLP5jwestPmurbZ26YqzNrPL1nw6
 aBFg==
X-Gm-Message-State: AOAM533uIqxUkjKUdzbo0xQiUJrNEMnImSpAz5vyU4opI7khrj2nDqMO
 6MvqTHu7eHhK0ngpnAuJZEBLKg==
X-Google-Smtp-Source: ABdhPJzClcaiKxxGXqt7y/6C+JfdhJ7Om/lY0IBIb3XYwNo8AOQYlpz6A3rc44WL9tJ6sTmMRziV9g==
X-Received: by 2002:a7b:c192:: with SMTP id y18mr4274471wmi.65.1623750532170; 
 Tue, 15 Jun 2021 02:48:52 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n6sm1648471wme.21.2021.06.15.02.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 02:48:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: codecs: wcd938x: remove incorrect module interdependency
Date: Tue, 15 Jun 2021 10:48:39 +0100
Message-Id: <20210615094839.27237-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

For some reason we ended up with cyclic dependency between snd_soc_wcd938x
and snd_soc_wcd938x_sdw modules.

Remove this cyclic dependency by handling them in respective modules.
Without this below error is reported during make modules_install

depmod: ERROR: Cycle detected: snd_soc_wcd938x -> snd_soc_wcd938x_sdw -> snd_soc_wcd938x
depmod: ERROR: Found 2 modules in dependency cycles!

Fixes: 045442228868 ("ASoC: codecs: wcd938x: add audio routing and Kconfig")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x-sdw.c | 19 ++++++++++++-------
 sound/soc/codecs/wcd938x.c     | 27 +++++----------------------
 sound/soc/codecs/wcd938x.h     |  4 +---
 3 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index d82c40ec6898..d1cabf300c36 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -176,8 +176,19 @@ static int wcd9380_interrupt_callback(struct sdw_slave *slave,
 				      struct sdw_slave_intr_status *status)
 {
 	struct wcd938x_sdw_priv *wcd = dev_get_drvdata(&slave->dev);
+	struct irq_domain *slave_irq = wcd->slave_irq;
+	struct regmap *regmap = dev_get_regmap(&slave->dev, NULL);
+	u32 sts1, sts2, sts3;
 
-	return wcd938x_handle_sdw_irq(wcd);
+	do {
+		handle_nested_irq(irq_find_mapping(slave_irq, 0));
+		regmap_read(regmap, WCD938X_DIGITAL_INTR_STATUS_0, &sts1);
+		regmap_read(regmap, WCD938X_DIGITAL_INTR_STATUS_1, &sts2);
+		regmap_read(regmap, WCD938X_DIGITAL_INTR_STATUS_2, &sts3);
+
+	} while (sts1 || sts2 || sts3);
+
+	return IRQ_HANDLED;
 }
 
 static struct sdw_slave_ops wcd9380_slave_ops = {
@@ -239,16 +250,10 @@ static int wcd9380_probe(struct sdw_slave *pdev,
 					SDW_SCP_INT1_PARITY;
 	pdev->prop.lane_control_support = true;
 	if (wcd->is_tx) {
-		struct regmap *rm;
-
 		pdev->prop.source_ports = GENMASK(WCD938X_MAX_SWR_PORTS, 0);
 		pdev->prop.src_dpn_prop = wcd938x_dpn_prop;
 		wcd->ch_info = &wcd938x_sdw_tx_ch_info[0];
 		pdev->prop.wake_capable = true;
-
-		rm = devm_regmap_init_sdw(pdev, &wcd938x_regmap_config);
-		if (IS_ERR(rm))
-			return PTR_ERR(rm);
 	} else {
 		pdev->prop.sink_ports = GENMASK(WCD938X_MAX_SWR_PORTS, 0);
 		pdev->prop.sink_dpn_prop = wcd938x_dpn_prop;
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index a2c76dc8fd89..24afe93830ce 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1198,7 +1198,7 @@ static bool wcd938x_volatile_register(struct device *dev, unsigned int reg)
 	return false;
 }
 
-struct regmap_config wcd938x_regmap_config = {
+static struct regmap_config wcd938x_regmap_config = {
 	.name = "wcd938x_csr",
 	.reg_bits = 32,
 	.val_bits = 8,
@@ -1211,7 +1211,6 @@ struct regmap_config wcd938x_regmap_config = {
 	.volatile_reg = wcd938x_volatile_register,
 	.can_multi_write = true,
 };
-EXPORT_SYMBOL_GPL(wcd938x_regmap_config);
 
 static const struct regmap_irq wcd938x_irqs[WCD938X_NUM_IRQS] = {
 	REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_BUTTON_PRESS_DET, 0, 0x01),
@@ -3472,24 +3471,6 @@ static int wcd938x_reset(struct wcd938x_priv *wcd938x)
 	return 0;
 }
 
-int wcd938x_handle_sdw_irq(struct wcd938x_sdw_priv *wcd)
-{
-	struct wcd938x_priv *wcd938x = wcd->wcd938x;
-	struct irq_domain *slave_irq = wcd938x->virq;
-	u32 sts1, sts2, sts3;
-
-	do {
-		handle_nested_irq(irq_find_mapping(slave_irq, 0));
-		regmap_read(wcd938x->regmap, WCD938X_DIGITAL_INTR_STATUS_0, &sts1);
-		regmap_read(wcd938x->regmap, WCD938X_DIGITAL_INTR_STATUS_1, &sts2);
-		regmap_read(wcd938x->regmap, WCD938X_DIGITAL_INTR_STATUS_2, &sts3);
-
-	} while (sts1 || sts2 || sts3);
-
-	return IRQ_HANDLED;
-}
-EXPORT_SYMBOL_GPL(wcd938x_handle_sdw_irq);
-
 static int wcd938x_codec_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -3573,6 +3554,7 @@ static int wcd938x_bind(struct device *dev)
 	}
 	wcd938x->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd938x->rxdev);
 	wcd938x->sdw_priv[AIF1_PB]->wcd938x = wcd938x;
+	wcd938x->sdw_priv[AIF1_PB]->slave_irq = wcd938x->virq;
 
 	wcd938x->txdev = wcd938x_sdw_device_get(wcd938x->txnode);
 	if (!wcd938x->txdev) {
@@ -3581,6 +3563,7 @@ static int wcd938x_bind(struct device *dev)
 	}
 	wcd938x->sdw_priv[AIF1_CAP] = dev_get_drvdata(wcd938x->txdev);
 	wcd938x->sdw_priv[AIF1_CAP]->wcd938x = wcd938x;
+	wcd938x->sdw_priv[AIF1_CAP]->slave_irq = wcd938x->virq;
 	wcd938x->tx_sdw_dev = dev_to_sdw_dev(wcd938x->txdev);
 	if (!wcd938x->tx_sdw_dev) {
 		dev_err(dev, "could not get txslave with matching of dev\n");
@@ -3607,8 +3590,8 @@ static int wcd938x_bind(struct device *dev)
 		return -EINVAL;
 	}
 
-	wcd938x->regmap = dev_get_regmap(wcd938x->txdev, NULL);
-	if (!wcd938x->regmap) {
+	wcd938x->regmap = devm_regmap_init_sdw(wcd938x->tx_sdw_dev, &wcd938x_regmap_config);
+	if (IS_ERR(wcd938x->regmap)) {
 		dev_err(dev, "%s: tx csr regmap not found\n", __func__);
 		return PTR_ERR(wcd938x->regmap);
 	}
diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index 9db3ab6e47a6..07b08de4cebf 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -663,11 +663,9 @@ struct wcd938x_sdw_priv {
 	int num_ports;
 	bool is_tx;
 	struct wcd938x_priv *wcd938x;
+	struct irq_domain *slave_irq;
 };
 
-extern struct regmap_config wcd938x_regmap_config;
-int wcd938x_handle_sdw_irq(struct wcd938x_sdw_priv *priv);
-
 #if IS_ENABLED(CONFIG_SND_SOC_WCD938X_SDW)
 int wcd938x_sdw_free(struct wcd938x_sdw_priv *wcd,
 		     struct snd_pcm_substream *substream,
-- 
2.21.0

