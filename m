Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E39104209
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 18:24:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1526D1742;
	Wed, 20 Nov 2019 18:23:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1526D1742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574270677;
	bh=4AZROMQ03TvW+fWhS7eR7/BmojPvr6yxbacWEcM5id0=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tqTnvkWGbQDzMtcsWcdiNfrDej3etD7fDXFJgbkfsVw6g96NXqavUEEFf4KOWWy/I
	 fmCECGxLhc7akphr0U7SLahWhW/FRxjH4BuxU5Oj/d1MReygLJ0ZwS6/PUfGrD+15V
	 kG3GIw7K3VEDcN1bjcJMOe52J8Snhn0oO7EgTphY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA030F8021C;
	Wed, 20 Nov 2019 18:18:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 243E5F801F7; Wed, 20 Nov 2019 18:18:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A905FF801DA
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 18:18:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A905FF801DA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BBD91045;
 Wed, 20 Nov 2019 09:18:19 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 078013F703;
 Wed, 20 Nov 2019 09:18:18 -0800 (PST)
Date: Wed, 20 Nov 2019 17:18:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pnhqx89j.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87pnhqx89j.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Takashi Iwai <tiwai@suse.de>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-component: tidyup
	snd_soc_pcm_component_new/free() parameter" to the asoc tree
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

   ASoC: soc-component: tidyup snd_soc_pcm_component_new/free() parameter

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

From b2b2afbb48eac7215f951a8a462aa6837e0d495f Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 18 Nov 2019 10:50:32 +0900
Subject: [PATCH] ASoC: soc-component: tidyup snd_soc_pcm_component_new/free()
 parameter

This patch uses rtd instead of pcm at snd_soc_pcm_component_new/free()
parameter.
This is prepare for dai_link remove bug fix on topology.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87pnhqx89j.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h | 4 ++--
 sound/soc/soc-component.c     | 8 +++-----
 sound/soc/soc-pcm.c           | 4 ++--
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 6aa3ecb7b6d3..f8fadf0e696a 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -412,7 +412,7 @@ struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
 					unsigned long offset);
 int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
 			       struct vm_area_struct *vma);
-int snd_soc_pcm_component_new(struct snd_pcm *pcm);
-void snd_soc_pcm_component_free(struct snd_pcm *pcm);
+int snd_soc_pcm_component_new(struct snd_soc_pcm_runtime *rtd);
+void snd_soc_pcm_component_free(struct snd_soc_pcm_runtime *rtd);
 
 #endif /* __SOC_COMPONENT_H */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 98ef0666add2..1590e805d016 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -498,9 +498,8 @@ int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
 	return -EINVAL;
 }
 
-int snd_soc_pcm_component_new(struct snd_pcm *pcm)
+int snd_soc_pcm_component_new(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_pcm_runtime *rtd = pcm->private_data;
 	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
 	int ret;
@@ -516,13 +515,12 @@ int snd_soc_pcm_component_new(struct snd_pcm *pcm)
 	return 0;
 }
 
-void snd_soc_pcm_component_free(struct snd_pcm *pcm)
+void snd_soc_pcm_component_free(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_pcm_runtime *rtd = pcm->private_data;
 	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
 
 	for_each_rtd_components(rtd, rtdcom, component)
 		if (component->driver->pcm_destruct)
-			component->driver->pcm_destruct(component, pcm);
+			component->driver->pcm_destruct(component, rtd->pcm);
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 4bf71e3211d8..c624d30bfa3c 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2898,7 +2898,7 @@ static void soc_pcm_private_free(struct snd_pcm *pcm)
 
 	/* need to sync the delayed work before releasing resources */
 	flush_delayed_work(&rtd->delayed_work);
-	snd_soc_pcm_component_free(pcm);
+	snd_soc_pcm_component_free(rtd);
 }
 
 /* create a new pcm */
@@ -3036,7 +3036,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	if (capture)
 		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &rtd->ops);
 
-	ret = snd_soc_pcm_component_new(pcm);
+	ret = snd_soc_pcm_component_new(rtd);
 	if (ret < 0) {
 		dev_err(rtd->dev, "ASoC: pcm constructor failed: %d\n", ret);
 		return ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
