Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA7145D479
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 07:00:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E88B1836;
	Thu, 25 Nov 2021 06:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E88B1836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637820019;
	bh=3D73ReJfmTp72bcSMmcDyGRnsS+g0UewPvSa7t2GUtw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JkjIvEgI53+6pAgUPBNGVk2V4OKn8+ebo9HAGyKoquNSmy7Jo56GUgj+2KqYVO2jo
	 UbXaITxZmc4xhry7tBQO2xvKAuQu3/7ORSqociofNbhu9b/4UbArULX4/UBVDKhqOk
	 ZL23ZNSi8L21aObboxYoiORiU3mlHrWf8P/ln4Xs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D1A0F804BC;
	Thu, 25 Nov 2021 06:58:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ADCCF80087; Thu, 25 Nov 2021 06:58:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56FF2F8007E
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 06:58:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56FF2F8007E
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1AP5wLWT1027547,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1AP5wLWT1027547
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 25 Nov 2021 13:58:21 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 25 Nov 2021 13:58:21 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 25 Nov 2021 00:58:20 -0500
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: rt5640: Add the HDA header support
Date: Thu, 25 Nov 2021 13:58:12 +0800
Message-ID: <20211125055812.8911-2-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211125055812.8911-1-oder_chiou@realtek.com>
References: <20211125055812.8911-1-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36503.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/25/2021 05:43:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzExLzI0IKRVpMggMTA6Mzc6MDA=?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
Cc: Oder Chiou <oder_chiou@realtek.com>, jack.yu@realtek.com,
 alsa-devel@alsa-project.org, jacal_tseng@realtek.com, spujar@nvidia.com,
 albertchen@realtek.com, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

The patch adds the HDA header support.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 sound/soc/codecs/rt5640.c | 97 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index d01fe73ab9c8..08b37878cb00 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -195,6 +195,7 @@ static bool rt5640_volatile_register(struct device *dev, unsigned int reg)
 	case RT5640_PRIV_DATA:
 	case RT5640_PGM_REG_ARR1:
 	case RT5640_PGM_REG_ARR3:
+	case RT5640_DUMMY2:
 	case RT5640_VENDOR_ID:
 	case RT5640_VENDOR_ID1:
 	case RT5640_VENDOR_ID2:
@@ -2301,6 +2302,38 @@ static void rt5640_jack_work(struct work_struct *work)
 	struct snd_soc_component *component = rt5640->component;
 	int status;
 
+	if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER) {
+		int val, jack_type = 0, hda_mic_plugged, hda_hp_plugged;
+
+		/* mic jack */
+		val = snd_soc_component_read(component, RT5640_INT_IRQ_ST);
+		hda_mic_plugged = !(val & RT5640_JD_STATUS);
+		dev_dbg(component->dev, "mic jack status %d\n",
+			hda_mic_plugged);
+
+		snd_soc_component_update_bits(component, RT5640_IRQ_CTRL1,
+			RT5640_JD_P_MASK, !hda_mic_plugged << RT5640_JD_P_SFT);
+
+		if (hda_mic_plugged)
+			jack_type |= SND_JACK_MICROPHONE;
+
+		/* headphone jack */
+		val = snd_soc_component_read(component, RT5640_DUMMY2);
+		hda_hp_plugged = !(val & (0x1 << 11));
+		dev_dbg(component->dev, "headphone jack status %d\n",
+			hda_hp_plugged);
+
+		snd_soc_component_update_bits(component, RT5640_DUMMY2,
+			(0x1 << 10), !hda_hp_plugged << 10);
+
+		if (hda_hp_plugged)
+			jack_type |= SND_JACK_HEADPHONE;
+
+		snd_soc_jack_report(rt5640->jack, jack_type, SND_JACK_HEADSET);
+
+		return;
+	}
+
 	if (!rt5640_jack_inserted(component)) {
 		/* Jack removed, or spurious IRQ? */
 		if (rt5640->jack->status & SND_JACK_HEADPHONE) {
@@ -2478,13 +2511,57 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 	queue_work(system_long_wq, &rt5640->jack_work);
 }
 
+static void rt5640_enable_hda_jack_detect(
+	struct snd_soc_component *component, struct snd_soc_jack *jack)
+{
+	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	/* Select JD1 for Mic */
+	snd_soc_component_update_bits(component, RT5640_JD_CTRL,
+		RT5640_JD_MASK, RT5640_JD_JD1_IN4P);
+	snd_soc_component_write(component, RT5640_IRQ_CTRL1, RT5640_IRQ_JD_NOR);
+
+	/* Select JD2 for Headphone */
+	snd_soc_component_update_bits(component, RT5640_DUMMY2, 0x1100, 0x1100);
+
+	/* Selecting GPIO01 as an interrupt */
+	snd_soc_component_update_bits(component, RT5640_GPIO_CTRL1,
+		RT5640_GP1_PIN_MASK, RT5640_GP1_PIN_IRQ);
+
+	/* Set GPIO1 output */
+	snd_soc_component_update_bits(component, RT5640_GPIO_CTRL3,
+		RT5640_GP1_PF_MASK, RT5640_GP1_PF_OUT);
+
+	snd_soc_component_update_bits(component, RT5640_DUMMY1, 0x700, 0x300);
+
+	rt5640->jack = jack;
+
+	ret = request_irq(rt5640->irq, rt5640_irq,
+			  IRQF_TRIGGER_RISING | IRQF_ONESHOT, "rt5640", rt5640);
+	if (ret) {
+		dev_warn(component->dev, "Failed to reguest IRQ %d: %d\n", rt5640->irq, ret);
+		rt5640->irq = -ENXIO;
+		return;
+	}
+
+	/* sync initial jack state */
+	queue_work(system_long_wq, &rt5640->jack_work);
+}
+
 static int rt5640_set_jack(struct snd_soc_component *component,
 			   struct snd_soc_jack *jack, void *data)
 {
-	if (jack)
-		rt5640_enable_jack_detect(component, jack);
-	else
+	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
+
+	if (jack) {
+		if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER)
+			rt5640_enable_hda_jack_detect(component, jack);
+		else
+			rt5640_enable_jack_detect(component, jack);
+	} else {
 		rt5640_disable_jack_detect(component);
+	}
 
 	return 0;
 }
@@ -2576,6 +2653,8 @@ static int rt5640_probe(struct snd_soc_component *component)
 				     "realtek,jack-detect-source", &val) == 0) {
 		if (val <= RT5640_JD_SRC_GPIO4)
 			rt5640->jd_src = val << RT5640_JD_SFT;
+		else if (val == RT5640_JD_SRC_HDA_HEADER)
+			rt5640->jd_src = RT5640_JD_SRC_HDA_HEADER;
 		else
 			dev_warn(component->dev, "Warning: Invalid jack-detect-source value: %d, leaving jack-detect disabled\n",
 				 val);
@@ -2632,6 +2711,7 @@ static int rt5640_suspend(struct snd_soc_component *component)
 {
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
 
+	rt5640_cancel_work(rt5640);
 	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
 	rt5640_reset(component);
 	regcache_cache_only(rt5640->regmap, true);
@@ -2654,6 +2734,17 @@ static int rt5640_resume(struct snd_soc_component *component)
 	regcache_cache_only(rt5640->regmap, false);
 	regcache_sync(rt5640->regmap);
 
+	if (rt5640->jd_src) {
+		if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER)
+			snd_soc_component_update_bits(component,
+				RT5640_DUMMY2, 0x1100, 0x1100);
+		else
+			snd_soc_component_write(component, RT5640_DUMMY2,
+				0x4001);
+
+		queue_work(system_long_wq, &rt5640->jack_work);
+	}
+
 	return 0;
 }
 #else
-- 
2.33.1

