Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A54CFA8E
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 14:56:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD6DE1616;
	Tue,  8 Oct 2019 14:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD6DE1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570539362;
	bh=FYbkcgpuKrHp4A/FDOq9LA2pc3gfbjqxOQRNFNU/fJ8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fyV/2JdtJA1y+TBsbl4DlLt+Oxc1eKBndOCxUe9nN1jd3MxLlWN+JiQaGcKj02dTJ
	 rbJRxDQquVW5HfC0D38stc+E6GLPP4/iUTfztY7UVOrCb/ZwmeksknGfg3wwZdUHCm
	 1XJhJIcDH09eR/VWSAlMrRqjugPWCooUCuwzKTr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EA1EF80675;
	Tue,  8 Oct 2019 14:53:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED215F8060D; Tue,  8 Oct 2019 14:53:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_76,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 285AAF80135
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 285AAF80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ZV2hmTSd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ewo5iu06OAf4rYtCITH+byYPpmkJT0waO5AZ/gRoIs8=; b=ZV2hmTSdZzFu
 xDjPrAlZbPodkkFrHL+c7s+Auah9T4Xu3Rm8O0YBp7MY9b4uxgiajwRU3ZvBU+dywHD7T9sE/SKWS
 wdWBfCYfeDsursi5HlAI7BFNzmXpSi5SDIuhAJCett/YuKorpaPnSGML6DszzX/DXIege8cNr84vE
 O9NEc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozV-0008Ly-4z; Tue, 08 Oct 2019 12:53:25 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 924112740D48; Tue,  8 Oct 2019 13:53:24 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8736gb90by.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125324.924112740D48@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:24 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-component: remove snd_pcm_ops from
	component driver" to the asoc tree
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

   ASoC: soc-component: remove snd_pcm_ops from component driver

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

From e9067bb502787869dabe385727baff233024097b Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:35:13 +0900
Subject: [PATCH] ASoC: soc-component: remove snd_pcm_ops from component driver

No driver is using snd_pcm_ops on component driver.
This patch removes it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/8736gb90by.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h |  5 ---
 sound/soc/soc-component.c     | 77 -----------------------------------
 sound/soc/soc-pcm.c           | 10 ++---
 3 files changed, 3 insertions(+), 89 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index aa2e2cbc1ee5..6aa3ecb7b6d3 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -46,11 +46,7 @@ struct snd_soc_component_driver {
 	int (*write)(struct snd_soc_component *component,
 		     unsigned int reg, unsigned int val);
 
-	/* remove me */
 	/* pcm creation and destruction */
-	int (*pcm_new)(struct snd_soc_pcm_runtime *rtd);
-	void (*pcm_free)(struct snd_pcm *pcm);
-
 	int (*pcm_construct)(struct snd_soc_component *component,
 			     struct snd_soc_pcm_runtime *rtd);
 	void (*pcm_destruct)(struct snd_soc_component *component,
@@ -110,7 +106,6 @@ struct snd_soc_component_driver {
 		    struct snd_pcm_substream *substream,
 		    struct vm_area_struct *vma);
 
-	const struct snd_pcm_ops *ops;
 	const struct snd_compr_ops *compr_ops;
 
 	/* probe ordering - for components with runtime dependencies */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index d2b052ac88cd..debaf1f6f403 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -316,12 +316,6 @@ int snd_soc_component_open(struct snd_soc_component *component,
 {
 	if (component->driver->open)
 		return component->driver->open(component, substream);
-
-	/* remove me */
-	if (component->driver->ops &&
-	    component->driver->ops->open)
-		return component->driver->ops->open(substream);
-
 	return 0;
 }
 
@@ -330,12 +324,6 @@ int snd_soc_component_close(struct snd_soc_component *component,
 {
 	if (component->driver->close)
 		return component->driver->close(component, substream);
-
-	/* remove me */
-	if (component->driver->ops &&
-	    component->driver->ops->close)
-		return component->driver->ops->close(substream);
-
 	return 0;
 }
 
@@ -344,12 +332,6 @@ int snd_soc_component_prepare(struct snd_soc_component *component,
 {
 	if (component->driver->prepare)
 		return component->driver->prepare(component, substream);
-
-	/* remove me */
-	if (component->driver->ops &&
-	    component->driver->ops->prepare)
-		return component->driver->ops->prepare(substream);
-
 	return 0;
 }
 
@@ -360,12 +342,6 @@ int snd_soc_component_hw_params(struct snd_soc_component *component,
 	if (component->driver->hw_params)
 		return component->driver->hw_params(component,
 						    substream, params);
-
-	/* remove me */
-	if (component->driver->ops &&
-	    component->driver->ops->hw_params)
-		return component->driver->ops->hw_params(substream, params);
-
 	return 0;
 }
 
@@ -374,12 +350,6 @@ int snd_soc_component_hw_free(struct snd_soc_component *component,
 {
 	if (component->driver->hw_free)
 		return component->driver->hw_free(component, substream);
-
-	/* remove me */
-	if (component->driver->ops &&
-	    component->driver->ops->hw_free)
-		return component->driver->ops->hw_free(substream);
-
 	return 0;
 }
 
@@ -389,12 +359,6 @@ int snd_soc_component_trigger(struct snd_soc_component *component,
 {
 	if (component->driver->trigger)
 		return component->driver->trigger(component, substream, cmd);
-
-	/* remove me */
-	if (component->driver->ops &&
-	    component->driver->ops->trigger)
-		return component->driver->ops->trigger(substream, cmd);
-
 	return 0;
 }
 
@@ -462,11 +426,6 @@ int snd_soc_pcm_component_pointer(struct snd_pcm_substream *substream)
 		/* FIXME: use 1st pointer */
 		if (component->driver->pointer)
 			return component->driver->pointer(component, substream);
-
-		/* remove me */
-		if (component->driver->ops &&
-		    component->driver->ops->pointer)
-			return component->driver->ops->pointer(substream);
 	}
 
 	return 0;
@@ -486,12 +445,6 @@ int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
 		if (component->driver->ioctl)
 			return component->driver->ioctl(component, substream,
 							cmd, arg);
-
-		/* remove me */
-		if (component->driver->ops &&
-		    component->driver->ops->ioctl)
-			return component->driver->ops->ioctl(substream,
-							     cmd, arg);
 	}
 
 	return snd_pcm_lib_ioctl(substream, cmd, arg);
@@ -512,12 +465,6 @@ int snd_soc_pcm_component_copy_user(struct snd_pcm_substream *substream,
 		if (component->driver->copy_user)
 			return component->driver->copy_user(
 				component, substream, channel, pos, buf, bytes);
-
-		/* remove me */
-		if (component->driver->ops &&
-		    component->driver->ops->copy_user)
-			return component->driver->ops->copy_user(
-				substream, channel, pos, buf, bytes);
 	}
 
 	return -EINVAL;
@@ -541,14 +488,6 @@ struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
 			if (page)
 				return page;
 		}
-
-		/* remove me */
-		if (component->driver->ops &&
-		    component->driver->ops->page) {
-			page = component->driver->ops->page(substream, offset);
-			if (page)
-				return page;
-		}
 	}
 
 	return NULL;
@@ -568,11 +507,6 @@ int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
 		if (component->driver->mmap)
 			return component->driver->mmap(component,
 						       substream, vma);
-
-		/* remove me */
-		if (component->driver->ops &&
-		    component->driver->ops->mmap)
-			return component->driver->ops->mmap(substream, vma);
 	}
 
 	return -EINVAL;
@@ -593,13 +527,6 @@ int snd_soc_pcm_component_new(struct snd_pcm *pcm)
 			if (ret < 0)
 				return ret;
 		}
-
-		/* remove me */
-		if (component->driver->pcm_new) {
-			ret = component->driver->pcm_new(rtd);
-			if (ret < 0)
-				return ret;
-		}
 	}
 
 	return 0;
@@ -616,9 +543,5 @@ void snd_soc_pcm_component_free(struct snd_pcm *pcm)
 
 		if (component->driver->pcm_destruct)
 			component->driver->pcm_destruct(component, pcm);
-
-		/* remove me */
-		if (component->driver->pcm_free)
-			component->driver->pcm_free(pcm);
 	}
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index dbf67d8a5411..f462947a5d27 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2988,16 +2988,12 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 
 	for_each_rtdcom(rtd, rtdcom) {
 		const struct snd_soc_component_driver *drv = rtdcom->component->driver;
-		const struct snd_pcm_ops *ops = drv->ops;
 
-		if (!ops)
-			continue;
-
-		if (ops->copy_user || drv->copy_user)
+		if (drv->copy_user)
 			rtd->ops.copy_user	= snd_soc_pcm_component_copy_user;
-		if (ops->page || drv->page)
+		if (drv->page)
 			rtd->ops.page		= snd_soc_pcm_component_page;
-		if (ops->mmap || drv->mmap)
+		if (drv->mmap)
 			rtd->ops.mmap		= snd_soc_pcm_component_mmap;
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
