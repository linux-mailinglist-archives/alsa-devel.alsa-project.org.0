Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C499DFDDD8
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 13:28:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 616D71678;
	Fri, 15 Nov 2019 13:27:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 616D71678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573820917;
	bh=3jwvaA99WEmPGD0bDQek+rBBU8GERRR3D82yDBwKjCQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qGBq6r90oiCremsWhy/20opkouPtED+sVThNhfrYNr+A6eqQndHPdDpg7ukcEZA8E
	 ZDxoCsTE7OpJlkHxq9d9Pusv1fZi43ptskgKJqKBYRLUsI7q+gF0yY/WoTeNP+9ndM
	 ej+KJ/2TL+EvlXZs5/jRhqJyofSU6aHyPwG3mmEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81588F8011A;
	Fri, 15 Nov 2019 13:25:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E578F80105; Fri, 15 Nov 2019 13:25:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8CFAF80104
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 13:25:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8CFAF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="hRAbhK0A"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=zTWR4qcX3Bisj0s4mYbg7aFTm9YGoJ9K/Zx9ry9h/9w=; b=hRAbhK0AiZJ7
 wmCDmCkkKp6KEfkyWyYh9ZdDLuEx3VeVnPA95l47bR/pa02BgWKqm66BRZEKCty3iN5oK9Yq03U60
 cH/Mbodx+zbJB/OQWZJdUqqWd1tgNS4V7KUgnpDEdCT9wXqW370h3zmFXhmOBVBYQYppheh5zXOIH
 u51D8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iVaer-0000Jh-3F; Fri, 15 Nov 2019 12:25:01 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6433D274162A; Fri, 15 Nov 2019 12:25:00 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o8xg4ltr.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191115122500.6433D274162A@ypsilon.sirena.org.uk>
Date: Fri, 15 Nov 2019 12:25:00 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: care card_probed at
	soc_cleanup_card_resources()" to the asoc tree
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

   ASoC: soc-core: care card_probed at soc_cleanup_card_resources()

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

From ce21401c9d30e81824e864dc25824ebeb9690801 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 13 Nov 2019 10:16:48 +0900
Subject: [PATCH] ASoC: soc-core: care card_probed at
 soc_cleanup_card_resources()

soc_cleanup_card_resources() will call card->remove(), but it should be
called if card->probe() or card->late_probe() are called.
snd_soc_bind_card() might be error before calling
card->probe() / card->late_probe().
In that time, card->remove() will be called.
This patch adds card_probed parameter to judge it.

Fixes: bfce78a559655 ("ASoC: soc-core: tidyup soc_init_dai_link()")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Link: https://lore.kernel.org/r/87o8xg4ltr.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index a149697e705d..977a7bfad519 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1940,7 +1940,8 @@ static void __soc_setup_card_name(char *name, int len,
 	}
 }
 
-static void soc_cleanup_card_resources(struct snd_soc_card *card)
+static void soc_cleanup_card_resources(struct snd_soc_card *card,
+				       int card_probed)
 {
 	struct snd_soc_dai_link *link, *_link;
 
@@ -1969,17 +1970,19 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 	soc_cleanup_card_debugfs(card);
 
 	/* remove the card */
-	if (card->remove)
+	if (card_probed && card->remove)
 		card->remove(card);
 }
 
 static void snd_soc_unbind_card(struct snd_soc_card *card, bool unregister)
 {
 	if (card->instantiated) {
+		int card_probed = 1;
+
 		card->instantiated = false;
 		snd_soc_flush_all_delayed_work(card);
 
-		soc_cleanup_card_resources(card);
+		soc_cleanup_card_resources(card, card_probed);
 		if (!unregister)
 			list_add(&card->list, &unbind_card_list);
 	} else {
@@ -1992,7 +1995,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai_link *dai_link;
-	int ret, i;
+	int ret, i, card_probed = 0;
 
 	mutex_lock(&client_mutex);
 	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_INIT);
@@ -2044,6 +2047,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		ret = card->probe(card);
 		if (ret < 0)
 			goto probe_end;
+		card_probed = 1;
 	}
 
 	/* probe all components used by DAI links on this card */
@@ -2109,6 +2113,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 			goto probe_end;
 		}
 	}
+	card_probed = 1;
 
 	snd_soc_dapm_new_widgets(card);
 
@@ -2138,7 +2143,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 
 probe_end:
 	if (ret < 0)
-		soc_cleanup_card_resources(card);
+		soc_cleanup_card_resources(card, card_probed);
 
 	mutex_unlock(&card->mutex);
 	mutex_unlock(&client_mutex);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
