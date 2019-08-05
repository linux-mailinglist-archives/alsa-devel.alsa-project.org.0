Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EDF82164
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:11:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC5471666;
	Mon,  5 Aug 2019 18:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC5471666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565021507;
	bh=lhEWQ2x9RKULZrIVCXH0lRPOqOUkbs7TIdfRUEJ1uKM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gh/xkxIva/BPnjSBru0xwXo01kHaVb6cgJ0sHYkgI3qtBRm8gDcOgr3CNCqu3dPRv
	 OyA2yhHdc744drUeiANs3j2egzshmkU/gkIPwY7zCMZM2g4jQUqY9tfJR0DSSEMPDd
	 gEtf3NADhx37mI5uYA9h70BciHimKvGTvbviZJIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1E39F8060D;
	Mon,  5 Aug 2019 18:10:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66E11F805DF; Mon,  5 Aug 2019 18:10:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA787F8011B
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:09:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA787F8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="lNS7JLqz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=nTbStLvnq9HBdLi08gtUbhhQxuaGYkYk2MCkJ0zWXYA=; b=lNS7JLqz4DVE
 0Txwcqff6eUgy/ThPOgGkQICqcQlbUeNOTuoJN/bDFakJ3EUfuUrRiYCf4PysrF/a1FOmUpl4kB+/
 Kg78qSsJbHlze3TyzpvsOYWfyl0oBmTJ9HhAmwW/S45zvxWXxJ9vN7YbwWGnEfkH3/lqaU06Ej3xB
 67M/c=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufYa-0000kH-OK; Mon, 05 Aug 2019 16:09:56 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2E16A2742E44; Mon,  5 Aug 2019 17:09:56 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfwl4czy.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190805160956.2E16A2742E44@ypsilon.sirena.org.uk>
Date: Mon,  5 Aug 2019 17:09:56 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-component: add
	snd_soc_pcm_component_pcm_new()" to the asoc tree
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

   ASoC: soc-component: add snd_soc_pcm_component_pcm_new()

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

From 7484291e9b7564af65b2581dcdebeeaf98bc86d0 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 26 Jul 2019 13:52:08 +0900
Subject: [PATCH] ASoC: soc-component: add snd_soc_pcm_component_pcm_new()

Current ALSA SoC is directly using component->driver->xxx,
thus, the code nested deeply, and it makes code difficult to read,
and is not good for encapsulation.

We want to implement component related function at soc-component.c,
but, some of them need to care whole snd_soc_pcm_runtime (= rtd)
connected component.

Let's call component related function which need to care with
for_each_rtdcom() loop as snd_soc_pcm_component_xxx().
This patch adds new snd_soc_pcm_component_pcm() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87lfwl4czy.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h |  1 +
 sound/soc/soc-component.c     | 20 ++++++++++++++++++++
 sound/soc/soc-pcm.c           | 18 ++++--------------
 3 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index dd1ea5d71998..d3048ad06582 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -381,5 +381,6 @@ struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
 					unsigned long offset);
 int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
 			       struct vm_area_struct *vma);
+int snd_soc_pcm_component_new(struct snd_pcm *pcm);
 
 #endif /* __SOC_COMPONENT_H */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 2aff1b087522..ff13d901bbab 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -525,3 +525,23 @@ int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
 
 	return -EINVAL;
 }
+
+int snd_soc_pcm_component_new(struct snd_pcm *pcm)
+{
+	struct snd_soc_pcm_runtime *rtd = pcm->private_data;
+	struct snd_soc_rtdcom_list *rtdcom;
+	struct snd_soc_component *component;
+	int ret;
+
+	for_each_rtdcom(rtd, rtdcom) {
+		component = rtdcom->component;
+
+		if (component->driver->pcm_new) {
+			ret = component->driver->pcm_new(rtd);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return 0;
+}
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7bbee0d71942..955c49fd3bda 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2823,7 +2823,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 {
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct snd_soc_component *component;
 	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_pcm *pcm;
 	char new_name[64];
@@ -2956,19 +2955,10 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	if (capture)
 		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &rtd->ops);
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
-		if (!component->driver->pcm_new)
-			continue;
-
-		ret = component->driver->pcm_new(rtd);
-		if (ret < 0) {
-			dev_err(component->dev,
-				"ASoC: pcm constructor failed: %d\n",
-				ret);
-			return ret;
-		}
+	ret = snd_soc_pcm_component_new(pcm);
+	if (ret < 0) {
+		dev_err(rtd->dev, "ASoC: pcm constructor failed: %d\n", ret);
+		return ret;
 	}
 
 	pcm->private_free = soc_pcm_private_free;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
