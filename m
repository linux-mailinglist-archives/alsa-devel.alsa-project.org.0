Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A08217996
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 22:40:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B18F61687;
	Tue,  7 Jul 2020 22:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B18F61687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594154457;
	bh=JUDdlDDC36DCrxOvwOLT4L4OHeRxzBmIV1bGUn/vgPc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MRvNWNciACmCV+kcoNaaWnRiKD3fSsmTFWkzE4DmCaHykMzO85y00un3xMuK151va
	 qPgYEU/s+4JHYxq2wBWmkr70giWrezf/Uqo4lzHMKiiokitiuuxLyGn4qhh9AunVbu
	 TvITzuusLn0Oe8xr1Jb06Lhv5nv6cCEWnb66gSiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFE3BF802A9;
	Tue,  7 Jul 2020 22:38:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97900F802A9; Tue,  7 Jul 2020 22:38:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEDE6F801F9
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 22:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEDE6F801F9
IronPort-SDR: KsWuK+495u219OMizxihFLTwjrMymfncc4xV1oRo883GmPY7bp29UCFAc8nvai7X4q9B5NyVQy
 C7WMBJJv7c1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="147700566"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="147700566"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:38:22 -0700
IronPort-SDR: wI2Jem4H0PTn6qi5A7Lw7sfSbJtx8y83ntqbpFFWYrxTyQr6D2xu7zGRl8cW3zmWQsQLFIIVYu
 dy/4j+TqVc2A==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="483640804"
Received: from colvinch-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:38:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ASoC: topology: fix kernel oops on route addition error
Date: Tue,  7 Jul 2020 15:37:45 -0500
Message-Id: <20200707203749.113883-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707203749.113883-1-pierre-louis.bossart@linux.intel.com>
References: <20200707203749.113883-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

When errors happens while loading graph components, the kernel oopses
while trying to remove all topology components. This can be
root-caused to a list pointing to memory that was already freed on
error.

remove_route() is already called on errors and will perform the
required cleanups so there's no need to free the route memory in
soc_tplg_dapm_graph_elems_load() if the route was added to the
list. We do however want to free the routes allocated but not added to
the list.

Fixes: 7df04ea7a31ea ('ASoC: topology: modify dapm route loading routine and add dapm route unloading')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/soc-topology.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 43e5745b06aa..f336a9cfc16f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1261,17 +1261,29 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 		list_add(&routes[i]->dobj.list, &tplg->comp->dobj_list);
 
 		ret = soc_tplg_add_route(tplg, routes[i]);
-		if (ret < 0)
+		if (ret < 0) {
+			/*
+			 * this route was added to the list, it will
+			 * be freed in remove_route() so increment the
+			 * counter to skip it in the error handling
+			 * below.
+			 */
+			i++;
 			break;
+		}
 
 		/* add route, but keep going if some fail */
 		snd_soc_dapm_add_routes(dapm, routes[i], 1);
 	}
 
-	/* free memory allocated for all dapm routes in case of error */
-	if (ret < 0)
-		for (i = 0; i < count ; i++)
-			kfree(routes[i]);
+	/*
+	 * free memory allocated for all dapm routes not added to the
+	 * list in case of error
+	 */
+	if (ret < 0) {
+		while (i < count)
+			kfree(routes[i++]);
+	}
 
 	/*
 	 * free pointer to array of dapm routes as this is no longer needed.
-- 
2.25.1

