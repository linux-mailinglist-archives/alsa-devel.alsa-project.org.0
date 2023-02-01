Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B1268656B
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 12:30:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54569836;
	Wed,  1 Feb 2023 12:29:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54569836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675251022;
	bh=Vl2HJSwfSR5lkLqCRdv6CFEeu+SEaD2DT5NE+KA+YG4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rboXJ8hvrdPT+L7sOTl2loZ80ECeLQuq2VhryrP5ERZCvOfelZJJZAJKUAaVPNdHR
	 eJxVVT1b6y8BArslgisf5hbsv+i9G2Z8E85gT6GzlntJpIEkWCac92duNgYbBeWRuK
	 iwvILJ64K9BEw+C5gR10aOjz9x7EzTd78wy2QgjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04B3EF80494;
	Wed,  1 Feb 2023 12:28:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6427F8045D; Wed,  1 Feb 2023 12:28:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0268F80423
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 12:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0268F80423
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Vgl6wYnX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675250928; x=1706786928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vl2HJSwfSR5lkLqCRdv6CFEeu+SEaD2DT5NE+KA+YG4=;
 b=Vgl6wYnXjh9xKcnvAE/qOBm8LBh4F2ZlHnTJRYMsrJcQUBIEka46hfVT
 6ItYyEIxZzAE2O8TFkrZJlqLxgi4iCGKKZvk1evjD7HJHjLWUsh5j4dru
 LPd4Ghxn9WU18Vg0izc9vh3s3MpwIq6rTeB0w62/aBWvX0NN/s589cSjr
 xu2KSblyzDqDcBRZNF2lwq8FHGiP3Rz7EFmwTRCd3sjjGP7YaPnsTQknm
 Bbwtny+xK/wJQDN66hO20roIHzCNXAACHWSdNzqMnO2Tn8htsJ7yeLLdc
 tWAGW6NrnqPoKtFlx5GEh33iE/iOloW5MBR3qXFDmX929wQ8ACQw5sHmU g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="329409388"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="329409388"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 03:28:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="642374246"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="642374246"
Received: from jehdildi-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.31.67])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 03:28:42 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org, kuninori.morimoto.gx@renesas.com,
 amadeuszx.slawinski@linux.intel.com
Subject: [PATCH 2/2] ASoC: topology: Set correct unload callback for graph type
Date: Wed,  1 Feb 2023 13:28:46 +0200
Message-Id: <20230201112846.27707-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201112846.27707-1-peter.ujfalusi@linux.intel.com>
References: <20230201112846.27707-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
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
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 kai.vehmanen@linux.intel.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Using the control_unload for graph type of elem will lead surprises on
module unload.

The correct callback to use is the dapm_route_unload.

Fixes: 31e9273912bf ("ASoC: topology: Use unload() op directly")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index caf547816ea7..78223603088e 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1081,7 +1081,7 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 		/* add route dobj to dobj_list */
 		route->dobj.type = SND_SOC_DOBJ_GRAPH;
 		if (tplg->ops)
-			route->dobj.unload = tplg->ops->control_unload;
+			route->dobj.unload = tplg->ops->dapm_route_unload;
 		route->dobj.index = tplg->index;
 		list_add(&route->dobj.list, &tplg->comp->dobj_list);
 
-- 
2.39.1

