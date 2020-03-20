Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 692A218D330
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 16:44:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F7511657;
	Fri, 20 Mar 2020 16:44:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F7511657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584719092;
	bh=n+Yry3DaOvGT+CCP+YAKlBTHewR4Ot0fpbZIughT3sk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LslYfSKUQVYr/tquO+7YGq9FIi1nc3ljXw1ppRx3cZyQx0T7ZXC8p3PSRDpcrgH6W
	 GPRDUqK0nG2HI4kbgW54vBd/wFgYp0kOtG3Lp/GuPBGjCsw0WnzRE19VvNx3V9OP/7
	 Mqmy4h9EbEghufrolNkJckrd2pw51ROqsJvKTQx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ED6BF802E1;
	Fri, 20 Mar 2020 16:41:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF8F2F801F9; Fri, 20 Mar 2020 16:40:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66FD7F801F9;
 Fri, 20 Mar 2020 16:40:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66FD7F801F9
IronPort-SDR: NrR+RfA0lauIhYcIHXv2EptQbOz4A9NCOdyAhpX69kB9b/xk7oaDyO/h+GjruZZdGk49E5LaCi
 syzTIogLt6AQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 08:40:30 -0700
IronPort-SDR: +v7gXFHFVzjLkmMlIityZc/oSffingUxN1BCkIRFnSZCFHlLoc1v0wqwEouXjwkCqzf5y8kiDZ
 cAg8CcenKmlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,285,1580803200"; d="scan'208";a="237257392"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.252.57.199])
 by fmsmga007.fm.intel.com with ESMTP; 20 Mar 2020 08:40:29 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/12] ASoC: SOF: add a power status IPC
Date: Fri, 20 Mar 2020 16:40:15 +0100
Message-Id: <20200320154021.5964-7-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200320154021.5964-1-guennadi.liakhovetski@linux.intel.com>
References: <20200320154021.5964-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: sound-open-firmware@alsa-project.org
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

