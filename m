Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B640687BD9
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 12:12:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACB741DA;
	Thu,  2 Feb 2023 12:12:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACB741DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675336378;
	bh=aiF6/8a6SS1hHhHKbLczSkALMVzusrvlToxYPNO/+4c=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BODP3+BH6Vo+P3/Cznl6/X3xMlm9DdP195/LH+DwnDo/ja1DmwOamEss6HH0hKr/8
	 WBTGnUtJ8YaemLiORqc/9ZhrwtBC9c33OJirtArHlAjQ7dxIclnkXe4B/gu4RvXcd0
	 pGofEPyY/vnXRFj+AW0obSQtJRjnWoJO+pwtRqmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05EF0F80544;
	Thu,  2 Feb 2023 12:11:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C065AF8053D; Thu,  2 Feb 2023 12:11:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11A58F80271
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 12:11:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11A58F80271
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jIUlGmkm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675336285; x=1706872285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aiF6/8a6SS1hHhHKbLczSkALMVzusrvlToxYPNO/+4c=;
 b=jIUlGmkmF+XLhTWPR7pIXWrdLnUgXnx8cA5K+NWJ0oi7y64BbXUg3Zbf
 xGB8XkFG8k5N4zq30yl8L81NivFzSaheS1bkWPW7S2YkRTyKg+VxhjykW
 zXhLxq9Jstm143TGlUwOmx9k6okT7y1/8QzhWacW3rjEi9sKKoK/BnD6r
 7yJ9pwnekGlFr6FA1fQF29ON8DD4iXZjNYMiqLks9txCdDKb5yUSkprkL
 yFx0lK9hydPORXB6NB/59/TnYTTj/dOc4UFY3EnXbsXSV8d34wSPbX//b
 bYsI5txrtCRVsBPljTKb7n1hpCxVBwO9f2joLp4GZSPBUhWWx481wfH2/ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="414625148"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="414625148"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 03:11:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695747672"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="695747672"
Received: from jpdamery-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.1.104])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 03:11:20 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz
Subject: [PATCH v2 2/9] ASoC: SOF: add fw_info_box support
Date: Thu,  2 Feb 2023 13:11:16 +0200
Message-Id: <20230202111123.25231-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202111123.25231-1-peter.ujfalusi@linux.intel.com>
References: <20230202111123.25231-1-peter.ujfalusi@linux.intel.com>
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

