Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EB346D208
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:20:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2598F2645;
	Wed,  8 Dec 2021 12:20:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2598F2645
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962450;
	bh=D+XbbJiJOBwCqYuEG9Ce29Oq4xMoUinbsxOph99+cLs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JaTvneGzRT05P494LHRXAXrn+KLU4nsqXDB/Ll6Yp6awTUDSIvnbSqZXXVOtCAfR1
	 JAjSFd2GHuDXdfJwTwpSi+wHRrlCg6O52vLAfCqdSry30YOyfISMJt6+YnR79uJ+LQ
	 1KAoeZe2R6CloaTPCywJyN/962v+wnZGDNaloFY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCDAEF805EC;
	Wed,  8 Dec 2021 12:12:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EA8EF805EB; Wed,  8 Dec 2021 12:12:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D632F804CC
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:12:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D632F804CC
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236548441"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="236548441"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:12:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600396"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:12:12 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 24/37] ASoC: Intel: avs: Code loading over HDA
Date: Wed,  8 Dec 2021 12:12:48 +0100
Message-Id: <20211208111301.1817725-25-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208111301.1817725-1-cezary.rojewski@intel.com>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 peter.ujfalusi@linux.intel.com, lma@semihalf.com
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
 sound/soc/intel/avs/loader.c | 206 +++++++++++++++++++++++++++++++++++
 3 files changed, 212 insertions(+)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index d549ce83a9c4..b01c492d3514 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -218,6 +218,7 @@ config SND_SOC_INTEL_AVS
 	select SND_SOC_ACPI
 	select SND_SOC_TOPOLOGY
 	select SND_HDA_EXT_CORE
+	select SND_HDA_DSP_LOADER
 	select SND_INTEL_NHLT
 	help
 	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 678c056f81b1..978d922c07be 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -39,6 +39,7 @@ struct avs_dsp_ops {
 	((adev)->spec->dops->op(adev, ## __VA_ARGS__))
 
 #define AVS_PLATATTR_CLDMA		BIT_ULL(0)
+#define AVS_PLATATTR_IMR		BIT_ULL(1)
 
 #define avs_platattr_test(adev, attr) \
 	((adev)->spec->attributes & AVS_PLATATTR_##attr)
@@ -234,6 +235,10 @@ int avs_cldma_load_basefw(struct avs_dev *adev, struct firmware *fw);
 int avs_cldma_load_library(struct avs_dev *adev, struct firmware *lib, u32 id);
 int avs_cldma_transfer_modules(struct avs_dev *adev, bool load,
 			       struct avs_module_entry *mods, u32 num_mods);
+int avs_hda_load_basefw(struct avs_dev *adev, struct firmware *fw);
+int avs_hda_load_library(struct avs_dev *adev, struct firmware *lib, u32 id);
+int avs_hda_transfer_modules(struct avs_dev *adev, bool load,
+			     struct avs_module_entry *mods, u32 num_mods);
 
 /* Soc component members */
 
diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 57370d26b461..bc03dc766da1 100644
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
@@ -19,8 +20,10 @@
 #define AVS_ROM_STS_MASK		0xFF
 #define AVS_ROM_INIT_DONE		0x1
 #define SKL_ROM_BASEFW_ENTERED		0xF
+#define APL_ROM_FW_ENTERED		0x5
 #define AVS_ROM_INIT_POLLING_US		5
 #define AVS_ROM_INIT_TIMEOUT_US		300000
+#define AVS_ROM_INIT_RETRIES		3
 
 #define AVS_FW_INIT_POLLING_US		500
 #define AVS_FW_INIT_TIMEOUT_US		3000000
@@ -257,6 +260,200 @@ int avs_cldma_transfer_modules(struct avs_dev *adev, bool load,
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
+	snd_hdac_ext_stream_set_spib(bus, estream, fw->size);
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
 int avs_dsp_load_libraries(struct avs_dev *adev, struct avs_tplg_library *libs,
 			   u32 num_libs)
 {
@@ -370,6 +567,15 @@ int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge)
 	struct avs_soc_component *acomp;
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

