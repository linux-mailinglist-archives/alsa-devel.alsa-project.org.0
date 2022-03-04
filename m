Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF914CD6EE
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 15:58:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A6BC1A2C;
	Fri,  4 Mar 2022 15:57:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A6BC1A2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646405911;
	bh=vaPzYEB7L7CIdqbBj7U2NZYc5LKyieDBmBwrNYNQBWE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LdoFT7ifYcj870gjpq6jlGv5KtTdtaFtKld3+Afnz1vD68OvXnnem0WSTl99yMvi6
	 x/BJhtWYdRTIG9Hf3OhztOuWGk7j2J68vWIqZPDKIZvSr5BHRR7qgkT2aru+EtSICs
	 Wu7sCuX5PAJQNpvgwBECcaQnq1qR5oLm7AEheL88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F3BEF80528;
	Fri,  4 Mar 2022 15:56:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5029DF80527; Fri,  4 Mar 2022 15:56:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCBA3F8051C
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 15:56:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCBA3F8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="j7es94TE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646405766; x=1677941766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vaPzYEB7L7CIdqbBj7U2NZYc5LKyieDBmBwrNYNQBWE=;
 b=j7es94TEsU0hEtR1JL4b2EIBBfaYF5gsL32stEoFhE+waZ9PIqsoqHMp
 9iLDPugIb7DVWgsfMUU+2g3ynYDU9xwNJ5pqNli3rCccG3EBTZoVtB2au
 jXu+FVNZca5o97Gx6KeTQFpYYiGF7+Yoh103AH5rBP2SISZUAgbjkSs2g
 Yx20g2kcdZKtjB9HQ3JsT+BP4KE8rYIcSEhbY0BCs7jbczo8Fzb+rn2ix
 XOn81VLn/6gMX91ar2QNXb3Q8P47EKEUONgW7sNKfAGwb7HT1NgXtjZos
 Wtt5d3y8yurHhCLY8rj6RZdxNOXPTzoUnawOriWqehOVzpo+L/XiLNhTf w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="233949113"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="233949113"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 06:56:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="609963375"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 04 Mar 2022 06:55:59 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 05/17] ASoC: Intel: avs: Add code loading requests
Date: Fri,  4 Mar 2022 15:57:43 +0100
Message-Id: <20220304145755.2844173-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304145755.2844173-1-cezary.rojewski@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
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
index 000000000000..d568338b0737
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
+	struct avs_ipc_msg request = {{0}};
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

