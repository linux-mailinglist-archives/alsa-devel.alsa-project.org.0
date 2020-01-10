Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A11136E6B
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 14:45:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33FBA1729;
	Fri, 10 Jan 2020 14:44:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33FBA1729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578663910;
	bh=4zI6peN0NxSPVgd+asZiazoAQaraDVX35h5AaCCGv+I=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=JGcUHml8JKe+uGcMgh9Hf7zTg7bkitPGOL9wmz0XIQWPIxxaL2nbiMlzW57RWvV5q
	 o/05LUk94IlbjAHZyjX99c9Dk0M9HPLF7OfF+My6GBjdjKd/D1V+8Rd64Bfrcy+4VF
	 nwNUaBfWCM082VbTuDMlRFrof11I3X9g41uLnfek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FC62F802E7;
	Fri, 10 Jan 2020 14:38:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57949F802E2; Fri, 10 Jan 2020 14:38:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 29EAFF802A1
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 14:38:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29EAFF802A1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99367DA7;
 Fri, 10 Jan 2020 05:38:00 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A90E93F534;
 Fri, 10 Jan 2020 05:37:58 -0800 (PST)
Date: Fri, 10 Jan 2020 13:37:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a76wt4wm.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87a76wt4wm.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: remove snd_soc_rtdcom_list"
	to the asoc tree
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

   ASoC: soc-core: remove snd_soc_rtdcom_list

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 613fb50059cf19aa6acbc503a00265d9151c0b09 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 10 Jan 2020 11:35:21 +0900
Subject: [PATCH] ASoC: soc-core: remove snd_soc_rtdcom_list

Current ALSA SoC is using struct snd_soc_rtdcom_list to
connecting component to rtd by using list_head.

	struct snd_soc_rtdcom_list {
		struct snd_soc_component *component;
		struct list_head list; /* rtd::component_list */
	};

	struct snd_soc_pcm_runtime {
		...
		struct list_head component_list; /* list of connected components */
		...
	};

The CPU/Codec/Platform component which will be connected to rtd (a)
is indicated via dai_link at snd_soc_add_pcm_runtime()

	int snd_soc_add_pcm_runtime(...)
	{
		...
		/* Find CPU from registered CPUs */
		rtd->cpu_dai = snd_soc_find_dai(dai_link->cpus);
		...
(a)		snd_soc_rtdcom_add(rtd, rtd->cpu_dai->component);
		...

		/* Find CODEC from registered CODECs */
(b)		for_each_link_codecs(dai_link, i, codec) {
			rtd->codec_dais[i] = snd_soc_find_dai(codec);
			...
(a)			snd_soc_rtdcom_add(rtd, rtd->codec_dais[i]->component);
		}
		...

		/* Find PLATFORM from registered PLATFORMs */
(b)		for_each_link_platforms(dai_link, i, platform) {
			for_each_component(component) {
				...
(a)				snd_soc_rtdcom_add(rtd, component);
			}
		}

	}

It shows, it is possible to know how many components will be
connected to rtd by using

	dai_link->num_cpus
	dai_link->num_codecs
	dai_link->num_platforms

If so, we can use component pointer array instead of list_head,
in such case, code can be more simple.
This patch removes struct snd_soc_rtdcom_list that is only
of temporary value, and convert to pointer array.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-By: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/87a76wt4wm.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h       | 18 ++++------
 sound/soc/soc-component.c | 33 +++++++++--------
 sound/soc/soc-compress.c  | 75 ++++++++++++++++-----------------------
 sound/soc/soc-core.c      | 56 +++++++++++------------------
 sound/soc/soc-pcm.c       | 43 +++++++++-------------
 5 files changed, 91 insertions(+), 134 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 9787c80e548b..0513f30a0209 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -736,19 +736,9 @@ struct snd_soc_compr_ops {
 	int (*trigger)(struct snd_compr_stream *);
 };
 
-struct snd_soc_rtdcom_list {
-	struct snd_soc_component *component;
-	struct list_head list; /* rtd::component_list */
-};
 struct snd_soc_component*
 snd_soc_rtdcom_lookup(struct snd_soc_pcm_runtime *rtd,
 		       const char *driver_name);
-#define for_each_rtd_components(rtd, rtdcom, _component)		\
-	for (rtdcom = list_first_entry(&(rtd)->component_list,		\
-				       typeof(*rtdcom), list);		\
-	     (&rtdcom->list != &(rtd)->component_list) &&		\
-		     (_component = rtdcom->component);			\
-	     rtdcom = list_next_entry(rtdcom, list))
 
 struct snd_soc_dai_link_component {
 	const char *name;
@@ -1150,12 +1140,18 @@ struct snd_soc_pcm_runtime {
 
 	unsigned int num; /* 0-based and monotonic increasing */
 	struct list_head list; /* rtd list of the soc card */
-	struct list_head component_list; /* list of connected components */
 
 	/* bit field */
 	unsigned int pop_wait:1;
 	unsigned int fe_compr:1; /* for Dynamic PCM */
+
+	int num_components;
+	struct snd_soc_component *components[0]; /* CPU/Codec/Platform */
 };
+#define for_each_rtd_components(rtd, i, component)			\
+	for ((i) = 0;							\
+	     ((i) < rtd->num_components) && ((component) = rtd->components[i]);\
+	     (i)++)
 #define for_each_rtd_codec_dai(rtd, i, dai)\
 	for ((i) = 0;						       \
 	     ((i) < rtd->num_codecs) && ((dai) = rtd->codec_dais[i]); \
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index b94680fb26fa..14e175cdeeb8 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -418,10 +418,10 @@ int snd_soc_pcm_component_pointer(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
+	int i;
 
 	/* FIXME: use 1st pointer */
-	for_each_rtd_components(rtd, rtdcom, component)
+	for_each_rtd_components(rtd, i, component)
 		if (component->driver->pointer)
 			return component->driver->pointer(component, substream);
 
@@ -433,10 +433,10 @@ int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
+	int i;
 
 	/* FIXME: use 1st ioctl */
-	for_each_rtd_components(rtd, rtdcom, component)
+	for_each_rtd_components(rtd, i, component)
 		if (component->driver->ioctl)
 			return component->driver->ioctl(component, substream,
 							cmd, arg);
@@ -448,10 +448,9 @@ int snd_soc_pcm_component_sync_stop(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
-	int ret;
+	int i, ret;
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (component->driver->ioctl) {
 			ret = component->driver->sync_stop(component,
 							   substream);
@@ -468,11 +467,11 @@ int snd_soc_pcm_component_copy_user(struct snd_pcm_substream *substream,
 				    void __user *buf, unsigned long bytes)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
+	int i;
 
 	/* FIXME. it returns 1st copy now */
-	for_each_rtd_components(rtd, rtdcom, component)
+	for_each_rtd_components(rtd, i, component)
 		if (component->driver->copy_user)
 			return component->driver->copy_user(
 				component, substream, channel, pos, buf, bytes);
@@ -484,12 +483,12 @@ struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
 					unsigned long offset)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
 	struct page *page;
+	int i;
 
 	/* FIXME. it returns 1st page now */
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (component->driver->page) {
 			page = component->driver->page(component,
 						       substream, offset);
@@ -505,11 +504,11 @@ int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
 			       struct vm_area_struct *vma)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
+	int i;
 
 	/* FIXME. it returns 1st mmap now */
-	for_each_rtd_components(rtd, rtdcom, component)
+	for_each_rtd_components(rtd, i, component)
 		if (component->driver->mmap)
 			return component->driver->mmap(component,
 						       substream, vma);
@@ -519,11 +518,11 @@ int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
 
 int snd_soc_pcm_component_new(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
 	int ret;
+	int i;
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (component->driver->pcm_construct) {
 			ret = component->driver->pcm_construct(component, rtd);
 			if (ret < 0)
@@ -536,13 +535,13 @@ int snd_soc_pcm_component_new(struct snd_soc_pcm_runtime *rtd)
 
 void snd_soc_pcm_component_free(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
+	int i;
 
 	if (!rtd->pcm)
 		return;
 
-	for_each_rtd_components(rtd, rtdcom, component)
+	for_each_rtd_components(rtd, i, component)
 		if (component->driver->pcm_destruct)
 			component->driver->pcm_destruct(component, rtd->pcm);
 }
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index b2a5351b1a11..16fe08690cf5 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -26,10 +26,9 @@ static int soc_compr_components_open(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
-	int ret;
+	int i, ret;
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->open)
 			continue;
@@ -54,9 +53,9 @@ static int soc_compr_components_free(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
+	int i;
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (component == last)
 			break;
 
@@ -74,11 +73,10 @@ static int soc_compr_open(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component, *save = NULL;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	int ret;
+	int ret, i;
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		ret = pm_runtime_get_sync(component->dev);
 		if (ret < 0 && ret != -EACCES) {
 			pm_runtime_put_noidle(component->dev);
@@ -127,7 +125,7 @@ static int soc_compr_open(struct snd_compr_stream *cstream)
 out:
 	mutex_unlock(&rtd->card->pcm_mutex);
 pm_err:
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (component == save)
 			break;
 		pm_runtime_mark_last_busy(component->dev);
@@ -259,10 +257,9 @@ static int soc_compr_free(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	int stream;
+	int stream, i;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
@@ -309,7 +306,7 @@ static int soc_compr_free(struct snd_compr_stream *cstream)
 
 	mutex_unlock(&rtd->card->pcm_mutex);
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		pm_runtime_mark_last_busy(component->dev);
 		pm_runtime_put_autosuspend(component->dev);
 	}
@@ -371,10 +368,9 @@ static int soc_compr_components_trigger(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
-	int ret;
+	int i, ret;
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->trigger)
 			continue;
@@ -474,10 +470,9 @@ static int soc_compr_components_set_params(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
-	int ret;
+	int i, ret;
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->set_params)
 			continue;
@@ -606,9 +601,8 @@ static int soc_compr_get_params(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	int ret = 0;
+	int i, ret = 0;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
@@ -618,7 +612,7 @@ static int soc_compr_get_params(struct snd_compr_stream *cstream,
 			goto err;
 	}
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->get_params)
 			continue;
@@ -637,12 +631,11 @@ static int soc_compr_get_caps(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
-	int ret = 0;
+	int i, ret = 0;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->get_caps)
 			continue;
@@ -660,12 +653,11 @@ static int soc_compr_get_codec_caps(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
-	int ret = 0;
+	int i, ret = 0;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->get_codec_caps)
 			continue;
@@ -683,9 +675,8 @@ static int soc_compr_ack(struct snd_compr_stream *cstream, size_t bytes)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	int ret = 0;
+	int i, ret = 0;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
@@ -695,7 +686,7 @@ static int soc_compr_ack(struct snd_compr_stream *cstream, size_t bytes)
 			goto err;
 	}
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->ack)
 			continue;
@@ -715,8 +706,7 @@ static int soc_compr_pointer(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
-	int ret = 0;
+	int i, ret = 0;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
@@ -724,7 +714,7 @@ static int soc_compr_pointer(struct snd_compr_stream *cstream,
 	if (cpu_dai->driver->cops && cpu_dai->driver->cops->pointer)
 		cpu_dai->driver->cops->pointer(cstream, tstamp, cpu_dai);
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->pointer)
 			continue;
@@ -742,12 +732,11 @@ static int soc_compr_copy(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
-	int ret = 0;
+	int i, ret = 0;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->copy)
 			continue;
@@ -765,9 +754,8 @@ static int soc_compr_set_metadata(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	int ret;
+	int i, ret;
 
 	if (cpu_dai->driver->cops && cpu_dai->driver->cops->set_metadata) {
 		ret = cpu_dai->driver->cops->set_metadata(cstream, metadata, cpu_dai);
@@ -775,7 +763,7 @@ static int soc_compr_set_metadata(struct snd_compr_stream *cstream,
 			return ret;
 	}
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->set_metadata)
 			continue;
@@ -794,9 +782,8 @@ static int soc_compr_get_metadata(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	int ret;
+	int i, ret;
 
 	if (cpu_dai->driver->cops && cpu_dai->driver->cops->get_metadata) {
 		ret = cpu_dai->driver->cops->get_metadata(cstream, metadata, cpu_dai);
@@ -804,7 +791,7 @@ static int soc_compr_get_metadata(struct snd_compr_stream *cstream,
 			return ret;
 	}
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->get_metadata)
 			continue;
@@ -857,7 +844,6 @@ static struct snd_compr_ops soc_compr_dyn_ops = {
 int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 {
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_compr *compr;
@@ -865,6 +851,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 	char new_name[64];
 	int ret = 0, direction = 0;
 	int playback = 0, capture = 0;
+	int i;
 
 	if (rtd->num_codecs > 1) {
 		dev_err(rtd->card->dev,
@@ -933,7 +920,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 		memcpy(compr->ops, &soc_compr_ops, sizeof(soc_compr_ops));
 	}
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (!component->driver->compr_ops ||
 		    !component->driver->compr_ops->copy)
 			continue;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 55b98e82a978..c9daa63a339b 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -261,34 +261,18 @@ static inline void snd_soc_debugfs_exit(void)
 static int snd_soc_rtdcom_add(struct snd_soc_pcm_runtime *rtd,
 			      struct snd_soc_component *component)
 {
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *comp;
+	int i;
 
-	for_each_rtd_components(rtd, rtdcom, comp) {
+	for_each_rtd_components(rtd, i, comp) {
 		/* already connected */
 		if (comp == component)
 			return 0;
 	}
 
-	/*
-	 * created rtdcom here will be freed when rtd->dev was freed.
-	 * see
-	 *	soc_free_pcm_runtime() :: device_unregister(rtd->dev)
-	 */
-	rtdcom = devm_kzalloc(rtd->dev, sizeof(*rtdcom), GFP_KERNEL);
-	if (!rtdcom)
-		return -ENOMEM;
-
-	rtdcom->component = component;
-	INIT_LIST_HEAD(&rtdcom->list);
-
-	/*
-	 * When rtd was freed, created rtdcom here will be
-	 * also freed.
-	 * And we don't need to call list_del(&rtdcom->list)
-	 * when freed, because rtd is also freed.
-	 */
-	list_add_tail(&rtdcom->list, &rtd->component_list);
+	/* see for_each_rtd_components */
+	rtd->components[rtd->num_components] = component;
+	rtd->num_components++;
 
 	return 0;
 }
@@ -296,8 +280,8 @@ static int snd_soc_rtdcom_add(struct snd_soc_pcm_runtime *rtd,
 struct snd_soc_component *snd_soc_rtdcom_lookup(struct snd_soc_pcm_runtime *rtd,
 						const char *driver_name)
 {
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
+	int i;
 
 	if (!driver_name)
 		return NULL;
@@ -310,7 +294,7 @@ struct snd_soc_component *snd_soc_rtdcom_lookup(struct snd_soc_pcm_runtime *rtd,
 	 * But, if many components which have same driver name are connected
 	 * to 1 rtd, this function will return 1st found component.
 	 */
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		const char *component_name = component->driver->name;
 
 		if (!component_name)
@@ -318,7 +302,7 @@ struct snd_soc_component *snd_soc_rtdcom_lookup(struct snd_soc_pcm_runtime *rtd,
 
 		if ((component_name == driver_name) ||
 		    strcmp(component_name, driver_name) == 0)
-			return rtdcom->component;
+			return component;
 	}
 
 	return NULL;
@@ -418,6 +402,7 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
 	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_component *component;
 	struct device *dev;
 	int ret;
 
@@ -443,13 +428,17 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	/*
 	 * for rtd
 	 */
-	rtd = devm_kzalloc(dev, sizeof(*rtd), GFP_KERNEL);
+	rtd = devm_kzalloc(dev,
+			   sizeof(*rtd) +
+			   sizeof(*component) * (dai_link->num_cpus +
+						 dai_link->num_codecs +
+						 dai_link->num_platforms),
+			   GFP_KERNEL);
 	if (!rtd)
 		goto free_rtd;
 
 	rtd->dev = dev;
 	INIT_LIST_HEAD(&rtd->list);
-	INIT_LIST_HEAD(&rtd->component_list);
 	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].be_clients);
 	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].be_clients);
 	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].fe_clients);
@@ -1108,9 +1097,8 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
-	int ret, num;
+	int ret, num, i;
 
 	/* set default power off timeout */
 	rtd->pmdown_time = pmdown_time;
@@ -1141,7 +1129,7 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 	 * topology based drivers can use the DAI link id field to set PCM
 	 * device number and then use rtd + a base offset of the BEs.
 	 */
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (!component->driver->use_dai_pcm_id)
 			continue;
 
@@ -1406,12 +1394,11 @@ static void soc_remove_link_components(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
 	struct snd_soc_pcm_runtime *rtd;
-	struct snd_soc_rtdcom_list *rtdcom;
-	int order;
+	int i, order;
 
 	for_each_comp_order(order) {
 		for_each_card_rtds(card, rtd) {
-			for_each_rtd_components(rtd, rtdcom, component) {
+			for_each_rtd_components(rtd, i, component) {
 				if (component->driver->remove_order != order)
 					continue;
 
@@ -1425,12 +1412,11 @@ static int soc_probe_link_components(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
 	struct snd_soc_pcm_runtime *rtd;
-	struct snd_soc_rtdcom_list *rtdcom;
-	int ret, order;
+	int i, ret, order;
 
 	for_each_comp_order(order) {
 		for_each_card_rtds(card, rtd) {
-			for_each_rtd_components(rtd, rtdcom, component) {
+			for_each_rtd_components(rtd, i, component) {
 				if (component->driver->probe_order != order)
 					continue;
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 01e7bc03d92f..9c6c7533a508 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -111,14 +111,14 @@ void snd_soc_runtime_deactivate(struct snd_soc_pcm_runtime *rtd, int stream)
  */
 bool snd_soc_runtime_ignore_pmdown_time(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
 	bool ignore = true;
+	int i;
 
 	if (!rtd->pmdown_time || rtd->dai_link->ignore_pmdown_time)
 		return true;
 
-	for_each_rtd_components(rtd, rtdcom, component)
+	for_each_rtd_components(rtd, i, component)
 		ignore &= !component->driver->use_pmdown_time;
 
 	return ignore;
@@ -428,11 +428,10 @@ static int soc_pcm_components_open(struct snd_pcm_substream *substream,
 				   struct snd_soc_component **last)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
-	int ret = 0;
+	int i, ret = 0;
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		*last = component;
 
 		ret = snd_soc_component_module_get_when_open(component);
@@ -459,11 +458,10 @@ static int soc_pcm_components_close(struct snd_pcm_substream *substream,
 				    struct snd_soc_component *last)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
-	int ret = 0;
+	int i, ret = 0;
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (component == last)
 			break;
 
@@ -484,7 +482,6 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	const char *codec_dai_name = "multicodec";
@@ -494,9 +491,8 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		pinctrl_pm_select_default_state(codec_dai->dev);
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component)
 		pm_runtime_get_sync(component->dev);
-	}
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
@@ -617,7 +613,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 out:
 	mutex_unlock(&rtd->card->pcm_mutex);
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		pm_runtime_mark_last_busy(component->dev);
 		pm_runtime_put_autosuspend(component->dev);
 	}
@@ -677,7 +673,6 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i;
@@ -728,7 +723,7 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 
 	mutex_unlock(&rtd->card->pcm_mutex);
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		pm_runtime_mark_last_busy(component->dev);
 		pm_runtime_put_autosuspend(component->dev);
 	}
@@ -752,7 +747,6 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret = 0;
@@ -768,7 +762,7 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 		}
 	}
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		ret = snd_soc_component_prepare(component, substream);
 		if (ret < 0) {
 			dev_err(component->dev,
@@ -829,11 +823,10 @@ static int soc_pcm_components_hw_free(struct snd_pcm_substream *substream,
 				      struct snd_soc_component *last)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
-	int ret = 0;
+	int i, ret = 0;
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		if (component == last)
 			break;
 
@@ -853,7 +846,6 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret = 0;
@@ -932,7 +924,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	snd_soc_dapm_update_dai(substream, params, cpu_dai);
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		ret = snd_soc_component_hw_params(component, substream, params);
 		if (ret < 0) {
 			dev_err(component->dev,
@@ -1033,7 +1025,6 @@ static int soc_pcm_trigger_start(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
@@ -1044,7 +1035,7 @@ static int soc_pcm_trigger_start(struct snd_pcm_substream *substream, int cmd)
 			return ret;
 	}
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		ret = snd_soc_component_trigger(component, substream, cmd);
 		if (ret < 0)
 			return ret;
@@ -1067,7 +1058,6 @@ static int soc_pcm_trigger_stop(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
@@ -1082,7 +1072,7 @@ static int soc_pcm_trigger_stop(struct snd_pcm_substream *substream, int cmd)
 	if (ret < 0)
 		return ret;
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		ret = snd_soc_component_trigger(component, substream, cmd);
 		if (ret < 0)
 			return ret;
@@ -2897,7 +2887,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 {
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
 	struct snd_pcm *pcm;
 	char new_name[64];
@@ -3007,7 +2996,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		rtd->ops.pointer	= soc_pcm_pointer;
 	}
 
-	for_each_rtd_components(rtd, rtdcom, component) {
+	for_each_rtd_components(rtd, i, component) {
 		const struct snd_soc_component_driver *drv = component->driver;
 
 		if (drv->ioctl)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
