Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 830934ABE8D
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 13:25:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E4561756;
	Mon,  7 Feb 2022 13:24:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E4561756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644236721;
	bh=4R081pKOwBbT5n4KVAUuZ17BQVJ0Vv/pP9SPLrqz934=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qgakLYmcTaEV75jlJKlyh5a0xxudRAJ0/iFfa9wbp1Lxt+TkvvPtia3piBUTCRSjH
	 nYZKTgzeO7wcn82XJwPJbvff5ywn4tAsHqxYF6HVy//zS4JRnB67uAUkvikjjpuNp0
	 2pRkDtRbxb4CqzQ3Sr4ZVPN91v5Qmgys9UH4PVsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C77EF805BF;
	Mon,  7 Feb 2022 13:19:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FEDCF80564; Mon,  7 Feb 2022 13:19:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77CB5F80544
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 13:19:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77CB5F80544
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dL7+d0+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644236389; x=1675772389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4R081pKOwBbT5n4KVAUuZ17BQVJ0Vv/pP9SPLrqz934=;
 b=dL7+d0+awN8yporxRshqjvs0OjsQnksn0dTayKF80ywQex0exYyBVFw/
 yK8cBOz+0q/W/Azdl/IDel6YJWLaKdPKHJ4YQUg3bpuFhSTAw7api8NSf
 UfoHriwP9Kidqp2WHp+ucab+wuwBvfEMnSk4JZtAzIKD7GIJPa6vP5HQ5
 OZGmcQagrUhfOboEq0YzR4x+2fT1jIyUR7FFk6tfoupzkYM2QpqU8ZDUL
 q2KVe5pA+ql3g/c3Dcg8cDqaJR6vnmpj7komeLr9MwbE28xAXcws/JRfy
 spkQoVG1N4aqknKPVtVZc0a6pxB0AG9pMI35TrbjeuRaOjXS42n34WRY7 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="248914915"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="248914915"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 04:19:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="525112674"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 07 Feb 2022 04:19:44 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 17/17] ASoC: Intel: avs: Code loading over HDA
Date: Mon,  7 Feb 2022 13:21:08 +0100
Message-Id: <20220207122108.3780926-18-cezary.rojewski@intel.com>
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

Compared to SKL and KBL, younger cAVS platforms are meant to re-use one
of HDAudio streams during boot procedure causing CLDMA to become
obsolete. Once transferred, given stream is returned to pool available
for audio streaming.

Module loading handler is dummy as library and module code became
inseparable in later firmware generations.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig      |   1 +
 sound/soc/intel/avs/avs.h    |   5 +
 sound/soc/intel/avs/loader.c | 208 +++++++++++++++++++++++++++++++++++
 3 files changed, 214 insertions(+)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 5b4941d88101..96aa702d831d 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -217,6 +217,7 @@ config SND_SOC_INTEL_AVS
 	default n
 	select SND_SOC_ACPI
 	select SND_HDA_EXT_CORE
+	select SND_HDA_DSP_LOADER
 	help
 	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
 	  capabilities. This includes Skylake, Kabylake, Amberlake and
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 657b2894e770..20987c7744a3 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -35,6 +35,7 @@ struct avs_dsp_ops {
 	((adev)->spec->dops->op(adev, ## __VA_ARGS__))
 
 #define AVS_PLATATTR_CLDMA		BIT_ULL(0)
+#define AVS_PLATATTR_IMR		BIT_ULL(1)
 
 #define avs_platattr_test(adev, attr) \
 	((adev)->spec->attributes & AVS_PLATATTR_##attr)
@@ -217,5 +218,9 @@ int avs_cldma_load_basefw(struct avs_dev *adev, struct firmware *fw);
 int avs_cldma_load_library(struct avs_dev *adev, struct firmware *lib, u32 id);
 int avs_cldma_transfer_modules(struct avs_dev *adev, bool load,
 			       struct avs_module_entry *mods, u32 num_mods);
+int avs_hda_load_basefw(struct avs_dev *adev, struct firmware *fw);
+int avs_hda_load_library(struct avs_dev *adev, struct firmware *lib, u32 id);
+int avs_hda_transfer_modules(struct avs_dev *adev, bool load,
+			     struct avs_module_entry *mods, u32 num_mods);
 
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 1a33b5293c53..52c53735dc71 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -9,6 +9,7 @@
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <sound/hdaudio.h>
 #include <sound/hdaudio_ext.h>
 #include "avs.h"
 #include "cldma.h"
@@ -18,8 +19,10 @@
 #define AVS_ROM_STS_MASK		0xFF
 #define AVS_ROM_INIT_DONE		0x1
 #define SKL_ROM_BASEFW_ENTERED		0xF
+#define APL_ROM_FW_ENTERED		0x5
 #define AVS_ROM_INIT_POLLING_US		5
 #define AVS_ROM_INIT_TIMEOUT_US		300000
+#define AVS_ROM_INIT_RETRIES		3
 
 #define AVS_FW_INIT_POLLING_US		500
 #define AVS_FW_INIT_TIMEOUT_US		3000000
@@ -256,6 +259,202 @@ int avs_cldma_transfer_modules(struct avs_dev *adev, bool load,
 	return 0;
 }
 
+static int
+avs_hda_init_rom(struct avs_dev *adev, unsigned int dma_id, bool purge)
+{
+	const struct avs_spec *const spec = adev->spec;
+	unsigned int corex_mask, reg;
+	int ret;
+
+	corex_mask = spec->core_init_mask & ~AVS_MAIN_CORE_MASK;
+
+	ret = avs_dsp_op(adev, power, spec->core_init_mask, true);
+	if (ret < 0)
+		goto err;
+
+	ret = avs_dsp_op(adev, reset, AVS_MAIN_CORE_MASK, false);
+	if (ret < 0)
+		goto err;
+
+	reinit_completion(&adev->fw_ready);
+	avs_dsp_op(adev, int_control, true);
+
+	/* set boot config */
+	ret = avs_ipc_set_boot_config(adev, dma_id, purge);
+	if (ret) {
+		ret = AVS_IPC_RET(ret);
+		goto err;
+	}
+
+	/* await ROM init */
+	ret = snd_hdac_adsp_readq_poll(adev, spec->rom_status, reg,
+				       (reg & 0xF) == AVS_ROM_INIT_DONE ||
+				       (reg & 0xF) == APL_ROM_FW_ENTERED,
+				       AVS_ROM_INIT_POLLING_US, AVS_ROM_INIT_TIMEOUT_US);
+	if (ret < 0) {
+		dev_err(adev->dev, "rom init timeout: %d\n", ret);
+		goto err;
+	}
+
+	/* power down non-main cores */
+	if (corex_mask)
+		avs_dsp_op(adev, power, corex_mask, false);
+
+	return 0;
+
+err:
+	avs_dsp_core_disable(adev, spec->core_init_mask);
+	return ret;
+}
+
+static int avs_imr_load_basefw(struct avs_dev *adev)
+{
+	int ret;
+
+	/* DMA id ignored when flashing from IMR as no transfer occurs. */
+	ret = avs_hda_init_rom(adev, 0, false);
+	if (ret < 0) {
+		dev_err(adev->dev, "rom init failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = wait_for_completion_timeout(&adev->fw_ready,
+				msecs_to_jiffies(AVS_FW_INIT_TIMEOUT_MS));
+	if (!ret) {
+		dev_err(adev->dev, "firmware ready timeout\n");
+		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+int avs_hda_load_basefw(struct avs_dev *adev, struct firmware *fw)
+{
+	struct snd_pcm_substream substream = {0};
+	struct snd_dma_buffer dmab;
+	struct hdac_ext_stream *estream;
+	struct hdac_stream *hstream;
+	struct hdac_bus *bus = &adev->base.core;
+	unsigned int sdfmt, reg;
+	int ret, i;
+
+	/* configure hda dma */
+	substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
+	estream = snd_hdac_ext_stream_assign(bus, &substream,
+					     HDAC_EXT_STREAM_TYPE_HOST);
+	if (!estream)
+		return -ENODEV;
+	hstream = hdac_stream(estream);
+
+	/* code loading performed with default format */
+	sdfmt = snd_hdac_calc_stream_format(48000, 1, SNDRV_PCM_FORMAT_S32_LE, 32, 0);
+	ret = snd_hdac_dsp_prepare(hstream, sdfmt, fw->size, &dmab);
+	if (ret < 0)
+		goto release_stream;
+
+	/* enable SPIB for hda stream */
+	snd_hdac_ext_stream_spbcap_enable(bus, true, hstream->index);
+	ret = snd_hdac_ext_stream_set_spib(bus, estream, fw->size);
+	if (ret)
+		goto cleanup_resources;
+
+	memcpy(dmab.area, fw->data, fw->size);
+
+	for (i = 0; i < AVS_ROM_INIT_RETRIES; i++) {
+		unsigned int dma_id = hstream->stream_tag - 1;
+
+		ret = avs_hda_init_rom(adev, dma_id, true);
+		if (!ret)
+			break;
+		dev_info(adev->dev, "#%d rom init fail: %d\n", i + 1, ret);
+	}
+	if (ret < 0)
+		goto cleanup_resources;
+
+	/* transfer firmware */
+	snd_hdac_dsp_trigger(hstream, true);
+	ret = snd_hdac_adsp_readl_poll(adev, AVS_FW_REG_STATUS(adev), reg,
+				       (reg & AVS_ROM_STS_MASK) == APL_ROM_FW_ENTERED,
+				       AVS_FW_INIT_POLLING_US, AVS_FW_INIT_TIMEOUT_US);
+	snd_hdac_dsp_trigger(hstream, false);
+	if (ret < 0) {
+		dev_err(adev->dev, "transfer fw failed: %d\n", ret);
+		avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
+	}
+
+cleanup_resources:
+	/* disable SPIB for hda stream */
+	snd_hdac_ext_stream_spbcap_enable(bus, false, hstream->index);
+	snd_hdac_ext_stream_set_spib(bus, estream, 0);
+
+	snd_hdac_dsp_cleanup(hstream, &dmab);
+release_stream:
+	snd_hdac_ext_stream_release(estream, HDAC_EXT_STREAM_TYPE_HOST);
+
+	return ret;
+}
+
+int avs_hda_load_library(struct avs_dev *adev, struct firmware *lib, u32 id)
+{
+	struct snd_pcm_substream substream = {0};
+	struct snd_dma_buffer dmab;
+	struct hdac_ext_stream *estream;
+	struct hdac_stream *stream;
+	struct hdac_bus *bus = &adev->base.core;
+	unsigned int sdfmt;
+	int ret;
+
+	/* configure hda dma */
+	substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
+	estream = snd_hdac_ext_stream_assign(bus, &substream,
+					     HDAC_EXT_STREAM_TYPE_HOST);
+	if (!estream)
+		return -ENODEV;
+	stream = hdac_stream(estream);
+
+	/* code loading performed with default format */
+	sdfmt = snd_hdac_calc_stream_format(48000, 1, SNDRV_PCM_FORMAT_S32_LE, 32, 0);
+	ret = snd_hdac_dsp_prepare(stream, sdfmt, lib->size, &dmab);
+	if (ret < 0)
+		goto release_stream;
+
+	/* enable SPIB for hda stream */
+	snd_hdac_ext_stream_spbcap_enable(bus, true, stream->index);
+	snd_hdac_ext_stream_set_spib(bus, estream, lib->size);
+
+	memcpy(dmab.area, lib->data, lib->size);
+
+	/* transfer firmware */
+	snd_hdac_dsp_trigger(stream, true);
+	ret = avs_ipc_load_library(adev, stream->stream_tag - 1, id);
+	snd_hdac_dsp_trigger(stream, false);
+	if (ret) {
+		dev_err(adev->dev, "transfer lib %d failed: %d\n", id, ret);
+		ret = AVS_IPC_RET(ret);
+	}
+
+	/* disable SPIB for hda stream */
+	snd_hdac_ext_stream_spbcap_enable(bus, false, stream->index);
+	snd_hdac_ext_stream_set_spib(bus, estream, 0);
+
+	snd_hdac_dsp_cleanup(stream, &dmab);
+release_stream:
+	snd_hdac_ext_stream_release(estream, HDAC_EXT_STREAM_TYPE_HOST);
+
+	return ret;
+}
+
+int avs_hda_transfer_modules(struct avs_dev *adev, bool load,
+			     struct avs_module_entry *mods, u32 num_mods)
+{
+	/*
+	 * All platforms without CLDMA are equipped with IMR,
+	 * and thus the module transferring is offloaded to DSP.
+	 */
+	return 0;
+}
+
 static int avs_dsp_load_basefw(struct avs_dev *adev)
 {
 	const struct avs_fw_version *min_req;
@@ -307,6 +506,15 @@ int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge)
 {
 	int ret, i;
 
+	/* Forgo full boot if flash from IMR succeeds. */
+	if (!purge && avs_platattr_test(adev, IMR)) {
+		ret = avs_imr_load_basefw(adev);
+		if (!ret)
+			return 0;
+
+		dev_dbg(adev->dev, "firmware flash from imr failed: %d\n", ret);
+	}
+
 	/* Full boot, clear cached data except for basefw (slot 0). */
 	for (i = 1; i < adev->fw_cfg.max_libs_count; i++)
 		memset(adev->lib_names[i], 0, AVS_LIB_NAME_SIZE);
-- 
2.25.1

