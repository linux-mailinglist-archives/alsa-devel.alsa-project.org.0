Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8338A6424C8
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 09:38:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 364731753;
	Mon,  5 Dec 2022 09:37:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 364731753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670229497;
	bh=aErEeCh11l+wjRHVyMJX8sMWTk/D9edkdEtg2W2BMLw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R/ll2XObteNbFOjMU30ljIhb88lhDzMh6vrK9DsBCvMV6fdRV1N/X3GOzBRCIfAg/
	 NnUFWGB4DP+q8QpRbN+2idA5HNXW8myCOMTw7fY1vb8mwqCxZnv+TfQ6poCTwAr7VW
	 qA5EsZMSd7tN1ce391r3BSWLoDnfdHYaSMQPuQis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D028F8055C;
	Mon,  5 Dec 2022 09:36:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8486CF80533; Mon,  5 Dec 2022 09:36:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA12AF8014C
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 09:36:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA12AF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="EPcjjhfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670229394; x=1701765394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aErEeCh11l+wjRHVyMJX8sMWTk/D9edkdEtg2W2BMLw=;
 b=EPcjjhfF9uDeqsbXzv49yxvisVHc13v6M3przBTjx7dmLOkZiei46VR1
 W9H/93yDYoJm9wbrGmJrmfbcITQnWqLvv0kO40cSh2/5eLMrKE4T9aRg7
 XmcF5kEXz3TUdKfms/qrQHjj0nC/VQbetc5GebfXDHpOa4dgY07Z3OHDa
 0n+Z1OgBCzmD78Z9lQ5wmlenBBuLlwMaQuJN7/8xA1pcSCbzw+sxgAaGO
 Xf8f2iO+8kqEF4fjgRlfa7CGyWq5z5uBZt5DiEvi6hyDswWS+dhBIBOAq
 NWQ/YXuEBwZd3Q51INB5ro9GQ0S5QhcPwsEQOktK3OsrgA+hXq85VO8D9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="343288296"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; d="scan'208";a="343288296"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 00:36:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="647866144"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; d="scan'208";a="647866144"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 05 Dec 2022 00:36:28 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 2/6] ASoC: Intel: Skylake: Remove skl_tplg_is_multi_fmt()
Date: Mon,  5 Dec 2022 09:53:26 +0100
Message-Id: <20221205085330.857665-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205085330.857665-1-cezary.rojewski@intel.com>
References: <20221205085330.857665-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Rather than forcing userspace to select proper format with enumerable
kcontrols, select it ourselves based on provided hw_params.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-topology.c | 40 --------------------------
 1 file changed, 40 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index fc3d719d93e1..f144acae1b44 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -582,38 +582,6 @@ static int skl_tplg_unload_pipe_modules(struct skl_dev *skl,
 	return ret;
 }
 
-static bool skl_tplg_is_multi_fmt(struct skl_dev *skl, struct skl_pipe *pipe)
-{
-	struct skl_pipe_fmt *cur_fmt;
-	struct skl_pipe_fmt *next_fmt;
-	int i;
-
-	if (pipe->nr_cfgs <= 1)
-		return false;
-
-	if (pipe->conn_type != SKL_PIPE_CONN_TYPE_FE)
-		return true;
-
-	for (i = 0; i < pipe->nr_cfgs - 1; i++) {
-		if (pipe->direction == SNDRV_PCM_STREAM_PLAYBACK) {
-			cur_fmt = &pipe->configs[i].out_fmt;
-			next_fmt = &pipe->configs[i + 1].out_fmt;
-		} else {
-			cur_fmt = &pipe->configs[i].in_fmt;
-			next_fmt = &pipe->configs[i + 1].in_fmt;
-		}
-
-		if (!CHECK_HW_PARAMS(cur_fmt->channels, cur_fmt->freq,
-				     cur_fmt->bps,
-				     next_fmt->channels,
-				     next_fmt->freq,
-				     next_fmt->bps))
-			return true;
-	}
-
-	return false;
-}
-
 /*
  * Here, we select pipe format based on the pipe type and pipe
  * direction to determine the current config index for the pipeline.
@@ -636,14 +604,6 @@ skl_tplg_get_pipe_config(struct skl_dev *skl, struct skl_module_cfg *mconfig)
 		return 0;
 	}
 
-	if (skl_tplg_is_multi_fmt(skl, pipe)) {
-		pipe->cur_config_idx = pipe->pipe_config_idx;
-		pipe->memory_pages = pconfig->mem_pages;
-		dev_dbg(skl->dev, "found pipe config idx:%d\n",
-			pipe->cur_config_idx);
-		return 0;
-	}
-
 	if (pipe->conn_type == SKL_PIPE_CONN_TYPE_NONE || pipe->nr_cfgs == 1) {
 		dev_dbg(skl->dev, "No conn_type or just 1 pathcfg, taking 0th for %d\n",
 			pipe->ppl_id);
-- 
2.25.1

