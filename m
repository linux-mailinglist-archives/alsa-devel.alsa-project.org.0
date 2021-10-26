Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D871343B066
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 12:43:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7014A1701;
	Tue, 26 Oct 2021 12:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7014A1701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635245015;
	bh=cqRuIrVfoBokB63LqXLQx7WlPMA4DyW0O3f8qZNrmRo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h5v7b5bJlmv1iB5gHsNxscs8jZWRGA3O9HycppkLBDUcc/MbepmOjtREh9kG1DbAK
	 PvXW0KVTrlxvCXgFdy9ML0Nu9sT6o6J4q176GlcFPQ7+1KA81/h7HrehAIs+iZlMsV
	 9WHmyrsSlsBbU4mxbdyNwuftLdVsIfiQORew6BvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8838FF80544;
	Tue, 26 Oct 2021 12:39:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8E08F8053B; Tue, 26 Oct 2021 12:39:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAE03F80506
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 12:38:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAE03F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pPK914SP"
Received: by mail-wm1-x331.google.com with SMTP id
 j2-20020a1c2302000000b0032ca9b0a057so1705104wmj.3
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 03:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t1sB5Ma0EXhAGXUnnIwhYz+ASh61pC+D9Z3KRVgozM4=;
 b=pPK914SPmJA8zgb2N/sv6hl4ASN6bdo/7Ox9IxtkUiF2H9nycQObMeMxuXRopurIqt
 cMf7pWDOIzqfqH0/ERpidfGBFESbY5yLU3Hv02EbzSQeckOWLQc/P6iQFMR2nedA1JcN
 83sc36N8Kp6Y/ahldetQ5yT+4KACf+yaRvYVtWED7lbq/RwZW/uqae3dY1JBkcXqB33i
 bwhal3lcG/onZgbXnFzFr6EPCc3PTPmHdvzbqJjIV8+CvW+YzWrrR9Mu+4Ipn96wnN/o
 58vjrLafNwRh7wwYOL+nDvJhq/0TfSy/q0GVlhQGAi6TY8/wZMdTY+wIvAw/KWKU8hWh
 iUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t1sB5Ma0EXhAGXUnnIwhYz+ASh61pC+D9Z3KRVgozM4=;
 b=wXC6+1C/Lq7HdsaBxZPQYgH8d7hm8+oyykE18CLYjxTN8kW14ILAeI4RhVbhPn+OVQ
 K8Gyh+8Upv/zXk3XZgiJbS/4rGr2ZRiihpYT25T2XOTzWburLW2KJmH6iMNbfwpzxZ7G
 orX+llj0ZPJ2ADbzagshK/svFpQfZMps/+SeNXKBz4SYoMywZ5WujntzzFVeRQosm1sW
 WeLgEfw3BUceUfWZjEdnJZj9cry543mB9pPab+gnIIFRquTW1hHOuH7oHzAcCTBntT1Q
 Sjuzz1a3E1iNoNUVn2OQGafSErWYi7RP95tzvBFvCCEQsivYBtCBb/4cFHye5sUe6VJJ
 ssxA==
X-Gm-Message-State: AOAM530W6LaNiu+qfrC/9ywzfqqaPKOCP8VvieiBsE9M79q0IQBoGPV1
 IsfVG63FGieP4lcSQunWTlO32g==
X-Google-Smtp-Source: ABdhPJwJ3HITM6THgLn4LcJNc/8bbrLad9Q/6xXNoYMIZqK8+OruuLCFoux654QBoTpSEYzc7I23KA==
X-Received: by 2002:a1c:f219:: with SMTP id s25mr55517428wmc.31.1635244719816; 
 Tue, 26 Oct 2021 03:38:39 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x21sm221397wmc.14.2021.10.26.03.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:38:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [RESEND PATCH v10 09/17] ASoC: qdsp6: audioreach: add basic pkt alloc
 support
Date: Tue, 26 Oct 2021 11:38:07 +0100
Message-Id: <20211026103815.19468-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
References: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com
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

Add basic helper functions for AudioReach.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 255 ++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h | 668 ++++++++++++++++++++++++++++++
 2 files changed, 923 insertions(+)
 create mode 100644 sound/soc/qcom/qdsp6/audioreach.c
 create mode 100644 sound/soc/qcom/qdsp6/audioreach.h

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
new file mode 100644
index 000000000000..198d962c81f8
--- /dev/null
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -0,0 +1,255 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020, Linaro Limited
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/soc/qcom/apr.h>
+#include <dt-bindings/soc/qcom,gpr.h>
+#include "audioreach.h"
+
+/* SubGraph Config */
+struct apm_sub_graph_data {
+	struct apm_sub_graph_cfg sub_graph_cfg;
+	struct apm_prop_data perf_data;
+	struct apm_sg_prop_id_perf_mode perf;
+	struct apm_prop_data dir_data;
+	struct apm_sg_prop_id_direction dir;
+	struct apm_prop_data sid_data;
+	struct apm_sg_prop_id_scenario_id sid;
+
+} __packed;
+
+#define APM_SUB_GRAPH_CFG_NPROP	3
+
+struct apm_sub_graph_params  {
+	struct apm_module_param_data param_data;
+	uint32_t num_sub_graphs;
+	struct apm_sub_graph_data sg_cfg[];
+} __packed;
+
+#define APM_SUB_GRAPH_PSIZE(p, n) ALIGN(struct_size(p, sg_cfg, n), 8)
+
+/* container config */
+struct apm_container_obj  {
+	struct apm_container_cfg container_cfg;
+	/* Capability ID list */
+	struct apm_prop_data cap_data;
+	uint32_t num_capability_id;
+	uint32_t capability_id;
+
+	/* Container graph Position */
+	struct apm_prop_data pos_data;
+	struct apm_cont_prop_id_graph_pos pos;
+
+	/* Container Stack size */
+	struct apm_prop_data stack_data;
+	struct apm_cont_prop_id_stack_size stack;
+
+	/* Container proc domain id */
+	struct apm_prop_data domain_data;
+	struct apm_cont_prop_id_domain domain;
+} __packed;
+
+struct apm_container_params  {
+	struct apm_module_param_data param_data;
+	uint32_t num_containers;
+	struct apm_container_obj cont_obj[];
+} __packed;
+
+#define APM_CONTAINER_PSIZE(p, n) ALIGN(struct_size(p, cont_obj, n), 8)
+
+/* Module List config */
+struct apm_mod_list_obj {
+	/* Modules list cfg */
+	uint32_t sub_graph_id;
+	uint32_t container_id;
+	uint32_t num_modules;
+	struct apm_module_obj mod_cfg[];
+} __packed;
+
+#define APM_MOD_LIST_OBJ_PSIZE(p, n) struct_size(p, mod_cfg, n)
+
+struct apm_module_list_params {
+	struct apm_module_param_data param_data;
+	uint32_t num_modules_list;
+	/* Module list config array */
+	struct apm_mod_list_obj mod_list_obj[];
+} __packed;
+
+
+/* Module Properties */
+struct apm_mod_prop_obj {
+	u32 instance_id;
+	u32 num_props;
+	struct apm_prop_data prop_data_1;
+	struct apm_module_prop_id_port_info prop_id_port;
+} __packed;
+
+struct apm_prop_list_params {
+	struct apm_module_param_data param_data;
+	u32 num_modules_prop_cfg;
+	struct apm_mod_prop_obj mod_prop_obj[];
+
+} __packed;
+
+#define APM_MOD_PROP_PSIZE(p, n) ALIGN(struct_size(p, mod_prop_obj, n), 8)
+
+/* Module Connections */
+struct apm_mod_conn_list_params {
+	struct apm_module_param_data param_data;
+	u32 num_connections;
+	struct apm_module_conn_obj conn_obj[];
+
+} __packed;
+
+#define APM_MOD_CONN_PSIZE(p, n) ALIGN(struct_size(p, conn_obj, n), 8)
+
+struct apm_graph_open_params {
+	struct apm_cmd_header *cmd_header;
+	struct apm_sub_graph_params *sg_data;
+	struct apm_container_params *cont_data;
+	struct apm_module_list_params *mod_list_data;
+	struct apm_prop_list_params *mod_prop_data;
+	struct apm_mod_conn_list_params *mod_conn_list_data;
+} __packed;
+
+struct apm_pcm_module_media_fmt_cmd {
+	struct apm_module_param_data param_data;
+	struct param_id_pcm_output_format_cfg header;
+	struct payload_pcm_output_format_cfg media_cfg;
+} __packed;
+
+struct apm_rd_shmem_module_config_cmd {
+	struct apm_module_param_data param_data;
+	struct param_id_rd_sh_mem_cfg cfg;
+} __packed;
+
+struct apm_sh_module_media_fmt_cmd {
+	struct media_format header;
+	struct payload_media_fmt_pcm cfg;
+} __packed;
+
+#define APM_SHMEM_FMT_CFG_PSIZE(ch) ALIGN( \
+				sizeof(struct apm_sh_module_media_fmt_cmd) + \
+				ch * sizeof(uint8_t), 8)
+
+/* num of channels as argument */
+#define APM_PCM_MODULE_FMT_CMD_PSIZE(ch) ALIGN( \
+				sizeof(struct apm_pcm_module_media_fmt_cmd) + \
+				ch * sizeof(uint8_t), 8)
+
+#define APM_PCM_OUT_FMT_CFG_PSIZE(p, n) ALIGN(struct_size(p, channel_mapping, n), 4)
+
+struct apm_i2s_module_intf_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_i2s_intf_cfg cfg;
+} __packed;
+
+#define APM_I2S_INTF_CFG_PSIZE ALIGN(sizeof(struct apm_i2s_module_intf_cfg), 8)
+
+struct apm_module_hw_ep_mf_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_hw_ep_mf mf;
+} __packed;
+
+#define APM_HW_EP_CFG_PSIZE ALIGN(sizeof(struct apm_module_hw_ep_mf_cfg), 8)
+
+struct apm_module_frame_size_factor_cfg {
+	struct apm_module_param_data param_data;
+	uint32_t frame_size_factor;
+} __packed;
+
+#define APM_FS_CFG_PSIZE ALIGN(sizeof(struct apm_module_frame_size_factor_cfg), 8)
+
+struct apm_module_hw_ep_power_mode_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_hw_ep_power_mode_cfg power_mode;
+} __packed;
+
+#define APM_HW_EP_PMODE_CFG_PSIZE ALIGN(sizeof(struct apm_module_hw_ep_power_mode_cfg),	8)
+
+struct apm_module_hw_ep_dma_data_align_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_hw_ep_dma_data_align align;
+} __packed;
+
+#define APM_HW_EP_DALIGN_CFG_PSIZE ALIGN(sizeof(struct apm_module_hw_ep_dma_data_align_cfg), 8)
+
+struct apm_gain_module_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_gain_cfg gain_cfg;
+} __packed;
+
+#define APM_GAIN_CFG_PSIZE ALIGN(sizeof(struct apm_gain_module_cfg), 8)
+
+struct apm_codec_dma_module_intf_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_codec_dma_intf_cfg cfg;
+} __packed;
+
+#define APM_CDMA_INTF_CFG_PSIZE ALIGN(sizeof(struct apm_codec_dma_module_intf_cfg), 8)
+
+static void *__audioreach_alloc_pkt(int payload_size, uint32_t opcode, uint32_t token,
+				    uint32_t src_port, uint32_t dest_port, bool has_cmd_hdr)
+{
+	struct gpr_pkt *pkt;
+	void *p;
+	int pkt_size = GPR_HDR_SIZE + payload_size;
+
+	if (has_cmd_hdr)
+		pkt_size += APM_CMD_HDR_SIZE;
+
+	p = kzalloc(pkt_size, GFP_KERNEL);
+	if (!p)
+		return ERR_PTR(-ENOMEM);
+
+	pkt = p;
+	pkt->hdr.version = GPR_PKT_VER;
+	pkt->hdr.hdr_size = GPR_PKT_HEADER_WORD_SIZE;
+	pkt->hdr.pkt_size = pkt_size;
+	pkt->hdr.dest_port = dest_port;
+	pkt->hdr.src_port = src_port;
+
+	pkt->hdr.dest_domain = GPR_DOMAIN_ID_ADSP;
+	pkt->hdr.src_domain = GPR_DOMAIN_ID_APPS;
+	pkt->hdr.token = token;
+	pkt->hdr.opcode = opcode;
+
+	if (has_cmd_hdr) {
+		struct apm_cmd_header *cmd_header;
+
+		p = p + GPR_HDR_SIZE;
+		cmd_header = p;
+		cmd_header->payload_size = payload_size;
+	}
+
+	return pkt;
+}
+
+void *audioreach_alloc_pkt(int payload_size, uint32_t opcode, uint32_t token,
+			   uint32_t src_port, uint32_t dest_port)
+{
+	return __audioreach_alloc_pkt(payload_size, opcode, token, src_port, dest_port, false);
+}
+EXPORT_SYMBOL_GPL(audioreach_alloc_pkt);
+
+void *audioreach_alloc_apm_pkt(int pkt_size, uint32_t opcode, uint32_t token, uint32_t src_port)
+{
+	return __audioreach_alloc_pkt(pkt_size, opcode, token, src_port, APM_MODULE_INSTANCE_ID,
+				      false);
+}
+EXPORT_SYMBOL_GPL(audioreach_alloc_apm_pkt);
+
+void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode, uint32_t token,
+			       uint32_t src_port, uint32_t dest_port)
+{
+	return __audioreach_alloc_pkt(payload_size, opcode, token, src_port, dest_port, true);
+}
+EXPORT_SYMBOL_GPL(audioreach_alloc_cmd_pkt);
+
+void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t token)
+{
+	return __audioreach_alloc_pkt(pkt_size, opcode, token, GPR_APM_MODULE_IID,
+				       APM_MODULE_INSTANCE_ID, true);
+}
+EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
new file mode 100644
index 000000000000..c124b7953e6e
--- /dev/null
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -0,0 +1,668 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __AUDIOREACH_H__
+#define __AUDIOREACH_H__
+#include <linux/types.h>
+#include <linux/soc/qcom/apr.h>
+#include <sound/soc.h>
+
+/* Module IDs */
+#define MODULE_ID_WR_SHARED_MEM_EP	0x07001000
+#define MODULE_ID_RD_SHARED_MEM_EP	0x07001001
+#define MODULE_ID_GAIN			0x07001002
+#define MODULE_ID_PCM_CNV		0x07001003
+#define MODULE_ID_PCM_ENC		0x07001004
+#define MODULE_ID_PCM_DEC		0x07001005
+#define MODULE_ID_CODEC_DMA_SINK	0x07001023
+#define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
+#define MODULE_ID_I2S_SINK		0x0700100A
+#define MODULE_ID_I2S_SOURCE		0x0700100B
+#define MODULE_ID_DATA_LOGGING		0x0700101A
+
+#define APM_CMD_GET_SPF_STATE		0x01001021
+#define APM_CMD_RSP_GET_SPF_STATE	0x02001007
+
+#define APM_MODULE_INSTANCE_ID		0x00000001
+#define PRM_MODULE_INSTANCE_ID		0x00000002
+#define AMDB_MODULE_INSTANCE_ID		0x00000003
+#define VCPM_MODULE_INSTANCE_ID		0x00000004
+#define AR_MODULE_INSTANCE_ID_START	0x00006000
+#define AR_MODULE_INSTANCE_ID_END	0x00007000
+#define AR_MODULE_DYNAMIC_INSTANCE_ID_START	0x00007000
+#define AR_MODULE_DYNAMIC_INSTANCE_ID_END	0x00008000
+#define AR_CONT_INSTANCE_ID_START	0x00005000
+#define AR_CONT_INSTANCE_ID_END		0x00006000
+#define AR_SG_INSTANCE_ID_START		0x00004000
+
+#define APM_CMD_GRAPH_OPEN			0x01001000
+#define APM_CMD_GRAPH_PREPARE			0x01001001
+#define APM_CMD_GRAPH_START			0x01001002
+#define APM_CMD_GRAPH_STOP			0x01001003
+#define APM_CMD_GRAPH_CLOSE			0x01001004
+#define APM_CMD_GRAPH_FLUSH			0x01001005
+#define APM_CMD_SET_CFG				0x01001006
+#define APM_CMD_GET_CFG				0x01001007
+#define APM_CMD_SHARED_MEM_MAP_REGIONS		0x0100100C
+#define APM_CMD_SHARED_MEM_UNMAP_REGIONS	0x0100100D
+#define APM_CMD_RSP_SHARED_MEM_MAP_REGIONS	0x02001001
+#define APM_CMD_RSP_GET_CFG			0x02001000
+#define APM_CMD_CLOSE_ALL			0x01001013
+#define APM_CMD_REGISTER_SHARED_CFG		0x0100100A
+
+#define APM_MEMORY_MAP_SHMEM8_4K_POOL		3
+
+struct apm_cmd_shared_mem_map_regions {
+	uint16_t mem_pool_id;
+	uint16_t num_regions;
+	uint32_t property_flag;
+} __packed;
+
+struct apm_shared_map_region_payload {
+	uint32_t shm_addr_lsw;
+	uint32_t shm_addr_msw;
+	uint32_t mem_size_bytes;
+} __packed;
+
+struct apm_cmd_shared_mem_unmap_regions {
+	uint32_t mem_map_handle;
+} __packed;
+
+struct apm_cmd_rsp_shared_mem_map_regions {
+	uint32_t mem_map_handle;
+} __packed;
+
+/* APM module */
+#define APM_PARAM_ID_SUB_GRAPH_LIST		0x08001005
+
+#define APM_PARAM_ID_MODULE_LIST		0x08001002
+
+struct apm_param_id_modules_list {
+	uint32_t num_modules_list;
+} __packed;
+
+#define APM_PARAM_ID_MODULE_PROP		0x08001003
+
+struct apm_param_id_module_prop {
+	uint32_t num_modules_prop_cfg;
+} __packed;
+
+struct apm_module_prop_cfg {
+	uint32_t instance_id;
+	uint32_t num_props;
+} __packed;
+
+#define APM_PARAM_ID_MODULE_CONN		0x08001004
+
+struct apm_param_id_module_conn {
+	uint32_t num_connections;
+} __packed;
+
+struct apm_module_conn_obj {
+	uint32_t src_mod_inst_id;
+	uint32_t src_mod_op_port_id;
+	uint32_t dst_mod_inst_id;
+	uint32_t dst_mod_ip_port_id;
+} __packed;
+
+#define APM_PARAM_ID_GAIN			0x08001006
+
+struct param_id_gain_cfg {
+	uint16_t gain;
+	uint16_t reserved;
+} __packed;
+
+#define PARAM_ID_PCM_OUTPUT_FORMAT_CFG		0x08001008
+
+struct param_id_pcm_output_format_cfg {
+	uint32_t data_format;
+	uint32_t fmt_id;
+	uint32_t payload_size;
+} __packed;
+
+struct payload_pcm_output_format_cfg {
+	uint16_t bit_width;
+	uint16_t alignment;
+	uint16_t bits_per_sample;
+	uint16_t q_factor;
+	uint16_t endianness;
+	uint16_t interleaved;
+	uint16_t reserved;
+	uint16_t num_channels;
+	uint8_t channel_mapping[];
+} __packed;
+
+#define PARAM_ID_ENC_BITRATE			0x08001052
+
+struct param_id_enc_bitrate_param {
+	uint32_t bitrate;
+} __packed;
+
+#define DATA_FORMAT_FIXED_POINT		1
+#define PCM_LSB_ALIGNED			1
+#define PCM_MSB_ALIGNED			2
+#define PCM_LITTLE_ENDIAN		1
+#define PCM_BIT_ENDIAN			2
+
+#define MEDIA_FMT_ID_PCM	0x09001000
+#define PCM_CHANNEL_L		1
+#define PCM_CHANNEL_R		2
+#define SAMPLE_RATE_48K		48000
+#define BIT_WIDTH_16		16
+
+#define APM_PARAM_ID_PROP_PORT_INFO		0x08001015
+
+struct apm_modules_prop_info {
+	uint32_t max_ip_port;
+	uint32_t max_op_port;
+} __packed;
+
+/* Shared memory module */
+#define DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER	0x04001000
+#define WR_SH_MEM_EP_TIMESTAMP_VALID_FLAG	BIT(31)
+#define WR_SH_MEM_EP_LAST_BUFFER_FLAG		BIT(30)
+#define WR_SH_MEM_EP_TS_CONTINUE_FLAG		BIT(29)
+#define WR_SH_MEM_EP_EOF_FLAG			BIT(4)
+
+struct apm_data_cmd_wr_sh_mem_ep_data_buffer {
+	uint32_t buf_addr_lsw;
+	uint32_t buf_addr_msw;
+	uint32_t mem_map_handle;
+	uint32_t buf_size;
+	uint32_t timestamp_lsw;
+	uint32_t timestamp_msw;
+	uint32_t flags;
+} __packed;
+
+#define DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2	0x0400100A
+
+struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2 {
+	uint32_t buf_addr_lsw;
+	uint32_t buf_addr_msw;
+	uint32_t mem_map_handle;
+	uint32_t buf_size;
+	uint32_t timestamp_lsw;
+	uint32_t timestamp_msw;
+	uint32_t flags;
+	uint32_t md_addr_lsw;
+	uint32_t md_addr_msw;
+	uint32_t md_map_handle;
+	uint32_t md_buf_size;
+} __packed;
+
+#define DATA_CMD_RSP_WR_SH_MEM_EP_DATA_BUFFER_DONE	0x05001000
+
+struct data_cmd_rsp_wr_sh_mem_ep_data_buffer_done {
+	uint32_t buf_addr_lsw;
+	uint32_t buf_addr_msw;
+	uint32_t mem_map_handle;
+	uint32_t status;
+
+} __packed;
+
+#define DATA_CMD_RSP_WR_SH_MEM_EP_DATA_BUFFER_DONE_V2	0x05001004
+
+struct data_cmd_rsp_wr_sh_mem_ep_data_buffer_done_v2 {
+	uint32_t buf_addr_lsw;
+	uint32_t buf_addr_msw;
+	uint32_t mem_map_handle;
+	uint32_t status;
+	uint32_t md_buf_addr_lsw;
+	uint32_t md_buf_addr_msw;
+	uint32_t md_mem_map_handle;
+	uint32_t md_status;
+} __packed;
+
+#define PARAM_ID_MEDIA_FORMAT				0x0800100C
+#define DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT		0x04001001
+
+struct apm_media_format {
+	uint32_t data_format;
+	uint32_t fmt_id;
+	uint32_t payload_size;
+} __packed;
+
+#define DATA_CMD_WR_SH_MEM_EP_EOS			0x04001002
+#define WR_SH_MEM_EP_EOS_POLICY_LAST	1
+#define WR_SH_MEM_EP_EOS_POLICY_EACH	2
+
+struct data_cmd_wr_sh_mem_ep_eos {
+	uint32_t policy;
+
+} __packed;
+
+#define DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER		0x04001003
+
+struct data_cmd_rd_sh_mem_ep_data_buffer {
+	uint32_t buf_addr_lsw;
+	uint32_t buf_addr_msw;
+	uint32_t mem_map_handle;
+	uint32_t buf_size;
+} __packed;
+
+#define DATA_CMD_RSP_RD_SH_MEM_EP_DATA_BUFFER		0x05001002
+
+struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done {
+	uint32_t status;
+	uint32_t buf_addr_lsw;
+	uint32_t buf_addr_msw;
+	uint32_t mem_map_handle;
+	uint32_t data_size;
+	uint32_t offset;
+	uint32_t timestamp_lsw;
+	uint32_t timestamp_msw;
+	uint32_t flags;
+	uint32_t num_frames;
+} __packed;
+
+#define DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2		0x0400100B
+
+struct data_cmd_rd_sh_mem_ep_data_buffer_v2 {
+	uint32_t buf_addr_lsw;
+	uint32_t buf_addr_msw;
+	uint32_t mem_map_handle;
+	uint32_t buf_size;
+	uint32_t md_buf_addr_lsw;
+	uint32_t md_buf_addr_msw;
+	uint32_t md_mem_map_handle;
+	uint32_t md_buf_size;
+} __packed;
+
+#define DATA_CMD_RSP_RD_SH_MEM_EP_DATA_BUFFER_V2	0x05001005
+
+struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 {
+	uint32_t status;
+	uint32_t buf_addr_lsw;
+	uint32_t buf_addr_msw;
+	uint32_t mem_map_handle;
+	uint32_t data_size;
+	uint32_t offset;
+	uint32_t timestamp_lsw;
+	uint32_t timestamp_msw;
+	uint32_t flags;
+	uint32_t num_frames;
+	uint32_t md_status;
+	uint32_t md_buf_addr_lsw;
+	uint32_t md_buf_addr_msw;
+	uint32_t md_mem_map_handle;
+	uint32_t md_size;
+} __packed;
+
+#define PARAM_ID_RD_SH_MEM_CFG				0x08001007
+
+struct param_id_rd_sh_mem_cfg {
+	uint32_t num_frames_per_buffer;
+	uint32_t metadata_control_flags;
+
+} __packed;
+
+#define DATA_CMD_WR_SH_MEM_EP_EOS_RENDERED		0x05001001
+
+struct data_cmd_wr_sh_mem_ep_eos_rendered {
+	uint32_t module_instance_id;
+	uint32_t render_status;
+} __packed;
+
+#define MODULE_ID_WR_SHARED_MEM_EP			0x07001000
+
+struct apm_cmd_header {
+	uint32_t payload_address_lsw;
+	uint32_t payload_address_msw;
+	uint32_t mem_map_handle;
+	uint32_t payload_size;
+} __packed;
+
+#define APM_CMD_HDR_SIZE sizeof(struct apm_cmd_header)
+
+struct apm_module_param_data  {
+	uint32_t module_instance_id;
+	uint32_t param_id;
+	uint32_t param_size;
+	uint32_t error_code;
+} __packed;
+
+#define APM_MODULE_PARAM_DATA_SIZE	sizeof(struct apm_module_param_data)
+
+struct apm_module_param_shared_data  {
+	uint32_t param_id;
+	uint32_t param_size;
+} __packed;
+
+struct apm_prop_data {
+	uint32_t prop_id;
+	uint32_t prop_size;
+} __packed;
+
+/* Sub-Graph Properties */
+#define APM_PARAM_ID_SUB_GRAPH_CONFIG	0x08001001
+
+struct apm_param_id_sub_graph_cfg {
+	uint32_t num_sub_graphs;
+} __packed;
+
+struct apm_sub_graph_cfg {
+	uint32_t sub_graph_id;
+	uint32_t num_sub_graph_prop;
+} __packed;
+
+#define APM_SUB_GRAPH_PROP_ID_PERF_MODE		0x0800100E
+
+struct apm_sg_prop_id_perf_mode {
+	uint32_t perf_mode;
+} __packed;
+
+#define APM_SG_PROP_ID_PERF_MODE_SIZE	4
+
+#define APM_SUB_GRAPH_PROP_ID_DIRECTION	0x0800100F
+
+struct apm_sg_prop_id_direction {
+	uint32_t direction;
+} __packed;
+
+#define APM_SG_PROP_ID_DIR_SIZE		4
+
+#define APM_SUB_GRAPH_PROP_ID_SCENARIO_ID	0x08001010
+#define APM_SUB_GRAPH_SID_AUDIO_PLAYBACK	0x1
+#define APM_SUB_GRAPH_SID_AUDIO_RECORD		0x2
+#define APM_SUB_GRAPH_SID_AUDIO_VOICE_CALL	0x3
+
+struct apm_sg_prop_id_scenario_id {
+	uint32_t scenario_id;
+} __packed;
+
+#define APM_SG_PROP_ID_SID_SIZE			4
+/* container api */
+#define APM_PARAM_ID_CONTAINER_CONFIG		0x08001000
+
+struct apm_param_id_container_cfg {
+	uint32_t num_containers;
+} __packed;
+
+struct apm_container_cfg {
+	uint32_t container_id;
+	uint32_t num_prop;
+} __packed;
+
+struct apm_cont_capability  {
+	uint32_t capability_id;
+} __packed;
+
+#define APM_CONTAINER_PROP_ID_CAPABILITY_LIST	0x08001011
+#define APM_CONTAINER_PROP_ID_CAPABILITY_SIZE	8
+
+#define APM_PROP_ID_INVALID			0x0
+#define APM_CONTAINER_CAP_ID_PP			0x1
+#define APM_CONTAINER_CAP_ID_PP			0x1
+
+struct apm_cont_prop_id_cap_list  {
+	uint32_t num_capability_id;
+} __packed;
+
+#define APM_CONTAINER_PROP_ID_GRAPH_POS		0x08001012
+
+struct apm_cont_prop_id_graph_pos  {
+	uint32_t graph_pos;
+} __packed;
+
+#define APM_CONTAINER_PROP_ID_STACK_SIZE	0x08001013
+
+struct apm_cont_prop_id_stack_size  {
+	uint32_t stack_size;
+} __packed;
+
+#define APM_CONTAINER_PROP_ID_PROC_DOMAIN	0x08001014
+
+struct apm_cont_prop_id_domain  {
+	uint32_t proc_domain;
+} __packed;
+
+#define CONFIG_I2S_WS_SRC_EXTERNAL		0x0
+#define CONFIG_I2S_WS_SRC_INTERNAL		0x1
+
+#define PARAM_ID_I2S_INTF_CFG			0x08001019
+struct param_id_i2s_intf_cfg {
+	uint32_t lpaif_type;
+	uint32_t intf_idx;
+	uint16_t sd_line_idx;
+	uint16_t ws_src;
+} __packed;
+
+#define I2S_INTF_TYPE_PRIMARY		0
+#define I2S_INTF_TYPE_SECOINDARY	1
+#define I2S_INTF_TYPE_TERTINARY		2
+#define I2S_INTF_TYPE_QUATERNARY	3
+#define I2S_INTF_TYPE_QUINARY		4
+#define I2S_SD0				1
+#define I2S_SD1				2
+#define I2S_SD2				3
+#define I2S_SD3				4
+
+#define PORT_ID_I2S_INPUT		2
+#define PORT_ID_I2S_OUPUT		1
+#define I2S_STACK_SIZE			2048
+
+#define PARAM_ID_HW_EP_MF_CFG			0x08001017
+struct param_id_hw_ep_mf {
+	uint32_t sample_rate;
+	uint16_t bit_width;
+	uint16_t num_channels;
+	uint32_t data_format;
+} __packed;
+
+#define PARAM_ID_HW_EP_FRAME_SIZE_FACTOR	0x08001018
+
+struct param_id_fram_size_factor {
+	uint32_t frame_size_factor;
+} __packed;
+
+#define APM_CONTAINER_PROP_ID_PARENT_CONTAINER_ID	0x080010CB
+
+struct apm_cont_prop_id_parent_container  {
+	uint32_t parent_container_id;
+} __packed;
+
+#define APM_CONTAINER_PROP_ID_HEAP_ID			0x08001174
+#define APM_CONT_HEAP_DEFAULT				0x1
+#define APM_CONT_HEAP_LOW_POWER				0x2
+
+struct apm_cont_prop_id_headp_id  {
+	uint32_t heap_id;
+} __packed;
+
+struct apm_modules_list {
+	uint32_t sub_graph_id;
+	uint32_t container_id;
+	uint32_t num_modules;
+} __packed;
+
+struct apm_module_obj {
+	uint32_t module_id;
+	uint32_t instance_id;
+} __packed;
+
+#define APM_MODULE_PROP_ID_PORT_INFO		0x08001015
+#define APM_MODULE_PROP_ID_PORT_INFO_SZ		8
+struct apm_module_prop_id_port_info {
+	uint32_t max_ip_port;
+	uint32_t max_op_port;
+} __packed;
+
+#define DATA_LOGGING_MAX_INPUT_PORTS		0x1
+#define DATA_LOGGING_MAX_OUTPUT_PORTS		0x1
+#define DATA_LOGGING_STACK_SIZE			2048
+#define PARAM_ID_DATA_LOGGING_CONFIG		0x08001031
+
+struct data_logging_config {
+	uint32_t log_code;
+	uint32_t log_tap_point_id;
+	uint32_t mode;
+} __packed;
+
+#define PARAM_ID_MFC_OUTPUT_MEDIA_FORMAT	0x08001024
+
+struct param_id_mfc_media_format {
+	uint32_t sample_rate;
+	uint16_t bit_width;
+	uint16_t num_channels;
+	uint16_t channel_mapping[];
+} __packed;
+
+struct media_format {
+	uint32_t data_format;
+	uint32_t fmt_id;
+	uint32_t payload_size;
+} __packed;
+
+struct payload_media_fmt_pcm {
+	uint32_t sample_rate;
+	uint16_t bit_width;
+	uint16_t alignment;
+	uint16_t bits_per_sample;
+	uint16_t q_factor;
+	uint16_t endianness;
+	uint16_t num_channels;
+	uint8_t channel_mapping[];
+} __packed;
+
+#define PARAM_ID_CODEC_DMA_INTF_CFG		0x08001063
+
+struct param_id_codec_dma_intf_cfg {
+	/* 1 - RXTX
+	 * 2 - WSA
+	 * 3 - VA
+	 * 4 - AXI
+	 */
+	uint32_t lpaif_type;
+	/*
+	 *  RX0 | TX0 = 1
+	 *  RX1 | TX1 = 2
+	 *  RX2 | TX2 = 3... so on
+	 */
+	uint32_t intf_index;
+	uint32_t active_channels_mask;
+} __packed;
+
+struct audio_hw_clk_cfg {
+	uint32_t clock_id;
+	uint32_t clock_freq;
+	uint32_t clock_attri;
+	uint32_t clock_root;
+} __packed;
+
+#define PARAM_ID_HW_EP_POWER_MODE_CFG	0x8001176
+#define AR_HW_EP_POWER_MODE_0	0 /* default */
+#define AR_HW_EP_POWER_MODE_1	1 /* XO Shutdown allowed */
+#define AR_HW_EP_POWER_MODE_2	2 /* XO Shutdown not allowed */
+
+struct param_id_hw_ep_power_mode_cfg {
+	uint32_t power_mode;
+} __packed;
+
+#define PARAM_ID_HW_EP_DMA_DATA_ALIGN	0x08001233
+#define AR_HW_EP_DMA_DATA_ALIGN_MSB	0
+#define AR_HW_EP_DMA_DATA_ALIGN_LSB	1
+#define AR_PCM_MAX_NUM_CHANNEL		8
+
+struct param_id_hw_ep_dma_data_align {
+	uint32_t dma_data_align;
+} __packed;
+
+/* Graph */
+struct audioreach_connection {
+	/* Connections */
+	uint32_t src_mod_inst_id;
+	uint32_t src_mod_op_port_id;
+	uint32_t dst_mod_inst_id;
+	uint32_t dst_mod_ip_port_id;
+	struct list_head node;
+};
+
+struct audioreach_graph_info {
+	int id;
+	uint32_t num_sub_graphs;
+	struct list_head sg_list;
+	struct list_head connection_list;
+};
+
+struct audioreach_sub_graph {
+	uint32_t sub_graph_id;
+	uint32_t perf_mode;
+	uint32_t direction;
+	uint32_t scenario_id;
+	struct list_head node;
+
+	struct audioreach_graph_info *info;
+	uint32_t num_containers;
+	struct list_head container_list;
+};
+
+struct audioreach_container {
+	uint32_t container_id;
+	uint32_t capability_id;
+	uint32_t graph_pos;
+	uint32_t stack_size;
+	uint32_t proc_domain;
+	struct list_head node;
+
+	uint32_t num_modules;
+	struct list_head modules_list;
+	struct audioreach_sub_graph *sub_graph;
+};
+
+struct audioreach_module {
+	uint32_t module_id;
+	uint32_t instance_id;
+
+	uint32_t max_ip_port;
+	uint32_t max_op_port;
+
+	uint32_t in_port;
+	uint32_t out_port;
+
+	/* Connections */
+	uint32_t src_mod_inst_id;
+	uint32_t src_mod_op_port_id;
+	uint32_t dst_mod_inst_id;
+	uint32_t dst_mod_ip_port_id;
+
+	/* Format specifics */
+	uint32_t ch_fmt;
+	uint32_t rate;
+	uint32_t bit_depth;
+
+	/* I2S module */
+	uint32_t hw_interface_idx;
+	uint32_t sd_line_idx;
+	uint32_t ws_src;
+	uint32_t frame_size_factor;
+	uint32_t data_format;
+	uint32_t hw_interface_type;
+
+	/* PCM module specific */
+	uint32_t interleave_type;
+
+	/* GAIN/Vol Control Module */
+	uint16_t gain;
+
+	/* Logging */
+	uint32_t log_code;
+	uint32_t log_tap_point_id;
+	uint32_t log_mode;
+
+	/* bookkeeping */
+	struct list_head node;
+	struct audioreach_container *container;
+	struct snd_soc_dapm_widget *widget;
+};
+
+/* Packet Allocation routines */
+void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t
+				    token);
+void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
+			       uint32_t token, uint32_t src_port,
+			       uint32_t dest_port);
+void *audioreach_alloc_apm_pkt(int pkt_size, uint32_t opcode, uint32_t token,
+				uint32_t src_port);
+void *audioreach_alloc_pkt(int payload_size, uint32_t opcode,
+			   uint32_t token, uint32_t src_port,
+			   uint32_t dest_port);
+#endif /* __AUDIOREACH_H__ */
-- 
2.21.0

