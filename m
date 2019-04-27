Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0D6B447
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:21:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72CA716F3;
	Sat, 27 Apr 2019 20:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72CA716F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556389265;
	bh=gtmwdxWOdKGDd4sgFYUrMg+7Asb5s/eWr6cwvTSfhN4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Y2GLqnytl2nb0DegjdXSoyg/3KVqx8We/p5pQpvq06e1jAAlN/lY+tTQtrtLymknI
	 4NM0a0hS+XYI/YS8L7Dc31yT7lxD94CEZ2MsBPPL0H7LTvhO0APDHehA7hXysFrHW8
	 IgqS87lYmlStr5TkXJ/PhcKAFo/fT6hTqcm96unU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4C11F8988F;
	Sat, 27 Apr 2019 19:55:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29622F89779; Sat, 27 Apr 2019 19:54:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D39F5F89710;
 Sat, 27 Apr 2019 19:53:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D39F5F89710
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="kT8x1b6C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=hmHkKcrGZHW2afjYnFkj6E0imZ21iaSWPPG0JnLwpv8=; b=kT8x1b6CgKWK
 hyok8qEbAQCFPdvw03WMQm4k2nI3pEO7LsrLNXooYOxydp3J4xzV1777KNgoRwF/wKSbYDd5j1+lC
 3CiwsBc8JBTi3tPGlG3RIbzDzA5CaNGUpA3dWrRBPz+ZLWi2GYwcg2okbKpVnoVT476Zcczog4zGK
 tkjp4=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVg-0004rd-C4; Sat, 27 Apr 2019 17:53:12 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 62AE3441D57; Sat, 27 Apr 2019 18:53:04 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160519.30207-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175304.62AE3441D57@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:53:04 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Add Sound Open Firmware driver
	core" to the asoc tree
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

   ASoC: SOF: Add Sound Open Firmware driver core

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

From c16211d6226dbde8819b84da07508083a1138a06 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:05:06 -0500
Subject: [PATCH] ASoC: SOF: Add Sound Open Firmware driver core

The Sound Open Firmware driver core is a generic architecture
independent layer that allows SOF to be used on many different
architectures and platforms. It abstracts DSP operations and IO
methods so that the target DSP can be an internal memory mapped or
external SPI or I2C based device. This abstraction also allows SOF to
be run on many different VMs on the same physical HW.

SOF also requires some data in ASoC PCM runtime data for looking up
SOF data during ASoC PCM operations.

Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof.h      |  94 ++++++
 sound/soc/sof/core.c     | 506 +++++++++++++++++++++++++++++++
 sound/soc/sof/sof-priv.h | 632 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 1232 insertions(+)
 create mode 100644 include/sound/sof.h
 create mode 100644 sound/soc/sof/core.c
 create mode 100644 sound/soc/sof/sof-priv.h

diff --git a/include/sound/sof.h b/include/sound/sof.h
new file mode 100644
index 000000000000..54f65ec33a6c
--- /dev/null
+++ b/include/sound/sof.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ *
+ * Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+ */
+
+#ifndef __INCLUDE_SOUND_SOF_H
+#define __INCLUDE_SOUND_SOF_H
+
+#include <linux/pci.h>
+#include <sound/soc-acpi.h>
+
+struct snd_sof_dsp_ops;
+
+/*
+ * SOF Platform data.
+ */
+struct snd_sof_pdata {
+	const struct firmware *fw;
+	const char *drv_name;
+	const char *name;
+	const char *platform;
+
+	struct device *dev;
+
+	/*
+	 * notification callback used if the hardware initialization
+	 * can take time or is handled in a workqueue. This callback
+	 * can be used by the caller to e.g. enable runtime_pm
+	 * or limit functionality until all low-level inits are
+	 * complete.
+	 */
+	void (*sof_probe_complete)(struct device *dev);
+
+	/* descriptor */
+	const struct sof_dev_desc *desc;
+
+	/* firmware and topology filenames */
+	const char *fw_filename_prefix;
+	const char *fw_filename;
+	const char *tplg_filename_prefix;
+	const char *tplg_filename;
+
+	/* machine */
+	struct platform_device *pdev_mach;
+	const struct snd_soc_acpi_mach *machine;
+
+	void *hw_pdata;
+};
+
+/*
+ * Descriptor used for setting up SOF platform data. This is used when
+ * ACPI/PCI data is missing or mapped differently.
+ */
+struct sof_dev_desc {
+	/* list of machines using this configuration */
+	struct snd_soc_acpi_mach *machines;
+
+	/* Platform resource indexes in BAR / ACPI resources. */
+	/* Must set to -1 if not used - add new items to end */
+	int resindex_lpe_base;
+	int resindex_pcicfg_base;
+	int resindex_imr_base;
+	int irqindex_host_ipc;
+	int resindex_dma_base;
+
+	/* DMA only valid when resindex_dma_base != -1*/
+	int dma_engine;
+	int dma_size;
+
+	/* IPC timeouts in ms */
+	int ipc_timeout;
+	int boot_timeout;
+
+	/* chip information for dsp */
+	const void *chip_info;
+
+	/* defaults for no codec mode */
+	const char *nocodec_fw_filename;
+	const char *nocodec_tplg_filename;
+
+	/* defaults paths for firmware and topology files */
+	const char *default_fw_path;
+	const char *default_tplg_path;
+
+	const struct snd_sof_dsp_ops *ops;
+	const struct sof_arch_ops *arch_ops;
+};
+
+#endif
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
new file mode 100644
index 000000000000..39cbd84ff9c8
--- /dev/null
+++ b/sound/soc/sof/core.c
@@ -0,0 +1,506 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018 Intel Corporation. All rights reserved.
+//
+// Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+//
+
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <asm/unaligned.h>
+#include <sound/soc.h>
+#include <sound/sof.h>
+#include "sof-priv.h"
+#include "ops.h"
+
+/* SOF defaults if not provided by the platform in ms */
+#define TIMEOUT_DEFAULT_IPC_MS  5
+#define TIMEOUT_DEFAULT_BOOT_MS 100
+
+/*
+ * Generic object lookup APIs.
+ */
+
+struct snd_sof_pcm *snd_sof_find_spcm_name(struct snd_sof_dev *sdev,
+					   const char *name)
+{
+	struct snd_sof_pcm *spcm;
+
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		/* match with PCM dai name */
+		if (strcmp(spcm->pcm.dai_name, name) == 0)
+			return spcm;
+
+		/* match with playback caps name if set */
+		if (*spcm->pcm.caps[0].name &&
+		    !strcmp(spcm->pcm.caps[0].name, name))
+			return spcm;
+
+		/* match with capture caps name if set */
+		if (*spcm->pcm.caps[1].name &&
+		    !strcmp(spcm->pcm.caps[1].name, name))
+			return spcm;
+	}
+
+	return NULL;
+}
+
+struct snd_sof_pcm *snd_sof_find_spcm_comp(struct snd_sof_dev *sdev,
+					   unsigned int comp_id,
+					   int *direction)
+{
+	struct snd_sof_pcm *spcm;
+
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		if (spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].comp_id == comp_id) {
+			*direction = SNDRV_PCM_STREAM_PLAYBACK;
+			return spcm;
+		}
+		if (spcm->stream[SNDRV_PCM_STREAM_CAPTURE].comp_id == comp_id) {
+			*direction = SNDRV_PCM_STREAM_CAPTURE;
+			return spcm;
+		}
+	}
+
+	return NULL;
+}
+
+struct snd_sof_pcm *snd_sof_find_spcm_pcm_id(struct snd_sof_dev *sdev,
+					     unsigned int pcm_id)
+{
+	struct snd_sof_pcm *spcm;
+
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		if (le32_to_cpu(spcm->pcm.pcm_id) == pcm_id)
+			return spcm;
+	}
+
+	return NULL;
+}
+
+struct snd_sof_widget *snd_sof_find_swidget(struct snd_sof_dev *sdev,
+					    const char *name)
+{
+	struct snd_sof_widget *swidget;
+
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
+		if (strcmp(name, swidget->widget->name) == 0)
+			return swidget;
+	}
+
+	return NULL;
+}
+
+/* find widget by stream name and direction */
+struct snd_sof_widget *snd_sof_find_swidget_sname(struct snd_sof_dev *sdev,
+						  const char *pcm_name, int dir)
+{
+	struct snd_sof_widget *swidget;
+	enum snd_soc_dapm_type type;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		type = snd_soc_dapm_aif_in;
+	else
+		type = snd_soc_dapm_aif_out;
+
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
+		if (!strcmp(pcm_name, swidget->widget->sname) && swidget->id == type)
+			return swidget;
+	}
+
+	return NULL;
+}
+
+struct snd_sof_dai *snd_sof_find_dai(struct snd_sof_dev *sdev,
+				     const char *name)
+{
+	struct snd_sof_dai *dai;
+
+	list_for_each_entry(dai, &sdev->dai_list, list) {
+		if (dai->name && (strcmp(name, dai->name) == 0))
+			return dai;
+	}
+
+	return NULL;
+}
+
+/*
+ * FW Panic/fault handling.
+ */
+
+struct sof_panic_msg {
+	u32 id;
+	const char *msg;
+};
+
+/* standard FW panic types */
+static const struct sof_panic_msg panic_msg[] = {
+	{SOF_IPC_PANIC_MEM, "out of memory"},
+	{SOF_IPC_PANIC_WORK, "work subsystem init failed"},
+	{SOF_IPC_PANIC_IPC, "IPC subsystem init failed"},
+	{SOF_IPC_PANIC_ARCH, "arch init failed"},
+	{SOF_IPC_PANIC_PLATFORM, "platform init failed"},
+	{SOF_IPC_PANIC_TASK, "scheduler init failed"},
+	{SOF_IPC_PANIC_EXCEPTION, "runtime exception"},
+	{SOF_IPC_PANIC_DEADLOCK, "deadlock"},
+	{SOF_IPC_PANIC_STACK, "stack overflow"},
+	{SOF_IPC_PANIC_IDLE, "can't enter idle"},
+	{SOF_IPC_PANIC_WFI, "invalid wait state"},
+	{SOF_IPC_PANIC_ASSERT, "assertion failed"},
+};
+
+/*
+ * helper to be called from .dbg_dump callbacks. No error code is
+ * provided, it's left as an exercise for the caller of .dbg_dump
+ * (typically IPC or loader)
+ */
+void snd_sof_get_status(struct snd_sof_dev *sdev, u32 panic_code,
+			u32 tracep_code, void *oops,
+			struct sof_ipc_panic_info *panic_info,
+			void *stack, size_t stack_words)
+{
+	u32 code;
+	int i;
+
+	/* is firmware dead ? */
+	if ((panic_code & SOF_IPC_PANIC_MAGIC_MASK) != SOF_IPC_PANIC_MAGIC) {
+		dev_err(sdev->dev, "error: unexpected fault 0x%8.8x trace 0x%8.8x\n",
+			panic_code, tracep_code);
+		return; /* no fault ? */
+	}
+
+	code = panic_code & (SOF_IPC_PANIC_MAGIC_MASK | SOF_IPC_PANIC_CODE_MASK);
+
+	for (i = 0; i < ARRAY_SIZE(panic_msg); i++) {
+		if (panic_msg[i].id == code) {
+			dev_err(sdev->dev, "error: %s\n", panic_msg[i].msg);
+			dev_err(sdev->dev, "error: trace point %8.8x\n",
+				tracep_code);
+			goto out;
+		}
+	}
+
+	/* unknown error */
+	dev_err(sdev->dev, "error: unknown reason %8.8x\n", panic_code);
+	dev_err(sdev->dev, "error: trace point %8.8x\n", tracep_code);
+
+out:
+	dev_err(sdev->dev, "error: panic at %s:%d\n",
+		panic_info->filename, panic_info->linenum);
+	sof_oops(sdev, oops);
+	sof_stack(sdev, oops, stack, stack_words);
+}
+EXPORT_SYMBOL(snd_sof_get_status);
+
+/*
+ * Generic buffer page table creation.
+ * Take the each physical page address and drop the least significant unused
+ * bits from each (based on PAGE_SIZE). Then pack valid page address bits
+ * into compressed page table.
+ */
+
+int snd_sof_create_page_table(struct snd_sof_dev *sdev,
+			      struct snd_dma_buffer *dmab,
+			      unsigned char *page_table, size_t size)
+{
+	int i, pages;
+
+	pages = snd_sgbuf_aligned_pages(size);
+
+	dev_dbg(sdev->dev, "generating page table for %p size 0x%zx pages %d\n",
+		dmab->area, size, pages);
+
+	for (i = 0; i < pages; i++) {
+		/*
+		 * The number of valid address bits for each page is 20.
+		 * idx determines the byte position within page_table
+		 * where the current page's address is stored
+		 * in the compressed page_table.
+		 * This can be calculated by multiplying the page number by 2.5.
+		 */
+		u32 idx = (5 * i) >> 1;
+		u32 pfn = snd_sgbuf_get_addr(dmab, i * PAGE_SIZE) >> PAGE_SHIFT;
+		u8 *pg_table;
+
+		dev_vdbg(sdev->dev, "pfn i %i idx %d pfn %x\n", i, idx, pfn);
+
+		pg_table = (u8 *)(page_table + idx);
+
+		/*
+		 * pagetable compression:
+		 * byte 0     byte 1     byte 2     byte 3     byte 4     byte 5
+		 * ___________pfn 0__________ __________pfn 1___________  _pfn 2...
+		 * .... ....  .... ....  .... ....  .... ....  .... ....  ....
+		 * It is created by:
+		 * 1. set current location to 0, PFN index i to 0
+		 * 2. put pfn[i] at current location in Little Endian byte order
+		 * 3. calculate an intermediate value as
+		 *    x = (pfn[i+1] << 4) | (pfn[i] & 0xf)
+		 * 4. put x at offset (current location + 2) in LE byte order
+		 * 5. increment current location by 5 bytes, increment i by 2
+		 * 6. continue to (2)
+		 */
+		if (i & 1)
+			put_unaligned_le32((pg_table[0] & 0xf) | pfn << 4,
+					   pg_table);
+		else
+			put_unaligned_le32(pfn, pg_table);
+	}
+
+	return pages;
+}
+
+/*
+ * SOF Driver enumeration.
+ */
+static int sof_machine_check(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *plat_data = sdev->pdata;
+	struct snd_soc_acpi_mach *machine;
+	int ret;
+
+	if (plat_data->machine)
+		return 0;
+
+	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)) {
+		dev_err(sdev->dev, "error: no matching ASoC machine driver found - aborting probe\n");
+		return -ENODEV;
+	}
+
+	/* fallback to nocodec mode */
+	dev_warn(sdev->dev, "No ASoC machine driver found - using nocodec\n");
+	machine = devm_kzalloc(sdev->dev, sizeof(*machine), GFP_KERNEL);
+	if (!machine)
+		return -ENOMEM;
+
+	ret = sof_nocodec_setup(sdev->dev, plat_data, machine,
+				plat_data->desc, plat_data->desc->ops);
+	if (ret < 0)
+		return ret;
+
+	plat_data->machine = machine;
+
+	return 0;
+}
+
+static int sof_probe_continue(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *plat_data = sdev->pdata;
+	const char *drv_name;
+	const void *mach;
+	int size;
+	int ret;
+
+	/* probe the DSP hardware */
+	ret = snd_sof_probe(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to probe DSP %d\n", ret);
+		return ret;
+	}
+
+	/* check machine info */
+	ret = sof_machine_check(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to get machine info %d\n",
+			ret);
+		goto dbg_err;
+	}
+
+	/* set up platform component driver */
+	snd_sof_new_platform_drv(sdev);
+
+	/* register any debug/trace capabilities */
+	ret = snd_sof_dbg_init(sdev);
+	if (ret < 0) {
+		/*
+		 * debugfs issues are suppressed in snd_sof_dbg_init() since
+		 * we cannot rely on debugfs
+		 * here we trap errors due to memory allocation only.
+		 */
+		dev_err(sdev->dev, "error: failed to init DSP trace/debug %d\n",
+			ret);
+		goto dbg_err;
+	}
+
+	/* init the IPC */
+	sdev->ipc = snd_sof_ipc_init(sdev);
+	if (!sdev->ipc) {
+		dev_err(sdev->dev, "error: failed to init DSP IPC %d\n", ret);
+		goto ipc_err;
+	}
+
+	/* load the firmware */
+	ret = snd_sof_load_firmware(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to load DSP firmware %d\n",
+			ret);
+		goto fw_load_err;
+	}
+
+	/* boot the firmware */
+	ret = snd_sof_run_firmware(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to boot DSP firmware %d\n",
+			ret);
+		goto fw_run_err;
+	}
+
+	/* init DMA trace */
+	ret = snd_sof_init_trace(sdev);
+	if (ret < 0) {
+		/* non fatal */
+		dev_warn(sdev->dev,
+			 "warning: failed to initialize trace %d\n", ret);
+	}
+
+	/* hereafter all FW boot flows are for PM reasons */
+	sdev->first_boot = false;
+
+	/* now register audio DSP platform driver and dai */
+	ret = devm_snd_soc_register_component(sdev->dev, &sdev->plat_drv,
+					      sof_ops(sdev)->drv,
+					      sof_ops(sdev)->num_drv);
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: failed to register DSP DAI driver %d\n", ret);
+		goto fw_run_err;
+	}
+
+	drv_name = plat_data->machine->drv_name;
+	mach = (const void *)plat_data->machine;
+	size = sizeof(*plat_data->machine);
+
+	/* register machine driver, pass machine info as pdata */
+	plat_data->pdev_mach =
+		platform_device_register_data(sdev->dev, drv_name,
+					      PLATFORM_DEVID_NONE, mach, size);
+
+	if (IS_ERR(plat_data->pdev_mach)) {
+		ret = PTR_ERR(plat_data->pdev_mach);
+		goto comp_err;
+	}
+
+	dev_dbg(sdev->dev, "created machine %s\n",
+		dev_name(&plat_data->pdev_mach->dev));
+
+	if (plat_data->sof_probe_complete)
+		plat_data->sof_probe_complete(sdev->dev);
+
+	return 0;
+
+comp_err:
+	snd_soc_unregister_component(sdev->dev);
+fw_run_err:
+	snd_sof_fw_unload(sdev);
+fw_load_err:
+	snd_sof_ipc_free(sdev);
+ipc_err:
+	snd_sof_free_debug(sdev);
+dbg_err:
+	snd_sof_remove(sdev);
+
+	return ret;
+}
+
+static void sof_probe_work(struct work_struct *work)
+{
+	struct snd_sof_dev *sdev =
+		container_of(work, struct snd_sof_dev, probe_work);
+	int ret;
+
+	ret = sof_probe_continue(sdev);
+	if (ret < 0) {
+		/* errors cannot be propagated, log */
+		dev_err(sdev->dev, "error: %s failed err: %d\n", __func__, ret);
+	}
+}
+
+int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
+{
+	struct snd_sof_dev *sdev;
+
+	sdev = devm_kzalloc(dev, sizeof(*sdev), GFP_KERNEL);
+	if (!sdev)
+		return -ENOMEM;
+
+	/* initialize sof device */
+	sdev->dev = dev;
+
+	sdev->pdata = plat_data;
+	sdev->first_boot = true;
+	dev_set_drvdata(dev, sdev);
+
+	/* check all mandatory ops */
+	if (!sof_ops(sdev) || !sof_ops(sdev)->probe || !sof_ops(sdev)->run ||
+	    !sof_ops(sdev)->block_read || !sof_ops(sdev)->block_write ||
+	    !sof_ops(sdev)->send_msg || !sof_ops(sdev)->load_firmware ||
+	    !sof_ops(sdev)->ipc_msg_data || !sof_ops(sdev)->ipc_pcm_params)
+		return -EINVAL;
+
+	INIT_LIST_HEAD(&sdev->pcm_list);
+	INIT_LIST_HEAD(&sdev->kcontrol_list);
+	INIT_LIST_HEAD(&sdev->widget_list);
+	INIT_LIST_HEAD(&sdev->dai_list);
+	INIT_LIST_HEAD(&sdev->route_list);
+	spin_lock_init(&sdev->ipc_lock);
+	spin_lock_init(&sdev->hw_lock);
+
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
+		INIT_WORK(&sdev->probe_work, sof_probe_work);
+
+	/* set default timeouts if none provided */
+	if (plat_data->desc->ipc_timeout == 0)
+		sdev->ipc_timeout = TIMEOUT_DEFAULT_IPC_MS;
+	else
+		sdev->ipc_timeout = plat_data->desc->ipc_timeout;
+	if (plat_data->desc->boot_timeout == 0)
+		sdev->boot_timeout = TIMEOUT_DEFAULT_BOOT_MS;
+	else
+		sdev->boot_timeout = plat_data->desc->boot_timeout;
+
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)) {
+		schedule_work(&sdev->probe_work);
+		return 0;
+	}
+
+	return sof_probe_continue(sdev);
+}
+EXPORT_SYMBOL(snd_sof_device_probe);
+
+int snd_sof_device_remove(struct device *dev)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct snd_sof_pdata *pdata = sdev->pdata;
+
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
+		cancel_work_sync(&sdev->probe_work);
+
+	snd_sof_fw_unload(sdev);
+	snd_sof_ipc_free(sdev);
+	snd_sof_free_debug(sdev);
+	snd_sof_free_trace(sdev);
+	snd_sof_remove(sdev);
+
+	/*
+	 * Unregister machine driver. This will unbind the snd_card which
+	 * will remove the component driver and unload the topology
+	 * before freeing the snd_card.
+	 */
+	if (!IS_ERR_OR_NULL(pdata->pdev_mach))
+		platform_device_unregister(pdata->pdev_mach);
+
+	/* release firmware */
+	release_firmware(pdata->fw);
+	pdata->fw = NULL;
+
+	return 0;
+}
+EXPORT_SYMBOL(snd_sof_device_remove);
+
+MODULE_AUTHOR("Liam Girdwood");
+MODULE_DESCRIPTION("Sound Open Firmware (SOF) Core");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("platform:sof-audio");
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
new file mode 100644
index 000000000000..35e78ffecce2
--- /dev/null
+++ b/sound/soc/sof/sof-priv.h
@@ -0,0 +1,632 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ *
+ * Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+ */
+
+#ifndef __SOUND_SOC_SOF_PRIV_H
+#define __SOUND_SOC_SOF_PRIV_H
+
+#include <linux/device.h>
+
+#include <sound/hdaudio.h>
+#include <sound/soc.h>
+
+#include <sound/sof.h>
+#include <sound/sof/stream.h> /* needs to be included before control.h */
+#include <sound/sof/control.h>
+#include <sound/sof/dai.h>
+#include <sound/sof/info.h>
+#include <sound/sof/pm.h>
+#include <sound/sof/topology.h>
+#include <sound/sof/trace.h>
+
+#include <uapi/sound/sof/fw.h>
+
+/* debug flags */
+#define SOF_DBG_REGS	BIT(1)
+#define SOF_DBG_MBOX	BIT(2)
+#define SOF_DBG_TEXT	BIT(3)
+#define SOF_DBG_PCI	BIT(4)
+
+/* max BARs mmaped devices can use */
+#define SND_SOF_BARS	8
+
+/* time in ms for runtime suspend delay */
+#define SND_SOF_SUSPEND_DELAY_MS	2000
+
+/* DMA buffer size for trace */
+#define DMA_BUF_SIZE_FOR_TRACE (PAGE_SIZE * 16)
+
+/* max number of FE PCMs before BEs */
+#define SOF_BE_PCM_BASE		16
+
+#define SOF_IPC_DSP_REPLY		0
+#define SOF_IPC_HOST_REPLY		1
+
+/* convenience constructor for DAI driver streams */
+#define SOF_DAI_STREAM(sname, scmin, scmax, srates, sfmt) \
+	{.stream_name = sname, .channels_min = scmin, .channels_max = scmax, \
+	 .rates = srates, .formats = sfmt}
+
+#define SOF_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
+	SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_FLOAT)
+
+struct snd_sof_dev;
+struct snd_sof_ipc_msg;
+struct snd_sof_ipc;
+struct snd_sof_debugfs_map;
+struct snd_soc_tplg_ops;
+struct snd_soc_component;
+struct snd_sof_pdata;
+
+/*
+ * SOF DSP HW abstraction operations.
+ * Used to abstract DSP HW architecture and any IO busses between host CPU
+ * and DSP device(s).
+ */
+struct snd_sof_dsp_ops {
+
+	/* probe and remove */
+	int (*probe)(struct snd_sof_dev *sof_dev); /* mandatory */
+	int (*remove)(struct snd_sof_dev *sof_dev); /* optional */
+
+	/* DSP core boot / reset */
+	int (*run)(struct snd_sof_dev *sof_dev); /* mandatory */
+	int (*stall)(struct snd_sof_dev *sof_dev); /* optional */
+	int (*reset)(struct snd_sof_dev *sof_dev); /* optional */
+	int (*core_power_up)(struct snd_sof_dev *sof_dev,
+			     unsigned int core_mask); /* optional */
+	int (*core_power_down)(struct snd_sof_dev *sof_dev,
+			       unsigned int core_mask); /* optional */
+
+	/*
+	 * Register IO: only used by respective drivers themselves,
+	 * TODO: consider removing these operations and calling respective
+	 * implementations directly
+	 */
+	void (*write)(struct snd_sof_dev *sof_dev, void __iomem *addr,
+		      u32 value); /* optional */
+	u32 (*read)(struct snd_sof_dev *sof_dev,
+		    void __iomem *addr); /* optional */
+	void (*write64)(struct snd_sof_dev *sof_dev, void __iomem *addr,
+			u64 value); /* optional */
+	u64 (*read64)(struct snd_sof_dev *sof_dev,
+		      void __iomem *addr); /* optional */
+
+	/* memcpy IO */
+	void (*block_read)(struct snd_sof_dev *sof_dev, u32 bar,
+			   u32 offset, void *dest,
+			   size_t size); /* mandatory */
+	void (*block_write)(struct snd_sof_dev *sof_dev, u32 bar,
+			    u32 offset, void *src,
+			    size_t size); /* mandatory */
+
+	/* doorbell */
+	irqreturn_t (*irq_handler)(int irq, void *context); /* optional */
+	irqreturn_t (*irq_thread)(int irq, void *context); /* optional */
+
+	/* ipc */
+	int (*send_msg)(struct snd_sof_dev *sof_dev,
+			struct snd_sof_ipc_msg *msg); /* mandatory */
+
+	/* FW loading */
+	int (*load_firmware)(struct snd_sof_dev *sof_dev); /* mandatory */
+	int (*load_module)(struct snd_sof_dev *sof_dev,
+			   struct snd_sof_mod_hdr *hdr); /* optional */
+	/*
+	 * FW ready checks for ABI compatibility and creates
+	 * memory windows at first boot
+	 */
+	int (*fw_ready)(struct snd_sof_dev *sdev, u32 msg_id); /* optional */
+
+	/* connect pcm substream to a host stream */
+	int (*pcm_open)(struct snd_sof_dev *sdev,
+			struct snd_pcm_substream *substream); /* optional */
+	/* disconnect pcm substream to a host stream */
+	int (*pcm_close)(struct snd_sof_dev *sdev,
+			 struct snd_pcm_substream *substream); /* optional */
+
+	/* host stream hw params */
+	int (*pcm_hw_params)(struct snd_sof_dev *sdev,
+			     struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct sof_ipc_stream_params *ipc_params); /* optional */
+
+	/* host stream trigger */
+	int (*pcm_trigger)(struct snd_sof_dev *sdev,
+			   struct snd_pcm_substream *substream,
+			   int cmd); /* optional */
+
+	/* host stream pointer */
+	snd_pcm_uframes_t (*pcm_pointer)(struct snd_sof_dev *sdev,
+					 struct snd_pcm_substream *substream); /* optional */
+
+	/* host read DSP stream data */
+	void (*ipc_msg_data)(struct snd_sof_dev *sdev,
+			     struct snd_pcm_substream *substream,
+			     void *p, size_t sz); /* mandatory */
+
+	/* host configure DSP HW parameters */
+	int (*ipc_pcm_params)(struct snd_sof_dev *sdev,
+			      struct snd_pcm_substream *substream,
+			      const struct sof_ipc_pcm_params_reply *reply); /* mandatory */
+
+	/* pre/post firmware run */
+	int (*pre_fw_run)(struct snd_sof_dev *sof_dev); /* optional */
+	int (*post_fw_run)(struct snd_sof_dev *sof_dev); /* optional */
+
+	/* DSP PM */
+	int (*suspend)(struct snd_sof_dev *sof_dev, int state); /* optional */
+	int (*resume)(struct snd_sof_dev *sof_dev); /* optional */
+	int (*runtime_suspend)(struct snd_sof_dev *sof_dev,
+			       int state); /* optional */
+	int (*runtime_resume)(struct snd_sof_dev *sof_dev); /* optional */
+
+	/* DSP clocking */
+	int (*set_clk)(struct snd_sof_dev *sof_dev, u32 freq); /* optional */
+
+	/* debug */
+	const struct snd_sof_debugfs_map *debug_map; /* optional */
+	int debug_map_count; /* optional */
+	void (*dbg_dump)(struct snd_sof_dev *sof_dev,
+			 u32 flags); /* optional */
+
+	/* host DMA trace initialization */
+	int (*trace_init)(struct snd_sof_dev *sdev,
+			  u32 *stream_tag); /* optional */
+	int (*trace_release)(struct snd_sof_dev *sdev); /* optional */
+	int (*trace_trigger)(struct snd_sof_dev *sdev,
+			     int cmd); /* optional */
+
+	/* DAI ops */
+	struct snd_soc_dai_driver *drv;
+	int num_drv;
+};
+
+/* DSP architecture specific callbacks for oops and stack dumps */
+struct sof_arch_ops {
+	void (*dsp_oops)(struct snd_sof_dev *sdev, void *oops);
+	void (*dsp_stack)(struct snd_sof_dev *sdev, void *oops,
+			  u32 *stack, u32 stack_words);
+};
+
+#define sof_arch_ops(sdev) ((sdev)->pdata->desc->arch_ops)
+
+/* DSP device HW descriptor mapping between bus ID and ops */
+struct sof_ops_table {
+	const struct sof_dev_desc *desc;
+	const struct snd_sof_dsp_ops *ops;
+};
+
+enum sof_dfsentry_type {
+	SOF_DFSENTRY_TYPE_IOMEM = 0,
+	SOF_DFSENTRY_TYPE_BUF,
+};
+
+enum sof_debugfs_access_type {
+	SOF_DEBUGFS_ACCESS_ALWAYS = 0,
+	SOF_DEBUGFS_ACCESS_D0_ONLY,
+};
+
+/* FS entry for debug files that can expose DSP memories, registers */
+struct snd_sof_dfsentry {
+	struct dentry *dfsentry;
+	size_t size;
+	enum sof_dfsentry_type type;
+	/*
+	 * access_type specifies if the
+	 * memory -> DSP resource (memory, register etc) is always accessible
+	 * or if it is accessible only when the DSP is in D0.
+	 */
+	enum sof_debugfs_access_type access_type;
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE)
+	char *cache_buf; /* buffer to cache the contents of debugfs memory */
+#endif
+	struct snd_sof_dev *sdev;
+	struct list_head list;  /* list in sdev dfsentry list */
+	union {
+		void __iomem *io_mem;
+		void *buf;
+	};
+};
+
+/* Debug mapping for any DSP memory or registers that can used for debug */
+struct snd_sof_debugfs_map {
+	const char *name;
+	u32 bar;
+	u32 offset;
+	u32 size;
+	/*
+	 * access_type specifies if the memory is always accessible
+	 * or if it is accessible only when the DSP is in D0.
+	 */
+	enum sof_debugfs_access_type access_type;
+};
+
+/* mailbox descriptor, used for host <-> DSP IPC */
+struct snd_sof_mailbox {
+	u32 offset;
+	size_t size;
+};
+
+/* IPC message descriptor for host <-> DSP IO */
+struct snd_sof_ipc_msg {
+	/* message data */
+	u32 header;
+	void *msg_data;
+	void *reply_data;
+	size_t msg_size;
+	size_t reply_size;
+	int reply_error;
+
+	wait_queue_head_t waitq;
+	bool ipc_complete;
+};
+
+/* PCM stream, mapped to FW component  */
+struct snd_sof_pcm_stream {
+	u32 comp_id;
+	struct snd_dma_buffer page_table;
+	struct sof_ipc_stream_posn posn;
+	struct snd_pcm_substream *substream;
+};
+
+/* ALSA SOF PCM device */
+struct snd_sof_pcm {
+	struct snd_sof_dev *sdev;
+	struct snd_soc_tplg_pcm pcm;
+	struct snd_sof_pcm_stream stream[2];
+	struct list_head list;	/* list in sdev pcm list */
+	struct snd_pcm_hw_params params[2];
+	int hw_params_upon_resume[2]; /* set up hw_params upon resume */
+};
+
+/* ALSA SOF Kcontrol device */
+struct snd_sof_control {
+	struct snd_sof_dev *sdev;
+	int comp_id;
+	int num_channels;
+	u32 readback_offset; /* offset to mmaped data if used */
+	struct sof_ipc_ctrl_data *control_data;
+	u32 size;	/* cdata size */
+	enum sof_ipc_ctrl_cmd cmd;
+	u32 *volume_table; /* volume table computed from tlv data*/
+
+	struct list_head list;	/* list in sdev control list */
+};
+
+/* ASoC SOF DAPM widget */
+struct snd_sof_widget {
+	struct snd_sof_dev *sdev;
+	int comp_id;
+	int pipeline_id;
+	int complete;
+	int id;
+
+	struct snd_soc_dapm_widget *widget;
+	struct list_head list;	/* list in sdev widget list */
+
+	void *private;		/* core does not touch this */
+};
+
+/* ASoC SOF DAPM route */
+struct snd_sof_route {
+	struct snd_sof_dev *sdev;
+
+	struct snd_soc_dapm_route *route;
+	struct list_head list;	/* list in sdev route list */
+
+	void *private;
+};
+
+/* ASoC DAI device */
+struct snd_sof_dai {
+	struct snd_sof_dev *sdev;
+	const char *name;
+
+	struct sof_ipc_comp_dai comp_dai;
+	struct sof_ipc_dai_config *dai_config;
+	struct list_head list;	/* list in sdev dai list */
+};
+
+/*
+ * SOF Device Level.
+ */
+struct snd_sof_dev {
+	struct device *dev;
+	spinlock_t ipc_lock;	/* lock for IPC users */
+	spinlock_t hw_lock;	/* lock for HW IO access */
+
+	/*
+	 * ASoC components. plat_drv fields are set dynamically so
+	 * can't use const
+	 */
+	struct snd_soc_component_driver plat_drv;
+
+	/* DSP firmware boot */
+	wait_queue_head_t boot_wait;
+	u32 boot_complete;
+	u32 first_boot;
+
+	/* work queue in case the probe is implemented in two steps */
+	struct work_struct probe_work;
+
+	/* DSP HW differentiation */
+	struct snd_sof_pdata *pdata;
+
+	/* IPC */
+	struct snd_sof_ipc *ipc;
+	struct snd_sof_mailbox dsp_box;		/* DSP initiated IPC */
+	struct snd_sof_mailbox host_box;	/* Host initiated IPC */
+	struct snd_sof_mailbox stream_box;	/* Stream position update */
+	struct snd_sof_ipc_msg *msg;
+	u64 irq_status;
+	int ipc_irq;
+	u32 next_comp_id; /* monotonic - reset during S3 */
+
+	/* memory bases for mmaped DSPs - set by dsp_init() */
+	void __iomem *bar[SND_SOF_BARS];	/* DSP base address */
+	int mmio_bar;
+	int mailbox_bar;
+	size_t dsp_oops_offset;
+
+	/* debug */
+	struct dentry *debugfs_root;
+	struct list_head dfsentry_list;
+
+	/* firmware loader */
+	struct snd_dma_buffer dmab;
+	struct snd_dma_buffer dmab_bdl;
+	struct sof_ipc_fw_ready fw_ready;
+	struct sof_ipc_fw_version fw_version;
+
+	/* topology */
+	struct snd_soc_tplg_ops *tplg_ops;
+	struct list_head pcm_list;
+	struct list_head kcontrol_list;
+	struct list_head widget_list;
+	struct list_head dai_list;
+	struct list_head route_list;
+	struct snd_soc_component *component;
+	u32 enabled_cores_mask; /* keep track of enabled cores */
+
+	/* FW configuration */
+	struct sof_ipc_dma_buffer_data *info_buffer;
+	struct sof_ipc_window *info_window;
+
+	/* IPC timeouts in ms */
+	int ipc_timeout;
+	int boot_timeout;
+
+	/* Wait queue for code loading */
+	wait_queue_head_t waitq;
+	int code_loading;
+
+	/* DMA for Trace */
+	struct snd_dma_buffer dmatb;
+	struct snd_dma_buffer dmatp;
+	int dma_trace_pages;
+	wait_queue_head_t trace_sleep;
+	u32 host_offset;
+	u32 dtrace_is_enabled;
+	u32 dtrace_error;
+	u32 msi_enabled;
+
+	void *private;			/* core does not touch this */
+};
+
+/*
+ * Device Level.
+ */
+
+int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data);
+int snd_sof_device_remove(struct device *dev);
+
+int snd_sof_runtime_suspend(struct device *dev);
+int snd_sof_runtime_resume(struct device *dev);
+int snd_sof_resume(struct device *dev);
+int snd_sof_suspend(struct device *dev);
+
+void snd_sof_new_platform_drv(struct snd_sof_dev *sdev);
+
+int snd_sof_create_page_table(struct snd_sof_dev *sdev,
+			      struct snd_dma_buffer *dmab,
+			      unsigned char *page_table, size_t size);
+
+/*
+ * Firmware loading.
+ */
+int snd_sof_load_firmware(struct snd_sof_dev *sdev);
+int snd_sof_load_firmware_raw(struct snd_sof_dev *sdev);
+int snd_sof_load_firmware_memcpy(struct snd_sof_dev *sdev);
+int snd_sof_run_firmware(struct snd_sof_dev *sdev);
+int snd_sof_parse_module_memcpy(struct snd_sof_dev *sdev,
+				struct snd_sof_mod_hdr *module);
+void snd_sof_fw_unload(struct snd_sof_dev *sdev);
+int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset);
+
+/*
+ * IPC low level APIs.
+ */
+struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev);
+void snd_sof_ipc_free(struct snd_sof_dev *sdev);
+int snd_sof_ipc_reply(struct snd_sof_dev *sdev, u32 msg_id);
+void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev);
+int snd_sof_ipc_stream_pcm_params(struct snd_sof_dev *sdev,
+				  struct sof_ipc_pcm_params *params);
+int snd_sof_dsp_mailbox_init(struct snd_sof_dev *sdev, u32 dspbox,
+			     size_t dspbox_size, u32 hostbox,
+			     size_t hostbox_size);
+int snd_sof_ipc_valid(struct snd_sof_dev *sdev);
+int sof_ipc_tx_message(struct snd_sof_ipc *ipc, u32 header,
+		       void *msg_data, size_t msg_bytes, void *reply_data,
+		       size_t reply_bytes);
+struct snd_sof_widget *snd_sof_find_swidget(struct snd_sof_dev *sdev,
+					    const char *name);
+struct snd_sof_widget *snd_sof_find_swidget_sname(struct snd_sof_dev *sdev,
+						  const char *pcm_name,
+						  int dir);
+struct snd_sof_dai *snd_sof_find_dai(struct snd_sof_dev *sdev,
+				     const char *name);
+
+static inline
+struct snd_sof_pcm *snd_sof_find_spcm_dai(struct snd_sof_dev *sdev,
+					  struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_sof_pcm *spcm = NULL;
+
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		if (le32_to_cpu(spcm->pcm.dai_id) == rtd->dai_link->id)
+			return spcm;
+	}
+
+	return NULL;
+}
+
+struct snd_sof_pcm *snd_sof_find_spcm_name(struct snd_sof_dev *sdev,
+					   const char *name);
+struct snd_sof_pcm *snd_sof_find_spcm_comp(struct snd_sof_dev *sdev,
+					   unsigned int comp_id,
+					   int *direction);
+struct snd_sof_pcm *snd_sof_find_spcm_pcm_id(struct snd_sof_dev *sdev,
+					     unsigned int pcm_id);
+
+/*
+ * Stream IPC
+ */
+int snd_sof_ipc_stream_posn(struct snd_sof_dev *sdev,
+			    struct snd_sof_pcm *spcm, int direction,
+			    struct sof_ipc_stream_posn *posn);
+
+/*
+ * Mixer IPC
+ */
+int snd_sof_ipc_set_get_comp_data(struct snd_sof_ipc *ipc,
+				  struct snd_sof_control *scontrol, u32 ipc_cmd,
+				  enum sof_ipc_ctrl_type ctrl_type,
+				  enum sof_ipc_ctrl_cmd ctrl_cmd,
+				  bool send);
+
+/*
+ * Topology.
+ * There is no snd_sof_free_topology since topology components will
+ * be freed by snd_soc_unregister_component,
+ */
+int snd_sof_init_topology(struct snd_sof_dev *sdev,
+			  struct snd_soc_tplg_ops *ops);
+int snd_sof_load_topology(struct snd_sof_dev *sdev, const char *file);
+int snd_sof_complete_pipeline(struct snd_sof_dev *sdev,
+			      struct snd_sof_widget *swidget);
+
+int sof_load_pipeline_ipc(struct snd_sof_dev *sdev,
+			  struct sof_ipc_pipe_new *pipeline,
+			  struct sof_ipc_comp_reply *r);
+
+/*
+ * Trace/debug
+ */
+int snd_sof_init_trace(struct snd_sof_dev *sdev);
+void snd_sof_release_trace(struct snd_sof_dev *sdev);
+void snd_sof_free_trace(struct snd_sof_dev *sdev);
+int snd_sof_dbg_init(struct snd_sof_dev *sdev);
+void snd_sof_free_debug(struct snd_sof_dev *sdev);
+int snd_sof_debugfs_io_item(struct snd_sof_dev *sdev,
+			    void __iomem *base, size_t size,
+			    const char *name,
+			    enum sof_debugfs_access_type access_type);
+int snd_sof_debugfs_buf_item(struct snd_sof_dev *sdev,
+			     void *base, size_t size,
+			     const char *name);
+int snd_sof_trace_update_pos(struct snd_sof_dev *sdev,
+			     struct sof_ipc_dma_trace_posn *posn);
+void snd_sof_trace_notify_for_error(struct snd_sof_dev *sdev);
+void snd_sof_get_status(struct snd_sof_dev *sdev, u32 panic_code,
+			u32 tracep_code, void *oops,
+			struct sof_ipc_panic_info *panic_info,
+			void *stack, size_t stack_words);
+int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev);
+
+/*
+ * Platform specific ops.
+ */
+extern struct snd_compr_ops sof_compressed_ops;
+
+/*
+ * Kcontrols.
+ */
+
+int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol);
+int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol);
+int snd_sof_switch_get(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol);
+int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol);
+int snd_sof_enum_get(struct snd_kcontrol *kcontrol,
+		     struct snd_ctl_elem_value *ucontrol);
+int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
+		     struct snd_ctl_elem_value *ucontrol);
+int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
+		      struct snd_ctl_elem_value *ucontrol);
+int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
+		      struct snd_ctl_elem_value *ucontrol);
+int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
+			  const unsigned int __user *binary_data,
+			  unsigned int size);
+int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
+			  unsigned int __user *binary_data,
+			  unsigned int size);
+
+/*
+ * DSP Architectures.
+ */
+static inline void sof_stack(struct snd_sof_dev *sdev, void *oops, u32 *stack,
+			     u32 stack_words)
+{
+	if (sof_arch_ops(sdev)->dsp_stack)
+		sof_arch_ops(sdev)->dsp_stack(sdev, oops, stack, stack_words);
+}
+
+static inline void sof_oops(struct snd_sof_dev *sdev, void *oops)
+{
+	if (sof_arch_ops(sdev)->dsp_oops)
+		sof_arch_ops(sdev)->dsp_oops(sdev, oops);
+}
+
+extern const struct sof_arch_ops sof_xtensa_arch_ops;
+
+/*
+ * Utilities
+ */
+void sof_io_write(struct snd_sof_dev *sdev, void __iomem *addr, u32 value);
+void sof_io_write64(struct snd_sof_dev *sdev, void __iomem *addr, u64 value);
+u32 sof_io_read(struct snd_sof_dev *sdev, void __iomem *addr);
+u64 sof_io_read64(struct snd_sof_dev *sdev, void __iomem *addr);
+void sof_mailbox_write(struct snd_sof_dev *sdev, u32 offset,
+		       void *message, size_t bytes);
+void sof_mailbox_read(struct snd_sof_dev *sdev, u32 offset,
+		      void *message, size_t bytes);
+void sof_block_write(struct snd_sof_dev *sdev, u32 bar, u32 offset, void *src,
+		     size_t size);
+void sof_block_read(struct snd_sof_dev *sdev, u32 bar, u32 offset, void *dest,
+		    size_t size);
+
+void intel_ipc_msg_data(struct snd_sof_dev *sdev,
+			struct snd_pcm_substream *substream,
+			void *p, size_t sz);
+int intel_ipc_pcm_params(struct snd_sof_dev *sdev,
+			 struct snd_pcm_substream *substream,
+			 const struct sof_ipc_pcm_params_reply *reply);
+
+int intel_pcm_open(struct snd_sof_dev *sdev,
+		   struct snd_pcm_substream *substream);
+int intel_pcm_close(struct snd_sof_dev *sdev,
+		    struct snd_pcm_substream *substream);
+
+#endif
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
