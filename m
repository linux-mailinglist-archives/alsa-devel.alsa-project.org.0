Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C25C2A0590
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 13:39:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F33C1665;
	Fri, 30 Oct 2020 13:38:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F33C1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604061566;
	bh=lzmqiMbGXWX07g4Q8ZJri5FjXeFDhHzjBIwbHHVNVU0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HvfY2dACSq4wQodPR0lYlHkhA9AiHX+29BkOwj9mg1Na254lQd1ngEum4sFSnWQZ0
	 AA7JNJTMneYVsnFcy/UWHmK4ElgCdm61RmqOO9llcadwKT9i3bXGntlXCA1wxghQ9w
	 JaAVbVpptf3GEC2ZnDmvk5N0T2wWpDb4MkczjSnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC179F8028B;
	Fri, 30 Oct 2020 13:37:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12AC2F8027C; Fri, 30 Oct 2020 13:37:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE824F800C0
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 13:37:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE824F800C0
IronPort-SDR: xCw8qk+lCKqtPMnwUSAyB7BOAxv6jM3HCTdfoNQlb7VWmj2tnBVxJD3tTYoYnlnxoXFUBQrgkZ
 QJMqFcOTmnEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="230234007"
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="230234007"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 05:37:36 -0700
IronPort-SDR: 1vaYukO3gzOqldnk1z5Kt9jfvV0ws4ftGs7cmr66gpyLlIJ/WDZ0qH5Ks4nNqiGb2cEMRsePLO
 S7Qu07Z+p/Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="362433709"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by orsmga007.jf.intel.com with ESMTP; 30 Oct 2020 05:37:33 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/6] ASoC: topology: Remove multistep topology loading
Date: Fri, 30 Oct 2020 10:54:23 -0400
Message-Id: <20201030145427.3497990-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030145427.3497990-1-amadeuszx.slawinski@linux.intel.com>
References: <20201030145427.3497990-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

In theory topology can be loaded in multiple steps by providing index to
snd_soc_tplg_component_load, however, from usability point of view it
doesn't make sense, as can be seen from all current users loading
topology in one go. Remove the unnecessary parameter.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/soc-topology.h           |  8 ++------
 sound/soc/intel/skylake/skl-topology.c |  9 ++-------
 sound/soc/soc-topology.c               | 18 +++---------------
 sound/soc/sof/pcm.c                    |  2 +-
 sound/soc/sof/topology.c               |  4 +---
 5 files changed, 9 insertions(+), 32 deletions(-)

diff --git a/include/sound/soc-topology.h b/include/sound/soc-topology.h
index b1ac5df82dba..328cf763d9b4 100644
--- a/include/sound/soc-topology.h
+++ b/include/sound/soc-topology.h
@@ -31,9 +31,6 @@ struct snd_soc_dai_driver;
 struct snd_soc_dai;
 struct snd_soc_dapm_route;
 
-/* object scan be loaded and unloaded in groups with identfying indexes */
-#define SND_SOC_TPLG_INDEX_ALL	0	/* ID that matches all FW objects */
-
 /* dynamic object type */
 enum snd_soc_dobj_type {
 	SND_SOC_DOBJ_NONE		= 0,	/* object is not dynamic */
@@ -181,9 +178,8 @@ static inline const void *snd_soc_tplg_get_data(struct snd_soc_tplg_hdr *hdr)
 
 /* Dynamic Object loading and removal for component drivers */
 int snd_soc_tplg_component_load(struct snd_soc_component *comp,
-	struct snd_soc_tplg_ops *ops, const struct firmware *fw,
-	u32 index);
-int snd_soc_tplg_component_remove(struct snd_soc_component *comp, u32 index);
+	struct snd_soc_tplg_ops *ops, const struct firmware *fw);
+int snd_soc_tplg_component_remove(struct snd_soc_component *comp);
 
 /* Binds event handlers to dynamic widgets */
 int snd_soc_tplg_widget_bind_event(struct snd_soc_dapm_widget *w,
diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 40bee10b0c65..ae466cd59292 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -3742,12 +3742,7 @@ int skl_tplg_init(struct snd_soc_component *component, struct hdac_bus *bus)
 	}
 
 component_load:
-
-	/*
-	 * The complete tplg for SKL is loaded as index 0, we don't use
-	 * any other index
-	 */
-	ret = snd_soc_tplg_component_load(component, &skl_tplg_ops, fw, 0);
+	ret = snd_soc_tplg_component_load(component, &skl_tplg_ops, fw);
 	if (ret < 0) {
 		dev_err(bus->dev, "tplg component load failed%d\n", ret);
 		goto err;
@@ -3777,5 +3772,5 @@ void skl_tplg_exit(struct snd_soc_component *component, struct hdac_bus *bus)
 		list_del(&ppl->node);
 
 	/* clean up topology */
-	snd_soc_tplg_component_remove(component, SND_SOC_TPLG_INDEX_ALL);
+	snd_soc_tplg_component_remove(component);
 }
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 7919097c162f..2a71cec7277e 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -64,7 +64,6 @@ struct soc_tplg {
 	struct device *dev;
 	struct snd_soc_component *comp;
 	u32 index;	/* current block index */
-	u32 req_index;	/* required index, only loaded/free matching blocks */
 
 	/* vendor specific kcontrol operations */
 	const struct snd_soc_tplg_kcontrol_ops *io_ops;
@@ -2680,11 +2679,6 @@ static int soc_tplg_load_header(struct soc_tplg *tplg,
 
 	tplg->pos = tplg->hdr_pos + sizeof(struct snd_soc_tplg_hdr);
 
-	/* check for matching ID */
-	if (le32_to_cpu(hdr->index) != tplg->req_index &&
-		tplg->req_index != SND_SOC_TPLG_INDEX_ALL)
-		return 0;
-
 	tplg->index = le32_to_cpu(hdr->index);
 
 	switch (le32_to_cpu(hdr->type)) {
@@ -2804,7 +2798,7 @@ static int soc_tplg_load(struct soc_tplg *tplg)
 
 /* load audio component topology from "firmware" file */
 int snd_soc_tplg_component_load(struct snd_soc_component *comp,
-	struct snd_soc_tplg_ops *ops, const struct firmware *fw, u32 id)
+	struct snd_soc_tplg_ops *ops, const struct firmware *fw)
 {
 	struct soc_tplg tplg;
 	int ret;
@@ -2819,7 +2813,6 @@ int snd_soc_tplg_component_load(struct snd_soc_component *comp,
 	tplg.dev = comp->dev;
 	tplg.comp = comp;
 	tplg.ops = ops;
-	tplg.req_index = id;
 	tplg.io_ops = ops->io_ops;
 	tplg.io_ops_count = ops->io_ops_count;
 	tplg.bytes_ext_ops = ops->bytes_ext_ops;
@@ -2828,14 +2821,14 @@ int snd_soc_tplg_component_load(struct snd_soc_component *comp,
 	ret = soc_tplg_load(&tplg);
 	/* free the created components if fail to load topology */
 	if (ret)
-		snd_soc_tplg_component_remove(comp, SND_SOC_TPLG_INDEX_ALL);
+		snd_soc_tplg_component_remove(comp);
 
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_tplg_component_load);
 
 /* remove dynamic controls from the component driver */
-int snd_soc_tplg_component_remove(struct snd_soc_component *comp, u32 index)
+int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
 {
 	struct snd_soc_dobj *dobj, *next_dobj;
 	int pass = SOC_TPLG_PASS_END;
@@ -2847,11 +2840,6 @@ int snd_soc_tplg_component_remove(struct snd_soc_component *comp, u32 index)
 		list_for_each_entry_safe(dobj, next_dobj, &comp->dobj_list,
 			list) {
 
-			/* match index */
-			if (dobj->index != index &&
-				index != SND_SOC_TPLG_INDEX_ALL)
-				continue;
-
 			switch (dobj->type) {
 			case SND_SOC_DOBJ_MIXER:
 				remove_mixer(comp, dobj, pass);
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index cbac6f17c52f..0a70e685f826 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -780,7 +780,7 @@ static int sof_pcm_probe(struct snd_soc_component *component)
 static void sof_pcm_remove(struct snd_soc_component *component)
 {
 	/* remove topology */
-	snd_soc_tplg_component_remove(component, SND_SOC_TPLG_INDEX_ALL);
+	snd_soc_tplg_component_remove(component);
 }
 
 void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 523a386fce4b..44fddeda6043 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3734,9 +3734,7 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 		return ret;
 	}
 
-	ret = snd_soc_tplg_component_load(scomp,
-					  &sof_tplg_ops, fw,
-					  SND_SOC_TPLG_INDEX_ALL);
+	ret = snd_soc_tplg_component_load(scomp, &sof_tplg_ops, fw);
 	if (ret < 0) {
 		dev_err(scomp->dev, "error: tplg component load failed %d\n",
 			ret);
-- 
2.25.1

