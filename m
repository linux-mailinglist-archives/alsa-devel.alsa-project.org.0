Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6552B272339
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 13:59:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CE9516E7;
	Mon, 21 Sep 2020 13:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CE9516E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600689569;
	bh=w2T08m0BcYm503GkhAuc8izXP5lKbbwXVzydAO1rnh4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RZBsI9M1ixk6RRWe52PP1LKsGiVwxoizvObDEDebuhBiCd5t6DlvVhP3IMcVilr/z
	 g1C6tuSJ7CnuXyOuUgoATYneOZYH/XjqHnhwTSPB20IcZVz7s+OnBm72gJaWSp7YTp
	 EEfYyzO+2+SH39Kw4xVDw/MDpCwQGkki4429PE7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53E61F802E2;
	Mon, 21 Sep 2020 13:56:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB357F8015F; Mon, 21 Sep 2020 13:56:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10C83F80171
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 13:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10C83F80171
IronPort-SDR: MURUlPKhrjSF7JKnCmQTHeFuIkQYmkaMEJ+FtdBFw7Fd+e1NjLb6MAH8ASKzYb9tS1fmp6EuXH
 OKN6qJfRx36A==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="159657277"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="159657277"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 04:55:54 -0700
IronPort-SDR: 1aN6gAIezxoJCeCH3krPyvxEIxJyvHepN+MzdpnHpQISHYWdVknMGn8ZRghhGvGETnNx8fS8RA
 Mhjt8+DhlzXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="304486378"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 21 Sep 2020 04:55:50 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v7 03/14] ASoC: Intel: catpt: Add IPC message handlers
Date: Mon, 21 Sep 2020 13:54:13 +0200
Message-Id: <20200921115424.4105-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921115424.4105-1-cezary.rojewski@intel.com>
References: <20200921115424.4105-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@linux.intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com,
 gregkh@linuxfoundation.org, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org,
 krzysztof.hejmowski@intel.com, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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

Declare global and stream IPC message handlers for all known message
types.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/core.h     |   3 +
 sound/soc/intel/catpt/dsp.c      |  99 ++++++++++
 sound/soc/intel/catpt/ipc.c      |   4 +
 sound/soc/intel/catpt/messages.c | 313 +++++++++++++++++++++++++++++++
 4 files changed, 419 insertions(+)
 create mode 100644 sound/soc/intel/catpt/messages.c

diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
index 0953989e24b3..3c860c0645dc 100644
--- a/sound/soc/intel/catpt/core.h
+++ b/sound/soc/intel/catpt/core.h
@@ -9,6 +9,7 @@
 #define __SND_SOC_INTEL_CATPT_CORE_H
 
 #include <linux/dma/dw.h>
+#include <linux/irqreturn.h>
 #include "messages.h"
 #include "registers.h"
 
@@ -126,4 +127,6 @@ int catpt_dsp_send_msg_timeout(struct catpt_dev *cdev,
 int catpt_dsp_send_msg(struct catpt_dev *cdev, struct catpt_ipc_msg request,
 		       struct catpt_ipc_msg *reply);
 
+int catpt_coredump(struct catpt_dev *cdev);
+
 #endif
diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
index b0a61fcca50c..cfd2fe1fc62a 100644
--- a/sound/soc/intel/catpt/dsp.c
+++ b/sound/soc/intel/catpt/dsp.c
@@ -5,6 +5,7 @@
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
 
+#include <linux/devcoredump.h>
 #include <linux/dma-mapping.h>
 #include <linux/firmware.h>
 #include "core.h"
@@ -136,3 +137,101 @@ void catpt_dmac_remove(struct catpt_dev *cdev)
 	 */
 	dw_dma_remove(cdev->dmac);
 }
+
+#define CATPT_DUMP_MAGIC		0xcd42
+#define CATPT_DUMP_SECTION_ID_FILE	0x00
+#define CATPT_DUMP_SECTION_ID_IRAM	0x01
+#define CATPT_DUMP_SECTION_ID_DRAM	0x02
+#define CATPT_DUMP_SECTION_ID_REGS	0x03
+
+struct catpt_dump_section_hdr {
+	u16 magic;
+	u8 core_id;
+	u8 section_id;
+	u32 size;
+};
+
+int catpt_coredump(struct catpt_dev *cdev)
+{
+	struct catpt_dump_section_hdr *hdr;
+	size_t dump_size, regs_size;
+	u8 *dump, *pos;
+	int i, j;
+
+	regs_size = CATPT_SHIM_REGS_SIZE;
+	regs_size += CATPT_DMA_COUNT * CATPT_DMA_REGS_SIZE;
+	regs_size += CATPT_SSP_COUNT * CATPT_SSP_REGS_SIZE;
+	dump_size = resource_size(&cdev->dram);
+	dump_size += resource_size(&cdev->iram);
+	dump_size += regs_size;
+	dump_size += 4 * sizeof(*hdr) + 20; /* hdrs and fw hash */
+
+	dump = vzalloc(dump_size);
+	if (!dump)
+		return -ENOMEM;
+
+	pos = dump;
+
+	hdr = (struct catpt_dump_section_hdr *)pos;
+	hdr->magic = CATPT_DUMP_MAGIC;
+	hdr->core_id = cdev->spec->core_id;
+	hdr->section_id = CATPT_DUMP_SECTION_ID_FILE;
+	hdr->size = dump_size - sizeof(*hdr);
+	pos += sizeof(*hdr);
+
+	for (i = j = 0; i < FW_INFO_SIZE_MAX; i++)
+		if (cdev->ipc.config.fw_info[i] == ' ')
+			if (++j == 4)
+				break;
+	for (j = ++i; j < FW_INFO_SIZE_MAX && j - i < 20; j++) {
+		if (cdev->ipc.config.fw_info[j] == ' ')
+			break;
+		*(pos + j - i) = cdev->ipc.config.fw_info[j];
+	}
+	pos += 20;
+
+	hdr = (struct catpt_dump_section_hdr *)pos;
+	hdr->magic = CATPT_DUMP_MAGIC;
+	hdr->core_id = cdev->spec->core_id;
+	hdr->section_id = CATPT_DUMP_SECTION_ID_IRAM;
+	hdr->size = resource_size(&cdev->iram);
+	pos += sizeof(*hdr);
+
+	memcpy_fromio(pos, cdev->lpe_ba + cdev->iram.start, hdr->size);
+	pos += hdr->size;
+
+	hdr = (struct catpt_dump_section_hdr *)pos;
+	hdr->magic = CATPT_DUMP_MAGIC;
+	hdr->core_id = cdev->spec->core_id;
+	hdr->section_id = CATPT_DUMP_SECTION_ID_DRAM;
+	hdr->size = resource_size(&cdev->dram);
+	pos += sizeof(*hdr);
+
+	memcpy_fromio(pos, cdev->lpe_ba + cdev->dram.start, hdr->size);
+	pos += hdr->size;
+
+	hdr = (struct catpt_dump_section_hdr *)pos;
+	hdr->magic = CATPT_DUMP_MAGIC;
+	hdr->core_id = cdev->spec->core_id;
+	hdr->section_id = CATPT_DUMP_SECTION_ID_REGS;
+	hdr->size = regs_size;
+	pos += sizeof(*hdr);
+
+	memcpy_fromio(pos, catpt_shim_addr(cdev), CATPT_SHIM_REGS_SIZE);
+	pos += CATPT_SHIM_REGS_SIZE;
+
+	for (i = 0; i < CATPT_SSP_COUNT; i++) {
+		memcpy_fromio(pos, catpt_ssp_addr(cdev, i),
+			      CATPT_SSP_REGS_SIZE);
+		pos += CATPT_SSP_REGS_SIZE;
+	}
+	for (i = 0; i < CATPT_DMA_COUNT; i++) {
+		memcpy_fromio(pos, catpt_dma_addr(cdev, i),
+			      CATPT_DMA_REGS_SIZE);
+		pos += CATPT_DMA_REGS_SIZE;
+	}
+
+	dev_coredumpv(cdev->dev, dump, dump_size, GFP_KERNEL);
+
+	return 0;
+}
diff --git a/sound/soc/intel/catpt/ipc.c b/sound/soc/intel/catpt/ipc.c
index 500d4845a7cf..c49c9cf66075 100644
--- a/sound/soc/intel/catpt/ipc.c
+++ b/sound/soc/intel/catpt/ipc.c
@@ -168,6 +168,10 @@ static void catpt_dsp_process_response(struct catpt_dev *cdev, u32 header)
 
 	switch (msg.type) {
 	case CATPT_GLB_REQUEST_CORE_DUMP:
+		dev_err(cdev->dev, "ADSP device coredump received\n");
+		ipc->ready = false;
+		catpt_coredump(cdev);
+		/* TODO: attempt recovery */
 		break;
 
 	case CATPT_GLB_STREAM_MESSAGE:
diff --git a/sound/soc/intel/catpt/messages.c b/sound/soc/intel/catpt/messages.c
new file mode 100644
index 000000000000..8358300cddd2
--- /dev/null
+++ b/sound/soc/intel/catpt/messages.c
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2020 Intel Corporation. All rights reserved.
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <linux/slab.h>
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
+			    struct catpt_dx_context *context)
+{
+	union catpt_global_msg msg = CATPT_GLOBAL_MSG(ENTER_DX_STATE);
+	struct catpt_ipc_msg request, reply;
+	int ret;
+
+	request.header = msg.val;
+	request.size = sizeof(state);
+	request.data = &state;
+	reply.size = sizeof(*context);
+	reply.data = context;
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
-- 
2.17.1

