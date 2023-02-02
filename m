Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34284687EB3
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 14:31:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94C99E9D;
	Thu,  2 Feb 2023 14:30:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94C99E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675344701;
	bh=aiF6/8a6SS1hHhHKbLczSkALMVzusrvlToxYPNO/+4c=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lS1I8kJAC3+1Pyk9dhoekxzuWEFD+zbsX5lHOf7VVZMLg2wIU9P0B86QsTFGL9Hhu
	 twJ7xmUDvTNlYNV9EUk/SKvKYfmSA29L4ZkjZGYAYd7Sj/eUQ+wHSevkRkn3KSS4A2
	 gUhMQFlGL+Dq3T508XO1KTZp9m1qpqPxg4oidW0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23650F804C2;
	Thu,  2 Feb 2023 14:30:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B13CF80557; Thu,  2 Feb 2023 14:30:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
 version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C42AF80271
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 14:29:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C42AF80271
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OCY468lg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675344595; x=1706880595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aiF6/8a6SS1hHhHKbLczSkALMVzusrvlToxYPNO/+4c=;
 b=OCY468lgkfgF7tjvefrs5VjgpyK5nrVcAI0dpSJB/mjr/338GdExyBF9
 N8wmQ/s8aeVcnmcakhToXpoVLegtB89V6drauZtXDxFbdYuWcWo/l9IqB
 6jQyfxkcHm0wmm4f2Sl9Ovc+A1/tC/et/knVAUfIIURqEMW1lkn8H96Dm
 KE3qXeHOQOLxSXg+rkVV3IdOn/ClGG3wnh+uMu9To2vvC6H25W38v8M1N
 jVo74OmFOVIo6HVP+D63zo3vP5ZsZIvekAYNUESSk+ErqDEjEnaZnhvaL
 FWpjyTrxHjvK209Jr7Nt8YKn4GbOpUlUYLmFQlGnvgHf7rkOWIIToKeZy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308783260"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="308783260"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 05:29:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="658727315"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="658727315"
Received: from jpdamery-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.1.104])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 05:29:50 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz
Subject: [PATCH v3 2/9] ASoC: SOF: add fw_info_box support
Date: Thu,  2 Feb 2023 15:29:47 +0200
Message-Id: <20230202132954.26773-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202132954.26773-1-peter.ujfalusi@linux.intel.com>
References: <20230202132954.26773-1-peter.ujfalusi@linux.intel.com>
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

FW can share some information with host driver, .e.g fw status, pipeline
status and volume status. On ipc4 platform it is located in memory
windows 0 with size of struct sof_ipc4_fw_reg.

With this patch, ipc4 driver can find fw information in fw_info_box

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-priv.h | 1 +
 sound/soc/sof/ipc4.c      | 3 +++
 sound/soc/sof/sof-priv.h  | 1 +
 3 files changed, 5 insertions(+)

diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 38bb3d7df42e..8f8259a7e21c 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -14,6 +14,7 @@
 #include "sof-priv.h"
 
 /* The DSP window indices are fixed */
+#define SOF_IPC4_INBOX_WINDOW_IDX	0
 #define SOF_IPC4_OUTBOX_WINDOW_IDX	1
 #define SOF_IPC4_DEBUG_WINDOW_IDX	2
 
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 35c9f3913d9a..f3c0c839d177 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -13,6 +13,7 @@
 #include <sound/sof/ipc4/header.h>
 #include "sof-priv.h"
 #include "sof-audio.h"
+#include "ipc4-fw-reg.h"
 #include "ipc4-priv.h"
 #include "ops.h"
 
@@ -542,6 +543,8 @@ static int ipc4_fw_ready(struct snd_sof_dev *sdev, struct sof_ipc4_msg *ipc4_msg
 	outbox_offset = snd_sof_dsp_get_window_offset(sdev, SOF_IPC4_OUTBOX_WINDOW_IDX);
 	outbox_size = SOF_IPC4_MSG_MAX_SIZE;
 
+	sdev->fw_info_box.offset = snd_sof_dsp_get_window_offset(sdev, SOF_IPC4_INBOX_WINDOW_IDX);
+	sdev->fw_info_box.size = sizeof(struct sof_ipc4_fw_registers);
 	sdev->dsp_box.offset = inbox_offset;
 	sdev->dsp_box.size = inbox_size;
 	sdev->host_box.offset = outbox_offset;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 208a30ff3db9..fd1c3b17a396 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -548,6 +548,7 @@ struct snd_sof_dev {
 
 	/* IPC */
 	struct snd_sof_ipc *ipc;
+	struct snd_sof_mailbox fw_info_box;	/* FW shared memory */
 	struct snd_sof_mailbox dsp_box;		/* DSP initiated IPC */
 	struct snd_sof_mailbox host_box;	/* Host initiated IPC */
 	struct snd_sof_mailbox stream_box;	/* Stream position update */
-- 
2.39.1

