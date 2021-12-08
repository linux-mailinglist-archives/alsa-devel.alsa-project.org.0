Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA8046D1DE
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:15:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB479244C;
	Wed,  8 Dec 2021 12:14:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB479244C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962108;
	bh=v7+wW+jNPaxRV6F8vlQUE4G/w1VKwl4tS1grrGIk5No=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DpXXU0lkE6tJvcKK83BJVAjsSVJyyArdvIOKfrqw3IH8/REYMZtf3VhreLY0Xa7DK
	 UZCe+LCuRX2iaXSqn7h1OX800gv/5c5LzJg+6znDL54nsU/y7n8MMTc/q6heUDj4d1
	 TJpEj4FCbi+OYnwGRwmepDeBQoSOOcV979ky1aI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7031EF8053C;
	Wed,  8 Dec 2021 12:11:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE919F8053B; Wed,  8 Dec 2021 12:11:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A42BF80537
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:11:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A42BF80537
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="238036304"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="238036304"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:11:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600142"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:11:16 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 09/37] ASoC: Intel: avs: Add code loading requests
Date: Wed,  8 Dec 2021 12:12:33 +0100
Message-Id: <20211208111301.1817725-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208111301.1817725-1-cezary.rojewski@intel.com>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

Before firmware and its modules can be used, they have to be loaded.
Code loading process is complex and is a combination of DMA and IPC
operations. Here, IPC part is being added and accounts for CLDMA and HDA
mechanisms both.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile   |  2 +-
 sound/soc/intel/avs/messages.c | 65 ++++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/messages.h | 22 ++++++++++++
 3 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/avs/messages.c

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index e243806dd38a..c0824f30fd3b 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-avs-objs := dsp.o ipc.o
+snd-soc-avs-objs := dsp.o ipc.o messages.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
new file mode 100644
index 000000000000..8dac946dd8dd
--- /dev/null
+++ b/sound/soc/intel/avs/messages.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include "avs.h"
+#include "messages.h"
+
+#define AVS_CL_TIMEOUT_MS	5000
+
+int avs_ipc_load_modules(struct avs_dev *adev, u16 *mod_ids, u32 num_mod_ids)
+{
+	union avs_global_msg msg = AVS_GLOBAL_REQUEST(LOAD_MULTIPLE_MODULES);
+	struct avs_ipc_msg request;
+	int ret;
+
+	msg.load_multi_mods.mod_cnt = num_mod_ids;
+	request.header = msg.val;
+	request.data = mod_ids;
+	request.size = sizeof(*mod_ids) * num_mod_ids;
+
+	ret = avs_dsp_send_msg_timeout(adev, &request, NULL, AVS_CL_TIMEOUT_MS);
+	if (ret)
+		avs_ipc_err(adev, &request, "load multiple modules", ret);
+
+	return ret;
+}
+
+int avs_ipc_unload_modules(struct avs_dev *adev, u16 *mod_ids, u32 num_mod_ids)
+{
+	union avs_global_msg msg = AVS_GLOBAL_REQUEST(UNLOAD_MULTIPLE_MODULES);
+	struct avs_ipc_msg request;
+	int ret;
+
+	msg.load_multi_mods.mod_cnt = num_mod_ids;
+	request.header = msg.val;
+	request.data = mod_ids;
+	request.size = sizeof(*mod_ids) * num_mod_ids;
+
+	ret = avs_dsp_send_msg_timeout(adev, &request, NULL, AVS_CL_TIMEOUT_MS);
+	if (ret)
+		avs_ipc_err(adev, &request, "unload multiple modules", ret);
+
+	return ret;
+}
+
+int avs_ipc_load_library(struct avs_dev *adev, u32 dma_id, u32 lib_id)
+{
+	union avs_global_msg msg = AVS_GLOBAL_REQUEST(LOAD_LIBRARY);
+	struct avs_ipc_msg request = {0};
+	int ret;
+
+	msg.load_lib.dma_id = dma_id;
+	msg.load_lib.lib_id = lib_id;
+	request.header = msg.val;
+
+	ret = avs_dsp_send_msg_timeout(adev, &request, NULL, AVS_CL_TIMEOUT_MS);
+	if (ret)
+		avs_ipc_err(adev, &request, "load library", ret);
+
+	return ret;
+}
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 003e634f5547..b9ec1c64179b 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -24,6 +24,9 @@ enum avs_msg_direction {
 };
 
 enum avs_global_msg_type {
+	AVS_GLB_LOAD_MULTIPLE_MODULES = 15,
+	AVS_GLB_UNLOAD_MULTIPLE_MODULES = 16,
+	AVS_GLB_LOAD_LIBRARY = 24,
 	AVS_GLB_NOTIFICATION = 27,
 };
 
@@ -38,6 +41,16 @@ union avs_global_msg {
 				u32 msg_direction:1;
 				u32 msg_target:1;
 			};
+			/* module loading */
+			struct {
+				u32 mod_cnt:8;
+			} load_multi_mods;
+			/* library loading */
+			struct {
+				u32 dma_id:5;
+				u32 rsvd:11;
+				u32 lib_id:4;
+			} load_lib;
 		};
 		union {
 			u32 val;
@@ -84,6 +97,10 @@ union avs_reply_msg {
 		};
 		union {
 			u32 val;
+			/* module loading */
+			struct {
+				u32 err_mod_id:16;
+			} load_multi_mods;
 		} ext;
 	};
 } __packed;
@@ -167,4 +184,9 @@ struct avs_notify_mod_data {
 	u32 data[];
 } __packed;
 
+/* Code loading messages */
+int avs_ipc_load_modules(struct avs_dev *adev, u16 *mod_ids, u32 num_mod_ids);
+int avs_ipc_unload_modules(struct avs_dev *adev, u16 *mod_ids, u32 num_mod_ids);
+int avs_ipc_load_library(struct avs_dev *adev, u32 dma_id, u32 lib_id);
+
 #endif /* __SOUND_SOC_INTEL_AVS_MSGS_H */
-- 
2.25.1

