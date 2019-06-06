Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2451538071
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:20:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD35916F7;
	Fri,  7 Jun 2019 00:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD35916F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559859634;
	bh=BiRZPo9leffPCuoPG4Y6YiLmNEgyZUyXcz/jAxVa7KU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cYX60xRwQkuaCaGrcBqqzDCb9JybjvSnGrjBvp4KtTzU/4EiVzx4hnRPE2HvLLukI
	 OeN5yEqFYhFwjJGi7OK8Ez3ZIERJH63If6iBnBYRp4OW7fSuLFjfBwNap8hWkiAnxg
	 8RQtWpnjn8HYhZZEb9fNCxJ2j3zID3oOH7nqB6Eg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF20EF898EA;
	Thu,  6 Jun 2019 23:30:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7EEDF89745; Thu,  6 Jun 2019 23:28:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0F0AF897A8
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0F0AF897A8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nG8mY91U"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=+hoUB5aXWZrm/UK7AYqqYZl+wTSbT675YMCqWFwtx5o=; b=nG8mY91UzL9Y
 PGQkYTfEYr6yg/Zb2w7aYoHH9M7acCkdGMjVPRfHEKPZJpR6Jv9vQ79aKHVC1CO2o634R/alkAGB1
 aHYHk+fO4MZlsggLZKSfof/rjQN0Rzi8uzlmIhLJTKHreFOqjF5YAVGiRFk7BewwacKzPu7npQ0Ad
 BSO1M=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuC-0007OV-ML; Thu, 06 Jun 2019 21:26:40 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 19065440046; Thu,  6 Jun 2019 22:26:40 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pnnricuf.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212640.19065440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:40 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: atmel: atmel-wm8904: use modern
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

   ASoC: atmel: atmel-wm8904: use modern dai_link style

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

From 079878be6fea4e5671e9fb9020985e4f2b45289c Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:13:55 +0900
Subject: [PATCH] ASoC: atmel: atmel-wm8904: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/atmel_wm8904.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/atmel/atmel_wm8904.c b/sound/soc/atmel/atmel_wm8904.c
index fbc10f61eb55..084788ed328c 100644
--- a/sound/soc/atmel/atmel_wm8904.c
+++ b/sound/soc/atmel/atmel_wm8904.c
@@ -57,14 +57,19 @@ static const struct snd_soc_ops atmel_asoc_wm8904_ops = {
 	.hw_params = atmel_asoc_wm8904_hw_params,
 };
 
+SND_SOC_DAILINK_DEFS(pcm,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8904-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 static struct snd_soc_dai_link atmel_asoc_wm8904_dailink = {
 	.name = "WM8904",
 	.stream_name = "WM8904 PCM",
-	.codec_dai_name = "wm8904-hifi",
 	.dai_fmt = SND_SOC_DAIFMT_I2S
 		| SND_SOC_DAIFMT_NB_NF
 		| SND_SOC_DAIFMT_CBM_CFM,
 	.ops = &atmel_asoc_wm8904_ops,
+	SND_SOC_DAILINK_REG(pcm),
 };
 
 static struct snd_soc_card atmel_asoc_wm8904_card = {
@@ -108,8 +113,8 @@ static int atmel_asoc_wm8904_dt_init(struct platform_device *pdev)
 		ret = -EINVAL;
 		return ret;
 	}
-	dailink->cpu_of_node = cpu_np;
-	dailink->platform_of_node = cpu_np;
+	dailink->cpus->of_node = cpu_np;
+	dailink->platforms->of_node = cpu_np;
 	of_node_put(cpu_np);
 
 	codec_np = of_parse_phandle(np, "atmel,audio-codec", 0);
@@ -118,7 +123,7 @@ static int atmel_asoc_wm8904_dt_init(struct platform_device *pdev)
 		ret = -EINVAL;
 		return ret;
 	}
-	dailink->codec_of_node = codec_np;
+	dailink->codecs->of_node = codec_np;
 	of_node_put(codec_np);
 
 	return 0;
@@ -137,7 +142,7 @@ static int atmel_asoc_wm8904_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	id = of_alias_get_id((struct device_node *)dailink->cpu_of_node, "ssc");
+	id = of_alias_get_id((struct device_node *)dailink->cpus->of_node, "ssc");
 	ret = atmel_ssc_set_audio(id);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "failed to set SSC %d for audio\n", id);
@@ -163,7 +168,7 @@ static int atmel_asoc_wm8904_remove(struct platform_device *pdev)
 	struct snd_soc_dai_link *dailink = &atmel_asoc_wm8904_dailink;
 	int id;
 
-	id = of_alias_get_id((struct device_node *)dailink->cpu_of_node, "ssc");
+	id = of_alias_get_id((struct device_node *)dailink->cpus->of_node, "ssc");
 
 	snd_soc_unregister_card(card);
 	atmel_ssc_put_audio(id);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
