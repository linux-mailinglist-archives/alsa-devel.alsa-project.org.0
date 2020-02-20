Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E8F165A7E
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 10:51:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A34D16A6;
	Thu, 20 Feb 2020 10:51:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A34D16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582192311;
	bh=rEDM1PIt/P+lRsq3tQgKn9jd1rNrV1aqLUquYMe5yiU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vcvztaTZhwlfb2IED08pMJusYu6gXCkI6GDzEob2FxHGKDWyT93lKg1SFmSR2LdFG
	 xyovhCCMh+heoO9SnYHDfoPWLfKltD9poqrxJN72s9XW7kdF8ijcVUbl2oKlfjjW5T
	 Hl6euXpJmgoBIDL27R69clvEsOZaS1Dsft9vczD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86EA4F8014A;
	Thu, 20 Feb 2020 10:50:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18B5BF80148; Thu, 20 Feb 2020 10:50:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A650F80101
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 10:50:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A650F80101
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 01:50:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,463,1574150400"; d="scan'208";a="236192914"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003.jf.intel.com with ESMTP; 20 Feb 2020 01:49:58 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: broonie@kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, digetx@gmail.com
Subject: [PATCH] ASoC: soc-pcm: fix state tracking error in
 snd_soc_component_open/close()
Date: Thu, 20 Feb 2020 11:49:55 +0200
Message-Id: <20200220094955.16968-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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
index 63f67eb7c077..9e761f932887 100644
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
2.17.1

