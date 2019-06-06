Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C836438000
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 23:54:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65F46166D;
	Thu,  6 Jun 2019 23:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65F46166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559858073;
	bh=4CXK+WphKVNXRL/6FVeTlKDnFCr+4hci0sspqbJEJ9g=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=WrBuipVGkqrQFOV6kbBWyH+sNgSCyWjmlZAyQtEOceI7GWiB1TZ40i6OGyRPd9oTx
	 +mlciPhC42uMhIcy4XHqHsTtjvkwlQwBu8wcZam4Qi/ex89749DcIgxRsYDUXagXuA
	 WHLneXWvXpQk9LexHpC2MsYdpsKriXDmgVxLAS/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C2D8F89853;
	Thu,  6 Jun 2019 23:28:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45AFBF897EF; Thu,  6 Jun 2019 23:27:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 155E2F896EF
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 155E2F896EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KqE6dnmA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=TiHZ6JX+Hz+mjtWYhVOoM+4JBtqLL42tsYDc897FbZ4=; b=KqE6dnmAzxWL
 +VH+70mzoUGzilYSXDEy5TudFGx6DwPaOs9zqOJpwYEV8YDdSqSSESodcicAUw/MS+031nWh0I6RE
 DgFCgXRQhGRU7tipWCv0RS7QZdw2Gal6DUn/jmetvlwdXabGaPRRXOa4hBfmM0LCnaAVr/e5GJAWJ
 bsaSo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYztq-0007Kl-Rt; Thu, 06 Jun 2019 21:26:18 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 6BFBD440046; Thu,  6 Jun 2019 22:26:18 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875zpjgy21.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212618.6BFBD440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:18 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: tegra: trimslice: use modern dai_link
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

   ASoC: tegra: trimslice: use modern dai_link style

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

From 706e20515ef6a370afb31ac49f897c2d2459011a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:18:41 +0900
Subject: [PATCH] ASoC: tegra: trimslice: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/trimslice.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index 99bcdd979eb2..a553daa34e87 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -91,14 +91,19 @@ static const struct snd_soc_dapm_route trimslice_audio_map[] = {
 	{"RLINEIN", NULL, "Line In"},
 };
 
+SND_SOC_DAILINK_DEFS(single_dsp,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "tlv320aic23-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 static struct snd_soc_dai_link trimslice_tlv320aic23_dai = {
 	.name = "TLV320AIC23",
 	.stream_name = "AIC23",
-	.codec_dai_name = "tlv320aic23-hifi",
 	.ops = &trimslice_asoc_ops,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBS_CFS,
+	SND_SOC_DAILINK_REG(single_dsp),
 };
 
 static struct snd_soc_card snd_soc_trimslice = {
@@ -129,26 +134,26 @@ static int tegra_snd_trimslice_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 	snd_soc_card_set_drvdata(card, trimslice);
 
-	trimslice_tlv320aic23_dai.codec_of_node = of_parse_phandle(np,
+	trimslice_tlv320aic23_dai.codecs->of_node = of_parse_phandle(np,
 			"nvidia,audio-codec", 0);
-	if (!trimslice_tlv320aic23_dai.codec_of_node) {
+	if (!trimslice_tlv320aic23_dai.codecs->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'nvidia,audio-codec' missing or invalid\n");
 		ret = -EINVAL;
 		goto err;
 	}
 
-	trimslice_tlv320aic23_dai.cpu_of_node = of_parse_phandle(np,
+	trimslice_tlv320aic23_dai.cpus->of_node = of_parse_phandle(np,
 			"nvidia,i2s-controller", 0);
-	if (!trimslice_tlv320aic23_dai.cpu_of_node) {
+	if (!trimslice_tlv320aic23_dai.cpus->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'nvidia,i2s-controller' missing or invalid\n");
 		ret = -EINVAL;
 		goto err;
 	}
 
-	trimslice_tlv320aic23_dai.platform_of_node =
-			trimslice_tlv320aic23_dai.cpu_of_node;
+	trimslice_tlv320aic23_dai.platforms->of_node =
+			trimslice_tlv320aic23_dai.cpus->of_node;
 
 	ret = tegra_asoc_utils_init(&trimslice->util_data, &pdev->dev);
 	if (ret)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
