Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B105738019
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 23:58:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38A4C16C5;
	Thu,  6 Jun 2019 23:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38A4C16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559858308;
	bh=Uru+o+3RMnTdfr61uXZyUVxU1AxLm74v4AeZJp3CLZE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ge9a7wtcvCf6B93Rhzb+qODJ9S7T9E1sddJ1V3JdyIIzncCApVGD1EA2b2l7OJfjS
	 9jk8VjjVi4MsKHf/5/GUhKluibhXdMyN//C6ZuosXzGkmNcKLToTy+8SnQiN5Qq/r7
	 GioAZdWRo4QC1BIZiD7vTJYGtTwo7Yg3LBjqiJTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADEE7F897D8;
	Thu,  6 Jun 2019 23:28:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A56CF89813; Thu,  6 Jun 2019 23:27:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3F1EF89732
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3F1EF89732
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="T7tfmpqp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=WgFYFiS2579iXjUS3gKaM3B+JQlBi/KLEPNAxi+nTAw=; b=T7tfmpqpT51T
 Hoj2/wd9Sisd2jGTqprMIzVDllRlwAxgBDWykITWiRyVPdYME2hfl8Ato6tDf/WIrR/j0dVlrPcHE
 4FHGMV+lD/HXlwX4sw30bYcRJou9AwrRClDdLT0KgwmIYPLcqdi2WY1+NA17lZzyM2z8NJXuHCGp+
 /rpdQ=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYztu-0007LO-JX; Thu, 06 Jun 2019 21:26:22 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 12A75440049; Thu,  6 Jun 2019 22:26:22 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ef47gy30.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212622.12A75440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:22 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: sirf: sirf-audio: use modern dai_link
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

   ASoC: sirf: sirf-audio: use modern dai_link style

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

From a39bb1b740c95d8f0029b280266744897453e8ee Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:18:06 +0900
Subject: [PATCH] ASoC: sirf: sirf-audio: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sirf/sirf-audio.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sirf/sirf-audio.c b/sound/soc/sirf/sirf-audio.c
index f2bc50790f76..ba85ccf1fe19 100644
--- a/sound/soc/sirf/sirf-audio.c
+++ b/sound/soc/sirf/sirf-audio.c
@@ -61,11 +61,16 @@ static const struct snd_soc_dapm_route intercon[] = {
 };
 
 /* Digital audio interface glue - connects codec <--> CPU */
+SND_SOC_DAILINK_DEFS(sirf,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "sirf-audio-codec")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 static struct snd_soc_dai_link sirf_audio_dai_link[] = {
 	{
 		.name = "SiRF audio card",
 		.stream_name = "SiRF audio HiFi",
-		.codec_dai_name = "sirf-audio-codec",
+		SND_SOC_DAILINK_REG(sirf),
 	},
 };
 
@@ -92,11 +97,11 @@ static int sirf_audio_probe(struct platform_device *pdev)
 	if (sirf_audio_card == NULL)
 		return -ENOMEM;
 
-	sirf_audio_dai_link[0].cpu_of_node =
+	sirf_audio_dai_link[0].cpus->of_node =
 		of_parse_phandle(pdev->dev.of_node, "sirf,audio-platform", 0);
-	sirf_audio_dai_link[0].platform_of_node =
+	sirf_audio_dai_link[0].platforms->of_node =
 		of_parse_phandle(pdev->dev.of_node, "sirf,audio-platform", 0);
-	sirf_audio_dai_link[0].codec_of_node =
+	sirf_audio_dai_link[0].codecs->of_node =
 		of_parse_phandle(pdev->dev.of_node, "sirf,audio-codec", 0);
 	sirf_audio_card->gpio_spk_pa = of_get_named_gpio(pdev->dev.of_node,
 			"spk-pa-gpios", 0);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
