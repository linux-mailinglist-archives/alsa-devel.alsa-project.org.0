Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3ED38152
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:54:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94B11176C;
	Fri,  7 Jun 2019 00:53:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94B11176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559861647;
	bh=JJJVoz5WdhCHURVbJSZOyUwQdPKRqQmIx+6j9hz9g6c=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=DHzo2OZH0gYZrrryeZ8hs66V81TkFqu7Yh6Hemj/08Hw2PoULIw0HLHhT+F/sp/jL
	 joXgih6hPNPovTNUZVnZZDIz7ge6RCCFjFOAI6uFNHBASDHbut6DM+lOLvWg9i1W3T
	 pcwWd6765Sa0U/a3SBiu0MPnGs5RFACrFefftF/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63149F89A1A;
	Thu,  6 Jun 2019 23:31:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5179DF89881; Thu,  6 Jun 2019 23:29:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4B6EF897EE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:27:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4B6EF897EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qLffRlm2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=GdbiAZwMMJ+krAJ0qKMyrfbjRvMD444N0+SNeZLtD+Q=; b=qLffRlm2HU5e
 GjE1G0Q4G+VTmJJ0geZtey1lL6r09z87a8Uwf6b9OyZY/JkdzkiDbJPiphvjOpkaElf/gVOyP1fRi
 dTfq1Tcg2EuMXT1m9w5XjFhEgehgD6B2ukGpQVC69vpC8g4lHXG2jNNqRW95Oz/DRGNeDjrOiG8ZV
 GhD8U=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzud-0007TA-Ea; Thu, 06 Jun 2019 21:27:07 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 01CB5440046; Thu,  6 Jun 2019 22:27:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87muivl66a.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212707.01CB5440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:27:06 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: samsung: tm2_wm5110: use modern
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

   ASoC: samsung: tm2_wm5110: use modern dai_link style

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

From f1d26f2b947ea6cc3265b0e3c0a265c57a43f945 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:09:44 +0900
Subject: [PATCH] ASoC: samsung: tm2_wm5110: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/tm2_wm5110.c | 42 ++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 31f4256c6c65..c091033d17ad 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -427,38 +427,56 @@ static struct snd_soc_dai_driver tm2_ext_dai[] = {
 	},
 };
 
+SND_SOC_DAILINK_DEFS(aif1,
+	DAILINK_COMP_ARRAY(COMP_CPU(SAMSUNG_I2S_DAI)),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm5110-aif1")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(voice,
+	DAILINK_COMP_ARRAY(COMP_CPU(SAMSUNG_I2S_DAI)),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm5110-aif2")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(bt,
+	DAILINK_COMP_ARRAY(COMP_CPU(SAMSUNG_I2S_DAI)),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm5110-aif3")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(hdmi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 static struct snd_soc_dai_link tm2_dai_links[] = {
 	{
 		.name		= "WM5110 AIF1",
 		.stream_name	= "HiFi Primary",
-		.cpu_dai_name   = SAMSUNG_I2S_DAI,
-		.codec_dai_name = "wm5110-aif1",
 		.ops		= &tm2_aif1_ops,
 		.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				  SND_SOC_DAIFMT_CBM_CFM,
+		SND_SOC_DAILINK_REG(aif1),
 	}, {
 		.name		= "WM5110 Voice",
 		.stream_name	= "Voice call",
-		.cpu_dai_name   = SAMSUNG_I2S_DAI,
-		.codec_dai_name = "wm5110-aif2",
 		.ops		= &tm2_aif2_ops,
 		.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				  SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(voice),
 	}, {
 		.name		= "WM5110 BT",
 		.stream_name	= "Bluetooth",
-		.cpu_dai_name   = SAMSUNG_I2S_DAI,
-		.codec_dai_name = "wm5110-aif3",
 		.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				  SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(bt),
 	}, {
 		.name		= "HDMI",
 		.stream_name	= "i2s1",
 		.ops		= &tm2_hdmi_ops,
 		.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				  SND_SOC_DAIFMT_CBS_CFS,
+		SND_SOC_DAILINK_REG(hdmi),
 	}
 };
 
@@ -557,15 +575,15 @@ static int tm2_probe(struct platform_device *pdev)
 	for_each_card_prelinks(card, i, dai_link) {
 		unsigned int dai_index = 0; /* WM5110 */
 
-		dai_link->cpu_name = NULL;
-		dai_link->platform_name = NULL;
+		dai_link->cpus->name = NULL;
+		dai_link->platforms->name = NULL;
 
 		if (num_codecs > 1 && i == card->num_links - 1)
 			dai_index = 1; /* HDMI */
 
-		dai_link->codec_of_node = codec_dai_node[dai_index];
-		dai_link->cpu_of_node = cpu_dai_node[dai_index];
-		dai_link->platform_of_node = cpu_dai_node[dai_index];
+		dai_link->codecs->of_node = codec_dai_node[dai_index];
+		dai_link->cpus->of_node = cpu_dai_node[dai_index];
+		dai_link->platforms->of_node = cpu_dai_node[dai_index];
 	}
 
 	if (num_codecs > 1) {
@@ -579,7 +597,7 @@ static int tm2_probe(struct platform_device *pdev)
 			goto dai_node_put;
 		}
 
-		ret = snd_soc_get_dai_name(&args, &card->dai_link[i].codec_dai_name);
+		ret = snd_soc_get_dai_name(&args, &card->dai_link[i].codecs->dai_name);
 		if (ret) {
 			dev_err(dev, "Unable to get codec_dai_name\n");
 			goto dai_node_put;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
