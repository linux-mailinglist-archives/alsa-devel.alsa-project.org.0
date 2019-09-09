Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6BEAD706
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 12:40:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4CCD1677;
	Mon,  9 Sep 2019 12:39:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4CCD1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568025623;
	bh=JxHBJ+u9ST74QPiTyqH1aV2ioda9bliLDWPdTNNBP9Y=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=iNfFJGjYDwpZk6hT+xUmNsH4h1K2X1LbKKoyD15XE8P0qbUgug8X6D5NeFmqOZWNF
	 pLcftI575R1X+CBiEraHCJWmqzc7NLyElhjyE0mqGXTd0SbNLVstqOHlbbtcyhe1Q3
	 MkMAq5KIuv6qNZ+38qdFKbcfiU8O/9g65JbUOseM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59DE3F805F7;
	Mon,  9 Sep 2019 12:36:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC95DF80094; Mon,  9 Sep 2019 12:34:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BA13F804FD
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 12:34:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BA13F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nom5ye0B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=5tP/CsShqX1/Pm++EC1QPZ2iu2mBVSSuan8MOuXOIFU=; b=nom5ye0BElA+
 KpiDnER9xR4POlsKEI0YiTCcc5i/zJb55XRwSylGMEtUuvw8V2bgPvjklUwjpd9VZ5eM0QSphqGIG
 eu/B48wNKL9yhXvnnoqRISMRDhjrffi7rJOFcT3UPXmFCfb2uh3LCKuEG9XyUTEw8o6/enfHjq0fc
 y8wAQ=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7GZp-0001rR-93; Mon, 09 Sep 2019 10:07:17 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 74E81D02D5A; Mon,  9 Sep 2019 11:07:16 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y2z4or1r.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190909100716.74E81D02D5A@fitzroy.sirena.org.uk>
Date: Mon,  9 Sep 2019 11:07:16 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: add new soc_link_init()" to
	the asoc tree
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

   ASoC: soc-core: add new soc_link_init()

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

From c4b4698291a1d1c55665ae906779d1b685d5aa66 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 4 Sep 2019 09:15:12 +0900
Subject: [PATCH] ASoC: soc-core: add new soc_link_init()

Current soc_probe_link_dais() (1) is called under probe_order (2),
and it will initialize dai_link related settings at *Last* turn (3)(B).
It is very complex code.

	static int soc_probe_link_dais(..., order)
	{
(A)		/* probe DAIs here */
		...

(3)		if (order != SND_SOC_COMP_ORDER_LAST)
			return 0;

(B)		/* initialize dai_link related settings */
		...
	}

	static int snd_soc_instantiate_card(...)
	{
		...
(2)		for_each_comp_order(order) {
			for_each_card_rtds(...) {
(1)				ret = soc_probe_link_dais(..., order);
			}
		}
	}

This patch separes soc_probe_link_dais() into "DAI probe" portion (A),
and dai_link settings portion (B).
The later is named as soc_link_init() by this patch.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87y2z4or1r.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3ca5a21bfa6a..1e74ab8e6a25 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1455,19 +1455,13 @@ static int soc_link_dai_pcm_new(struct snd_soc_dai **dais, int num_dais,
 static int soc_probe_link_dais(struct snd_soc_card *card,
 		struct snd_soc_pcm_runtime *rtd, int order)
 {
-	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct snd_soc_rtdcom_list *rtdcom;
-	struct snd_soc_component *component;
 	struct snd_soc_dai *codec_dai;
-	int i, ret, num;
+	int i, ret;
 
 	dev_dbg(card->dev, "ASoC: probe %s dai link %d late %d\n",
 			card->name, rtd->num, order);
 
-	/* set default power off timeout */
-	rtd->pmdown_time = pmdown_time;
-
 	ret = soc_probe_dai(cpu_dai, order);
 	if (ret)
 		return ret;
@@ -1479,9 +1473,20 @@ static int soc_probe_link_dais(struct snd_soc_card *card,
 			return ret;
 	}
 
-	/* complete DAI probe during last probe */
-	if (order != SND_SOC_COMP_ORDER_LAST)
-		return 0;
+	return 0;
+}
+
+static int soc_link_init(struct snd_soc_card *card,
+			 struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_rtdcom_list *rtdcom;
+	struct snd_soc_component *component;
+	int ret, num;
+
+	/* set default power off timeout */
+	rtd->pmdown_time = pmdown_time;
 
 	/* do machine specific initialization */
 	if (dai_link->init) {
@@ -2041,6 +2046,9 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 		}
 	}
 
+	for_each_card_rtds(card, rtd)
+		soc_link_init(card, rtd);
+
 	snd_soc_dapm_link_dai_widgets(card);
 	snd_soc_dapm_connect_dai_link_widgets(card);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
