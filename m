Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D373FD744
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 11:55:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8F561782;
	Wed,  1 Sep 2021 11:54:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8F561782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630490113;
	bh=oxz9yH06zzVTZInj9/Fy/BuipfVUX0Y/sVy9MFm83io=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XoKpkBo9y8AqTBus6pYMTjmDvy1WnHL4LfXERB03MkeomfmPA0rQmf9WEHScXXgbt
	 LTOYJ5vxZYTNxmSat4XQtybzXhrQ3bYEO5Di/CT+iPiTLWc1AW6wPpzSjYrez+1QcB
	 uzoQtn9dimZCDHH0DgJojKauYt2juipNHqZKWm7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34FEFF80254;
	Wed,  1 Sep 2021 11:53:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33D81F804D9; Wed,  1 Sep 2021 11:53:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9430CF80254
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 11:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9430CF80254
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="304275904"
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; d="scan'208";a="304275904"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 02:53:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; d="scan'208";a="460674449"
Received: from pujfalus-mobl.ger.corp.intel.com (HELO
 peter-virtualbox.ger.corp.intel.com) ([10.251.211.191])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 02:53:06 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 vkoul@kernel.org
Subject: [PATCH 2/2] ASoC: compress/component: Use
 module_get_when_open/put_when_close for cstream
Date: Wed,  1 Sep 2021 12:52:55 +0300
Message-Id: <20210901095255.3617-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210901095255.3617-1-peter.ujfalusi@linux.intel.com>
References: <20210901095255.3617-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, alsa-devel@alsa-project.org,
 daniel.baluta@nxp.com, pierre-louis.bossart@linux.intel.com,
 kuninori.morimoto.gx@renesas.com
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

Currently the try_module_get() and module_put() is not possible for
compressed streams if the module_get_upon_open is set to 1 which means that\
the components are not protected in a same way as components when normal
audio is used.

SOF is setting module_get_upon_open to 1 for component drivers which works
correctly for audio stream but when compressed stream is used then the
module is not protected.

Convert the compress open and free operation to mimic the steps of it's
pcm counterpart to fix this issue.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/soc-component.h |  6 +++--
 sound/soc/soc-component.c     | 45 +++++++++++++++--------------------
 sound/soc/soc-compress.c      | 43 +++++++++++++++++++++++++++++----
 3 files changed, 61 insertions(+), 33 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index a393ac397eca..e09a2d108e8c 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -453,8 +453,10 @@ int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
 int snd_soc_component_of_xlate_dai_name(struct snd_soc_component *component,
 					const struct of_phandle_args *args,
 					const char **dai_name);
-int snd_soc_component_compr_open(struct snd_compr_stream *cstream);
-void snd_soc_component_compr_free(struct snd_compr_stream *cstream,
+int snd_soc_component_compr_open(struct snd_soc_component *component,
+				 struct snd_compr_stream *cstream);
+void snd_soc_component_compr_free(struct snd_soc_component *component,
+				  struct snd_compr_stream *cstream,
 				  int rollback);
 int snd_soc_component_compr_trigger(struct snd_compr_stream *cstream, int cmd);
 int snd_soc_component_compr_set_params(struct snd_compr_stream *cstream,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 82a1430313dc..a08a897c5230 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -423,43 +423,36 @@ EXPORT_SYMBOL_GPL(snd_soc_component_exit_regmap);
 
 #endif
 
-int snd_soc_component_compr_open(struct snd_compr_stream *cstream)
+int snd_soc_component_compr_open(struct snd_soc_component *component,
+				 struct snd_compr_stream *cstream)
 {
-	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct snd_soc_component *component;
-	int i, ret;
+	int ret = 0;
 
-	for_each_rtd_components(rtd, i, component) {
-		if (component->driver->compress_ops &&
-		    component->driver->compress_ops->open) {
-			ret = component->driver->compress_ops->open(component, cstream);
-			if (ret < 0)
-				return soc_component_ret(component, ret);
-		}
+	if (component->driver->compress_ops &&
+	    component->driver->compress_ops->open)
+		ret = component->driver->compress_ops->open(component, cstream);
+
+	/* mark substream if succeeded */
+	if (ret == 0)
 		soc_component_mark_push(component, cstream, compr_open);
-	}
 
-	return 0;
+	return soc_component_ret(component, ret);
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_compr_open);
 
-void snd_soc_component_compr_free(struct snd_compr_stream *cstream,
+void snd_soc_component_compr_free(struct snd_soc_component *component,
+				  struct snd_compr_stream *cstream,
 				  int rollback)
 {
-	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct snd_soc_component *component;
-	int i;
-
-	for_each_rtd_components(rtd, i, component) {
-		if (rollback && !soc_component_mark_match(component, cstream, compr_open))
-			continue;
+	if (rollback && !soc_component_mark_match(component, cstream, compr_open))
+		return;
 
-		if (component->driver->compress_ops &&
-		    component->driver->compress_ops->free)
-			component->driver->compress_ops->free(component, cstream);
+	if (component->driver->compress_ops &&
+	    component->driver->compress_ops->free)
+		component->driver->compress_ops->free(component, cstream);
 
-		soc_component_mark_pop(component, cstream, compr_open);
-	}
+	/* remove marked substream */
+	soc_component_mark_pop(component, cstream, compr_open);
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_compr_free);
 
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 36060800e9bd..8e2494a9f3a7 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -22,6 +22,39 @@
 #include <sound/soc-link.h>
 #include <linux/pm_runtime.h>
 
+static int snd_soc_compr_components_open(struct snd_compr_stream *cstream)
+{
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct snd_soc_component *component;
+	int ret = 0;
+	int i;
+
+	for_each_rtd_components(rtd, i, component) {
+		ret = snd_soc_component_module_get_when_open(component, cstream);
+		if (ret < 0)
+			break;
+
+		ret = snd_soc_component_compr_open(component, cstream);
+		if (ret < 0)
+			break;
+	}
+
+	return ret;
+}
+
+static void snd_soc_compr_components_free(struct snd_compr_stream *cstream,
+					  int rollback)
+{
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct snd_soc_component *component;
+	int i;
+
+	for_each_rtd_components(rtd, i, component) {
+		snd_soc_component_compr_free(component, cstream, rollback);
+		snd_soc_component_module_put_when_close(component, cstream, rollback);
+	}
+}
+
 static int soc_compr_clean(struct snd_compr_stream *cstream, int rollback)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
@@ -44,7 +77,7 @@ static int soc_compr_clean(struct snd_compr_stream *cstream, int rollback)
 
 	snd_soc_link_compr_shutdown(cstream, rollback);
 
-	snd_soc_component_compr_free(cstream, rollback);
+	snd_soc_compr_components_free(cstream, rollback);
 
 	snd_soc_dai_compr_shutdown(cpu_dai, cstream, rollback);
 
@@ -80,7 +113,7 @@ static int soc_compr_open(struct snd_compr_stream *cstream)
 	if (ret < 0)
 		goto err;
 
-	ret = snd_soc_component_compr_open(cstream);
+	ret = snd_soc_compr_components_open(cstream);
 	if (ret < 0)
 		goto err;
 
@@ -137,7 +170,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	if (ret < 0)
 		goto out;
 
-	ret = snd_soc_component_compr_open(cstream);
+	ret = snd_soc_compr_components_open(cstream);
 	if (ret < 0)
 		goto open_err;
 
@@ -160,7 +193,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	return 0;
 
 machine_err:
-	snd_soc_component_compr_free(cstream, 1);
+	snd_soc_compr_components_free(cstream, 1);
 open_err:
 	snd_soc_dai_compr_shutdown(cpu_dai, cstream, 1);
 out:
@@ -205,7 +238,7 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 
 	snd_soc_link_compr_shutdown(cstream, 0);
 
-	snd_soc_component_compr_free(cstream, 0);
+	snd_soc_compr_components_free(cstream, 0);
 
 	snd_soc_dai_compr_shutdown(cpu_dai, cstream, 0);
 
-- 
2.33.0

