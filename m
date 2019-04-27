Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6F1B43B
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:13:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3943316BC;
	Sat, 27 Apr 2019 20:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3943316BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556388836;
	bh=0ZaQdMRURf4Tjj/3+O1perbRomQ5WsApEH+Czx1mlFQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tAAThaw5daAXhYhrEJnKvnpfCBZDIjkKVlMhBWp5rMVuHfsmlW/I9RgqJQhME+mc/
	 DlX+CZCumM2GZvgJGy3+ZrRiGJUclGnqZOWNZbXMwuVoGlTv4iTLdpd9pRlK/TO/cj
	 GpP16xf8RkaMmfjjuIrLeXySDJCaGD7PawpudQ+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E344F89822;
	Sat, 27 Apr 2019 19:55:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7386FF8972B; Sat, 27 Apr 2019 19:53:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 512E1F89732;
 Sat, 27 Apr 2019 19:53:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 512E1F89732
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="cftJ2rZ4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=SjxCrwzowC0NQg7beiA5l9KBCFdmn1SDbobiqyOJLe0=; b=cftJ2rZ41GWw
 elytOLIaazNnPeDww+c8lSoom9hpxGe/YQACK8I4q7IMotWTnOS6bZL+xcochCziS1cWhuRhCyOry
 Z4xMY++LtSJgamPbd+xo56WshG7Tef0ivtI2DvnU8WY6H+P87k51iA6hH+/aGTvMgKgk9cZ9OEI8h
 f93GU=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVW-0004ps-BH; Sat, 27 Apr 2019 17:53:03 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 1250C441D3D; Sat, 27 Apr 2019 18:52:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160904.30418-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175254.1250C441D3D@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:52:52 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, Keyon Jie <yang.jie@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: Add APL/CNL HW DSP support"
	to the asoc tree
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

   ASoC: SOF: Intel: Add APL/CNL HW DSP support

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

From dd96daca6c83ecaf37f38ff49d8d174bbff576b4 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:08:47 -0500
Subject: [PATCH] ASoC: SOF: Intel: Add APL/CNL HW DSP support

Add SOF hardware DSP support for Intel Apollolake and Cannonlake based
devices.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda.c | 671 ++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h | 560 +++++++++++++++++++++++++++++++
 2 files changed, 1231 insertions(+)
 create mode 100644 sound/soc/sof/intel/hda.c
 create mode 100644 sound/soc/sof/intel/hda.h

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
new file mode 100644
index 000000000000..b8fc19790f3b
--- /dev/null
+++ b/sound/soc/sof/intel/hda.c
@@ -0,0 +1,671 @@
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
+ * Hardware interface for generic Intel audio DSP HDA IP
+ */
+
+#include <linux/module.h>
+#include <sound/hdaudio_ext.h>
+#include <sound/sof.h>
+#include <sound/sof/xtensa.h>
+#include "../ops.h"
+#include "hda.h"
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+#include "../../codecs/hdac_hda.h"
+#endif
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+#include <sound/soc-acpi-intel-match.h>
+#endif
+
+/* platform specific devices */
+#include "shim.h"
+
+/*
+ * Debug
+ */
+
+struct hda_dsp_msg_code {
+	u32 code;
+	const char *msg;
+};
+
+static const struct hda_dsp_msg_code hda_dsp_rom_msg[] = {
+	{HDA_DSP_ROM_FW_MANIFEST_LOADED, "status: manifest loaded"},
+	{HDA_DSP_ROM_FW_FW_LOADED, "status: fw loaded"},
+	{HDA_DSP_ROM_FW_ENTERED, "status: fw entered"},
+	{HDA_DSP_ROM_CSE_ERROR, "error: cse error"},
+	{HDA_DSP_ROM_CSE_WRONG_RESPONSE, "error: cse wrong response"},
+	{HDA_DSP_ROM_IMR_TO_SMALL, "error: IMR too small"},
+	{HDA_DSP_ROM_BASE_FW_NOT_FOUND, "error: base fw not found"},
+	{HDA_DSP_ROM_CSE_VALIDATION_FAILED, "error: signature verification failed"},
+	{HDA_DSP_ROM_IPC_FATAL_ERROR, "error: ipc fatal error"},
+	{HDA_DSP_ROM_L2_CACHE_ERROR, "error: L2 cache error"},
+	{HDA_DSP_ROM_LOAD_OFFSET_TO_SMALL, "error: load offset too small"},
+	{HDA_DSP_ROM_API_PTR_INVALID, "error: API ptr invalid"},
+	{HDA_DSP_ROM_BASEFW_INCOMPAT, "error: base fw incompatble"},
+	{HDA_DSP_ROM_UNHANDLED_INTERRUPT, "error: unhandled interrupt"},
+	{HDA_DSP_ROM_MEMORY_HOLE_ECC, "error: ECC memory hole"},
+	{HDA_DSP_ROM_KERNEL_EXCEPTION, "error: kernel exception"},
+	{HDA_DSP_ROM_USER_EXCEPTION, "error: user exception"},
+	{HDA_DSP_ROM_UNEXPECTED_RESET, "error: unexpected reset"},
+	{HDA_DSP_ROM_NULL_FW_ENTRY,	"error: null FW entry point"},
+};
+
+static void hda_dsp_get_status_skl(struct snd_sof_dev *sdev)
+{
+	u32 status;
+	int i;
+
+	status = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+				  HDA_ADSP_FW_STATUS_SKL);
+
+	for (i = 0; i < ARRAY_SIZE(hda_dsp_rom_msg); i++) {
+		if (status == hda_dsp_rom_msg[i].code) {
+			dev_err(sdev->dev, "%s - code %8.8x\n",
+				hda_dsp_rom_msg[i].msg, status);
+			return;
+		}
+	}
+
+	/* not for us, must be generic sof message */
+	dev_dbg(sdev->dev, "unknown ROM status value %8.8x\n", status);
+}
+
+static void hda_dsp_get_status(struct snd_sof_dev *sdev)
+{
+	u32 status;
+	int i;
+
+	status = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+				  HDA_DSP_SRAM_REG_ROM_STATUS);
+
+	for (i = 0; i < ARRAY_SIZE(hda_dsp_rom_msg); i++) {
+		if (status == hda_dsp_rom_msg[i].code) {
+			dev_err(sdev->dev, "%s - code %8.8x\n",
+				hda_dsp_rom_msg[i].msg, status);
+			return;
+		}
+	}
+
+	/* not for us, must be generic sof message */
+	dev_dbg(sdev->dev, "unknown ROM status value %8.8x\n", status);
+}
+
+static void hda_dsp_get_registers(struct snd_sof_dev *sdev,
+				  struct sof_ipc_dsp_oops_xtensa *xoops,
+				  struct sof_ipc_panic_info *panic_info,
+				  u32 *stack, size_t stack_words)
+{
+	/* first read registers */
+	sof_block_read(sdev, sdev->mmio_bar, sdev->dsp_oops_offset, xoops,
+		       sizeof(*xoops));
+
+	/* then get panic info */
+	sof_block_read(sdev, sdev->mmio_bar, sdev->dsp_oops_offset +
+		       sizeof(*xoops), panic_info, sizeof(*panic_info));
+
+	/* then get the stack */
+	sof_block_read(sdev, sdev->mmio_bar, sdev->dsp_oops_offset +
+		       sizeof(*xoops) + sizeof(*panic_info), stack,
+		       stack_words * sizeof(u32));
+}
+
+void hda_dsp_dump_skl(struct snd_sof_dev *sdev, u32 flags)
+{
+	struct sof_ipc_dsp_oops_xtensa xoops;
+	struct sof_ipc_panic_info panic_info;
+	u32 stack[HDA_DSP_STACK_DUMP_SIZE];
+	u32 status, panic;
+
+	/* try APL specific status message types first */
+	hda_dsp_get_status_skl(sdev);
+
+	/* now try generic SOF status messages */
+	status = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+				  HDA_ADSP_ERROR_CODE_SKL);
+
+	/*TODO: Check: there is no define in spec, but it is used in the code*/
+	panic = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+				 HDA_ADSP_ERROR_CODE_SKL + 0x4);
+
+	if (sdev->boot_complete) {
+		hda_dsp_get_registers(sdev, &xoops, &panic_info, stack,
+				      HDA_DSP_STACK_DUMP_SIZE);
+		snd_sof_get_status(sdev, status, panic, &xoops, &panic_info,
+				   stack, HDA_DSP_STACK_DUMP_SIZE);
+	} else {
+		dev_err(sdev->dev, "error: status = 0x%8.8x panic = 0x%8.8x\n",
+			status, panic);
+		hda_dsp_get_status_skl(sdev);
+	}
+}
+
+void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
+{
+	struct sof_ipc_dsp_oops_xtensa xoops;
+	struct sof_ipc_panic_info panic_info;
+	u32 stack[HDA_DSP_STACK_DUMP_SIZE];
+	u32 status, panic;
+
+	/* try APL specific status message types first */
+	hda_dsp_get_status(sdev);
+
+	/* now try generic SOF status messages */
+	status = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+				  HDA_DSP_SRAM_REG_FW_STATUS);
+	panic = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_SRAM_REG_FW_TRACEP);
+
+	if (sdev->boot_complete) {
+		hda_dsp_get_registers(sdev, &xoops, &panic_info, stack,
+				      HDA_DSP_STACK_DUMP_SIZE);
+		snd_sof_get_status(sdev, status, panic, &xoops, &panic_info,
+				   stack, HDA_DSP_STACK_DUMP_SIZE);
+	} else {
+		dev_err(sdev->dev, "error: status = 0x%8.8x panic = 0x%8.8x\n",
+			status, panic);
+		hda_dsp_get_status(sdev);
+	}
+}
+
+static int hda_init(struct snd_sof_dev *sdev)
+{
+	struct hda_bus *hbus;
+	struct hdac_bus *bus;
+	struct hdac_ext_bus_ops *ext_ops = NULL;
+	struct pci_dev *pci = to_pci_dev(sdev->dev);
+	int ret;
+
+	hbus = sof_to_hbus(sdev);
+	bus = sof_to_bus(sdev);
+
+	/* HDA bus init */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+	ext_ops = snd_soc_hdac_hda_get_ops();
+#endif
+	sof_hda_bus_init(bus, &pci->dev, ext_ops);
+	bus->use_posbuf = 1;
+	bus->bdl_pos_adj = 0;
+
+	mutex_init(&hbus->prepare_mutex);
+	hbus->pci = pci;
+	hbus->mixer_assigned = -1;
+	hbus->modelname = "sofbus";
+
+	/* initialise hdac bus */
+	bus->addr = pci_resource_start(pci, 0);
+	bus->remap_addr = pci_ioremap_bar(pci, 0);
+	if (!bus->remap_addr) {
+		dev_err(bus->dev, "error: ioremap error\n");
+		return -ENXIO;
+	}
+
+	/* HDA base */
+	sdev->bar[HDA_DSP_HDA_BAR] = bus->remap_addr;
+
+	/* get controller capabilities */
+	ret = hda_dsp_ctrl_get_caps(sdev);
+	if (ret < 0)
+		dev_err(sdev->dev, "error: get caps error\n");
+
+	return ret;
+}
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+
+static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
+				   const char *sof_tplg_filename)
+{
+	const char *tplg_filename = NULL;
+	char *filename;
+	char *split_ext;
+
+	filename = devm_kstrdup(sdev->dev, sof_tplg_filename, GFP_KERNEL);
+	if (!filename)
+		return NULL;
+
+	/* this assumes a .tplg extension */
+	split_ext = strsep(&filename, ".");
+	if (split_ext) {
+		tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
+					       "%s-idisp.tplg", split_ext);
+		if (!tplg_filename)
+			return NULL;
+	}
+	return tplg_filename;
+}
+
+static int hda_init_caps(struct snd_sof_dev *sdev)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct hdac_ext_link *hlink;
+	struct snd_soc_acpi_mach_params *mach_params;
+	struct snd_soc_acpi_mach *hda_mach;
+	struct snd_sof_pdata *pdata = sdev->pdata;
+	struct snd_soc_acpi_mach *mach;
+	const char *tplg_filename;
+	int codec_num = 0;
+	int ret = 0;
+	int i;
+
+	device_disable_async_suspend(bus->dev);
+
+	/* check if dsp is there */
+	if (bus->ppcap)
+		dev_dbg(sdev->dev, "PP capability, will probe DSP later.\n");
+
+	if (bus->mlcap)
+		snd_hdac_ext_bus_get_ml_capabilities(bus);
+
+	/* init i915 and HDMI codecs */
+	ret = hda_codec_i915_init(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: no HDMI audio devices found\n");
+		return ret;
+	}
+
+	ret = hda_dsp_ctrl_init_chip(sdev, true);
+	if (ret < 0) {
+		dev_err(bus->dev, "error: init chip failed with ret: %d\n", ret);
+		goto out;
+	}
+
+	/* codec detection */
+	if (!bus->codec_mask) {
+		dev_info(bus->dev, "no hda codecs found!\n");
+	} else {
+		dev_info(bus->dev, "hda codecs found, mask %lx\n",
+			 bus->codec_mask);
+
+		for (i = 0; i < HDA_MAX_CODECS; i++) {
+			if (bus->codec_mask & (1 << i))
+				codec_num++;
+		}
+
+		/*
+		 * If no machine driver is found, then:
+		 *
+		 * hda machine driver is used if :
+		 * 1. there is one HDMI codec and one external HDAudio codec
+		 * 2. only HDMI codec
+		 */
+		if (!pdata->machine && codec_num <= 2 &&
+		    HDA_IDISP_CODEC(bus->codec_mask)) {
+			hda_mach = snd_soc_acpi_intel_hda_machines;
+			pdata->machine = hda_mach;
+
+			/* topology: use the info from hda_machines */
+			pdata->tplg_filename =
+				hda_mach->sof_tplg_filename;
+
+			/* firmware: pick the first in machine list */
+			mach = pdata->desc->machines;
+			pdata->fw_filename = mach->sof_fw_filename;
+
+			dev_info(bus->dev, "using HDA machine driver %s now\n",
+				 hda_mach->drv_name);
+
+			/* fixup topology file for HDMI only platforms */
+			if (codec_num == 1) {
+				/* use local variable for readability */
+				tplg_filename = pdata->tplg_filename;
+				tplg_filename = fixup_tplg_name(sdev, tplg_filename);
+				if (!tplg_filename)
+					goto out;
+				pdata->tplg_filename = tplg_filename;
+			}
+		}
+	}
+
+	/* used by hda machine driver to create dai links */
+	if (pdata->machine) {
+		mach_params = (struct snd_soc_acpi_mach_params *)
+			&pdata->machine->mach_params;
+		mach_params->codec_mask = bus->codec_mask;
+		mach_params->platform = dev_name(sdev->dev);
+	}
+
+	/* create codec instances */
+	hda_codec_probe_bus(sdev);
+
+	hda_codec_i915_put(sdev);
+
+	/*
+	 * we are done probing so decrement link counts
+	 */
+	list_for_each_entry(hlink, &bus->hlink_list, list)
+		snd_hdac_ext_bus_link_put(bus, hlink);
+
+	return 0;
+
+out:
+	hda_codec_i915_exit(sdev);
+	return ret;
+}
+
+#else
+
+static int hda_init_caps(struct snd_sof_dev *sdev)
+{
+	/*
+	 * set CGCTL.MISCBDCGE to 0 during reset and set back to 1
+	 * when reset finished.
+	 * TODO: maybe no need for init_caps?
+	 */
+	hda_dsp_ctrl_misc_clock_gating(sdev, 0);
+
+	/* clear WAKESTS */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_WAKESTS,
+				SOF_HDA_WAKESTS_INT_MASK,
+				SOF_HDA_WAKESTS_INT_MASK);
+
+	return 0;
+}
+
+#endif
+
+static const struct sof_intel_dsp_desc
+	*get_chip_info(struct snd_sof_pdata *pdata)
+{
+	const struct sof_dev_desc *desc = pdata->desc;
+	const struct sof_intel_dsp_desc *chip_info;
+
+	chip_info = desc->chip_info;
+
+	return chip_info;
+}
+
+int hda_dsp_probe(struct snd_sof_dev *sdev)
+{
+	struct pci_dev *pci = to_pci_dev(sdev->dev);
+	struct sof_intel_hda_dev *hdev;
+	struct hdac_bus *bus;
+	struct hdac_stream *stream;
+	const struct sof_intel_dsp_desc *chip;
+	int sd_offset, ret = 0;
+
+	/*
+	 * detect DSP by checking class/subclass/prog-id information
+	 * class=04 subclass 03 prog-if 00: no DSP, legacy driver is required
+	 * class=04 subclass 01 prog-if 00: DSP is present
+	 *   (and may be required e.g. for DMIC or SSP support)
+	 * class=04 subclass 03 prog-if 80: either of DSP or legacy mode works
+	 */
+	if (pci->class == 0x040300) {
+		dev_err(sdev->dev, "error: the DSP is not enabled on this platform, aborting probe\n");
+		return -ENODEV;
+	} else if (pci->class != 0x040100 && pci->class != 0x040380) {
+		dev_err(sdev->dev, "error: unknown PCI class/subclass/prog-if 0x%06x found, aborting probe\n", pci->class);
+		return -ENODEV;
+	}
+	dev_info(sdev->dev, "DSP detected with PCI class/subclass/prog-if 0x%06x\n", pci->class);
+
+	chip = get_chip_info(sdev->pdata);
+	if (!chip) {
+		dev_err(sdev->dev, "error: no such device supported, chip id:%x\n",
+			pci->device);
+		ret = -EIO;
+		goto err;
+	}
+
+	hdev = devm_kzalloc(sdev->dev, sizeof(*hdev), GFP_KERNEL);
+	if (!hdev)
+		return -ENOMEM;
+	sdev->pdata->hw_pdata = hdev;
+	hdev->desc = chip;
+
+	hdev->dmic_dev = platform_device_register_data(sdev->dev, "dmic-codec",
+						       PLATFORM_DEVID_NONE,
+						       NULL, 0);
+	if (IS_ERR(hdev->dmic_dev)) {
+		dev_err(sdev->dev, "error: failed to create DMIC device\n");
+		return PTR_ERR(hdev->dmic_dev);
+	}
+
+	/*
+	 * use position update IPC if either it is forced
+	 * or we don't have other choice
+	 */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_FORCE_IPC_POSITION)
+	hdev->no_ipc_position = 0;
+#else
+	hdev->no_ipc_position = sof_ops(sdev)->pcm_pointer ? 1 : 0;
+#endif
+
+	/* set up HDA base */
+	bus = sof_to_bus(sdev);
+	ret = hda_init(sdev);
+	if (ret < 0)
+		goto hdac_bus_unmap;
+
+	/* DSP base */
+	sdev->bar[HDA_DSP_BAR] = pci_ioremap_bar(pci, HDA_DSP_BAR);
+	if (!sdev->bar[HDA_DSP_BAR]) {
+		dev_err(sdev->dev, "error: ioremap error\n");
+		ret = -ENXIO;
+		goto hdac_bus_unmap;
+	}
+
+	sdev->mmio_bar = HDA_DSP_BAR;
+	sdev->mailbox_bar = HDA_DSP_BAR;
+
+	/* allow 64bit DMA address if supported by H/W */
+	if (!dma_set_mask(&pci->dev, DMA_BIT_MASK(64))) {
+		dev_dbg(sdev->dev, "DMA mask is 64 bit\n");
+		dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(64));
+	} else {
+		dev_dbg(sdev->dev, "DMA mask is 32 bit\n");
+		dma_set_mask(&pci->dev, DMA_BIT_MASK(32));
+		dma_set_coherent_mask(&pci->dev, DMA_BIT_MASK(32));
+	}
+
+	/* init streams */
+	ret = hda_dsp_stream_init(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to init streams\n");
+		/*
+		 * not all errors are due to memory issues, but trying
+		 * to free everything does not harm
+		 */
+		goto free_streams;
+	}
+
+	/*
+	 * register our IRQ
+	 * let's try to enable msi firstly
+	 * if it fails, use legacy interrupt mode
+	 * TODO: support interrupt mode selection with kernel parameter
+	 *       support msi multiple vectors
+	 */
+	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_MSI);
+	if (ret < 0) {
+		dev_info(sdev->dev, "use legacy interrupt mode\n");
+		/*
+		 * in IO-APIC mode, hda->irq and ipc_irq are using the same
+		 * irq number of pci->irq
+		 */
+		hdev->irq = pci->irq;
+		sdev->ipc_irq = pci->irq;
+		sdev->msi_enabled = 0;
+	} else {
+		dev_info(sdev->dev, "use msi interrupt mode\n");
+		hdev->irq = pci_irq_vector(pci, 0);
+		/* ipc irq number is the same of hda irq */
+		sdev->ipc_irq = hdev->irq;
+		sdev->msi_enabled = 1;
+	}
+
+	dev_dbg(sdev->dev, "using HDA IRQ %d\n", hdev->irq);
+	ret = request_threaded_irq(hdev->irq, hda_dsp_stream_interrupt,
+				   hda_dsp_stream_threaded_handler,
+				   IRQF_SHARED, "AudioHDA", bus);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to register HDA IRQ %d\n",
+			hdev->irq);
+		goto free_irq_vector;
+	}
+
+	dev_dbg(sdev->dev, "using IPC IRQ %d\n", sdev->ipc_irq);
+	ret = request_threaded_irq(sdev->ipc_irq, hda_dsp_ipc_irq_handler,
+				   sof_ops(sdev)->irq_thread, IRQF_SHARED,
+				   "AudioDSP", sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to register IPC IRQ %d\n",
+			sdev->ipc_irq);
+		goto free_hda_irq;
+	}
+
+	pci_set_master(pci);
+	synchronize_irq(pci->irq);
+
+	/*
+	 * clear TCSEL to clear playback on some HD Audio
+	 * codecs. PCI TCSEL is defined in the Intel manuals.
+	 */
+	snd_sof_pci_update_bits(sdev, PCI_TCSEL, 0x07, 0);
+
+	/* init HDA capabilities */
+	ret = hda_init_caps(sdev);
+	if (ret < 0)
+		goto free_ipc_irq;
+
+	/* reset HDA controller */
+	ret = hda_dsp_ctrl_link_reset(sdev, true);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to reset HDA controller\n");
+		goto free_ipc_irq;
+	}
+
+	/* exit HDA controller reset */
+	ret = hda_dsp_ctrl_link_reset(sdev, false);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to exit HDA controller reset\n");
+		goto free_ipc_irq;
+	}
+
+	/* clear stream status */
+	list_for_each_entry(stream, &bus->stream_list, list) {
+		sd_offset = SOF_STREAM_SD_OFFSET(stream);
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
+					sd_offset +
+					SOF_HDA_ADSP_REG_CL_SD_STS,
+					SOF_HDA_CL_DMA_SD_INT_MASK,
+					SOF_HDA_CL_DMA_SD_INT_MASK);
+	}
+
+	/* clear WAKESTS */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_WAKESTS,
+				SOF_HDA_WAKESTS_INT_MASK,
+				SOF_HDA_WAKESTS_INT_MASK);
+
+	/* clear interrupt status register */
+	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTSTS,
+			  SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_ALL_STREAM);
+
+	/* enable CIE and GIE interrupts */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL,
+				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN,
+				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN);
+
+	/* re-enable CGCTL.MISCBDCGE after reset */
+	hda_dsp_ctrl_misc_clock_gating(sdev, true);
+
+	device_disable_async_suspend(&pci->dev);
+
+	/* enable DSP features */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
+				SOF_HDA_PPCTL_GPROCEN, SOF_HDA_PPCTL_GPROCEN);
+
+	/* enable DSP IRQ */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
+				SOF_HDA_PPCTL_PIE, SOF_HDA_PPCTL_PIE);
+
+	/* initialize waitq for code loading */
+	init_waitqueue_head(&sdev->waitq);
+
+	/* set default mailbox offset for FW ready message */
+	sdev->dsp_box.offset = HDA_DSP_MBOX_UPLINK_OFFSET;
+
+	return 0;
+
+free_ipc_irq:
+	free_irq(sdev->ipc_irq, sdev);
+free_hda_irq:
+	free_irq(hdev->irq, bus);
+free_irq_vector:
+	if (sdev->msi_enabled)
+		pci_free_irq_vectors(pci);
+free_streams:
+	hda_dsp_stream_free(sdev);
+/* dsp_unmap: not currently used */
+	iounmap(sdev->bar[HDA_DSP_BAR]);
+hdac_bus_unmap:
+	iounmap(bus->remap_addr);
+err:
+	return ret;
+}
+
+int hda_dsp_remove(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct pci_dev *pci = to_pci_dev(sdev->dev);
+	const struct sof_intel_dsp_desc *chip = hda->desc;
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	/* codec removal, invoke bus_device_remove */
+	snd_hdac_ext_bus_device_remove(bus);
+#endif
+
+	if (!IS_ERR_OR_NULL(hda->dmic_dev))
+		platform_device_unregister(hda->dmic_dev);
+
+	/* disable DSP IRQ */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
+				SOF_HDA_PPCTL_PIE, 0);
+
+	/* disable CIE and GIE interrupts */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL,
+				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN, 0);
+
+	/* disable cores */
+	if (chip)
+		hda_dsp_core_reset_power_down(sdev, chip->cores_mask);
+
+	/* disable DSP */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
+				SOF_HDA_PPCTL_GPROCEN, 0);
+
+	free_irq(sdev->ipc_irq, sdev);
+	free_irq(hda->irq, bus);
+	if (sdev->msi_enabled)
+		pci_free_irq_vectors(pci);
+
+	hda_dsp_stream_free(sdev);
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	snd_hdac_link_free_all(bus);
+#endif
+
+	iounmap(sdev->bar[HDA_DSP_BAR]);
+	iounmap(bus->remap_addr);
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	snd_hdac_ext_bus_exit(bus);
+#endif
+	hda_codec_i915_exit(sdev);
+
+	return 0;
+}
+
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
new file mode 100644
index 000000000000..4efcf85af6b5
--- /dev/null
+++ b/sound/soc/sof/intel/hda.h
@@ -0,0 +1,560 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2017 Intel Corporation. All rights reserved.
+ *
+ * Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+ */
+
+#ifndef __SOF_INTEL_HDA_H
+#define __SOF_INTEL_HDA_H
+
+#include <sound/hda_codec.h>
+#include <sound/hdaudio_ext.h>
+#include "shim.h"
+
+/* PCI registers */
+#define PCI_TCSEL			0x44
+#define PCI_PGCTL			PCI_TCSEL
+#define PCI_CGCTL			0x48
+
+/* PCI_PGCTL bits */
+#define PCI_PGCTL_ADSPPGD               BIT(2)
+#define PCI_PGCTL_LSRMD_MASK		BIT(4)
+
+/* PCI_CGCTL bits */
+#define PCI_CGCTL_MISCBDCGE_MASK	BIT(6)
+#define PCI_CGCTL_ADSPDCGE              BIT(1)
+
+/* Legacy HDA registers and bits used - widths are variable */
+#define SOF_HDA_GCAP			0x0
+#define SOF_HDA_GCTL			0x8
+/* accept unsol. response enable */
+#define SOF_HDA_GCTL_UNSOL		BIT(8)
+#define SOF_HDA_LLCH			0x14
+#define SOF_HDA_INTCTL			0x20
+#define SOF_HDA_INTSTS			0x24
+#define SOF_HDA_WAKESTS			0x0E
+#define SOF_HDA_WAKESTS_INT_MASK	((1 << 8) - 1)
+#define SOF_HDA_RIRBSTS			0x5d
+#define SOF_HDA_VS_EM2_L1SEN            BIT(13)
+
+/* SOF_HDA_GCTL register bist */
+#define SOF_HDA_GCTL_RESET		BIT(0)
+
+/* SOF_HDA_INCTL and SOF_HDA_INTSTS regs */
+#define SOF_HDA_INT_GLOBAL_EN		BIT(31)
+#define SOF_HDA_INT_CTRL_EN		BIT(30)
+#define SOF_HDA_INT_ALL_STREAM		0xff
+
+#define SOF_HDA_MAX_CAPS		10
+#define SOF_HDA_CAP_ID_OFF		16
+#define SOF_HDA_CAP_ID_MASK		GENMASK(SOF_HDA_CAP_ID_OFF + 11,\
+						SOF_HDA_CAP_ID_OFF)
+#define SOF_HDA_CAP_NEXT_MASK		0xFFFF
+
+#define SOF_HDA_GTS_CAP_ID			0x1
+#define SOF_HDA_ML_CAP_ID			0x2
+
+#define SOF_HDA_PP_CAP_ID		0x3
+#define SOF_HDA_REG_PP_PPCH		0x10
+#define SOF_HDA_REG_PP_PPCTL		0x04
+#define SOF_HDA_PPCTL_PIE		BIT(31)
+#define SOF_HDA_PPCTL_GPROCEN		BIT(30)
+
+/* DPIB entry size: 8 Bytes = 2 DWords */
+#define SOF_HDA_DPIB_ENTRY_SIZE	0x8
+
+#define SOF_HDA_SPIB_CAP_ID		0x4
+#define SOF_HDA_DRSM_CAP_ID		0x5
+
+#define SOF_HDA_SPIB_BASE		0x08
+#define SOF_HDA_SPIB_INTERVAL		0x08
+#define SOF_HDA_SPIB_SPIB		0x00
+#define SOF_HDA_SPIB_MAXFIFO		0x04
+
+#define SOF_HDA_PPHC_BASE		0x10
+#define SOF_HDA_PPHC_INTERVAL		0x10
+
+#define SOF_HDA_PPLC_BASE		0x10
+#define SOF_HDA_PPLC_MULTI		0x10
+#define SOF_HDA_PPLC_INTERVAL		0x10
+
+#define SOF_HDA_DRSM_BASE		0x08
+#define SOF_HDA_DRSM_INTERVAL		0x08
+
+/* Descriptor error interrupt */
+#define SOF_HDA_CL_DMA_SD_INT_DESC_ERR		0x10
+
+/* FIFO error interrupt */
+#define SOF_HDA_CL_DMA_SD_INT_FIFO_ERR		0x08
+
+/* Buffer completion interrupt */
+#define SOF_HDA_CL_DMA_SD_INT_COMPLETE		0x04
+
+#define SOF_HDA_CL_DMA_SD_INT_MASK \
+	(SOF_HDA_CL_DMA_SD_INT_DESC_ERR | \
+	SOF_HDA_CL_DMA_SD_INT_FIFO_ERR | \
+	SOF_HDA_CL_DMA_SD_INT_COMPLETE)
+#define SOF_HDA_SD_CTL_DMA_START		0x02 /* Stream DMA start bit */
+
+/* Intel HD Audio Code Loader DMA Registers */
+#define SOF_HDA_ADSP_LOADER_BASE		0x80
+#define SOF_HDA_ADSP_DPLBASE			0x70
+#define SOF_HDA_ADSP_DPUBASE			0x74
+#define SOF_HDA_ADSP_DPLBASE_ENABLE		0x01
+
+/* Stream Registers */
+#define SOF_HDA_ADSP_REG_CL_SD_CTL		0x00
+#define SOF_HDA_ADSP_REG_CL_SD_STS		0x03
+#define SOF_HDA_ADSP_REG_CL_SD_LPIB		0x04
+#define SOF_HDA_ADSP_REG_CL_SD_CBL		0x08
+#define SOF_HDA_ADSP_REG_CL_SD_LVI		0x0C
+#define SOF_HDA_ADSP_REG_CL_SD_FIFOW		0x0E
+#define SOF_HDA_ADSP_REG_CL_SD_FIFOSIZE		0x10
+#define SOF_HDA_ADSP_REG_CL_SD_FORMAT		0x12
+#define SOF_HDA_ADSP_REG_CL_SD_FIFOL		0x14
+#define SOF_HDA_ADSP_REG_CL_SD_BDLPL		0x18
+#define SOF_HDA_ADSP_REG_CL_SD_BDLPU		0x1C
+#define SOF_HDA_ADSP_SD_ENTRY_SIZE		0x20
+
+/* CL: Software Position Based FIFO Capability Registers */
+#define SOF_DSP_REG_CL_SPBFIFO \
+	(SOF_HDA_ADSP_LOADER_BASE + 0x20)
+#define SOF_HDA_ADSP_REG_CL_SPBFIFO_SPBFCH	0x0
+#define SOF_HDA_ADSP_REG_CL_SPBFIFO_SPBFCCTL	0x4
+#define SOF_HDA_ADSP_REG_CL_SPBFIFO_SPIB	0x8
+#define SOF_HDA_ADSP_REG_CL_SPBFIFO_MAXFIFOS	0xc
+
+/* Stream Number */
+#define SOF_HDA_CL_SD_CTL_STREAM_TAG_SHIFT	20
+#define SOF_HDA_CL_SD_CTL_STREAM_TAG_MASK \
+	GENMASK(SOF_HDA_CL_SD_CTL_STREAM_TAG_SHIFT + 3,\
+		SOF_HDA_CL_SD_CTL_STREAM_TAG_SHIFT)
+
+#define HDA_DSP_HDA_BAR				0
+#define HDA_DSP_PP_BAR				1
+#define HDA_DSP_SPIB_BAR			2
+#define HDA_DSP_DRSM_BAR			3
+#define HDA_DSP_BAR				4
+
+#define SRAM_WINDOW_OFFSET(x)			(0x80000 + (x) * 0x20000)
+
+#define HDA_DSP_MBOX_OFFSET			SRAM_WINDOW_OFFSET(0)
+
+#define HDA_DSP_PANIC_OFFSET(x) \
+	(((x) & 0xFFFFFF) + HDA_DSP_MBOX_OFFSET)
+
+/* SRAM window 0 FW "registers" */
+#define HDA_DSP_SRAM_REG_ROM_STATUS		(HDA_DSP_MBOX_OFFSET + 0x0)
+#define HDA_DSP_SRAM_REG_ROM_ERROR		(HDA_DSP_MBOX_OFFSET + 0x4)
+/* FW and ROM share offset 4 */
+#define HDA_DSP_SRAM_REG_FW_STATUS		(HDA_DSP_MBOX_OFFSET + 0x4)
+#define HDA_DSP_SRAM_REG_FW_TRACEP		(HDA_DSP_MBOX_OFFSET + 0x8)
+#define HDA_DSP_SRAM_REG_FW_END			(HDA_DSP_MBOX_OFFSET + 0xc)
+
+#define HDA_DSP_MBOX_UPLINK_OFFSET		0x81000
+
+#define HDA_DSP_STREAM_RESET_TIMEOUT		300
+#define HDA_DSP_CL_TRIGGER_TIMEOUT		300
+
+#define HDA_DSP_SPIB_ENABLE			1
+#define HDA_DSP_SPIB_DISABLE			0
+
+#define SOF_HDA_MAX_BUFFER_SIZE			(32 * PAGE_SIZE)
+
+#define HDA_DSP_STACK_DUMP_SIZE			32
+
+/* ROM  status/error values */
+#define HDA_DSP_ROM_STS_MASK			0xf
+#define HDA_DSP_ROM_INIT			0x1
+#define HDA_DSP_ROM_FW_MANIFEST_LOADED		0x3
+#define HDA_DSP_ROM_FW_FW_LOADED		0x4
+#define HDA_DSP_ROM_FW_ENTERED			0x5
+#define HDA_DSP_ROM_RFW_START			0xf
+#define HDA_DSP_ROM_CSE_ERROR			40
+#define HDA_DSP_ROM_CSE_WRONG_RESPONSE		41
+#define HDA_DSP_ROM_IMR_TO_SMALL		42
+#define HDA_DSP_ROM_BASE_FW_NOT_FOUND		43
+#define HDA_DSP_ROM_CSE_VALIDATION_FAILED	44
+#define HDA_DSP_ROM_IPC_FATAL_ERROR		45
+#define HDA_DSP_ROM_L2_CACHE_ERROR		46
+#define HDA_DSP_ROM_LOAD_OFFSET_TO_SMALL	47
+#define HDA_DSP_ROM_API_PTR_INVALID		50
+#define HDA_DSP_ROM_BASEFW_INCOMPAT		51
+#define HDA_DSP_ROM_UNHANDLED_INTERRUPT		0xBEE00000
+#define HDA_DSP_ROM_MEMORY_HOLE_ECC		0xECC00000
+#define HDA_DSP_ROM_KERNEL_EXCEPTION		0xCAFE0000
+#define HDA_DSP_ROM_USER_EXCEPTION		0xBEEF0000
+#define HDA_DSP_ROM_UNEXPECTED_RESET		0xDECAF000
+#define HDA_DSP_ROM_NULL_FW_ENTRY		0x4c4c4e55
+#define HDA_DSP_IPC_PURGE_FW			0x01004000
+
+/* various timeout values */
+#define HDA_DSP_PU_TIMEOUT		50
+#define HDA_DSP_PD_TIMEOUT		50
+#define HDA_DSP_RESET_TIMEOUT_US	50000
+#define HDA_DSP_BASEFW_TIMEOUT_US       3000000
+#define HDA_DSP_INIT_TIMEOUT_US	500000
+#define HDA_DSP_CTRL_RESET_TIMEOUT		100
+#define HDA_DSP_WAIT_TIMEOUT		500	/* 500 msec */
+#define HDA_DSP_REG_POLL_INTERVAL_US		500	/* 0.5 msec */
+
+#define HDA_DSP_ADSPIC_IPC			1
+#define HDA_DSP_ADSPIS_IPC			1
+
+/* Intel HD Audio General DSP Registers */
+#define HDA_DSP_GEN_BASE		0x0
+#define HDA_DSP_REG_ADSPCS		(HDA_DSP_GEN_BASE + 0x04)
+#define HDA_DSP_REG_ADSPIC		(HDA_DSP_GEN_BASE + 0x08)
+#define HDA_DSP_REG_ADSPIS		(HDA_DSP_GEN_BASE + 0x0C)
+#define HDA_DSP_REG_ADSPIC2		(HDA_DSP_GEN_BASE + 0x10)
+#define HDA_DSP_REG_ADSPIS2		(HDA_DSP_GEN_BASE + 0x14)
+
+/* Intel HD Audio Inter-Processor Communication Registers */
+#define HDA_DSP_IPC_BASE		0x40
+#define HDA_DSP_REG_HIPCT		(HDA_DSP_IPC_BASE + 0x00)
+#define HDA_DSP_REG_HIPCTE		(HDA_DSP_IPC_BASE + 0x04)
+#define HDA_DSP_REG_HIPCI		(HDA_DSP_IPC_BASE + 0x08)
+#define HDA_DSP_REG_HIPCIE		(HDA_DSP_IPC_BASE + 0x0C)
+#define HDA_DSP_REG_HIPCCTL		(HDA_DSP_IPC_BASE + 0x10)
+
+/*  HIPCI */
+#define HDA_DSP_REG_HIPCI_BUSY		BIT(31)
+#define HDA_DSP_REG_HIPCI_MSG_MASK	0x7FFFFFFF
+
+/* HIPCIE */
+#define HDA_DSP_REG_HIPCIE_DONE	BIT(30)
+#define HDA_DSP_REG_HIPCIE_MSG_MASK	0x3FFFFFFF
+
+/* HIPCCTL */
+#define HDA_DSP_REG_HIPCCTL_DONE	BIT(1)
+#define HDA_DSP_REG_HIPCCTL_BUSY	BIT(0)
+
+/* HIPCT */
+#define HDA_DSP_REG_HIPCT_BUSY		BIT(31)
+#define HDA_DSP_REG_HIPCT_MSG_MASK	0x7FFFFFFF
+
+/* HIPCTE */
+#define HDA_DSP_REG_HIPCTE_MSG_MASK	0x3FFFFFFF
+
+#define HDA_DSP_ADSPIC_CL_DMA		0x2
+#define HDA_DSP_ADSPIS_CL_DMA		0x2
+
+/* Delay before scheduling D0i3 entry */
+#define BXT_D0I3_DELAY 5000
+
+#define FW_CL_STREAM_NUMBER		0x1
+
+/* ADSPCS - Audio DSP Control & Status */
+
+/*
+ * Core Reset - asserted high
+ * CRST Mask for a given core mask pattern, cm
+ */
+#define HDA_DSP_ADSPCS_CRST_SHIFT	0
+#define HDA_DSP_ADSPCS_CRST_MASK(cm)	((cm) << HDA_DSP_ADSPCS_CRST_SHIFT)
+
+/*
+ * Core run/stall - when set to '1' core is stalled
+ * CSTALL Mask for a given core mask pattern, cm
+ */
+#define HDA_DSP_ADSPCS_CSTALL_SHIFT	8
+#define HDA_DSP_ADSPCS_CSTALL_MASK(cm)	((cm) << HDA_DSP_ADSPCS_CSTALL_SHIFT)
+
+/*
+ * Set Power Active - when set to '1' turn cores on
+ * SPA Mask for a given core mask pattern, cm
+ */
+#define HDA_DSP_ADSPCS_SPA_SHIFT	16
+#define HDA_DSP_ADSPCS_SPA_MASK(cm)	((cm) << HDA_DSP_ADSPCS_SPA_SHIFT)
+
+/*
+ * Current Power Active - power status of cores, set by hardware
+ * CPA Mask for a given core mask pattern, cm
+ */
+#define HDA_DSP_ADSPCS_CPA_SHIFT	24
+#define HDA_DSP_ADSPCS_CPA_MASK(cm)	((cm) << HDA_DSP_ADSPCS_CPA_SHIFT)
+
+/* Mask for a given core index, c = 0.. number of supported cores - 1 */
+#define HDA_DSP_CORE_MASK(c)		BIT(c)
+
+/*
+ * Mask for a given number of cores
+ * nc = number of supported cores
+ */
+#define SOF_DSP_CORES_MASK(nc)	GENMASK(((nc) - 1), 0)
+
+/* Intel HD Audio Inter-Processor Communication Registers for Cannonlake*/
+#define CNL_DSP_IPC_BASE		0xc0
+#define CNL_DSP_REG_HIPCTDR		(CNL_DSP_IPC_BASE + 0x00)
+#define CNL_DSP_REG_HIPCTDA		(CNL_DSP_IPC_BASE + 0x04)
+#define CNL_DSP_REG_HIPCTDD		(CNL_DSP_IPC_BASE + 0x08)
+#define CNL_DSP_REG_HIPCIDR		(CNL_DSP_IPC_BASE + 0x10)
+#define CNL_DSP_REG_HIPCIDA		(CNL_DSP_IPC_BASE + 0x14)
+#define CNL_DSP_REG_HIPCCTL		(CNL_DSP_IPC_BASE + 0x28)
+
+/*  HIPCI */
+#define CNL_DSP_REG_HIPCIDR_BUSY		BIT(31)
+#define CNL_DSP_REG_HIPCIDR_MSG_MASK	0x7FFFFFFF
+
+/* HIPCIE */
+#define CNL_DSP_REG_HIPCIDA_DONE	BIT(31)
+#define CNL_DSP_REG_HIPCIDA_MSG_MASK	0x7FFFFFFF
+
+/* HIPCCTL */
+#define CNL_DSP_REG_HIPCCTL_DONE	BIT(1)
+#define CNL_DSP_REG_HIPCCTL_BUSY	BIT(0)
+
+/* HIPCT */
+#define CNL_DSP_REG_HIPCTDR_BUSY		BIT(31)
+#define CNL_DSP_REG_HIPCTDR_MSG_MASK	0x7FFFFFFF
+
+/* HIPCTDA */
+#define CNL_DSP_REG_HIPCTDA_DONE	BIT(31)
+#define CNL_DSP_REG_HIPCTDA_MSG_MASK	0x7FFFFFFF
+
+/* HIPCTDD */
+#define CNL_DSP_REG_HIPCTDD_MSG_MASK	0x7FFFFFFF
+
+/* BDL */
+#define HDA_DSP_BDL_SIZE			4096
+#define HDA_DSP_MAX_BDL_ENTRIES			\
+	(HDA_DSP_BDL_SIZE / sizeof(struct sof_intel_dsp_bdl))
+
+/* Number of DAIs */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+#define SOF_SKL_NUM_DAIS		14
+#else
+#define SOF_SKL_NUM_DAIS		8
+#endif
+
+/* Intel HD Audio SRAM Window 0*/
+#define HDA_ADSP_SRAM0_BASE_SKL		0x8000
+
+/* Firmware status window */
+#define HDA_ADSP_FW_STATUS_SKL		HDA_ADSP_SRAM0_BASE_SKL
+#define HDA_ADSP_ERROR_CODE_SKL		(HDA_ADSP_FW_STATUS_SKL + 0x4)
+
+#define HDA_IDISP_CODEC(x) ((x) & BIT(2))
+
+struct sof_intel_dsp_bdl {
+	__le32 addr_l;
+	__le32 addr_h;
+	__le32 size;
+	__le32 ioc;
+} __attribute((packed));
+
+#define SOF_HDA_PLAYBACK_STREAMS	16
+#define SOF_HDA_CAPTURE_STREAMS		16
+#define SOF_HDA_PLAYBACK		0
+#define SOF_HDA_CAPTURE			1
+
+/* represents DSP HDA controller frontend - i.e. host facing control */
+struct sof_intel_hda_dev {
+
+	struct hda_bus hbus;
+
+	/* hw config */
+	const struct sof_intel_dsp_desc *desc;
+
+	/* trace */
+	struct hdac_ext_stream *dtrace_stream;
+
+	/* if position update IPC needed */
+	u32 no_ipc_position;
+
+	int irq;
+
+	/* DMIC device */
+	struct platform_device *dmic_dev;
+};
+
+static inline struct hdac_bus *sof_to_bus(struct snd_sof_dev *s)
+{
+	struct sof_intel_hda_dev *hda = s->pdata->hw_pdata;
+
+	return &hda->hbus.core;
+}
+
+static inline struct hda_bus *sof_to_hbus(struct snd_sof_dev *s)
+{
+	struct sof_intel_hda_dev *hda = s->pdata->hw_pdata;
+
+	return &hda->hbus;
+}
+
+struct sof_intel_hda_stream {
+	struct hdac_ext_stream hda_stream;
+	struct sof_intel_stream stream;
+};
+
+#define bus_to_sof_hda(bus) \
+	container_of(bus, struct sof_intel_hda_dev, hbus.core)
+
+#define SOF_STREAM_SD_OFFSET(s) \
+	(SOF_HDA_ADSP_SD_ENTRY_SIZE * ((s)->index) \
+	 + SOF_HDA_ADSP_LOADER_BASE)
+
+/*
+ * DSP Core services.
+ */
+int hda_dsp_probe(struct snd_sof_dev *sdev);
+int hda_dsp_remove(struct snd_sof_dev *sdev);
+int hda_dsp_core_reset_enter(struct snd_sof_dev *sdev,
+			     unsigned int core_mask);
+int hda_dsp_core_reset_leave(struct snd_sof_dev *sdev,
+			     unsigned int core_mask);
+int hda_dsp_core_stall_reset(struct snd_sof_dev *sdev, unsigned int core_mask);
+int hda_dsp_core_run(struct snd_sof_dev *sdev, unsigned int core_mask);
+int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask);
+int hda_dsp_enable_core(struct snd_sof_dev *sdev, unsigned int core_mask);
+int hda_dsp_core_power_down(struct snd_sof_dev *sdev, unsigned int core_mask);
+bool hda_dsp_core_is_enabled(struct snd_sof_dev *sdev,
+			     unsigned int core_mask);
+int hda_dsp_core_reset_power_down(struct snd_sof_dev *sdev,
+				  unsigned int core_mask);
+void hda_dsp_ipc_int_enable(struct snd_sof_dev *sdev);
+void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev);
+
+int hda_dsp_suspend(struct snd_sof_dev *sdev, int state);
+int hda_dsp_resume(struct snd_sof_dev *sdev);
+int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev, int state);
+int hda_dsp_runtime_resume(struct snd_sof_dev *sdev);
+void hda_dsp_dump_skl(struct snd_sof_dev *sdev, u32 flags);
+void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags);
+
+/*
+ * DSP PCM Operations.
+ */
+int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
+		     struct snd_pcm_substream *substream);
+int hda_dsp_pcm_close(struct snd_sof_dev *sdev,
+		      struct snd_pcm_substream *substream);
+int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
+			  struct snd_pcm_substream *substream,
+			  struct snd_pcm_hw_params *params,
+			  struct sof_ipc_stream_params *ipc_params);
+int hda_dsp_pcm_trigger(struct snd_sof_dev *sdev,
+			struct snd_pcm_substream *substream, int cmd);
+snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
+				      struct snd_pcm_substream *substream);
+
+/*
+ * DSP Stream Operations.
+ */
+
+int hda_dsp_stream_init(struct snd_sof_dev *sdev);
+void hda_dsp_stream_free(struct snd_sof_dev *sdev);
+int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
+			     struct hdac_ext_stream *stream,
+			     struct snd_dma_buffer *dmab,
+			     struct snd_pcm_hw_params *params);
+int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
+			   struct hdac_ext_stream *stream, int cmd);
+irqreturn_t hda_dsp_stream_interrupt(int irq, void *context);
+irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context);
+int hda_dsp_stream_setup_bdl(struct snd_sof_dev *sdev,
+			     struct snd_dma_buffer *dmab,
+			     struct hdac_stream *stream);
+
+struct hdac_ext_stream *
+	hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction);
+int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag);
+int hda_dsp_stream_spib_config(struct snd_sof_dev *sdev,
+			       struct hdac_ext_stream *stream,
+			       int enable, u32 size);
+
+void hda_ipc_msg_data(struct snd_sof_dev *sdev,
+		      struct snd_pcm_substream *substream,
+		      void *p, size_t sz);
+int hda_ipc_pcm_params(struct snd_sof_dev *sdev,
+		       struct snd_pcm_substream *substream,
+		       const struct sof_ipc_pcm_params_reply *reply);
+
+/*
+ * DSP IPC Operations.
+ */
+int hda_dsp_ipc_send_msg(struct snd_sof_dev *sdev,
+			 struct snd_sof_ipc_msg *msg);
+void hda_dsp_ipc_get_reply(struct snd_sof_dev *sdev);
+int hda_dsp_ipc_fw_ready(struct snd_sof_dev *sdev, u32 msg_id);
+irqreturn_t hda_dsp_ipc_irq_handler(int irq, void *context);
+irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context);
+int hda_dsp_ipc_cmd_done(struct snd_sof_dev *sdev, int dir);
+
+/*
+ * DSP Code loader.
+ */
+int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev);
+int hda_dsp_cl_boot_firmware_skl(struct snd_sof_dev *sdev);
+
+/* pre and post fw run ops */
+int hda_dsp_pre_fw_run(struct snd_sof_dev *sdev);
+int hda_dsp_post_fw_run(struct snd_sof_dev *sdev);
+
+/*
+ * HDA Controller Operations.
+ */
+int hda_dsp_ctrl_get_caps(struct snd_sof_dev *sdev);
+void hda_dsp_ctrl_ppcap_enable(struct snd_sof_dev *sdev, bool enable);
+void hda_dsp_ctrl_ppcap_int_enable(struct snd_sof_dev *sdev, bool enable);
+int hda_dsp_ctrl_link_reset(struct snd_sof_dev *sdev, bool reset);
+void hda_dsp_ctrl_misc_clock_gating(struct snd_sof_dev *sdev, bool enable);
+int hda_dsp_ctrl_clock_power_gating(struct snd_sof_dev *sdev, bool enable);
+int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset);
+
+/*
+ * HDA bus operations.
+ */
+void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev,
+		      const struct hdac_ext_bus_ops *ext_ops);
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+/*
+ * HDA Codec operations.
+ */
+int hda_codec_probe_bus(struct snd_sof_dev *sdev);
+
+#endif /* CONFIG_SND_SOC_SOF_HDA */
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) && IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)
+
+void hda_codec_i915_get(struct snd_sof_dev *sdev);
+void hda_codec_i915_put(struct snd_sof_dev *sdev);
+int hda_codec_i915_init(struct snd_sof_dev *sdev);
+int hda_codec_i915_exit(struct snd_sof_dev *sdev);
+
+#else
+
+static inline void hda_codec_i915_get(struct snd_sof_dev *sdev)  { }
+static inline void hda_codec_i915_put(struct snd_sof_dev *sdev)  { }
+static inline int hda_codec_i915_init(struct snd_sof_dev *sdev) { return 0; }
+static inline int hda_codec_i915_exit(struct snd_sof_dev *sdev) { return 0; }
+
+#endif /* CONFIG_SND_SOC_SOF_HDA && CONFIG_SND_SOC_HDAC_HDMI */
+
+/*
+ * Trace Control.
+ */
+int hda_dsp_trace_init(struct snd_sof_dev *sdev, u32 *stream_tag);
+int hda_dsp_trace_release(struct snd_sof_dev *sdev);
+int hda_dsp_trace_trigger(struct snd_sof_dev *sdev, int cmd);
+
+/* common dai driver */
+extern struct snd_soc_dai_driver skl_dai[];
+
+/*
+ * Platform Specific HW abstraction Ops.
+ */
+extern const struct snd_sof_dsp_ops sof_apl_ops;
+extern const struct snd_sof_dsp_ops sof_cnl_ops;
+extern const struct snd_sof_dsp_ops sof_skl_ops;
+
+extern const struct sof_intel_dsp_desc apl_chip_info;
+extern const struct sof_intel_dsp_desc cnl_chip_info;
+extern const struct sof_intel_dsp_desc skl_chip_info;
+
+#endif
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
