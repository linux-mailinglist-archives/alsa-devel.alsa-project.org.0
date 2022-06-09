Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B305441F7
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:32:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C21D1FF8;
	Thu,  9 Jun 2022 05:31:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C21D1FF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745551;
	bh=x8Rw4ni8f+3KH4cUlAF5ORlv1iJHt3XHvlCLzLdHNYQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oggZEWmNYtAQ+kJO4jSGSmyi7jpQvHRINxyA6cfpm+zYvbD+XyGn/43v8mBHufd9S
	 2+Fsq94xIj3kwGnhcTH36P8HCDqMH5o7MJaydS1zJbTVG14TjrxdU0M8jY2xGKph6D
	 WOUEgbu2W+ZwRU8JUwPhGki4jlbeNczxu3Xe1aLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C683F80557;
	Thu,  9 Jun 2022 05:27:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3609F8051E; Thu,  9 Jun 2022 05:27:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02EFBF8053E
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02EFBF8053E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kohZmlUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745241; x=1686281241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x8Rw4ni8f+3KH4cUlAF5ORlv1iJHt3XHvlCLzLdHNYQ=;
 b=kohZmlUT+ZVpqnvVKRiVKviWm6JStWPlqHqV4BwKTZbwvrV3sPVsHvmN
 BrCd60CjZw5sdg/PVWbr2oFQsBT5z+xKWDLBXfSDEWDukYGk4mL38m0SK
 X+nDl3uQbWgab2EF9yd4mJDeUNBtBZHdw/UKiG7AH3n2/OTIJL1/6Rsfw
 ba09+SpfJ7MG5J1fWpbMy8yF8jB5lEOtj6kDJ6L8K45/0qbZ+r2R7Jwn0
 3gMwokb0dmWTNg9ZYsTnS5j6v7Ta0BGWNssPsGNiJ++Ez+2ObUUcWUGYu
 Ad7pCkbaXXbZLCq3yc/etAMMKRe0igU+9NWRVsNCPzLU/tBlPOkJ+VMKQ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219565"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219565"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260248"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:00 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 15/23] ASoC: SOF: ipc4-pcm: Expose
 sof_ipc4_set_pipeline_state()
Date: Wed,  8 Jun 2022 20:26:35 -0700
Message-Id: <20220609032643.916882-16-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

Expose the sof_ipc4_set_pipeline_state() function as it will be used in
the IPC4-specific BE DAI driver ops.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c  | 3 ++-
 sound/soc/sof/ipc4-priv.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 7a56fba8f1d9..6a702f9dc065 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -13,7 +13,7 @@
 #include "ipc4-priv.h"
 #include "ipc4-topology.h"
 
-static int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 id, u32 state)
+int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 id, u32 state)
 {
 	struct sof_ipc4_msg msg = {{ 0 }};
 	u32 primary;
@@ -30,6 +30,7 @@ static int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 id, u32 sta
 
 	return sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
 }
+EXPORT_SYMBOL(sof_ipc4_set_pipeline_state);
 
 static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 				      struct snd_pcm_substream *substream, int state)
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index e4381a74516c..8dddceaf5eb3 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -44,4 +44,6 @@ extern const struct sof_ipc_tplg_ops ipc4_tplg_ops;
 extern const struct sof_ipc_tplg_control_ops tplg_ipc4_control_ops;
 extern const struct sof_ipc_pcm_ops ipc4_pcm_ops;
 
+int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 id, u32 state);
+
 #endif
-- 
2.25.1

