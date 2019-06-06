Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9359738033
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:03:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E16616D4;
	Fri,  7 Jun 2019 00:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E16616D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559858589;
	bh=1bibS6g66dIW3q3ZasIFXMGIGjNvhoAQxHkEehSThZA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=V2t0BiNUNgOYBgbMHnf9hNR68eC8z83mQLUfavTZ0LJZPaCsCypD7d4zPYXVT/KT9
	 b7LzuAgYV8iRbmz1ZR9ZhqWWyTwAVjjL+b79ETsCT/nVjpxKhKh46bRZGNRPiZkTks
	 NqLf5rBQ2DUTw/QJq4s2x04NSrRlly5XkjCXGg3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 429AEF8975D;
	Thu,  6 Jun 2019 23:29:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D45AF89825; Thu,  6 Jun 2019 23:27:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDE31F8973A
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDE31F8973A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LtMHOTnS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=4hq9bsKZITIz26v/CTot/J2I7wFzlHyvrNF7fhLXVV4=; b=LtMHOTnStBNA
 nYUq2FmE97q2e6Ua3Hq1tsWr6/B57QPOI6cg2GYtuPQhZsIKmDRZNGABjAWUIYQxORr+RrHOz5olu
 up9zKGrt+FGpTr0rkL4b2WxiNQHz0T85KF0nBU7YobWaU7BEAG3XulI2Ga8WwgIipW67V6ONwSPiw
 /fycc=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzty-0007M3-KI; Thu, 06 Jun 2019 21:26:26 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 186B2440046; Thu,  6 Jun 2019 22:26:26 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pnnrgy53.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212626.186B2440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:26 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: qcom: storm: use modern dai_link style"
	to the asoc tree
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

   ASoC: qcom: storm: use modern dai_link style

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

From fa350b770b57d6e17b73d259bfec7e40099f7261 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:16:51 +0900
Subject: [PATCH] ASoC: qcom: storm: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/storm.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/storm.c b/sound/soc/qcom/storm.c
index a9fa972466ad..672edee2ea93 100644
--- a/sound/soc/qcom/storm.c
+++ b/sound/soc/qcom/storm.c
@@ -61,11 +61,16 @@ static const struct snd_soc_ops storm_soc_ops = {
 	.hw_params	= storm_ops_hw_params,
 };
 
+SND_SOC_DAILINK_DEFS(hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "HiFi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 static struct snd_soc_dai_link storm_dai_link = {
 	.name		= "Primary",
 	.stream_name	= "Primary",
-	.codec_dai_name	= "HiFi",
 	.ops		= &storm_soc_ops,
+	SND_SOC_DAILINK_REG(hifi),
 };
 
 static int storm_parse_of(struct snd_soc_card *card)
@@ -73,15 +78,15 @@ static int storm_parse_of(struct snd_soc_card *card)
 	struct snd_soc_dai_link *dai_link = card->dai_link;
 	struct device_node *np = card->dev->of_node;
 
-	dai_link->cpu_of_node = of_parse_phandle(np, "cpu", 0);
-	if (!dai_link->cpu_of_node) {
+	dai_link->cpus->of_node = of_parse_phandle(np, "cpu", 0);
+	if (!dai_link->cpus->of_node) {
 		dev_err(card->dev, "error getting cpu phandle\n");
 		return -EINVAL;
 	}
-	dai_link->platform_of_node = dai_link->cpu_of_node;
+	dai_link->platforms->of_node = dai_link->cpus->of_node;
 
-	dai_link->codec_of_node = of_parse_phandle(np, "codec", 0);
-	if (!dai_link->codec_of_node) {
+	dai_link->codecs->of_node = of_parse_phandle(np, "codec", 0);
+	if (!dai_link->codecs->of_node) {
 		dev_err(card->dev, "error getting codec phandle\n");
 		return -EINVAL;
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
