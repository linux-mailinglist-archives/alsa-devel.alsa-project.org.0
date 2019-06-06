Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 508F13804F
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:09:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3C1D166D;
	Fri,  7 Jun 2019 00:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3C1D166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559858970;
	bh=lAvlKt9MvclZ2dowYsOuf7G6qZxrm81kqNH0UnS/m2w=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=makMeLoOAzrh8jZVBavQeEV7QGNGFFzIoA6ftA9SS7FIwvPTVVq+FQIcejaaq5XDg
	 vdIFKiQ7CLR+CJ/E2Sr4aGR3Avu4khJVUPerBLUBrnoJd4t0w+Ir7T/i/NyvcVJgpr
	 1H6E7/ZxO/LlZzbVL4kjA7+2ZxXL3fILdKg0+Mxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68AF7F898AD;
	Thu,  6 Jun 2019 23:29:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30162F89795; Thu,  6 Jun 2019 23:27:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D820FF89790
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D820FF89790
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="iopMqP7y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=XWLslEM1Kx6EYf/n6+MmLbMGFb1D90uPkYZKWBSQfz8=; b=iopMqP7y+wof
 drXTh+RMml0LXqFmiyCSBQAEaykzQ8KIpLH99yr4+4y0Q2lynG3i5zlsNFtD0T+BMud5ZOAXmDuX1
 0tOlysgIO+BKYdvJHSTw0uDzuvbM15TEiMW4IbxuKq7NH+CB1UKMl9Up5b692VTmbU/p+ThTHK8xP
 lCugY=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzu3-0007Mx-Hs; Thu, 06 Jun 2019 21:26:31 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 0C50C440046; Thu,  6 Jun 2019 22:26:31 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8736knicr4.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212631.0C50C440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:30 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: fsl: eukrea-tlv320: use modern dai_link
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

   ASoC: fsl: eukrea-tlv320: use modern dai_link style

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

From 3219d9c734627cdf9beee3fd2d136e8fbacb5fcd Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:15:54 +0900
Subject: [PATCH] ASoC: fsl: eukrea-tlv320: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/eukrea-tlv320.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/eukrea-tlv320.c b/sound/soc/fsl/eukrea-tlv320.c
index d648268cb454..6f3b768489f6 100644
--- a/sound/soc/fsl/eukrea-tlv320.c
+++ b/sound/soc/fsl/eukrea-tlv320.c
@@ -61,13 +61,18 @@ static const struct snd_soc_ops eukrea_tlv320_snd_ops = {
 	.hw_params	= eukrea_tlv320_hw_params,
 };
 
+SND_SOC_DAILINK_DEFS(hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "tlv320aic23-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 static struct snd_soc_dai_link eukrea_tlv320_dai = {
 	.name		= "tlv320aic23",
 	.stream_name	= "TLV320AIC23",
-	.codec_dai_name	= "tlv320aic23-hifi",
 	.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			  SND_SOC_DAIFMT_CBM_CFM,
 	.ops		= &eukrea_tlv320_snd_ops,
+	SND_SOC_DAILINK_REG(hifi),
 };
 
 static struct snd_soc_card eukrea_tlv320 = {
@@ -104,7 +109,7 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 
 		codec_np = of_parse_phandle(ssi_np, "codec-handle", 0);
 		if (codec_np)
-			eukrea_tlv320_dai.codec_of_node = codec_np;
+			eukrea_tlv320_dai.codecs->of_node = codec_np;
 		else
 			dev_err(&pdev->dev, "codec-handle node missing or invalid.\n");
 
@@ -128,12 +133,12 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 		int_port--;
 		ext_port--;
 
-		eukrea_tlv320_dai.cpu_of_node = ssi_np;
-		eukrea_tlv320_dai.platform_of_node = ssi_np;
+		eukrea_tlv320_dai.cpus->of_node = ssi_np;
+		eukrea_tlv320_dai.platforms->of_node = ssi_np;
 	} else {
-		eukrea_tlv320_dai.cpu_dai_name = "imx-ssi.0";
-		eukrea_tlv320_dai.platform_name = "imx-ssi.0";
-		eukrea_tlv320_dai.codec_name = "tlv320aic23-codec.0-001a";
+		eukrea_tlv320_dai.cpus->dai_name = "imx-ssi.0";
+		eukrea_tlv320_dai.platforms->name = "imx-ssi.0";
+		eukrea_tlv320_dai.codecs->name = "tlv320aic23-codec.0-001a";
 		eukrea_tlv320.name = "cpuimx-audio";
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
