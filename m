Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C30D4D649E
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 16:30:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E462C18B4;
	Fri, 11 Mar 2022 16:29:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E462C18B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647012650;
	bh=PTOTrWNqOh3+d5cEW5a62Y3P7GD7lDNyYPXbaIoXMpI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N2LHAx6JLfz8SUtXsqL6AsQGIwcIP8oeAw2dvETOEeX5ji55ca3SbOF8J/hTGDpgv
	 FNezsJHSTAr2BwFHXjKkgKxY65Rn4IYmvh6jly8WiXnrtDjssZJiIRI9W2ZT0ts/NT
	 gZfCjkvlxXTUqcvWFxKAYVx7KpIydjxZHAnRjeKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE8C6F80536;
	Fri, 11 Mar 2022 16:28:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82CA9F80529; Fri, 11 Mar 2022 16:28:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65256F80529
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 16:28:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65256F80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Z0GHa8Q1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647012482; x=1678548482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PTOTrWNqOh3+d5cEW5a62Y3P7GD7lDNyYPXbaIoXMpI=;
 b=Z0GHa8Q1uk2JKEoOsLQmk7c3eL9+kDqcJt99QP1J2O8w/zpQi1ZeS57D
 hWzPSP9SEzOI537/D8kjh8l1wtoY5jPhJHrJp3a+1N8rX516YPJmHh3xQ
 bmAAj8+si/W8LdNbnTYS4BjHnYDn2JFqchF+HIR8o+dSaJcM1V8BDKi4H
 +Urjk8odibN/RYvvbSX6nw3KQz8Czk0heCfYlOgjYHUwdRwtYsi8Hj5p7
 qD92MJOILQo90Zx1EHIdEh3gNfqkMteai9KhWVqsIT0PtUscPIwewP8P5
 U6ml6mWtNAi9BxmE4FB+n0hSSnRFHAs3Sa6k4/8Hc96PeJ+jnGSFYyjDd g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="318813341"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="318813341"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 07:28:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="514532779"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 11 Mar 2022 07:27:57 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 07/17] ASoC: Intel: avs: Add module management requests
Date: Fri, 11 Mar 2022 16:35:34 +0100
Message-Id: <20220311153544.136854-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311153544.136854-1-cezary.rojewski@intel.com>
References: <20220311153544.136854-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

Due to firmware limitations, LARGE_CONFIG_GET handler implementation
does not support retrieving payload with size larger than IPC inbox
window size.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/ipc.c      |   8 +-
 sound/soc/intel/avs/messages.c | 261 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/messages.h |  52 +++++++
 3 files changed, 320 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index b1986a82945d..68aaf01edbf2 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -21,8 +21,14 @@ static void avs_dsp_receive_rx(struct avs_dev *adev, u64 header)
 
 	ipc->rx.header = header;
 	/* Abort copying payload if request processing was unsuccessful. */
-	if (!msg.status)
+	if (!msg.status) {
+		/* update size in case of LARGE_CONFIG_GET */
+		if (msg.msg_target == AVS_MOD_MSG &&
+		    msg.global_msg_type == AVS_MOD_LARGE_CONFIG_GET)
+			ipc->rx.size = msg.ext.large_config.data_off_size;
+
 		memcpy_fromio(ipc->rx.data, avs_uplink_addr(adev), ipc->rx.size);
+	}
 }
 
 static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index 3a6c2f9e9542..2e775798a6c3 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -6,6 +6,7 @@
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
 //
 
+#include <linux/slab.h>
 #include "avs.h"
 #include "messages.h"
 
@@ -139,3 +140,263 @@ int avs_ipc_get_pipeline_state(struct avs_dev *adev, u8 instance_id,
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
+	msg.ext.init_instance.param_block_size = DIV_ROUND_UP(param_size, sizeof(u32));
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
+ * modules performs cleanup automatically when it is deleted.
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
index 8f18eb7935d1..d744fe453033 100644
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
@@ -237,4 +271,22 @@ int avs_ipc_set_pipeline_state(struct avs_dev *adev, u8 instance_id,
 int avs_ipc_get_pipeline_state(struct avs_dev *adev, u8 instance_id,
 			       enum avs_pipeline_state *state);
 
+/* Module management messages */
+int avs_ipc_init_instance(struct avs_dev *adev, u16 module_id, u8 instance_id,
+			  u8 ppl_id, u8 core_id, u8 domain,
+			  void *param, u32 param_size);
+int avs_ipc_delete_instance(struct avs_dev *adev, u16 module_id, u8 instance_id);
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

