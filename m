Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F38182172
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:15:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFCB51671;
	Mon,  5 Aug 2019 18:14:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFCB51671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565021708;
	bh=XsjhuSu8zZU+VVA8x5HH7QK0lmTW0iLXKRamKI5ooSA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FsJvxcUv9yHxcKkPfgz0A0NWXbcOSiSSFxKNwh0E+C/xo7i+u42G0pnJIsD40T/8e
	 2NWLANFi8VJ7g5QEJoZhHZyrT3l1p6EWCP55kfleFLdTJaZJNuYms3MzKvqo6WgoVs
	 KgO3qEIqYm60nEqXlkQyPuFKdCRk551s4Pf2siEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 089ABF8063D;
	Mon,  5 Aug 2019 18:10:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 971C2F805F6; Mon,  5 Aug 2019 18:10:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 770F6F80535
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 770F6F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NRnJr0r/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=oqmYI0BFgLkEo6ij7Pk3uyZadTTblddNMNdlMBAjF1A=; b=NRnJr0r/NZTG
 9bl0/qD7gD3NApJnguUcoQ8HcHV4Fp7M6jEppH0Hc6M/RvlH/ZemnpeqjygGT6wv9VTLOtrVfzES+
 ojJZkX1Gxn+YZJr1tHvvQMvId83/gyhSZcNLZp6CwmUZj86Sn/itEnMfOxZ9YI2fvop0qe8Wggsqb
 36++A=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufYb-0000kP-HJ; Mon, 05 Aug 2019 16:09:57 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D98222742D06; Mon,  5 Aug 2019 17:09:56 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pnlx4d0a.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190805160956.D98222742D06@ypsilon.sirena.org.uk>
Date: Mon,  5 Aug 2019 17:09:56 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-component: add
	snd_soc_pcm_component_copy_user()" to the asoc tree
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

   ASoC: soc-component: add snd_soc_pcm_component_copy_user()

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

From 82d81f5cced36e480b581ae51c595e2deb9f2d56 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 26 Jul 2019 13:51:56 +0900
Subject: [PATCH] ASoC: soc-component: add snd_soc_pcm_component_copy_user()

Current ALSA SoC is directly using component->driver->ops->xxx,
thus, the code nested deeply, and it makes code difficult to read,
and is not good for encapsulation.

We want to implement component related function at soc-component.c,
but, some of them need to care whole snd_soc_pcm_runtime (= rtd)
connected component.

Let's call component related function which need to care with
for_each_rtdcom() loop as snd_soc_pcm_component_xxx().
This patch adds new snd_soc_pcm_component_copy_user() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87pnlx4d0a.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h |  3 +++
 sound/soc/soc-component.c     | 21 +++++++++++++++++++++
 sound/soc/soc-pcm.c           | 25 +------------------------
 3 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 5db4e5d028d0..6b95d2467053 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -374,5 +374,8 @@ int snd_soc_component_of_xlate_dai_name(struct snd_soc_component *component,
 int snd_soc_pcm_component_pointer(struct snd_pcm_substream *substream);
 int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
 				unsigned int cmd, void *arg);
+int snd_soc_pcm_component_copy_user(struct snd_pcm_substream *substream,
+				    int channel, unsigned long pos,
+				    void __user *buf, unsigned long bytes);
 
 #endif /* __SOC_COMPONENT_H */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index a6c0857a9e90..20897dce1bec 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -462,3 +462,24 @@ int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
 
 	return snd_pcm_lib_ioctl(substream, cmd, arg);
 }
+
+int snd_soc_pcm_component_copy_user(struct snd_pcm_substream *substream,
+				    int channel, unsigned long pos,
+				    void __user *buf, unsigned long bytes)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_rtdcom_list *rtdcom;
+	struct snd_soc_component *component;
+
+	for_each_rtdcom(rtd, rtdcom) {
+		component = rtdcom->component;
+
+		/* FIXME. it returns 1st copy now */
+		if (component->driver->ops &&
+		    component->driver->ops->copy_user)
+			return component->driver->ops->copy_user(
+				substream, channel, pos, buf, bytes);
+	}
+
+	return -EINVAL;
+}
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 12377b8d41c2..b0e6ce89b012 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2818,29 +2818,6 @@ static void soc_pcm_private_free(struct snd_pcm *pcm)
 	}
 }
 
-static int soc_rtdcom_copy_user(struct snd_pcm_substream *substream, int channel,
-				unsigned long pos, void __user *buf,
-				unsigned long bytes)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_rtdcom_list *rtdcom;
-	struct snd_soc_component *component;
-
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
-		if (!component->driver->ops ||
-		    !component->driver->ops->copy_user)
-			continue;
-
-		/* FIXME. it returns 1st copy now */
-		return component->driver->ops->copy_user(substream, channel,
-							 pos, buf, bytes);
-	}
-
-	return -EINVAL;
-}
-
 static struct page *soc_rtdcom_page(struct snd_pcm_substream *substream,
 				    unsigned long offset)
 {
@@ -3011,7 +2988,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 			continue;
 
 		if (ops->copy_user)
-			rtd->ops.copy_user	= soc_rtdcom_copy_user;
+			rtd->ops.copy_user	= snd_soc_pcm_component_copy_user;
 		if (ops->page)
 			rtd->ops.page		= soc_rtdcom_page;
 		if (ops->mmap)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
