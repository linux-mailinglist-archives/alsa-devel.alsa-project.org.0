Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 647AD4C70C2
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 16:34:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3CB317A8;
	Mon, 28 Feb 2022 16:34:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3CB317A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646062492;
	bh=KiG7fJPN8QzEvoE3UOgCWZWEubAp/f0NapK78VR1Cx8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f7ghwFQFB0N8sfCeauG3JiWNEpAaUmBJx7zNTT4ghJ02i/WWH++JvhS634sQqgJes
	 Wvo5aoY+L1Xk5qhzPjIM/8yKsy/ukUOjiFglZsVHV3MBWVZB02t6luBDvPirfRXFjy
	 YpuTgWlh4utA98yku0U2IhBqYZYxI/KpDsuuGPLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9058F80539;
	Mon, 28 Feb 2022 16:32:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2ACAF80533; Mon, 28 Feb 2022 16:31:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_FILL_THIS_FORM_SHORT,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFEE1F80517
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 16:31:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFEE1F80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TacVUO7t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646062314; x=1677598314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KiG7fJPN8QzEvoE3UOgCWZWEubAp/f0NapK78VR1Cx8=;
 b=TacVUO7t1ml/qOkFvij/UXdGlRoAWdjajzUg9OLgnpneSRkjH9EwbJwy
 EpqSj4trw2/jtVfRnjb88rnyRKfWUf1Vtc3x1pHE5PMNuy41Lsof/3/Uq
 CLzsoE1MjnmwEqPalI9fTV52xqJvQv77r6LIlwVfkQM5VC9iLXDHon3mV
 Zm9WtBd1v7ELev9q6+hOynVOxPsRoYF5NKDllREj21N6gjjPpePgIO2s9
 5B+cMk1kwivcBS0N2VfTqspjGIUdtoiMZrZcUMvu0Iq/F2hwfgMkIHY3E
 CGwZpwmXqxdoVtH4mD8w2ixT+d01l0vHLSGz1HRBzsvvBicaMJKLPxiSi A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="339342404"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="339342404"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 07:31:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="629667231"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Feb 2022 07:31:49 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 06/17] ASoC: Intel: avs: Add pipeline management requests
Date: Mon, 28 Feb 2022 16:33:32 +0100
Message-Id: <20220228153343.2263412-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228153343.2263412-1-cezary.rojewski@intel.com>
References: <20220228153343.2263412-1-cezary.rojewski@intel.com>
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

Pipeline represents a scheduling entity. Their existence as well as
their state machine is controlled through CREATE_PIPELINE,
DELETE_PIPELINE and SET_PIPELINE_STATE IPCs.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.c | 76 ++++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/messages.h | 48 +++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index 8dac946dd8dd..ab13fc7809fe 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -63,3 +63,79 @@ int avs_ipc_load_library(struct avs_dev *adev, u32 dma_id, u32 lib_id)
 
 	return ret;
 }
+
+int avs_ipc_create_pipeline(struct avs_dev *adev, u16 req_size, u8 priority,
+			    u8 instance_id, bool lp, u16 attributes)
+{
+	union avs_global_msg msg = AVS_GLOBAL_REQUEST(CREATE_PIPELINE);
+	struct avs_ipc_msg request = {0};
+	int ret;
+
+	msg.create_ppl.ppl_mem_size = req_size;
+	msg.create_ppl.ppl_priority = priority;
+	msg.create_ppl.instance_id = instance_id;
+	msg.ext.create_ppl.lp = lp;
+	msg.ext.create_ppl.attributes = attributes;
+	request.header = msg.val;
+
+	ret = avs_dsp_send_msg(adev, &request, NULL);
+	if (ret)
+		avs_ipc_err(adev, &request, "create pipeline", ret);
+
+	return ret;
+}
+
+int avs_ipc_delete_pipeline(struct avs_dev *adev, u8 instance_id)
+{
+	union avs_global_msg msg = AVS_GLOBAL_REQUEST(DELETE_PIPELINE);
+	struct avs_ipc_msg request = {0};
+	int ret;
+
+	msg.ppl.instance_id = instance_id;
+	request.header = msg.val;
+
+	ret = avs_dsp_send_msg(adev, &request, NULL);
+	if (ret)
+		avs_ipc_err(adev, &request, "delete pipeline", ret);
+
+	return ret;
+}
+
+int avs_ipc_set_pipeline_state(struct avs_dev *adev, u8 instance_id,
+			       enum avs_pipeline_state state)
+{
+	union avs_global_msg msg = AVS_GLOBAL_REQUEST(SET_PIPELINE_STATE);
+	struct avs_ipc_msg request = {0};
+	int ret;
+
+	msg.set_ppl_state.ppl_id = instance_id;
+	msg.set_ppl_state.state = state;
+	request.header = msg.val;
+
+	ret = avs_dsp_send_msg(adev, &request, NULL);
+	if (ret)
+		avs_ipc_err(adev, &request, "set pipeline state", ret);
+
+	return ret;
+}
+
+int avs_ipc_get_pipeline_state(struct avs_dev *adev, u8 instance_id,
+			       enum avs_pipeline_state *state)
+{
+	union avs_global_msg msg = AVS_GLOBAL_REQUEST(GET_PIPELINE_STATE);
+	struct avs_ipc_msg request = {0};
+	struct avs_ipc_msg reply = {0};
+	int ret;
+
+	msg.get_ppl_state.ppl_id = instance_id;
+	request.header = msg.val;
+
+	ret = avs_dsp_send_msg(adev, &request, &reply);
+	if (ret) {
+		avs_ipc_err(adev, &request, "get pipeline state", ret);
+		return ret;
+	}
+
+	*state = reply.rsp.ext.get_ppl_state.state;
+	return ret;
+}
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index b9ec1c64179b..c1bf1cff54d9 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -26,6 +26,10 @@ enum avs_msg_direction {
 enum avs_global_msg_type {
 	AVS_GLB_LOAD_MULTIPLE_MODULES = 15,
 	AVS_GLB_UNLOAD_MULTIPLE_MODULES = 16,
+	AVS_GLB_CREATE_PIPELINE = 17,
+	AVS_GLB_DELETE_PIPELINE = 18,
+	AVS_GLB_SET_PIPELINE_STATE = 19,
+	AVS_GLB_GET_PIPELINE_STATE = 20,
 	AVS_GLB_LOAD_LIBRARY = 24,
 	AVS_GLB_NOTIFICATION = 27,
 };
@@ -45,6 +49,23 @@ union avs_global_msg {
 			struct {
 				u32 mod_cnt:8;
 			} load_multi_mods;
+			/* pipeline management */
+			struct {
+				u32 ppl_mem_size:11;
+				u32 ppl_priority:5;
+				u32 instance_id:8;
+			} create_ppl;
+			struct {
+				u32 rsvd:16;
+				u32 instance_id:8;
+			} ppl; /* generic ppl request */
+			struct {
+				u32 state:16;
+				u32 ppl_id:8;
+			} set_ppl_state;
+			struct {
+				u32 ppl_id:8;
+			} get_ppl_state;
 			/* library loading */
 			struct {
 				u32 dma_id:5;
@@ -54,6 +75,12 @@ union avs_global_msg {
 		};
 		union {
 			u32 val;
+			/* pipeline management */
+			struct {
+				u32 lp:1; /* low power flag */
+				u32 rsvd:3;
+				u32 attributes:16; /* additional scheduling flags */
+			} create_ppl;
 		} ext;
 	};
 } __packed;
@@ -101,6 +128,10 @@ union avs_reply_msg {
 			struct {
 				u32 err_mod_id:16;
 			} load_multi_mods;
+			/* pipeline management */
+			struct {
+				u32 state:5;
+			} get_ppl_state;
 		} ext;
 	};
 } __packed;
@@ -189,4 +220,21 @@ int avs_ipc_load_modules(struct avs_dev *adev, u16 *mod_ids, u32 num_mod_ids);
 int avs_ipc_unload_modules(struct avs_dev *adev, u16 *mod_ids, u32 num_mod_ids);
 int avs_ipc_load_library(struct avs_dev *adev, u32 dma_id, u32 lib_id);
 
+/* Pipeline management messages */
+enum avs_pipeline_state {
+	AVS_PPL_STATE_INVALID,
+	AVS_PPL_STATE_UNINITIALIZED,
+	AVS_PPL_STATE_RESET,
+	AVS_PPL_STATE_PAUSED,
+	AVS_PPL_STATE_RUNNING,
+};
+
+int avs_ipc_create_pipeline(struct avs_dev *adev, u16 req_size, u8 priority,
+			    u8 instance_id, bool lp, u16 attributes);
+int avs_ipc_delete_pipeline(struct avs_dev *adev, u8 instance_id);
+int avs_ipc_set_pipeline_state(struct avs_dev *adev, u8 instance_id,
+			       enum avs_pipeline_state state);
+int avs_ipc_get_pipeline_state(struct avs_dev *adev, u8 instance_id,
+			       enum avs_pipeline_state *state);
+
 #endif /* __SOUND_SOC_INTEL_AVS_MSGS_H */
-- 
2.25.1

