Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BF237FD7
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 23:46:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 318F716AA;
	Thu,  6 Jun 2019 23:46:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 318F716AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559857618;
	bh=enS4b88qvLjhZiUJzkaJRpOwJyMBxaoG9IDlrFrCWI8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TGVIizQpBnRf8SJk0JeACha9Y78pThhLnMT+EY7sqTgnh/9H+CL/wq8mJE0LuSDjJ
	 cihHfDWERZCKRjKQH7qd5aWMnYS5KXbpQB479umbIW57L5XWInKlxkI1NAWm+G9g17
	 Si1tlA/DMSntk56M1asQcBxRRow9ePX6kB4cct8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11D7CF89833;
	Thu,  6 Jun 2019 23:27:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CDB7F897B9; Thu,  6 Jun 2019 23:26:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52EEEF8974B
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52EEEF8974B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="WnzsNwNz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=8tbiuBn9L0LRV7t0PSkQLafWoRv9XjMKJ8URyhkXdlo=; b=WnzsNwNzoJGL
 8t4x6nRclJDJhr4Qkk/PSZGqqAQb05+BfCmilqRZCIFvVeLP4Lij6QlhnUTvjOziGVo2Dke5dcVT9
 3XgQh/fDRKKwKJC3p2CoGyb4oXOJTjEFxHQ5HYI/VtEkEasUfO1cHjhscv/KmOZqzM94TH0yDuDZH
 jgskM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYztl-0007Jg-36; Thu, 06 Jun 2019 21:26:13 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 50D5A440046; Thu,  6 Jun 2019 22:26:12 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pnnrfjg3.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212612.50D5A440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:12 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: Intel: haswell: use modern dai_link
	style" to the asoc tree
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

   ASoC: Intel: haswell: use modern dai_link style

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

From 77b365b8e99d0ddb6a62fe3e93ebbbe14a2734ab Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:19:35 +0900
Subject: [PATCH] ASoC: Intel: haswell: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/haswell.c | 46 ++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/boards/haswell.c b/sound/soc/intel/boards/haswell.c
index 971226d42042..aace44e09fc2 100644
--- a/sound/soc/intel/boards/haswell.c
+++ b/sound/soc/intel/boards/haswell.c
@@ -105,53 +105,62 @@ static int haswell_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+SND_SOC_DAILINK_DEF(dummy,
+	DAILINK_COMP_ARRAY(COMP_DUMMY()));
+
+SND_SOC_DAILINK_DEF(system,
+	DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
+
+SND_SOC_DAILINK_DEF(offload0,
+	DAILINK_COMP_ARRAY(COMP_CPU("Offload0 Pin")));
+
+SND_SOC_DAILINK_DEF(offload1,
+	DAILINK_COMP_ARRAY(COMP_CPU("Offload1 Pin")));
+
+SND_SOC_DAILINK_DEF(loopback,
+	DAILINK_COMP_ARRAY(COMP_CPU("Loopback Pin")));
+
+SND_SOC_DAILINK_DEF(codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-INT33CA:00", "rt5640-aif1")));
+
+SND_SOC_DAILINK_DEF(platform,
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("haswell-pcm-audio")));
+
 static struct snd_soc_dai_link haswell_rt5640_dais[] = {
 	/* Front End DAI links */
 	{
 		.name = "System",
 		.stream_name = "System Playback/Capture",
-		.cpu_dai_name = "System Pin",
-		.platform_name = "haswell-pcm-audio",
 		.dynamic = 1,
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.init = haswell_rtd_init,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	{
 		.name = "Offload0",
 		.stream_name = "Offload0 Playback",
-		.cpu_dai_name = "Offload0 Pin",
-		.platform_name = "haswell-pcm-audio",
 		.dynamic = 1,
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(offload0, dummy, platform),
 	},
 	{
 		.name = "Offload1",
 		.stream_name = "Offload1 Playback",
-		.cpu_dai_name = "Offload1 Pin",
-		.platform_name = "haswell-pcm-audio",
 		.dynamic = 1,
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(offload1, dummy, platform),
 	},
 	{
 		.name = "Loopback",
 		.stream_name = "Loopback",
-		.cpu_dai_name = "Loopback Pin",
-		.platform_name = "haswell-pcm-audio",
 		.dynamic = 1,
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(loopback, dummy, platform),
 	},
 
 	/* Back End DAI links */
@@ -159,11 +168,7 @@ static struct snd_soc_dai_link haswell_rt5640_dais[] = {
 		/* SSP0 - Codec */
 		.name = "Codec",
 		.id = 0,
-		.cpu_dai_name = "snd-soc-dummy-dai",
-		.platform_name = "snd-soc-dummy",
 		.no_pcm = 1,
-		.codec_name = "i2c-INT33CA:00",
-		.codec_dai_name = "rt5640-aif1",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
 		.ignore_suspend = 1,
@@ -172,6 +177,7 @@ static struct snd_soc_dai_link haswell_rt5640_dais[] = {
 		.ops = &haswell_rt5640_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(dummy, codec, dummy),
 	},
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
