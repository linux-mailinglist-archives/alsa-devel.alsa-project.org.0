Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A5CAD712
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 12:43:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23C861671;
	Mon,  9 Sep 2019 12:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23C861671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568025784;
	bh=DRLM6uAH+OAfnbEZkn7DwC7MckY5fTqk2OPWjtxqnxk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=WJIi1J6kERtO/Ss/gcy5Jg+pzeB68Dpu3Vu90NW5ywuIUmbKe7GYahWvTEQtNGkyb
	 rNLhEBC4vMniXHfzPw3rSQmpr5HveCfqizmzvnrbAzfFBflrTAdE1a96VfnBG4/+qC
	 Z5fotRYNexyGdw3w4bwgNRBz2RD0W3WkHivHRUgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3EC0F80677;
	Mon,  9 Sep 2019 12:37:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8148F805FA; Mon,  9 Sep 2019 12:34:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D76B2F805F9
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 12:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D76B2F805F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BriNSMkm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=PrMOKCG5z/IXyKvet83c7NQneUat6o375iAado13I2Y=; b=BriNSMkmwSpy
 9ZYULUcpqOdhKT194/phNl7up50i90aEpxQpAF3X1NyqANJpiWMe9WgO3T2u9H2ODL7QMR8l4cX0n
 MkfE4z00x+cvsAlTuKXFRyLLq4ewqvDumz5taQolj8pmmCo9FYe+cdenheyHO7dJsp05cfLuplity
 hTlXo=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7GZo-0001rJ-U3; Mon, 09 Sep 2019 10:07:16 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 4F6E0D02D52; Mon,  9 Sep 2019 11:07:16 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v9u8or1g.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190909100716.4F6E0D02D52@fitzroy.sirena.org.uk>
Date: Mon,  9 Sep 2019 11:07:16 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: move soc_probe_link_dais()
	next to soc_remove_link_dais()" to the asoc tree
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

   ASoC: soc-core: move soc_probe_link_dais() next to soc_remove_link_dais()

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

From bc7c16c226a919a509e4161c905bfe9981a17f02 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 4 Sep 2019 09:15:23 +0900
Subject: [PATCH] ASoC: soc-core: move soc_probe_link_dais() next to
 soc_remove_link_dais()

It is easy to read code if it is cleanly using paired function/naming,
like start <-> stop, register <-> unregister, etc, etc.
But, current ALSA SoC code is very random, unbalance, not paired, etc.
It is easy to create bug at the such code, and it will be difficult to
debug.

This patch moves soc_probe_link_dais() next to soc_remove_link_dais()
which is paired function.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87v9u8or1g.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 58 ++++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 36b86e3c193c..20381f69a34b 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1149,6 +1149,35 @@ static void soc_remove_link_dais(struct snd_soc_card *card)
 	}
 }
 
+static int soc_probe_link_dais(struct snd_soc_card *card)
+{
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_pcm_runtime *rtd;
+	int i, order, ret;
+
+	for_each_comp_order(order) {
+		for_each_card_rtds(card, rtd) {
+
+			dev_dbg(card->dev,
+				"ASoC: probe %s dai link %d late %d\n",
+				card->name, rtd->num, order);
+
+			ret = soc_probe_dai(rtd->cpu_dai, order);
+			if (ret)
+				return ret;
+
+			/* probe the CODEC DAI */
+			for_each_rtd_codec_dai(rtd, i, codec_dai) {
+				ret = soc_probe_dai(codec_dai, order);
+				if (ret)
+					return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
 static void soc_remove_link_components(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
@@ -1452,35 +1481,6 @@ static int soc_link_dai_pcm_new(struct snd_soc_dai **dais, int num_dais,
 	return 0;
 }
 
-static int soc_probe_link_dais(struct snd_soc_card *card)
-{
-	struct snd_soc_dai *codec_dai;
-	struct snd_soc_pcm_runtime *rtd;
-	int i, order, ret;
-
-	for_each_comp_order(order) {
-		for_each_card_rtds(card, rtd) {
-
-			dev_dbg(card->dev,
-				"ASoC: probe %s dai link %d late %d\n",
-				card->name, rtd->num, order);
-
-			ret = soc_probe_dai(rtd->cpu_dai, order);
-			if (ret)
-				return ret;
-
-			/* probe the CODEC DAI */
-			for_each_rtd_codec_dai(rtd, i, codec_dai) {
-				ret = soc_probe_dai(codec_dai, order);
-				if (ret)
-					return ret;
-			}
-		}
-	}
-
-	return 0;
-}
-
 static int soc_link_init(struct snd_soc_card *card,
 			 struct snd_soc_pcm_runtime *rtd)
 {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
