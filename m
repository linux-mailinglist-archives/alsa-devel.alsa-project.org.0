Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80699AD732
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 12:48:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 159D115E2;
	Mon,  9 Sep 2019 12:47:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 159D115E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568026102;
	bh=nFXLTVuz/B05c1Z2tFR/ZlSue5zpyGiZfA4dyGaQizQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Hqyn1phWEQi0V0xEnyn1N9H4QXT6ErUsO8cK7HWcMUj8L5fE3tm1Ww0KIDRADHMS+
	 9zRtaf0BnkkhfXdYT5cdY6vxEMBWo5jnKYYcU770fmYceoHgZtkkpurIebmio6MyHR
	 dRQ/cqrhk3BLLGHtgNAHawIVyE6mFtDU2ZyGB9EI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2C38F8071F;
	Mon,  9 Sep 2019 12:38:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E107F805FB; Mon,  9 Sep 2019 12:35:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 828C7F80610
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 12:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 828C7F80610
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="TB9hwGbc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=TEtnG+APmzQSKaZ/niYEOo2Vrpjn5f4j5/mAo/gtac8=; b=TB9hwGbc8fi0
 NzAc8BFoc0jdvXfIv9Lb1GAIeMWeVzH2pgaekUTukTGdLI9SkwOoHP0e1Q2BIEttIOCpSm3+TnkSp
 FNVtvEWPImCvmrdWYRITS8MMB6Rt9iv22ZgSh24N7e12nQSsAXNVE1im4xIutsan1OsmjZRPonxfO
 4NOBY=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7GZp-0001rV-Dd; Mon, 09 Sep 2019 10:07:17 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 9A90DD02D72; Mon,  9 Sep 2019 11:07:16 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871rwwq5mm.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190909100716.9A90DD02D72@fitzroy.sirena.org.uk>
Date: Mon,  9 Sep 2019 11:07:16 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: self contained
	soc_remove_link_dais()" to the asoc tree
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

   ASoC: soc-core: self contained soc_remove_link_dais()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 4ca47d21bf7aa044c703688fa715862183dd6a3c Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 4 Sep 2019 09:14:57 +0900
Subject: [PATCH] ASoC: soc-core: self contained soc_remove_link_dais()

Current soc_remove_link_dais() implementation is very half,
thus it is very difficult to read.

	for_each_comp_order(xxx) {
		for_each_card_rtds(xxx)
=>			soc_remove_link_dais(xxx);
	}

This patch does all for_each_xxx() under soc_remove_link_dais(),
and makes it to self contained.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/871rwwq5mm.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index fbaf4dd597b5..0a13f9461303 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1107,20 +1107,26 @@ static void soc_remove_dai(struct snd_soc_dai *dai, int order)
 }
 
 static void soc_rtd_free(struct snd_soc_pcm_runtime *rtd); /* remove me */
-static void soc_remove_link_dais(struct snd_soc_card *card,
-		struct snd_soc_pcm_runtime *rtd, int order)
+static void soc_remove_link_dais(struct snd_soc_card *card)
 {
 	int i;
 	struct snd_soc_dai *codec_dai;
+	struct snd_soc_pcm_runtime *rtd;
+	int order;
+
+	for_each_comp_order(order) {
+		for_each_card_rtds(card, rtd) {
 
-	/* finalize rtd device */
-	soc_rtd_free(rtd);
+			/* finalize rtd device */
+			soc_rtd_free(rtd);
 
-	/* remove the CODEC DAI */
-	for_each_rtd_codec_dai(rtd, i, codec_dai)
-		soc_remove_dai(codec_dai, order);
+			/* remove the CODEC DAI */
+			for_each_rtd_codec_dai(rtd, i, codec_dai)
+				soc_remove_dai(codec_dai, order);
 
-	soc_remove_dai(rtd->cpu_dai, order);
+			soc_remove_dai(rtd->cpu_dai, order);
+		}
+	}
 }
 
 static void soc_remove_link_components(struct snd_soc_card *card)
@@ -1171,14 +1177,9 @@ static int soc_probe_link_components(struct snd_soc_card *card)
 
 static void soc_remove_dai_links(struct snd_soc_card *card)
 {
-	int order;
-	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai_link *link, *_link;
 
-	for_each_comp_order(order) {
-		for_each_card_rtds(card, rtd)
-			soc_remove_link_dais(card, rtd, order);
-	}
+	soc_remove_link_dais(card);
 
 	soc_remove_link_components(card);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
