Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBE437FC0
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 23:40:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02D961683;
	Thu,  6 Jun 2019 23:40:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02D961683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559857258;
	bh=jRHLA+Cbrhhioq2+c7oBwXQalceZhRAyR4WSzO6q/MU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=f7GPtPWebwkuz10TEincIPEH7vd0TrgGG/xSqo62VtkChjw2Fxxd62Hn84IxdSZyp
	 zVTgySTu+GmhVnCjcJgj7QlVizpbb6DW6PY8+I45NFTR45U1OugWTwci7aV6Cr2u7n
	 eBRzRdGeQab6Hs73seYqr7LUX+Dj1uqNw/57GlVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B422FF89804;
	Thu,  6 Jun 2019 23:27:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01307F8973F; Thu,  6 Jun 2019 23:26:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1A4DF8973F
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1A4DF8973F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BsHlgqp7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=C1iLWEWIKvpd/JDZStw42oMWAog/t71IsCatUeITnsM=; b=BsHlgqp76e3u
 V/JyykYW4Ok/LRDDaDtc0/tZtHynKPdFpJlY79O//PcXFEs6C7ZyGhCHsbdc1Ek/461f11Xlg4FmU
 +Yxa1HqvmNb1nBF+akMuInQ0CAQ6lOPtSdqDl7YswRwjX2ArzTHDL+f8dIVoBlMgfnquED7wB8m3V
 pJnoc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYztf-0007Il-M0; Thu, 06 Jun 2019 21:26:07 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 37A6E440049; Thu,  6 Jun 2019 22:26:07 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87d0jrfjeg.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212607.37A6E440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:07 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: Intel: bytcht_cx2072x: use modern
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

   ASoC: Intel: bytcht_cx2072x: use modern dai_link style

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

From 196c52e13eb5ce1c53d6c3a38227b5ca3032d496 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:20:34 +0900
Subject: [PATCH] ASoC: Intel: bytcht_cx2072x: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/bytcht_cx2072x.c | 37 +++++++++++++++----------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index 4b985b393dae..54ac2fd41925 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -150,41 +150,49 @@ static struct snd_soc_ops byt_cht_cx2072x_aif1_ops = {
 	.startup = byt_cht_cx2072x_aif1_startup,
 };
 
+SND_SOC_DAILINK_DEF(dummy,
+	DAILINK_COMP_ARRAY(COMP_DUMMY()));
+
+SND_SOC_DAILINK_DEF(media,
+	DAILINK_COMP_ARRAY(COMP_CPU("media-cpu-dai")));
+
+SND_SOC_DAILINK_DEF(deepbuffer,
+	DAILINK_COMP_ARRAY(COMP_CPU("deepbuffer-cpu-dai")));
+
+SND_SOC_DAILINK_DEF(ssp2,
+	DAILINK_COMP_ARRAY(COMP_CPU("ssp2-port")));
+
+SND_SOC_DAILINK_DEF(cx2072x,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-14F10720:00", "cx2072x-hifi")));
+
+SND_SOC_DAILINK_DEF(platform,
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("sst-mfld-platform")));
+
 static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 	[MERR_DPCM_AUDIO] = {
 		.name = "Audio Port",
 		.stream_name = "Audio",
-		.cpu_dai_name = "media-cpu-dai",
-		.codec_dai_name = "snd-soc-dummy-dai",
-		.codec_name = "snd-soc-dummy",
-		.platform_name = "sst-mfld-platform",
 		.nonatomic = true,
 		.dynamic = 1,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ops = &byt_cht_cx2072x_aif1_ops,
+		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
 	[MERR_DPCM_DEEP_BUFFER] = {
 		.name = "Deep-Buffer Audio Port",
 		.stream_name = "Deep-Buffer Audio",
-		.cpu_dai_name = "deepbuffer-cpu-dai",
-		.codec_dai_name = "snd-soc-dummy-dai",
-		.codec_name = "snd-soc-dummy",
-		.platform_name = "sst-mfld-platform",
 		.nonatomic = true,
 		.dynamic = 1,
 		.dpcm_playback = 1,
 		.ops = &byt_cht_cx2072x_aif1_ops,
+		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
 	/* back ends */
 	{
 		.name = "SSP2-Codec",
 		.id = 0,
-		.cpu_dai_name = "ssp2-port",
-		.platform_name = "sst-mfld-platform",
 		.no_pcm = 1,
-		.codec_dai_name = "cx2072x-hifi",
-		.codec_name = "i2c-14F10720:00",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 					      | SND_SOC_DAIFMT_CBS_CFS,
 		.init = byt_cht_cx2072x_init,
@@ -192,6 +200,7 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 		.nonatomic = true,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(ssp2, cx2072x, platform),
 	},
 };
 
@@ -223,7 +232,7 @@ static int snd_byt_cht_cx2072x_probe(struct platform_device *pdev)
 
 	/* fix index of codec dai */
 	for (i = 0; i < ARRAY_SIZE(byt_cht_cx2072x_dais); i++) {
-		if (!strcmp(byt_cht_cx2072x_dais[i].codec_name,
+		if (!strcmp(byt_cht_cx2072x_dais[i].codecs->name,
 			    "i2c-14F10720:00")) {
 			dai_index = i;
 			break;
@@ -236,7 +245,7 @@ static int snd_byt_cht_cx2072x_probe(struct platform_device *pdev)
 		snprintf(codec_name, sizeof(codec_name), "i2c-%s",
 			 acpi_dev_name(adev));
 		put_device(&adev->dev);
-		byt_cht_cx2072x_dais[dai_index].codec_name = codec_name;
+		byt_cht_cx2072x_dais[dai_index].codecs->name = codec_name;
 	}
 
 	/* override plaform name, if required */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
