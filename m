Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF7CF9921
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 19:52:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67ABE1657;
	Tue, 12 Nov 2019 19:51:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67ABE1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573584766;
	bh=iJPnjvbPJsM4vMvwZjKfCT+ZpzKkRco4WVftFi1qeIg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=XnA8/gM7pE0529xRsm1h4QjQL6tgZWJjL/8bD3L0htz6tOAHmIW8fSVmzdXQNWcFs
	 HNkXYayv0t+nf001IpzflyvxGBdmLhcOrZOPC9PmOns0k2wbh0MwkvuwtlDwkzEoUD
	 tO0RfqrKZrMMxOyAuCFEwMSCFZwO/zJjfJA95MyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 699D5F80672;
	Tue, 12 Nov 2019 19:47:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCB5EF80507; Tue, 12 Nov 2019 19:47:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAACDF805FE
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 19:47:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAACDF805FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="MC2lj+DC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=4W1vgsezH1/nAg5twmE8K1SPaQKlF9gqZw/boeTQ7sQ=; b=MC2lj+DCn7Hq
 BfOKUz6lgPYX4Pn6kE/pw3B4lo7cAOh4GPEUf7Nd4jkz5i7LEVjDrym2tiL6oxbh7+3cJHrkDog7A
 +kkUuJbIcJAGopJ48G6YT5T7MogmkYALYtvluJ1tr/i/W6GolaUW0TOdCwjoEQRtrbdSuUYSvqiRp
 IuPR4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUbC5-00005C-Iy; Tue, 12 Nov 2019 18:47:13 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 024F727429FE; Tue, 12 Nov 2019 18:47:12 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v9rxhkxw.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191112184713.024F727429FE@ypsilon.sirena.org.uk>
Date: Tue, 12 Nov 2019 18:47:12 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: remove
	soc_is_dai_link_bound()" to the asoc tree
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

   ASoC: soc-core: remove soc_is_dai_link_bound()

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

From 0d18a7caa654ea1a0c02b3a253adfd5c10723871 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 6 Nov 2019 10:07:07 +0900
Subject: [PATCH] ASoC: soc-core: remove soc_is_dai_link_bound()

Because complex separeted "card pre-listed component" and
"topology added component" duplicated operation is now
becoming simple, we don't need to check already bound dai_link
which is not exist anymore.
This patch removes soc_is_dai_link_bound().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87v9rxhkxw.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 55014e7ae0d8..c6885adbdc8b 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -953,19 +953,6 @@ struct snd_soc_dai_link *snd_soc_find_dai_link(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_find_dai_link);
 
-static bool soc_is_dai_link_bound(struct snd_soc_card *card,
-		struct snd_soc_dai_link *dai_link)
-{
-	struct snd_soc_pcm_runtime *rtd;
-
-	for_each_card_rtds(card, rtd) {
-		if (rtd->dai_link == dai_link)
-			return true;
-	}
-
-	return false;
-}
-
 static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 				     struct snd_soc_dai_link *link)
 {
@@ -1085,12 +1072,6 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
 
 	dev_dbg(card->dev, "ASoC: binding %s\n", dai_link->name);
 
-	if (soc_is_dai_link_bound(card, dai_link)) {
-		dev_dbg(card->dev, "ASoC: dai link %s already bound\n",
-			dai_link->name);
-		return 0;
-	}
-
 	ret = soc_dai_link_sanity_check(card, dai_link);
 	if (ret < 0)
 		return ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
