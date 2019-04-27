Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A09BB42A
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:02:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 205E5163A;
	Sat, 27 Apr 2019 20:01:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 205E5163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556388126;
	bh=otehVaLQf8wTq7eFwcJvRN8vNojhVjEKUCbxHm/csr4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=c8pBWveDHOgQYzsn0YR6J44m4se+mNOwHNb2yW2HfID7JY4b6vctE0PAVvzdC6BYl
	 YLDvkL+hmG2TgBe946sxkvvuOmNVPL9NJgYZI7Cnpv57nLOye2+9OGXEg6P0WSuKV8
	 VKHCyXXcs/BR8UKEtzb8+k7lrPUaqA/OdmN7cVWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57B1AF896DD;
	Sat, 27 Apr 2019 19:54:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53BE1F89746; Sat, 27 Apr 2019 19:53:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F352F896CE;
 Sat, 27 Apr 2019 19:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F352F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="TQSXe1yn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=kAKltnjzTmAu3keWXBfN6PCCzpu5OQechda6UG/WTUU=; b=TQSXe1ynm+GK
 v5MMjNgHUqR3jLzCB1TPfLSpMiMeltUanpQ4OYAl5YELv4qLDBWUgbFmmE5qAIU6X7F2P5dw9tHpm
 H+dty9jlSDKSmzKECk20I/FlP6G6XHN7V2PRZRv6Ow92VApMfJ+eilgJMwASllifpQ187NaK1hp+A
 R2OmY=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVG-0004o3-Cy; Sat, 27 Apr 2019 17:52:46 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id E46C4441D57; Sat, 27 Apr 2019 18:52:42 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160904.30418-13-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175242.E46C4441D57@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:52:42 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, Keyon Jie <yang.jie@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: Add Intel specific HDA
	trace operations" to the asoc tree
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

   ASoC: SOF: Intel: Add Intel specific HDA trace operations

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

From ba00ed7572cd581bfd483d13193d36a38a3942a8 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:08:55 -0500
Subject: [PATCH] ASoC: SOF: Intel: Add Intel specific HDA trace operations

Add trace operations for Intel based HDA DSPs

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-trace.c | 94 +++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 sound/soc/sof/intel/hda-trace.c

diff --git a/sound/soc/sof/intel/hda-trace.c b/sound/soc/sof/intel/hda-trace.c
new file mode 100644
index 000000000000..33b23bd6a01e
--- /dev/null
+++ b/sound/soc/sof/intel/hda-trace.c
@@ -0,0 +1,94 @@
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
+#include <sound/hdaudio_ext.h>
+#include "../ops.h"
+#include "hda.h"
+
+static int hda_dsp_trace_prepare(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	struct hdac_ext_stream *stream = hda->dtrace_stream;
+	struct hdac_stream *hstream = &stream->hstream;
+	struct snd_dma_buffer *dmab = &sdev->dmatb;
+	int ret;
+
+	hstream->period_bytes = 0;/* initialize period_bytes */
+	hstream->bufsize = sdev->dmatb.bytes;
+
+	ret = hda_dsp_stream_hw_params(sdev, stream, dmab, NULL);
+	if (ret < 0)
+		dev_err(sdev->dev, "error: hdac prepare failed: %x\n", ret);
+
+	return ret;
+}
+
+int hda_dsp_trace_init(struct snd_sof_dev *sdev, u32 *stream_tag)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	int ret;
+
+	hda->dtrace_stream = hda_dsp_stream_get(sdev,
+						SNDRV_PCM_STREAM_CAPTURE);
+
+	if (!hda->dtrace_stream) {
+		dev_err(sdev->dev,
+			"error: no available capture stream for DMA trace\n");
+		return -ENODEV;
+	}
+
+	*stream_tag = hda->dtrace_stream->hstream.stream_tag;
+
+	/*
+	 * initialize capture stream, set BDL address and return corresponding
+	 * stream tag which will be sent to the firmware by IPC message.
+	 */
+	ret = hda_dsp_trace_prepare(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: hdac trace init failed: %x\n", ret);
+		hda_dsp_stream_put(sdev, SNDRV_PCM_STREAM_CAPTURE, *stream_tag);
+		hda->dtrace_stream = NULL;
+		*stream_tag = 0;
+	}
+
+	return ret;
+}
+
+int hda_dsp_trace_release(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	struct hdac_stream *hstream;
+
+	if (hda->dtrace_stream) {
+		hstream = &hda->dtrace_stream->hstream;
+		hda_dsp_stream_put(sdev,
+				   SNDRV_PCM_STREAM_CAPTURE,
+				   hstream->stream_tag);
+		hda->dtrace_stream = NULL;
+		return 0;
+	}
+
+	dev_dbg(sdev->dev, "DMA trace stream is not opened!\n");
+	return -ENODEV;
+}
+
+int hda_dsp_trace_trigger(struct snd_sof_dev *sdev, int cmd)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+
+	return hda_dsp_stream_trigger(sdev, hda->dtrace_stream, cmd);
+}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
