Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A611F109026
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2019 15:38:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13B4A17DA;
	Mon, 25 Nov 2019 15:38:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13B4A17DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574692732;
	bh=Q7oiTXCZ8tpzQBia96V5JWshI9JME1ab0PT5KVmehl4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KiK2bGoSNTcdrlJNoa4O8WAWMQfLxKtwPHLNudg5z8NblJXWXOXYYP+5akRLdP47y
	 AfuLOI46roxDQB23tEYHHM1ehkguBNGlcdgj1rUtkPZLtJAYxlCiTj0nYRAm1Tq+Nz
	 PGkeXzZKl/QayptTBe1NbiXM+E6odPqrYFG+Fdzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A1C4F8016F;
	Mon, 25 Nov 2019 15:37:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3397F8016F; Mon, 25 Nov 2019 15:37:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79B2FF800DF
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 15:37:01 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 846C9A003F;
 Mon, 25 Nov 2019 15:37:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 846C9A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574692621; bh=ElwY3TPZECbB7kHVHAFMZh1oI7Vs2YBzMYxdSE0vLQ0=;
 h=From:To:Cc:Subject:Date:From;
 b=UoQvYhNdLsm5cU46rjP3CdMCgs8EhtHnHphKOAwBV8vvmXB3OuwYCCQgqipaCVy5Q
 meR3HkGNsO/Fnoo9aStFAdLDMtSr66XddKPOxp2/7BcqASkXrtofpDcbg4vti3Vjn2
 LVQZlcC3BOYrtVdRtfnhs4kbGboDdvHU9V7sxkhY=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 25 Nov 2019 15:36:56 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Date: Mon, 25 Nov 2019 15:36:35 +0100
Message-Id: <20191125143636.28529-1-perex@perex.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v5 1/2] ASoC: Intel - use control components to
	describe card config
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

Use the control interface (field 'components' in the info structure)
to pass the I/O configuration details. The goal is to replace
the card long name with this.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
index 9c1aa4ec9cba..0170d31e691a 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1081,6 +1081,7 @@ static char byt_rt5640_codec_name[SND_ACPI_I2C_ID_LEN];
 static char byt_rt5640_codec_aif_name[12]; /*  = "rt5640-aif[1|2]" */
 static char byt_rt5640_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
 static char byt_rt5640_long_name[40]; /* = "bytcr-rt5640-*-spk-*-mic" */
+static char byt_rt5640_components[32]; /* = "cfg-spk:* cfg-mic:*" */
 
 static int byt_rt5640_suspend(struct snd_soc_card *card)
 {
@@ -1303,6 +1304,11 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
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
