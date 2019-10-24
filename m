Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ABFE2316
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 21:06:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E6201655;
	Wed, 23 Oct 2019 21:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E6201655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571857577;
	bh=V+pqlk2En2hZ7cI8fIiTc3+4vVnCG9aPt6XKWHjQZBw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=I7fHEiZALOto/mAOE/zAv0G9ujq2TsppZL2a8JSDE/GnAOMTZndJ0Owp8HiUY2klj
	 gRQBYJm5iUv9N1YnVUYGYpI0bHfPkkJPzx4mDzPzb6HSA+IVkwZUbrZXR9E7aW/zcX
	 hq8ZsRdaxGLEZWxsR6bIKyfPkzSPJOMwVWuPy1Dw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72DEAF8071F;
	Wed, 23 Oct 2019 20:56:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5E0DF80612; Wed, 23 Oct 2019 20:56:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35F8AF8058C
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 20:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35F8AF8058C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sVaPnD2Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Bh1Ky4qqn0l2U4YH+pV59SEEZg9IZde9zzxhVTnZVqc=; b=sVaPnD2YHfCI
 lkGSlZKe6cyCSVl5NqDU12V2/Z6gJfDpCrYid5S8FsFXEQwEo6WIubMYOqJhL7533SI/ccuN3y8fu
 IQND3CqQ9u+X4k++tLD19CBNgpFSF3f7oKQuexQ+RK9WQulZ7czca04R50HwJiPqLd7py4AWpaxyS
 ycglg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNLnj-0001BG-Bo; Wed, 23 Oct 2019 18:56:07 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C539D274326E; Wed, 23 Oct 2019 19:56:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878spm64m4.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191023185606.C539D274326E@ypsilon.sirena.org.uk>
Date: Wed, 23 Oct 2019 19:56:06 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: add for_each_rtd_components()
	and replace" to the asoc tree
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

   ASoC: soc-core: add for_each_rtd_components() and replace

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

From 2b544dd7b43b19fb55ea4fbb3e30b60eb20b7828 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 15 Oct 2019 12:59:31 +0900
Subject: [PATCH] ASoC: soc-core: add for_each_rtd_components() and replace

ALSA SoC has for_each_rtdcom() which is link list for
rtd-component which is called as rtdcom. The relationship image is like below

			       rtdcom	   rtdcom      rtdcom
			       component   component   component
	rtd->component_list -> list	-> list	    -> list ...

Here, the pointer get via normal link list is rtdcom,
Thus, current for_each loop is like below, and need to get
component via rtdcom->component

	for_each_rtdcom(rtd, rtdcom) {
		component = rtdcom->component;
		...
	}

but usually, user want to get pointer from for_each_xxx is component
directly, like below.

	for_each_rtd_component(rtd, rtdcom, component) {
		...
	}

This patch expands list_for_each_entry manually, and enable to get
component directly from for_each macro.
Because of it, the macro becoming difficult to read,
but macro itself becoming useful.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/878spm64m4.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h       |  8 ++++--
 sound/soc/soc-component.c | 43 +++++++++-----------------------
 sound/soc/soc-compress.c  | 52 ++++++++++-----------------------------
 sound/soc/soc-core.c      | 22 +++++++----------
 sound/soc/soc-pcm.c       | 49 +++++++++++-------------------------
 5 files changed, 54 insertions(+), 120 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index d730883626dc..320dcd440dab 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -739,8 +739,12 @@ struct snd_soc_rtdcom_list {
 struct snd_soc_component*
 snd_soc_rtdcom_lookup(struct snd_soc_pcm_runtime *rtd,
 		       const char *driver_name);
-#define for_each_rtdcom(rtd, rtdcom) \
-	list_for_each_entry(rtdcom, &(rtd)->component_list, list)
+#define for_each_rtd_components(rtd, rtdcom, _component)		\
+	for (rtdcom = list_first_entry(&(rtd)->component_list,		\
+				       typeof(*rtdcom), list);		\
+	     (&rtdcom->list != &(rtd)->component_list) &&		\
+		     (_component = rtdcom->component);			\
+	     rtdcom = list_next_entry(rtdcom, list))
 
 struct snd_soc_dai_link_component {
 	const char *name;
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index debaf1f6f403..98ef0666add2 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -420,13 +420,10 @@ int snd_soc_pcm_component_pointer(struct snd_pcm_substream *substream)
 	struct snd_soc_component *component;
 	struct snd_soc_rtdcom_list *rtdcom;
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
-		/* FIXME: use 1st pointer */
+	/* FIXME: use 1st pointer */
+	for_each_rtd_components(rtd, rtdcom, component)
 		if (component->driver->pointer)
 			return component->driver->pointer(component, substream);
-	}
 
 	return 0;
 }
@@ -438,14 +435,11 @@ int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component;
 	struct snd_soc_rtdcom_list *rtdcom;
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
-		/* FIXME: use 1st ioctl */
+	/* FIXME: use 1st ioctl */
+	for_each_rtd_components(rtd, rtdcom, component)
 		if (component->driver->ioctl)
 			return component->driver->ioctl(component, substream,
 							cmd, arg);
-	}
 
 	return snd_pcm_lib_ioctl(substream, cmd, arg);
 }
@@ -458,14 +452,11 @@ int snd_soc_pcm_component_copy_user(struct snd_pcm_substream *substream,
 	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
-		/* FIXME. it returns 1st copy now */
+	/* FIXME. it returns 1st copy now */
+	for_each_rtd_components(rtd, rtdcom, component)
 		if (component->driver->copy_user)
 			return component->driver->copy_user(
 				component, substream, channel, pos, buf, bytes);
-	}
 
 	return -EINVAL;
 }
@@ -478,10 +469,8 @@ struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component;
 	struct page *page;
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
-		/* FIXME. it returns 1st page now */
+	/* FIXME. it returns 1st page now */
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (component->driver->page) {
 			page = component->driver->page(component,
 						       substream, offset);
@@ -500,14 +489,11 @@ int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
 	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
-		/* FIXME. it returns 1st mmap now */
+	/* FIXME. it returns 1st mmap now */
+	for_each_rtd_components(rtd, rtdcom, component)
 		if (component->driver->mmap)
 			return component->driver->mmap(component,
 						       substream, vma);
-	}
 
 	return -EINVAL;
 }
@@ -519,9 +505,7 @@ int snd_soc_pcm_component_new(struct snd_pcm *pcm)
 	struct snd_soc_component *component;
 	int ret;
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (component->driver->pcm_construct) {
 			ret = component->driver->pcm_construct(component, rtd);
 			if (ret < 0)
@@ -538,10 +522,7 @@ void snd_soc_pcm_component_free(struct snd_pcm *pcm)
 	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component)
 		if (component->driver->pcm_destruct)
 			component->driver->pcm_destruct(component, pcm);
-	}
 }
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 9e54d8ae6d2c..61f230324164 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -28,9 +28,7 @@ static int soc_compr_components_open(struct snd_compr_stream *cstream,
 	struct snd_soc_rtdcom_list *rtdcom;
 	int ret;
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->open)
 			continue;
@@ -57,9 +55,7 @@ static int soc_compr_components_free(struct snd_compr_stream *cstream,
 	struct snd_soc_component *component;
 	struct snd_soc_rtdcom_list *rtdcom;
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (component == last)
 			break;
 
@@ -353,9 +349,7 @@ static int soc_compr_components_trigger(struct snd_compr_stream *cstream,
 	struct snd_soc_rtdcom_list *rtdcom;
 	int ret;
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->trigger)
 			continue;
@@ -458,9 +452,7 @@ static int soc_compr_components_set_params(struct snd_compr_stream *cstream,
 	struct snd_soc_rtdcom_list *rtdcom;
 	int ret;
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->set_params)
 			continue;
@@ -601,9 +593,7 @@ static int soc_compr_get_params(struct snd_compr_stream *cstream,
 			goto err;
 	}
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->get_params)
 			continue;
@@ -627,9 +617,7 @@ static int soc_compr_get_caps(struct snd_compr_stream *cstream,
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->get_caps)
 			continue;
@@ -652,9 +640,7 @@ static int soc_compr_get_codec_caps(struct snd_compr_stream *cstream,
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->get_codec_caps)
 			continue;
@@ -684,9 +670,7 @@ static int soc_compr_ack(struct snd_compr_stream *cstream, size_t bytes)
 			goto err;
 	}
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->ack)
 			continue;
@@ -715,9 +699,7 @@ static int soc_compr_pointer(struct snd_compr_stream *cstream,
 	if (cpu_dai->driver->cops && cpu_dai->driver->cops->pointer)
 		cpu_dai->driver->cops->pointer(cstream, tstamp, cpu_dai);
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->pointer)
 			continue;
@@ -740,9 +722,7 @@ static int soc_compr_copy(struct snd_compr_stream *cstream,
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->copy)
 			continue;
@@ -770,9 +750,7 @@ static int soc_compr_set_metadata(struct snd_compr_stream *cstream,
 			return ret;
 	}
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->set_metadata)
 			continue;
@@ -801,9 +779,7 @@ static int soc_compr_get_metadata(struct snd_compr_stream *cstream,
 			return ret;
 	}
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->get_metadata)
 			continue;
@@ -932,9 +908,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 		memcpy(compr->ops, &soc_compr_ops, sizeof(soc_compr_ops));
 	}
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->copy)
 			continue;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f028a6938ee8..f1b41b0391ed 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -293,10 +293,11 @@ static int snd_soc_rtdcom_add(struct snd_soc_pcm_runtime *rtd,
 			      struct snd_soc_component *component)
 {
 	struct snd_soc_rtdcom_list *rtdcom;
+	struct snd_soc_component *comp;
 
-	for_each_rtdcom(rtd, rtdcom) {
+	for_each_rtd_components(rtd, rtdcom, comp) {
 		/* already connected */
-		if (rtdcom->component == component)
+		if (comp == component)
 			return 0;
 	}
 
@@ -327,6 +328,7 @@ struct snd_soc_component *snd_soc_rtdcom_lookup(struct snd_soc_pcm_runtime *rtd,
 						const char *driver_name)
 {
 	struct snd_soc_rtdcom_list *rtdcom;
+	struct snd_soc_component *component;
 
 	if (!driver_name)
 		return NULL;
@@ -339,8 +341,8 @@ struct snd_soc_component *snd_soc_rtdcom_lookup(struct snd_soc_pcm_runtime *rtd,
 	 * But, if many components which have same driver name are connected
 	 * to 1 rtd, this function will return 1st found component.
 	 */
-	for_each_rtdcom(rtd, rtdcom) {
-		const char *component_name = rtdcom->component->driver->name;
+	for_each_rtd_components(rtd, rtdcom, component) {
+		const char *component_name = component->driver->name;
 
 		if (!component_name)
 			continue;
@@ -1248,9 +1250,7 @@ static void soc_remove_link_components(struct snd_soc_card *card)
 
 	for_each_comp_order(order) {
 		for_each_card_rtds(card, rtd) {
-			for_each_rtdcom(rtd, rtdcom) {
-				component = rtdcom->component;
-
+			for_each_rtd_components(rtd, rtdcom, component) {
 				if (component->driver->remove_order != order)
 					continue;
 
@@ -1269,9 +1269,7 @@ static int soc_probe_link_components(struct snd_soc_card *card)
 
 	for_each_comp_order(order) {
 		for_each_card_rtds(card, rtd) {
-			for_each_rtdcom(rtd, rtdcom) {
-				component = rtdcom->component;
-
+			for_each_rtd_components(rtd, rtdcom, component) {
 				if (component->driver->probe_order != order)
 					continue;
 
@@ -1520,9 +1518,7 @@ static int soc_link_init(struct snd_soc_card *card,
 	 * topology based drivers can use the DAI link id field to set PCM
 	 * device number and then use rtd + a base offset of the BEs.
 	 */
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (!component->driver->use_dai_pcm_id)
 			continue;
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 600d9bf3b076..8655df6a6089 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -118,11 +118,8 @@ bool snd_soc_runtime_ignore_pmdown_time(struct snd_soc_pcm_runtime *rtd)
 	if (!rtd->pmdown_time || rtd->dai_link->ignore_pmdown_time)
 		return true;
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component)
 		ignore &= !component->driver->use_pmdown_time;
-	}
 
 	return ignore;
 }
@@ -435,8 +432,7 @@ static int soc_pcm_components_open(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component;
 	int ret = 0;
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
+	for_each_rtd_components(rtd, rtdcom, component) {
 		*last = component;
 
 		ret = snd_soc_component_module_get_when_open(component);
@@ -467,9 +463,7 @@ static int soc_pcm_components_close(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component;
 	int ret = 0;
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (component == last)
 			break;
 
@@ -500,9 +494,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		pinctrl_pm_select_default_state(codec_dai->dev);
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		pm_runtime_get_sync(component->dev);
 	}
 
@@ -625,9 +617,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 out:
 	mutex_unlock(&rtd->card->pcm_mutex);
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		pm_runtime_mark_last_busy(component->dev);
 		pm_runtime_put_autosuspend(component->dev);
 	}
@@ -740,9 +730,7 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&rtd->card->pcm_mutex);
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		pm_runtime_mark_last_busy(component->dev);
 		pm_runtime_put_autosuspend(component->dev);
 	}
@@ -782,9 +770,7 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 		}
 	}
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		ret = snd_soc_component_prepare(component, substream);
 		if (ret < 0) {
 			dev_err(component->dev,
@@ -849,9 +835,7 @@ static int soc_pcm_components_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component;
 	int ret = 0;
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		if (component == last)
 			break;
 
@@ -945,9 +929,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	snd_soc_dapm_update_dai(substream, params, cpu_dai);
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		ret = snd_soc_component_hw_params(component, substream, params);
 		if (ret < 0) {
 			dev_err(component->dev,
@@ -1062,9 +1044,7 @@ static int soc_pcm_trigger_start(struct snd_pcm_substream *substream, int cmd)
 			return ret;
 	}
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		ret = snd_soc_component_trigger(component, substream, cmd);
 		if (ret < 0)
 			return ret;
@@ -1102,9 +1082,7 @@ static int soc_pcm_trigger_stop(struct snd_pcm_substream *substream, int cmd)
 	if (ret < 0)
 		return ret;
 
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
+	for_each_rtd_components(rtd, rtdcom, component) {
 		ret = snd_soc_component_trigger(component, substream, cmd);
 		if (ret < 0)
 			return ret;
@@ -2879,6 +2857,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_rtdcom_list *rtdcom;
+	struct snd_soc_component *component;
 	struct snd_pcm *pcm;
 	char new_name[64];
 	int ret = 0, playback = 0, capture = 0;
@@ -2990,8 +2969,8 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		rtd->ops.ioctl		= snd_soc_pcm_component_ioctl;
 	}
 
-	for_each_rtdcom(rtd, rtdcom) {
-		const struct snd_soc_component_driver *drv = rtdcom->component->driver;
+	for_each_rtd_components(rtd, rtdcom, component) {
+		const struct snd_soc_component_driver *drv = component->driver;
 
 		if (drv->copy_user)
 			rtd->ops.copy_user	= snd_soc_pcm_component_copy_user;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
