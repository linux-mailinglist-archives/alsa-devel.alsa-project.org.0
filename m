Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A29A4CC230
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 19:55:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C1C0168D;
	Fri,  4 Oct 2019 19:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C1C0168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570211737;
	bh=GpWJrgqI3VPiojB77Qv/b1RNk2N9jo15OGAecBievZY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=h/T6KLIdVPEomncAEBRFfLSpvygti63SxqlyFca1WPRJOBjDSJLzxAXHUMP4jGil/
	 XUtdS9AJ6Xp2j0EqmgLONq9HH9nbGXBvHtGVLJCuD+d19IeUr24jldR0QCMTWko2+a
	 uHKV2TxIeUtmQGLWPaGjL247vx5qeVCU7BdppFyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AC8AF805AA;
	Fri,  4 Oct 2019 19:52:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0DE5F8060D; Fri,  4 Oct 2019 19:52:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08A8AF80391
 for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2019 19:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08A8AF80391
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="iwGfXuXU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=W7xN7P/YlyjvxtbdrBs+yyThWLCVeMKwOLbG3H/F1VM=; b=iwGfXuXU4mF4
 9I1Tsndikk+NeyPOctWGBFuAr7O4I+SFeQC403FWSV7b1R6/3FGWSHxmfY88asiS714WiYKXKnAGB
 tSkLk62fSY45aRm2Fyyafc4VfnLAEzEwQz1Y/Kik/5FgwXNr0J1HLSwk7B2BKovZJWpsKoDuGxbwc
 GQ+h0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iGRkp-0003ul-5i; Fri, 04 Oct 2019 17:52:35 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A9D9D27420B6; Fri,  4 Oct 2019 18:52:34 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8736gbbu1a.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191004175234.A9D9D27420B6@ypsilon.sirena.org.uk>
Date: Fri,  4 Oct 2019 18:52:34 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: use devm_xxx for component
	related resource" to the asoc tree
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

   ASoC: soc-core: use devm_xxx for component related resource

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

From 50014499e6a45edd7ba1facf2133c03bbc7d8266 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:22:57 +0900
Subject: [PATCH] ASoC: soc-core: use devm_xxx for component related resource

dai / component related resources are created when component is
registered, and it will be freed when component was unregistered.
These resources are not re-used after that.
This means, we can use devm_xxx for dai / component, without
thinking about kfree().
This patch uses devm_xxx for these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/8736gbbu1a.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f79ffc4b5b57..2c2803e6544b 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2506,7 +2506,7 @@ static char *fmt_single_name(struct device *dev, int *id)
 			*id = 0;
 	}
 
-	return kstrdup(name, GFP_KERNEL);
+	return devm_kstrdup(dev, name, GFP_KERNEL);
 }
 
 /*
@@ -2523,7 +2523,7 @@ static inline char *fmt_multiple_name(struct device *dev,
 		return NULL;
 	}
 
-	return kstrdup(dai_drv->name, GFP_KERNEL);
+	return devm_kstrdup(dev, dai_drv->name, GFP_KERNEL);
 }
 
 /**
@@ -2539,8 +2539,6 @@ static void snd_soc_unregister_dais(struct snd_soc_component *component)
 		dev_dbg(component->dev, "ASoC: Unregistered DAI '%s'\n",
 			dai->name);
 		list_del(&dai->list);
-		kfree(dai->name);
-		kfree(dai);
 	}
 }
 
@@ -2554,7 +2552,7 @@ static struct snd_soc_dai *soc_add_dai(struct snd_soc_component *component,
 
 	dev_dbg(dev, "ASoC: dynamically register DAI %s\n", dev_name(dev));
 
-	dai = kzalloc(sizeof(struct snd_soc_dai), GFP_KERNEL);
+	dai = devm_kzalloc(dev, sizeof(*dai), GFP_KERNEL);
 	if (dai == NULL)
 		return NULL;
 
@@ -2576,10 +2574,8 @@ static struct snd_soc_dai *soc_add_dai(struct snd_soc_component *component,
 		else
 			dai->id = component->num_dai;
 	}
-	if (dai->name == NULL) {
-		kfree(dai);
+	if (!dai->name)
 		return NULL;
-	}
 
 	dai->component = component;
 	dai->dev = dev;
@@ -2765,7 +2761,6 @@ static void snd_soc_component_add(struct snd_soc_component *component)
 static void snd_soc_component_cleanup(struct snd_soc_component *component)
 {
 	snd_soc_unregister_dais(component);
-	kfree(component->name);
 }
 
 static void snd_soc_component_del_unlocked(struct snd_soc_component *component)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
