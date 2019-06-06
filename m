Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAE437FF0
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 23:52:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 733A8169C;
	Thu,  6 Jun 2019 23:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 733A8169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559857948;
	bh=RrM9lZywZrK2lkiLQ6tbyQmBkkY99nk/GhBVfg0ekUE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jNmWD7jnHoWPaT9IuIJ5Ko9GnfJZ4ysYjilhSP+lHzsLcfEmnNdfPW7ygAKXSM7DF
	 eF5xFwruO31C4P7wmZ1nnpOhFXQSjo87Uhaoe5NxQHAXzuaIPEMQD89Z+lMaoGQLlD
	 qcJS/Lioey0U+ZcX098KUBMrFIgbaiuuuA4rCScs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A25BF89849;
	Thu,  6 Jun 2019 23:28:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF5D2F897EA; Thu,  6 Jun 2019 23:27:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EC08F89761
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EC08F89761
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="xPaaG/wr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=GygkLW9jvL+kC1ejmsvhSOvwdCx5VnMyjfURCRzBgEo=; b=xPaaG/wrpxYn
 2TMeeVxlcM31E1hPaIIpTXCTKXHPJ/wRdfMT7kblBahpqrWkCFkBCT1oD+QyV2BMbUWa24H/AbVaN
 swLSlIEZF7xrKBhMZCNVej5tbYL+2W/w7HMzEdR/oLbNP0xs0K4f9O+g1DouwY1VVxsmHixL0XrcR
 xl2GM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYztp-0007KZ-Qr; Thu, 06 Jun 2019 21:26:17 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 532A0440046; Thu,  6 Jun 2019 22:26:17 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8736kngy1r.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212617.532A0440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:17 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: tegra: tegra_sgtl5000: use modern
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

   ASoC: tegra: tegra_sgtl5000: use modern dai_link style

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

From f4d9dd95f31bef764aaa857dbaa0b3ad2aa98298 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:18:51 +0900
Subject: [PATCH] ASoC: tegra: tegra_sgtl5000: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra_sgtl5000.c | 37 ++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/sound/soc/tegra/tegra_sgtl5000.c b/sound/soc/tegra/tegra_sgtl5000.c
index 901457da25ec..c5d45a6147bd 100644
--- a/sound/soc/tegra/tegra_sgtl5000.c
+++ b/sound/soc/tegra/tegra_sgtl5000.c
@@ -92,13 +92,18 @@ static const struct snd_soc_dapm_widget tegra_sgtl5000_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
 };
 
+SND_SOC_DAILINK_DEFS(hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "sgtl5000")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 static struct snd_soc_dai_link tegra_sgtl5000_dai = {
 	.name = "sgtl5000",
 	.stream_name = "HiFi",
-	.codec_dai_name = "sgtl5000",
 	.ops = &tegra_sgtl5000_ops,
 	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
+	SND_SOC_DAILINK_REG(hifi),
 };
 
 static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
@@ -134,25 +139,25 @@ static int tegra_sgtl5000_driver_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
-	tegra_sgtl5000_dai.codec_of_node = of_parse_phandle(np,
+	tegra_sgtl5000_dai.codecs->of_node = of_parse_phandle(np,
 			"nvidia,audio-codec", 0);
-	if (!tegra_sgtl5000_dai.codec_of_node) {
+	if (!tegra_sgtl5000_dai.codecs->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'nvidia,audio-codec' missing or invalid\n");
 		ret = -EINVAL;
 		goto err;
 	}
 
-	tegra_sgtl5000_dai.cpu_of_node = of_parse_phandle(np,
+	tegra_sgtl5000_dai.cpus->of_node = of_parse_phandle(np,
 			"nvidia,i2s-controller", 0);
-	if (!tegra_sgtl5000_dai.cpu_of_node) {
+	if (!tegra_sgtl5000_dai.cpus->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'nvidia,i2s-controller' missing/invalid\n");
 		ret = -EINVAL;
 		goto err_put_codec_of_node;
 	}
 
-	tegra_sgtl5000_dai.platform_of_node = tegra_sgtl5000_dai.cpu_of_node;
+	tegra_sgtl5000_dai.platforms->of_node = tegra_sgtl5000_dai.cpus->of_node;
 
 	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
 	if (ret)
@@ -170,12 +175,12 @@ static int tegra_sgtl5000_driver_probe(struct platform_device *pdev)
 err_fini_utils:
 	tegra_asoc_utils_fini(&machine->util_data);
 err_put_cpu_of_node:
-	of_node_put(tegra_sgtl5000_dai.cpu_of_node);
-	tegra_sgtl5000_dai.cpu_of_node = NULL;
-	tegra_sgtl5000_dai.platform_of_node = NULL;
+	of_node_put(tegra_sgtl5000_dai.cpus->of_node);
+	tegra_sgtl5000_dai.cpus->of_node = NULL;
+	tegra_sgtl5000_dai.platforms->of_node = NULL;
 err_put_codec_of_node:
-	of_node_put(tegra_sgtl5000_dai.codec_of_node);
-	tegra_sgtl5000_dai.codec_of_node = NULL;
+	of_node_put(tegra_sgtl5000_dai.codecs->of_node);
+	tegra_sgtl5000_dai.codecs->of_node = NULL;
 err:
 	return ret;
 }
@@ -190,11 +195,11 @@ static int tegra_sgtl5000_driver_remove(struct platform_device *pdev)
 
 	tegra_asoc_utils_fini(&machine->util_data);
 
-	of_node_put(tegra_sgtl5000_dai.cpu_of_node);
-	tegra_sgtl5000_dai.cpu_of_node = NULL;
-	tegra_sgtl5000_dai.platform_of_node = NULL;
-	of_node_put(tegra_sgtl5000_dai.codec_of_node);
-	tegra_sgtl5000_dai.codec_of_node = NULL;
+	of_node_put(tegra_sgtl5000_dai.cpus->of_node);
+	tegra_sgtl5000_dai.cpus->of_node = NULL;
+	tegra_sgtl5000_dai.platforms->of_node = NULL;
+	of_node_put(tegra_sgtl5000_dai.codecs->of_node);
+	tegra_sgtl5000_dai.codecs->of_node = NULL;
 
 	return ret;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
