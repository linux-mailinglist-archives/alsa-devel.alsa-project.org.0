Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 496FA5BE6DD
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 15:19:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D75E385D;
	Tue, 20 Sep 2022 15:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D75E385D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663679961;
	bh=Pok0JJ3tg/cXWfrMqW2WmdMe1wtOOziEuXSj4TXmq/k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M5bhiDSYicyJeLhezRNWlbJBeAn6R5xkyl4rWXXeRZy+34ELcUFlw+aknpjXGKqRl
	 Oto7tTXW8EIUA7NlTAj1rSiwHUbM+idw4HVdLV/b2yvFmKSUU/B05O6x9jVkGhwtqL
	 2TMD5/cKDlSpTGfvEYj3bDcFF1jUEZYDeJjntPFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF26BF80548;
	Tue, 20 Sep 2022 15:17:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B775F800C9; Tue, 20 Sep 2022 15:17:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F4CAF80153
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 15:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F4CAF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VlztRSA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663679858; x=1695215858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pok0JJ3tg/cXWfrMqW2WmdMe1wtOOziEuXSj4TXmq/k=;
 b=VlztRSA7tCWu3onsZwuS5PCRUvS9YpaQzGsk9RAdia3FmTk5TjSET7Pc
 ZqYORCKK9csBge06ASq4J960bbhQ7ipPBQYcWnwqINZBff9YW2PMYWl4h
 MOozJgxePcRbbGbEJcW5A/Fu/5mblg69SjfMaLQ79Uda97DZhH0UxqWTQ
 6iD+vVEVUVbYH4kwQhD2LYBn113uc34gzYE7LQ0w5WqxJZKY44btM8Fff
 PRFgt3btbW95PEu/A26txlGbyY1csJ4HccUGPvQKgdI5XMNLLMCYQM69q
 rmiRJgNPoSuhgJRZvChs9yI+WFFZFfx7+yHJZ+QuG98k30/SNRVbSoTES w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="282719146"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="282719146"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 06:17:21 -0700
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="652089692"
Received: from atcamara-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.209.87])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 06:17:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/4] ASoC: SOF: Intel: add SKL/KBL hardware code loader
Date: Tue, 20 Sep 2022 15:16:58 +0200
Message-Id: <20220920131700.133103-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920131700.133103-1-pierre-louis.bossart@linux.intel.com>
References: <20220920131700.133103-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

This patch adds support for the SkyLake and KabyLake code loader on
top of the SOF IPC4.

The work was initially contributed in 2018 by Liam Girdwood and Zhu
Yingjiang, and abandoned due to firmware signature issues. With the
existing support of IPC v4, it's time to re-add this capability.

This patch uses the newly added FSR (Firmware State Register)
definitions for DSP state handling and targeting, ass well as new
state definition for SKL which indicates that the firmware has been
started (similar to FW_ENTERED on other platforms).

Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Co-developed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader-skl.c | 583 +++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h            |   6 +
 2 files changed, 589 insertions(+)
 create mode 100644 sound/soc/sof/intel/hda-loader-skl.c

diff --git a/sound/soc/sof/intel/hda-loader-skl.c b/sound/soc/sof/intel/hda-loader-skl.c
new file mode 100644
index 0000000000000..6f7e7444f11c1
--- /dev/null
+++ b/sound/soc/sof/intel/hda-loader-skl.c
@@ -0,0 +1,583 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018-2022 Intel Corporation. All rights reserved.
+//
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/firmware.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <sound/hdaudio_ext.h>
+#include <sound/sof.h>
+#include <sound/pcm_params.h>
+
+#include "../sof-priv.h"
+#include "../ops.h"
+#include "hda.h"
+
+#define HDA_SKL_WAIT_TIMEOUT		500	/* 500 msec */
+#define HDA_SKL_CLDMA_MAX_BUFFER_SIZE	(32 * PAGE_SIZE)
+
+/* Stream Reset */
+#define HDA_CL_SD_CTL_SRST_SHIFT	0
+#define HDA_CL_SD_CTL_SRST(x)		(((x) & 0x1) << \
+					HDA_CL_SD_CTL_SRST_SHIFT)
+
+/* Stream Run */
+#define HDA_CL_SD_CTL_RUN_SHIFT		1
+#define HDA_CL_SD_CTL_RUN(x)		(((x) & 0x1) << \
+					HDA_CL_SD_CTL_RUN_SHIFT)
+
+/* Interrupt On Completion Enable */
+#define HDA_CL_SD_CTL_IOCE_SHIFT	2
+#define HDA_CL_SD_CTL_IOCE(x)		(((x) & 0x1) << \
+					HDA_CL_SD_CTL_IOCE_SHIFT)
+
+/* FIFO Error Interrupt Enable */
+#define HDA_CL_SD_CTL_FEIE_SHIFT	3
+#define HDA_CL_SD_CTL_FEIE(x)		(((x) & 0x1) << \
+					HDA_CL_SD_CTL_FEIE_SHIFT)
+
+/* Descriptor Error Interrupt Enable */
+#define HDA_CL_SD_CTL_DEIE_SHIFT	4
+#define HDA_CL_SD_CTL_DEIE(x)		(((x) & 0x1) << \
+					HDA_CL_SD_CTL_DEIE_SHIFT)
+
+/* FIFO Limit Change */
+#define HDA_CL_SD_CTL_FIFOLC_SHIFT	5
+#define HDA_CL_SD_CTL_FIFOLC(x)		(((x) & 0x1) << \
+					HDA_CL_SD_CTL_FIFOLC_SHIFT)
+
+/* Stripe Control */
+#define HDA_CL_SD_CTL_STRIPE_SHIFT	16
+#define HDA_CL_SD_CTL_STRIPE(x)		(((x) & 0x3) << \
+					HDA_CL_SD_CTL_STRIPE_SHIFT)
+
+/* Traffic Priority */
+#define HDA_CL_SD_CTL_TP_SHIFT		18
+#define HDA_CL_SD_CTL_TP(x)		(((x) & 0x1) << \
+					HDA_CL_SD_CTL_TP_SHIFT)
+
+/* Bidirectional Direction Control */
+#define HDA_CL_SD_CTL_DIR_SHIFT		19
+#define HDA_CL_SD_CTL_DIR(x)		(((x) & 0x1) << \
+					HDA_CL_SD_CTL_DIR_SHIFT)
+
+/* Stream Number */
+#define HDA_CL_SD_CTL_STRM_SHIFT	20
+#define HDA_CL_SD_CTL_STRM(x)		(((x) & 0xf) << \
+					HDA_CL_SD_CTL_STRM_SHIFT)
+
+#define HDA_CL_SD_CTL_INT(x)	\
+		(HDA_CL_SD_CTL_IOCE(x) | \
+		HDA_CL_SD_CTL_FEIE(x) | \
+		HDA_CL_SD_CTL_DEIE(x))
+
+#define HDA_CL_SD_CTL_INT_MASK	\
+		(HDA_CL_SD_CTL_IOCE(1) | \
+		HDA_CL_SD_CTL_FEIE(1) | \
+		HDA_CL_SD_CTL_DEIE(1))
+
+#define DMA_ADDRESS_128_BITS_ALIGNMENT	7
+#define BDL_ALIGN(x)			((x) >> DMA_ADDRESS_128_BITS_ALIGNMENT)
+
+/* Buffer Descriptor List Lower Base Address */
+#define HDA_CL_SD_BDLPLBA_SHIFT		7
+#define HDA_CL_SD_BDLPLBA_MASK		(0x1ffffff << HDA_CL_SD_BDLPLBA_SHIFT)
+#define HDA_CL_SD_BDLPLBA(x)		\
+	((BDL_ALIGN(lower_32_bits(x)) << HDA_CL_SD_BDLPLBA_SHIFT) & \
+	 HDA_CL_SD_BDLPLBA_MASK)
+
+/* Buffer Descriptor List Upper Base Address */
+#define HDA_CL_SD_BDLPUBA_SHIFT		0
+#define HDA_CL_SD_BDLPUBA_MASK		(0xffffffff << HDA_CL_SD_BDLPUBA_SHIFT)
+#define HDA_CL_SD_BDLPUBA(x)		\
+		((upper_32_bits(x) << HDA_CL_SD_BDLPUBA_SHIFT) & \
+		 HDA_CL_SD_BDLPUBA_MASK)
+
+/* Software Position in Buffer Enable */
+#define HDA_CL_SPBFIFO_SPBFCCTL_SPIBE_SHIFT	0
+#define HDA_CL_SPBFIFO_SPBFCCTL_SPIBE_MASK	\
+			(1 << HDA_CL_SPBFIFO_SPBFCCTL_SPIBE_SHIFT)
+
+#define HDA_CL_SPBFIFO_SPBFCCTL_SPIBE(x)	\
+			(((x) << HDA_CL_SPBFIFO_SPBFCCTL_SPIBE_SHIFT) & \
+			 HDA_CL_SPBFIFO_SPBFCCTL_SPIBE_MASK)
+
+#define HDA_CL_DMA_SD_INT_COMPLETE		0x4
+
+static int cl_skl_cldma_setup_bdle(struct snd_sof_dev *sdev,
+				   struct snd_dma_buffer *dmab_data,
+				   __le32 **bdlp, int size, int with_ioc)
+{
+	phys_addr_t addr = virt_to_phys(dmab_data->area);
+	__le32 *bdl = *bdlp;
+
+	/*
+	 * This code is simplified by using one fragment of physical memory and assuming
+	 * all the code fits. This could be improved with scatter-gather but the firmware
+	 * size is limited by DSP memory anyways
+	 */
+	bdl[0] = cpu_to_le32(lower_32_bits(addr));
+	bdl[1] = cpu_to_le32(upper_32_bits(addr));
+	bdl[2] = cpu_to_le32(size);
+	bdl[3] = (!with_ioc) ? 0 : cpu_to_le32(0x01);
+
+	return 1; /* one fragment */
+}
+
+static void cl_skl_cldma_stream_run(struct snd_sof_dev *sdev, bool enable)
+{
+	int sd_offset = SOF_HDA_ADSP_LOADER_BASE;
+	unsigned char val;
+	int retries;
+	u32 run = enable ? 0x1 : 0;
+
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+				sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL,
+				HDA_CL_SD_CTL_RUN(1), HDA_CL_SD_CTL_RUN(run));
+
+	retries = 300;
+	do {
+		udelay(3);
+
+		/* waiting for hardware to report the stream Run bit set */
+		val = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+				       sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL);
+		val &= HDA_CL_SD_CTL_RUN(1);
+		if (enable && val)
+			break;
+		else if (!enable && !val)
+			break;
+	} while (--retries);
+
+	if (retries == 0)
+		dev_err(sdev->dev, "%s: failed to set Run bit=%d enable=%d\n",
+			__func__, val, enable);
+}
+
+static void cl_skl_cldma_stream_clear(struct snd_sof_dev *sdev)
+{
+	int sd_offset = SOF_HDA_ADSP_LOADER_BASE;
+
+	/* make sure Run bit is cleared before setting stream register */
+	cl_skl_cldma_stream_run(sdev, 0);
+
+	/* Disable the Interrupt On Completion, FIFO Error Interrupt,
+	 * Descriptor Error Interrupt and set the cldma stream number to 0.
+	 */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+				sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL,
+				HDA_CL_SD_CTL_INT_MASK, HDA_CL_SD_CTL_INT(0));
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+				sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL,
+				HDA_CL_SD_CTL_STRM(0xf), HDA_CL_SD_CTL_STRM(0));
+
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPL, HDA_CL_SD_BDLPLBA(0));
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPU, 0);
+
+	/* Set the Cyclic Buffer Length to 0. */
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_CBL, 0);
+	/* Set the Last Valid Index. */
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_LVI, 0);
+}
+
+static void cl_skl_cldma_setup_spb(struct snd_sof_dev *sdev,
+				   unsigned int size, bool enable)
+{
+	int sd_offset = SOF_DSP_REG_CL_SPBFIFO;
+
+	if (enable)
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+					sd_offset + SOF_HDA_ADSP_REG_CL_SPBFIFO_SPBFCCTL,
+					HDA_CL_SPBFIFO_SPBFCCTL_SPIBE_MASK,
+					HDA_CL_SPBFIFO_SPBFCCTL_SPIBE(1));
+
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SPBFIFO_SPIB, size);
+}
+
+static void cl_skl_cldma_set_intr(struct snd_sof_dev *sdev, bool enable)
+{
+	u32 val = enable ? HDA_DSP_ADSPIC_CL_DMA : 0;
+
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIC,
+				HDA_DSP_ADSPIC_CL_DMA, val);
+}
+
+static void cl_skl_cldma_cleanup_spb(struct snd_sof_dev *sdev)
+{
+	int sd_offset = SOF_DSP_REG_CL_SPBFIFO;
+
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+				sd_offset + SOF_HDA_ADSP_REG_CL_SPBFIFO_SPBFCCTL,
+				HDA_CL_SPBFIFO_SPBFCCTL_SPIBE_MASK,
+				HDA_CL_SPBFIFO_SPBFCCTL_SPIBE(0));
+
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SPBFIFO_SPIB, 0);
+}
+
+static void cl_skl_cldma_setup_controller(struct snd_sof_dev *sdev,
+					  struct snd_dma_buffer *dmab_bdl,
+					  unsigned int max_size, u32 count)
+{
+	int sd_offset = SOF_HDA_ADSP_LOADER_BASE;
+
+	/* Clear the stream first and then set it. */
+	cl_skl_cldma_stream_clear(sdev);
+
+	/* setting the stream register */
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPL,
+			  HDA_CL_SD_BDLPLBA(dmab_bdl->addr));
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_BDLPU,
+			  HDA_CL_SD_BDLPUBA(dmab_bdl->addr));
+
+	/* Set the Cyclic Buffer Length. */
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_CBL, max_size);
+	/* Set the Last Valid Index. */
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR,
+			  sd_offset + SOF_HDA_ADSP_REG_CL_SD_LVI, count - 1);
+
+	/* Set the Interrupt On Completion, FIFO Error Interrupt,
+	 * Descriptor Error Interrupt and the cldma stream number.
+	 */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+				sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL,
+				HDA_CL_SD_CTL_INT_MASK, HDA_CL_SD_CTL_INT(1));
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+				sd_offset + SOF_HDA_ADSP_REG_CL_SD_CTL,
+				HDA_CL_SD_CTL_STRM(0xf),
+				HDA_CL_SD_CTL_STRM(1));
+}
+
+static int cl_stream_prepare_skl(struct snd_sof_dev *sdev,
+				 struct snd_dma_buffer *dmab,
+				 struct snd_dma_buffer *dmab_bdl)
+
+{
+	unsigned int bufsize = HDA_SKL_CLDMA_MAX_BUFFER_SIZE;
+	__le32 *bdl;
+	int frags;
+	int ret;
+
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, sdev->dev, bufsize, dmab);
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: failed to alloc fw buffer: %x\n", __func__, ret);
+		return ret;
+	}
+
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, sdev->dev, bufsize, dmab_bdl);
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: failed to alloc blde: %x\n", __func__, ret);
+		snd_dma_free_pages(dmab);
+		return ret;
+	}
+
+	bdl = (__le32 *)dmab_bdl->area;
+	frags = cl_skl_cldma_setup_bdle(sdev, dmab, &bdl, bufsize, 1);
+	cl_skl_cldma_setup_controller(sdev, dmab_bdl, bufsize, frags);
+
+	return ret;
+}
+
+static void cl_cleanup_skl(struct snd_sof_dev *sdev,
+			   struct snd_dma_buffer *dmab,
+			   struct snd_dma_buffer *dmab_bdl)
+{
+	cl_skl_cldma_cleanup_spb(sdev);
+	cl_skl_cldma_stream_clear(sdev);
+	snd_dma_free_pages(dmab);
+	snd_dma_free_pages(dmab_bdl);
+}
+
+static int cl_dsp_init_skl(struct snd_sof_dev *sdev,
+			   struct snd_dma_buffer *dmab,
+			   struct snd_dma_buffer *dmab_bdl)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
+	unsigned int status;
+	u32 flags;
+	int ret;
+
+	/* check if the init_core is already enabled, if yes, reset and make it run,
+	 * if not, powerdown and enable it again.
+	 */
+	if (hda_dsp_core_is_enabled(sdev, chip->init_core_mask)) {
+		/* if enabled, reset it, and run the init_core. */
+		ret = hda_dsp_core_stall_reset(sdev, chip->init_core_mask);
+		if (ret < 0)
+			goto err;
+
+		ret = hda_dsp_core_run(sdev, chip->init_core_mask);
+		if (ret < 0) {
+			dev_err(sdev->dev, "%s: dsp core start failed %d\n", __func__, ret);
+			goto err;
+		}
+	} else {
+		/* if not enabled, power down it first and then powerup and run
+		 * the init_core.
+		 */
+		ret = hda_dsp_core_reset_power_down(sdev, chip->init_core_mask);
+		if (ret < 0) {
+			dev_err(sdev->dev, "%s: dsp core0 disable fail: %d\n", __func__, ret);
+			goto err;
+		}
+		ret = hda_dsp_enable_core(sdev, chip->init_core_mask);
+		if (ret < 0) {
+			dev_err(sdev->dev, "%s: dsp core0 enable fail: %d\n", __func__, ret);
+			goto err;
+		}
+	}
+
+	/* prepare DMA for code loader stream */
+	ret = cl_stream_prepare_skl(sdev, dmab, dmab_bdl);
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: dma prepare fw loading err: %x\n", __func__, ret);
+		return ret;
+	}
+
+	/* enable the interrupt */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIC,
+				HDA_DSP_ADSPIC_IPC, HDA_DSP_ADSPIC_IPC);
+
+	/* enable IPC DONE interrupt */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, chip->ipc_ctl,
+				HDA_DSP_REG_HIPCCTL_DONE,
+				HDA_DSP_REG_HIPCCTL_DONE);
+
+	/* enable IPC BUSY interrupt */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, chip->ipc_ctl,
+				HDA_DSP_REG_HIPCCTL_BUSY,
+				HDA_DSP_REG_HIPCCTL_BUSY);
+
+	/* polling the ROM init status information. */
+	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
+					    chip->rom_status_reg, status,
+					    (FSR_TO_STATE_CODE(status)
+					     == FSR_STATE_INIT_DONE),
+					    HDA_DSP_REG_POLL_INTERVAL_US,
+					    chip->rom_init_timeout *
+					    USEC_PER_MSEC);
+	if (ret < 0)
+		goto err;
+
+	return ret;
+
+err:
+	flags = SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX;
+
+	snd_sof_dsp_dbg_dump(sdev, "Boot failed\n", flags);
+	cl_cleanup_skl(sdev, dmab, dmab_bdl);
+	hda_dsp_core_reset_power_down(sdev, chip->init_core_mask);
+	return ret;
+}
+
+static void cl_skl_cldma_fill_buffer(struct snd_sof_dev *sdev,
+				     struct snd_dma_buffer *dmab,
+				     unsigned int bufsize,
+				     unsigned int copysize,
+				     const void *curr_pos,
+				     bool intr_enable)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+
+	/* copy the image into the buffer with the maximum buffer size. */
+	unsigned int size = (bufsize == copysize) ? bufsize : copysize;
+
+	memcpy(dmab->area, curr_pos, size);
+
+	/* Set the wait condition for every load. */
+	hda->code_loading = 1;
+
+	/* Set the interrupt. */
+	if (intr_enable)
+		cl_skl_cldma_set_intr(sdev, true);
+
+	/* Set the SPB. */
+	cl_skl_cldma_setup_spb(sdev, size, true);
+
+	/* Trigger the code loading stream. */
+	cl_skl_cldma_stream_run(sdev, true);
+}
+
+static int cl_skl_cldma_wait_interruptible(struct snd_sof_dev *sdev,
+					   bool intr_wait)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
+	int sd_offset = SOF_HDA_ADSP_LOADER_BASE;
+	u8 cl_dma_intr_status;
+
+	/*
+	 * Wait for CLDMA interrupt to inform the binary segment transfer is
+	 * complete.
+	 */
+	if (!wait_event_timeout(hda->waitq, !hda->code_loading,
+				msecs_to_jiffies(HDA_SKL_WAIT_TIMEOUT))) {
+		dev_err(sdev->dev, "cldma copy timeout\n");
+		dev_err(sdev->dev, "ROM code=%#x: FW status=%#x\n",
+			snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_SRAM_REG_ROM_ERROR),
+			snd_sof_dsp_read(sdev, HDA_DSP_BAR, chip->rom_status_reg));
+		return -EIO;
+	}
+
+	/* now check DMA interrupt status */
+	cl_dma_intr_status = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+					      sd_offset + SOF_HDA_ADSP_REG_CL_SD_STS);
+
+	if (!(cl_dma_intr_status & HDA_CL_DMA_SD_INT_COMPLETE)) {
+		dev_err(sdev->dev, "cldma copy failed\n");
+		return -EIO;
+	}
+
+	dev_dbg(sdev->dev, "cldma buffer copy complete\n");
+	return 0;
+}
+
+static int
+cl_skl_cldma_copy_to_buf(struct snd_sof_dev *sdev,
+			 struct snd_dma_buffer *dmab,
+			 const void *bin,
+			 u32 total_size, u32 bufsize)
+{
+	unsigned int bytes_left = total_size;
+	const void *curr_pos = bin;
+	int ret;
+
+	if (total_size <= 0)
+		return -EINVAL;
+
+	while (bytes_left > 0) {
+		if (bytes_left > bufsize) {
+			dev_dbg(sdev->dev, "cldma copy %#x bytes\n", bufsize);
+
+			cl_skl_cldma_fill_buffer(sdev, dmab, bufsize, bufsize, curr_pos, true);
+
+			ret = cl_skl_cldma_wait_interruptible(sdev, false);
+			if (ret < 0) {
+				dev_err(sdev->dev, "%s: fw failed to load. %#x bytes remaining\n",
+					__func__, bytes_left);
+				return ret;
+			}
+
+			bytes_left -= bufsize;
+			curr_pos += bufsize;
+		} else {
+			dev_dbg(sdev->dev, "cldma copy %#x bytes\n", bytes_left);
+
+			cl_skl_cldma_set_intr(sdev, false);
+			cl_skl_cldma_fill_buffer(sdev, dmab, bufsize, bytes_left, curr_pos, false);
+			return 0;
+		}
+	}
+
+	return bytes_left;
+}
+
+static int cl_copy_fw_skl(struct snd_sof_dev *sdev,
+			  struct snd_dma_buffer *dmab)
+
+{
+	struct snd_sof_pdata *plat_data = sdev->pdata;
+	const struct firmware *fw =  plat_data->fw;
+	struct firmware stripped_firmware;
+	unsigned int bufsize = HDA_SKL_CLDMA_MAX_BUFFER_SIZE;
+	int ret;
+
+	stripped_firmware.data = plat_data->fw->data + plat_data->fw_offset;
+	stripped_firmware.size = plat_data->fw->size - plat_data->fw_offset;
+
+	dev_dbg(sdev->dev, "firmware size: %#zx buffer size %#x\n", fw->size, bufsize);
+
+	ret = cl_skl_cldma_copy_to_buf(sdev, dmab, stripped_firmware.data,
+				       stripped_firmware.size, bufsize);
+	if (ret < 0)
+		dev_err(sdev->dev, "%s: fw copy failed %d\n", __func__, ret);
+
+	return ret;
+}
+
+int hda_dsp_cl_boot_firmware_skl(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
+	struct snd_dma_buffer dmab_bdl;
+	struct snd_dma_buffer dmab;
+	unsigned int reg;
+	u32 flags;
+	int ret;
+
+	ret = cl_dsp_init_skl(sdev, &dmab, &dmab_bdl);
+
+	/* retry enabling core and ROM load. seemed to help */
+	if (ret < 0) {
+		ret = cl_dsp_init_skl(sdev, &dmab, &dmab_bdl);
+		if (ret < 0) {
+			dev_err(sdev->dev, "Error code=%#x: FW status=%#x\n",
+				snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_SRAM_REG_ROM_ERROR),
+				snd_sof_dsp_read(sdev, HDA_DSP_BAR, chip->rom_status_reg));
+			dev_err(sdev->dev, "Core En/ROM load fail:%d\n", ret);
+			return ret;
+		}
+	}
+
+	dev_dbg(sdev->dev, "ROM init successful\n");
+
+	/* at this point DSP ROM has been initialized and should be ready for
+	 * code loading and firmware boot
+	 */
+	ret = cl_copy_fw_skl(sdev, &dmab);
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: load firmware failed : %d\n", __func__, ret);
+		goto err;
+	}
+
+	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
+					    chip->rom_status_reg, reg,
+					    (FSR_TO_STATE_CODE(reg)
+					     == FSR_STATE_ROM_BASEFW_ENTERED),
+					    HDA_DSP_REG_POLL_INTERVAL_US,
+					    HDA_DSP_BASEFW_TIMEOUT_US);
+
+	dev_dbg(sdev->dev, "Firmware download successful, booting...\n");
+
+	cl_skl_cldma_stream_run(sdev, false);
+	cl_cleanup_skl(sdev, &dmab, &dmab_bdl);
+
+	if (!ret)
+		return chip->init_core_mask;
+
+	return ret;
+
+err:
+	flags = SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX;
+
+	snd_sof_dsp_dbg_dump(sdev, "Boot failed\n", flags);
+
+	/* power down DSP */
+	hda_dsp_core_reset_power_down(sdev, chip->init_core_mask);
+	cl_skl_cldma_stream_run(sdev, false);
+	cl_cleanup_skl(sdev, &dmab, &dmab_bdl);
+
+	dev_err(sdev->dev, "%s: load fw failed err: %d\n", __func__, ret);
+	return ret;
+}
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 04b730f754d7b..6ad8dafce098e 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -229,6 +229,7 @@
 #define FSR_STATE_ROM_GET_LOAD_OFFSET		0x7
 #define FSR_STATE_ROM_FETCH_ROM_EXT		0x8
 #define FSR_STATE_ROM_FETCH_ROM_EXT_DONE	0x9
+#define FSR_STATE_ROM_BASEFW_ENTERED		0xf /* SKL */
 
 /* (ROM) CSE states */
 #define FSR_STATE_ROM_CSE_IMR_REQUEST			0x10
@@ -514,6 +515,9 @@ struct sof_intel_hda_dev {
 	/* FW clock config, 0:HPRO, 1:LPRO */
 	bool clk_config_lpro;
 
+	wait_queue_head_t waitq;
+	bool code_loading;
+
 	/* Intel NHLT information */
 	struct nhlt_acpi_table *nhlt;
 };
@@ -834,6 +838,8 @@ extern int sof_hda_position_quirk;
 void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops);
 void hda_ops_free(struct snd_sof_dev *sdev);
 
+/* SKL/KBL */
+int hda_dsp_cl_boot_firmware_skl(struct snd_sof_dev *sdev);
 int hda_dsp_core_stall_reset(struct snd_sof_dev *sdev, unsigned int core_mask);
 
 /* IPC4 */
-- 
2.34.1

