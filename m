Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FB54ABE8A
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 13:24:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E454E172A;
	Mon,  7 Feb 2022 13:23:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E454E172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644236659;
	bh=jh1d/bF9eMF8aofAK10VaaTTaO4wBXIKefXvvrwX+1k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L6TEPWXhNmhjno80EW4S3n5RZuHhR/vYqiVgpjzwX2FnTy6hReeMA/2xlGYNjozeg
	 vzG3DQjNm6iOW8odv6p5K1RTLUoS9HnXIBVb1r+3lSYQ7d6EMb5ruHYd5eufrF8QMY
	 8i5grbepL6b693W3HIbly+LvOoWzj6gfhK7PL3UE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F847F8057A;
	Mon,  7 Feb 2022 13:19:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D36CF80552; Mon,  7 Feb 2022 13:19:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 838BFF8051C
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 13:19:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 838BFF8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ajxGmHrj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644236378; x=1675772378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jh1d/bF9eMF8aofAK10VaaTTaO4wBXIKefXvvrwX+1k=;
 b=ajxGmHrjhuyhv3WJvO/2i/zp6dyGCZ1ukBGWUrsk+SMibFz6q6KL88gO
 l7R7lDe/Y9IS4pcgW0Gv9KEReypYOtBa0HccajIoklzgwsaGRQt42Iup4
 WUev+nyAdZ7GQImktSMCkXrSpb8MfIzkVIwwwkytVAstbTu7khGjNKcPx
 tZBqKmbEMTqgtXY7KcHnXSTVVcDJlv8NMefDv2u3dhKKdVoxEKp4QKkI5
 gOZCTK+y8G4P5VoGf6XdNPg0Ka/iqZpszQK8JhGzff0YJVsI6TXAQlAxR
 eemI6mJ0zkuuxLIn44OuajG+3D7uz8MkZwN8B9e6e3FJ2iiSDWpiTbXEK Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="248914874"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="248914874"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 04:19:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="525112624"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 07 Feb 2022 04:19:31 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/17] ASoC: Intel: avs: Dynamic firmware resources management
Date: Mon,  7 Feb 2022 13:21:04 +0100
Message-Id: <20220207122108.3780926-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207122108.3780926-1-cezary.rojewski@intel.com>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
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
index d12b19a7299b..8779fe9fd8c3 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -74,6 +74,7 @@ struct avs_dev {
 	struct mutex modres_mutex;
 	struct ida ppl_ida;
 	struct list_head fw_list;
+	int *core_refs;
 
 	struct completion fw_ready;
 };
@@ -183,4 +184,13 @@ void avs_module_id_free(struct avs_dev *adev, u16 module_id, u8 instance_id);
 int avs_request_firmware(struct avs_dev *adev, const struct firmware **fw_p, const char *name);
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
index 258544277bbb..c0291516809d 100644
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
+	dev_err(adev->dev, "get core failed: %d\n", ret);
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
+	dev_err(adev->dev, "put core failed: %d\n", ret);
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
 MODULE_LICENSE("GPL v2");
-- 
2.25.1

