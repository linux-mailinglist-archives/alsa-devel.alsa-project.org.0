Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C26EB37F9B
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 23:30:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C07F01657;
	Thu,  6 Jun 2019 23:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C07F01657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559856626;
	bh=nkCUBAbX+7aHqpxvC9pDKtc3hQvHrLM5qw/igxiFzkA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ftCSI8fXU3a18JomYZxJYEyQ891EIIiGnlE7qJc+DRW89H1+12QpcAIR304TDqVE2
	 3eyeSdy8HibKSI+/LtgfMGtQK2uTwkdqr2Xrid41L8rNd2QyHpqO/Rko0RFT/kFbIt
	 1tJ9Dd6MWDRfBgo5zULYJVAnjz0csBhHcdwXZ5/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A21E2F8975F;
	Thu,  6 Jun 2019 23:26:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACAD8F89748; Thu,  6 Jun 2019 23:26:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F367F896F7
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F367F896F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="M4/QJoJ4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=7nbKVA7+nKwYSgqDFe95Hu77Q5mbWUWfdPQ548gc3Sw=; b=M4/QJoJ4/LhM
 3OekGLyZgqbadUPY6esJOj8O9VNgzXWasl9soRSSgUauoWX5sHx35ZzFnV1pDEXoqQ2JDrmyc+45Y
 DbIs+F29wP2l5oIL3m03Remi01Mon5cGwEKRzeom0RnYMoSR1MGz2XIwhFF1RurVCksYAnq4OKXYs
 eMan0=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYztW-0007H2-CP; Thu, 06 Jun 2019 21:25:58 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id D55CE440049; Thu,  6 Jun 2019 22:25:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pnnre4ri.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212557.D55CE440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:25:57 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: Intel: skl_hda_dsp_common: use modern
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

   ASoC: Intel: skl_hda_dsp_common: use modern dai_link style

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

From a78959f407e66b2f74fb72b47b252f4ed8b1671e Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:22:04 +0900
Subject: [PATCH] ASoC: Intel: skl_hda_dsp_common: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/skl_hda_dsp_common.c  | 66 ++++++++++++--------
 sound/soc/intel/boards/skl_hda_dsp_generic.c |  4 +-
 2 files changed, 43 insertions(+), 27 deletions(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
index 82f10bf2abb2..55fd82e05e2c 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
@@ -38,77 +38,93 @@ int skl_hda_hdmi_add_pcm(struct snd_soc_card *card, int device)
 	return 0;
 }
 
+SND_SOC_DAILINK_DEFS(idisp1,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi1")));
+
+SND_SOC_DAILINK_DEFS(idisp2,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp2 Pin")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi2")));
+
+SND_SOC_DAILINK_DEFS(idisp3,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp3 Pin")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi3")));
+
+SND_SOC_DAILINK_DEF(analog_cpu,
+	DAILINK_COMP_ARRAY(COMP_CPU("Analog CPU DAI")));
+SND_SOC_DAILINK_DEF(analog_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D0", "Analog Codec DAI")));
+
+SND_SOC_DAILINK_DEF(digital_cpu,
+	DAILINK_COMP_ARRAY(COMP_CPU("Digital CPU DAI")));
+SND_SOC_DAILINK_DEF(digital_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D0", "Digital Codec DAI")));
+
+SND_SOC_DAILINK_DEF(dmic_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
+
+SND_SOC_DAILINK_DEF(dmic_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
+
+SND_SOC_DAILINK_DEF(dmic16k,
+	DAILINK_COMP_ARRAY(COMP_CPU("DMIC16k Pin")));
+
+SND_SOC_DAILINK_DEF(platform,
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("0000:00:1f.3")));
+
 /* skl_hda_digital audio interface glue - connects codec <--> CPU */
 struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS] = {
 	/* Back End DAI links */
 	{
 		.name = "iDisp1",
 		.id = 1,
-		.cpu_dai_name = "iDisp1 Pin",
-		.codec_name = "ehdaudio0D2",
-		.codec_dai_name = "intel-hdmi-hifi1",
 		.dpcm_playback = 1,
 		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp1),
 	},
 	{
 		.name = "iDisp2",
 		.id = 2,
-		.cpu_dai_name = "iDisp2 Pin",
-		.codec_name = "ehdaudio0D2",
-		.codec_dai_name = "intel-hdmi-hifi2",
 		.dpcm_playback = 1,
 		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp2),
 	},
 	{
 		.name = "iDisp3",
 		.id = 3,
-		.cpu_dai_name = "iDisp3 Pin",
-		.codec_name = "ehdaudio0D2",
-		.codec_dai_name = "intel-hdmi-hifi3",
 		.dpcm_playback = 1,
 		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp3),
 	},
 	{
 		.name = "Analog Playback and Capture",
 		.id = 4,
-		.cpu_dai_name = "Analog CPU DAI",
-		.codec_name = "ehdaudio0D0",
-		.codec_dai_name = "Analog Codec DAI",
-		.platform_name = "0000:00:1f.3",
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(analog_cpu, analog_codec, platform),
 	},
 	{
 		.name = "Digital Playback and Capture",
 		.id = 5,
-		.cpu_dai_name = "Digital CPU DAI",
-		.codec_name = "ehdaudio0D0",
-		.codec_dai_name = "Digital Codec DAI",
-		.platform_name = "0000:00:1f.3",
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(digital_cpu, digital_codec, platform),
 	},
 	{
 		.name = "dmic01",
 		.id = 6,
-		.cpu_dai_name = "DMIC01 Pin",
-		.codec_name = "dmic-codec",
-		.codec_dai_name = "dmic-hifi",
-		.platform_name = "0000:00:1f.3",
 		.dpcm_capture = 1,
 		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
 	{
 		.name = "dmic16k",
 		.id = 7,
-		.cpu_dai_name = "DMIC16k Pin",
-		.codec_name = "dmic-codec",
-		.codec_dai_name = "dmic-hifi",
-		.platform_name = "0000:00:1f.3",
 		.dpcm_capture = 1,
 		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(dmic16k, dmic_codec, platform),
 	},
 };
 
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index fc52d3a32354..9ed68eb4f058 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -69,7 +69,7 @@ skl_hda_add_dai_link(struct snd_soc_card *card, struct snd_soc_dai_link *link)
 	int ret = 0;
 
 	dev_dbg(card->dev, "%s: dai link name - %s\n", __func__, link->name);
-	link->platform_name = ctx->platform_name;
+	link->platforms->name = ctx->platform_name;
 	link->nonatomic = 1;
 
 	if (strstr(link->name, "HDMI")) {
@@ -142,7 +142,7 @@ static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params *mach_params)
 	card->num_dapm_routes = num_route;
 
 	for_each_card_prelinks(card, i, dai_link)
-		dai_link->platform_name = mach_params->platform;
+		dai_link->platforms->name = mach_params->platform;
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
