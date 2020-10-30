Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C09AE2A0592
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 13:40:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3ED8166E;
	Fri, 30 Oct 2020 13:39:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3ED8166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604061605;
	bh=eUMcyIIdXPAZjs/7ytSX7BmdStbvustHnZeWcielkpo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nZoNyr2Um+LX8kRanEedDJ/93mJZ2rHaVKbZ+9cVzCNyw+qABJplnz1bTmekncsjc
	 aTmvcJgwE6mNUUDidUgBNoC1sTgg4qhmJ84ynmfyZ0oEZBdsk5WCz7T2lD8NlpBRUO
	 zQ1jJ0cRSkmuwCIci/nSqRZlxh9e/HbH052dXFAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 511E7F804C2;
	Fri, 30 Oct 2020 13:37:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC326F8027C; Fri, 30 Oct 2020 13:37:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 028AEF80212
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 13:37:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 028AEF80212
IronPort-SDR: Zm8qoOFHbmUWr2X1JO54rkYm9MGztt3e2KdcZP75Rmh8WHzM9XXuP5iEpjfuxVwkQ1oCgNsDMM
 8RgsecMv1Zuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="230234002"
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="230234002"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 05:37:33 -0700
IronPort-SDR: C8bv+D5qSN1OoAnerKvIUYfKOMZQGUA2AElNlj3+Bpu0HllW6gsAhUVrRIEk5oxi+0Mg8tTFoI
 wrYjjaBEakIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="362433702"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by orsmga007.jf.intel.com with ESMTP; 30 Oct 2020 05:37:30 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/6] ASoC: topology: Remove unused functions from topology API
Date: Fri, 30 Oct 2020 10:54:22 -0400
Message-Id: <20201030145427.3497990-2-amadeuszx.slawinski@linux.intel.com>
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

Topology API exposes snd_soc_tplg_widget_remove and
snd_soc_tplg_widget_remove_all, but both are nowhere used. All current
users load and unload topology as a whole. As following commits
introduce resource managed memory, remove them to simplify code and
reduce maintenance burden.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/soc-topology.h |  5 -----
 sound/soc/soc-topology.c     | 37 +-----------------------------------
 2 files changed, 1 insertion(+), 41 deletions(-)

diff --git a/include/sound/soc-topology.h b/include/sound/soc-topology.h
index 5223896de26f..b1ac5df82dba 100644
--- a/include/sound/soc-topology.h
+++ b/include/sound/soc-topology.h
@@ -185,11 +185,6 @@ int snd_soc_tplg_component_load(struct snd_soc_component *comp,
 	u32 index);
 int snd_soc_tplg_component_remove(struct snd_soc_component *comp, u32 index);
 
-/* Widget removal - widgets also removed wth component API */
-void snd_soc_tplg_widget_remove(struct snd_soc_dapm_widget *w);
-void snd_soc_tplg_widget_remove_all(struct snd_soc_dapm_context *dapm,
-	u32 index);
-
 /* Binds event handlers to dynamic widgets */
 int snd_soc_tplg_widget_bind_event(struct snd_soc_dapm_widget *w,
 	const struct snd_soc_tplg_widget_events *events, int num_events,
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index c5ef432a023b..7919097c162f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1725,7 +1725,7 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 	return 0;
 
 ready_err:
-	snd_soc_tplg_widget_remove(widget);
+	remove_widget(widget->dapm->component, &widget->dobj, SOC_TPLG_PASS_WIDGET);
 	snd_soc_dapm_free_widget(widget);
 hdr_err:
 	kfree(template.sname);
@@ -2834,41 +2834,6 @@ int snd_soc_tplg_component_load(struct snd_soc_component *comp,
 }
 EXPORT_SYMBOL_GPL(snd_soc_tplg_component_load);
 
-/* remove this dynamic widget */
-void snd_soc_tplg_widget_remove(struct snd_soc_dapm_widget *w)
-{
-	/* make sure we are a widget */
-	if (w->dobj.type != SND_SOC_DOBJ_WIDGET)
-		return;
-
-	remove_widget(w->dapm->component, &w->dobj, SOC_TPLG_PASS_WIDGET);
-}
-EXPORT_SYMBOL_GPL(snd_soc_tplg_widget_remove);
-
-/* remove all dynamic widgets from this DAPM context */
-void snd_soc_tplg_widget_remove_all(struct snd_soc_dapm_context *dapm,
-	u32 index)
-{
-	struct snd_soc_dapm_widget *w, *next_w;
-
-	for_each_card_widgets_safe(dapm->card, w, next_w) {
-
-		/* make sure we are a widget with correct context */
-		if (w->dobj.type != SND_SOC_DOBJ_WIDGET || w->dapm != dapm)
-			continue;
-
-		/* match ID */
-		if (w->dobj.index != index &&
-			w->dobj.index != SND_SOC_TPLG_INDEX_ALL)
-			continue;
-		/* check and free and dynamic widget kcontrols */
-		snd_soc_tplg_widget_remove(w);
-		snd_soc_dapm_free_widget(w);
-	}
-	snd_soc_dapm_reset_cache(dapm);
-}
-EXPORT_SYMBOL_GPL(snd_soc_tplg_widget_remove_all);
-
 /* remove dynamic controls from the component driver */
 int snd_soc_tplg_component_remove(struct snd_soc_component *comp, u32 index)
 {
-- 
2.25.1

