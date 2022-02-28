Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B344C70CC
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 16:36:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D1FB17ED;
	Mon, 28 Feb 2022 16:35:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D1FB17ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646062562;
	bh=Y9sov4Dlm3BeD4tpPZlfzxKogDdiTmCUe8pXAOB0dd4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aLJ8KF++Sw1UzM1XjXG6+y8kY06+kTMRnkIAF5ML488UbnIYTtD5150r0zzeS8/yg
	 iDlxIFCvA7E52Ot//ElJroeiwMOq2f02eSyDYUjiJrRZMoB8bOfVlyIuY9l8V0HQ/L
	 BGcl1bhGGwyvfbpIO6uA1Ao8i+EgpZoR5n9BjX8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF593F8055C;
	Mon, 28 Feb 2022 16:32:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35C52F80557; Mon, 28 Feb 2022 16:32:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0286FF80544
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 16:32:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0286FF80544
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DcapaZgb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646062327; x=1677598327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y9sov4Dlm3BeD4tpPZlfzxKogDdiTmCUe8pXAOB0dd4=;
 b=DcapaZgbdMlbq+BqDK4XlHxCAPRqIjSWSiLW0+a11TmLsPa+XXIdl8z0
 ySd0YNbGsJio7LFs1S5Ed8UZE6W8qZadC9QxhBWk2xV080WWBBzK/JvHB
 7TohmK08Ngr0Ia7RmUyqVso+VZRTEmIAwGNt2d4TBIzX4cTlEMCA4GJiN
 dc7UePd0cB7ypHm0tlRW8n+VX3jeoxPBkVBvartV2Ocey/1npOiMC7xYE
 W6n3rkrwrzMrVyIagYHohCH6osgwpTx1yL5cKRWav82UoG56xcVBMiOLs
 9xqUgqBj7sT/X8yLQKPrzLq4KLHrVaaF8mVa+nNHbZNaG95w75IXYjFT7 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="339342433"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="339342433"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 07:32:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="629667284"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Feb 2022 07:32:01 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 10/17] ASoC: Intel: avs: Add basefw runtime-parameter
 requests
Date: Mon, 28 Feb 2022 16:33:36 +0100
Message-Id: <20220228153343.2263412-11-cezary.rojewski@intel.com>
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

Each module may expose a range of runtime parameters. For basefw,
implement handlers for: FIRMWARE_CONFIG, HARDWARE_CONFIG and
MODULES_INFO. These are used by driver to dynamically allocate resources
in respect to platform details, reducing number of hardcodes and code
duplications that would otherwise be needed to be defined within the
driver code.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.c | 215 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/messages.h | 179 +++++++++++++++++++++++++++
 2 files changed, 394 insertions(+)

diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index c85d0293093b..1d27747be7df 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -463,3 +463,218 @@ int avs_ipc_set_d0ix(struct avs_dev *adev, bool enable_pg, bool streaming)
 
 	return ret;
 }
+
+int avs_ipc_get_fw_config(struct avs_dev *adev, struct avs_fw_cfg *cfg)
+{
+	struct avs_tlv *tlv;
+	size_t payload_size;
+	size_t offset = 0;
+	u8 *payload;
+	int ret;
+
+	ret = avs_ipc_get_large_config(adev, AVS_BASEFW_MOD_ID, AVS_BASEFW_INST_ID,
+				       AVS_BASEFW_FIRMWARE_CONFIG, NULL, 0,
+				       &payload, &payload_size);
+	if (ret)
+		return ret;
+
+	while (offset < payload_size) {
+		tlv = (struct avs_tlv *)(payload + offset);
+
+		switch (tlv->type) {
+		case AVS_FW_CFG_FW_VERSION:
+			memcpy(&cfg->fw_version, tlv->value,
+				sizeof(cfg->fw_version));
+			break;
+
+		case AVS_FW_CFG_MEMORY_RECLAIMED:
+			cfg->memory_reclaimed = *tlv->value;
+			break;
+
+		case AVS_FW_CFG_SLOW_CLOCK_FREQ_HZ:
+			cfg->slow_clock_freq_hz = *tlv->value;
+			break;
+
+		case AVS_FW_CFG_FAST_CLOCK_FREQ_HZ:
+			cfg->fast_clock_freq_hz = *tlv->value;
+			break;
+
+		case AVS_FW_CFG_ALH_SUPPORT_LEVEL:
+			cfg->alh_support = *tlv->value;
+			break;
+
+		case AVS_FW_CFG_IPC_DL_MAILBOX_BYTES:
+			cfg->ipc_dl_mailbox_bytes = *tlv->value;
+			break;
+
+		case AVS_FW_CFG_IPC_UL_MAILBOX_BYTES:
+			cfg->ipc_ul_mailbox_bytes = *tlv->value;
+			break;
+
+		case AVS_FW_CFG_TRACE_LOG_BYTES:
+			cfg->trace_log_bytes = *tlv->value;
+			break;
+
+		case AVS_FW_CFG_MAX_PPL_COUNT:
+			cfg->max_ppl_count = *tlv->value;
+			break;
+
+		case AVS_FW_CFG_MAX_ASTATE_COUNT:
+			cfg->max_astate_count = *tlv->value;
+			break;
+
+		case AVS_FW_CFG_MAX_MODULE_PIN_COUNT:
+			cfg->max_module_pin_count = *tlv->value;
+			break;
+
+		case AVS_FW_CFG_MODULES_COUNT:
+			cfg->modules_count = *tlv->value;
+			break;
+
+		case AVS_FW_CFG_MAX_MOD_INST_COUNT:
+			cfg->max_mod_inst_count = *tlv->value;
+			break;
+
+		case AVS_FW_CFG_MAX_LL_TASKS_PER_PRI_COUNT:
+			cfg->max_ll_tasks_per_pri_count = *tlv->value;
+			break;
+
+		case AVS_FW_CFG_LL_PRI_COUNT:
+			cfg->ll_pri_count = *tlv->value;
+			break;
+
+		case AVS_FW_CFG_MAX_DP_TASKS_COUNT:
+			cfg->max_dp_tasks_count = *tlv->value;
+			break;
+
+		case AVS_FW_CFG_MAX_LIBS_COUNT:
+			cfg->max_libs_count = *tlv->value;
+			break;
+
+		case AVS_FW_CFG_XTAL_FREQ_HZ:
+			cfg->xtal_freq_hz = *tlv->value;
+			break;
+
+		case AVS_FW_CFG_POWER_GATING_POLICY:
+			cfg->power_gating_policy = *tlv->value;
+			break;
+
+		/* Known but not useful to us. */
+		case AVS_FW_CFG_DMA_BUFFER_CONFIG:
+		case AVS_FW_CFG_SCHEDULER_CONFIG:
+		case AVS_FW_CFG_CLOCKS_CONFIG:
+			break;
+
+		default:
+			dev_info(adev->dev, "Unrecognized fw param: %d\n",
+				 tlv->type);
+			break;
+		}
+
+		offset += sizeof(*tlv) + tlv->length;
+	}
+
+	kfree(payload);
+	return ret;
+}
+
+int avs_ipc_get_hw_config(struct avs_dev *adev, struct avs_hw_cfg *cfg)
+{
+	struct avs_tlv *tlv;
+	size_t payload_size;
+	size_t size, offset = 0;
+	u8 *payload;
+	int ret;
+
+	ret = avs_ipc_get_large_config(adev, AVS_BASEFW_MOD_ID, AVS_BASEFW_INST_ID,
+				       AVS_BASEFW_HARDWARE_CONFIG, NULL, 0,
+				       &payload, &payload_size);
+	if (ret)
+		return ret;
+
+	while (offset < payload_size) {
+		tlv = (struct avs_tlv *)(payload + offset);
+
+		switch (tlv->type) {
+		case AVS_HW_CFG_AVS_VER:
+			cfg->avs_version = *tlv->value;
+			break;
+
+		case AVS_HW_CFG_DSP_CORES:
+			cfg->dsp_cores = *tlv->value;
+			break;
+
+		case AVS_HW_CFG_MEM_PAGE_BYTES:
+			cfg->mem_page_bytes = *tlv->value;
+			break;
+
+		case AVS_HW_CFG_TOTAL_PHYS_MEM_PAGES:
+			cfg->total_phys_mem_pages = *tlv->value;
+			break;
+
+		case AVS_HW_CFG_I2S_CAPS:
+			cfg->i2s_caps.i2s_version = tlv->value[0];
+			size = tlv->value[1];
+			cfg->i2s_caps.ctrl_count = size;
+			if (!size)
+				break;
+
+			/* Multiply to get entire array size. */
+			size *= sizeof(*cfg->i2s_caps.ctrl_base_addr);
+			cfg->i2s_caps.ctrl_base_addr = devm_kmemdup(adev->dev,
+								    &tlv->value[2],
+								    size, GFP_KERNEL);
+			if (!cfg->i2s_caps.ctrl_base_addr) {
+				ret = -ENOMEM;
+				goto exit;
+			}
+			break;
+
+		case AVS_HW_CFG_GATEWAY_COUNT:
+			cfg->gateway_count = *tlv->value;
+			break;
+
+		case AVS_HW_CFG_HP_EBB_COUNT:
+			cfg->hp_ebb_count = *tlv->value;
+			break;
+
+		case AVS_HW_CFG_LP_EBB_COUNT:
+			cfg->lp_ebb_count = *tlv->value;
+			break;
+
+		case AVS_HW_CFG_EBB_SIZE_BYTES:
+			cfg->ebb_size_bytes = *tlv->value;
+			break;
+
+		case AVS_HW_CFG_GPDMA_CAPS:
+			break;
+
+		default:
+			dev_info(adev->dev, "Unrecognized hw config: %d\n",
+				 tlv->type);
+			break;
+		}
+
+		offset += sizeof(*tlv) + tlv->length;
+	}
+
+exit:
+	kfree(payload);
+	return ret;
+}
+
+int avs_ipc_get_modules_info(struct avs_dev *adev, struct avs_mods_info **info)
+{
+	size_t payload_size;
+	u8 *payload;
+	int ret;
+
+	ret = avs_ipc_get_large_config(adev, AVS_BASEFW_MOD_ID, AVS_BASEFW_INST_ID,
+				       AVS_BASEFW_MODULES_INFO, NULL, 0,
+				       &payload, &payload_size);
+	if (ret)
+		return ret;
+
+	*info = (struct avs_mods_info *)payload;
+	return 0;
+}
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 615a61cef4f6..67ba0a6347a1 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -319,4 +319,183 @@ struct avs_dxstate_info {
 int avs_ipc_set_dx(struct avs_dev *adev, u32 core_mask, bool powerup);
 int avs_ipc_set_d0ix(struct avs_dev *adev, bool enable_pg, bool streaming);
 
+/* Base-firmware runtime parameters */
+
+#define AVS_BASEFW_MOD_ID	0
+#define AVS_BASEFW_INST_ID	0
+
+enum avs_basefw_runtime_param {
+	AVS_BASEFW_FIRMWARE_CONFIG = 7,
+	AVS_BASEFW_HARDWARE_CONFIG = 8,
+	AVS_BASEFW_MODULES_INFO = 9,
+	AVS_BASEFW_LIBRARIES_INFO = 16,
+};
+
+struct avs_fw_version {
+	u16 major;
+	u16 minor;
+	u16 hotfix;
+	u16 build;
+};
+
+enum avs_fw_cfg_params {
+	AVS_FW_CFG_FW_VERSION = 0,
+	AVS_FW_CFG_MEMORY_RECLAIMED,
+	AVS_FW_CFG_SLOW_CLOCK_FREQ_HZ,
+	AVS_FW_CFG_FAST_CLOCK_FREQ_HZ,
+	AVS_FW_CFG_DMA_BUFFER_CONFIG,
+	AVS_FW_CFG_ALH_SUPPORT_LEVEL,
+	AVS_FW_CFG_IPC_DL_MAILBOX_BYTES,
+	AVS_FW_CFG_IPC_UL_MAILBOX_BYTES,
+	AVS_FW_CFG_TRACE_LOG_BYTES,
+	AVS_FW_CFG_MAX_PPL_COUNT,
+	AVS_FW_CFG_MAX_ASTATE_COUNT,
+	AVS_FW_CFG_MAX_MODULE_PIN_COUNT,
+	AVS_FW_CFG_MODULES_COUNT,
+	AVS_FW_CFG_MAX_MOD_INST_COUNT,
+	AVS_FW_CFG_MAX_LL_TASKS_PER_PRI_COUNT,
+	AVS_FW_CFG_LL_PRI_COUNT,
+	AVS_FW_CFG_MAX_DP_TASKS_COUNT,
+	AVS_FW_CFG_MAX_LIBS_COUNT,
+	AVS_FW_CFG_SCHEDULER_CONFIG,
+	AVS_FW_CFG_XTAL_FREQ_HZ,
+	AVS_FW_CFG_CLOCKS_CONFIG,
+	AVS_FW_CFG_RESERVED,
+	AVS_FW_CFG_POWER_GATING_POLICY,
+	AVS_FW_CFG_ASSERT_MODE,
+};
+
+struct avs_fw_cfg {
+	struct avs_fw_version fw_version;
+	u32 memory_reclaimed;
+	u32 slow_clock_freq_hz;
+	u32 fast_clock_freq_hz;
+	u32 alh_support;
+	u32 ipc_dl_mailbox_bytes;
+	u32 ipc_ul_mailbox_bytes;
+	u32 trace_log_bytes;
+	u32 max_ppl_count;
+	u32 max_astate_count;
+	u32 max_module_pin_count;
+	u32 modules_count;
+	u32 max_mod_inst_count;
+	u32 max_ll_tasks_per_pri_count;
+	u32 ll_pri_count;
+	u32 max_dp_tasks_count;
+	u32 max_libs_count;
+	u32 xtal_freq_hz;
+	u32 power_gating_policy;
+};
+
+int avs_ipc_get_fw_config(struct avs_dev *adev, struct avs_fw_cfg *cfg);
+
+enum avs_hw_cfg_params {
+	AVS_HW_CFG_AVS_VER,
+	AVS_HW_CFG_DSP_CORES,
+	AVS_HW_CFG_MEM_PAGE_BYTES,
+	AVS_HW_CFG_TOTAL_PHYS_MEM_PAGES,
+	AVS_HW_CFG_I2S_CAPS,
+	AVS_HW_CFG_GPDMA_CAPS,
+	AVS_HW_CFG_GATEWAY_COUNT,
+	AVS_HW_CFG_HP_EBB_COUNT,
+	AVS_HW_CFG_LP_EBB_COUNT,
+	AVS_HW_CFG_EBB_SIZE_BYTES,
+};
+
+enum avs_iface_version {
+	AVS_AVS_VER_1_5 = 0x10005,
+	AVS_AVS_VER_1_8 = 0x10008,
+};
+
+enum avs_i2s_version {
+	AVS_I2S_VER_15_SKYLAKE   = 0x00000,
+	AVS_I2S_VER_15_BROXTON   = 0x10000,
+	AVS_I2S_VER_15_BROXTON_P = 0x20000,
+	AVS_I2S_VER_18_KBL_CNL   = 0x30000,
+};
+
+struct avs_i2s_caps {
+	u32 i2s_version;
+	u32 ctrl_count;
+	u32 *ctrl_base_addr;
+};
+
+struct avs_hw_cfg {
+	u32 avs_version;
+	u32 dsp_cores;
+	u32 mem_page_bytes;
+	u32 total_phys_mem_pages;
+	struct avs_i2s_caps i2s_caps;
+	u32 gateway_count;
+	u32 hp_ebb_count;
+	u32 lp_ebb_count;
+	u32 ebb_size_bytes;
+};
+
+int avs_ipc_get_hw_config(struct avs_dev *adev, struct avs_hw_cfg *cfg);
+
+#define AVS_MODULE_LOAD_TYPE_BUILTIN	0
+#define AVS_MODULE_LOAD_TYPE_LOADABLE	1
+#define AVS_MODULE_STATE_LOADED		BIT(0)
+
+struct avs_module_type {
+	u32 load_type:4;
+	u32 auto_start:1;
+	u32 domain_ll:1;
+	u32 domain_dp:1;
+	u32 lib_code:1;
+	u32 rsvd:24;
+} __packed;
+
+union avs_segment_flags {
+	u32 ul;
+	struct {
+		u32 contents:1;
+		u32 alloc:1;
+		u32 load:1;
+		u32 readonly:1;
+		u32 code:1;
+		u32 data:1;
+		u32 rsvd_1:2;
+		u32 type:4;
+		u32 rsvd_2:4;
+		u32 length:16;
+	};
+} __packed;
+
+struct avs_segment_desc {
+	union avs_segment_flags flags;
+	u32 v_base_addr;
+	u32 file_offset;
+} __packed;
+
+struct avs_module_entry {
+	u16 module_id;
+	u16 state_flags;
+	u8 name[8];
+	guid_t uuid;
+	struct avs_module_type type;
+	u8 hash[32];
+	u32 entry_point;
+	u16 cfg_offset;
+	u16 cfg_count;
+	u32 affinity_mask;
+	u16 instance_max_count;
+	u16 instance_bss_size;
+	struct avs_segment_desc segments[3];
+} __packed;
+
+struct avs_mods_info {
+	u32 count;
+	struct avs_module_entry entries[];
+} __packed;
+
+static inline bool avs_module_entry_is_loaded(struct avs_module_entry *mentry)
+{
+	return mentry->type.load_type == AVS_MODULE_LOAD_TYPE_BUILTIN ||
+	       mentry->state_flags & AVS_MODULE_STATE_LOADED;
+}
+
+int avs_ipc_get_modules_info(struct avs_dev *adev, struct avs_mods_info **info);
+
 #endif /* __SOUND_SOC_INTEL_AVS_MSGS_H */
-- 
2.25.1

