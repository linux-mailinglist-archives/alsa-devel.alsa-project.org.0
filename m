Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB93977E53
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:15:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 631D0162C;
	Fri, 13 Sep 2024 13:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 631D0162C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726226132;
	bh=PiygWBMWWgmiBJlhMmEQ0JypGcuuZJZ1K9IpKWur6s8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tnh260RcXevPvN09Y8J7Jj/U6mvj8B0o+xUv8RZydXLQ7wPW66phfiMsfoBlFH3gM
	 yDqiK8uyk1Mc5lTnBTxmrbrydaLR9TE4sKpQNezBSyuk5LHo9IqMnalrEz+4VNx9Lp
	 FSL+8aqNTmredDRkdgbgeBC+IqZ/rpKAW11vaUo0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51E2AF80631; Fri, 13 Sep 2024 13:12:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E45A2F8062F;
	Fri, 13 Sep 2024 13:12:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DFC2F801F5; Wed, 11 Sep 2024 14:30:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5282F80107
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 14:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5282F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=xqtxpnb7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726057803; x=1757593803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PiygWBMWWgmiBJlhMmEQ0JypGcuuZJZ1K9IpKWur6s8=;
  b=xqtxpnb7k4yNICQLyb0HBUpqE38bIzlGC226uPNaUA7/tId0dr5pGD9o
   SZyX/k1+UNECZzy7kmnSOjAu/7/BBAwhyzwYphFIU2pH8PrNnyQTPdcI4
   vVu2tIaSOCfcrlxDymq3NypuZwTsCuf3wFpNEQMqYxtRRgb1bGGMQ1nor
   3yOt7N4D5J2xO9YnSIRDu0eTk19mDqpp1g5d7rT36JD0TpCPW6GRlXJEj
   R+t/dWsi2FTD1EOtq5BJtpEH5dYDucjgR7gBxkvDFN6YOsCYYfXps1VhQ
   TAjAT+UyV+tY7OyBp/OiHL03WK1xuwmeT4ziwKK6xNqU3f1ooDHgol7SB
   A==;
X-CSE-ConnectionGUID: 9vUpuscIQ26YBlU3BRadaQ==
X-CSE-MsgGUID: rcOEGGVATUaFBm20lYIsUg==
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600";
   d="scan'208";a="32269432"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Sep 2024 05:29:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 11 Sep 2024 05:29:23 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 11 Sep 2024 05:29:20 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH 3/3] ASoC: atmel: mchp-pdmc: Retain Non-Runtime Controls
Date: Wed, 11 Sep 2024 15:29:09 +0300
Message-ID: <20240911122909.133399-4-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911122909.133399-1-andrei.simion@microchip.com>
References: <20240911122909.133399-1-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=977ab1c01=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IOL73OV2VZAJGB3BVRITL2MRUTFSJYAG
X-Message-ID-Hash: IOL73OV2VZAJGB3BVRITL2MRUTFSJYAG
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:12:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IOL73OV2VZAJGB3BVRITL2MRUTFSJYAG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Avoid removing these controls, as doing so can cause issues if the stream
is initiated from another control. Ensure these controls remain intact when
the stream is started or finished. Instead of removing them, return an
-EBUSY error code to indicate that the controller is busy, especially when
the audio filter and the SINC filter are in use.

[andrei.simion@microchip.com: Reword the commit title and the commit
message. Adapt the code from kernel v6.1 -> v6.6 -> latest kernel version.]

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
 sound/soc/atmel/mchp-pdmc.c | 78 ++++++++++++++++---------------------
 1 file changed, 34 insertions(+), 44 deletions(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index d97d153ee375..758b3c550b97 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/spinlock.h>
 
 #include <sound/core.h>
 #include <sound/dmaengine_pcm.h>
@@ -113,6 +114,7 @@ struct mchp_pdmc_chmap {
 
 struct mchp_pdmc {
 	struct mic_map channel_mic_map[MCHP_PDMC_MAX_CHANNELS];
+	spinlock_t busy_lock;		/* lock protecting busy */
 	struct device *dev;
 	struct snd_dmaengine_dai_dma_data addr;
 	struct regmap *regmap;
@@ -124,6 +126,7 @@ struct mchp_pdmc {
 	int mic_no;
 	int sinc_order;
 	bool audio_filter_en;
+	u8 busy:1;
 };
 
 static const char *const mchp_pdmc_sinc_filter_order_text[] = {
@@ -167,10 +170,19 @@ static int mchp_pdmc_sinc_order_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 
 	val = snd_soc_enum_item_to_val(e, item[0]) << e->shift_l;
-	if (val == dd->sinc_order)
+
+	spin_lock(&dd->busy_lock);
+	if (dd->busy) {
+		spin_unlock((&dd->busy_lock));
+		return -EBUSY;
+	}
+	if (val == dd->sinc_order) {
+		spin_unlock((&dd->busy_lock));
 		return 0;
+	}
 
 	dd->sinc_order = val;
+	spin_unlock((&dd->busy_lock));
 
 	return 1;
 }
@@ -193,10 +205,18 @@ static int mchp_pdmc_af_put(struct snd_kcontrol *kcontrol,
 	struct mchp_pdmc *dd = snd_soc_component_get_drvdata(component);
 	bool af = uvalue->value.integer.value[0] ? true : false;
 
-	if (dd->audio_filter_en == af)
+	spin_lock(&dd->busy_lock);
+	if (dd->busy) {
+		spin_unlock((&dd->busy_lock));
+		return -EBUSY;
+	}
+	if (dd->audio_filter_en == af) {
+		spin_unlock((&dd->busy_lock));
 		return 0;
+	}
 
 	dd->audio_filter_en = af;
+	spin_unlock((&dd->busy_lock));
 
 	return 1;
 }
@@ -379,52 +399,10 @@ static const struct snd_kcontrol_new mchp_pdmc_snd_controls[] = {
 	},
 };
 
-static int mchp_pdmc_close(struct snd_soc_component *component,
-			   struct snd_pcm_substream *substream)
-{
-	return snd_soc_add_component_controls(component, mchp_pdmc_snd_controls,
-					      ARRAY_SIZE(mchp_pdmc_snd_controls));
-}
-
-static int mchp_pdmc_open(struct snd_soc_component *component,
-			  struct snd_pcm_substream *substream)
-{
-	int i;
-
-	/* remove controls that can't be changed at runtime */
-	for (i = 0; i < ARRAY_SIZE(mchp_pdmc_snd_controls); i++) {
-		const struct snd_kcontrol_new *control = &mchp_pdmc_snd_controls[i];
-		struct snd_ctl_elem_id id;
-		int err;
-
-		if (component->name_prefix)
-			snprintf(id.name, sizeof(id.name), "%s %s", component->name_prefix,
-				 control->name);
-		else
-			strscpy(id.name, control->name, sizeof(id.name));
-
-		id.numid = 0;
-		id.iface = control->iface;
-		id.device = control->device;
-		id.subdevice = control->subdevice;
-		id.index = control->index;
-		err = snd_ctl_remove_id(component->card->snd_card, &id);
-		if (err < 0)
-			dev_err(component->dev, "%d: Failed to remove %s\n", err,
-				control->name);
-	}
-
-	return 0;
-}
-
 static const struct snd_soc_component_driver mchp_pdmc_dai_component = {
 	.name = "mchp-pdmc",
 	.controls = mchp_pdmc_snd_controls,
 	.num_controls = ARRAY_SIZE(mchp_pdmc_snd_controls),
-	.open = &mchp_pdmc_open,
-	.close = &mchp_pdmc_close,
-	.legacy_dai_naming = 1,
-	.trigger_start = SND_SOC_TRIGGER_ORDER_LDC,
 };
 
 static const unsigned int mchp_pdmc_1mic[] = {1};
@@ -587,6 +565,13 @@ static int mchp_pdmc_hw_params(struct snd_pcm_substream *substream,
 			cfgr_val |= MCHP_PDMC_CFGR_BSSEL(i);
 	}
 
+	/*
+	 * from these point forward, we consider the controller busy, so the
+	 * audio filter and SINC order can't be changed
+	 */
+	spin_lock(&dd->busy_lock);
+	dd->busy = 1;
+	spin_unlock((&dd->busy_lock));
 	for (osr_start = dd->audio_filter_en ? 64 : 8;
 	     osr_start <= 256 && best_diff_rate; osr_start *= 2) {
 		long round_rate;
@@ -1099,6 +1084,7 @@ static int mchp_pdmc_probe(struct platform_device *pdev)
 	 */
 	dd->audio_filter_en = true;
 	dd->sinc_order = 3;
+	spin_lock_init(&dd->busy_lock);
 
 	dd->addr.addr = (dma_addr_t)res->start + MCHP_PDMC_RHR;
 	platform_set_drvdata(pdev, dd);
@@ -1143,6 +1129,10 @@ static void mchp_pdmc_remove(struct platform_device *pdev)
 {
 	struct mchp_pdmc *dd = platform_get_drvdata(pdev);
 
+	spin_lock(&dd->busy_lock);
+	dd->busy = 0;
+	spin_unlock((&dd->busy_lock));
+
 	if (!pm_runtime_status_suspended(dd->dev))
 		mchp_pdmc_runtime_suspend(dd->dev);
 
-- 
2.34.1

