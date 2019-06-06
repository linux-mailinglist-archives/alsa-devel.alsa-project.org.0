Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDCB38095
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:27:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A87F61703;
	Fri,  7 Jun 2019 00:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A87F61703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559860029;
	bh=HguUfW5c+wYmHCxKgWKUAIDW13fF0tA2lhpHtbJNMEs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SHT84CqHT3kDxK/0G/ke4uEtlyG1GY2cEU+wsxHfinptX6pNBt+TpxYXL61TpuOSm
	 e1QKOP5nLLxE53Z5If9SAF3JnRZnfRkQik7UkfEGycqDUClREfnRlFxxJVDaYAlFzG
	 O59s/tFuos3UFt9Vg1CJPEY/rb3CRXMAiC9TLUeM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4EACF89932;
	Thu,  6 Jun 2019 23:30:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB42BF8984A; Thu,  6 Jun 2019 23:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88DAFF897B5
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88DAFF897B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="t0w+Wdjx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=SAqvEbu7oCut2HWAuJrt6nnamKCJwLnlgJjgw1/iKvQ=; b=t0w+WdjxnKEB
 XBS5nMntIdcGxwgpW4ARTlAfF1ThTlkiICoMwHILFUTNcO5RPrcVfmSKmrqeE1AH7fs8EgMrBTX/Q
 q2rNknFg/6r5fQY5QvherFRDS8IKfZrVLzZv8LQ7awyCUlUHjVTGEP/pcVUZJyayShr5dShzAFL5/
 aTqwY=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuI-0007PW-5q; Thu, 06 Jun 2019 21:26:46 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id A14E0440046; Thu,  6 Jun 2019 22:26:45 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874l53jrg3.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212645.A14E0440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:45 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: ti: omap-twl4030: use modern dai_link
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

   ASoC: ti: omap-twl4030: use modern dai_link style

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

From d6db366a411c7e3ecc13096c58a290593be7a804 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:13:11 +0900
Subject: [PATCH] ASoC: ti: omap-twl4030: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/omap-twl4030.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/sound/soc/ti/omap-twl4030.c b/sound/soc/ti/omap-twl4030.c
index cccc316743fa..ddd24b2809b8 100644
--- a/sound/soc/ti/omap-twl4030.c
+++ b/sound/soc/ti/omap-twl4030.c
@@ -209,26 +209,30 @@ static int omap_twl4030_init(struct snd_soc_pcm_runtime *rtd)
 }
 
 /* Digital audio interface glue - connects codec <--> CPU */
+SND_SOC_DAILINK_DEFS(hifi,
+	DAILINK_COMP_ARRAY(COMP_CPU("omap-mcbsp.2")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("twl4030-codec", "twl4030-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("omap-mcbsp.2")));
+
+SND_SOC_DAILINK_DEFS(voice,
+	DAILINK_COMP_ARRAY(COMP_CPU("omap-mcbsp.3")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("twl4030-codec", "twl4030-voice")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("omap-mcbsp.3")));
+
 static struct snd_soc_dai_link omap_twl4030_dai_links[] = {
 	{
 		.name = "TWL4030 HiFi",
 		.stream_name = "TWL4030 HiFi",
-		.cpu_dai_name = "omap-mcbsp.2",
-		.codec_dai_name = "twl4030-hifi",
-		.platform_name = "omap-mcbsp.2",
-		.codec_name = "twl4030-codec",
 		.init = omap_twl4030_init,
 		.ops = &omap_twl4030_ops,
+		SND_SOC_DAILINK_REG(hifi),
 	},
 	{
 		.name = "TWL4030 Voice",
 		.stream_name = "TWL4030 Voice",
-		.cpu_dai_name = "omap-mcbsp.3",
-		.codec_dai_name = "twl4030-voice",
-		.platform_name = "omap-mcbsp.3",
-		.codec_name = "twl4030-codec",
 		.dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_IB_NF |
 			   SND_SOC_DAIFMT_CBM_CFM,
+		SND_SOC_DAILINK_REG(voice),
 	},
 };
 
@@ -272,21 +276,21 @@ static int omap_twl4030_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "McBSP node is not provided\n");
 			return -EINVAL;
 		}
-		omap_twl4030_dai_links[0].cpu_dai_name  = NULL;
-		omap_twl4030_dai_links[0].cpu_of_node = dai_node;
+		omap_twl4030_dai_links[0].cpus->dai_name  = NULL;
+		omap_twl4030_dai_links[0].cpus->of_node = dai_node;
 
-		omap_twl4030_dai_links[0].platform_name  = NULL;
-		omap_twl4030_dai_links[0].platform_of_node = dai_node;
+		omap_twl4030_dai_links[0].platforms->name  = NULL;
+		omap_twl4030_dai_links[0].platforms->of_node = dai_node;
 
 		dai_node = of_parse_phandle(node, "ti,mcbsp-voice", 0);
 		if (!dai_node) {
 			card->num_links = 1;
 		} else {
-			omap_twl4030_dai_links[1].cpu_dai_name  = NULL;
-			omap_twl4030_dai_links[1].cpu_of_node = dai_node;
+			omap_twl4030_dai_links[1].cpus->dai_name  = NULL;
+			omap_twl4030_dai_links[1].cpus->of_node = dai_node;
 
-			omap_twl4030_dai_links[1].platform_name  = NULL;
-			omap_twl4030_dai_links[1].platform_of_node = dai_node;
+			omap_twl4030_dai_links[1].platforms->name  = NULL;
+			omap_twl4030_dai_links[1].platforms->of_node = dai_node;
 		}
 
 		priv->jack_detect = of_get_named_gpio(node,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
