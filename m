Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEBB8219A
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:24:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D5DF1686;
	Mon,  5 Aug 2019 18:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D5DF1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565022246;
	bh=uLr+qx1nIQ/D8FswFhYzcasb/kfPvSs2HT1L0ukT+S4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=k2uG8ru27bB1ggKVHh2SPYsJMhag5i10jb1JUhc2bcdsDeG4OZEw8FnTK0ud/SAlf
	 z54Vf9SoOdWnWqpWu9UWnurxrWw29BlZhGW1l9dFss5Dn3FfKhN8tMVcYLXT0rajxL
	 Aacgv5sSyykHF7Ug6VgE7X0FTRQejiJqhZyFPSzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 398A4F80766;
	Mon,  5 Aug 2019 18:10:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EFCFF80672; Mon,  5 Aug 2019 18:10:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AD4AF805FA
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AD4AF805FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="g/t5S4/K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=mScuriJv+pArFDyObVr00MyxqxLjSg/fE8Llf1kgmEE=; b=g/t5S4/KHw+l
 /yrtEp7RWZAwlJTlOJUmmqZau6yKFq9yG2krN2XFwubdr+Sf0A3TwXtOzSfdPQPZeAjh6oZ4s0woV
 hsljqpvfJYSXngJgov3Ovx9E9juGIJvr+S65RJQbiu+xRDLYb+6BXewv/0hlzEZSOpY5SyQ7z8/rf
 R+mWw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufYe-0000lg-Rf; Mon, 05 Aug 2019 16:10:00 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 461F62742EB0; Mon,  5 Aug 2019 17:10:00 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a7d15rna.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190805161000.461F62742EB0@ypsilon.sirena.org.uk>
Date: Mon,  5 Aug 2019 17:10:00 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-component: add
	snd_soc_component_hw_free()" to the asoc tree
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

   ASoC: soc-component: add snd_soc_component_hw_free()

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

From eae7136aa2083699c69de5890fd6c32c501952b5 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 26 Jul 2019 13:50:24 +0900
Subject: [PATCH] ASoC: soc-component: add snd_soc_component_hw_free()

Current ALSA SoC is directly using component->driver->ops->xxx,
thus, it is deep nested, and makes code difficult to read,
and is not good for encapsulation.
This patch adds new snd_soc_component_hw_free() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87a7d15rna.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h |  2 ++
 sound/soc/soc-component.c     | 10 ++++++++++
 sound/soc/soc-pcm.c           |  9 +++------
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 778a6e7d352d..fbcd911ac25e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -348,5 +348,7 @@ int snd_soc_component_prepare(struct snd_soc_component *component,
 int snd_soc_component_hw_params(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params);
+int snd_soc_component_hw_free(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream);
 
 #endif /* __SOC_COMPONENT_H */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 7b6456370da5..e2bc34efe547 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -326,3 +326,13 @@ int snd_soc_component_hw_params(struct snd_soc_component *component,
 
 	return 0;
 }
+
+int snd_soc_component_hw_free(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream)
+{
+	if (component->driver->ops &&
+	    component->driver->ops->hw_free)
+		return component->driver->ops->hw_free(substream);
+
+	return 0;
+}
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8be1d22dc87a..8c5289904f20 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -847,6 +847,7 @@ static int soc_pcm_components_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
+	int ret = 0;
 
 	for_each_rtdcom(rtd, rtdcom) {
 		component = rtdcom->component;
@@ -854,14 +855,10 @@ static int soc_pcm_components_hw_free(struct snd_pcm_substream *substream,
 		if (component == last)
 			break;
 
-		if (!component->driver->ops ||
-		    !component->driver->ops->hw_free)
-			continue;
-
-		component->driver->ops->hw_free(substream);
+		ret |= snd_soc_component_hw_free(component, substream);
 	}
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
