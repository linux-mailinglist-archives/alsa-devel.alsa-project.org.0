Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA1991DF42
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:29:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46B2F2BB2;
	Mon,  1 Jul 2024 14:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46B2F2BB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836961;
	bh=HeYnn2+dl8cfrms6otkFFZfFhtM5NtP3TFk1r1EJl34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OFuW677Ms9n52MOHbOgWGTQajLR8+yS4vQR28QvuguZUXx6YPr7ah3Ysit79Kf+E3
	 50m/Or0Zfn3DK0Ea3yuLHxNH3aZ5BZNd31OdbuzRVjeLzZLX8UlN61sK+Y1X3kB/v9
	 BKVmRS3fSss56/exmEdn4APi1/NcLOrNzP38A5CY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CFDBF8068C; Mon,  1 Jul 2024 14:21:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 051E9F8983F;
	Mon,  1 Jul 2024 14:21:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3F22F80423; Mon, 24 Jun 2024 05:06:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail78-63.sinamail.sina.com.cn (mail78-63.sinamail.sina.com.cn
 [219.142.78.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F583F8049C
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 05:06:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F583F8049C
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.227.101.59])
	by sina.net (10.75.30.239) with ESMTP
	id 6678E2A10002B8DA; Mon, 24 Jun 2024 11:06:14 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 4133754A44F7435C98A7B3A18DE2F114
X-SMAIL-UIID: 4133754A44F7435C98A7B3A18DE2F114-20240624-110614
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH 2/4] ASoC: codecs: ES8326: codec can't enter suspend issue
Date: Mon, 24 Jun 2024 11:06:05 +0800
Message-Id: <20240624030607.4307-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240624030607.4307-1-zhangyi@everest-semi.com>
References: <20240624030607.4307-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JYOFZ7JLX7KJCIHNFEC2WYG5YLZ2YUJB
X-Message-ID-Hash: JYOFZ7JLX7KJCIHNFEC2WYG5YLZ2YUJB
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:21:21 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JYOFZ7JLX7KJCIHNFEC2WYG5YLZ2YUJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When widgets "MICBIAS1" and "MICBIAS2" are active, the codec cannot enter
suspend mode. So we removed these two widgets.We replaced enable_micbias and
disable_micbias with regmap_update_bits to make sure the codec can enter
suspend mode.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 34 +++++-----------------------------
 1 file changed, 5 insertions(+), 29 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 8c9d79686185..95bf751d8bab 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -286,8 +286,6 @@ static const struct snd_soc_dapm_widget es8326_dapm_widgets[] = {
 	/* Analog Power Supply*/
 	SND_SOC_DAPM_DAC("Right DAC", NULL, ES8326_ANA_PDN, 0, 1),
 	SND_SOC_DAPM_DAC("Left DAC", NULL, ES8326_ANA_PDN, 1, 1),
-	SND_SOC_DAPM_SUPPLY("MICBIAS1", ES8326_ANA_MICBIAS, 2, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("MICBIAS2", ES8326_ANA_MICBIAS, 3, 0, NULL, 0),
 
 	SND_SOC_DAPM_PGA("LHPMIX", ES8326_DAC2HPMIX, 7, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("RHPMIX", ES8326_DAC2HPMIX, 3, 0, NULL, 0),
@@ -697,28 +695,6 @@ static struct snd_soc_dai_driver es8326_dai = {
 	.symmetric_rate = 1,
 };
 
-static void es8326_enable_micbias(struct snd_soc_component *component)
-{
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
-
-	snd_soc_dapm_mutex_lock(dapm);
-	snd_soc_dapm_force_enable_pin_unlocked(dapm, "MICBIAS1");
-	snd_soc_dapm_force_enable_pin_unlocked(dapm, "MICBIAS2");
-	snd_soc_dapm_sync_unlocked(dapm);
-	snd_soc_dapm_mutex_unlock(dapm);
-}
-
-static void es8326_disable_micbias(struct snd_soc_component *component)
-{
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
-
-	snd_soc_dapm_mutex_lock(dapm);
-	snd_soc_dapm_disable_pin_unlocked(dapm, "MICBIAS1");
-	snd_soc_dapm_disable_pin_unlocked(dapm, "MICBIAS2");
-	snd_soc_dapm_sync_unlocked(dapm);
-	snd_soc_dapm_mutex_unlock(dapm);
-}
-
 /*
  *	For button detection, set the following in soundcard
  *	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
@@ -822,7 +798,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	if ((iface & ES8326_HPINSERT_FLAG) == 0) {
 		/* Jack unplugged or spurious IRQ */
 		dev_dbg(comp->dev, "No headset detected\n");
-		es8326_disable_micbias(es8326->component);
+		regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x0C, 0x00);
 		if (es8326->jack->status & SND_JACK_HEADPHONE) {
 			dev_dbg(comp->dev, "Report hp remove event\n");
 			snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);
@@ -860,7 +836,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			regmap_write(es8326->regmap, ES8326_INT_SOURCE, 0x00);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x01);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x10, 0x00);
-			es8326_enable_micbias(es8326->component);
+			regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x0C, 0x0C);
 			usleep_range(50000, 70000);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x00);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x10, 0x10);
@@ -1034,7 +1010,7 @@ static int es8326_resume(struct snd_soc_component *component)
 			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol) :
 			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol | 0x04)));
 	usleep_range(5000, 10000);
-	es8326_enable_micbias(es8326->component);
+	regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x0C, 0x0C);
 	usleep_range(50000, 70000);
 	regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x00);
 	regmap_write(es8326->regmap, ES8326_INT_SOURCE, ES8326_INT_SRC_PIN9);
@@ -1063,7 +1039,7 @@ static int es8326_suspend(struct snd_soc_component *component)
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
 
 	cancel_delayed_work_sync(&es8326->jack_detect_work);
-	es8326_disable_micbias(component);
+	regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x0C, 0x00);
 	es8326->calibrated = false;
 	regmap_write(es8326->regmap, ES8326_CLK_MUX, 0x2d);
 	regmap_write(es8326->regmap, ES8326_DAC2HPMIX, 0x00);
@@ -1142,7 +1118,7 @@ static void es8326_disable_jack_detect(struct snd_soc_component *component)
 
 	mutex_lock(&es8326->lock);
 	if (es8326->jack->status & SND_JACK_MICROPHONE) {
-		es8326_disable_micbias(component);
+		regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x0C, 0x00);
 		snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);
 	}
 	es8326->jack = NULL;
-- 
2.17.1

