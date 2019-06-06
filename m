Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC85337FAB
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 23:35:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E497166B;
	Thu,  6 Jun 2019 23:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E497166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559856952;
	bh=DMjQKr2ifjD4msXNGPIFsTx7eetSzVuvKUqpkHrrpMI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dhkWoaxLuwR2NsuE0rZ7qc9saiO6xAtMKgbvt4gRMbGpE73I/B7s6k33MOVWKySWK
	 4wRmyb4Kg3rYZfpHegpj8liKjPYkf5Ym8LIDvO5xH+4sZN530q/cNQ5+3BxfdBFaRU
	 lEyPe6dbQOIRw0ZN5edurLbGFHAtOL7XDh4lMfrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20C6EF897A4;
	Thu,  6 Jun 2019 23:26:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D001F89771; Thu,  6 Jun 2019 23:26:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F8A4F896CE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F8A4F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="iI/D2ngW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=WVj59+JC3iEFBrxv9iii8TlWP8Fvkr148aRnrFGcAFo=; b=iI/D2ngWoor3
 7rgnCtJddEiAxXRy4SZaddPebvQUqwSKvziTz7SHYLcl2Ek/jKa/3ZlvXSacuxl85ZpGReGWmvtfb
 S0N6v/MBigkXOMeOl9m6BJ9vgyMRwJP1FkxUFE4j0HxxmFcBLyShH68ax/xc1mheZeJIImcbgiCCh
 smz+4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYztb-0007Hx-1r; Thu, 06 Jun 2019 21:26:03 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 96C5A440046; Thu,  6 Jun 2019 22:26:02 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871s07fjd9.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212602.96C5A440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:02 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: kbl_rt5663_max98927: use modern
	dai_link style" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: Intel: kbl_rt5663_max98927: use modern dai_link style

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 00c3cfb041a44f2d2f53492af9badbe7e409bed8 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:21:17 +0900
Subject: [PATCH] ASoC: Intel: kbl_rt5663_max98927: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/kbl_rt5663_max98927.c | 184 +++++++++----------
 1 file changed, 85 insertions(+), 99 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
index d71475200b08..2ddbf585af93 100644
--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
@@ -246,17 +246,6 @@ static struct snd_soc_codec_conf max98927_codec_conf[] = {
 	},
 };
 
-static struct snd_soc_dai_link_component max98927_codec_components[] = {
-	{ /* Left */
-		.name = MAXIM_DEV0_NAME,
-		.dai_name = KBL_MAXIM_CODEC_DAI,
-	},
-	{ /* Right */
-		.name = MAXIM_DEV1_NAME,
-		.dai_name = KBL_MAXIM_CODEC_DAI,
-	},
-};
-
 static int kabylake_rt5663_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
@@ -590,127 +579,163 @@ static struct snd_soc_ops skylake_refcap_ops = {
 	.startup = kabylake_refcap_startup,
 };
 
+SND_SOC_DAILINK_DEF(dummy,
+	DAILINK_COMP_ARRAY(COMP_DUMMY()));
+
+SND_SOC_DAILINK_DEF(system,
+	DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
+
+SND_SOC_DAILINK_DEF(system2,
+	DAILINK_COMP_ARRAY(COMP_CPU("System Pin2")));
+
+SND_SOC_DAILINK_DEF(echoref,
+	DAILINK_COMP_ARRAY(COMP_CPU("Echoref Pin")));
+
+SND_SOC_DAILINK_DEF(reference,
+	DAILINK_COMP_ARRAY(COMP_CPU("Reference Pin")));
+
+SND_SOC_DAILINK_DEF(dmic,
+	DAILINK_COMP_ARRAY(COMP_CPU("DMIC Pin")));
+
+SND_SOC_DAILINK_DEF(hdmi1,
+	DAILINK_COMP_ARRAY(COMP_CPU("HDMI1 Pin")));
+
+SND_SOC_DAILINK_DEF(hdmi2,
+	DAILINK_COMP_ARRAY(COMP_CPU("HDMI2 Pin")));
+
+SND_SOC_DAILINK_DEF(hdmi3,
+	DAILINK_COMP_ARRAY(COMP_CPU("HDMI3 Pin")));
+
+SND_SOC_DAILINK_DEF(ssp0_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("SSP0 Pin")));
+SND_SOC_DAILINK_DEF(ssp0_codec,
+	DAILINK_COMP_ARRAY(
+	/* Left */	COMP_CODEC(MAXIM_DEV0_NAME, KBL_MAXIM_CODEC_DAI),
+	/* Right */	COMP_CODEC(MAXIM_DEV1_NAME, KBL_MAXIM_CODEC_DAI)));
+
+SND_SOC_DAILINK_DEF(ssp1_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
+SND_SOC_DAILINK_DEF(ssp1_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5663:00",
+				      KBL_REALTEK_CODEC_DAI)));
+
+SND_SOC_DAILINK_DEF(dmic01_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
+SND_SOC_DAILINK_DEF(dmic_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
+
+SND_SOC_DAILINK_DEF(idisp1_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")));
+SND_SOC_DAILINK_DEF(idisp1_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi1")));
+
+SND_SOC_DAILINK_DEF(idisp2_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp2 Pin")));
+SND_SOC_DAILINK_DEF(idisp2_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi2")));
+
+SND_SOC_DAILINK_DEF(idisp3_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp3 Pin")));
+SND_SOC_DAILINK_DEF(idisp3_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi3")));
+
+SND_SOC_DAILINK_DEF(platform,
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("0000:00:1f.3")));
+
 /* kabylake digital audio interface glue - connects codec <--> CPU */
 static struct snd_soc_dai_link kabylake_dais[] = {
 	/* Front End DAI links */
 	[KBL_DPCM_AUDIO_PB] = {
 		.name = "Kbl Audio Port",
 		.stream_name = "Audio",
-		.cpu_dai_name = "System Pin",
-		.platform_name = "0000:00:1f.3",
 		.dynamic = 1,
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.nonatomic = 1,
 		.init = kabylake_rt5663_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_playback = 1,
 		.ops = &kabylake_rt5663_fe_ops,
+		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_CP] = {
 		.name = "Kbl Audio Capture Port",
 		.stream_name = "Audio Record",
-		.cpu_dai_name = "System Pin",
-		.platform_name = "0000:00:1f.3",
 		.dynamic = 1,
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_capture = 1,
 		.ops = &kabylake_rt5663_fe_ops,
+		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_HS_PB] = {
 		.name = "Kbl Audio Headset Playback",
 		.stream_name = "Headset Audio",
-		.cpu_dai_name = "System Pin2",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
-		.platform_name = "0000:00:1f.3",
 		.dpcm_playback = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
+		SND_SOC_DAILINK_REG(system2, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_ECHO_REF_CP] = {
 		.name = "Kbl Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
-		.cpu_dai_name = "Echoref Pin",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
-		.platform_name = "0000:00:1f.3",
 		.init = NULL,
 		.capture_only = 1,
 		.nonatomic = 1,
+		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_REF_CP] = {
 		.name = "Kbl Audio Reference cap",
 		.stream_name = "Wake on Voice",
-		.cpu_dai_name = "Reference Pin",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
-		.platform_name = "0000:00:1f.3",
 		.init = NULL,
 		.dpcm_capture = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
+		SND_SOC_DAILINK_REG(reference, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_DMIC_CP] = {
 		.name = "Kbl Audio DMIC cap",
 		.stream_name = "dmiccap",
-		.cpu_dai_name = "DMIC Pin",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
-		.platform_name = "0000:00:1f.3",
 		.init = NULL,
 		.dpcm_capture = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &kabylake_dmic_ops,
+		SND_SOC_DAILINK_REG(dmic, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.cpu_dai_name = "HDMI1 Pin",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
-		.platform_name = "0000:00:1f.3",
 		.dpcm_playback = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.nonatomic = 1,
 		.dynamic = 1,
+		SND_SOC_DAILINK_REG(hdmi1, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.cpu_dai_name = "HDMI2 Pin",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
-		.platform_name = "0000:00:1f.3",
 		.dpcm_playback = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.nonatomic = 1,
 		.dynamic = 1,
+		SND_SOC_DAILINK_REG(hdmi2, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_HDMI3_PB] = {
 		.name = "Kbl HDMI Port3",
 		.stream_name = "Hdmi3",
-		.cpu_dai_name = "HDMI3 Pin",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
-		.platform_name = "0000:00:1f.3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_playback = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
+		SND_SOC_DAILINK_REG(hdmi3, dummy, platform),
 	},
 
 	/* Back End DAI links */
@@ -718,11 +743,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		/* SSP0 - Codec */
 		.name = "SSP0-Codec",
 		.id = 0,
-		.cpu_dai_name = "SSP0 Pin",
-		.platform_name = "0000:00:1f.3",
 		.no_pcm = 1,
-		.codecs = max98927_codec_components,
-		.num_codecs = ARRAY_SIZE(max98927_codec_components),
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
@@ -730,16 +751,13 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.dpcm_playback = 1,
 		.ops = &kabylake_ssp0_ops,
+		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
 	{
 		/* SSP1 - Codec */
 		.name = "SSP1-Codec",
 		.id = 1,
-		.cpu_dai_name = "SSP1 Pin",
-		.platform_name = "0000:00:1f.3",
 		.no_pcm = 1,
-		.codec_name = "i2c-10EC5663:00",
-		.codec_dai_name = KBL_REALTEK_CODEC_DAI,
 		.init = kabylake_rt5663_max98927_codec_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
@@ -748,51 +766,40 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.ops = &kabylake_rt5663_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
 		.name = "dmic01",
 		.id = 2,
-		.cpu_dai_name = "DMIC01 Pin",
-		.codec_name = "dmic-codec",
-		.codec_dai_name = "dmic-hifi",
-		.platform_name = "0000:00:1f.3",
 		.be_hw_params_fixup = kabylake_dmic_fixup,
 		.ignore_suspend = 1,
 		.dpcm_capture = 1,
 		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(dmic01_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.cpu_dai_name = "iDisp1 Pin",
-		.codec_name = "ehdaudio0D2",
-		.codec_dai_name = "intel-hdmi-hifi1",
-		.platform_name = "0000:00:1f.3",
 		.dpcm_playback = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
 	{
 		.name = "iDisp2",
 		.id = 4,
-		.cpu_dai_name = "iDisp2 Pin",
-		.codec_name = "ehdaudio0D2",
-		.codec_dai_name = "intel-hdmi-hifi2",
-		.platform_name = "0000:00:1f.3",
 		.init = kabylake_hdmi2_init,
 		.dpcm_playback = 1,
 		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
 	{
 		.name = "iDisp3",
 		.id = 5,
-		.cpu_dai_name = "iDisp3 Pin",
-		.codec_name = "ehdaudio0D2",
-		.codec_dai_name = "intel-hdmi-hifi3",
-		.platform_name = "0000:00:1f.3",
 		.init = kabylake_hdmi3_init,
 		.dpcm_playback = 1,
 		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
 };
 
@@ -801,58 +808,46 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 	[KBL_DPCM_AUDIO_5663_PB] = {
 		.name = "Kbl Audio Port",
 		.stream_name = "Audio",
-		.cpu_dai_name = "System Pin",
-		.platform_name = "0000:00:1f.3",
 		.dynamic = 1,
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_playback = 1,
 		.ops = &kabylake_rt5663_fe_ops,
+		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_5663_CP] = {
 		.name = "Kbl Audio Capture Port",
 		.stream_name = "Audio Record",
-		.cpu_dai_name = "System Pin",
-		.platform_name = "0000:00:1f.3",
 		.dynamic = 1,
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_capture = 1,
 		.ops = &kabylake_rt5663_fe_ops,
+		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_5663_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.cpu_dai_name = "HDMI1 Pin",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
-		.platform_name = "0000:00:1f.3",
 		.dpcm_playback = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.nonatomic = 1,
 		.dynamic = 1,
+		SND_SOC_DAILINK_REG(hdmi1, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_5663_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.cpu_dai_name = "HDMI2 Pin",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
-		.platform_name = "0000:00:1f.3",
 		.dpcm_playback = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.nonatomic = 1,
 		.dynamic = 1,
+		SND_SOC_DAILINK_REG(hdmi2, dummy, platform),
 	},
 
 	/* Back End DAI links */
@@ -860,11 +855,7 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 		/* SSP1 - Codec */
 		.name = "SSP1-Codec",
 		.id = 0,
-		.cpu_dai_name = "SSP1 Pin",
-		.platform_name = "0000:00:1f.3",
 		.no_pcm = 1,
-		.codec_name = "i2c-10EC5663:00",
-		.codec_dai_name = KBL_REALTEK_CODEC_DAI,
 		.init = kabylake_rt5663_codec_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
@@ -873,28 +864,23 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 		.ops = &kabylake_rt5663_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 1,
-		.cpu_dai_name = "iDisp1 Pin",
-		.codec_name = "ehdaudio0D2",
-		.codec_dai_name = "intel-hdmi-hifi1",
-		.platform_name = "0000:00:1f.3",
 		.dpcm_playback = 1,
 		.init = kabylake_5663_hdmi1_init,
 		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
 	{
 		.name = "iDisp2",
 		.id = 2,
-		.cpu_dai_name = "iDisp2 Pin",
-		.codec_name = "ehdaudio0D2",
-		.codec_dai_name = "intel-hdmi-hifi2",
-		.platform_name = "0000:00:1f.3",
 		.init = kabylake_5663_hdmi2_init,
 		.dpcm_playback = 1,
 		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
