Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D640038187
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 01:05:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 697DF175A;
	Fri,  7 Jun 2019 01:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 697DF175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559862308;
	bh=plDJ86ild104R5qReD8pXzU8nboKVAjvC1CYjdbdjLM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=nG7SHLrhqS62v7SyQd9+n+lc43yjUHH+6g/eK3APhoxkWgPCrWDKFpP1VfBqAagyN
	 V16kak0J3ZBd4JLnVLlzKHQqzGydj4S/sz3dnkUsYkp6pyxY3Alg2SdZ+4bswRbxSy
	 2NE7bRLlU9AUzUEiRXwXUZqKWV6iwa2O3xy7/Lto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88DDCF89A68;
	Thu,  6 Jun 2019 23:32:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A64EF898B5; Thu,  6 Jun 2019 23:29:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63282F89810
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63282F89810
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="pR6zJ/jz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=8+ptJLYGWvldMlwr9LmT7MaXElYstvE4h7RzCaZVh54=; b=pR6zJ/jzRipR
 meHjwFDzQDyK0c2JUQyaI1YkpSnNaWktKWHBAjxfxEV/XuAeWHa8WcdMEUG0DuY7MSOllFrecN+Vo
 urx7ZBCj9hHSjxagFbZPDAo3IOvyhw6+5KKgcl3cv8OeFNcLiTgLfNzwqlxy5lzDlvWooblzEn/uA
 0w1qs=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzun-0007Uo-4X; Thu, 06 Jun 2019 21:27:17 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 9726D440049; Thu,  6 Jun 2019 22:27:16 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87blzbmktx.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212716.9726D440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:27:16 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: mediatek: mt6797-mt6351: use modern
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

   ASoC: mediatek: mt6797-mt6351: use modern dai_link style

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

From 9ded5f71114bcf935051db12f0ad1abe4ef497b1 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:07:49 +0900
Subject: [PATCH] ASoC: mediatek: mt6797-mt6351: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt6797/mt6797-mt6351.c | 115 ++++++++++++++--------
 1 file changed, 76 insertions(+), 39 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-mt6351.c b/sound/soc/mediatek/mt6797/mt6797-mt6351.c
index cc41eb531653..496f32bcfb5e 100644
--- a/sound/soc/mediatek/mt6797/mt6797-mt6351.c
+++ b/sound/soc/mediatek/mt6797/mt6797-mt6351.c
@@ -10,140 +10,177 @@
 
 #include "mt6797-afe-common.h"
 
+SND_SOC_DAILINK_DEFS(playback_1,
+	DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback_2,
+	DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(playback_3,
+	DAILINK_COMP_ARRAY(COMP_CPU("DL3")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture_1,
+	DAILINK_COMP_ARRAY(COMP_CPU("UL1")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture_2,
+	DAILINK_COMP_ARRAY(COMP_CPU("UL2")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture_3,
+	DAILINK_COMP_ARRAY(COMP_CPU("UL3")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture_mono_1,
+	DAILINK_COMP_ARRAY(COMP_CPU("UL_MONO_1")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(hostless_lpbk,
+	DAILINK_COMP_ARRAY(COMP_CPU("Hostless LPBK DAI")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(hostless_speech,
+	DAILINK_COMP_ARRAY(COMP_CPU("Hostless Speech DAI")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(primary_codec,
+	DAILINK_COMP_ARRAY(COMP_CPU("ADDA")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "mt6351-snd-codec-aif1")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(pcm1,
+	DAILINK_COMP_ARRAY(COMP_CPU("PCM 1")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(pcm2,
+	DAILINK_COMP_ARRAY(COMP_CPU("PCM 2")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 static struct snd_soc_dai_link mt6797_mt6351_dai_links[] = {
 	/* FE */
 	{
 		.name = "Playback_1",
 		.stream_name = "Playback_1",
-		.cpu_dai_name = "DL1",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback_1),
 	},
 	{
 		.name = "Playback_2",
 		.stream_name = "Playback_2",
-		.cpu_dai_name = "DL2",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback_2),
 	},
 	{
 		.name = "Playback_3",
 		.stream_name = "Playback_3",
-		.cpu_dai_name = "DL3",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback_3),
 	},
 	{
 		.name = "Capture_1",
 		.stream_name = "Capture_1",
-		.cpu_dai_name = "UL1",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture_1),
 	},
 	{
 		.name = "Capture_2",
 		.stream_name = "Capture_2",
-		.cpu_dai_name = "UL2",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture_2),
 	},
 	{
 		.name = "Capture_3",
 		.stream_name = "Capture_3",
-		.cpu_dai_name = "UL3",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture_3),
 	},
 	{
 		.name = "Capture_Mono_1",
 		.stream_name = "Capture_Mono_1",
-		.cpu_dai_name = "UL_MONO_1",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture_mono_1),
 	},
 	{
 		.name = "Hostless_LPBK",
 		.stream_name = "Hostless_LPBK",
-		.cpu_dai_name = "Hostless LPBK DAI",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(hostless_lpbk),
 	},
 	{
 		.name = "Hostless_Speech",
 		.stream_name = "Hostless_Speech",
-		.cpu_dai_name = "Hostless Speech DAI",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(hostless_speech),
 	},
 	/* BE */
 	{
 		.name = "Primary Codec",
-		.cpu_dai_name = "ADDA",
-		.codec_dai_name = "mt6351-snd-codec-aif1",
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(primary_codec),
 	},
 	{
 		.name = "PCM 1",
-		.cpu_dai_name = "PCM 1",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(pcm1),
 	},
 	{
 		.name = "PCM 2",
-		.cpu_dai_name = "PCM 2",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(pcm2),
 	},
 };
 
@@ -170,9 +207,9 @@ static int mt6797_mt6351_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 	for_each_card_prelinks(card, i, dai_link) {
-		if (dai_link->platform_name)
+		if (dai_link->platforms->name)
 			continue;
-		dai_link->platform_of_node = platform_node;
+		dai_link->platforms->of_node = platform_node;
 	}
 
 	codec_node = of_parse_phandle(pdev->dev.of_node,
@@ -183,9 +220,9 @@ static int mt6797_mt6351_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 	for_each_card_prelinks(card, i, dai_link) {
-		if (dai_link->codec_name)
+		if (dai_link->codecs->name)
 			continue;
-		dai_link->codec_of_node = codec_node;
+		dai_link->codecs->of_node = codec_node;
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
