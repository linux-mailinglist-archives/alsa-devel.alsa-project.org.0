Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 969BF4CD706
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 16:01:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 367B71B49;
	Fri,  4 Mar 2022 16:01:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 367B71B49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646406114;
	bh=VERtGWR4BglR1XB/zKB85QMtWV9Xc3tyGN0prRPC6LE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=azhDPVJEtRIAXRKoR0YQ1vMwAaBGd7rJaGX9wkQckpXyh/zbZKvwmigYZIpfIvl6S
	 rBsr/n9ucTygqn5dEhLvXhVRmMdgXfyn8PIM+7OagGitnaF7+ICc1eoQsTCFCiWBcR
	 RuW+m8mXf77ZkWqQa/Kaf0r95QnXJucZv4W/maq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D60BF805BB;
	Fri,  4 Mar 2022 15:56:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEF40F805BA; Fri,  4 Mar 2022 15:56:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60548F805B1
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 15:56:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60548F805B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IJsyUM9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646405801; x=1677941801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VERtGWR4BglR1XB/zKB85QMtWV9Xc3tyGN0prRPC6LE=;
 b=IJsyUM9O8G1XnaZ72IdgN/BEfSo8A62VebD7sUCinY4t9hRbVyUwt9ur
 MWvTiy/rP4Cttb8LX7VSF6sEW+2AQxZe3WsLL/Uaq/kNzz/pSVkajam7b
 r8Js1/V4Z2wgKumFMGWVDD57jqxHusvRqiPE+NhwLVDJjLBE0PyRFQxCT
 PpDfOBGP/GV+xCOom/EVEoOcJpDwip+ysRc6QGwf7cmd9RH/PzZ/EAwJz
 fS6/2PydfFxQ6euhaJ/uUtHFSuGeLJSx1T9fAQypRv20qjDomWcTUHjpp
 Tl32TxsrKXJeLYc/WnrlQ9wIagyaFhL6UepRxFIPRXaTMArO6hcoeF6X5 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="233949252"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="233949252"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 06:56:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="609963559"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 04 Mar 2022 06:56:33 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 16/17] ASoC: Intel: avs: Code loading over CLDMA
Date: Fri,  4 Mar 2022 15:57:54 +0100
Message-Id: <20220304145755.2844173-17-cezary.rojewski@intel.com>
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

With CLDMA transfer implemented, make use of it to shape firmware,
library and module loading routines for SKL and KBL platforms.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h    |   7 ++
 sound/soc/intel/avs/loader.c | 159 +++++++++++++++++++++++++++++++++++
 2 files changed, 166 insertions(+)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 2527d6170417..fb3520f32488 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -44,6 +44,8 @@ struct avs_dsp_ops {
 #define avs_dsp_op(adev, op, ...) \
 	((adev)->spec->dsp_ops->op(adev, ## __VA_ARGS__))
 
+#define AVS_PLATATTR_CLDMA		BIT_ULL(0)
+
 #define avs_platattr_test(adev, attr) \
 	((adev)->spec->attributes & AVS_PLATATTR_##attr)
 
@@ -233,4 +235,9 @@ void avs_hda_l1sen_enable(struct avs_dev *adev, bool enable);
 int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge);
 int avs_dsp_first_boot_firmware(struct avs_dev *adev);
 
+int avs_cldma_load_basefw(struct avs_dev *adev, struct firmware *fw);
+int avs_cldma_load_library(struct avs_dev *adev, struct firmware *lib, u32 id);
+int avs_cldma_transfer_modules(struct avs_dev *adev, bool load,
+			       struct avs_module_entry *mods, u32 num_mods);
+
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 47e1f9a21e43..2134aaabe2c6 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -9,12 +9,24 @@
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <sound/hdaudio_ext.h>
 #include "avs.h"
+#include "cldma.h"
 #include "messages.h"
 #include "registers.h"
 
+#define AVS_ROM_STS_MASK		0xFF
+#define AVS_ROM_INIT_DONE		0x1
+#define SKL_ROM_BASEFW_ENTERED		0xF
+#define AVS_ROM_INIT_POLLING_US		5
+#define SKL_ROM_INIT_TIMEOUT_US		1000000
+
+#define AVS_FW_INIT_POLLING_US		500
+#define AVS_FW_INIT_TIMEOUT_US		3000000
 #define AVS_FW_INIT_TIMEOUT_MS		3000
 
+#define AVS_CLDMA_START_DELAY_MS	100
+
 #define AVS_ROOT_DIR			"intel/avs"
 #define AVS_BASEFW_FILENAME		"dsp_basefw.bin"
 #define AVS_EXT_MANIFEST_MAGIC		0x31454124
@@ -111,6 +123,144 @@ static int avs_fw_manifest_strip_verify(struct avs_dev *adev, struct firmware *f
 	return 0;
 }
 
+int avs_cldma_load_basefw(struct avs_dev *adev, struct firmware *fw)
+{
+	struct hda_cldma *cl = &code_loader;
+	unsigned int reg;
+	int ret;
+
+	ret = avs_dsp_op(adev, power, AVS_MAIN_CORE_MASK, true);
+	if (ret < 0)
+		return ret;
+
+	ret = avs_dsp_op(adev, reset, AVS_MAIN_CORE_MASK, false);
+	if (ret < 0)
+		return ret;
+
+	ret = hda_cldma_reset(cl);
+	if (ret < 0) {
+		dev_err(adev->dev, "cldma reset failed: %d\n", ret);
+		return ret;
+	}
+	hda_cldma_setup(cl);
+
+	ret = avs_dsp_op(adev, stall, AVS_MAIN_CORE_MASK, false);
+	if (ret < 0)
+		return ret;
+
+	reinit_completion(&adev->fw_ready);
+	avs_dsp_op(adev, int_control, true);
+
+	/* await ROM init */
+	ret = snd_hdac_adsp_readl_poll(adev, AVS_FW_REG_STATUS(adev), reg,
+			(reg & AVS_ROM_INIT_DONE) == AVS_ROM_INIT_DONE,
+			AVS_ROM_INIT_POLLING_US, SKL_ROM_INIT_TIMEOUT_US);
+	if (ret < 0) {
+		dev_err(adev->dev, "rom init timeout: %d\n", ret);
+		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
+		return ret;
+	}
+
+	hda_cldma_set_data(cl, (void *)fw->data, fw->size);
+	/* transfer firmware */
+	hda_cldma_transfer(cl, 0);
+	ret = snd_hdac_adsp_readl_poll(adev, AVS_FW_REG_STATUS(adev), reg,
+			(reg & AVS_ROM_STS_MASK) == SKL_ROM_BASEFW_ENTERED,
+			AVS_FW_INIT_POLLING_US, AVS_FW_INIT_TIMEOUT_US);
+	hda_cldma_stop(cl);
+	if (ret < 0) {
+		dev_err(adev->dev, "transfer fw failed: %d\n", ret);
+		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
+		return ret;
+	}
+
+	return 0;
+}
+
+int avs_cldma_load_library(struct avs_dev *adev, struct firmware *lib, u32 id)
+{
+	struct hda_cldma *cl = &code_loader;
+	int ret;
+
+	hda_cldma_set_data(cl, (void *)lib->data, lib->size);
+	/* transfer modules manifest */
+	hda_cldma_transfer(cl, msecs_to_jiffies(AVS_CLDMA_START_DELAY_MS));
+
+	/* DMA id ignored as there is only ever one code-loader DMA */
+	ret = avs_ipc_load_library(adev, 0, id);
+	hda_cldma_stop(cl);
+
+	if (ret) {
+		ret = AVS_IPC_RET(ret);
+		dev_err(adev->dev, "transfer lib %d failed: %d\n", id, ret);
+	}
+
+	return ret;
+}
+
+static int avs_cldma_load_module(struct avs_dev *adev, struct avs_module_entry *mentry)
+{
+	struct hda_cldma *cl = &code_loader;
+	const struct firmware *mod;
+	char *mod_name;
+	int ret;
+
+	mod_name = kasprintf(GFP_KERNEL, "%s/%s/dsp_mod_%pUL.bin", AVS_ROOT_DIR,
+			     adev->spec->name, mentry->uuid.b);
+	if (!mod_name)
+		return -ENOMEM;
+
+	ret = avs_request_firmware(adev, &mod, mod_name);
+	kfree(mod_name);
+	if (ret < 0)
+		return ret;
+
+	hda_cldma_set_data(cl, (void *)mod->data, mod->size);
+	hda_cldma_transfer(cl, msecs_to_jiffies(AVS_CLDMA_START_DELAY_MS));
+	ret = avs_ipc_load_modules(adev, &mentry->module_id, 1);
+	hda_cldma_stop(cl);
+
+	if (ret) {
+		dev_err(adev->dev, "load module %d failed: %d\n", mentry->module_id, ret);
+		avs_release_last_firmware(adev);
+		return AVS_IPC_RET(ret);
+	}
+
+	return 0;
+}
+
+int avs_cldma_transfer_modules(struct avs_dev *adev, bool load,
+			       struct avs_module_entry *mods, u32 num_mods)
+{
+	u16 *mod_ids;
+	int ret, i;
+
+	/* Either load to DSP or unload them to free space. */
+	if (load) {
+		for (i = 0; i < num_mods; i++) {
+			ret = avs_cldma_load_module(adev, &mods[i]);
+			if (ret)
+				return ret;
+		}
+
+		return 0;
+	}
+
+	mod_ids = kcalloc(num_mods, sizeof(u16), GFP_KERNEL);
+	if (!mod_ids)
+		return -ENOMEM;
+
+	for (i = 0; i < num_mods; i++)
+		mod_ids[i] = mods[i].module_id;
+
+	ret = avs_ipc_unload_modules(adev, mod_ids, num_mods);
+	kfree(mod_ids);
+	if (ret)
+		return AVS_IPC_RET(ret);
+
+	return 0;
+}
+
 static int avs_dsp_load_basefw(struct avs_dev *adev)
 {
 	const struct avs_fw_version *min_req;
@@ -196,6 +346,15 @@ int avs_dsp_first_boot_firmware(struct avs_dev *adev)
 {
 	int ret, i;
 
+	if (avs_platattr_test(adev, CLDMA)) {
+		ret = hda_cldma_init(&code_loader, &adev->base.core,
+				     adev->dsp_ba, AVS_CL_DEFAULT_BUFFER_SIZE);
+		if (ret < 0) {
+			dev_err(adev->dev, "cldma init failed: %d\n", ret);
+			return ret;
+		}
+	}
+
 	ret = avs_dsp_boot_firmware(adev, true);
 	if (ret < 0) {
 		dev_err(adev->dev, "firmware boot failed: %d\n", ret);
-- 
2.25.1

