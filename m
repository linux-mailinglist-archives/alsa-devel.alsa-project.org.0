Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F7780D059
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 17:01:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BD03DF5;
	Mon, 11 Dec 2023 17:01:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BD03DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702310480;
	bh=UsMtLA9CYR5W64S/WUG7hA/bsQFP8mLGJ62c2o43ZNA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YH72LtjLIXXtyWkMh38Be/rkD1US77vXDsrcuyZOyv0a/NOT8POP9v1cxqET1lt66
	 xAv6mNiMrvRL4HCS0di0BE25FUEX7ezcIY55r+GWR42KTD/gJ13nMq+AEJQuvw9MiW
	 ftk9ZTNa6+Oh/KClEX4TwC1MTH1oiCjU0zF6vxos=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 029E2F805B3; Mon, 11 Dec 2023 17:00:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15FE7F80589;
	Mon, 11 Dec 2023 17:00:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B438BF80124; Mon, 11 Dec 2023 17:00:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3275F80124
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 17:00:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3275F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=MF+j0qgj
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BB7Pkm9007446;
	Mon, 11 Dec 2023 10:00:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=Z8mNQxvtfK0GIc60KNPQ4AiJ4cdO+EP4xZTuiTrV6u4=; b=
	MF+j0qgjm++zHTpQDTDZhW4mNFQemwIg2rwY6z53j90n5zStHj7xI1xMWiSWIETX
	jKL4U/0q3Q7m9X1LlBb6QiHXSp8AIyU843iQFH9nQOwjdCA6hhuop5yGusL9ewgU
	H5/Ef80Ucr0gmTHoFtdIgj4z0/B9Fyjww6cwHpDyWH9SnLxVEUejT1/wF9TUTQjY
	2b8JWDHkGprYHMMCQhs2sRouY6B0PFVzUHhT62qXy1aJsKxlw4MyxDMqxWrsTH49
	rXg0TF09NX5xG5RiojnpjJ5ubXnOTTwSEq4WXGfptlczsIiBCTKmQmwjjkJEBPae
	ZHUF7ooXqEm05trOpAlZPQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3uvnhpj0qy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 10:00:21 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 16:00:19 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 11 Dec 2023 16:00:19 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 56CB611D4;
	Mon, 11 Dec 2023 16:00:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 2/2] ASoC: cs42l43: Allow HP amp to cool off after current
 limit
Date: Mon, 11 Dec 2023 16:00:19 +0000
Message-ID: <20231211160019.2034442-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211160019.2034442-1-ckeepax@opensource.cirrus.com>
References: <20231211160019.2034442-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ju_ol_jfxBlnFMei0z9vswXDhy5Ap4jJ
X-Proofpoint-ORIG-GUID: ju_ol_jfxBlnFMei0z9vswXDhy5Ap4jJ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: Z4HXIQNNNJH2FBXR4RDN7PWCPQFSREVJ
X-Message-ID-Hash: Z4HXIQNNNJH2FBXR4RDN7PWCPQFSREVJ
X-MailFrom: prvs=77093359cb=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z4HXIQNNNJH2FBXR4RDN7PWCPQFSREVJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Whilst occasional current limiting is fine, constant current limiting
should be avoided. Add a back off system that will disable the
headphone amp, if a lot of current limiting is seen in a short window
of time.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c |  4 +-
 sound/soc/codecs/cs42l43.c      | 88 +++++++++++++++++++++++++++++++--
 sound/soc/codecs/cs42l43.h      |  9 ++++
 3 files changed, 96 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 54a3ea6064438..24a598f2ed9a3 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -507,7 +507,7 @@ static void cs42l43_start_load_detect(struct cs42l43_codec *priv)
 
 	priv->load_detect_running = true;
 
-	if (priv->hp_ena) {
+	if (priv->hp_ena && !priv->hp_ilimited) {
 		unsigned long time_left;
 
 		reinit_completion(&priv->hp_shutdown);
@@ -572,7 +572,7 @@ static void cs42l43_stop_load_detect(struct cs42l43_codec *priv)
 			   CS42L43_ADC1_EN_MASK | CS42L43_ADC2_EN_MASK,
 			   priv->adc_ena);
 
-	if (priv->hp_ena) {
+	if (priv->hp_ena && !priv->hp_ilimited) {
 		unsigned long time_left;
 
 		reinit_completion(&priv->hp_startup);
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 5c98343ebf71b..d2412dab35996 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -138,7 +138,87 @@ CS42L43_IRQ_ERROR(spkr_therm_warm)
 CS42L43_IRQ_ERROR(spkl_therm_warm)
 CS42L43_IRQ_ERROR(spkr_sc_detect)
 CS42L43_IRQ_ERROR(spkl_sc_detect)
-CS42L43_IRQ_ERROR(hp_ilimit)
+
+void cs42l43_hp_ilimit_clear_work(struct work_struct *work)
+{
+	struct cs42l43_codec *priv = container_of(work, struct cs42l43_codec,
+						  hp_ilimit_clear_work.work);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(priv->component);
+
+	snd_soc_dapm_mutex_lock(dapm);
+
+	priv->hp_ilimit_count--;
+
+	if (priv->hp_ilimit_count)
+		queue_delayed_work(system_wq, &priv->hp_ilimit_clear_work,
+				   msecs_to_jiffies(CS42L43_HP_ILIMIT_DECAY_MS));
+
+	snd_soc_dapm_mutex_unlock(dapm);
+}
+
+void cs42l43_hp_ilimit_work(struct work_struct *work)
+{
+	struct cs42l43_codec *priv = container_of(work, struct cs42l43_codec,
+						  hp_ilimit_work);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(priv->component);
+	struct cs42l43 *cs42l43 = priv->core;
+
+	snd_soc_dapm_mutex_lock(dapm);
+
+	if (priv->hp_ilimit_count < CS42L43_HP_ILIMIT_MAX_COUNT) {
+		if (!priv->hp_ilimit_count)
+			queue_delayed_work(system_wq, &priv->hp_ilimit_clear_work,
+					   msecs_to_jiffies(CS42L43_HP_ILIMIT_DECAY_MS));
+
+		priv->hp_ilimit_count++;
+		snd_soc_dapm_mutex_unlock(dapm);
+		return;
+	}
+
+	dev_err(priv->dev, "Disabling headphone for %dmS, due to frequent current limit\n",
+		CS42L43_HP_ILIMIT_BACKOFF_MS);
+
+	priv->hp_ilimited = true;
+
+	// No need to wait for disable, as just disabling for a period of time
+	regmap_update_bits(cs42l43->regmap, CS42L43_BLOCK_EN8,
+			   CS42L43_HP_EN_MASK, 0);
+
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	msleep(CS42L43_HP_ILIMIT_BACKOFF_MS);
+
+	snd_soc_dapm_mutex_lock(dapm);
+
+	if (priv->hp_ena && !priv->load_detect_running) {
+		unsigned long time_left;
+
+		reinit_completion(&priv->hp_startup);
+
+		regmap_update_bits(cs42l43->regmap, CS42L43_BLOCK_EN8,
+				   CS42L43_HP_EN_MASK, priv->hp_ena);
+
+		time_left = wait_for_completion_timeout(&priv->hp_startup,
+							msecs_to_jiffies(CS42L43_HP_TIMEOUT_MS));
+		if (!time_left)
+			dev_err(priv->dev, "ilimit HP restore timed out\n");
+	}
+
+	priv->hp_ilimited = false;
+
+	snd_soc_dapm_mutex_unlock(dapm);
+}
+
+static irqreturn_t cs42l43_hp_ilimit(int irq, void *data)
+{
+	struct cs42l43_codec *priv = data;
+
+	dev_dbg(priv->dev, "headphone ilimit IRQ\n");
+
+	queue_work(system_long_wq, &priv->hp_ilimit_work);
+
+	return IRQ_HANDLED;
+}
 
 #define CS42L43_IRQ_COMPLETE(name) \
 static irqreturn_t cs42l43_##name(int irq, void *data) \
@@ -1452,13 +1532,13 @@ static int cs42l43_hp_ev(struct snd_soc_dapm_widget *w,
 		if (ret)
 			return ret;
 
-		if (!priv->load_detect_running)
+		if (!priv->load_detect_running && !priv->hp_ilimited)
 			regmap_update_bits(cs42l43->regmap, CS42L43_BLOCK_EN8,
 					   mask, val);
 		break;
 	case SND_SOC_DAPM_POST_PMU:
 	case SND_SOC_DAPM_POST_PMD:
-		if (priv->load_detect_running)
+		if (priv->load_detect_running || priv->hp_ilimited)
 			break;
 
 		ret = cs42l43_dapm_wait_completion(&priv->hp_startup,
@@ -2169,7 +2249,9 @@ static int cs42l43_codec_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&priv->tip_sense_work, cs42l43_tip_sense_work);
 	INIT_DELAYED_WORK(&priv->bias_sense_timeout, cs42l43_bias_sense_timeout);
 	INIT_DELAYED_WORK(&priv->button_press_work, cs42l43_button_press_work);
+	INIT_DELAYED_WORK(&priv->hp_ilimit_clear_work, cs42l43_hp_ilimit_clear_work);
 	INIT_WORK(&priv->button_release_work, cs42l43_button_release_work);
+	INIT_WORK(&priv->hp_ilimit_work, cs42l43_hp_ilimit_work);
 
 	pm_runtime_set_autosuspend_delay(priv->dev, 100);
 	pm_runtime_use_autosuspend(priv->dev);
diff --git a/sound/soc/codecs/cs42l43.h b/sound/soc/codecs/cs42l43.h
index bf4f728eea3e0..125e36861d5d5 100644
--- a/sound/soc/codecs/cs42l43.h
+++ b/sound/soc/codecs/cs42l43.h
@@ -28,6 +28,10 @@
 #define CS42L43_HP_TIMEOUT_MS		2000
 #define CS42L43_LOAD_TIMEOUT_MS		1000
 
+#define CS42L43_HP_ILIMIT_BACKOFF_MS	1000
+#define CS42L43_HP_ILIMIT_DECAY_MS	300
+#define CS42L43_HP_ILIMIT_MAX_COUNT	4
+
 #define CS42L43_ASP_MAX_CHANNELS	6
 #define CS42L43_N_EQ_COEFFS		15
 
@@ -88,6 +92,11 @@ struct cs42l43_codec {
 	bool button_detect_running;
 	bool jack_present;
 	int jack_override;
+
+	struct work_struct hp_ilimit_work;
+	struct delayed_work hp_ilimit_clear_work;
+	bool hp_ilimited;
+	int hp_ilimit_count;
 };
 
 #if IS_REACHABLE(CONFIG_SND_SOC_CS42L43_SDW)
-- 
2.39.2

