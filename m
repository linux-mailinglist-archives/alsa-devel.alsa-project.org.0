Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 845C7241965
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 12:06:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16AC21669;
	Tue, 11 Aug 2020 12:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16AC21669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597140379;
	bh=mPmxVTRt7d+wOTSbBuEezR+YIui2wx5nRikHMkg/njQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k5h63gf88UewQjGb3EQAJVubSfC8fmUVFekz9GCoPFRwIdIbQUbJhCN0AIpcl3Cha
	 mGee5qkir6y3BYklLKpm1FdpkP6qpEvfH2RcsLoDkZYf+3k4VlsBwvNbnazNQ2zm42
	 g+yL+wnPOELunde4UuREVARN4IHQqbUw+3vg6fYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4524F80308;
	Tue, 11 Aug 2020 12:01:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5AD7F802C2; Tue, 11 Aug 2020 12:01:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C4CAF802E3
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 12:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C4CAF802E3
IronPort-SDR: Z8PwtH6zQz84M0GzRVq6XwhhjtJsdsgQ2yBALSFbRKj6jHutA8z+yWjbFnIah7UHrtQzWzmJnk
 4zznYNw2LSkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="152924807"
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="152924807"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 03:01:09 -0700
IronPort-SDR: LulnXCM4FtuBMv9ZmhbfzpMEDUF5uaInZqmu8B3tvxFTv9DLy3I0SehlLmW9eS5kAijfjLBoz1
 e48io2zLm5XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="494625299"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 11 Aug 2020 03:01:04 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 05/13] ASoC: Intel: catpt: Add IPC messages
Date: Tue, 11 Aug 2020 12:00:26 +0200
Message-Id: <20200811100034.6875-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811100034.6875-1-cezary.rojewski@intel.com>
References: <20200811100034.6875-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

Declare global and stream IPC message types and define appropriate
message handlers.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/messages.c | 312 ++++++++++++++++++++++++
 sound/soc/intel/catpt/messages.h | 401 +++++++++++++++++++++++++++++++
 2 files changed, 713 insertions(+)
 create mode 100644 sound/soc/intel/catpt/messages.c
 create mode 100644 sound/soc/intel/catpt/messages.h

diff --git a/sound/soc/intel/catpt/messages.c b/sound/soc/intel/catpt/messages.c
new file mode 100644
index 000000000000..e8583b40830d
--- /dev/null
+++ b/sound/soc/intel/catpt/messages.c
@@ -0,0 +1,312 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2020 Intel Corporation. All rights reserved.
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include "core.h"
+#include "messages.h"
+#include "registers.h"
+
+int catpt_ipc_get_fw_version(struct catpt_dev *cdev,
+			     struct catpt_fw_version *version)
+{
+	union catpt_global_msg msg = CATPT_GLOBAL_MSG(GET_FW_VERSION);
+	struct catpt_ipc_msg request = {{0}}, reply;
+	int ret;
+
+	request.header = msg.val;
+	reply.size = sizeof(*version);
+	reply.data = version;
+
+	ret = catpt_dsp_send_msg(cdev, request, &reply);
+	if (ret)
+		dev_err(cdev->dev, "get fw version failed: %d\n", ret);
+
+	return ret;
+}
+
+struct catpt_alloc_stream_input {
+	enum catpt_path_id path_id:8;
+	enum catpt_stream_type stream_type:8;
+	enum catpt_format_id format_id:8;
+	u8 reserved;
+	struct catpt_audio_format input_format;
+	struct catpt_ring_info ring_info;
+	u8 num_entries;
+	/* flex array with entries here */
+	struct catpt_memory_info persistent_mem;
+	struct catpt_memory_info scratch_mem;
+	u32 num_notifications; /* obsolete */
+} __packed;
+
+int catpt_ipc_alloc_stream(struct catpt_dev *cdev,
+			   enum catpt_path_id path_id,
+			   enum catpt_stream_type type,
+			   struct catpt_audio_format *afmt,
+			   struct catpt_ring_info *rinfo,
+			   u8 num_modules,
+			   struct catpt_module_entry *modules,
+			   struct resource *persistent,
+			   struct resource *scratch,
+			   struct catpt_stream_info *sinfo)
+{
+	union catpt_global_msg msg = CATPT_GLOBAL_MSG(ALLOCATE_STREAM);
+	struct catpt_alloc_stream_input input;
+	struct catpt_ipc_msg request, reply;
+	size_t size, arrsz;
+	u8 *payload;
+	off_t off;
+	int ret;
+
+	off = offsetof(struct catpt_alloc_stream_input, persistent_mem);
+	arrsz = sizeof(*modules) * num_modules;
+	size = sizeof(input) + arrsz;
+
+	payload = kzalloc(size, GFP_KERNEL);
+	if (!payload)
+		return -ENOMEM;
+
+	memset(&input, 0, sizeof(input));
+	input.path_id = path_id;
+	input.stream_type = type;
+	input.format_id = CATPT_FORMAT_PCM;
+	input.input_format = *afmt;
+	input.ring_info = *rinfo;
+	input.num_entries = num_modules;
+	input.persistent_mem.offset = catpt_to_dsp_offset(persistent->start);
+	input.persistent_mem.size = resource_size(persistent);
+	if (scratch) {
+		input.scratch_mem.offset = catpt_to_dsp_offset(scratch->start);
+		input.scratch_mem.size = resource_size(scratch);
+	}
+
+	/* re-arrange the input: account for flex array 'entries' */
+	memcpy(payload, &input, sizeof(input));
+	memmove(payload + off + arrsz, payload + off, sizeof(input) - off);
+	memcpy(payload + off, modules, arrsz);
+
+	request.header = msg.val;
+	request.size = size;
+	request.data = payload;
+	reply.size = sizeof(*sinfo);
+	reply.data = sinfo;
+
+	ret = catpt_dsp_send_msg(cdev, request, &reply);
+	if (ret)
+		dev_err(cdev->dev, "alloc stream type %d failed: %d\n",
+			type, ret);
+
+	kfree(payload);
+	return ret;
+}
+
+int catpt_ipc_free_stream(struct catpt_dev *cdev, u8 stream_hw_id)
+{
+	union catpt_global_msg msg = CATPT_GLOBAL_MSG(FREE_STREAM);
+	struct catpt_ipc_msg request;
+	int ret;
+
+	request.header = msg.val;
+	request.size = sizeof(stream_hw_id);
+	request.data = &stream_hw_id;
+
+	ret = catpt_dsp_send_msg(cdev, request, NULL);
+	if (ret)
+		dev_err(cdev->dev, "free stream %d failed: %d\n",
+			stream_hw_id, ret);
+
+	return ret;
+}
+
+int catpt_ipc_set_device_format(struct catpt_dev *cdev,
+				struct catpt_ssp_device_format *devfmt)
+{
+	union catpt_global_msg msg = CATPT_GLOBAL_MSG(SET_DEVICE_FORMATS);
+	struct catpt_ipc_msg request;
+	int ret;
+
+	request.header = msg.val;
+	request.size = sizeof(*devfmt);
+	request.data = devfmt;
+
+	ret = catpt_dsp_send_msg(cdev, request, NULL);
+	if (ret)
+		dev_err(cdev->dev, "set device format failed: %d\n", ret);
+
+	return ret;
+}
+
+int catpt_ipc_enter_dxstate(struct catpt_dev *cdev, enum catpt_dx_state state,
+			    struct catpt_dx_context *dx_ctx)
+{
+	union catpt_global_msg msg = CATPT_GLOBAL_MSG(ENTER_DX_STATE);
+	struct catpt_ipc_msg request, reply;
+	int ret;
+
+	request.header = msg.val;
+	request.size = sizeof(state);
+	request.data = &state;
+	reply.size = sizeof(*dx_ctx);
+	reply.data = dx_ctx;
+
+	ret = catpt_dsp_send_msg(cdev, request, &reply);
+	if (ret)
+		dev_err(cdev->dev, "enter dx state failed: %d\n", ret);
+
+	return ret;
+}
+
+int catpt_ipc_get_mixer_stream_info(struct catpt_dev *cdev,
+				    struct catpt_mixer_stream_info *info)
+{
+	union catpt_global_msg msg = CATPT_GLOBAL_MSG(GET_MIXER_STREAM_INFO);
+	struct catpt_ipc_msg request = {{0}}, reply;
+	int ret;
+
+	request.header = msg.val;
+	reply.size = sizeof(*info);
+	reply.data = info;
+
+	ret = catpt_dsp_send_msg(cdev, request, &reply);
+	if (ret)
+		dev_err(cdev->dev, "get mixer info failed: %d\n", ret);
+
+	return ret;
+}
+
+int catpt_ipc_reset_stream(struct catpt_dev *cdev, u8 stream_hw_id)
+{
+	union catpt_stream_msg msg = CATPT_STREAM_MSG(RESET_STREAM);
+	struct catpt_ipc_msg request = {{0}};
+	int ret;
+
+	msg.stream_hw_id = stream_hw_id;
+	request.header = msg.val;
+
+	ret = catpt_dsp_send_msg(cdev, request, NULL);
+	if (ret)
+		dev_err(cdev->dev, "reset stream %d failed: %d\n",
+			stream_hw_id, ret);
+
+	return ret;
+}
+
+int catpt_ipc_pause_stream(struct catpt_dev *cdev, u8 stream_hw_id)
+{
+	union catpt_stream_msg msg = CATPT_STREAM_MSG(PAUSE_STREAM);
+	struct catpt_ipc_msg request = {{0}};
+	int ret;
+
+	msg.stream_hw_id = stream_hw_id;
+	request.header = msg.val;
+
+	ret = catpt_dsp_send_msg(cdev, request, NULL);
+	if (ret)
+		dev_err(cdev->dev, "pause stream %d failed: %d\n",
+			stream_hw_id, ret);
+
+	return ret;
+}
+
+int catpt_ipc_resume_stream(struct catpt_dev *cdev, u8 stream_hw_id)
+{
+	union catpt_stream_msg msg = CATPT_STREAM_MSG(RESUME_STREAM);
+	struct catpt_ipc_msg request = {{0}};
+	int ret;
+
+	msg.stream_hw_id = stream_hw_id;
+	request.header = msg.val;
+
+	ret = catpt_dsp_send_msg(cdev, request, NULL);
+	if (ret)
+		dev_err(cdev->dev, "resume stream %d failed: %d\n",
+			stream_hw_id, ret);
+
+	return ret;
+}
+
+struct catpt_set_volume_input {
+	u32 channel;
+	u32 target_volume;
+	u64 curve_duration;
+	enum catpt_audio_curve_type curve_type __aligned(4);
+} __packed;
+
+int catpt_ipc_set_volume(struct catpt_dev *cdev, u8 stream_hw_id,
+			 u32 channel, u32 volume,
+			 u32 curve_duration,
+			 enum catpt_audio_curve_type curve_type)
+{
+	union catpt_stream_msg msg = CATPT_STAGE_MSG(SET_VOLUME);
+	struct catpt_ipc_msg request;
+	struct catpt_set_volume_input input;
+	int ret;
+
+	msg.stream_hw_id = stream_hw_id;
+	input.channel = channel;
+	input.target_volume = volume;
+	input.curve_duration = curve_duration;
+	input.curve_type = curve_type;
+
+	request.header = msg.val;
+	request.size = sizeof(input);
+	request.data = &input;
+
+	ret = catpt_dsp_send_msg(cdev, request, NULL);
+	if (ret)
+		dev_err(cdev->dev, "set stream %d volume failed: %d\n",
+			stream_hw_id, ret);
+
+	return ret;
+}
+
+struct catpt_set_write_pos_input {
+	u32 new_write_pos;
+	bool end_of_buffer;
+	bool low_latency;
+} __packed;
+
+int catpt_ipc_set_write_pos(struct catpt_dev *cdev, u8 stream_hw_id,
+			    u32 pos, bool eob, bool ll)
+{
+	union catpt_stream_msg msg = CATPT_STAGE_MSG(SET_WRITE_POSITION);
+	struct catpt_ipc_msg request;
+	struct catpt_set_write_pos_input input;
+	int ret;
+
+	msg.stream_hw_id = stream_hw_id;
+	input.new_write_pos = pos;
+	input.end_of_buffer = eob;
+	input.low_latency = ll;
+
+	request.header = msg.val;
+	request.size = sizeof(input);
+	request.data = &input;
+
+	ret = catpt_dsp_send_msg(cdev, request, NULL);
+	if (ret)
+		dev_err(cdev->dev, "set stream %d write pos failed: %d\n",
+			stream_hw_id, ret);
+
+	return ret;
+}
+
+int catpt_ipc_mute_loopback(struct catpt_dev *cdev, u8 stream_hw_id, bool mute)
+{
+	union catpt_stream_msg msg = CATPT_STAGE_MSG(MUTE_LOOPBACK);
+	struct catpt_ipc_msg request;
+	int ret;
+
+	msg.stream_hw_id = stream_hw_id;
+	request.header = msg.val;
+	request.size = sizeof(mute);
+	request.data = &mute;
+
+	ret = catpt_dsp_send_msg(cdev, request, NULL);
+	if (ret)
+		dev_err(cdev->dev, "mute loopback failed: %d\n", ret);
+
+	return ret;
+}
diff --git a/sound/soc/intel/catpt/messages.h b/sound/soc/intel/catpt/messages.h
new file mode 100644
index 000000000000..f9e2fac6a67f
--- /dev/null
+++ b/sound/soc/intel/catpt/messages.h
@@ -0,0 +1,401 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ *
+ * Author: Cezary Rojewski <cezary.rojewski@intel.com>
+ */
+
+#ifndef __SND_SOC_INTEL_CATPT_MSG_H
+#define __SND_SOC_INTEL_CATPT_MSG_H
+
+struct catpt_dev;
+
+/* IPC messages base types  */
+
+enum catpt_reply_status {
+	CATPT_REPLY_SUCCESS = 0,
+	CATPT_REPLY_ERROR_INVALID_PARAM = 1,
+	CATPT_REPLY_UNKNOWN_MESSAGE_TYPE = 2,
+	CATPT_REPLY_OUT_OF_RESOURCES = 3,
+	CATPT_REPLY_BUSY = 4,
+	CATPT_REPLY_PENDING = 5,
+	CATPT_REPLY_FAILURE = 6,
+	CATPT_REPLY_INVALID_REQUEST = 7,
+	CATPT_REPLY_UNINITIALIZED = 8,
+	CATPT_REPLY_NOT_FOUND = 9,
+	CATPT_REPLY_SOURCE_NOT_STARTED = 10,
+};
+
+/* GLOBAL messages */
+
+enum catpt_global_msg_type {
+	CATPT_GLB_GET_FW_VERSION = 0,
+	CATPT_GLB_ALLOCATE_STREAM = 3,
+	CATPT_GLB_FREE_STREAM = 4,
+	CATPT_GLB_STREAM_MESSAGE = 6,
+	CATPT_GLB_REQUEST_CORE_DUMP = 7,
+	CATPT_GLB_SET_DEVICE_FORMATS = 10,
+	CATPT_GLB_ENTER_DX_STATE = 12,
+	CATPT_GLB_GET_MIXER_STREAM_INFO = 13,
+};
+
+union catpt_global_msg {
+	u32 val;
+	struct {
+		enum catpt_reply_status status:5;
+		u32 context:19; /* stream or module specific */
+		enum catpt_global_msg_type type:5;
+		u32 fw_ready:1;
+		u32 done:1;
+		u32 busy:1;
+	};
+} __packed;
+
+#define CATPT_MSG(hdr) { .val = hdr }
+#define CATPT_GLOBAL_MSG(msg_type) \
+	{ .type = CATPT_GLB_##msg_type }
+
+#define BUILD_HASH_SIZE		40
+
+struct catpt_fw_version {
+	u8 build;
+	u8 minor;
+	u8 major;
+	u8 type;
+	u8 build_hash[BUILD_HASH_SIZE];
+	u32 log_providers_hash;
+} __packed;
+
+int catpt_ipc_get_fw_version(struct catpt_dev *cdev,
+			     struct catpt_fw_version *version);
+
+enum catpt_pin_id {
+	CATPT_PIN_ID_SYSTEM = 0,
+	CATPT_PIN_ID_REFERENCE = 1,
+	CATPT_PIN_ID_CAPTURE1 = 2,
+	CATPT_PIN_ID_CAPTURE2 = 3,
+	CATPT_PIN_ID_OFFLOAD1 = 4,
+	CATPT_PIN_ID_OFFLOAD2 = 5,
+	CATPT_PIN_ID_MIXER = 7,
+	CATPT_PIN_ID_BLUETOOTH_CAPTURE = 8,
+	CATPT_PIN_ID_BLUETOOTH_RENDER = 9,
+};
+
+enum catpt_path_id {
+	CATPT_PATH_SSP0_OUT = 0,
+	CATPT_PATH_SSP0_IN = 1,
+	CATPT_PATH_SSP1_OUT = 2,
+	CATPT_PATH_SSP1_IN = 3,
+	/* duplicated audio in capture path */
+	CATPT_PATH_SSP0_IN_DUP = 4,
+};
+
+enum catpt_stream_type {
+	CATPT_STRM_TYPE_RENDER = 0, /* offload */
+	CATPT_STRM_TYPE_SYSTEM = 1,
+	CATPT_STRM_TYPE_CAPTURE = 2,
+	CATPT_STRM_TYPE_LOOPBACK = 3,
+	CATPT_STRM_TYPE_BLUETOOTH_RENDER = 4,
+	CATPT_STRM_TYPE_BLUETOOTH_CAPTURE = 5,
+};
+
+enum catpt_format_id {
+	CATPT_FORMAT_PCM = 0,
+	CATPT_FORMAT_MP3 = 1,
+	CATPT_FORMAT_AAC = 2,
+	CATPT_FORMAT_WMA = 3,
+};
+
+enum catpt_channel_index {
+	CATPT_CHANNEL_LEFT = 0x0,
+	CATPT_CHANNEL_CENTER = 0x1,
+	CATPT_CHANNEL_RIGHT = 0x2,
+	CATPT_CHANNEL_LEFT_SURROUND = 0x3,
+	CATPT_CHANNEL_CENTER_SURROUND = 0x3,
+	CATPT_CHANNEL_RIGHT_SURROUND = 0x4,
+	CATPT_CHANNEL_LFE = 0x7,
+	CATPT_CHANNEL_INVALID = 0xF,
+};
+
+enum catpt_channel_config {
+	CATPT_CHANNEL_CONFIG_MONO	= 0, /* One channel only */
+	CATPT_CHANNEL_CONFIG_STEREO	= 1, /* L & R */
+	CATPT_CHANNEL_CONFIG_2_POINT_1	= 2, /* L, R & LFE; PCM only */
+	CATPT_CHANNEL_CONFIG_3_POINT_0	= 3, /* L, C & R; MP3 & AAC only */
+	CATPT_CHANNEL_CONFIG_3_POINT_1	= 4, /* L, C, R & LFE; PCM only */
+	CATPT_CHANNEL_CONFIG_QUATRO	= 5, /* L, R, Ls & Rs; PCM only */
+	CATPT_CHANNEL_CONFIG_4_POINT_0	= 6, /* L, C, R & Cs; MP3 & AAC only */
+	CATPT_CHANNEL_CONFIG_5_POINT_0	= 7, /* L, C, R, Ls & Rs */
+	CATPT_CHANNEL_CONFIG_5_POINT_1	= 8, /* L, C, R, Ls, Rs & LFE */
+	CATPT_CHANNEL_CONFIG_DUAL_MONO	= 9, /* One channel replicated in two */
+	CATPT_CHANNEL_CONFIG_INVALID	= 10,
+};
+
+enum catpt_interleaving_style {
+	CATPT_INTERLEAVING_PER_CHANNEL = 0,
+	CATPT_INTERLEAVING_PER_SAMPLE  = 1,
+};
+
+struct catpt_audio_format {
+	u32 sample_rate;
+	u32 bit_depth;
+	u32 channel_map;
+	enum catpt_channel_config channel_config __aligned(4);
+	enum catpt_interleaving_style interleaving __aligned(4);
+	u8 num_channels;
+	u8 valid_bit_depth;
+	u8 reserved[2];
+} __packed;
+
+struct catpt_ring_info {
+	u32 page_table_addr;
+	u32 num_pages;
+	u32 size;
+	u32 offset;
+	u32 ring_first_page_pfn;
+} __packed;
+
+#define CATPT_MODULE_COUNT (CATPT_MODID_LAST + 1)
+
+enum catpt_module_id {
+	CATPT_MODID_BASE_FW = 0x0,
+	CATPT_MODID_MP3 = 0x1,
+	CATPT_MODID_AAC_5_1 = 0x2,
+	CATPT_MODID_AAC_2_0 = 0x3,
+	CATPT_MODID_SRC = 0x4,
+	CATPT_MODID_WAVES = 0x5,
+	CATPT_MODID_DOLBY = 0x6,
+	CATPT_MODID_BOOST = 0x7,
+	CATPT_MODID_LPAL = 0x8,
+	CATPT_MODID_DTS = 0x9,
+	CATPT_MODID_PCM_CAPTURE = 0xA,
+	CATPT_MODID_PCM_SYSTEM = 0xB,
+	CATPT_MODID_PCM_REFERENCE = 0xC,
+	CATPT_MODID_PCM = 0xD, /* offload */
+	CATPT_MODID_BLUETOOTH_RENDER = 0xE,
+	CATPT_MODID_BLUETOOTH_CAPTURE = 0xF,
+	CATPT_MODID_LAST = CATPT_MODID_BLUETOOTH_CAPTURE,
+};
+
+struct catpt_module_entry {
+	enum catpt_module_id module_id __aligned(4);
+	u32 entry_point;
+} __packed;
+
+struct catpt_module_map {
+	u8 num_entries;
+	struct catpt_module_entry entries[];
+} __packed;
+
+struct catpt_memory_info {
+	u32 offset;
+	u32 size;
+} __packed;
+
+#define CATPT_CHANNELS_MAX	4
+#define CATPT_ALL_CHANNELS_MASK	UINT_MAX
+
+struct catpt_stream_info {
+	u32 stream_hw_id;
+	u32 reserved;
+	u32 read_pos_regaddr;
+	u32 pres_pos_regaddr;
+	u32 peak_meter_regaddr[CATPT_CHANNELS_MAX];
+	u32 volume_regaddr[CATPT_CHANNELS_MAX];
+} __packed;
+
+int catpt_ipc_alloc_stream(struct catpt_dev *cdev,
+			   enum catpt_path_id path_id,
+			   enum catpt_stream_type type,
+			   struct catpt_audio_format *afmt,
+			   struct catpt_ring_info *rinfo,
+			   u8 num_modules,
+			   struct catpt_module_entry *modules,
+			   struct resource *persistent,
+			   struct resource *scratch,
+			   struct catpt_stream_info *sinfo);
+int catpt_ipc_free_stream(struct catpt_dev *cdev, u8 stream_hw_id);
+
+#define CATPT_SSP_COUNT (CATPT_SSP_IFACE_LAST + 1)
+
+enum catpt_ssp_iface {
+	CATPT_SSP_IFACE_0 = 0,
+	CATPT_SSP_IFACE_1 = 1,
+	CATPT_SSP_IFACE_LAST = CATPT_SSP_IFACE_1,
+};
+
+enum catpt_mclk_frequency {
+	CATPT_MCLK_OFF = 0,
+	CATPT_MCLK_FREQ_6_MHZ = 1,
+	CATPT_MCLK_FREQ_21_MHZ = 2,
+	CATPT_MCLK_FREQ_24_MHZ = 3,
+};
+
+enum catpt_ssp_mode {
+	CATPT_SSP_MODE_I2S_SLAVE = 0,
+	CATPT_SSP_MODE_I2S_MASTER = 1,
+	CATPT_SSP_MODE_TDM_MASTER = 2,
+};
+
+struct catpt_ssp_device_format {
+	enum catpt_ssp_iface iface __aligned(4);
+	enum catpt_mclk_frequency mclk __aligned(4);
+	enum catpt_ssp_mode mode __aligned(4);
+	u16 clock_divider;
+	u8 channels;
+} __packed;
+
+int catpt_ipc_set_device_format(struct catpt_dev *cdev,
+				struct catpt_ssp_device_format *devfmt);
+
+enum catpt_dx_state {
+	CATPT_DX_STATE_D3 = 3,
+};
+
+enum catpt_dx_type {
+	CATPT_DX_TYPE_FW_IMAGE = 0,
+	CATPT_DX_TYPE_MEMORY_DUMP = 1,
+};
+
+struct catpt_save_meminfo {
+	u32 offset;
+	u32 size;
+	enum catpt_dx_type source __aligned(4);
+} __packed;
+
+#define SAVE_MEMINFO_MAX	14
+
+struct catpt_dx_context {
+	u32 num_meminfo;
+	struct catpt_save_meminfo meminfo[SAVE_MEMINFO_MAX];
+} __packed;
+
+int catpt_ipc_enter_dxstate(struct catpt_dev *cdev, enum catpt_dx_state state,
+			    struct catpt_dx_context *context);
+
+struct catpt_mixer_stream_info {
+	u32 mixer_hw_id;
+	u32 peak_meter_regaddr[CATPT_CHANNELS_MAX];
+	u32 volume_regaddr[CATPT_CHANNELS_MAX];
+} __packed;
+
+int catpt_ipc_get_mixer_stream_info(struct catpt_dev *cdev,
+				    struct catpt_mixer_stream_info *info);
+
+/* STREAM messages */
+
+enum catpt_stream_msg_type {
+	CATPT_STRM_RESET_STREAM = 0,
+	CATPT_STRM_PAUSE_STREAM = 1,
+	CATPT_STRM_RESUME_STREAM = 2,
+	CATPT_STRM_STAGE_MESSAGE = 3,
+	CATPT_STRM_NOTIFICATION = 4,
+};
+
+enum catpt_stage_action {
+	CATPT_STG_SET_VOLUME = 1,
+	CATPT_STG_SET_WRITE_POSITION = 2,
+	CATPT_STG_MUTE_LOOPBACK = 3,
+};
+
+union catpt_stream_msg {
+	u32 val;
+	struct {
+		enum catpt_reply_status status:5;
+		u32 reserved:7;
+		enum catpt_stage_action stage_action:4;
+		u32 stream_hw_id:4;
+		enum catpt_stream_msg_type subtype:4;
+		enum catpt_global_msg_type type:5;
+		u32 fw_ready:1;
+		u32 done:1;
+		u32 busy:1;
+	};
+} __packed;
+
+#define CATPT_STREAM_MSG(msg_type) \
+{ \
+	.subtype = CATPT_STRM_##msg_type, \
+	.type = CATPT_GLB_STREAM_MESSAGE }
+#define CATPT_STAGE_MSG(msg_type) \
+{ \
+	.stage_action = CATPT_STG_##msg_type, \
+	.subtype = CATPT_STRM_STAGE_MESSAGE, \
+	.type = CATPT_GLB_STREAM_MESSAGE }
+
+int catpt_ipc_reset_stream(struct catpt_dev *cdev, u8 stream_hw_id);
+int catpt_ipc_pause_stream(struct catpt_dev *cdev, u8 stream_hw_id);
+int catpt_ipc_resume_stream(struct catpt_dev *cdev, u8 stream_hw_id);
+
+/* STREAM messages - STAGE subtype */
+
+enum catpt_audio_curve_type {
+	CATPT_AUDIO_CURVE_NONE = 0,
+	CATPT_AUDIO_CURVE_WINDOWS_FADE = 1,
+};
+
+int catpt_ipc_set_volume(struct catpt_dev *cdev, u8 stream_hw_id,
+			 u32 channel, u32 volume,
+			 u32 curve_duration,
+			 enum catpt_audio_curve_type curve_type);
+
+int catpt_ipc_set_write_pos(struct catpt_dev *cdev, u8 stream_hw_id,
+			    u32 pos, bool eob, bool ll);
+
+int catpt_ipc_mute_loopback(struct catpt_dev *cdev, u8 stream_hw_id, bool mute);
+
+/* NOTIFICATION messages */
+
+enum catpt_notify_reason {
+	CATPT_NOTIFY_POSITION_CHANGED = 0,
+	CATPT_NOTIFY_GLITCH_OCCURRED = 1,
+};
+
+union catpt_notify_msg {
+	u32 val;
+	struct {
+		u32 mailbox_address:29;
+		u32 fw_ready:1;
+		u32 done:1;
+		u32 busy:1;
+	};
+	struct {
+		enum catpt_reply_status status:5;
+		u32 reserved:7;
+		enum catpt_notify_reason notify_reason:4;
+		u32 stream_hw_id:4;
+		enum catpt_stream_msg_type subtype:4;
+		enum catpt_global_msg_type type:5;
+		u32 hdr:3; /* fw_ready, done, busy */
+	};
+} __packed;
+
+#define FW_INFO_SIZE_MAX	100
+
+struct catpt_fw_ready {
+	u32 inbox_offset;
+	u32 outbox_offset;
+	u32 inbox_size;
+	u32 outbox_size;
+	u32 fw_info_size;
+	char fw_info[FW_INFO_SIZE_MAX];
+} __packed;
+
+struct catpt_notify_position {
+	u32 stream_position;
+	u32 fw_cycle_count;
+} __packed;
+
+enum catpt_glitch_type {
+	CATPT_GLITCH_UNDERRUN = 1,
+	CATPT_GLITCH_DECODER_ERROR = 2,
+	CATPT_GLITCH_DOUBLED_WRITE_POS = 3,
+};
+
+struct catpt_notify_glitch {
+	enum catpt_glitch_type type __aligned(4);
+	u64 presentation_pos;
+	u32 write_pos;
+} __packed;
+
+#endif
-- 
2.17.1

