Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D010A38053
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:10:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63C95166D;
	Fri,  7 Jun 2019 00:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63C95166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559859051;
	bh=zfpA5Wl3R5Rf+7j6LUetxMI7c7/O/10fiIrLwTzBnkk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=vUmdcI40PN+GTyES74ffjvU3apybLbUa7aZwR0pDJOQy7cazy/mQOkUFKbXO769WI
	 vza6uQeYXoGePh1h9dhwUbEpMm1StbfUKw9Dl5tF39i+GUfykKQ8hS5JxFJx2b638y
	 c3GQQ5XKwuFAwwZDBTNxwuGkXvcK8wEaFaTpc/IA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 380D7F89810;
	Thu,  6 Jun 2019 23:29:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18051F89795; Thu,  6 Jun 2019 23:27:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70248F89793
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70248F89793
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="C9210zCT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=p+vj4Ajc5qMYrX/SUYuk1Tiafi6VjpNpfoT9R+IzpxY=; b=C9210zCTw465
 WAMIMYM1eOAphOSizI1LSt7s4CHe+dX+PMrZ5k6cnAs6G00hIRsCA4DKAz3UMh4hl82B3dKBTmxfj
 Yv4ug/H2aGMpacPdM1/sPtGj5DzQIXyw6xpPWGIybAQTs5auX1rI6eKdmmmmddupBMfc6r7ANe/wO
 3ldO8=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzu4-0007N3-5b; Thu, 06 Jun 2019 21:26:32 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 96E25440049; Thu,  6 Jun 2019 22:26:31 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874l53icrq.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212631.96E25440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:31 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: fsl: imx-es8328: use modern dai_link
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

   ASoC: fsl: imx-es8328: use modern dai_link style

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

From 35f6d3025fa8bd75048ccaff5e51ea5446177c24 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:15:32 +0900
Subject: [PATCH] ASoC: fsl: imx-es8328: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-es8328.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/imx-es8328.c b/sound/soc/fsl/imx-es8328.c
index c9d8739b04a9..15a27a2cd0ca 100644
--- a/sound/soc/fsl/imx-es8328.c
+++ b/sound/soc/fsl/imx-es8328.c
@@ -74,6 +74,7 @@ static int imx_es8328_probe(struct platform_device *pdev)
 	struct device_node *ssi_np = NULL, *codec_np = NULL;
 	struct platform_device *ssi_pdev;
 	struct imx_es8328_data *data;
+	struct snd_soc_dai_link_component *comp;
 	u32 int_port, ext_port;
 	int ret;
 	struct device *dev = &pdev->dev;
@@ -147,16 +148,30 @@ static int imx_es8328_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
+	comp = devm_kzalloc(dev, 3 * sizeof(*comp), GFP_KERNEL);
+	if (!comp) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+
 	data->dev = dev;
 
 	data->jack_gpio = of_get_named_gpio(pdev->dev.of_node, "jack-gpio", 0);
 
+	data->dai.cpus		= &comp[0];
+	data->dai.codecs	= &comp[1];
+	data->dai.platforms	= &comp[2];
+
+	data->dai.num_cpus	= 1;
+	data->dai.num_codecs	= 1;
+	data->dai.num_platforms	= 1;
+
 	data->dai.name = "hifi";
 	data->dai.stream_name = "hifi";
-	data->dai.codec_dai_name = "es8328-hifi-analog";
-	data->dai.codec_of_node = codec_np;
-	data->dai.cpu_of_node = ssi_np;
-	data->dai.platform_of_node = ssi_np;
+	data->dai.codecs->dai_name = "es8328-hifi-analog";
+	data->dai.codecs->of_node = codec_np;
+	data->dai.cpus->of_node = ssi_np;
+	data->dai.platforms->of_node = ssi_np;
 	data->dai.init = &imx_es8328_dai_init;
 	data->dai.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			    SND_SOC_DAIFMT_CBM_CFM;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
