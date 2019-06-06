Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D0538050
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:10:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3DEA16AD;
	Fri,  7 Jun 2019 00:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3DEA16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559859015;
	bh=cLWHrmp2NA1Yov5DncYyjQLzxJY0gp9L1WndY/KncSc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sb1JFBVzfsCII0XseR4gaZNhjXYDb0xU2yjgXjSrC8fFr4dkmc6rtshqIORSiRrEt
	 g/puxwHDM+dHjeSW2ftCdWYY15AC+RsjX6scXBJ53ruFptZLORK8e1VWcpEpRjoIxL
	 ZuK8FTMhKR/Dl9R8UJtmOGUDOM9IbPIZFRj69jFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A038DF89815;
	Thu,  6 Jun 2019 23:29:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02E94F8973B; Thu,  6 Jun 2019 23:27:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DD60F89795
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DD60F89795
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jmtpEQVC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=5NjE6Lkr1zM6/tqnAx3aH9WEaKVnxPXht8PK8MxosHQ=; b=jmtpEQVCiJXy
 QJC/ukSIP8fXwiDykH2wLO9r2n4HP0FsqVIAumLyuHOFXPAjQYhWrWINLzqde6CcmWsGchfwFr+kE
 O72GGUVGC0H9WDjlR4XueDQUmEOXdKv+YhQx933tIQ2deuDLVILCINCgdtczitHo5hsWBFgyv/sF8
 +T5VQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzu5-0007NB-77; Thu, 06 Jun 2019 21:26:33 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id BC08A440049; Thu,  6 Jun 2019 22:26:32 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877e9zicsb.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212632.BC08A440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:32 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: fsl: fsl-asoc-card: use modern dai_link
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

   ASoC: fsl: fsl-asoc-card: use modern dai_link style

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

From 893f195104142c0f83e60a91ccada2653bccee2a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:15:11 +0900
Subject: [PATCH] ASoC: fsl: fsl-asoc-card: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl-asoc-card.c | 47 +++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 60f87a0d99f4..39ea9bda1394 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -200,32 +200,47 @@ static int be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+SND_SOC_DAILINK_DEFS(hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(hifi_fe,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(hifi_be,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()));
+
 static struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 	/* Default ASoC DAI Link*/
 	{
 		.name = "HiFi",
 		.stream_name = "HiFi",
 		.ops = &fsl_asoc_card_ops,
+		SND_SOC_DAILINK_REG(hifi),
 	},
 	/* DPCM Link between Front-End and Back-End (Optional) */
 	{
 		.name = "HiFi-ASRC-FE",
 		.stream_name = "HiFi-ASRC-FE",
-		.codec_name = "snd-soc-dummy",
-		.codec_dai_name = "snd-soc-dummy-dai",
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.dynamic = 1,
+		SND_SOC_DAILINK_REG(hifi_fe),
 	},
 	{
 		.name = "HiFi-ASRC-BE",
 		.stream_name = "HiFi-ASRC-BE",
-		.platform_name = "snd-soc-dummy",
 		.be_hw_params_fixup = be_hw_params_fixup,
 		.ops = &fsl_asoc_card_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(hifi_be),
 	},
 };
 
@@ -616,11 +631,11 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	}
 
 	/* Normal DAI Link */
-	priv->dai_link[0].cpu_of_node = cpu_np;
-	priv->dai_link[0].codec_dai_name = codec_dai_name;
+	priv->dai_link[0].cpus->of_node = cpu_np;
+	priv->dai_link[0].codecs->dai_name = codec_dai_name;
 
 	if (!fsl_asoc_card_is_ac97(priv))
-		priv->dai_link[0].codec_of_node = codec_np;
+		priv->dai_link[0].codecs->of_node = codec_np;
 	else {
 		u32 idx;
 
@@ -631,29 +646,29 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 			goto asrc_fail;
 		}
 
-		priv->dai_link[0].codec_name =
+		priv->dai_link[0].codecs->name =
 				devm_kasprintf(&pdev->dev, GFP_KERNEL,
 					       "ac97-codec.%u",
 					       (unsigned int)idx);
-		if (!priv->dai_link[0].codec_name) {
+		if (!priv->dai_link[0].codecs->name) {
 			ret = -ENOMEM;
 			goto asrc_fail;
 		}
 	}
 
-	priv->dai_link[0].platform_of_node = cpu_np;
+	priv->dai_link[0].platforms->of_node = cpu_np;
 	priv->dai_link[0].dai_fmt = priv->dai_fmt;
 	priv->card.num_links = 1;
 
 	if (asrc_pdev) {
 		/* DPCM DAI Links only if ASRC exsits */
-		priv->dai_link[1].cpu_of_node = asrc_np;
-		priv->dai_link[1].platform_of_node = asrc_np;
-		priv->dai_link[2].codec_dai_name = codec_dai_name;
-		priv->dai_link[2].codec_of_node = codec_np;
-		priv->dai_link[2].codec_name =
-				priv->dai_link[0].codec_name;
-		priv->dai_link[2].cpu_of_node = cpu_np;
+		priv->dai_link[1].cpus->of_node = asrc_np;
+		priv->dai_link[1].platforms->of_node = asrc_np;
+		priv->dai_link[2].codecs->dai_name = codec_dai_name;
+		priv->dai_link[2].codecs->of_node = codec_np;
+		priv->dai_link[2].codecs->name =
+				priv->dai_link[0].codecs->name;
+		priv->dai_link[2].cpus->of_node = cpu_np;
 		priv->dai_link[2].dai_fmt = priv->dai_fmt;
 		priv->card.num_links = 3;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
