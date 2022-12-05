Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5B66424D1
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 09:39:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D21C17B6;
	Mon,  5 Dec 2022 09:38:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D21C17B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670229556;
	bh=gjGSVlKOBmP4//103vV1Se01lrQ00rii4KNWv7jXxbw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n0LPKC0mlWfbYzjKVQ7tOPuvhnw8e063pn0oFi6AmZLfVwJGnGziAOCqRNZixwZuZ
	 iQTr8FYGHWjSPyqMLet4hjSui/Q90rvJ4dMC2h0enPCYgcdB2FmmHMMODmBZQXKo3O
	 FLboJ5d3CGgMKCqwZegq4fDn6fQ58/CdH7gDKqKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 997E8F800BD;
	Mon,  5 Dec 2022 09:37:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AB52F804C2; Mon,  5 Dec 2022 09:37:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 052EAF80171
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 09:36:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 052EAF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eSZNjUYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670229399; x=1701765399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gjGSVlKOBmP4//103vV1Se01lrQ00rii4KNWv7jXxbw=;
 b=eSZNjUYUz9BJXr+sdRdt3eB65Psb/T5oCafdRtQQMh5O7DXPHWLDBUqm
 buaBD+yvGWY0HYFqeC+sk/JhtYr89Ubp18dlLOMeAboBfYosmbCni3tj5
 EciRq+MA8VcOKoyhVJPAUSnMLcEhgei71KtsUX46YibnRRiHffkYSalLz
 gzassUC9ftjL2CySXQHLnVjFAnjKL3XY1hnVfj0xC3taMEUAo5NfBfojP
 eQ5EpwSLrBjz6M3aFLGSw1pqlzW1Md1yqzsg0Tyc/amhdeYkBMw/DBByQ
 RUlbjw+O1e2DtdFmizuF4xx26cK7GlwN1r8eDYovT0KmSc0NpSYRCHDrI Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="343288342"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; d="scan'208";a="343288342"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 00:36:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="647866220"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; d="scan'208";a="647866220"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 05 Dec 2022 00:36:33 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 4/6] ASoC: Intel: Skylake: Introduce single place for
 pipe-config selection
Date: Mon,  5 Dec 2022 09:53:28 +0100
Message-Id: <20221205085330.857665-5-cezary.rojewski@intel.com>
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

