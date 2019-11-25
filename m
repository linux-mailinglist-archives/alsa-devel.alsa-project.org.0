Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 484FD10902C
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2019 15:39:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBA3D17E5;
	Mon, 25 Nov 2019 15:38:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBA3D17E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574692777;
	bh=sp23GCNpsHB6pCCO1kch7wVmWS0DVkDzMe13Vr+1vVU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y5RkkgHvviJ5UJPFXzrD7p9IeFgR7I4tRr/cjU2yWyysUjogYMK9MUqfvMV6T4dXv
	 PjQI6QN74IAcASO/PN2oL1soBsgUJYyk3BFN/7QfJ5dFjrbtrY4KO6ZTb4otdIBlR4
	 oozpN3ePic9AzDCHqGq7ElV2UqWsGQRr+wndY/vY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B0EBF801F9;
	Mon, 25 Nov 2019 15:37:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 442ABF801EB; Mon, 25 Nov 2019 15:37:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF110F801DA
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 15:37:07 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B1666A0040;
 Mon, 25 Nov 2019 15:37:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B1666A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574692626; bh=lUTA9rWczEppk62CImbDv9KOfC5n4FfT+gaAC3nA8Lg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1AW+X6BpDaXKm5wEpzj3lTWVab/3qjCRVj54rfnTDR5F3LHXe41/HxH4F+x2kXo8l
 6m+2pDTRKMu8iESSnQPWUDoTCz6BRnnUk5xUmNzuKOkeZYNzmIC4L9lPiDY4a8n3Hf
 y9S6PvhUusm2YxK6jFziftzODSRnapaEyHI+YCuM=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 25 Nov 2019 15:37:01 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Date: Mon, 25 Nov 2019 15:36:36 +0100
Message-Id: <20191125143636.28529-2-perex@perex.cz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191125143636.28529-1-perex@perex.cz>
References: <20191125143636.28529-1-perex@perex.cz>
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v5 2/2] ASoC: Intel - do not describe I/O
	configuration in the long card name
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

The long card name might be used in GUI. This information should be hidden.

Add CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES configuration option.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/Kconfig         | 13 +++++++++++++
 sound/soc/intel/boards/bytcht_es8316.c |  4 ++++
 sound/soc/intel/boards/bytcr_rt5640.c  |  4 ++++
 sound/soc/intel/boards/bytcr_rt5651.c  |  4 ++++
 4 files changed, 25 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 2702aefee775..16c77718700f 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -13,6 +13,19 @@ menuconfig SND_SOC_INTEL_MACH
 
 if SND_SOC_INTEL_MACH
 
+config SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES
+	bool "Use more user friendly long card names"
+	help
+	  Some drivers report the I/O configuration to userspace through the
+	  soundcard's long card name in the control user space AP. An unfortunate
+	  side effect is that this long name may also be used by the GUI,
+	  confusing users with information they don't need.
+	  This option prevents the long name from being modified, and the I/O
+	  configuration will be provided through a different component interface.
+	  Select Y if userspace like UCM (Use Case Manager) uses the component
+	  interface.
+	  If unsure select N.
+
 if SND_SOC_INTEL_HASWELL
 
 config SND_SOC_INTEL_HASWELL_MACH
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index efa33f30dcac..12a1c5255484 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -360,7 +360,9 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 
 /* SoC card */
 static char codec_name[SND_ACPI_I2C_ID_LEN];
+#if !IS_ENABLED(CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES)
 static char long_name[50]; /* = "bytcht-es8316-*-spk-*-mic" */
+#endif
 static char components_string[32]; /* = "cfg-spk:* cfg-mic:* */
 
 static int byt_cht_es8316_suspend(struct snd_soc_card *card)
@@ -578,10 +580,12 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 		 (quirk & BYT_CHT_ES8316_MONO_SPEAKER) ? "1" : "2",
 		 mic_name[BYT_CHT_ES8316_MAP(quirk)]);
 	byt_cht_es8316_card.components = components_string;
+#if !IS_ENABLED(CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES)
 	snprintf(long_name, sizeof(long_name), "bytcht-es8316-%s-spk-%s-mic",
 		 (quirk & BYT_CHT_ES8316_MONO_SPEAKER) ? "mono" : "stereo",
 		 mic_name[BYT_CHT_ES8316_MAP(quirk)]);
 	byt_cht_es8316_card.long_name = long_name;
+#endif
 
 	/* register the soc card */
 	snd_soc_card_set_drvdata(&byt_cht_es8316_card, priv);
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 0170d31e691a..fd4088db2fd4 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1080,7 +1080,9 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 static char byt_rt5640_codec_name[SND_ACPI_I2C_ID_LEN];
 static char byt_rt5640_codec_aif_name[12]; /*  = "rt5640-aif[1|2]" */
 static char byt_rt5640_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
+#if !IS_ENABLED(CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES)
 static char byt_rt5640_long_name[40]; /* = "bytcr-rt5640-*-spk-*-mic" */
+#endif
 static char byt_rt5640_components[32]; /* = "cfg-spk:* cfg-mic:*" */
 
 static int byt_rt5640_suspend(struct snd_soc_card *card)
@@ -1309,12 +1311,14 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		 (byt_rt5640_quirk & BYT_RT5640_MONO_SPEAKER) ? "1" : "2",
 		 map_name[BYT_RT5640_MAP(byt_rt5640_quirk)]);
 	byt_rt5640_card.components = byt_rt5640_components;
+#if !IS_ENABLED(CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES)
 	snprintf(byt_rt5640_long_name, sizeof(byt_rt5640_long_name),
 		 "bytcr-rt5640-%s-spk-%s-mic",
 		 (byt_rt5640_quirk & BYT_RT5640_MONO_SPEAKER) ?
 			"mono" : "stereo",
 		 map_name[BYT_RT5640_MAP(byt_rt5640_quirk)]);
 	byt_rt5640_card.long_name = byt_rt5640_long_name;
+#endif
 
 	/* override plaform name, if required */
 	platform_name = mach->mach_params.platform;
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 80a5674ddb1b..c0d322a859f7 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -797,7 +797,9 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 static char byt_rt5651_codec_name[SND_ACPI_I2C_ID_LEN];
 static char byt_rt5651_codec_aif_name[12]; /*  = "rt5651-aif[1|2]" */
 static char byt_rt5651_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
+#if !IS_ENABLED(CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES)
 static char byt_rt5651_long_name[50]; /* = "bytcr-rt5651-*-spk-*-mic[-swapped-hp]" */
+#endif
 static char byt_rt5651_components[50]; /* = "cfg-spk:* cfg-mic:*" */
 
 static int byt_rt5651_suspend(struct snd_soc_card *card)
@@ -1087,6 +1089,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 		 (byt_rt5651_quirk & BYT_RT5651_HP_LR_SWAPPED) ?
 			" cfg-hp:lrswap" : "");
 	byt_rt5651_card.components = byt_rt5651_components;
+#if !IS_ENABLED(CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES)
 	snprintf(byt_rt5651_long_name, sizeof(byt_rt5651_long_name),
 		 "bytcr-rt5651-%s-spk-%s-mic%s",
 		 (byt_rt5651_quirk & BYT_RT5651_MONO_SPEAKER) ?
@@ -1095,6 +1098,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 		 (byt_rt5651_quirk & BYT_RT5651_HP_LR_SWAPPED) ?
 			"-hp-swapped" : "");
 	byt_rt5651_card.long_name = byt_rt5651_long_name;
+#endif
 
 	/* override plaform name, if required */
 	platform_name = mach->mach_params.platform;
-- 
2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
