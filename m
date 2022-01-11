Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E942948AC2C
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 12:08:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AE9118FC;
	Tue, 11 Jan 2022 12:07:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AE9118FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641899297;
	bh=dzaI2YF/XRe2vlWB2oO0pnL2x9Sn2151aMsVfg+9vpU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YOJpzsN8d0xXN1icG0+muwCcfIponraN1iEMowsINSN9jrw7EXwHib1xQczT8AmtB
	 4wy+8RrHKlysjnjOO+dUwa2gmNRbbZ+YOLva5OJ6woz2FQ5m+5u2LY4t17CP15kP0d
	 kEV3jNyfofGLIb5xjxfAfIvnQuz6DywAZezhkcaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E64EEF80515;
	Tue, 11 Jan 2022 12:06:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34CB6F8025E; Tue, 11 Jan 2022 12:06:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8736F8025E
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 12:06:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8736F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Zr+WfS88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641899165; x=1673435165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dzaI2YF/XRe2vlWB2oO0pnL2x9Sn2151aMsVfg+9vpU=;
 b=Zr+WfS88LTDg3DXVPSBR7Ww45+1klx8Whq+Tsqq2GRNztlq8VANppTkR
 uIcGfhpEM++tKAGiujz2fceN8YJWm1un0GJRs1WVZfqS85XppSrlpTpB6
 fFVlabc3xEdercf1rcJrdT2+GhkhU/HSWOZ2VoqLhMFFLWb84fw/TByuz
 hzmUFzwvG72pRCJvjVvWIWBQH2ukXdeJSZbH0tV1X6EbWez0bNe+QbCGn
 SvZXgU2FQ+ezLZN4fqjhmXesCHK1qIBbLZuUDGbi7Kpj7jPULo4Mh+oWG
 DIMsmaVHzDTuSmRyjZugkgrYf07DjXbixvk4MAVI3maMkxsls7X9l0UW7 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="241012624"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="241012624"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 03:06:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="528700976"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 11 Jan 2022 03:05:59 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/3] ASoC: topology: Optimize soc_tplg_dapm_graph_elems_load
 behavior
Date: Tue, 11 Jan 2022 20:05:28 +0100
Message-Id: <20220111190528.445248-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111190528.445248-1-amadeuszx.slawinski@linux.intel.com>
References: <20220111190528.445248-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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

Before commit "ASoC: topology: Change allocations to resource managed"
soc_tplg_dapm_graph_elems_load() used to free routes on error. During
migration to managed allocations the routes table was left as is, but
looking at it again it is unnecessary, so remove routes table and just
keep pointer to DAPM route currently being set up. Also remove outdated
comments which keep describing old behavior of remove_route() freeing
memory. While it still does some cleanup, it leaves freeing memory to
framework.

Fixes: ff9226224437 ("ASoC: topology: Change allocations to resource managed")
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-topology.c | 56 ++++++++++------------------------------
 1 file changed, 14 insertions(+), 42 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 9d24184f85f9..6c7dc571c006 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1094,7 +1094,7 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 {
 	struct snd_soc_dapm_context *dapm = &tplg->comp->dapm;
 	struct snd_soc_tplg_dapm_graph_elem *elem;
-	struct snd_soc_dapm_route **routes;
+	struct snd_soc_dapm_route *route;
 	int count, i;
 	int ret = 0;
 
@@ -1108,24 +1108,10 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 	dev_dbg(tplg->dev, "ASoC: adding %d DAPM routes for index %d\n", count,
 		hdr->index);
 
-	/* allocate memory for pointer to array of dapm routes */
-	routes = kcalloc(count, sizeof(struct snd_soc_dapm_route *),
-			 GFP_KERNEL);
-	if (!routes)
-		return -ENOMEM;
-
-	/*
-	 * allocate memory for each dapm route in the array.
-	 * This needs to be done individually so that
-	 * each route can be freed when it is removed in remove_route().
-	 */
 	for (i = 0; i < count; i++) {
-		routes[i] = devm_kzalloc(tplg->dev, sizeof(*routes[i]), GFP_KERNEL);
-		if (!routes[i])
+		route = devm_kzalloc(tplg->dev, sizeof(*route), GFP_KERNEL);
+		if (!route)
 			return -ENOMEM;
-	}
-
-	for (i = 0; i < count; i++) {
 		elem = (struct snd_soc_tplg_dapm_graph_elem *)tplg->pos;
 		tplg->pos += sizeof(struct snd_soc_tplg_dapm_graph_elem);
 
@@ -1146,46 +1132,32 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 			break;
 		}
 
-		routes[i]->source = elem->source;
-		routes[i]->sink = elem->sink;
+		route->source = elem->source;
+		route->sink = elem->sink;
 
 		/* set to NULL atm for tplg users */
-		routes[i]->connected = NULL;
+		route->connected = NULL;
 		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0)
-			routes[i]->control = NULL;
+			route->control = NULL;
 		else
-			routes[i]->control = elem->control;
+			route->control = elem->control;
 
 		/* add route dobj to dobj_list */
-		routes[i]->dobj.type = SND_SOC_DOBJ_GRAPH;
-		routes[i]->dobj.ops = tplg->ops;
-		routes[i]->dobj.index = tplg->index;
-		list_add(&routes[i]->dobj.list, &tplg->comp->dobj_list);
+		route->dobj.type = SND_SOC_DOBJ_GRAPH;
+		route->dobj.ops = tplg->ops;
+		route->dobj.index = tplg->index;
+		list_add(&route->dobj.list, &tplg->comp->dobj_list);
 
-		ret = soc_tplg_add_route(tplg, routes[i]);
+		ret = soc_tplg_add_route(tplg, route);
 		if (ret < 0) {
 			dev_err(tplg->dev, "ASoC: topology: add_route failed: %d\n", ret);
-			/*
-			 * this route was added to the list, it will
-			 * be freed in remove_route() so increment the
-			 * counter to skip it in the error handling
-			 * below.
-			 */
-			i++;
 			break;
 		}
 
 		/* add route, but keep going if some fail */
-		snd_soc_dapm_add_routes(dapm, routes[i], 1);
+		snd_soc_dapm_add_routes(dapm, route, 1);
 	}
 
-	/*
-	 * free pointer to array of dapm routes as this is no longer needed.
-	 * The memory allocated for each dapm route will be freed
-	 * when it is removed in remove_route().
-	 */
-	kfree(routes);
-
 	return ret;
 }
 
-- 
2.25.1

