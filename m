Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A05F91136F7
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 22:18:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 402491669;
	Wed,  4 Dec 2019 22:17:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 402491669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575494288;
	bh=/QZo5z7y/l6cNRKFDXwkqXDtXRd7LlxhMSWkYP1ccnU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eltKnR3XTO0VLuyYWjHLHDRSxqoyqdia0R4QlH5d//6eQ4KMpgLUnnbn5YrnbD5L4
	 1O49XbL8AemQriU/aupWRechk92s+4XRwS6uoJbFvoUc4ERDkNjS4kHf1qQMdI98L7
	 h2d/zte1CUeIt/0O2UCOIIxVzkQQY7xpviX37MFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30307F80214;
	Wed,  4 Dec 2019 22:16:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 973F4F80233; Wed,  4 Dec 2019 22:16:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F738F801EC
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 22:16:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F738F801EC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 13:16:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="223378548"
Received: from rgolani-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.153.236])
 by orsmga002.jf.intel.com with ESMTP; 04 Dec 2019 13:16:11 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  4 Dec 2019 15:15:45 -0600
Message-Id: <20191204211556.12671-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191204211556.12671-1-pierre-louis.bossart@linux.intel.com>
References: <20191204211556.12671-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 02/13] ASoC: Intel - use control components
	to describe card config
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Jaroslav Kysela <perex@perex.cz>

Use the control interface (field 'components' in the info structure)
to pass the I/O configuration details. The goal is to replace
the card long name with this.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/bytcht_es8316.c |  9 ++++++++-
 sound/soc/intel/boards/bytcr_rt5640.c  |  6 ++++++
 sound/soc/intel/boards/bytcr_rt5651.c  | 18 +++++++++++-------
 3 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 46612331f5ea..efa33f30dcac 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -361,6 +361,7 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 /* SoC card */
 static char codec_name[SND_ACPI_I2C_ID_LEN];
 static char long_name[50]; /* = "bytcht-es8316-*-spk-*-mic" */
+static char components_string[32]; /* = "cfg-spk:* cfg-mic:* */
 
 static int byt_cht_es8316_suspend(struct snd_soc_card *card)
 {
@@ -572,11 +573,17 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* register the soc card */
+	snprintf(components_string, sizeof(components_string),
+		 "cfg-spk:%s cfg-mic:%s",
+		 (quirk & BYT_CHT_ES8316_MONO_SPEAKER) ? "1" : "2",
+		 mic_name[BYT_CHT_ES8316_MAP(quirk)]);
+	byt_cht_es8316_card.components = components_string;
 	snprintf(long_name, sizeof(long_name), "bytcht-es8316-%s-spk-%s-mic",
 		 (quirk & BYT_CHT_ES8316_MONO_SPEAKER) ? "mono" : "stereo",
 		 mic_name[BYT_CHT_ES8316_MAP(quirk)]);
 	byt_cht_es8316_card.long_name = long_name;
+
+	/* register the soc card */
 	snd_soc_card_set_drvdata(&byt_cht_es8316_card, priv);
 
 	ret = devm_snd_soc_register_card(dev, &byt_cht_es8316_card);
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index dd2b5ad08659..7bc6d3cec94c 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1083,6 +1083,7 @@ static char byt_rt5640_codec_name[SND_ACPI_I2C_ID_LEN];
 static char byt_rt5640_codec_aif_name[12]; /*  = "rt5640-aif[1|2]" */
 static char byt_rt5640_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
 static char byt_rt5640_long_name[40]; /* = "bytcr-rt5640-*-spk-*-mic" */
+static char byt_rt5640_components[32]; /* = "cfg-spk:* cfg-mic:*" */
 
 static int byt_rt5640_suspend(struct snd_soc_card *card)
 {
@@ -1305,6 +1306,11 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		}
 	}
 
+	snprintf(byt_rt5640_components, sizeof(byt_rt5640_components),
+		 "cfg-spk:%s cfg-mic:%s",
+		 (byt_rt5640_quirk & BYT_RT5640_MONO_SPEAKER) ? "1" : "2",
+		 map_name[BYT_RT5640_MAP(byt_rt5640_quirk)]);
+	byt_rt5640_card.components = byt_rt5640_components;
 	snprintf(byt_rt5640_long_name, sizeof(byt_rt5640_long_name),
 		 "bytcr-rt5640-%s-spk-%s-mic",
 		 (byt_rt5640_quirk & BYT_RT5640_MONO_SPEAKER) ?
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 4606f6f582d6..80a5674ddb1b 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -798,6 +798,7 @@ static char byt_rt5651_codec_name[SND_ACPI_I2C_ID_LEN];
 static char byt_rt5651_codec_aif_name[12]; /*  = "rt5651-aif[1|2]" */
 static char byt_rt5651_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
 static char byt_rt5651_long_name[50]; /* = "bytcr-rt5651-*-spk-*-mic[-swapped-hp]" */
+static char byt_rt5651_components[50]; /* = "cfg-spk:* cfg-mic:*" */
 
 static int byt_rt5651_suspend(struct snd_soc_card *card)
 {
@@ -876,7 +877,6 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	const char *platform_name;
 	struct acpi_device *adev;
 	struct device *codec_dev;
-	const char *hp_swapped;
 	bool is_bytcr = false;
 	int ret_val = 0;
 	int dai_index = 0;
@@ -1080,16 +1080,20 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (byt_rt5651_quirk & BYT_RT5651_HP_LR_SWAPPED)
-		hp_swapped = "-hp-swapped";
-	else
-		hp_swapped = "";
-
+	snprintf(byt_rt5651_components, sizeof(byt_rt5651_components),
+		 "cfg-spk:%s cfg-mic:%s%s",
+		 (byt_rt5651_quirk & BYT_RT5651_MONO_SPEAKER) ? "1" : "2",
+		 mic_name[BYT_RT5651_MAP(byt_rt5651_quirk)],
+		 (byt_rt5651_quirk & BYT_RT5651_HP_LR_SWAPPED) ?
+			" cfg-hp:lrswap" : "");
+	byt_rt5651_card.components = byt_rt5651_components;
 	snprintf(byt_rt5651_long_name, sizeof(byt_rt5651_long_name),
 		 "bytcr-rt5651-%s-spk-%s-mic%s",
 		 (byt_rt5651_quirk & BYT_RT5651_MONO_SPEAKER) ?
 			"mono" : "stereo",
-		 mic_name[BYT_RT5651_MAP(byt_rt5651_quirk)], hp_swapped);
+		 mic_name[BYT_RT5651_MAP(byt_rt5651_quirk)],
+		 (byt_rt5651_quirk & BYT_RT5651_HP_LR_SWAPPED) ?
+			"-hp-swapped" : "");
 	byt_rt5651_card.long_name = byt_rt5651_long_name;
 
 	/* override plaform name, if required */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
