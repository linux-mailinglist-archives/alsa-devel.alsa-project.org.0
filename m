Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F8599F68
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:08:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1E791657;
	Thu, 22 Aug 2019 21:07:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1E791657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566500897;
	bh=Q0OevLlnJCl+KCKfOgON9+VxpnqthmkhsqgNhxfI6Nc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M20J/Rct8098LO36MASBY2xRf4djIObF4o9IBTiILCz54+P1cp83hwcFE2PtjNqI3
	 UuZtmFCKokC8CzJb1//F7SZDTbPwxLg8X2rSKJp/iyFWcl6iQZbFVsuAgcv0dSORJF
	 JkqqMZNXBSjXV6dibldsdWh9xdGEmOxQoFj859dE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1BD9F805FF;
	Thu, 22 Aug 2019 21:05:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 547ACF805F7; Thu, 22 Aug 2019 21:04:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18DEEF803F3
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:04:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18DEEF803F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:04:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524212"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:04:42 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:03:52 +0200
Message-Id: <20190822190425.23001-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 02/35] ASoC: Intel: Skylake: Add
	FIRMWARE_CONFIG IPC request
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Implement interface for retrieving firmware configuration. Skylake
driver will use this data instead of hardcoded values in updates to
come.

Most params are currently unused. In time driver dependency on fw config
will increase, and with it, more parsing will be unveiled.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-sst-ipc.c | 122 ++++++++++++++++++++++++++
 sound/soc/intel/skylake/skl-sst-ipc.h |  72 +++++++++++++++
 sound/soc/intel/skylake/skl.h         |   1 +
 3 files changed, 195 insertions(+)

diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
index 667cdddc289f..e9e11ec4c97b 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.c
+++ b/sound/soc/intel/skylake/skl-sst-ipc.c
@@ -11,6 +11,7 @@
 #include "skl.h"
 #include "skl-sst-dsp.h"
 #include "skl-sst-ipc.h"
+#include "skl-topology.h"
 #include "sound/hdaudio_ext.h"
 
 
@@ -1067,3 +1068,124 @@ int skl_ipc_set_d0ix(struct sst_generic_ipc *ipc, struct skl_ipc_d0ix_msg *msg)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(skl_ipc_set_d0ix);
+
+int skl_ipc_fw_cfg_get(struct sst_generic_ipc *ipc, struct skl_fw_cfg *cfg)
+{
+	struct skl_ipc_large_config_msg msg = {0};
+	struct skl_tlv *tlv;
+	size_t bytes = 0, offset = 0;
+	u8 *payload = NULL;
+	int ret;
+
+	msg.module_id = 0;
+	msg.instance_id = 0;
+	msg.large_param_id = SKL_BASEFW_FIRMWARE_CONFIG;
+
+	ret = skl_ipc_get_large_config(ipc, &msg, (u32 **)&payload, &bytes);
+	if (ret)
+		goto exit;
+
+	while (offset < bytes) {
+		tlv = (struct skl_tlv *)(payload + offset);
+
+		switch (tlv->type) {
+		case SKL_FW_CFG_FW_VERSION:
+			memcpy(&cfg->fw_version, tlv->value,
+				sizeof(cfg->fw_version));
+			break;
+
+		case SKL_FW_CFG_MEMORY_RECLAIMED:
+			cfg->memory_reclaimed = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_SLOW_CLOCK_FREQ_HZ:
+			cfg->slow_clock_freq_hz = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_FAST_CLOCK_FREQ_HZ:
+			cfg->fast_clock_freq_hz = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_ALH_SUPPORT_LEVEL:
+			cfg->alh_support = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_IPC_DL_MAILBOX_BYTES:
+			cfg->ipc_dl_mailbox_bytes = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_IPC_UL_MAILBOX_BYTES:
+			cfg->ipc_ul_mailbox_bytes = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_TRACE_LOG_BYTES:
+			cfg->trace_log_bytes = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_MAX_PPL_COUNT:
+			cfg->max_ppl_count = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_MAX_ASTATE_COUNT:
+			cfg->max_astate_count = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_MAX_MODULE_PIN_COUNT:
+			cfg->max_module_pin_count = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_MODULES_COUNT:
+			cfg->modules_count = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_MAX_MOD_INST_COUNT:
+			cfg->max_mod_inst_count = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_MAX_LL_TASKS_PER_PRI_COUNT:
+			cfg->max_ll_tasks_per_pri_count = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_LL_PRI_COUNT:
+			cfg->ll_pri_count = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_MAX_DP_TASKS_COUNT:
+			cfg->max_dp_tasks_count = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_MAX_LIBS_COUNT:
+			cfg->max_libs_count = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_XTAL_FREQ_HZ:
+			cfg->xtal_freq_hz = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_UAOL_SUPPORT:
+			cfg->uaol_support = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_POWER_GATING_POLICY:
+			cfg->power_gating_policy = *tlv->value;
+			break;
+
+		case SKL_FW_CFG_DMA_BUFFER_CONFIG:
+		case SKL_FW_CFG_SCHEDULER_CONFIG:
+		case SKL_FW_CFG_CLOCKS_CONFIG:
+			break;
+
+		default:
+			dev_info(ipc->dev, "Unrecognized fw param: %d\n",
+				tlv->type);
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
+EXPORT_SYMBOL_GPL(skl_ipc_fw_cfg_get);
diff --git a/sound/soc/intel/skylake/skl-sst-ipc.h b/sound/soc/intel/skylake/skl-sst-ipc.h
index 0058d82bd5a4..ebc5852e15d0 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.h
+++ b/sound/soc/intel/skylake/skl-sst-ipc.h
@@ -15,6 +15,12 @@
 struct sst_dsp;
 struct sst_generic_ipc;
 
+struct skl_tlv {
+	u32 type;
+	u32 length;
+	u8 value[0];
+};
+
 enum skl_ipc_pipeline_state {
 	PPL_INVALID_STATE =	0,
 	PPL_UNINITIALIZED =	1,
@@ -70,6 +76,69 @@ struct skl_lib_info {
 enum skl_basefw_runtime_param {
 	SKL_BASEFW_ASTATE_TABLE = 4,
 	SKL_BASEFW_DMA_CONTROL = 5,
+	SKL_BASEFW_FIRMWARE_CONFIG = 7,
+};
+
+enum skl_fw_cfg_params {
+	SKL_FW_CFG_FW_VERSION = 0,
+	SKL_FW_CFG_MEMORY_RECLAIMED,
+	SKL_FW_CFG_SLOW_CLOCK_FREQ_HZ,
+	SKL_FW_CFG_FAST_CLOCK_FREQ_HZ,
+	SKL_FW_CFG_DMA_BUFFER_CONFIG,
+	SKL_FW_CFG_ALH_SUPPORT_LEVEL,
+	SKL_FW_CFG_IPC_DL_MAILBOX_BYTES,
+	SKL_FW_CFG_IPC_UL_MAILBOX_BYTES,
+	SKL_FW_CFG_TRACE_LOG_BYTES,
+	SKL_FW_CFG_MAX_PPL_COUNT,
+	SKL_FW_CFG_MAX_ASTATE_COUNT,
+	SKL_FW_CFG_MAX_MODULE_PIN_COUNT,
+	SKL_FW_CFG_MODULES_COUNT,
+	SKL_FW_CFG_MAX_MOD_INST_COUNT,
+	SKL_FW_CFG_MAX_LL_TASKS_PER_PRI_COUNT,
+	SKL_FW_CFG_LL_PRI_COUNT,
+	SKL_FW_CFG_MAX_DP_TASKS_COUNT,
+	SKL_FW_CFG_MAX_LIBS_COUNT,
+	SKL_FW_CFG_SCHEDULER_CONFIG,
+	SKL_FW_CFG_XTAL_FREQ_HZ,
+	SKL_FW_CFG_CLOCKS_CONFIG,
+	SKL_FW_CFG_UAOL_SUPPORT,
+	SKL_FW_CFG_POWER_GATING_POLICY,
+	SKL_FW_CFG_ASSERT_MODE,
+};
+
+struct skl_fw_version {
+	u16 major;
+	u16 minor;
+	u16 hotfix;
+	u16 build;
+};
+
+enum skl_alh_support_level {
+	ALH_NO_SUPPORT = 0x00000,
+	ALH_CAVS_1_8_CNL = 0x10000,
+};
+
+struct skl_fw_cfg {
+	struct skl_fw_version fw_version;
+	u32 memory_reclaimed;
+	u32 slow_clock_freq_hz;
+	u32 fast_clock_freq_hz;
+	enum skl_alh_support_level alh_support;
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
+	u32 uaol_support;
+	u32 power_gating_policy;
 };
 
 struct skl_ipc_init_instance_msg {
@@ -171,4 +240,7 @@ int skl_ipc_process_notification(struct sst_generic_ipc *ipc,
 		struct skl_ipc_header header);
 void skl_ipc_tx_data_copy(struct ipc_message *msg, char *tx_data,
 		size_t tx_size);
+
+int skl_ipc_fw_cfg_get(struct sst_generic_ipc *ipc, struct skl_fw_cfg *cfg);
+
 #endif /* __SKL_IPC_H */
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index f8c714153610..0d1c820e11cd 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -110,6 +110,7 @@ struct skl_dev {
 
 	/* Populate module information */
 	struct list_head uuid_list;
+	struct skl_fw_cfg fw_cfg;
 
 	/* Is firmware loaded */
 	bool fw_loaded;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
