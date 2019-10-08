Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC18CFB3F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:23:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89FF01687;
	Tue,  8 Oct 2019 15:23:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89FF01687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570541034;
	bh=wbkpA9FcYt3oY7QTSaxHwFqk0UatmgtybPvUS5JhGFM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=V5WnLYqdLVy0NEmuyM/tLGmydMkEIcgzuuz9QkOAY+1SeSgYoUjqScrcrAkCn3ljg
	 4CWe3qDNFABW37pa8zYd6QR51IKs5rDY2UBFLDmbA3bDPQgFbFQE7LOgDDvGJ+J9uA
	 fsfzh/p6pmONXm5t6GAw+7Z65HpnKMQ5IQw0E+VM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2F65F896B4;
	Tue,  8 Oct 2019 14:54:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 642BAF807B6; Tue,  8 Oct 2019 14:54:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAA3CF80672
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAA3CF80672
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="UisTIHK0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=IcGne/sO4FBbDiyd7J5TBQUFh61dv4nX2MCo/gvJzQA=; b=UisTIHK0zSc3
 R133xDYFBCNAJYzt4nz/HEqllzof1OdeOxf4sRao3iy72U0teTsj77cAcIbrPPcHIQDsbU0ykoF7Q
 xp2jsOoOz2iqaLlNSx+48E1zlltVKoZXY07zxJoqf3C7p33jd/YUXfBB1/utAoUQiJgjMqerXA8iW
 CjGO8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozf-0008Pu-8F; Tue, 08 Oct 2019 12:53:35 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id BBBC62740D48; Tue,  8 Oct 2019 13:53:34 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tv8raf3r.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125334.BBBC62740D48@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:34 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: merge snd_pcm_ops member to
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

   ASoC: soc-core: merge snd_pcm_ops member to component driver

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

From e2cb4a14541dba3587bb78e0f62da27a0e1ad399 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:30:48 +0900
Subject: [PATCH] ASoC: soc-core: merge snd_pcm_ops member to component driver

Current snd_soc_component_driver has snd_pcm_ops, and each driver can
have callback via it (1).
But, it is mainly created for ALSA, thus, it doesn't have "component"
as parameter for ALSA SoC (1)(2).
Thus, each callback can't know it is called for which component.
Thus, each callback currently is getting "component" by using
snd_soc_rtdcom_lookup() with driver name (3).

	--- ALSA SoC  ---
	...
	if (component->driver->ops &&
	    component->driver->ops->open)
(1)		return component->driver->ops->open(substream);
	...

	--- driver ---
(2)	static int xxx_open(struct snd_pcm_substream *substream)
	{
		struct snd_soc_pcm_runtime *rtd = substream->private_data;
(3)		struct snd_soc_component *component = snd_soc_rtdcom_lookup(..);
		...
	}

It works today, but, will not work in the future if we support multi
CPU/Codec/Platform, because 1 rtd might have multiple components which
have same driver name.

To solve this issue, each callback needs to be called with component.
We already have many component driver callback.
This patch copies each snd_pcm_ops member under component driver,
and having "component" as parameter.

	--- ALSA SoC  ---
	...
	if (component->driver->open)
=>		return component->driver->open(component, substream);
	...

	--- driver ---
=>	static int xxx_open(struct snd_soc_component *component,
			    struct snd_pcm_substream *substream)
	{
		...
	}

*Note*

Only Intel skl-pcm has .get_time_info implementation, but ALSA SoC
framework doesn't call it so far.
To keep its implementation, this patch keeps .get_time_info,
but it is still not called.
Intel guy need to support it in the future.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87tv8raf3r.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h | 34 +++++++++++++++++++++++
 sound/soc/soc-component.c     | 52 +++++++++++++++++++++++++++++++++++
 sound/soc/soc-pcm.c           |  9 +++---
 3 files changed, 91 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 1a832695f69c..a6a3b696d5b0 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -70,6 +70,40 @@ struct snd_soc_component_driver {
 	int (*set_bias_level)(struct snd_soc_component *component,
 			      enum snd_soc_bias_level level);
 
+	int (*open)(struct snd_soc_component *component,
+		    struct snd_pcm_substream *substream);
+	int (*close)(struct snd_soc_component *component,
+		     struct snd_pcm_substream *substream);
+	int (*ioctl)(struct snd_soc_component *component,
+		     struct snd_pcm_substream *substream,
+		     unsigned int cmd, void *arg);
+	int (*hw_params)(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream,
+			 struct snd_pcm_hw_params *params);
+	int (*hw_free)(struct snd_soc_component *component,
+		       struct snd_pcm_substream *substream);
+	int (*prepare)(struct snd_soc_component *component,
+		       struct snd_pcm_substream *substream);
+	int (*trigger)(struct snd_soc_component *component,
+		       struct snd_pcm_substream *substream, int cmd);
+	snd_pcm_uframes_t (*pointer)(struct snd_soc_component *component,
+				     struct snd_pcm_substream *substream);
+	int (*get_time_info)(struct snd_soc_component *component,
+		struct snd_pcm_substream *substream, struct timespec *system_ts,
+		struct timespec *audio_ts,
+		struct snd_pcm_audio_tstamp_config *audio_tstamp_config,
+		struct snd_pcm_audio_tstamp_report *audio_tstamp_report);
+	int (*copy_user)(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream, int channel,
+			 unsigned long pos, void __user *buf,
+			 unsigned long bytes);
+	struct page *(*page)(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream,
+			     unsigned long offset);
+	int (*mmap)(struct snd_soc_component *component,
+		    struct snd_pcm_substream *substream,
+		    struct vm_area_struct *vma);
+
 	const struct snd_pcm_ops *ops;
 	const struct snd_compr_ops *compr_ops;
 
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 79ffc2820ba9..2d9cb763e63a 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -314,6 +314,10 @@ void snd_soc_component_module_put(struct snd_soc_component *component,
 int snd_soc_component_open(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
+	if (component->driver->open)
+		return component->driver->open(component, substream);
+
+	/* remove me */
 	if (component->driver->ops &&
 	    component->driver->ops->open)
 		return component->driver->ops->open(substream);
@@ -324,6 +328,10 @@ int snd_soc_component_open(struct snd_soc_component *component,
 int snd_soc_component_close(struct snd_soc_component *component,
 			    struct snd_pcm_substream *substream)
 {
+	if (component->driver->close)
+		return component->driver->close(component, substream);
+
+	/* remove me */
 	if (component->driver->ops &&
 	    component->driver->ops->close)
 		return component->driver->ops->close(substream);
@@ -334,6 +342,10 @@ int snd_soc_component_close(struct snd_soc_component *component,
 int snd_soc_component_prepare(struct snd_soc_component *component,
 			      struct snd_pcm_substream *substream)
 {
+	if (component->driver->prepare)
+		return component->driver->prepare(component, substream);
+
+	/* remove me */
 	if (component->driver->ops &&
 	    component->driver->ops->prepare)
 		return component->driver->ops->prepare(substream);
@@ -345,6 +357,11 @@ int snd_soc_component_hw_params(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
+	if (component->driver->hw_params)
+		return component->driver->hw_params(component,
+						    substream, params);
+
+	/* remove me */
 	if (component->driver->ops &&
 	    component->driver->ops->hw_params)
 		return component->driver->ops->hw_params(substream, params);
@@ -355,6 +372,10 @@ int snd_soc_component_hw_params(struct snd_soc_component *component,
 int snd_soc_component_hw_free(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream)
 {
+	if (component->driver->hw_free)
+		return component->driver->hw_free(component, substream);
+
+	/* remove me */
 	if (component->driver->ops &&
 	    component->driver->ops->hw_free)
 		return component->driver->ops->hw_free(substream);
@@ -366,6 +387,10 @@ int snd_soc_component_trigger(struct snd_soc_component *component,
 			      struct snd_pcm_substream *substream,
 			      int cmd)
 {
+	if (component->driver->trigger)
+		return component->driver->trigger(component, substream, cmd);
+
+	/* remove me */
 	if (component->driver->ops &&
 	    component->driver->ops->trigger)
 		return component->driver->ops->trigger(substream, cmd);
@@ -435,6 +460,10 @@ int snd_soc_pcm_component_pointer(struct snd_pcm_substream *substream)
 		component = rtdcom->component;
 
 		/* FIXME: use 1st pointer */
+		if (component->driver->pointer)
+			return component->driver->pointer(component, substream);
+
+		/* remove me */
 		if (component->driver->ops &&
 		    component->driver->ops->pointer)
 			return component->driver->ops->pointer(substream);
@@ -454,6 +483,11 @@ int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
 		component = rtdcom->component;
 
 		/* FIXME: use 1st ioctl */
+		if (component->driver->ioctl)
+			return component->driver->ioctl(component, substream,
+							cmd, arg);
+
+		/* remove me */
 		if (component->driver->ops &&
 		    component->driver->ops->ioctl)
 			return component->driver->ops->ioctl(substream,
@@ -475,6 +509,11 @@ int snd_soc_pcm_component_copy_user(struct snd_pcm_substream *substream,
 		component = rtdcom->component;
 
 		/* FIXME. it returns 1st copy now */
+		if (component->driver->copy_user)
+			return component->driver->copy_user(
+				component, substream, channel, pos, buf, bytes);
+
+		/* remove me */
 		if (component->driver->ops &&
 		    component->driver->ops->copy_user)
 			return component->driver->ops->copy_user(
@@ -496,6 +535,14 @@ struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
 		component = rtdcom->component;
 
 		/* FIXME. it returns 1st page now */
+		if (component->driver->page) {
+			page = component->driver->page(component,
+						       substream, offset);
+			if (page)
+				return page;
+		}
+
+		/* remove me */
 		if (component->driver->ops &&
 		    component->driver->ops->page) {
 			page = component->driver->ops->page(substream, offset);
@@ -518,6 +565,11 @@ int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
 		component = rtdcom->component;
 
 		/* FIXME. it returns 1st mmap now */
+		if (component->driver->mmap)
+			return component->driver->mmap(component,
+						       substream, vma);
+
+		/* remove me */
 		if (component->driver->ops &&
 		    component->driver->ops->mmap)
 			return component->driver->ops->mmap(substream, vma);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 66910500e3b6..dbf67d8a5411 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2987,16 +2987,17 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	}
 
 	for_each_rtdcom(rtd, rtdcom) {
-		const struct snd_pcm_ops *ops = rtdcom->component->driver->ops;
+		const struct snd_soc_component_driver *drv = rtdcom->component->driver;
+		const struct snd_pcm_ops *ops = drv->ops;
 
 		if (!ops)
 			continue;
 
-		if (ops->copy_user)
+		if (ops->copy_user || drv->copy_user)
 			rtd->ops.copy_user	= snd_soc_pcm_component_copy_user;
-		if (ops->page)
+		if (ops->page || drv->page)
 			rtd->ops.page		= snd_soc_pcm_component_page;
-		if (ops->mmap)
+		if (ops->mmap || drv->mmap)
 			rtd->ops.mmap		= snd_soc_pcm_component_mmap;
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
