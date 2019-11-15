Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E33FDDDB
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 13:29:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B74DA74C;
	Fri, 15 Nov 2019 13:28:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B74DA74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573820964;
	bh=FMU+iG+AaGLo8tPknlQ48LMucemdj1OfZYPIGmJRO3U=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=llSfVkk47zf8D25OYDcY2gIwJ4XIH1eucaYUSYgUxfpK4wzSOmvPAaNQALHFX7a0J
	 AKZEg0j0NieMjIioh6dlW2ceRacRjpPO1xb+iX2f4XXuOmcW18NVNPMSS8rwGc3z/K
	 oS+bU2Q5UWyF2XJiXfypCIFrNMnTrcbaP0nSFW7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D635F80124;
	Fri, 15 Nov 2019 13:25:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92673F8010D; Fri, 15 Nov 2019 13:25:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0F73F80103
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 13:25:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0F73F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ZADTP3WF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=3lEUYAK3Pt/+4jF4u/pGMRPo1gBlYrvV/rdoiuGZtAs=; b=ZADTP3WFw+v3
 DJHhd806oif5cgCUATTMAHvxCq+SbBAsE7urKZnBSRACZNOVCiq//qv/o7ipJ1QAtmQPyFQVUTBjx
 Dqvg9X8kco0SFc5jMTVqPn+zqFO/HHGq95yLWXP1Pb8UaVjS9AAdBt6IFh3Qv+gHWNXTrFVXQ74bo
 1nZsk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iVaer-0000Ji-6v; Fri, 15 Nov 2019 12:25:01 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A16DE2741A22; Fri, 15 Nov 2019 12:25:00 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pnhw4lu5.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191115122500.A16DE2741A22@ypsilon.sirena.org.uk>
Date: Fri, 15 Nov 2019 12:25:00 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: move snd_soc_unbind_card()
	next to snd_soc_bind_card()" to the asoc tree
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

   ASoC: soc-core: move snd_soc_unbind_card() next to snd_soc_bind_card()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 2cc1afcfc617b33b72e409360ba5dd7c3fc2492d Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 13 Nov 2019 10:16:34 +0900
Subject: [PATCH] ASoC: soc-core: move snd_soc_unbind_card() next to
 snd_soc_bind_card()

To makes code readable, this patch moves snd_soc_unbind_card() next
to snd_soc_bind_card().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87pnhw4lu5.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 216000ae3e20..a149697e705d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1973,6 +1973,21 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 		card->remove(card);
 }
 
+static void snd_soc_unbind_card(struct snd_soc_card *card, bool unregister)
+{
+	if (card->instantiated) {
+		card->instantiated = false;
+		snd_soc_flush_all_delayed_work(card);
+
+		soc_cleanup_card_resources(card);
+		if (!unregister)
+			list_add(&card->list, &unbind_card_list);
+	} else {
+		if (unregister)
+			list_del(&card->list);
+	}
+}
+
 static int snd_soc_bind_card(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
@@ -2387,21 +2402,6 @@ int snd_soc_register_card(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_card);
 
-static void snd_soc_unbind_card(struct snd_soc_card *card, bool unregister)
-{
-	if (card->instantiated) {
-		card->instantiated = false;
-		snd_soc_flush_all_delayed_work(card);
-
-		soc_cleanup_card_resources(card);
-		if (!unregister)
-			list_add(&card->list, &unbind_card_list);
-	} else {
-		if (unregister)
-			list_del(&card->list);
-	}
-}
-
 /**
  * snd_soc_unregister_card - Unregister a card with the ASoC core
  *
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
