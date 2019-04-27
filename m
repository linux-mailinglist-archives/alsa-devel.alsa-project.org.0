Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADF3B436
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:09:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E93E3161F;
	Sat, 27 Apr 2019 20:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E93E3161F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556388560;
	bh=UmNkllIQ/TRUWPj6GNAvjM/nJeLJhvVOJLZOdXXZXQ4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=flrb0EY6Z9s7lKc+iK4n9QOqXf7+vzGWD20AsjTsX5796t5wPRhfJBg3Q3vPSrRRm
	 bB6rGxow8aUhaV9NC05BFahQCu2eMedVsya1Omc+W+m2LSgqxzAsSCrDJEWinDjj9H
	 ZIDbUXUSEpaSMdJYi0JX45Ycm6oYUcQwOeN24Hjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 996CFF89731;
	Sat, 27 Apr 2019 19:54:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E84E0F8972F; Sat, 27 Apr 2019 19:53:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41682F89730;
 Sat, 27 Apr 2019 19:53:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41682F89730
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="UuLe3eSf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=noCMcloiEzuPpAa1jceu2M+Kxb8cbh2i3OTuisMysFg=; b=UuLe3eSfYshC
 GJRJYnGsnQb44TJCagFGWDvhgWxKhqsVFY5CCr1b8A0hI+5uBtoJFbW/8NJV0TuXXT39hBdLxjwdW
 JlCJUFoezv8eL/2ESwHYT+W2iB00WwDmAnDZlAFbeQrC4+Ir3Y6PvI5P5sYucKZGuVnScDlKjz3hs
 M6faQ=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVR-0004py-LL; Sat, 27 Apr 2019 17:52:57 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 984BD441D3E; Sat, 27 Apr 2019 18:52:54 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
In-Reply-To: <20190412160904.30418-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175254.984BD441D3E@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:52:54 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: Add legacy IPC support" to
	the asoc tree
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

   ASoC: SOF: Intel: Add legacy IPC support

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

From 351d1174fef03adb4defed7ef14f1ede0251aae9 Mon Sep 17 00:00:00 2001
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Date: Fri, 12 Apr 2019 11:08:46 -0500
Subject: [PATCH] ASoC: SOF: Intel: Add legacy IPC support

Add IPC support required for devices introduced before Skylake
(Merrifield, baytrail, CherryTrail, Haswell, Broadwell)

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/intel-ipc.c | 92 +++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 sound/soc/sof/intel/intel-ipc.c

diff --git a/sound/soc/sof/intel/intel-ipc.c b/sound/soc/sof/intel/intel-ipc.c
new file mode 100644
index 000000000000..4edd92151fd5
--- /dev/null
+++ b/sound/soc/sof/intel/intel-ipc.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2019 Intel Corporation. All rights reserved.
+//
+// Authors: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
+
+/* Intel-specific SOF IPC code */
+
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/module.h>
+#include <linux/types.h>
+
+#include <sound/pcm.h>
+#include <sound/sof/stream.h>
+
+#include "../ops.h"
+#include "../sof-priv.h"
+
+struct intel_stream {
+	size_t posn_offset;
+};
+
+/* Mailbox-based Intel IPC implementation */
+void intel_ipc_msg_data(struct snd_sof_dev *sdev,
+			struct snd_pcm_substream *substream,
+			void *p, size_t sz)
+{
+	if (!substream || !sdev->stream_box.size) {
+		sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
+	} else {
+		struct intel_stream *stream = substream->runtime->private_data;
+
+		/* The stream might already be closed */
+		if (stream)
+			sof_mailbox_read(sdev, stream->posn_offset, p, sz);
+	}
+}
+EXPORT_SYMBOL(intel_ipc_msg_data);
+
+int intel_ipc_pcm_params(struct snd_sof_dev *sdev,
+			 struct snd_pcm_substream *substream,
+			 const struct sof_ipc_pcm_params_reply *reply)
+{
+	struct intel_stream *stream = substream->runtime->private_data;
+	size_t posn_offset = reply->posn_offset;
+
+	/* check if offset is overflow or it is not aligned */
+	if (posn_offset > sdev->stream_box.size ||
+	    posn_offset % sizeof(struct sof_ipc_stream_posn) != 0)
+		return -EINVAL;
+
+	stream->posn_offset = sdev->stream_box.offset + posn_offset;
+
+	dev_dbg(sdev->dev, "pcm: stream dir %d, posn mailbox offset is %zu",
+		substream->stream, stream->posn_offset);
+
+	return 0;
+}
+EXPORT_SYMBOL(intel_ipc_pcm_params);
+
+int intel_pcm_open(struct snd_sof_dev *sdev,
+		   struct snd_pcm_substream *substream)
+{
+	struct intel_stream *stream = kmalloc(sizeof(*stream), GFP_KERNEL);
+
+	if (!stream)
+		return -ENOMEM;
+
+	/* binding pcm substream to hda stream */
+	substream->runtime->private_data = stream;
+
+	return 0;
+}
+EXPORT_SYMBOL(intel_pcm_open);
+
+int intel_pcm_close(struct snd_sof_dev *sdev,
+		    struct snd_pcm_substream *substream)
+{
+	struct intel_stream *stream = substream->runtime->private_data;
+
+	substream->runtime->private_data = NULL;
+	kfree(stream);
+
+	return 0;
+}
+EXPORT_SYMBOL(intel_pcm_close);
+
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
