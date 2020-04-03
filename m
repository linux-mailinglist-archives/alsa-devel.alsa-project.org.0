Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E08F919D366
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 11:21:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76020167D;
	Fri,  3 Apr 2020 11:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76020167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585905691;
	bh=n+Yry3DaOvGT+CCP+YAKlBTHewR4Ot0fpbZIughT3sk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vBZSUeJWJtC+cUPzDezTPqzVrIdByEZFVGodSejuTbzXxcsJculyqLaPtGtwkLw7J
	 u5RO3fFk30znpGlX7hwxCj2G7oW3ui+d63+JqgNYsW55TBMwETfDE78/erDNaP3Ddk
	 0zfzVfYyFFY60VBN88792q84dVw7bHPHqh0WkJmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7931EF80348;
	Fri,  3 Apr 2020 11:15:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D306EF8028F; Fri,  3 Apr 2020 11:14:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D7DBF80141;
 Fri,  3 Apr 2020 11:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D7DBF80141
IronPort-SDR: liStt8SelMKVdoLP2217AnPQ3fXN4X7uMLI2KQHf/dqhxBwGvae1FBLIBkdDuEorKmJFRi6ofq
 1q82mMsPZVzA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 02:14:19 -0700
IronPort-SDR: SXdd6sJIvOq2FQKMxKZXYKZYKe97lmkEoGDoD4rUKNq6qkDBqINvKqPxeoSitUtBgL3EmHu+vr
 bE0FYFZpog/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="451234959"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.36.113])
 by fmsmga006.fm.intel.com with ESMTP; 03 Apr 2020 02:14:18 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 06/12] [RESEND] ASoC: SOF: add a power status IPC
Date: Fri,  3 Apr 2020 11:14:00 +0200
Message-Id: <20200403091406.22381-7-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
References: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

In a virtualised configuration the runtime PM of the host and any
guests aren't synchronised. But guests have to be able to tell the
host when they suspend and resume and know, whether the host has been
runtime suspended since that guests's topology had been sent to the
host last time. This is needed to decide whether to re-send the
topology again. To support this we add a new PM IPC message
SOF_IPC_PM_VFE_POWER_STATUS and a reset counter to track the state of
the DSP.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 include/sound/sof/header.h | 1 +
 sound/soc/sof/core.c       | 2 ++
 sound/soc/sof/ipc.c        | 2 ++
 sound/soc/sof/loader.c     | 4 ++++
 sound/soc/sof/sof-priv.h   | 4 ++++
 5 files changed, 13 insertions(+)

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index b794795..1aaccb5a 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -77,6 +77,7 @@
 #define SOF_IPC_PM_CLK_REQ			SOF_CMD_TYPE(0x006)
 #define SOF_IPC_PM_CORE_ENABLE			SOF_CMD_TYPE(0x007)
 #define SOF_IPC_PM_GATE				SOF_CMD_TYPE(0x008)
+#define SOF_IPC_PM_VFE_POWER_STATUS		SOF_CMD_TYPE(0x010)
 
 /* component runtime config - multiple different types */
 #define SOF_IPC_COMP_SET_VALUE			SOF_CMD_TYPE(0x001)
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index ca30d67..42dd72e 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -8,6 +8,7 @@
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
 
+#include <linux/atomic.h>
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <sound/soc.h>
@@ -311,6 +312,7 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
 	sdev->extractor_stream_tag = SOF_PROBE_INVALID_NODE_ID;
 #endif
+	atomic_set(&sdev->reset_count, 0);
 	dev_set_drvdata(dev, sdev);
 
 	/* check all mandatory ops */
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 6fa501c1..b0b38ca 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -105,6 +105,8 @@ static void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
 			str2 = "CLK_REQ"; break;
 		case SOF_IPC_PM_CORE_ENABLE:
 			str2 = "CORE_ENABLE"; break;
+		case SOF_IPC_PM_VFE_POWER_STATUS:
+			str2 = "VFE_POWER_STATUS"; break;
 		default:
 			str2 = "unknown type"; break;
 		}
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 1f2e0be..80854c9 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -10,6 +10,7 @@
 // Generic firmware loader.
 //
 
+#include <linux/atomic.h>
 #include <linux/firmware.h>
 #include <sound/sof.h>
 #include "ops.h"
@@ -611,6 +612,9 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 	/* fw boot is complete. Update the active cores mask */
 	sdev->enabled_cores_mask = init_core_mask;
 
+	/* increment reset count */
+	atomic_add(1, &sdev->reset_count);
+
 	return 0;
 }
 EXPORT_SYMBOL(snd_sof_run_firmware);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 922b671..0792125 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -11,6 +11,7 @@
 #ifndef __SOUND_SOC_SOF_PRIV_H
 #define __SOUND_SOC_SOF_PRIV_H
 
+#include <linux/atomic.h>
 #include <linux/device.h>
 #include <sound/hdaudio.h>
 #include <sound/sof.h>
@@ -425,6 +426,9 @@ struct snd_sof_dev {
 	unsigned int extractor_stream_tag;
 #endif
 
+	/* VirtIO fields for host and guest */
+	atomic_t reset_count;
+
 	/* DMA for Trace */
 	struct snd_dma_buffer dmatb;
 	struct snd_dma_buffer dmatp;
-- 
1.9.3

