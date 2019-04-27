Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B212B428
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:00:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B5D71623;
	Sat, 27 Apr 2019 19:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B5D71623
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556388042;
	bh=fRdhg8AocOSfpphR4qdsrKHDObUuMgCn8/YIHMeXxcw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=IQ98TI4EvvsaI1tWQFOnMlOcZ2SDQo43d0H1GsdgdJDomOBhmTcMOUrg0zacSRU2R
	 wNiSe7Lo+QBm2/C+AldGPQTC/IQr41VOl3iMK8toTageZzLr36JYGxGW6SZ0xVazgx
	 o/xMXR/RD8oq/GZNLm6A9wxUWk0b55ksAkGCrcQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 379ADF8973F;
	Sat, 27 Apr 2019 19:54:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2929AF89743; Sat, 27 Apr 2019 19:53:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41E12F89710;
 Sat, 27 Apr 2019 19:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41E12F89710
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="vj97xRLQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=dX98yWWtpxveCHwmV5Hs0cV6Nv5snrVoenYV3G75KBY=; b=vj97xRLQx2EP
 WqN9cFHzm6XW9snJ0ByROHtklMT2+POvhEdLUWGwdhPlsMVgMuul2v7k2RXvm7KWXBh4gpNdLxBye
 pK//aus9kVzMsdwKUz5M9aWMtBAdvZeHIhksNLJ/xJSlJzUrkulPSMJkZJ9agmpsQMoOYcSPMuWMT
 pr1Xw=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVI-0004oJ-5h; Sat, 27 Apr 2019 17:52:48 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 3485B441D3E; Sat, 27 Apr 2019 18:52:45 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160904.30418-9-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175245.3485B441D3E@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:52:45 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, Keyon Jie <yang.jie@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: Add Intel specific HDA
	firmware loader" to the asoc tree
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

The patch

   ASoC: SOF: Intel: Add Intel specific HDA firmware loader

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From d16046ffa6de040bf580a64d5f4d0aa18258a854 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:08:51 -0500
Subject: [PATCH] ASoC: SOF: Intel: Add Intel specific HDA firmware loader

Add support for loading DSP firmware on Intel HDA based platforms.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-loader.c | 371 +++++++++++++++++++++++++++++++
 1 file changed, 371 insertions(+)
 create mode 100644 sound/soc/sof/intel/hda-loader.c

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
new file mode 100644
index 000000000000..6a44bc349e44
--- /dev/null
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -0,0 +1,371 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018 Intel Corporation. All rights reserved.
+//
+// Authors: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+//	    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
+//	    Rander Wang <rander.wang@intel.com>
+//          Keyon Jie <yang.jie@linux.intel.com>
+//
+
+/*
+ * Hardware interface for HDA DSP code loader
+ */
+
+#include <linux/firmware.h>
+#include <sound/hdaudio_ext.h>
+#include <sound/sof.h>
+#include "../ops.h"
+#include "hda.h"
+
+#define HDA_FW_BOOT_ATTEMPTS	3
+
+static int cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
+			     unsigned int size, struct snd_dma_buffer *dmab,
+			     int direction)
+{
+	struct hdac_ext_stream *dsp_stream;
+	struct hdac_stream *hstream;
+	struct pci_dev *pci = to_pci_dev(sdev->dev);
+	int ret;
+
+	if (direction != SNDRV_PCM_STREAM_PLAYBACK) {
+		dev_err(sdev->dev, "error: code loading DMA is playback only\n");
+		return -EINVAL;
+	}
+
+	dsp_stream = hda_dsp_stream_get(sdev, direction);
+
+	if (!dsp_stream) {
+		dev_err(sdev->dev, "error: no stream available\n");
+		return -ENODEV;
+	}
+	hstream = &dsp_stream->hstream;
+
+	/* allocate DMA buffer */
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_SG, &pci->dev, size, dmab);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: memory alloc failed: %x\n", ret);
+		goto error;
+	}
+
+	hstream->period_bytes = 0;/* initialize period_bytes */
+	hstream->format_val = format;
+	hstream->bufsize = size;
+
+	ret = hda_dsp_stream_hw_params(sdev, dsp_stream, dmab, NULL);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: hdac prepare failed: %x\n", ret);
+		goto error;
+	}
+
+	hda_dsp_stream_spib_config(sdev, dsp_stream, HDA_DSP_SPIB_ENABLE, size);
+
+	return hstream->stream_tag;
+
+error:
+	hda_dsp_stream_put(sdev, direction, hstream->stream_tag);
+	snd_dma_free_pages(dmab);
+	return ret;
+}
+
+/*
+ * first boot sequence has some extra steps. core 0 waits for power
+ * status on core 1, so power up core 1 also momentarily, keep it in
+ * reset/stall and then turn it off
+ */
+static int cl_dsp_init(struct snd_sof_dev *sdev, const void *fwdata,
+		       u32 fwsize, int stream_tag)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
+	unsigned int status;
+	int ret;
+
+	/* step 1: power up corex */
+	ret = hda_dsp_core_power_up(sdev, chip->cores_mask);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: dsp core 0/1 power up failed\n");
+		goto err;
+	}
+
+	/* step 2: purge FW request */
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR, chip->ipc_req,
+			  chip->ipc_req_mask | (HDA_DSP_IPC_PURGE_FW |
+			  ((stream_tag - 1) << 9)));
+
+	/* step 3: unset core 0 reset state & unstall/run core 0 */
+	ret = hda_dsp_core_run(sdev, HDA_DSP_CORE_MASK(0));
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: dsp core start failed %d\n", ret);
+		ret = -EIO;
+		goto err;
+	}
+
+	/* step 4: wait for IPC DONE bit from ROM */
+	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
+					    chip->ipc_ack, status,
+					    ((status & chip->ipc_ack_mask)
+						    == chip->ipc_ack_mask),
+					    HDA_DSP_REG_POLL_INTERVAL_US,
+					    HDA_DSP_INIT_TIMEOUT_US);
+
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: waiting for HIPCIE done\n");
+		goto err;
+	}
+
+	/* step 5: power down corex */
+	ret = hda_dsp_core_power_down(sdev,
+				  chip->cores_mask & ~(HDA_DSP_CORE_MASK(0)));
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: dsp core x power down failed\n");
+		goto err;
+	}
+
+	/* step 6: enable IPC interrupts */
+	hda_dsp_ipc_int_enable(sdev);
+
+	/* step 7: wait for ROM init */
+	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
+					HDA_DSP_SRAM_REG_ROM_STATUS, status,
+					((status & HDA_DSP_ROM_STS_MASK)
+						== HDA_DSP_ROM_INIT),
+					HDA_DSP_REG_POLL_INTERVAL_US,
+					chip->rom_init_timeout *
+					USEC_PER_MSEC);
+	if (!ret)
+		return 0;
+
+err:
+	hda_dsp_dump(sdev, SOF_DBG_REGS | SOF_DBG_PCI | SOF_DBG_MBOX);
+	hda_dsp_core_reset_power_down(sdev, chip->cores_mask);
+
+	return ret;
+}
+
+static int cl_trigger(struct snd_sof_dev *sdev,
+		      struct hdac_ext_stream *stream, int cmd)
+{
+	struct hdac_stream *hstream = &stream->hstream;
+	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
+
+	/* code loader is special case that reuses stream ops */
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		wait_event_timeout(sdev->waitq, !sdev->code_loading,
+				   HDA_DSP_CL_TRIGGER_TIMEOUT);
+
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL,
+					1 << hstream->index,
+					1 << hstream->index);
+
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
+					sd_offset,
+					SOF_HDA_SD_CTL_DMA_START |
+					SOF_HDA_CL_DMA_SD_INT_MASK,
+					SOF_HDA_SD_CTL_DMA_START |
+					SOF_HDA_CL_DMA_SD_INT_MASK);
+
+		hstream->running = true;
+		return 0;
+	default:
+		return hda_dsp_stream_trigger(sdev, stream, cmd);
+	}
+}
+
+static struct hdac_ext_stream *get_stream_with_tag(struct snd_sof_dev *sdev,
+						   int tag)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct hdac_stream *s;
+
+	/* get stream with tag */
+	list_for_each_entry(s, &bus->stream_list, list) {
+		if (s->direction == SNDRV_PCM_STREAM_PLAYBACK &&
+		    s->stream_tag == tag) {
+			return stream_to_hdac_ext_stream(s);
+		}
+	}
+
+	return NULL;
+}
+
+static int cl_cleanup(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
+		      struct hdac_ext_stream *stream)
+{
+	struct hdac_stream *hstream = &stream->hstream;
+	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
+	int ret;
+
+	ret = hda_dsp_stream_spib_config(sdev, stream, HDA_DSP_SPIB_DISABLE, 0);
+
+	hda_dsp_stream_put(sdev, SNDRV_PCM_STREAM_PLAYBACK,
+			   hstream->stream_tag);
+	hstream->running = 0;
+	hstream->substream = NULL;
+
+	/* reset BDL address */
+	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPL, 0);
+	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPU, 0);
+
+	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, sd_offset, 0);
+	snd_dma_free_pages(dmab);
+	dmab->area = NULL;
+	hstream->bufsize = 0;
+	hstream->format_val = 0;
+
+	return ret;
+}
+
+static int cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *stream)
+{
+	unsigned int reg;
+	int ret, status;
+
+	ret = cl_trigger(sdev, stream, SNDRV_PCM_TRIGGER_START);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: DMA trigger start failed\n");
+		return ret;
+	}
+
+	status = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
+					HDA_DSP_SRAM_REG_ROM_STATUS, reg,
+					((reg & HDA_DSP_ROM_STS_MASK)
+						== HDA_DSP_ROM_FW_ENTERED),
+					HDA_DSP_REG_POLL_INTERVAL_US,
+					HDA_DSP_BASEFW_TIMEOUT_US);
+
+	ret = cl_trigger(sdev, stream, SNDRV_PCM_TRIGGER_STOP);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: DMA trigger stop failed\n");
+		return ret;
+	}
+
+	return status;
+}
+
+int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *plat_data = sdev->pdata;
+	const struct sof_dev_desc *desc = plat_data->desc;
+	const struct sof_intel_dsp_desc *chip_info;
+	struct hdac_ext_stream *stream;
+	struct firmware stripped_firmware;
+	int ret, ret1, tag, i;
+
+	chip_info = desc->chip_info;
+
+	stripped_firmware.data = plat_data->fw->data;
+	stripped_firmware.size = plat_data->fw->size;
+
+	/* init for booting wait */
+	init_waitqueue_head(&sdev->boot_wait);
+	sdev->boot_complete = false;
+
+	/* prepare DMA for code loader stream */
+	tag = cl_stream_prepare(sdev, 0x40, stripped_firmware.size,
+				&sdev->dmab, SNDRV_PCM_STREAM_PLAYBACK);
+
+	if (tag < 0) {
+		dev_err(sdev->dev, "error: dma prepare for fw loading err: %x\n",
+			tag);
+		return tag;
+	}
+
+	/* get stream with tag */
+	stream = get_stream_with_tag(sdev, tag);
+	if (!stream) {
+		dev_err(sdev->dev,
+			"error: could not get stream with stream tag %d\n",
+			tag);
+		ret = -ENODEV;
+		goto err;
+	}
+
+	memcpy(sdev->dmab.area, stripped_firmware.data,
+	       stripped_firmware.size);
+
+	/* try ROM init a few times before giving up */
+	for (i = 0; i < HDA_FW_BOOT_ATTEMPTS; i++) {
+		ret = cl_dsp_init(sdev, stripped_firmware.data,
+				  stripped_firmware.size, tag);
+
+		/* don't retry anymore if successful */
+		if (!ret)
+			break;
+
+		dev_err(sdev->dev, "error: Error code=0x%x: FW status=0x%x\n",
+			snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+					 HDA_DSP_SRAM_REG_ROM_ERROR),
+			snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+					 HDA_DSP_SRAM_REG_ROM_STATUS));
+		dev_err(sdev->dev, "error: iteration %d of Core En/ROM load failed: %d\n",
+			i, ret);
+	}
+
+	if (i == HDA_FW_BOOT_ATTEMPTS) {
+		dev_err(sdev->dev, "error: dsp init failed after %d attempts with err: %d\n",
+			i, ret);
+		goto cleanup;
+	}
+
+	/*
+	 * at this point DSP ROM has been initialized and
+	 * should be ready for code loading and firmware boot
+	 */
+	ret = cl_copy_fw(sdev, stream);
+	if (!ret)
+		dev_dbg(sdev->dev, "Firmware download successful, booting...\n");
+	else
+		dev_err(sdev->dev, "error: load fw failed ret: %d\n", ret);
+
+cleanup:
+	/*
+	 * Perform codeloader stream cleanup.
+	 * This should be done even if firmware loading fails.
+	 */
+	ret1 = cl_cleanup(sdev, &sdev->dmab, stream);
+	if (ret1 < 0) {
+		dev_err(sdev->dev, "error: Code loader DSP cleanup failed\n");
+
+		/* set return value to indicate cleanup failure */
+		ret = ret1;
+	}
+
+	/*
+	 * return master core id if both fw copy
+	 * and stream clean up are successful
+	 */
+	if (!ret)
+		return chip_info->init_core_mask;
+
+	/* dump dsp registers and disable DSP upon error */
+err:
+	hda_dsp_dump(sdev, SOF_DBG_REGS | SOF_DBG_PCI | SOF_DBG_MBOX);
+
+	/* disable DSP */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR,
+				SOF_HDA_REG_PP_PPCTL,
+				SOF_HDA_PPCTL_GPROCEN, 0);
+	return ret;
+}
+
+/* pre fw run operations */
+int hda_dsp_pre_fw_run(struct snd_sof_dev *sdev)
+{
+	/* disable clock gating and power gating */
+	return hda_dsp_ctrl_clock_power_gating(sdev, false);
+}
+
+/* post fw run operations */
+int hda_dsp_post_fw_run(struct snd_sof_dev *sdev)
+{
+	/* re-enable clock gating and power gating */
+	return hda_dsp_ctrl_clock_power_gating(sdev, true);
+}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
