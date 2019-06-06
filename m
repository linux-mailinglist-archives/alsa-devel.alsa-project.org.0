Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E69B738046
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:07:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79EEB169F;
	Fri,  7 Jun 2019 00:06:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79EEB169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559858839;
	bh=yBf0p+U3VfyqaM8G+wDqNfyPN3Q6geKZnJg2r+tpGdU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UPCy8tHPhpLiLNqgCspVfk8WJrZaNmEV9AzuhhNnHsCqSqTPaU02XptXTnLruBYP/
	 VV3NOFEGN1lgrAK3qirk/Dc9HL6jjrjnPAEmSyMFSkLuKRRefYycHY9YpFMtO9XRo5
	 dcOsHKy5QdDm5z5dZaD3v+RezPpmcLm2j2UCVgXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECA21F89762;
	Thu,  6 Jun 2019 23:29:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35582F8982D; Thu,  6 Jun 2019 23:27:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE8CEF89786
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE8CEF89786
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="SJWuqazp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=K23jdhKHLtu01PYVMjkRtf64SPkgYp9XN9hhCsucNjs=; b=SJWuqazpY0qa
 BrrS1nd0j6PbS565/WTNMJNtFH9o59EMolEfihC/TH2ZjbdWJQEyxx+w4ngRSg5ytmZzY8SSLc75Z
 jXe6CF0bhd3mGKi2zKdDbKxtNBwt7chi+BjZef0OEDoz93oKndo1VAtnMc4dwulSj+pDBpZSbotwz
 JG2rI=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzu1-0007MX-CX; Thu, 06 Jun 2019 21:26:29 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id D4819440046; Thu,  6 Jun 2019 22:26:28 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wohzgy5y.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212628.D4819440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:28 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: fsl: imx-audmix: use modern dai_link
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

   ASoC: fsl: imx-audmix: use modern dai_link style

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

From 79782e283ed3df04bfb77129091f1d6726987f1e Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:16:20 +0900
Subject: [PATCH] ASoC: fsl: imx-audmix: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-audmix.c | 45 +++++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 9aaf3e5b45b9..9e1cb18859ce 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -205,6 +205,15 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0; i < num_dai; i++) {
+		struct snd_soc_dai_link_component *dlc;
+
+		/* for CPU/Codec/Platform x 2 */
+		dlc = devm_kzalloc(&pdev->dev, 6 * sizeof(*dlc), GFP_KERNEL);
+		if (!dlc) {
+			dev_err(&pdev->dev, "failed to allocate dai_link\n");
+			return -ENOMEM;
+		}
+
 		ret = of_parse_phandle_with_args(audmix_np, "dais", NULL, i,
 						 &args);
 		if (ret < 0) {
@@ -231,13 +240,21 @@ static int imx_audmix_probe(struct platform_device *pdev)
 					       dai_name, "CPU-Capture");
 		}
 
+		priv->dai[i].cpus = &dlc[0];
+		priv->dai[i].codecs = &dlc[1];
+		priv->dai[i].platforms = &dlc[2];
+
+		priv->dai[i].num_cpus = 1;
+		priv->dai[i].num_codecs = 1;
+		priv->dai[i].num_platforms = 1;
+
 		priv->dai[i].name = dai_name;
 		priv->dai[i].stream_name = "HiFi-AUDMIX-FE";
-		priv->dai[i].codec_dai_name = "snd-soc-dummy-dai";
-		priv->dai[i].codec_name = "snd-soc-dummy";
-		priv->dai[i].cpu_of_node = args.np;
-		priv->dai[i].cpu_dai_name = dev_name(&cpu_pdev->dev);
-		priv->dai[i].platform_of_node = args.np;
+		priv->dai[i].codecs->dai_name = "snd-soc-dummy-dai";
+		priv->dai[i].codecs->name = "snd-soc-dummy";
+		priv->dai[i].cpus->of_node = args.np;
+		priv->dai[i].cpus->dai_name = dev_name(&cpu_pdev->dev);
+		priv->dai[i].platforms->of_node = args.np;
 		priv->dai[i].dynamic = 1;
 		priv->dai[i].dpcm_playback = 1;
 		priv->dai[i].dpcm_capture = (i == 0 ? 1 : 0);
@@ -252,12 +269,20 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		be_cp = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 				       "AUDMIX-Capture-%d", i);
 
+		priv->dai[num_dai + i].cpus = &dlc[3];
+		priv->dai[num_dai + i].codecs = &dlc[4];
+		priv->dai[num_dai + i].platforms = &dlc[5];
+
+		priv->dai[num_dai + i].num_cpus = 1;
+		priv->dai[num_dai + i].num_codecs = 1;
+		priv->dai[num_dai + i].num_platforms = 1;
+
 		priv->dai[num_dai + i].name = be_name;
-		priv->dai[num_dai + i].codec_dai_name = "snd-soc-dummy-dai";
-		priv->dai[num_dai + i].codec_name = "snd-soc-dummy";
-		priv->dai[num_dai + i].cpu_of_node = audmix_np;
-		priv->dai[num_dai + i].cpu_dai_name = be_name;
-		priv->dai[num_dai + i].platform_name = "snd-soc-dummy";
+		priv->dai[num_dai + i].codecs->dai_name = "snd-soc-dummy-dai";
+		priv->dai[num_dai + i].codecs->name = "snd-soc-dummy";
+		priv->dai[num_dai + i].cpus->of_node = audmix_np;
+		priv->dai[num_dai + i].cpus->dai_name = be_name;
+		priv->dai[num_dai + i].platforms->name = "snd-soc-dummy";
 		priv->dai[num_dai + i].no_pcm = 1;
 		priv->dai[num_dai + i].dpcm_playback = 1;
 		priv->dai[num_dai + i].dpcm_capture  = 1;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
