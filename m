Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 786185B369D
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 13:45:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0189E169A;
	Fri,  9 Sep 2022 13:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0189E169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662723929;
	bh=ysWZGiz2qyS9RSPmPOrsjqxLYFcr69lf0wUrx6wXSAw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E0fe4YTn1kJMuoSFwduyH6il0iwog/i+FjPSgdfsgWIkZVIqyE35ZcG70/jaRFxdU
	 lNHhwyHk17I0RrJhyf+6wUax28MHOtAZ2ED33sBq9Rf0NQyMXKrg3FKavCqjNnZ+uX
	 Nj58MAvJr94nQlMTDkBiwLbeMrQ5HjYVfK8MJtuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3A9EF80535;
	Fri,  9 Sep 2022 13:43:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AA9DF80537; Fri,  9 Sep 2022 13:43:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4BCBF8023A
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 13:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4BCBF8023A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ltoYU7hb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662723824; x=1694259824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ysWZGiz2qyS9RSPmPOrsjqxLYFcr69lf0wUrx6wXSAw=;
 b=ltoYU7hbLWJBkXAgHyvayQmsCuE8Xss2on643sp8/NV4BA/j0fFvd+hl
 MykG/NqGYTi2UEHW+sHD49Nnt03jgIPeOskAxsFugMxsRv19MFGSEwZMg
 9vaMxqFBWad7+0lkImPwYNVMTHzHXn64Xg4CBpSXNy9dICbA+GCDmcXBS
 FUG0nHJvLoQkpuWkT4YOx0oqAWsJR+PnvcAimTwkUZvG/b6zcw7hoVUIv
 9FfXjzarlj9j14FRJMPjcyd0PThNUlvg/qmlHjRLgN3v3cLUFF16t94+Z
 P4IUIIM8Egbg5CAk8FUs60Jd9H6yRLHwFWRPN0Yu7UPTEBR1UwRRcENEw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359180097"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="359180097"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:43:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="683613854"
Received: from desharpe-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.0.89])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:43:35 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 3/7] ASoC: SOF: ipc4: Add define for the outbox window index
Date: Fri,  9 Sep 2022 14:43:28 +0300
Message-Id: <20220909114332.31393-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909114332.31393-1-peter.ujfalusi@linux.intel.com>
References: <20220909114332.31393-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

Instead of using the index number directly, add a define for the outbox
window index.
It is always window 1 with IPC4.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-priv.h | 3 +++
 sound/soc/sof/ipc4.c      | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 9492fe1796c2..f3dbcc2e6331 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -13,6 +13,9 @@
 #include <sound/sof/ext_manifest4.h>
 #include "sof-priv.h"
 
+/* The DSP window indices are fixed */
+#define SOF_IPC4_OUTBOX_WINDOW_IDX	1
+
 /**
  * struct sof_ipc4_fw_data - IPC4-specific data
  * @manifest_fw_hdr_offset: FW header offset in the manifest
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 1c51938ce43b..58aa054663bf 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -537,7 +537,7 @@ static int ipc4_fw_ready(struct snd_sof_dev *sdev, struct sof_ipc4_msg *ipc4_msg
 		return inbox_offset;
 	}
 	inbox_size = SOF_IPC4_MSG_MAX_SIZE;
-	outbox_offset = snd_sof_dsp_get_window_offset(sdev, 1);
+	outbox_offset = snd_sof_dsp_get_window_offset(sdev, SOF_IPC4_OUTBOX_WINDOW_IDX);
 	outbox_size = SOF_IPC4_MSG_MAX_SIZE;
 
 	sdev->dsp_box.offset = inbox_offset;
-- 
2.37.3

