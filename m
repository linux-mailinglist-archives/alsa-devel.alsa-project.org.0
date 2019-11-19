Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C27102B05
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 18:52:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27757169F;
	Tue, 19 Nov 2019 18:51:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27757169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574185958;
	bh=dO7HEsnsM9gqE8K8JPT8Gx5iEUTJKPQ7uVnux+fKbWc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NZwlMn7+719WaGgwTz8uItBeety+YNk79DIgJQd5SsqzqkdaVn1EVPJZqdQ1nySzE
	 SCUEoz+Uhl6a5O4sPAiRiUiDzHyOZ6A/Rsrk61bCl9eQV6V+ajVHW0zu7rG2grakTQ
	 CSG745xe5mDBYJw/OlGOM5mDYZIkHniZnNvI8a/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 651FFF8014A;
	Tue, 19 Nov 2019 18:50:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18431F80148; Tue, 19 Nov 2019 18:50:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6284F80145
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 18:50:06 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 61117A0040;
 Tue, 19 Nov 2019 18:50:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 61117A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574185806; bh=JLkjXMMGIpc1gSCjiqRWZt9V/29IWw43B4MPlpJUNj0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zlz3Mhzrx/rqmYfmOOvcCeMdBqWqichil2x3YraR6w1XIhOLUeC4G5XQWOGz3juOg
 3N5TjBVSbPAh3xLKQzrtc9VZnRPgW0O990PpxA1u+hUn5Ycv8B47uw8ATihADRRzfV
 /cOR3M/eY1co/xEiOmkDgDNdwDOh3vGZdrdUvB+E=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 19 Nov 2019 18:50:01 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Date: Tue, 19 Nov 2019 18:49:33 +0100
Message-Id: <20191119174933.25526-2-perex@perex.cz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191119174933.25526-1-perex@perex.cz>
References: <20191119174933.25526-1-perex@perex.cz>
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/2] ASoC: Intel - use control components to
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
to pass the I/O configuration details. The long card name might
be used in GUI. This information should be hidden.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/Kconfig                |  9 +++++++++
 sound/soc/intel/boards/bytcht_es8316.c | 16 ++++++++++++----
 sound/soc/intel/boards/bytcr_rt5640.c  | 14 +++++++++++---
 sound/soc/intel/boards/bytcr_rt5651.c  | 26 ++++++++++++++++----------
 4 files changed, 48 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index c8de0bb5bed9..3421957adedb 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -47,6 +47,15 @@ config SND_SOC_INTEL_SST_FIRMWARE
 	# Haswell/Broadwell/Baytrail legacy and will be set
 	# when these platforms are enabled
 
+config SND_SOC_INTEL_USE_CTL_COMPONENTS
+	bool "Use CTL components for I/O configuration"
+	help
+	  Some drivers might pass the I/O configuration through the
+	  soundcard's driver name in the control user space API.
+	  The new scheme is to put this information to the components
+	  field in the ALSA's card info structure. Say Y, if you
+	  have ALSA user space version 1.2.2+.
+
 config SND_SOC_INTEL_HASWELL
 	tristate "Haswell/Broadwell Platforms"
 	depends on SND_DMA_SGBUF
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 46612331f5ea..a4d098ef0f57 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -360,7 +360,7 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 
 /* SoC card */
 static char codec_name[SND_ACPI_I2C_ID_LEN];
-static char long_name[50]; /* = "bytcht-es8316-*-spk-*-mic" */
+static char config_string[50]; /* = long name or components */
 
 static int byt_cht_es8316_suspend(struct snd_soc_card *card)
 {
@@ -572,11 +572,19 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* register the soc card */
-	snprintf(long_name, sizeof(long_name), "bytcht-es8316-%s-spk-%s-mic",
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_USE_CTL_COMPONENTS)
+	snprintf(config_string, sizeof(config_string), "cfg-spk:%s cfg-mic:%s",
+		 (quirk & BYT_CHT_ES8316_MONO_SPEAKER) ? "1" : "2",
+		 mic_name[BYT_CHT_ES8316_MAP(quirk)]);
+	byt_cht_es8316_card.components = config_string;
+#else
+	snprintf(config_string, sizeof(config_string), "bytcht-es8316-%s-spk-%s-mic",
 		 (quirk & BYT_CHT_ES8316_MONO_SPEAKER) ? "mono" : "stereo",
 		 mic_name[BYT_CHT_ES8316_MAP(quirk)]);
-	byt_cht_es8316_card.long_name = long_name;
+	byt_cht_es8316_card.long_name = config_string;
+#endif
+
+	/* register the soc card */
 	snd_soc_card_set_drvdata(&byt_cht_es8316_card, priv);
 
 	ret = devm_snd_soc_register_card(dev, &byt_cht_es8316_card);
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 9c1aa4ec9cba..22be0c294e4c 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1080,7 +1080,7 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 static char byt_rt5640_codec_name[SND_ACPI_I2C_ID_LEN];
 static char byt_rt5640_codec_aif_name[12]; /*  = "rt5640-aif[1|2]" */
 static char byt_rt5640_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
-static char byt_rt5640_long_name[40]; /* = "bytcr-rt5640-*-spk-*-mic" */
+static char byt_rt5640_config[40]; /* = long name or components */
 
 static int byt_rt5640_suspend(struct snd_soc_card *card)
 {
@@ -1303,12 +1303,20 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		}
 	}
 
-	snprintf(byt_rt5640_long_name, sizeof(byt_rt5640_long_name),
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_USE_CTL_COMPONENTS)
+	snprintf(byt_rt5640_config, sizeof(byt_rt5640_config),
+		 "cfg-spk:%s cfg-mic:%s",
+		 (byt_rt5640_quirk & BYT_RT5640_MONO_SPEAKER) ? "1" : "2",
+		 map_name[BYT_RT5640_MAP(byt_rt5640_quirk)]);
+	byt_rt5640_card.components = byt_rt5640_config;
+#else
+	snprintf(byt_rt5640_config, sizeof(byt_rt5640_config),
 		 "bytcr-rt5640-%s-spk-%s-mic",
 		 (byt_rt5640_quirk & BYT_RT5640_MONO_SPEAKER) ?
 			"mono" : "stereo",
 		 map_name[BYT_RT5640_MAP(byt_rt5640_quirk)]);
-	byt_rt5640_card.long_name = byt_rt5640_long_name;
+	byt_rt5640_card.long_name = byt_rt5640_config;
+#endif
 
 	/* override plaform name, if required */
 	platform_name = mach->mach_params.platform;
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 4606f6f582d6..485f91b059fb 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -797,7 +797,7 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 static char byt_rt5651_codec_name[SND_ACPI_I2C_ID_LEN];
 static char byt_rt5651_codec_aif_name[12]; /*  = "rt5651-aif[1|2]" */
 static char byt_rt5651_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
-static char byt_rt5651_long_name[50]; /* = "bytcr-rt5651-*-spk-*-mic[-swapped-hp]" */
+static char byt_rt5651_config[50]; /* = long name or components */
 
 static int byt_rt5651_suspend(struct snd_soc_card *card)
 {
@@ -876,7 +876,6 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	const char *platform_name;
 	struct acpi_device *adev;
 	struct device *codec_dev;
-	const char *hp_swapped;
 	bool is_bytcr = false;
 	int ret_val = 0;
 	int dai_index = 0;
@@ -1080,17 +1079,24 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (byt_rt5651_quirk & BYT_RT5651_HP_LR_SWAPPED)
-		hp_swapped = "-hp-swapped";
-	else
-		hp_swapped = "";
-
-	snprintf(byt_rt5651_long_name, sizeof(byt_rt5651_long_name),
+#if IS_ENABLED(CONFIG_SND_SOC_INTEL_USE_CTL_COMPONENTS)
+	snprintf(byt_rt5651_config, sizeof(byt_rt5651_config),
+		 "cfg-spk:%s cfg-mic:%s%s",
+		 (byt_rt5651_quirk & BYT_RT5651_MONO_SPEAKER) ? "1" : "2",
+		 mic_name[BYT_RT5651_MAP(byt_rt5651_quirk)],
+		 (byt_rt5651_quirk & BYT_RT5651_HP_LR_SWAPPED) ?
+			" cfg-hp:lrswap" : "");
+	byt_rt5651_card.components = byt_rt5651_config;
+#else
+	snprintf(byt_rt5651_config, sizeof(byt_rt5651_config),
 		 "bytcr-rt5651-%s-spk-%s-mic%s",
 		 (byt_rt5651_quirk & BYT_RT5651_MONO_SPEAKER) ?
 			"mono" : "stereo",
-		 mic_name[BYT_RT5651_MAP(byt_rt5651_quirk)], hp_swapped);
-	byt_rt5651_card.long_name = byt_rt5651_long_name;
+		 mic_name[BYT_RT5651_MAP(byt_rt5651_quirk)],
+		 (byt_rt5651_quirk & BYT_RT5651_HP_LR_SWAPPED) ?
+			"-hp-swapped" : "");
+	byt_rt5651_card.long_name = byt_rt5651_config;
+#endif
 
 	/* override plaform name, if required */
 	platform_name = mach->mach_params.platform;
-- 
2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
