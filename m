Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D1164607
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 14:52:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E51C8169A;
	Wed, 19 Feb 2020 14:52:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E51C8169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582120378;
	bh=ron3dWdIAkzMTUfq8sbGd6PFM42A62b/AhZv4qkkENI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ataHlWHIvVisnwLylYJo4FVnqnL8SEjwIQ1B2Xad1r+mdXK5jxDNHBt4clY9bz4IM
	 ix+rxPCLUNfONunIkwqmcF9C2/MX8ISG+3USGbJUJxF3vCgMxmK4YBubtPyXemUI/u
	 h5j1Ct1YESV9U2wOzdNVvAmCaphbmIgyb/hEPuGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12A07F80276;
	Wed, 19 Feb 2020 14:51:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4782AF80273; Wed, 19 Feb 2020 14:51:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 147F1F80142
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 14:51:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 147F1F80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LnjG0+3a"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01JDp7OS029970;
 Wed, 19 Feb 2020 07:51:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582120267;
 bh=vTSHaVd8INFkohfIoQSaUHu44hugyt9qmFZrmuUvcUk=;
 h=From:To:CC:Subject:Date;
 b=LnjG0+3auAQ579Ba+OfDzHq5zy8sUEL5JC0Ez42EgKQtbnLdWVeTi+AoNH8pcdWt/
 kssWmoTWECbHi9GX1meiCPOO4DPyrUZZeWLQFNpTJpl542+le+G4UPxG7WRMdUaFKy
 GR00AwFd+sVk8/HtTDLPY7thu3KhVbgsYPJhF5uY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01JDp7Ll071524
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 19 Feb 2020 07:51:07 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 19
 Feb 2020 07:51:06 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 19 Feb 2020 07:51:06 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01JDp6CC005716;
 Wed, 19 Feb 2020 07:51:06 -0600
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH] ASoC: tas2562: Add support for ISENSE and VSENSE
Date: Wed, 19 Feb 2020 07:46:22 -0600
Message-ID: <20200219134622.22066-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
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

Add additional support for ISENSE and VSENSE feature for the TAS2562.
This feature monitors the output to the loud speaker attempts to
eliminate IR drop errors due to packaging.

This feature is defined in Section 8.4.5 IV Sense of the data sheet.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tas2562.c | 32 +++++++++++++++++++++++++++-----
 sound/soc/codecs/tas2562.h |  6 +++---
 2 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 5b4803a76719..b2682c2360b6 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -383,18 +383,34 @@ static int tas2562_dac_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component =
 					snd_soc_dapm_to_component(w->dapm);
 	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		dev_info(tas2562->dev, "SND_SOC_DAPM_POST_PMU\n");
+		ret = snd_soc_component_update_bits(component,
+			TAS2562_PWR_CTRL,
+			TAS2562_MODE_MASK,
+			TAS2562_MUTE);
+		if (ret)
+			goto end;
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
-		dev_info(tas2562->dev, "SND_SOC_DAPM_PRE_PMD\n");
+		ret = snd_soc_component_update_bits(component,
+			TAS2562_PWR_CTRL,
+			TAS2562_MODE_MASK,
+			TAS2562_SHUTDOWN);
+		if (ret)
+			goto end;
 		break;
 	default:
-		break;
+		dev_err(tas2562->dev, "Not supported evevt\n");
+		return -EINVAL;
 	}
 
+end:
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
@@ -416,7 +432,6 @@ static const struct snd_kcontrol_new tas2562_snd_controls[] = {
 static const struct snd_soc_dapm_widget tas2562_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("ASI1", "ASI1 Playback", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0, &tas2562_asi1_mux),
-	SND_SOC_DAPM_AIF_IN("DAC IN", "Playback", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0, tas2562_dac_event,
 			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 	SND_SOC_DAPM_SWITCH("ISENSE", TAS2562_PWR_CTRL, 3, 1, &isense_switch),
@@ -431,7 +446,7 @@ static const struct snd_soc_dapm_route tas2562_audio_map[] = {
 	{"ASI1 Sel", "Left", "ASI1"},
 	{"ASI1 Sel", "Right", "ASI1"},
 	{"ASI1 Sel", "LeftRightDiv2", "ASI1"},
-	{ "DAC", NULL, "DAC IN" },
+	{ "DAC", NULL, "ASI1 Sel" },
 	{ "OUT", NULL, "DAC" },
 	{"ISENSE", "Switch", "IMON"},
 	{"VSENSE", "Switch", "VMON"},
@@ -472,6 +487,13 @@ static struct snd_soc_dai_driver tas2562_dai[] = {
 			.rates      = SNDRV_PCM_RATE_8000_192000,
 			.formats    = TAS2562_FORMATS,
 		},
+		.capture = {
+			.stream_name    = "ASI1 Capture",
+			.channels_min   = 0,
+			.channels_max   = 2,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.formats	= TAS2562_FORMATS,
+		},
 		.ops = &tas2562_speaker_dai_ops,
 	},
 };
diff --git a/sound/soc/codecs/tas2562.h b/sound/soc/codecs/tas2562.h
index 62e659ab786d..6f55ebcf19ea 100644
--- a/sound/soc/codecs/tas2562.h
+++ b/sound/soc/codecs/tas2562.h
@@ -40,7 +40,7 @@
 
 #define TAS2562_RESET	BIT(0)
 
-#define TAS2562_MODE_MASK	0x3
+#define TAS2562_MODE_MASK	GENMASK(1,0)
 #define TAS2562_ACTIVE		0x0
 #define TAS2562_MUTE		0x1
 #define TAS2562_SHUTDOWN	0x2
@@ -73,8 +73,8 @@
 #define TAS2562_TDM_CFG2_RXWLEN_24B	BIT(3)
 #define TAS2562_TDM_CFG2_RXWLEN_32B	(BIT(2) | BIT(3))
 
-#define TAS2562_VSENSE_POWER_EN		BIT(2)
-#define TAS2562_ISENSE_POWER_EN		BIT(3)
+#define TAS2562_VSENSE_POWER_EN		2
+#define TAS2562_ISENSE_POWER_EN		3
 
 #define TAS2562_TDM_CFG5_VSNS_EN	BIT(6)
 #define TAS2562_TDM_CFG5_VSNS_SLOT_MASK	GENMASK(5, 0)
-- 
2.25.0

