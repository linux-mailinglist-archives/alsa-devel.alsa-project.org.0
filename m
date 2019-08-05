Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C98AE8216A
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:13:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A71510E;
	Mon,  5 Aug 2019 18:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A71510E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565021602;
	bh=826ySJqfTCZ8bUsxGMSGinEWiWAHScjbdLLAjnYRqRI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=S8ymKZG3sSvJgyYSnmO91r3Aa0GYdxwv5KallT1+B8RD2KykUwNJwxbCe8G3NwPy8
	 vdan/J4/ZPc/qjHFE6Na7bBCJZcVIYLtJyp1qzXGyly500nqztaKL1eqw5aO0Hwrte
	 4GAtfU1Ch4uXB93aZ8mW2vCMg7dt1koyHjmPQaiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60C32F805F6;
	Mon,  5 Aug 2019 18:10:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A909F80639; Mon,  5 Aug 2019 18:10:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76CF5F800F3
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76CF5F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="se0uKXe5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=G4A/eE3nALtvlk7UkcBiCxEBcbQBgH3av7hhgwhWgws=; b=se0uKXe5BzWF
 k+WOPM/nSZe6/7ZMtPpHF2/QCmAwzCOFzd7o14BRiQ+RgCm15oFCl6+RsV2cjG4CDku+dRmfNnjeQ
 xqtwRZ+vY+8x69kMQ1vE2zOZxPE7UN1BgUvGsClEJjCITe/XdOwQKnhYFaX/iQajZjOIfuVoEFKtl
 lAkm0=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufYb-0000kJ-D3; Mon, 05 Aug 2019 16:09:57 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A05B62742EB3; Mon,  5 Aug 2019 17:09:56 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o91h4d06.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190805160956.A05B62742EB3@ypsilon.sirena.org.uk>
Date: Mon,  5 Aug 2019 17:09:56 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-component: add
	snd_soc_pcm_component_page()" to the asoc tree
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

   ASoC: soc-component: add snd_soc_pcm_component_page()

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

From 9c712e4f57229081e837d593fc1e4183b068a41c Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 26 Jul 2019 13:52:00 +0900
Subject: [PATCH] ASoC: soc-component: add snd_soc_pcm_component_page()

Current ALSA SoC is directly using component->driver->ops->xxx,
thus, the code nested deeply, and it makes code difficult to read,
and is not good for encapsulation.

We want to implement component related function at soc-component.c,
but, some of them need to care whole snd_soc_pcm_runtime (= rtd)
connected component.

Let's call component related function which need to care with
for_each_rtdcom() loop as snd_soc_pcm_component_xxx().
This patch adds new snd_soc_pcm_component_page() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87o91h4d06.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h |  2 ++
 sound/soc/soc-component.c     | 23 +++++++++++++++++++++++
 sound/soc/soc-pcm.c           | 26 +-------------------------
 3 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 6b95d2467053..4cab257962a6 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -377,5 +377,7 @@ int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
 int snd_soc_pcm_component_copy_user(struct snd_pcm_substream *substream,
 				    int channel, unsigned long pos,
 				    void __user *buf, unsigned long bytes);
+struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
+					unsigned long offset);
 
 #endif /* __SOC_COMPONENT_H */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 20897dce1bec..d503bc9b0850 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -483,3 +483,26 @@ int snd_soc_pcm_component_copy_user(struct snd_pcm_substream *substream,
 
 	return -EINVAL;
 }
+
+struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
+					unsigned long offset)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_rtdcom_list *rtdcom;
+	struct snd_soc_component *component;
+	struct page *page;
+
+	for_each_rtdcom(rtd, rtdcom) {
+		component = rtdcom->component;
+
+		/* FIXME. it returns 1st page now */
+		if (component->driver->ops &&
+		    component->driver->ops->page) {
+			page = component->driver->ops->page(substream, offset);
+			if (page)
+				return page;
+		}
+	}
+
+	return NULL;
+}
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index b0e6ce89b012..fe34f2e5d75e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2818,30 +2818,6 @@ static void soc_pcm_private_free(struct snd_pcm *pcm)
 	}
 }
 
-static struct page *soc_rtdcom_page(struct snd_pcm_substream *substream,
-				    unsigned long offset)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_rtdcom_list *rtdcom;
-	struct snd_soc_component *component;
-	struct page *page;
-
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
-		if (!component->driver->ops ||
-		    !component->driver->ops->page)
-			continue;
-
-		/* FIXME. it returns 1st page now */
-		page = component->driver->ops->page(substream, offset);
-		if (page)
-			return page;
-	}
-
-	return NULL;
-}
-
 static int soc_rtdcom_mmap(struct snd_pcm_substream *substream,
 			   struct vm_area_struct *vma)
 {
@@ -2990,7 +2966,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		if (ops->copy_user)
 			rtd->ops.copy_user	= snd_soc_pcm_component_copy_user;
 		if (ops->page)
-			rtd->ops.page		= soc_rtdcom_page;
+			rtd->ops.page		= snd_soc_pcm_component_page;
 		if (ops->mmap)
 			rtd->ops.mmap		= soc_rtdcom_mmap;
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
