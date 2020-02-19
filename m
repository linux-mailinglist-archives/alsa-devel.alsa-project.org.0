Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D05A8164DA1
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 19:28:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7106016A9;
	Wed, 19 Feb 2020 19:28:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7106016A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582136930;
	bh=ocofenViH0wWhVGYtYBsxGCoVAHQw03DLRAkFcqg760=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GPsD+35TtUx0aSK+nbJNHTldxJ/2I7idjqDe5K9y/djeBWZk2ZKWOBf2/exMGQ74X
	 FsNqKTOa7bVtFklDXEioUGJie22BEumvINTyo6TSgtTUPVMOn0i4fCU/Au6KPfih6U
	 SRpHeTdkdJCd+FyWM6DLncqzEAfYR6OVK5yz9laI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A6B2F80114;
	Wed, 19 Feb 2020 19:27:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CB2DF80273; Wed, 19 Feb 2020 19:27:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E923F80114
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 19:27:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E923F80114
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 10:27:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; d="scan'208";a="315473062"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001.jf.intel.com with ESMTP; 19 Feb 2020 10:26:58 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: broonie@kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, digetx@gmail.com
Subject: [PATCH] ASoC: soc-pcm: Revert "call snd_soc_component_open/close()
 once"
Date: Wed, 19 Feb 2020 20:26:50 +0200
Message-Id: <20200219182650.1416-1-kai.vehmanen@linux.intel.com>
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

ASoC component open/close and snd_soc_component_module_get/put are
called independently for each component-substream pair, so the logic
in the reverted patch was not sufficient and led to PCM playback and
module unload errors.

Fixes: dd03907bf129 ("ASoC: soc-pcm: call snd_soc_component_open/close() once")
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/soc-component.h |  7 ++-----
 sound/soc/soc-component.c     | 35 +++++++----------------------------
 sound/soc/soc-pcm.c           | 19 +++++++++++++------
 3 files changed, 22 insertions(+), 39 deletions(-)

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
index 63f67eb7c077..0c3a12d6290a 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -466,13 +466,16 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 	hw->rate_max = min_not_zero(hw->rate_max, rate_max);
 }
 
-static int soc_pcm_components_open(struct snd_pcm_substream *substream)
+static int soc_pcm_components_open(struct snd_pcm_substream *substream,
+				   struct snd_soc_component **last)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
 	int i, ret = 0;
 
 	for_each_rtd_components(rtd, i, component) {
+		*last = component;
+
 		ret = snd_soc_component_module_get_when_open(component);
 		if (ret < 0) {
 			dev_err(component->dev,
@@ -489,17 +492,21 @@ static int soc_pcm_components_open(struct snd_pcm_substream *substream)
 			return ret;
 		}
 	}
-
+	*last = NULL;
 	return 0;
 }
 
-static int soc_pcm_components_close(struct snd_pcm_substream *substream)
+static int soc_pcm_components_close(struct snd_pcm_substream *substream,
+				    struct snd_soc_component *last)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component;
 	int i, r, ret = 0;
 
 	for_each_rtd_components(rtd, i, component) {
+		if (component == last)
+			break;
+
 		r = snd_soc_component_close(component, substream);
 		if (r < 0)
 			ret = r; /* use last ret */
@@ -536,7 +543,7 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 
 	soc_rtd_shutdown(rtd, substream);
 
-	soc_pcm_components_close(substream);
+	soc_pcm_components_close(substream, NULL);
 
 	snd_soc_dapm_stream_stop(rtd, substream->stream);
 
@@ -577,7 +584,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
-	ret = soc_pcm_components_open(substream);
+	ret = soc_pcm_components_open(substream, &component);
 	if (ret < 0)
 		goto component_err;
 
@@ -682,7 +689,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 
 	soc_rtd_shutdown(rtd, substream);
 component_err:
-	soc_pcm_components_close(substream);
+	soc_pcm_components_close(substream, component);
 
 	mutex_unlock(&rtd->card->pcm_mutex);
 
-- 
2.17.1

