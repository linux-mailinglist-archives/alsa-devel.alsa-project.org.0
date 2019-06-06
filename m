Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2481C3807B
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:21:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD07816CC;
	Fri,  7 Jun 2019 00:21:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD07816CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559859713;
	bh=MUBueTQbpZAPbVpFRjNVNaPT57lSwhwVpInUvrcMCSY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KnysBxaBgAdjWs6BiCpE0+N8JKZhLLZCCcTXIrEoWjWqWCIEpGQpaW0EUBlLfKBfR
	 xo5SwZRjwUcKeZsm2mt74VV7n0eh9J8UtSo2iy7q+A1lJ7pVfsnrxSfMdNc7b1uPfm
	 Dy/6PgBYFoZ6Ip2O1mvG9vlJN3Yf2E52BAciKsiI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5FDAF898F4;
	Thu,  6 Jun 2019 23:30:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 649A0F89848; Thu,  6 Jun 2019 23:28:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93BC6F897AD
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93BC6F897AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qs2Rk0Hr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=iDz0R2Wx6BjQDTKYQ8SoLfvkGzeDchoRDcevsLrTo54=; b=qs2Rk0HrbHx8
 YfH0BMv1r2OQ5w9K29Vxb1yGQt0kSvLgzE0ZrOjUwQltkyHFOCjDx29G43G1TKh6gnINo/SGsQ7iH
 syCq7sPfIJHIsDgL7naBlPAaU5heBW6o2DFBQr/RU3ppxD2G2W0XuFDLdDk5uboNG64hDZP2uoeOZ
 6116w=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuE-0007On-9l; Thu, 06 Jun 2019 21:26:42 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id BC6B4440049; Thu,  6 Jun 2019 22:26:41 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tvd3icus.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212641.BC6B4440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:41 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: atmel: sam9x5_wm8731: use modern
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

   ASoC: atmel: sam9x5_wm8731: use modern dai_link style

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

From 35617d8262c49a1d63a36ef291c5b1a8fdc86bc8 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:13:42 +0900
Subject: [PATCH] ASoC: atmel: sam9x5_wm8731: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/sam9x5_wm8731.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/sound/soc/atmel/sam9x5_wm8731.c b/sound/soc/atmel/sam9x5_wm8731.c
index e6c303ab869d..36917acc161f 100644
--- a/sound/soc/atmel/sam9x5_wm8731.c
+++ b/sound/soc/atmel/sam9x5_wm8731.c
@@ -82,6 +82,7 @@ static int sam9x5_wm8731_driver_probe(struct platform_device *pdev)
 	struct snd_soc_card *card;
 	struct snd_soc_dai_link *dai;
 	struct sam9x5_drvdata *priv;
+	struct snd_soc_dai_link_component *comp;
 	int ret;
 
 	if (!np) {
@@ -92,7 +93,8 @@ static int sam9x5_wm8731_driver_probe(struct platform_device *pdev)
 	card = devm_kzalloc(&pdev->dev, sizeof(*card), GFP_KERNEL);
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	dai = devm_kzalloc(&pdev->dev, sizeof(*dai), GFP_KERNEL);
-	if (!dai || !card || !priv) {
+	comp = devm_kzalloc(&pdev->dev, 3 * sizeof(*comp), GFP_KERNEL);
+	if (!dai || !card || !priv || !comp) {
 		ret = -ENOMEM;
 		goto out;
 	}
@@ -105,9 +107,17 @@ static int sam9x5_wm8731_driver_probe(struct platform_device *pdev)
 	card->num_links = 1;
 	card->dapm_widgets = sam9x5_dapm_widgets;
 	card->num_dapm_widgets = ARRAY_SIZE(sam9x5_dapm_widgets);
+
+	dai->cpus = &comp[0];
+	dai->num_cpus = 1;
+	dai->codecs = &comp[1];
+	dai->num_codecs = 1;
+	dai->platforms = &comp[2];
+	dai->num_platforms = 1;
+
 	dai->name = "WM8731";
 	dai->stream_name = "WM8731 PCM";
-	dai->codec_dai_name = "wm8731-hifi";
+	dai->codecs->dai_name = "wm8731-hifi";
 	dai->init = sam9x5_wm8731_init;
 	dai->dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF
 		| SND_SOC_DAIFMT_CBM_CFM;
@@ -131,7 +141,7 @@ static int sam9x5_wm8731_driver_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-	dai->codec_of_node = codec_np;
+	dai->codecs->of_node = codec_np;
 
 	cpu_np = of_parse_phandle(np, "atmel,ssc-controller", 0);
 	if (!cpu_np) {
@@ -139,8 +149,8 @@ static int sam9x5_wm8731_driver_probe(struct platform_device *pdev)
 		ret = -EINVAL;
 		goto out;
 	}
-	dai->cpu_of_node = cpu_np;
-	dai->platform_of_node = cpu_np;
+	dai->cpus->of_node = cpu_np;
+	dai->platforms->of_node = cpu_np;
 
 	priv->ssc_id = of_alias_get_id(cpu_np, "ssc");
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
