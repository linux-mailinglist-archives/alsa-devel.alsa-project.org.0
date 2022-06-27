Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E407F55B5BE
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 05:31:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 710B583D;
	Mon, 27 Jun 2022 05:30:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 710B583D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656300687;
	bh=E4+zXSeKIKgiJKO/Tpb8DqKYkZQaKIm0y0dGr7K0bfc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HdrWcSbWBPiwT+vU5YkR3kiFbJ54hOF9SV4tZpVAeV5qAP/lsqei24ieKrDSaACH2
	 gmQ+KmtRYncg79iP0z8Aa8s8Wv5vhTk4Nat1wySHhqPomPewbD5Kfgb3xqFny1ACxl
	 QEnXUAO+Soaj3F8ACVprMm5Ptkj1JuiBgN3y0KmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC694F80128;
	Mon, 27 Jun 2022 05:30:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2664CF8028B; Mon, 27 Jun 2022 05:30:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 6AD58F800E9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 05:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AD58F800E9
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
 by maillog.nuvoton.com (Postfix) with ESMTP id AD3261C8118F;
 Mon, 27 Jun 2022 11:30:13 +0800 (CST)
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 27 Jun
 2022 11:30:13 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Mon, 27 Jun
 2022 11:30:01 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 27 Jun 2022 11:30:01 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: nau8821: Add headset button detection
Date: Mon, 27 Jun 2022 11:29:59 +0800
Message-ID: <20220627032959.3442064-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com,
 Seven Lee <wtli@nuvoton.com>, SJLIN0@nuvoton.com, KCHSU0@nuvoton.com,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, CTLIN0@nuvoton.com,
 dardar923@gmail.com, supercraig0719@gmail.com
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

This patch adds the function of headphone button detection,
Button detection will be enabled if the device tree
has a key_enable property.

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 .../devicetree/bindings/sound/nau8821.txt     |  2 +-
 sound/soc/codecs/nau8821.c                    | 35 +++++++++++++++++++
 sound/soc/codecs/nau8821.h                    |  1 +
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/nau8821.txt b/Documentation/devicetree/bindings/sound/nau8821.txt
index 6c3baf7a5f21..7c84e7c7327a 100644
--- a/Documentation/devicetree/bindings/sound/nau8821.txt
+++ b/Documentation/devicetree/bindings/sound/nau8821.txt
@@ -34,7 +34,7 @@ Optional properties:
   - nuvoton,jack-eject-debounce: number from 0 to 7 that sets debounce time to 2^(n+2) ms
 
   - nuvoton,dmic-clk-threshold: the ADC threshold of DMIC clock.
-
+  - nuvoton,key_enable: Headset button detection switch.
 
 Example:
 
diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index ce4e7f46bb06..7b0a9c8db40a 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -29,6 +29,8 @@
 #define NAU_FVCO_MAX 100000000
 #define NAU_FVCO_MIN 90000000
 
+#define NAU8821_BUTTON SND_JACK_BTN_0
+
 /* the maximum frequency of CLK_ADC and CLK_DAC */
 #define CLK_DA_AD_MAX 6144000
 
@@ -911,6 +913,20 @@ static void nau8821_eject_jack(struct nau8821 *nau8821)
 	/* Recover to normal channel input */
 	regmap_update_bits(regmap, NAU8821_R2B_ADC_RATE,
 			NAU8821_ADC_R_SRC_EN, 0);
+	if (nau8821->key_enable) {
+		regmap_update_bits(regmap, NAU8821_R0F_INTERRUPT_MASK,
+			NAU8821_IRQ_KEY_RELEASE_EN |
+			NAU8821_IRQ_KEY_PRESS_EN,
+			NAU8821_IRQ_KEY_RELEASE_EN |
+			NAU8821_IRQ_KEY_PRESS_EN);
+		regmap_update_bits(regmap,
+			NAU8821_R12_INTERRUPT_DIS_CTRL,
+			NAU8821_IRQ_KEY_RELEASE_DIS |
+			NAU8821_IRQ_KEY_PRESS_DIS,
+			NAU8821_IRQ_KEY_RELEASE_DIS |
+			NAU8821_IRQ_KEY_PRESS_DIS);
+	}
+
 }
 
 static void nau8821_jdet_work(struct work_struct *work)
@@ -940,6 +956,15 @@ static void nau8821_jdet_work(struct work_struct *work)
 		 */
 		regmap_update_bits(regmap, NAU8821_R2B_ADC_RATE,
 			NAU8821_ADC_R_SRC_EN, NAU8821_ADC_R_SRC_EN);
+		if (nau8821->key_enable) {
+			regmap_update_bits(regmap, NAU8821_R0F_INTERRUPT_MASK,
+				NAU8821_IRQ_KEY_RELEASE_EN |
+				NAU8821_IRQ_KEY_PRESS_EN, 0);
+			regmap_update_bits(regmap,
+				NAU8821_R12_INTERRUPT_DIS_CTRL,
+				NAU8821_IRQ_KEY_RELEASE_DIS |
+				NAU8821_IRQ_KEY_PRESS_DIS, 0);
+		}
 	} else {
 		dev_dbg(nau8821->dev, "Headphone connected\n");
 		event |= SND_JACK_HEADPHONE;
@@ -999,6 +1024,13 @@ static irqreturn_t nau8821_interrupt(int irq, void *data)
 		nau8821_eject_jack(nau8821);
 		event_mask |= SND_JACK_HEADSET;
 		clear_irq = NAU8821_JACK_EJECT_IRQ_MASK;
+	} else if (active_irq & NAU8821_KEY_SHORT_PRESS_IRQ) {
+		event |= NAU8821_BUTTON;
+		event_mask |= NAU8821_BUTTON;
+		clear_irq = NAU8821_KEY_SHORT_PRESS_IRQ;
+	} else if (active_irq & NAU8821_KEY_RELEASE_IRQ) {
+		event_mask = NAU8821_BUTTON;
+		clear_irq = NAU8821_KEY_RELEASE_IRQ;
 	} else if ((active_irq & NAU8821_JACK_INSERT_IRQ_MASK) ==
 		NAU8821_JACK_INSERT_DETECTED) {
 		regmap_update_bits(regmap, NAU8821_R71_ANALOG_ADC_1,
@@ -1490,6 +1522,7 @@ static void nau8821_print_device_properties(struct nau8821 *nau8821)
 		nau8821->jack_eject_debounce);
 	dev_dbg(dev, "dmic-clk-threshold:       %d\n",
 		nau8821->dmic_clk_threshold);
+	dev_dbg(dev, "key_enable:       %d\n", nau8821->key_enable);
 }
 
 static int nau8821_read_device_properties(struct device *dev,
@@ -1503,6 +1536,8 @@ static int nau8821_read_device_properties(struct device *dev,
 		"nuvoton,jkdet-pull-enable");
 	nau8821->jkdet_pull_up = device_property_read_bool(dev,
 		"nuvoton,jkdet-pull-up");
+	nau8821->key_enable = device_property_read_bool(dev,
+		"nuvoton,key-enable");
 	ret = device_property_read_u32(dev, "nuvoton,jkdet-polarity",
 		&nau8821->jkdet_polarity);
 	if (ret)
diff --git a/sound/soc/codecs/nau8821.h b/sound/soc/codecs/nau8821.h
index a92edfeb9d3a..c44251f54d48 100644
--- a/sound/soc/codecs/nau8821.h
+++ b/sound/soc/codecs/nau8821.h
@@ -525,6 +525,7 @@ struct nau8821 {
 	int jack_eject_debounce;
 	int fs;
 	int dmic_clk_threshold;
+	int key_enable;
 };
 
 int nau8821_enable_jack_detect(struct snd_soc_component *component,
-- 
2.25.1

