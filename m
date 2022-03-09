Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B424D3B2A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 21:35:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 604351852;
	Wed,  9 Mar 2022 21:34:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 604351852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646858118;
	bh=RRmsMWm+Qv4JSWnHec79tr7y0iNFf2EWz9GuB/AgvTk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M+Zk8WWVDDzQUQypF3eBCkmUXbt08dP43OdYf8NYYaBymu84M4BkicLoH6NVIGYBG
	 aaTjbNnN5vySXHrMWZk4BPmobJLJVdyGIOzB4On6z4k9MXPqtbYwNuWlbB5NovYG3V
	 nKdUy1mOh7kbYvWE/BW26ZZVIUVcIeikiVMdecOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0754F8059F;
	Wed,  9 Mar 2022 21:30:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8791DF80589; Wed,  9 Mar 2022 21:30:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B75EF8056F
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 21:30:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B75EF8056F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BzeAYv+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646857844; x=1678393844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RRmsMWm+Qv4JSWnHec79tr7y0iNFf2EWz9GuB/AgvTk=;
 b=BzeAYv+4y2M4xlcRlNldYEVEGXn4p/J9A8zLf51IaXdgqZt9IoHDZRBZ
 NYy+bJfSr+VXfRet387mv3E9py9EQJp92lK3VuhMa3NmmDsYylBu2k9tc
 Ma8sBAiDzNuQWGzVmxBHKdyBH5rjPIpGIvONF9fCRTUtz2WqySrmLTHRB
 wnsDrnKzqwjlnajgtdmAtmQ7G3zalUdSu9KUMPQaKTa8NjdHprVmCrtXT
 dxxZqNiJVMTw98XauQOhbp+gSvWhKqHCcHmgspTwx9ebkQo2M+Kb8kW62
 nBwqcvMpV1Z1J1u5cKdB2vgXC4pUytbSyJTFkfcvlcEakc0041b0A9jSe g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="255028819"
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="255028819"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 12:30:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="578527258"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga001.jf.intel.com with ESMTP; 09 Mar 2022 12:30:39 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 13/17] ASoC: Intel: avs: Dynamic firmware resources
 management
Date: Wed,  9 Mar 2022 21:40:25 +0100
Message-Id: <20220309204029.89040-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220309204029.89040-1-cezary.rojewski@intel.com>
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
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

Wrap elementary DSP-core operations and resource control into more
complex handlers. This is done to reduce the number of invocations of
wrapped operations throughout the driver as order of operations matters -
most flows involve register manipulation and IPCs combined.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h |  10 +++
 sound/soc/intel/avs/dsp.c | 170 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 180 insertions(+)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 02d7591d0eac..2f9d6347ab0f 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -89,6 +89,7 @@ struct avs_dev {
 	struct mutex modres_mutex;
 	struct ida ppl_ida;
 	struct list_head fw_list;
+	int *core_refs;		/* reference count per core */
 
 	struct completion fw_ready;
 };
@@ -205,4 +206,13 @@ int avs_request_firmware(struct avs_dev *adev, const struct firmware **fw_p, con
 void avs_release_last_firmware(struct avs_dev *adev);
 void avs_release_firmwares(struct avs_dev *adev);
 
+int avs_dsp_init_module(struct avs_dev *adev, u16 module_id, u8 ppl_instance_id,
+			u8 core_id, u8 domain, void *param, u32 param_size,
+			u16 *instance_id);
+void avs_dsp_delete_module(struct avs_dev *adev, u16 module_id, u16 instance_id,
+			   u8 ppl_instance_id, u8 core_id);
+int avs_dsp_create_pipeline(struct avs_dev *adev, u16 req_size, u8 priority,
+			    bool lp, u16 attributes, u8 *instance_id);
+int avs_dsp_delete_pipeline(struct avs_dev *adev, u8 instance_id);
+
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/dsp.c b/sound/soc/intel/avs/dsp.c
index eb9d941fe6cf..5994d64d2468 100644
--- a/sound/soc/intel/avs/dsp.c
+++ b/sound/soc/intel/avs/dsp.c
@@ -104,4 +104,174 @@ int avs_dsp_core_disable(struct avs_dev *adev, u32 core_mask)
 	return avs_dsp_op(adev, power, core_mask, false);
 }
 
+static int avs_dsp_enable(struct avs_dev *adev, u32 core_mask)
+{
+	u32 mask;
+	int ret;
+
+	ret = avs_dsp_core_enable(adev, core_mask);
+	if (ret < 0)
+		return ret;
+
+	mask = core_mask & ~AVS_MAIN_CORE_MASK;
+	if (!mask)
+		/*
+		 * without main core, fw is dead anyway
+		 * so setting D0 for it is futile.
+		 */
+		return 0;
+
+	ret = avs_ipc_set_dx(adev, mask, true);
+	return AVS_IPC_RET(ret);
+}
+
+static int avs_dsp_disable(struct avs_dev *adev, u32 core_mask)
+{
+	int ret;
+
+	ret = avs_ipc_set_dx(adev, core_mask, false);
+	if (ret)
+		return AVS_IPC_RET(ret);
+
+	return avs_dsp_core_disable(adev, core_mask);
+}
+
+static int avs_dsp_get_core(struct avs_dev *adev, u32 core_id)
+{
+	u32 mask;
+	int ret;
+
+	mask = BIT_MASK(core_id);
+	if (mask == AVS_MAIN_CORE_MASK)
+		/* nothing to do for main core */
+		return 0;
+	if (core_id >= adev->hw_cfg.dsp_cores) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	adev->core_refs[core_id]++;
+	if (adev->core_refs[core_id] == 1) {
+		ret = avs_dsp_enable(adev, mask);
+		if (ret)
+			goto err_enable_dsp;
+	}
+
+	return 0;
+
+err_enable_dsp:
+	adev->core_refs[core_id]--;
+err:
+	dev_err(adev->dev, "get core %d failed: %d\n", core_id, ret);
+	return ret;
+}
+
+static int avs_dsp_put_core(struct avs_dev *adev, u32 core_id)
+{
+	u32 mask;
+	int ret;
+
+	mask = BIT_MASK(core_id);
+	if (mask == AVS_MAIN_CORE_MASK)
+		/* nothing to do for main core */
+		return 0;
+	if (core_id >= adev->hw_cfg.dsp_cores) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	adev->core_refs[core_id]--;
+	if (!adev->core_refs[core_id]) {
+		ret = avs_dsp_disable(adev, mask);
+		if (ret)
+			goto err;
+	}
+
+	return 0;
+err:
+	dev_err(adev->dev, "put core %d failed: %d\n", core_id, ret);
+	return ret;
+}
+
+int avs_dsp_init_module(struct avs_dev *adev, u16 module_id, u8 ppl_instance_id,
+			u8 core_id, u8 domain, void *param, u32 param_size,
+			u16 *instance_id)
+{
+	struct avs_module_entry mentry;
+	int ret, id;
+
+	id = avs_module_id_alloc(adev, module_id);
+	if (id < 0)
+		return id;
+
+	ret = avs_get_module_id_entry(adev, module_id, &mentry);
+	if (ret)
+		goto err_mod_entry;
+
+	ret = avs_dsp_get_core(adev, core_id);
+	if (ret)
+		goto err_mod_entry;
+
+	ret = avs_ipc_init_instance(adev, module_id, id, ppl_instance_id,
+				    core_id, domain, param, param_size);
+	if (ret) {
+		ret = AVS_IPC_RET(ret);
+		goto err_ipc;
+	}
+
+	*instance_id = id;
+	return 0;
+
+err_ipc:
+	avs_dsp_put_core(adev, core_id);
+err_mod_entry:
+	avs_module_id_free(adev, module_id, id);
+	return ret;
+}
+
+void avs_dsp_delete_module(struct avs_dev *adev, u16 module_id, u16 instance_id,
+			   u8 ppl_instance_id, u8 core_id)
+{
+	/* Modules not owned by any pipeline need to be freed explicitly. */
+	if (ppl_instance_id == INVALID_PIPELINE_ID)
+		avs_ipc_delete_instance(adev, module_id, instance_id);
+
+	avs_module_id_free(adev, module_id, instance_id);
+
+	avs_dsp_put_core(adev, core_id);
+}
+
+int avs_dsp_create_pipeline(struct avs_dev *adev, u16 req_size, u8 priority,
+			    bool lp, u16 attributes, u8 *instance_id)
+{
+	struct avs_fw_cfg *fw_cfg = &adev->fw_cfg;
+	int ret, id;
+
+	id = ida_alloc_max(&adev->ppl_ida, fw_cfg->max_ppl_count - 1, GFP_KERNEL);
+	if (id < 0)
+		return id;
+
+	ret = avs_ipc_create_pipeline(adev, req_size, priority, id, lp,
+				      attributes);
+	if (ret) {
+		ida_free(&adev->ppl_ida, id);
+		return AVS_IPC_RET(ret);
+	}
+
+	*instance_id = id;
+	return 0;
+}
+
+int avs_dsp_delete_pipeline(struct avs_dev *adev, u8 instance_id)
+{
+	int ret;
+
+	ret = avs_ipc_delete_pipeline(adev, instance_id);
+	if (ret)
+		ret = AVS_IPC_RET(ret);
+
+	ida_free(&adev->ppl_ida, instance_id);
+	return ret;
+}
+
 MODULE_LICENSE("GPL");
-- 
2.25.1

