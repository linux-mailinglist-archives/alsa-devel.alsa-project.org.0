Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA1A15B59B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 01:02:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9A8816A1;
	Thu, 13 Feb 2020 01:01:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9A8816A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581552146;
	bh=7M8FUCSjvgP9IADoE+GG60fqaiA06+jCSwrHTjWaN7M=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=p5Jf0l5IciyajkimW47s1mAbf7eSIreJwpAThmtHQU5OkhXMjBHzWkbxr2Z3UdmRy
	 N4MPC2iv7DYZkPxnZtJzpehCfUIiVy68Jbq+IdvzK7+kdm/kypZFWKTU2XYbRspTdJ
	 XGuejKeyXe7VV6W4i57rvMVfg0c2ofbMq7gSQQHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B0E3F802A7;
	Thu, 13 Feb 2020 00:57:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 863FDF8029A; Thu, 13 Feb 2020 00:57:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id ABB88F8028D
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 00:57:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABB88F8028D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEBEE113E;
 Wed, 12 Feb 2020 15:57:21 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F22E3F68E;
 Wed, 12 Feb 2020 15:57:21 -0800 (PST)
Date: Wed, 12 Feb 2020 23:57:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874kvzcey1.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-874kvzcey1.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-pcm: call
	snd_soc_component_open/close() once" to the asoc tree
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

   ASoC: soc-pcm: call snd_soc_component_open/close() once

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

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

From dd03907bf129b42e9e3203fdf405ea9873b28dd3 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 10 Feb 2020 12:14:37 +0900
Subject: [PATCH] ASoC: soc-pcm: call snd_soc_component_open/close() once

Current soc_pcm_open() calls snd_soc_component_open() under loop.
Thus, it needs to care about opened/not-yet-opened Component.

But, if soc-component.c is handling it, soc-pcm.c don't need to care
about it.
This patch adds opened flag to soc-component.h, and simplify soc-pcm.c.
This is one of prepare for cleanup soc-pcm-open()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/874kvzcey1.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h |  7 +++++--
 sound/soc/soc-component.c     | 35 ++++++++++++++++++++++++++++-------
 sound/soc/soc-pcm.c           | 19 ++++++-------------
 3 files changed, 39 insertions(+), 22 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 154d02fbbfed..1866ecc8e94b 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -147,8 +147,6 @@ struct snd_soc_component {
 
 	unsigned int active;
 
-	unsigned int suspended:1; /* is in suspend PM state */
-
 	struct list_head list;
 	struct list_head card_aux_list; /* for auxiliary bound components */
 	struct list_head card_list;
@@ -182,6 +180,11 @@ struct snd_soc_component {
 	struct dentry *debugfs_root;
 	const char *debugfs_prefix;
 #endif
+
+	/* bit field */
+	unsigned int suspended:1; /* is in suspend PM state */
+	unsigned int opened:1;
+	unsigned int module:1;
 };
 
 #define for_each_component_dais(component, dai)\
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 14e175cdeeb8..ee00c09df5e7 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -297,34 +297,55 @@ EXPORT_SYMBOL_GPL(snd_soc_component_set_jack);
 int snd_soc_component_module_get(struct snd_soc_component *component,
 				 int upon_open)
 {
+	if (component->module)
+		return 0;
+
 	if (component->driver->module_get_upon_open == !!upon_open &&
 	    !try_module_get(component->dev->driver->owner))
 		return -ENODEV;
 
+	component->module = 1;
+
 	return 0;
 }
 
 void snd_soc_component_module_put(struct snd_soc_component *component,
 				  int upon_open)
 {
-	if (component->driver->module_get_upon_open == !!upon_open)
+	if (component->module &&
+	    component->driver->module_get_upon_open == !!upon_open)
 		module_put(component->dev->driver->owner);
+
+	component->module = 0;
 }
 
 int snd_soc_component_open(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
-	if (component->driver->open)
-		return component->driver->open(component, substream);
-	return 0;
+	int ret = 0;
+
+	if (!component->opened &&
+	    component->driver->open)
+		ret = component->driver->open(component, substream);
+
+	if (ret == 0)
+		component->opened = 1;
+
+	return ret;
 }
 
 int snd_soc_component_close(struct snd_soc_component *component,
 			    struct snd_pcm_substream *substream)
 {
-	if (component->driver->close)
-		return component->driver->close(component, substream);
-	return 0;
+	int ret = 0;
+
+	if (component->opened &&
+	    component->driver->close)
+		ret = component->driver->close(component, substream);
+
+	component->opened = 0;
+
+	return ret;
 }
 
 int snd_soc_component_prepare(struct snd_soc_component *component,
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index d53afb96b05b..ae94d8a86992 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -463,16 +463,13 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 	hw->rate_max = min_not_zero(hw->rate_max, rate_max);
 }
 
-static int soc_pcm_components_open(struct snd_pcm_substream *substream,
-				   struct snd_soc_component **last)
+static int soc_pcm_components_open(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
 	int i, ret = 0;
 
 	for_each_rtd_components(rtd, i, component) {
-		*last = component;
-
 		ret = snd_soc_component_module_get_when_open(component);
 		if (ret < 0) {
 			dev_err(component->dev,
@@ -489,21 +486,17 @@ static int soc_pcm_components_open(struct snd_pcm_substream *substream,
 			return ret;
 		}
 	}
-	*last = NULL;
+
 	return 0;
 }
 
-static int soc_pcm_components_close(struct snd_pcm_substream *substream,
-				    struct snd_soc_component *last)
+static int soc_pcm_components_close(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
 	int i, r, ret = 0;
 
 	for_each_rtd_components(rtd, i, component) {
-		if (component == last)
-			break;
-
 		r = snd_soc_component_close(component, substream);
 		if (r < 0)
 			ret = r; /* use last ret */
@@ -545,7 +538,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 		goto out;
 	}
 
-	ret = soc_pcm_components_open(substream, &component);
+	ret = soc_pcm_components_open(substream);
 	if (ret < 0)
 		goto component_err;
 
@@ -642,7 +635,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 		snd_soc_dai_shutdown(codec_dai, substream);
 
 component_err:
-	soc_pcm_components_close(substream, component);
+	soc_pcm_components_close(substream);
 
 	snd_soc_dai_shutdown(cpu_dai, substream);
 out:
@@ -696,7 +689,7 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 
 	soc_rtd_shutdown(rtd, substream);
 
-	soc_pcm_components_close(substream, NULL);
+	soc_pcm_components_close(substream);
 
 	snd_soc_dapm_stream_stop(rtd, substream->stream);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
