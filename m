Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0187716B3CF
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 23:23:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60EB71694;
	Mon, 24 Feb 2020 23:22:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60EB71694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582583002;
	bh=NH96DvUvD8K2myWeHIzk/fZ+QVCd0b3k5S53dexthgQ=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=QYN3KDWNcZtXRmPh8WBrWekQGHNq6WgskiuHAjq24QfoyX5WCCRXG0aQ6koHsa1oc
	 95sIF+FC+u0jHFWpu0rvcCQeYhez1eND4ZCMO7MSTJftyPiZg2IkBeAYSnL+hBMVTc
	 mhxqdWzVmEVIwwC27S8TFWKRDBF5d3EHWHuFws7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56F62F8016F;
	Mon, 24 Feb 2020 23:21:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8077F80137; Mon, 24 Feb 2020 23:21:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C45F7F80137
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 23:21:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C45F7F80137
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E48830E;
 Mon, 24 Feb 2020 14:21:33 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F27553F534;
 Mon, 24 Feb 2020 14:21:32 -0800 (PST)
Date: Mon, 24 Feb 2020 22:21:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Applied "ASoC: soc-pcm: fix state tracking error in
 snd_soc_component_open/close()" to the asoc tree
In-Reply-To: <20200220094955.16968-1-kai.vehmanen@linux.intel.com>
Message-Id: <applied-20200220094955.16968-1-kai.vehmanen@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, Mark Brown <broonie@kernel.org>,
 Dmitry Osipenko <digetx@gmail.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: soc-pcm: fix state tracking error in snd_soc_component_open/close()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From d2aaa8d8bfba93237ac944ee058fb98e2c2ef983 Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Thu, 20 Feb 2020 11:49:55 +0200
Subject: [PATCH] ASoC: soc-pcm: fix state tracking error in
 snd_soc_component_open/close()

ASoC component open/close and snd_soc_component_module_get/put are called
independently for each component-substream pair, so the logic added in
commit dd03907bf129 ("ASoC: soc-pcm: call snd_soc_component_open/close()
once") was not sufficient and led to PCM playback and module unload errors.

Implement handling of failures directly in soc_pcm_components_open(),
so that any successfully opened components are closed upon error with
other components. This allows to clean up error handling in
soc_pcm_open() without adding more state tracking.

Fixes: dd03907bf129 ("ASoC: soc-pcm: call snd_soc_component_open/close() once")
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
Link: https://lore.kernel.org/r/20200220094955.16968-1-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h |  7 ++-----
 sound/soc/soc-component.c     | 35 +++++++----------------------------
 sound/soc/soc-pcm.c           | 27 +++++++++++++++++++++------
 3 files changed, 30 insertions(+), 39 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 1866ecc8e94b..154d02fbbfed 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -147,6 +147,8 @@ struct snd_soc_component {
 
 	unsigned int active;
 
+	unsigned int suspended:1; /* is in suspend PM state */
+
 	struct list_head list;
 	struct list_head card_aux_list; /* for auxiliary bound components */
 	struct list_head card_list;
@@ -180,11 +182,6 @@ struct snd_soc_component {
 	struct dentry *debugfs_root;
 	const char *debugfs_prefix;
 #endif
-
-	/* bit field */
-	unsigned int suspended:1; /* is in suspend PM state */
-	unsigned int opened:1;
-	unsigned int module:1;
 };
 
 #define for_each_component_dais(component, dai)\
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index ee00c09df5e7..14e175cdeeb8 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -297,55 +297,34 @@ EXPORT_SYMBOL_GPL(snd_soc_component_set_jack);
 int snd_soc_component_module_get(struct snd_soc_component *component,
 				 int upon_open)
 {
-	if (component->module)
-		return 0;
-
 	if (component->driver->module_get_upon_open == !!upon_open &&
 	    !try_module_get(component->dev->driver->owner))
 		return -ENODEV;
 
-	component->module = 1;
-
 	return 0;
 }
 
 void snd_soc_component_module_put(struct snd_soc_component *component,
 				  int upon_open)
 {
-	if (component->module &&
-	    component->driver->module_get_upon_open == !!upon_open)
+	if (component->driver->module_get_upon_open == !!upon_open)
 		module_put(component->dev->driver->owner);
-
-	component->module = 0;
 }
 
 int snd_soc_component_open(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
-	int ret = 0;
-
-	if (!component->opened &&
-	    component->driver->open)
-		ret = component->driver->open(component, substream);
-
-	if (ret == 0)
-		component->opened = 1;
-
-	return ret;
+	if (component->driver->open)
+		return component->driver->open(component, substream);
+	return 0;
 }
 
 int snd_soc_component_close(struct snd_soc_component *component,
 			    struct snd_pcm_substream *substream)
 {
-	int ret = 0;
-
-	if (component->opened &&
-	    component->driver->close)
-		ret = component->driver->close(component, substream);
-
-	component->opened = 0;
-
-	return ret;
+	if (component->driver->close)
+		return component->driver->close(component, substream);
+	return 0;
 }
 
 int snd_soc_component_prepare(struct snd_soc_component *component,
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index aff27c8599ef..235baeb2d56a 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -469,28 +469,43 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 static int soc_pcm_components_open(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *last = NULL;
 	struct snd_soc_component *component;
 	int i, ret = 0;
 
 	for_each_rtd_components(rtd, i, component) {
+		last = component;
+
 		ret = snd_soc_component_module_get_when_open(component);
 		if (ret < 0) {
 			dev_err(component->dev,
 				"ASoC: can't get module %s\n",
 				component->name);
-			return ret;
+			break;
 		}
 
 		ret = snd_soc_component_open(component, substream);
 		if (ret < 0) {
+			snd_soc_component_module_put_when_close(component);
 			dev_err(component->dev,
 				"ASoC: can't open component %s: %d\n",
 				component->name, ret);
-			return ret;
+			break;
 		}
 	}
 
-	return 0;
+	if (ret < 0) {
+		/* rollback on error */
+		for_each_rtd_components(rtd, i, component) {
+			if (component == last)
+				break;
+
+			snd_soc_component_close(component, substream);
+			snd_soc_component_module_put_when_close(component);
+		}
+	}
+
+	return ret;
 }
 
 static int soc_pcm_components_close(struct snd_pcm_substream *substream)
@@ -585,7 +600,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	if (ret < 0) {
 		pr_err("ASoC: %s startup failed: %d\n",
 		       rtd->dai_link->name, ret);
-		goto component_err;
+		goto rtd_startup_err;
 	}
 
 	/* startup the audio subsystem */
@@ -681,9 +696,9 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	snd_soc_dai_shutdown(cpu_dai, substream);
 
 	soc_rtd_shutdown(rtd, substream);
-component_err:
+rtd_startup_err:
 	soc_pcm_components_close(substream);
-
+component_err:
 	mutex_unlock(&rtd->card->pcm_mutex);
 
 	for_each_rtd_components(rtd, i, component) {
-- 
2.20.1

