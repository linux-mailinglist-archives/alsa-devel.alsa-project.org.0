Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE8E6865FD
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 13:34:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC2F09F6;
	Wed,  1 Feb 2023 13:33:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC2F09F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675254861;
	bh=aiF6/8a6SS1hHhHKbLczSkALMVzusrvlToxYPNO/+4c=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IpG79AkzSX6II51dCrBnQaRDziRRybiShMywXjUcJaOnEuL2/HOKZb3bAQw6kaQWm
	 BnFYGSmY31a8Rc5B5YE2KkfxaXALZLQ66uDN036DL12UkAinLcxmovXNKa6KN6a7fW
	 sFhIGYH54ZZMey0kcOX3gfxqe018T5ZssP5MRp3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1B0EF80552;
	Wed,  1 Feb 2023 13:32:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26A0EF80543; Wed,  1 Feb 2023 13:32:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D852BF8032B
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 13:32:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D852BF8032B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VyKvplit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675254757; x=1706790757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aiF6/8a6SS1hHhHKbLczSkALMVzusrvlToxYPNO/+4c=;
 b=VyKvplitFD5RtRierh+Q16mdG4A/EGeSpD6QXZT8M+QU9YtC9IKS4O1C
 pzLJHxNEVdfo2VAyrBm8FLPKPLrIUbzLVWcaR0On+D1ueOlBxQWEJwPwW
 P2zJ/+XqGyPU6FnxEbwMIzwEz4qQVjBmaX4TCWgCP0SGvThics6orueil
 XtoCaiDdcQwLy5BLwcSIaoez6dJWe55yc44eN+jU9J9j1TR+TZFXIzry6
 IWyXCOaraBUhbrbJieMAc+2cA75cfKrC8pTE/dC1hqaPwnDyBsYS+mDEE
 Id87oJO4UHnAaUj6lR52jt0rPcK0R823W/TLhT9X/0oEYNbsKuFRcPvZG w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="328143527"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="328143527"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 04:32:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="788865682"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="788865682"
Received: from jehdildi-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.31.67])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 04:32:27 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/9] ASoC: SOF: add fw_info_box support
Date: Wed,  1 Feb 2023 14:32:24 +0200
Message-Id: <20230201123231.26361-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201123231.26361-1-peter.ujfalusi@linux.intel.com>
References: <20230201123231.26361-1-peter.ujfalusi@linux.intel.com>
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

