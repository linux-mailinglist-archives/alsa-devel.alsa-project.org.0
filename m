Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8674CD6F4
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 15:59:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0437193A;
	Fri,  4 Mar 2022 15:58:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0437193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646405961;
	bh=sRG7vpAxpcdhyH9DpQXZC2ecDmiLcGfMseAo+KEvsjg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cpvYp2JHcNBffhIIKvx9BCfxnuLch6Z5QGjJvUlxfSNG2r3xjMVlajqScK2ze6vaI
	 slmZLxJS1Xe9jLtO9srtmbCdTLvn9G2XtllhYaVIbb89OR4iUdf9W/ahzmJ0VmFfpI
	 cGvKx1ePWuzXrr+c6hR8y5iGk9hsRiw3d7ENcHFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6B3AF80542;
	Fri,  4 Mar 2022 15:56:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FD75F80535; Fri,  4 Mar 2022 15:56:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DDFCF80535
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 15:56:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DDFCF80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dHLdzXcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646405773; x=1677941773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sRG7vpAxpcdhyH9DpQXZC2ecDmiLcGfMseAo+KEvsjg=;
 b=dHLdzXcmC7J0a6eKORewxA1LvT/ZZR9yNpSGwbavQz2wgnfd15xle799
 k6ypGYIXhX742kZ1TvzIg9RDVbVSrvR8SA98kfEhyVWyzWEKB42HwTTMc
 9RyrO6K0ptvXme7EwJbJU+dDS/kbx1jIEEcnFepWadHP9tq2353avPF7l
 jT8DWA6gAUTI9YoS4DholX7bP9toAv7Fs4ENi4zIag33bCWmSN1ndN3Hk
 F5xcxyG/KBD9zkwJRkJhzkOyII6BkuqzMV3TJjbrE5Z5LREipOaFfjLwt
 xT3so5tCFFtDrs7q8lMocQTfP0GFbmk1T7Kld39PwjeUHe1PSYzCR0297 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="233949162"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="233949162"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 06:56:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="609963456"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 04 Mar 2022 06:56:05 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 07/17] ASoC: Intel: avs: Add module management requests
Date: Fri,  4 Mar 2022 15:57:45 +0100
Message-Id: <20220304145755.2844173-8-cezary.rojewski@intel.com>
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

Firmware modules implement processing algorithms. Their lifecycle,
similarly to pipelines is being controlled by IPCs: initialization,
deletion and (un)binding.

Modules can be configured at runtime - runtime parameters. This is done
with help of LARGE_CONFIG IPCs: getter and setter.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/ipc.c      |   8 +-
 sound/soc/intel/avs/messages.c | 262 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/messages.h |  53 +++++++
 3 files changed, 322 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index c0722f8b195f..9770368a898e 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -21,9 +21,15 @@ static void avs_dsp_receive_rx(struct avs_dev *adev, u64 header)
 
 	ipc->rx.header = header;
 	/* Abort copying payload if request processing was unsuccessful. */
-	if (!msg.status)
+	if (!msg.status) {
+		/* update size in case of LARGE_CONFIG_GET */
+		if (msg.msg_target == AVS_MOD_MSG &&
+		    msg.global_msg_type == AVS_MOD_LARGE_CONFIG_GET)
+			ipc->rx.size = msg.ext.large_config.data_off_size;
+
 		memcpy_fromio(ipc->rx.data, avs_uplink_addr(adev),
 			      ipc->rx.size);
+	}
 }
 
 static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index de2d50f8c6b4..613c9452226d 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -6,6 +6,7 @@
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
 //
 
+#include <linux/slab.h>
 #include "avs.h"
 #include "messages.h"
 
@@ -139,3 +140,264 @@ int avs_ipc_get_pipeline_state(struct avs_dev *adev, u8 instance_id,
 	*state = reply.rsp.ext.get_ppl_state.state;
 	return ret;
 }
+
+/*
+ * avs_ipc_init_instance - Initialize module instance
+ *
+ * @adev: Driver context
+ * @module_id: Module-type id
+ * @instance_id: Unique module instance id
+ * @ppl_id: Parent pipeline id
+ * @core_id: DSP core to allocate module on
+ * @domain: Processing domain (low latency or data processing)
+ * @param: Module-type specific configuration
+ * @param_size: Size of @param in bytes
+ *
+ * Argument verification, as well as pipeline state checks are done by the
+ * firmware.
+ *
+ * Note: @ppl_id and @core_id are independent of each other as single pipeline
+ * can be composed of module instances located on different DSP cores.
+ */
+int avs_ipc_init_instance(struct avs_dev *adev, u16 module_id, u8 instance_id,
+			  u8 ppl_id, u8 core_id, u8 domain,
+			  void *param, u32 param_size)
+{
+	union avs_module_msg msg = AVS_MODULE_REQUEST(INIT_INSTANCE);
+	struct avs_ipc_msg request;
+	int ret;
+
+	msg.module_id = module_id;
+	msg.instance_id = instance_id;
+	/* firmware expects size provided in dwords */
+	msg.ext.init_instance.param_block_size =
+			DIV_ROUND_UP(param_size, sizeof(u32));
+	msg.ext.init_instance.ppl_instance_id = ppl_id;
+	msg.ext.init_instance.core_id = core_id;
+	msg.ext.init_instance.proc_domain = domain;
+
+	request.header = msg.val;
+	request.data = param;
+	request.size = param_size;
+
+	ret = avs_dsp_send_msg(adev, &request, NULL);
+	if (ret)
+		avs_ipc_err(adev, &request, "init instance", ret);
+
+	return ret;
+}
+
+/*
+ * avs_ipc_delete_instance - Delete module instance
+ *
+ * @adev: Driver context
+ * @module_id: Module-type id
+ * @instance_id: Unique module instance id
+ *
+ * Argument verification, as well as pipeline state checks are done by the
+ * firmware.
+ *
+ * Note: only standalone modules i.e. without a parent pipeline shall be
+ * deleted using this IPC message. In all other cases, pipeline owning the
+ * modules peforms cleanup automatically when it is deleted.
+ */
+int avs_ipc_delete_instance(struct avs_dev *adev, u16 module_id, u8 instance_id)
+{
+	union avs_module_msg msg = AVS_MODULE_REQUEST(DELETE_INSTANCE);
+	struct avs_ipc_msg request = {{0}};
+	int ret;
+
+	msg.module_id = module_id;
+	msg.instance_id = instance_id;
+	request.header = msg.val;
+
+	ret = avs_dsp_send_msg(adev, &request, NULL);
+	if (ret)
+		avs_ipc_err(adev, &request, "delete instance", ret);
+
+	return ret;
+}
+
+/*
+ * avs_ipc_bind - Bind two module instances
+ *
+ * @adev: Driver context
+ * @module_id: Source module-type id
+ * @instance_id: Source module instance id
+ * @dst_module_id: Sink module-type id
+ * @dst_instance_id: Sink module instance id
+ * @dst_queue: Sink module pin to bind @src_queue with
+ * @src_queue: Source module pin to bind @dst_queue with
+ */
+int avs_ipc_bind(struct avs_dev *adev, u16 module_id, u8 instance_id,
+		 u16 dst_module_id, u8 dst_instance_id,
+		 u8 dst_queue, u8 src_queue)
+{
+	union avs_module_msg msg = AVS_MODULE_REQUEST(BIND);
+	struct avs_ipc_msg request = {{0}};
+	int ret;
+
+	msg.module_id = module_id;
+	msg.instance_id = instance_id;
+	msg.ext.bind_unbind.dst_module_id = dst_module_id;
+	msg.ext.bind_unbind.dst_instance_id = dst_instance_id;
+	msg.ext.bind_unbind.dst_queue = dst_queue;
+	msg.ext.bind_unbind.src_queue = src_queue;
+	request.header = msg.val;
+
+	ret = avs_dsp_send_msg(adev, &request, NULL);
+	if (ret)
+		avs_ipc_err(adev, &request, "bind modules", ret);
+
+	return ret;
+}
+
+/*
+ * avs_ipc_unbind - Unbind two module instances
+ *
+ * @adev: Driver context
+ * @module_id: Source module-type id
+ * @instance_id: Source module instance id
+ * @dst_module_id: Sink module-type id
+ * @dst_instance_id: Sink module instance id
+ * @dst_queue: Sink module pin to unbind @src_queue from
+ * @src_queue: Source module pin to unbind @dst_queue from
+ */
+int avs_ipc_unbind(struct avs_dev *adev, u16 module_id, u8 instance_id,
+		   u16 dst_module_id, u8 dst_instance_id,
+		   u8 dst_queue, u8 src_queue)
+{
+	union avs_module_msg msg = AVS_MODULE_REQUEST(UNBIND);
+	struct avs_ipc_msg request = {{0}};
+	int ret;
+
+	msg.module_id = module_id;
+	msg.instance_id = instance_id;
+	msg.ext.bind_unbind.dst_module_id = dst_module_id;
+	msg.ext.bind_unbind.dst_instance_id = dst_instance_id;
+	msg.ext.bind_unbind.dst_queue = dst_queue;
+	msg.ext.bind_unbind.src_queue = src_queue;
+	request.header = msg.val;
+
+	ret = avs_dsp_send_msg(adev, &request, NULL);
+	if (ret)
+		avs_ipc_err(adev, &request, "unbind modules", ret);
+
+	return ret;
+}
+
+static int __avs_ipc_set_large_config(struct avs_dev *adev, u16 module_id, u8 instance_id,
+				      u8 param_id, bool init_block, bool final_block,
+				      u8 *request_data, size_t request_size, size_t off_size)
+{
+	union avs_module_msg msg = AVS_MODULE_REQUEST(LARGE_CONFIG_SET);
+	struct avs_ipc_msg request;
+	int ret;
+
+	msg.module_id = module_id;
+	msg.instance_id = instance_id;
+	msg.ext.large_config.data_off_size = off_size;
+	msg.ext.large_config.large_param_id = param_id;
+	msg.ext.large_config.final_block = final_block;
+	msg.ext.large_config.init_block = init_block;
+
+	request.header = msg.val;
+	request.data = request_data;
+	request.size = request_size;
+
+	ret = avs_dsp_send_msg(adev, &request, NULL);
+	if (ret)
+		avs_ipc_err(adev, &request, "large config set", ret);
+
+	return ret;
+}
+
+int avs_ipc_set_large_config(struct avs_dev *adev, u16 module_id,
+			     u8 instance_id, u8 param_id,
+			     u8 *request, size_t request_size)
+{
+	size_t remaining, tx_size;
+	bool final;
+	int ret;
+
+	remaining = request_size;
+	tx_size = min_t(size_t, AVS_MAILBOX_SIZE, remaining);
+	final = (tx_size == remaining);
+
+	/* Initial request states total payload size. */
+	ret = __avs_ipc_set_large_config(adev, module_id, instance_id,
+					 param_id, 1, final, request, tx_size,
+					 request_size);
+	if (ret)
+		return ret;
+
+	remaining -= tx_size;
+
+	/* Loop the rest only when payload exceeds mailbox's size. */
+	while (remaining) {
+		size_t offset;
+
+		offset = request_size - remaining;
+		tx_size = min_t(size_t, AVS_MAILBOX_SIZE, remaining);
+		final = (tx_size == remaining);
+
+		ret = __avs_ipc_set_large_config(adev, module_id, instance_id,
+						 param_id, 0, final,
+						 request + offset, tx_size,
+						 offset);
+		if (ret)
+			return ret;
+
+		remaining -= tx_size;
+	}
+
+	return 0;
+}
+
+int avs_ipc_get_large_config(struct avs_dev *adev, u16 module_id, u8 instance_id,
+			     u8 param_id, u8 *request_data, size_t request_size,
+			     u8 **reply_data, size_t *reply_size)
+{
+	union avs_module_msg msg = AVS_MODULE_REQUEST(LARGE_CONFIG_GET);
+	struct avs_ipc_msg request;
+	struct avs_ipc_msg reply = {{0}};
+	size_t size;
+	void *buf;
+	int ret;
+
+	reply.data = kzalloc(AVS_MAILBOX_SIZE, GFP_KERNEL);
+	if (!reply.data)
+		return -ENOMEM;
+
+	msg.module_id = module_id;
+	msg.instance_id = instance_id;
+	msg.ext.large_config.data_off_size = request_size;
+	msg.ext.large_config.large_param_id = param_id;
+	/* final_block is always 0 on request. Updated by fw on reply. */
+	msg.ext.large_config.final_block = 0;
+	msg.ext.large_config.init_block = 1;
+
+	request.header = msg.val;
+	request.data = request_data;
+	request.size = request_size;
+	reply.size = AVS_MAILBOX_SIZE;
+
+	ret = avs_dsp_send_msg(adev, &request, &reply);
+	if (ret) {
+		avs_ipc_err(adev, &request, "large config get", ret);
+		kfree(reply.data);
+		return ret;
+	}
+
+	size = reply.rsp.ext.large_config.data_off_size;
+	buf = krealloc(reply.data, size, GFP_KERNEL);
+	if (!buf) {
+		kfree(reply.data);
+		return -ENOMEM;
+	}
+
+	*reply_data = buf;
+	*reply_size = size;
+
+	return 0;
+}
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index c1bf1cff54d9..e4b95b066d70 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -91,6 +91,15 @@ struct avs_tlv {
 	u32 value[];
 } __packed;
 
+enum avs_module_msg_type {
+	AVS_MOD_INIT_INSTANCE = 0,
+	AVS_MOD_LARGE_CONFIG_GET = 3,
+	AVS_MOD_LARGE_CONFIG_SET = 4,
+	AVS_MOD_BIND = 5,
+	AVS_MOD_UNBIND = 6,
+	AVS_MOD_DELETE_INSTANCE = 11,
+};
+
 union avs_module_msg {
 	u64 val;
 	struct {
@@ -106,6 +115,24 @@ union avs_module_msg {
 		};
 		union {
 			u32 val;
+			struct {
+				u32 param_block_size:16;
+				u32 ppl_instance_id:8;
+				u32 core_id:4;
+				u32 proc_domain:1;
+			} init_instance;
+			struct {
+				u32 data_off_size:20;
+				u32 large_param_id:8;
+				u32 final_block:1;
+				u32 init_block:1;
+			} large_config;
+			struct {
+				u32 dst_module_id:16;
+				u32 dst_instance_id:8;
+				u32 dst_queue:3;
+				u32 src_queue:3;
+			} bind_unbind;
 		} ext;
 	};
 } __packed;
@@ -132,6 +159,13 @@ union avs_reply_msg {
 			struct {
 				u32 state:5;
 			} get_ppl_state;
+			/* module management */
+			struct {
+				u32 data_off_size:20;
+				u32 large_param_id:8;
+				u32 final_block:1;
+				u32 init_block:1;
+			} large_config;
 		} ext;
 	};
 } __packed;
@@ -237,4 +271,23 @@ int avs_ipc_set_pipeline_state(struct avs_dev *adev, u8 instance_id,
 int avs_ipc_get_pipeline_state(struct avs_dev *adev, u8 instance_id,
 			       enum avs_pipeline_state *state);
 
+/* Module management messages */
+int avs_ipc_init_instance(struct avs_dev *adev, u16 module_id, u8 instance_id,
+			  u8 ppl_id, u8 core_id, u8 domain,
+			  void *param, u32 param_size);
+int avs_ipc_delete_instance(struct avs_dev *adev, u16 module_id,
+			    u8 instance_id);
+int avs_ipc_bind(struct avs_dev *adev, u16 module_id, u8 instance_id,
+		 u16 dst_module_id, u8 dst_instance_id,
+		 u8 dst_queue, u8 src_queue);
+int avs_ipc_unbind(struct avs_dev *adev, u16 module_id, u8 instance_id,
+		   u16 dst_module_id, u8 dst_instance_id,
+		   u8 dst_queue, u8 src_queue);
+int avs_ipc_set_large_config(struct avs_dev *adev, u16 module_id,
+			     u8 instance_id, u8 param_id,
+			     u8 *request, size_t request_size);
+int avs_ipc_get_large_config(struct avs_dev *adev, u16 module_id, u8 instance_id,
+			     u8 param_id, u8 *request_data, size_t request_size,
+			     u8 **reply_data, size_t *reply_size);
+
 #endif /* __SOUND_SOC_INTEL_AVS_MSGS_H */
-- 
2.25.1

