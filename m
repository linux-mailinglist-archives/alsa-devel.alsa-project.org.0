Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 720CC97912
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 14:17:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D69B1165F;
	Wed, 21 Aug 2019 14:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D69B1165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566389860;
	bh=/l3Ftbr9gIx6ZqqFkuu//prPyMEt5WyetzHWJ0Rwl60=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ho15Sxpr/IiWLX3nEXkZDc0ZZFVxIshiFCi5x2tK/HxCKa2UecFf7E2Dmvb6KQ30c
	 /ZHwp6XkZXnxqttxIhjUYhk8R9rDYgdpeZuiZICrMcwTTqU+dXInoaCRe30zcb/Pjv
	 myLKsxCcv+B8dsB6fFRxIdAVtHGSkvjbjZL9jqoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B22DF805E2;
	Wed, 21 Aug 2019 14:15:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6457F80322; Wed, 21 Aug 2019 14:15:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com
 [209.85.128.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2290EF80322
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 14:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2290EF80322
Received: by mail-wm1-f98.google.com with SMTP id c5so1699969wmb.5
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 05:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=9/I4uWVsC4OtY3QnRa+GYPuY2sLA6GxvdUFKvJ4jhl0=;
 b=UNYcztJH2XJoTDUDXlHUNmHHfDKzOLXUPDWtA5c/szGuif7YEixKRoTiHIp3psWWBW
 jBnMpQbCWC39dqV4j/Fq/VyDsZCnNRFU8pC80V3ag54k+AzGlylWyjkeL42wA50Sam7Z
 B00LVl/gzEgvW1yCGmeb/GhReqXSG7vpeAPScRBIEZOSupGxY+olG3G+xzysxpCyYtHI
 WZxwuEzor77MnfoSsEoATTa02mc/OK7Lgmf7AxVYMBq7XbBfJMFMPu4h9DHJ4CC3h0Zd
 9dGIRwxNz1z6Mnc2WF0v3jHGWDkwi14wp6URA5V0pjCAuidTVOEeheJVmcRpAoc+T0e4
 YMSg==
X-Gm-Message-State: APjAAAXZ5lc8vV9l5Sfowem/pJdP3jCCrZlS5t4fh74o8smoYaGjA3do
 fh3RHPk6kgprzIc8sRJ0pdv2NCi2G6lK86hdQcgmJh/mh5a4/AEsSKh8Llv3++ZGTA==
X-Google-Smtp-Source: APXvYqxSzlyPC30pNK4qYU0JrdXd63tOM1PGvsPQg9J4Rj/FNS/q0eF2F1cUeoQUonF5AW17BjexLorqpkVL
X-Received: by 2002:a1c:a584:: with SMTP id o126mr5895872wme.147.1566389733040; 
 Wed, 21 Aug 2019 05:15:33 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id t12sm395408wrm.42.2019.08.21.05.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:15:33 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0PWW-000775-Pz; Wed, 21 Aug 2019 12:15:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4491A27430D0; Wed, 21 Aug 2019 13:15:32 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875zms1ldm.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190821121532.4491A27430D0@ypsilon.sirena.org.uk>
Date: Wed, 21 Aug 2019 13:15:32 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Sridharan@sirena.co.uk, Ranjani <ranjani.sridharan@intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: remove unneeded dai_link
	check from snd_soc_remove_dai_link()" to the asoc tree
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

   ASoC: soc-core: remove unneeded dai_link check from snd_soc_remove_dai_link()

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

From c26a8841119826badc8d358a4266880f83359f26 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 20 Aug 2019 14:04:58 +0900
Subject: [PATCH] ASoC: soc-core: remove unneeded dai_link check from
 snd_soc_remove_dai_link()

snd_soc_remove_dai_link() has card connected dai_link check. but
	1) we need to call list_del() anyway,
	   because it is "remove" function,
	2) It is doing many thing for this card / dai_link already
	   before checking dai_link.

This patch removes poinless dai_link check

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/875zms1ldm.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index d428491d51a7..6df880be1622 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1182,8 +1182,6 @@ EXPORT_SYMBOL_GPL(snd_soc_add_dai_link);
 void snd_soc_remove_dai_link(struct snd_soc_card *card,
 			     struct snd_soc_dai_link *dai_link)
 {
-	struct snd_soc_dai_link *link, *_link;
-
 	if (dai_link->dobj.type
 	    && dai_link->dobj.type != SND_SOC_DOBJ_DAI_LINK) {
 		dev_err(card->dev, "Invalid dai link type %d\n",
@@ -1199,12 +1197,7 @@ void snd_soc_remove_dai_link(struct snd_soc_card *card,
 	if (dai_link->dobj.type && card->remove_dai_link)
 		card->remove_dai_link(card, dai_link);
 
-	for_each_card_links_safe(card, link, _link) {
-		if (link == dai_link) {
-			list_del(&link->list);
-			return;
-		}
-	}
+	list_del(&dai_link->list);
 }
 EXPORT_SYMBOL_GPL(snd_soc_remove_dai_link);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
