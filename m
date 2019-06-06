Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C685C38073
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:21:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61C2716F4;
	Fri,  7 Jun 2019 00:20:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61C2716F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559859674;
	bh=5DglQFPfTNqy6acwUWKArVRuQY7cfqRnz4O/1T11AKk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=N7fINyxKkBguIgLB08csC2dflPFFcVwH0LwI+Pe5W59SjHz+FE61BFZIDx123udGz
	 BQh9h92pQFJ7aMcsztSmYqWk1yxuRgeGTUHAE2AfnjZKvgLmxjCe8qXeHJFaz1S9er
	 i/ahwgB+wEZZdtvAidx2tDpQl5dHki5oRXWrIUbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBF4DF898EC;
	Thu,  6 Jun 2019 23:30:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 471F3F89846; Thu,  6 Jun 2019 23:28:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F09DAF897A9
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F09DAF897A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="SjIYHvZp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=GlS81JwN/9FzQxcaAsDcJuiPfKaR34gDFdwIJiNBqjM=; b=SjIYHvZp9GZm
 CEEKPG9LPL/gBhihu0WX3UjC1x2Xr8QHxQwRux+V3E6dk5MCRZCbFqbR7iUpDI94/t1pvZQT4jV0V
 P+XRVqW6E8prWsRWnccPR6hOAXveImRTtElT7GxK9H4ef3fWclQXtvIhDBkbYiN2MS5lR7/zH5dXT
 FGLrI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuD-0007Oh-NA; Thu, 06 Jun 2019 21:26:41 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 36DD8440046; Thu,  6 Jun 2019 22:26:41 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sgsnicuo.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212641.36DD8440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:41 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: atmel: sam9g20_wm8731: use modern
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

   ASoC: atmel: sam9g20_wm8731: use modern dai_link style

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

From d83923c576f985e8442734d4d89f72af7661fec2 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:13:46 +0900
Subject: [PATCH] ASoC: atmel: sam9g20_wm8731: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/sam9g20_wm8731.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
index 98f93e79c654..a5b4c3905ae8 100644
--- a/sound/soc/atmel/sam9g20_wm8731.c
+++ b/sound/soc/atmel/sam9g20_wm8731.c
@@ -129,16 +129,18 @@ static int at91sam9g20ek_wm8731_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+SND_SOC_DAILINK_DEFS(pcm,
+	DAILINK_COMP_ARRAY(COMP_CPU("at91rm9200_ssc.0")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm8731.0-001b", "wm8731-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("at91rm9200_ssc.0")));
+
 static struct snd_soc_dai_link at91sam9g20ek_dai = {
 	.name = "WM8731",
 	.stream_name = "WM8731 PCM",
-	.cpu_dai_name = "at91rm9200_ssc.0",
-	.codec_dai_name = "wm8731-hifi",
 	.init = at91sam9g20ek_wm8731_init,
-	.platform_name = "at91rm9200_ssc.0",
-	.codec_name = "wm8731.0-001b",
 	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBM_CFM,
+	SND_SOC_DAILINK_REG(pcm),
 };
 
 static struct snd_soc_card snd_soc_at91sam9g20ek = {
@@ -211,24 +213,24 @@ static int at91sam9g20ek_audio_probe(struct platform_device *pdev)
 		goto err;
 
 	/* Parse codec info */
-	at91sam9g20ek_dai.codec_name = NULL;
+	at91sam9g20ek_dai.codecs->name = NULL;
 	codec_np = of_parse_phandle(np, "atmel,audio-codec", 0);
 	if (!codec_np) {
 		dev_err(&pdev->dev, "codec info missing\n");
 		return -EINVAL;
 	}
-	at91sam9g20ek_dai.codec_of_node = codec_np;
+	at91sam9g20ek_dai.codecs->of_node = codec_np;
 
 	/* Parse dai and platform info */
-	at91sam9g20ek_dai.cpu_dai_name = NULL;
-	at91sam9g20ek_dai.platform_name = NULL;
+	at91sam9g20ek_dai.cpus->dai_name = NULL;
+	at91sam9g20ek_dai.platforms->name = NULL;
 	cpu_np = of_parse_phandle(np, "atmel,ssc-controller", 0);
 	if (!cpu_np) {
 		dev_err(&pdev->dev, "dai and pcm info missing\n");
 		return -EINVAL;
 	}
-	at91sam9g20ek_dai.cpu_of_node = cpu_np;
-	at91sam9g20ek_dai.platform_of_node = cpu_np;
+	at91sam9g20ek_dai.cpus->of_node = cpu_np;
+	at91sam9g20ek_dai.platforms->of_node = cpu_np;
 
 	of_node_put(codec_np);
 	of_node_put(cpu_np);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
