Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B464C3381
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 13:56:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E4D51697;
	Tue,  1 Oct 2019 13:55:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E4D51697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569930992;
	bh=fT/PPtRaugfQAcZiWLM20i36oX7nK/dh4+NmrksbZTw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fRT1x/kEMN0iSMHBMYEEmpuPDIiTS7+X5DHbOihOIUnxK6jfvnju6cckkXChJf8vS
	 L7esrg9p6xDx9wKe5MajKYQDlyrqWIkNpo9146ZTNJgF70bWaV5W/oHAIYa6V2+G+7
	 3khQsFQuiWBOiagfz05TUoD5hbQ5KL03ELMYf6Kk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDF1CF807B6;
	Tue,  1 Oct 2019 13:41:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1549BF806F8; Tue,  1 Oct 2019 13:41:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 377BDF8060E
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:40:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 377BDF8060E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="DUqfxJbi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=8nMn8gEQ+9MKG5ZTufxED68MVKTLjmFvVViM3Zd+HeE=; b=DUqfxJbiK4x7
 SDvZ6K3A3ydXtW5NrKboesXXcNYFZWF3eNbD+m3GkXKOVDwvPa6OcG9zF1FwaHGMTcy1iHukTpb3d
 2OYHt8kqJOml8G4Gjiq5qQdgx7yxk6tgHcp1E+18pLLpOVvZKWZAzSUZ/1FUb8CBIx2/rIT7eGfyG
 Xgy94=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWQ-0004UM-Hh; Tue, 01 Oct 2019 11:40:50 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DCC102742A10; Tue,  1 Oct 2019 12:40:49 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ef0mf7sl.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114049.DCC102742A10@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:49 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: merge soc_add_pcm_runtime()
	into soc_new_pcm_runtime()" to the asoc tree
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

   ASoC: soc-core: merge soc_add_pcm_runtime() into soc_new_pcm_runtime()

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

From a848125e320a154dfc17b9a377361b4b0df87363 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 12 Sep 2019 13:38:34 +0900
Subject: [PATCH] ASoC: soc-core: merge soc_add_pcm_runtime() into
 soc_new_pcm_runtime()

We have soc_new_pcm_runtime() which allocs rtd and its related memory,
and     soc_add_pcm_runtime() which connects rtd to card.

But we don't need to separate these, we can alloc and connect rtd
in the same time.

Current implementation is just makes code complex.
This patch merges these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87ef0mf7sl.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 96d38db8b578..cadf96bc0097 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -385,16 +385,12 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 		return NULL;
 	}
 
-	return rtd;
-}
-
-static void soc_add_pcm_runtime(struct snd_soc_card *card,
-		struct snd_soc_pcm_runtime *rtd)
-{
 	/* see for_each_card_rtds */
 	list_add_tail(&rtd->list, &card->rtd_list);
 	rtd->num = card->num_rtd;
 	card->num_rtd++;
+
+	return rtd;
 }
 
 static void soc_remove_pcm_runtimes(struct snd_soc_card *card)
@@ -930,7 +926,6 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
 		}
 	}
 
-	soc_add_pcm_runtime(card, rtd);
 	return 0;
 
 _err_defer:
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
