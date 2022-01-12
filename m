Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FD048C09E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 10:02:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A98671AA2;
	Wed, 12 Jan 2022 10:02:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A98671AA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641978175;
	bh=OOctC/WJvrvUusIpbqZbeVs1ealVVe3KRmSoy/SYgoc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KQ4zpN1lama+h2I5U9BRev6pFbKPGNlVryAAwE86PyFrP2YLuU72qSCX+qEsAJRzH
	 j4CBt7qD2uQUDrnEhE+tcFWCnf0bNguX2ehZ+zTS+dGf/MDj1g3bYy8Ux9zK3iVAUX
	 aSdHj3z917oYa3cpNZfW68DQWXRyjTC934l4Csjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 591BAF80515;
	Wed, 12 Jan 2022 10:00:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B8D1F80511; Wed, 12 Jan 2022 10:00:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B67CCF8025E
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 10:00:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B67CCF8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="guQGL2ct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641978047; x=1673514047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OOctC/WJvrvUusIpbqZbeVs1ealVVe3KRmSoy/SYgoc=;
 b=guQGL2ctHfvZhueaT/Fv8hYybJgq3MXOEhzKO8T6CzlDsb3KW/3PEn0j
 fi+4L85eA/WWTrxdG3TG9FvZ8iGATb3lLEc1ZLr5CSGVQncn8tiy72Oto
 d9Wz57xrQ/OrJneEI3LqqaAmc3wqKf4Li+iZ6CEV3L2Ntb56tzHQ3GaUT
 a8kwHZWbT0mhWveVxip/RaYfweRNCjmbmg5/aSji8EgpR1JZBrmSVqdWp
 7johnaFbgSNhrrWwQtDUZKQZG3hMpIkTeU5laDEhqZyTjSC3JPCaCMSDk
 ffreMZ9XPHywhh7mVSCLbhRWJ1I0fBAlryiD5SGBs7s8oGR6xs06jTaqL g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="223674394"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="223674394"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 01:00:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="691318397"
Received: from dev2.igk.intel.com ([10.237.148.94])
 by orsmga005.jf.intel.com with ESMTP; 12 Jan 2022 01:00:41 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 3/3] ASoC: topology: Optimize
 soc_tplg_dapm_graph_elems_load behavior
Date: Wed, 12 Jan 2022 18:00:30 +0100
Message-Id: <20220112170030.569712-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112170030.569712-1-amadeuszx.slawinski@linux.intel.com>
References: <20220112170030.569712-1-amadeuszx.slawinski@linux.intel.com>
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
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

