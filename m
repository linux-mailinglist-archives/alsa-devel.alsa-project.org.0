Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B32099F6D
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:08:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 228951671;
	Thu, 22 Aug 2019 21:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 228951671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566500908;
	bh=Mb6+MTNH8oy+cnOWgz10o7iCd6rgypRyKEYysKXheaM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=viYP6De+GgpExeUFYLZlUhD4cQFy4EZVWGqavDk1XWoowhihq3SxSyajSEv0vx/x3
	 FRCpEQaFFkTqtfKzTfBDHXC2QzcPBl5n1AXWmY8Fjvr+sY6D6EG+hZllz1us6d4CUp
	 c01t/vTj6TVF+BLXECW8H2WtR6GqUVoXKsoo5+EM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 302E4F80611;
	Thu, 22 Aug 2019 21:05:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28D26F805F6; Thu, 22 Aug 2019 21:04:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFACAF8036D
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFACAF8036D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524220"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:04:44 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:03:53 +0200
Message-Id: <20190822190425.23001-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 03/35] ASoC: Intel: Skylake: Add
	HARDWARE_CONFIG IPC request
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

Driver requests this property to discover underlying HW configuration.
Internally hw config is split between core config followed by
capabilities e.g.: i2s, gpdma.

Most params are currently unused. In time driver dependency on hw config
will increase, and with it, more parsing will be unveiled.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-messages.c |  1 +
 sound/soc/intel/skylake/skl-sst-ipc.c  | 87 ++++++++++++++++++++++++++
 sound/soc/intel/skylake/skl-sst-ipc.h  | 46 ++++++++++++++
 sound/soc/intel/skylake/skl.h          |  1 +
 4 files changed, 135 insertions(+)

diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index b6cefb1f9b12..d28b4887de27 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -320,6 +320,7 @@ int skl_free_dsp(struct skl_dev *skl)
 
 	skl->dsp_ops->cleanup(bus->dev, skl);
 
+	kfree(skl->hw_cfg.i2s_caps.ctrl_base_addr);
 	kfree(skl->cores.state);
 	kfree(skl->cores.usage_count);
 
diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
index e9e11ec4c97b..91b5440c643d 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.c
+++ b/sound/soc/intel/skylake/skl-sst-ipc.c
@@ -1189,3 +1189,90 @@ int skl_ipc_fw_cfg_get(struct sst_generic_ipc *ipc, struct skl_fw_cfg *cfg)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(skl_ipc_fw_cfg_get);
+
+int skl_ipc_hw_cfg_get(struct sst_generic_ipc *ipc, struct skl_hw_cfg *cfg)
+{
+	struct skl_ipc_large_config_msg msg = {0};
+	struct skl_tlv *tlv;
+	size_t size, bytes = 0, offset = 0;
+	u8 *payload = NULL;
+	int ret;
+
+	msg.module_id = 0;
+	msg.instance_id = 0;
+	msg.large_param_id = SKL_BASEFW_HARDWARE_CONFIG;
+
+	ret = skl_ipc_get_large_config(ipc, &msg, (u32 **)&payload, &bytes);
+	if (ret)
+		goto exit;
+
+	while (offset < bytes) {
+		tlv = (struct skl_tlv *)(payload + offset);
+
+		switch (tlv->type) {
+		case SKL_HW_CFG_CAVS_VER:
+			cfg->cavs_version = *tlv->value;
+			break;
+
+		case SKL_HW_CFG_DSP_CORES:
+			cfg->dsp_cores = *tlv->value;
+			break;
+
+		case SKL_HW_CFG_MEM_PAGE_BYTES:
+			cfg->mem_page_bytes = *tlv->value;
+			break;
+
+		case SKL_HW_CFG_TOTAL_PHYS_MEM_PAGES:
+			cfg->total_phys_mem_pages = *tlv->value;
+			break;
+
+		case SKL_HW_CFG_I2S_CAPS:
+			cfg->i2s_caps.version = tlv->value[0];
+			size = tlv->value[1];
+			cfg->i2s_caps.ctrl_count = size;
+			if (!size)
+				break;
+
+			size *= sizeof(*cfg->i2s_caps.ctrl_base_addr);
+			cfg->i2s_caps.ctrl_base_addr =
+				kmemdup(&tlv->value[2], size, GFP_KERNEL);
+			if (!cfg->i2s_caps.ctrl_base_addr) {
+				ret = -ENOMEM;
+				goto exit;
+			}
+			break;
+
+		case SKL_HW_CFG_GATEWAY_COUNT:
+			cfg->gateway_count = *tlv->value;
+			break;
+
+		case SKL_HW_CFG_HP_EBB_COUNT:
+			cfg->hp_ebb_count = *tlv->value;
+			break;
+
+		case SKL_HW_CFG_LP_EBB_COUNT:
+			cfg->lp_ebb_count = *tlv->value;
+			break;
+
+		case SKL_HW_CFG_EBB_SIZE_BYTES:
+			cfg->ebb_size_bytes = *tlv->value;
+			break;
+
+		case SKL_HW_CFG_GPDMA_CAPS:
+		case SKL_HW_CFG_UAOL_CAPS:
+			break;
+
+		default:
+			dev_info(ipc->dev, "Unrecognized hw param: %d\n",
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
+EXPORT_SYMBOL_GPL(skl_ipc_hw_cfg_get);
diff --git a/sound/soc/intel/skylake/skl-sst-ipc.h b/sound/soc/intel/skylake/skl-sst-ipc.h
index ebc5852e15d0..eefa52f7f97a 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.h
+++ b/sound/soc/intel/skylake/skl-sst-ipc.h
@@ -77,6 +77,7 @@ enum skl_basefw_runtime_param {
 	SKL_BASEFW_ASTATE_TABLE = 4,
 	SKL_BASEFW_DMA_CONTROL = 5,
 	SKL_BASEFW_FIRMWARE_CONFIG = 7,
+	SKL_BASEFW_HARDWARE_CONFIG = 8,
 };
 
 enum skl_fw_cfg_params {
@@ -141,6 +142,50 @@ struct skl_fw_cfg {
 	u32 power_gating_policy;
 };
 
+enum skl_hw_cfg_params {
+	SKL_HW_CFG_CAVS_VER,
+	SKL_HW_CFG_DSP_CORES,
+	SKL_HW_CFG_MEM_PAGE_BYTES,
+	SKL_HW_CFG_TOTAL_PHYS_MEM_PAGES,
+	SKL_HW_CFG_I2S_CAPS,
+	SKL_HW_CFG_GPDMA_CAPS,
+	SKL_HW_CFG_GATEWAY_COUNT,
+	SKL_HW_CFG_HP_EBB_COUNT,
+	SKL_HW_CFG_LP_EBB_COUNT,
+	SKL_HW_CFG_EBB_SIZE_BYTES,
+	SKL_HW_CFG_UAOL_CAPS
+};
+
+enum skl_cavs_version {
+	SKL_CAVS_VER_1_5 = 0x10005,
+	SKL_CAVS_VER_1_8 = 0x10008,
+};
+
+enum skl_i2s_version {
+	SKL_I2S_VER_15_SKYLAKE   = 0x00000,
+	SKL_I2S_VER_15_BROXTON   = 0x10000,
+	SKL_I2S_VER_15_BROXTON_P = 0x20000,
+	SKL_I2S_VER_18_KBL_CNL   = 0x30000,
+};
+
+struct skl_i2s_caps {
+	enum skl_i2s_version version;
+	u32 ctrl_count;
+	u32 *ctrl_base_addr;
+};
+
+struct skl_hw_cfg {
+	enum skl_cavs_version cavs_version;
+	u32 dsp_cores;
+	u32 mem_page_bytes;
+	u32 total_phys_mem_pages;
+	struct skl_i2s_caps i2s_caps;
+	u32 gateway_count;
+	u32 hp_ebb_count;
+	u32 lp_ebb_count;
+	u32 ebb_size_bytes;
+};
+
 struct skl_ipc_init_instance_msg {
 	u32 module_id;
 	u32 instance_id;
@@ -242,5 +287,6 @@ void skl_ipc_tx_data_copy(struct ipc_message *msg, char *tx_data,
 		size_t tx_size);
 
 int skl_ipc_fw_cfg_get(struct sst_generic_ipc *ipc, struct skl_fw_cfg *cfg);
+int skl_ipc_hw_cfg_get(struct sst_generic_ipc *ipc, struct skl_hw_cfg *cfg);
 
 #endif /* __SKL_IPC_H */
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 0d1c820e11cd..972de5ddf2b7 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -111,6 +111,7 @@ struct skl_dev {
 	/* Populate module information */
 	struct list_head uuid_list;
 	struct skl_fw_cfg fw_cfg;
+	struct skl_hw_cfg hw_cfg;
 
 	/* Is firmware loaded */
 	bool fw_loaded;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
