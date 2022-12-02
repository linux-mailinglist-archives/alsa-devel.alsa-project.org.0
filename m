Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D43A640A90
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 17:25:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06B5D18A3;
	Fri,  2 Dec 2022 17:24:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06B5D18A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669998301;
	bh=gjGSVlKOBmP4//103vV1Se01lrQ00rii4KNWv7jXxbw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YfrH4AxpPkQszkuOin1VF99SRe+/kZ0RNXUCM1RRejinKK80VDTIbBHliBTx/wHhV
	 ZkJY7vhFSyajZC8OfSo6/FAXEwI8mnWO6Y0kCmkC39+NQ4z5KqnCO77GhXnYT7u05q
	 AyfH6NUFYd+8axXKveXO/gguhQEwAbFXg+rUZyNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0272F80570;
	Fri,  2 Dec 2022 17:23:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A42AEF8056F; Fri,  2 Dec 2022 17:23:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D019F800BD
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 17:22:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D019F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="P6Hcynwr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669998176; x=1701534176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gjGSVlKOBmP4//103vV1Se01lrQ00rii4KNWv7jXxbw=;
 b=P6HcynwrNmjGHPcr05tnYyWZvaZB6loCPsj4+6V9IGCcZyLE2X5sbgfD
 57QBKEqERL3j+Dw9xYyir9XPG084hp8RQJcxa0VZm0sFLSnbRvKDwv5jE
 i7S5gl8orFc4nmHFl570SWMF6W9eDRg/rXVitxexY5hgSGYdams3ZSGfF
 PVZZh7JCBRWNBIZDxO4XY9KOtXsgh00ytDx2VTGI+nYzWhuU9uGxAa2Es
 R8UIvb798fhGXmFLQt8oVZIm/4nXIGae7AztoQrIFNohdKLdxUMslvfcW
 tHJu1aQ+jEwuLPvt9OQk34Lh5s3gD3ewKLmA9OjplOWMFYUUHIY/UPEm4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="314689522"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="314689522"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 08:22:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="733858994"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="733858994"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Dec 2022 08:22:51 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 4/5] ASoC: Intel: Skylake: Introduce single place for
 pipe-config selection
Date: Fri,  2 Dec 2022 17:39:44 +0100
Message-Id: <20221202163945.674746-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221202163945.674746-1-cezary.rojewski@intel.com>
References: <20221202163945.674746-1-cezary.rojewski@intel.com>
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

Provide a single location for pipe config selection where all fields
that have to be updated whenever ->pipe_config_idx changes can be
updated accordingly.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-topology.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 567a3b661ce4..b20643b83401 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -582,6 +582,12 @@ static int skl_tplg_unload_pipe_modules(struct skl_dev *skl,
 	return ret;
 }
 
+static void skl_tplg_set_pipe_config_idx(struct skl_pipe *pipe, int idx)
+{
+	pipe->cur_config_idx = idx;
+	pipe->memory_pages = pipe->configs[idx].mem_pages;
+}
+
 /*
  * Here, we select pipe format based on the pipe type and pipe
  * direction to determine the current config index for the pipeline.
@@ -600,16 +606,14 @@ skl_tplg_get_pipe_config(struct skl_dev *skl, struct skl_module_cfg *mconfig)
 	int i;
 
 	if (pipe->nr_cfgs == 0) {
-		pipe->cur_config_idx = 0;
+		skl_tplg_set_pipe_config_idx(pipe, 0);
 		return 0;
 	}
 
 	if (pipe->conn_type == SKL_PIPE_CONN_TYPE_NONE || pipe->nr_cfgs == 1) {
 		dev_dbg(skl->dev, "No conn_type or just 1 pathcfg, taking 0th for %d\n",
 			pipe->ppl_id);
-		pipe->cur_config_idx = 0;
-		pipe->memory_pages = pconfig->mem_pages;
-
+		skl_tplg_set_pipe_config_idx(pipe, 0);
 		return 0;
 	}
 
@@ -628,10 +632,8 @@ skl_tplg_get_pipe_config(struct skl_dev *skl, struct skl_module_cfg *mconfig)
 
 		if (CHECK_HW_PARAMS(params->ch, params->s_freq, params->s_fmt,
 				    fmt->channels, fmt->freq, fmt->bps)) {
-			pipe->cur_config_idx = i;
-			pipe->memory_pages = pconfig->mem_pages;
+			skl_tplg_set_pipe_config_idx(pipe, i);
 			dev_dbg(skl->dev, "Using pipe config: %d\n", i);
-
 			return 0;
 		}
 	}
@@ -1351,7 +1353,7 @@ static int skl_tplg_multi_config_set_get(struct snd_kcontrol *kcontrol,
 		return -EIO;
 
 	if (is_set)
-		pipe->cur_config_idx = ucontrol->value.enumerated.item[0];
+		skl_tplg_set_pipe_config_idx(pipe, ucontrol->value.enumerated.item[0]);
 	else
 		ucontrol->value.enumerated.item[0] = pipe->cur_config_idx;
 
-- 
2.25.1

