Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 725AA640A8C
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 17:24:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2667189C;
	Fri,  2 Dec 2022 17:23:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2667189C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669998274;
	bh=aErEeCh11l+wjRHVyMJX8sMWTk/D9edkdEtg2W2BMLw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YmYgndEWuFCCirg5C2D0mBoi6jQ2FInT1Er0cEtKCw+/8ez00IOFvTJZbNbtEPXGe
	 ZNjlzQ2TwrQxwgZ1BR5oI7rlHyTQzmkhvYfnrffwLSxacX6F9BuEbGtcggvcHg/Umx
	 8bXsvL8dSgZzjHm6zdu6LZU6mjXpcQNTLvkFIx60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73E1EF8055C;
	Fri,  2 Dec 2022 17:22:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDB01F8055A; Fri,  2 Dec 2022 17:22:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 421B6F800BD
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 17:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 421B6F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PM198+Mo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669998170; x=1701534170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aErEeCh11l+wjRHVyMJX8sMWTk/D9edkdEtg2W2BMLw=;
 b=PM198+Mo8uEn7VwtFZ2tziB2XUTHZ//+uy8NuBrWVbB1J00CQkM2n9uO
 0/reMA+B7FeD1eV0nT56xQnjjv8tVk+/oKOjGzKwiEDdA2byG05zlPfqj
 nKeS9o8ocYhRA7f/MteyD/XWm2GMlJPNgq1lPe/mY6y8ApP+ZUL39AdLC
 K6k7Co8BAB7Hi2lJsZ2P+DJKtY6zJeNc51Iif5lH99NXDE+oD8xs4YLit
 B5spY1/jilIkWKPUXZIUOMlRxPMXEcJeFh/b27KaQQct7XlaKfhjDNarC
 TK/INCpcEFp19QFC6qMsIx+FUZ9F12jG57bSqtW02U5Vz5vkXABhZRCHu Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="314689501"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="314689501"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 08:22:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="733858987"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="733858987"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Dec 2022 08:22:46 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/5] ASoC: Intel: Skylake: Remove skl_tplg_is_multi_fmt()
Date: Fri,  2 Dec 2022 17:39:42 +0100
Message-Id: <20221202163945.674746-3-cezary.rojewski@intel.com>
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

