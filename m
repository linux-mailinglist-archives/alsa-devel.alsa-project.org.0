Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7E167B1EB
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 12:49:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AD4CE80;
	Wed, 25 Jan 2023 12:48:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AD4CE80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674647349;
	bh=HjbgcYHF3nHFxYsR6dgTVhqIrcJWPkxQkn4kDSsiueQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=e1HFKaWxHXwRZl5qT6cSy0V7HuCt3aD0K5dcRpDhEKek7p04blFTkN6H82H2rm2wE
	 hkEam13v6vdJt3X/l1BMgasinJ81NvDA5CdH+5AYiQ/IDU0PNxbk15AhuUSSCKmHyo
	 /dG+fkYZYTHBjt17gB/Kaj5EZA+Sr8hb33MH9vsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A39DAF80579;
	Wed, 25 Jan 2023 12:46:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C851F80558; Wed, 25 Jan 2023 12:46:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFC5CF80543
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 12:46:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFC5CF80543
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=l9JQ2MNE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674647180; x=1706183180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HjbgcYHF3nHFxYsR6dgTVhqIrcJWPkxQkn4kDSsiueQ=;
 b=l9JQ2MNEdVJTwbp+1/qTZ3A52a19x4kv4tLDvlYbQM7lbDuIlOjqSg93
 SfMo2GfkHZw7iWwxvt3BUMmPr5NtC30x9F/vZr9QukjMsBBxU19SFqymb
 3qxMTez0KoXql54D0GQvZTk9RTXTd4Iv1NScLNgRwnmwBRok6/ddKEiDU
 3ivavY9bRHLCuderZB9kWwmGnrrNxKAEHoOZ7yOf7bw9EOzarHcDbuiHZ
 48M4R5mXEyZ7vyibjZ3SEj+AVZKnCYND6oB/DuuqWSZa66ALwXaAD+Pk1
 CzR5Wupob4VOjOPiyU326W6YM9k5dNq/lbVyeMD8bckNlC2LDWJlaGEmd w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="324234244"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="324234244"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 03:46:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="612394054"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="612394054"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga003.jf.intel.com with ESMTP; 25 Jan 2023 03:46:17 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 10/11] ASoC: topology: Use unload() op directly
Date: Wed, 25 Jan 2023 20:46:48 +0100
Message-Id: <20230125194649.3485731-11-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125194649.3485731-1-amadeuszx.slawinski@linux.intel.com>
References: <20230125194649.3485731-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Generic dynamic object (struct snd_soc_dobj) needs pointer to unload
function, however, instead of using function pointer to point at it
directly it points to all topology operations. Change code to use the
function pointer instead.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/soc-topology.h |  2 +-
 sound/soc/soc-topology.c     | 56 ++++++++++++++++++++----------------
 2 files changed, 33 insertions(+), 25 deletions(-)

diff --git a/include/sound/soc-topology.h b/include/sound/soc-topology.h
index b4b896f83b94..f055c6917f6c 100644
--- a/include/sound/soc-topology.h
+++ b/include/sound/soc-topology.h
@@ -62,7 +62,7 @@ struct snd_soc_dobj {
 	enum snd_soc_dobj_type type;
 	unsigned int index;	/* objects can belong in different groups */
 	struct list_head list;
-	struct snd_soc_tplg_ops *ops;
+	int (*unload)(struct snd_soc_component *comp, struct snd_soc_dobj *dobj);
 	union {
 		struct snd_soc_dobj_control control;
 		struct snd_soc_dobj_widget widget;
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 6689cf44464c..eb49037d86ae 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -359,8 +359,8 @@ static void soc_tplg_remove_mixer(struct snd_soc_component *comp,
 	if (pass != SOC_TPLG_PASS_CONTROL)
 		return;
 
-	if (dobj->ops && dobj->ops->control_unload)
-		dobj->ops->control_unload(comp, dobj);
+	if (dobj->unload)
+		dobj->unload(comp, dobj);
 
 	snd_ctl_remove(card, dobj->control.kcontrol);
 	list_del(&dobj->list);
@@ -375,8 +375,8 @@ static void soc_tplg_remove_enum(struct snd_soc_component *comp,
 	if (pass != SOC_TPLG_PASS_CONTROL)
 		return;
 
-	if (dobj->ops && dobj->ops->control_unload)
-		dobj->ops->control_unload(comp, dobj);
+	if (dobj->unload)
+		dobj->unload(comp, dobj);
 
 	snd_ctl_remove(card, dobj->control.kcontrol);
 	list_del(&dobj->list);
@@ -391,8 +391,8 @@ static void soc_tplg_remove_bytes(struct snd_soc_component *comp,
 	if (pass != SOC_TPLG_PASS_CONTROL)
 		return;
 
-	if (dobj->ops && dobj->ops->control_unload)
-		dobj->ops->control_unload(comp, dobj);
+	if (dobj->unload)
+		dobj->unload(comp, dobj);
 
 	snd_ctl_remove(card, dobj->control.kcontrol);
 	list_del(&dobj->list);
@@ -405,8 +405,8 @@ static void soc_tplg_remove_route(struct snd_soc_component *comp,
 	if (pass != SOC_TPLG_PASS_GRAPH)
 		return;
 
-	if (dobj->ops && dobj->ops->dapm_route_unload)
-		dobj->ops->dapm_route_unload(comp, dobj);
+	if (dobj->unload)
+		dobj->unload(comp, dobj);
 
 	list_del(&dobj->list);
 }
@@ -423,8 +423,8 @@ static void soc_tplg_remove_widget(struct snd_soc_component *comp,
 	if (pass != SOC_TPLG_PASS_WIDGET)
 		return;
 
-	if (dobj->ops && dobj->ops->widget_unload)
-		dobj->ops->widget_unload(comp, dobj);
+	if (dobj->unload)
+		dobj->unload(comp, dobj);
 
 	if (!w->kcontrols)
 		goto free_news;
@@ -450,8 +450,8 @@ static void soc_tplg_remove_dai(struct snd_soc_component *comp,
 	if (pass != SOC_TPLG_PASS_PCM_DAI)
 		return;
 
-	if (dobj->ops && dobj->ops->dai_unload)
-		dobj->ops->dai_unload(comp, dobj);
+	if (dobj->unload)
+		dobj->unload(comp, dobj);
 
 	for_each_component_dais_safe(comp, dai, _dai)
 		if (dai->driver == dai_drv)
@@ -470,8 +470,8 @@ static void soc_tplg_remove_link(struct snd_soc_component *comp,
 	if (pass != SOC_TPLG_PASS_PCM_DAI)
 		return;
 
-	if (dobj->ops && dobj->ops->link_unload)
-		dobj->ops->link_unload(comp, dobj);
+	if (dobj->unload)
+		dobj->unload(comp, dobj);
 
 	list_del(&dobj->list);
 	snd_soc_remove_pcm_runtime(comp->card,
@@ -485,8 +485,8 @@ static void remove_backend_link(struct snd_soc_component *comp,
 	if (pass != SOC_TPLG_PASS_LINK)
 		return;
 
-	if (dobj->ops && dobj->ops->link_unload)
-		dobj->ops->link_unload(comp, dobj);
+	if (dobj->unload)
+		dobj->unload(comp, dobj);
 
 	/*
 	 * We don't free the link here as what soc_tplg_remove_link() do since BE
@@ -710,7 +710,8 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, size_t size)
 
 	sbe->max = le32_to_cpu(be->max);
 	sbe->dobj.type = SND_SOC_DOBJ_BYTES;
-	sbe->dobj.ops = tplg->ops;
+	if (tplg->ops)
+		sbe->dobj.unload = tplg->ops->control_unload;
 	INIT_LIST_HEAD(&sbe->dobj.list);
 
 	/* map io handlers */
@@ -786,8 +787,9 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, size_t size)
 	sm->invert = le32_to_cpu(mc->invert);
 	sm->platform_max = le32_to_cpu(mc->platform_max);
 	sm->dobj.index = tplg->index;
-	sm->dobj.ops = tplg->ops;
 	sm->dobj.type = SND_SOC_DOBJ_MIXER;
+	if (tplg->ops)
+		sm->dobj.unload = tplg->ops->control_unload;
 	INIT_LIST_HEAD(&sm->dobj.list);
 
 	/* map io handlers */
@@ -932,7 +934,8 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, size_t size)
 	se->mask = le32_to_cpu(ec->mask);
 	se->dobj.index = tplg->index;
 	se->dobj.type = SND_SOC_DOBJ_ENUM;
-	se->dobj.ops = tplg->ops;
+	if (tplg->ops)
+		se->dobj.unload = tplg->ops->control_unload;
 	INIT_LIST_HEAD(&se->dobj.list);
 
 	switch (le32_to_cpu(ec->hdr.ops.info)) {
@@ -1109,7 +1112,8 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 
 		/* add route dobj to dobj_list */
 		route->dobj.type = SND_SOC_DOBJ_GRAPH;
-		route->dobj.ops = tplg->ops;
+		if (tplg->ops)
+			route->dobj.unload = tplg->ops->control_unload;
 		route->dobj.index = tplg->index;
 		list_add(&route->dobj.list, &tplg->comp->dobj_list);
 
@@ -1475,7 +1479,8 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 
 	widget->dobj.type = SND_SOC_DOBJ_WIDGET;
 	widget->dobj.widget.kcontrol_type = kcontrol_type;
-	widget->dobj.ops = tplg->ops;
+	if (tplg->ops)
+		widget->dobj.unload = tplg->ops->widget_unload;
 	widget->dobj.index = tplg->index;
 	list_add(&widget->dobj.list, &tplg->comp->dobj_list);
 
@@ -1653,8 +1658,9 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
 	}
 
 	dai_drv->dobj.index = tplg->index;
-	dai_drv->dobj.ops = tplg->ops;
 	dai_drv->dobj.type = SND_SOC_DOBJ_PCM;
+	if (tplg->ops)
+		dai_drv->dobj.unload = tplg->ops->dai_unload;
 	list_add(&dai_drv->dobj.list, &tplg->comp->dobj_list);
 
 	/* register the DAI to the component */
@@ -1723,8 +1729,9 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	link->num_platforms = 1;
 
 	link->dobj.index = tplg->index;
-	link->dobj.ops = tplg->ops;
 	link->dobj.type = SND_SOC_DOBJ_DAI_LINK;
+	if (tplg->ops)
+		link->dobj.unload = tplg->ops->link_unload;
 
 	if (strlen(pcm->pcm_name)) {
 		link->name = devm_kstrdup(tplg->dev, pcm->pcm_name, GFP_KERNEL);
@@ -2131,8 +2138,9 @@ static int soc_tplg_link_config(struct soc_tplg *tplg,
 
 	/* for unloading it in snd_soc_tplg_component_remove */
 	link->dobj.index = tplg->index;
-	link->dobj.ops = tplg->ops;
 	link->dobj.type = SND_SOC_DOBJ_BACKEND_LINK;
+	if (tplg->ops)
+		link->dobj.unload = tplg->ops->link_unload;
 	list_add(&link->dobj.list, &tplg->comp->dobj_list);
 
 	return 0;
-- 
2.25.1

