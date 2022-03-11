Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 506E44D64B9
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 16:34:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7D4218F8;
	Fri, 11 Mar 2022 16:33:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7D4218F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647012847;
	bh=+tkB94QCAusSW1Dr9/RcypIoNbvvxAiGwtGtgK6xoNk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iu6qAAI9B0PqvlbQXt8uefvDHjaTRRSX13kDZ3o4n8N95/QUNXlg4v7feUF2JU8cZ
	 qRv2NllB8T7cSxE9pw3F6toDa/WEHg2yHmMJ2rH3X/dYjkT6kLwkoe5sR5d2sdpz6x
	 z5tL7PfHYHmksy2BFOQq9P/ZTkBKy+NBAvsSBGLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75B1DF80507;
	Fri, 11 Mar 2022 16:28:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 397FEF805C1; Fri, 11 Mar 2022 16:28:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10D8CF805BD
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 16:28:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10D8CF805BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MRJSJkty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647012518; x=1678548518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+tkB94QCAusSW1Dr9/RcypIoNbvvxAiGwtGtgK6xoNk=;
 b=MRJSJktyS3NFelSdfBv0ie7t/oWGZdnzZtedtNdpGlBaIk+nBhbNJ2oU
 o2hgf4N9sbPG3IK5hNrLl3saUPMmxXWEI5nNz/zJiojjfaGxA5ot1LVxp
 aariZX35ANqd0jfCtbelYhy3KAFuVQhikKqP+EVjNZxmOntVZG+IyTe5U
 0ydtePcpqdptUaqrtC0hV/dYsWIRWigkXYgK63GD5xf4DcohXIl5fva3t
 Zq5sAJI1MNWaXiO/xWfc+POZep216P7oYZEsAZnjy7Tf0vaXFhuxo5HMy
 Lx8BSy1YA6y3+3h2Ocyw0ZHRFkAyoMid3ZoPVZRwxQJ5uJThYYZPGGVnj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="318813452"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="318813452"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 07:28:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="514533000"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 11 Mar 2022 07:28:32 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 17/17] ASoC: Intel: avs: Code loading over HDA
Date: Fri, 11 Mar 2022 16:35:44 +0100
Message-Id: <20220311153544.136854-18-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311153544.136854-1-cezary.rojewski@intel.com>
References: <20220311153544.136854-1-cezary.rojewski@intel.com>
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

Compared to SKL and KBL, more recent cAVS platforms are meant to re-use
one of HDAudio streams during boot procedure causing CLDMA to become
obsolete. Once transferred, given stream is returned to pool available
for audio streaming.

Module loading handler is stub as library and module code became
inseparable in later firmware generations.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig      |   1 +
 sound/soc/intel/avs/avs.h    |   5 +
 sound/soc/intel/avs/loader.c | 214 +++++++++++++++++++++++++++++++++++
 3 files changed, 220 insertions(+)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index e9768c4aa1a9..d025ca0c77fa 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -215,6 +215,7 @@ config SND_SOC_INTEL_AVS
 	depends on COMMON_CLK
 	select SND_SOC_ACPI
 	select SND_HDA_EXT_CORE
+	select SND_HDA_DSP_LOADER
 	help
 	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
 	  capabilities. This includes Skylake, Kabylake, Amberlake and
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 9d1a3f1c7d74..b48a342fd184 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -44,6 +44,7 @@ struct avs_dsp_ops {
 	((adev)->spec->dsp_ops->op(adev, ## __VA_ARGS__))
 
 #define AVS_PLATATTR_CLDMA		BIT_ULL(0)
+#define AVS_PLATATTR_IMR		BIT_ULL(1)
 
 #define avs_platattr_test(adev, attr) \
 	((adev)->spec->attributes & AVS_PLATATTR_##attr)
@@ -238,5 +239,9 @@ int avs_cldma_load_basefw(struct avs_dev *adev, struct firmware *fw);
 int avs_cldma_load_library(struct avs_dev *adev, struct firmware *lib, u32 id);
 int avs_cldma_transfer_modules(struct avs_dev *adev, bool load,
 			       struct avs_module_entry *mods, u32 num_mods);
+int avs_hda_load_basefw(struct avs_dev *adev, struct firmware *fw);
+int avs_hda_load_library(struct avs_dev *adev, struct firmware *lib, u32 id);
+int avs_hda_transfer_modules(struct avs_dev *adev, bool load,
+			     struct avs_module_entry *mods, u32 num_mods);
 
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 2393fc5b2ba2..c47f85161d95 100644
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
@@ -18,8 +19,11 @@
 #define AVS_ROM_STS_MASK		0xFF
 #define AVS_ROM_INIT_DONE		0x1
 #define SKL_ROM_BASEFW_ENTERED		0xF
+#define APL_ROM_FW_ENTERED		0x5
 #define AVS_ROM_INIT_POLLING_US		5
 #define SKL_ROM_INIT_TIMEOUT_US		1000000
+#define APL_ROM_INIT_TIMEOUT_US		300000
+#define APL_ROM_INIT_RETRIES		3
 
 #define AVS_FW_INIT_POLLING_US		500
 #define AVS_FW_INIT_TIMEOUT_US		3000000
@@ -261,6 +265,207 @@ int avs_cldma_transfer_modules(struct avs_dev *adev, bool load,
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
+				       AVS_ROM_INIT_POLLING_US, APL_ROM_INIT_TIMEOUT_US);
+	if (ret < 0) {
+		dev_err(adev->dev, "rom init timeout: %d\n", ret);
+		goto err;
+	}
+
+	/* power down non-main cores */
+	if (corex_mask) {
+		ret = avs_dsp_op(adev, power, corex_mask, false);
+		if (ret < 0)
+			goto err;
+	}
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
+					  msecs_to_jiffies(AVS_FW_INIT_TIMEOUT_MS));
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
+	struct snd_pcm_substream substream;
+	struct snd_dma_buffer dmab;
+	struct hdac_ext_stream *estream;
+	struct hdac_stream *hstream;
+	struct hdac_bus *bus = &adev->base.core;
+	unsigned int sdfmt, reg;
+	int ret, i;
+
+	/* configure hda dma */
+	memset(&substream, 0, sizeof(substream));
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
+	for (i = 0; i < APL_ROM_INIT_RETRIES; i++) {
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
+	struct snd_pcm_substream substream;
+	struct snd_dma_buffer dmab;
+	struct hdac_ext_stream *estream;
+	struct hdac_stream *stream;
+	struct hdac_bus *bus = &adev->base.core;
+	unsigned int sdfmt;
+	int ret;
+
+	/* configure hda dma */
+	memset(&substream, 0, sizeof(substream));
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
@@ -316,6 +521,15 @@ int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge)
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

