Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3727A3817D
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 01:01:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0EC1174E;
	Fri,  7 Jun 2019 01:01:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0EC1174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559862113;
	bh=QtEmIDAHO158NI3dCmzLZB95bBOKyj7T44ruZZhBf/Q=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UeUOFps+OQBLSSe0wDBiHuskC/AAffiBNJjxKtfYAqWu6y31UzAHawdYYmTTrwxFT
	 jLiNWFKCXK+U2fDtL3MSwTBwDtLkEPRGKFnuXJ1YcqfJYl6krfbpvq4Eh0KoG15fOL
	 7mIwYyyJ8uMneBZfx8B3rxBllwkTda+diVK4Qs4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B14F0F8977F;
	Thu,  6 Jun 2019 23:31:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3314F898A2; Thu,  6 Jun 2019 23:29:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2D42F89764
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2D42F89764
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="W3/Ox5Qi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=PEp/tPO7wcml9HMyuE2R1YAITDS1siC5+TfYLoa9PXs=; b=W3/Ox5Qi3hRK
 N1dNkLTyCNWBnFP/Zx1WctASPV/0yCwLiyvFbHVdd4hTVPGw4q1os+NSN/qhcnLA2YpJz42dQY02l
 qQ7VA3WemK3KJOrIue7uimiVKhLXfz6l/Hb48P+u5YzOz/JrsXQ42frW77JwUfUnGEZppPpaIxvJ9
 iXDU8=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzul-0007UY-Dr; Thu, 06 Jun 2019 21:27:15 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id E0985440046; Thu,  6 Jun 2019 22:27:14 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877e9zmktb.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212714.E0985440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:27:14 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: mediatek: mt8173-max98090: use modern
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

   ASoC: mediatek: mt8173-max98090: use modern dai_link style

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

From 1ea15792bc477e100ac2340b7db3c69c95423d23 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:08:11 +0900
Subject: [PATCH] ASoC: mediatek: mt8173-max98090: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8173/mt8173-max98090.c | 34 +++++++++++++--------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index 4d6596d5cb07..22c00600c999 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -82,41 +82,51 @@ static int mt8173_max98090_init(struct snd_soc_pcm_runtime *runtime)
 	return max98090_mic_detect(component, &mt8173_max98090_jack);
 }
 
+SND_SOC_DAILINK_DEFS(playback,
+	DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture,
+	DAILINK_COMP_ARRAY(COMP_CPU("VUL")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(hifi,
+	DAILINK_COMP_ARRAY(COMP_CPU("I2S")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "HiFi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 /* Digital audio interface glue - connects codec <---> CPU */
 static struct snd_soc_dai_link mt8173_max98090_dais[] = {
 	/* Front End DAI links */
 	{
 		.name = "MAX98090 Playback",
 		.stream_name = "MAX98090 Playback",
-		.cpu_dai_name = "DL1",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback),
 	},
 	{
 		.name = "MAX98090 Capture",
 		.stream_name = "MAX98090 Capture",
-		.cpu_dai_name = "VUL",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture),
 	},
 	/* Back End DAI links */
 	{
 		.name = "Codec",
-		.cpu_dai_name = "I2S",
 		.no_pcm = 1,
-		.codec_dai_name = "HiFi",
 		.init = mt8173_max98090_init,
 		.ops = &mt8173_max98090_ops,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBS_CFS,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(hifi),
 	},
 };
 
@@ -147,9 +157,9 @@ static int mt8173_max98090_dev_probe(struct platform_device *pdev)
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
@@ -160,9 +170,9 @@ static int mt8173_max98090_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 	for_each_card_prelinks(card, i, dai_link) {
-		if (dai_link->codec_name)
+		if (dai_link->codecs->name)
 			continue;
-		dai_link->codec_of_node = codec_node;
+		dai_link->codecs->of_node = codec_node;
 	}
 	card->dev = &pdev->dev;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
