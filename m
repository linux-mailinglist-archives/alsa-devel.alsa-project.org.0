Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2A0625281
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 05:27:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F91B167D;
	Fri, 11 Nov 2022 05:26:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F91B167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668140844;
	bh=jQVaKECLBwC0Ma03GPKt8XL3ZiTN4gAh61cT+UBkClk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LibCAzFCERgALVs6YhaWhW2DM2BDE6wc/uk1tC1YagODh1gXyFrHue4BqxPUh9T/1
	 VXMKQDh+EOEcMd9rn3FjwRDJrNxj7B4vAU4DcCeN/gzRxRTQuLhu7gRsD2h3f6HifP
	 tuV3EraWpqnGZQXoE5q0HM6QqqSGr07glHBjFaJg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30064F800CC;
	Fri, 11 Nov 2022 05:25:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EF93F80564; Fri, 11 Nov 2022 05:25:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48A61F800CC
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 05:25:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48A61F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XjZR2V4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668140715; x=1699676715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jQVaKECLBwC0Ma03GPKt8XL3ZiTN4gAh61cT+UBkClk=;
 b=XjZR2V4NeHZ1WlilvOnidSMe+Y2y6CaCqT38YjJgRkds0k7Z8JTc5Q3z
 wbVScjU2fmq7UeHg4QDOV1hccHmoOIMRYH3qY2P0rUA1kvDWDUkXAzKbC
 r43haUDZSRdjthHbpNG4fFC7cP94wig7A4PjRkCHb5XhkmF3x8mZybcqB
 nuJwwYsjSZXGNWYu/BxO/XW7Pul49VXktZHLYWFPt0BIjBfNLXF/FLASP
 n7UJxOaqoMxZtPkMZL2BarQlwWO4Xwg6YvYdG0Fn71uYtZWVO9DzvPaqN
 rgn0/Tvy6g4myqrIWFa9cOHtiEYFqu7MyVg7ZjpY156fB8z2e672+YCsH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291923716"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="291923716"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="588440713"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="588440713"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:09 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/8] ASoC: SOF: Intel: mtl: factor interrupt enable/disable
 interrupt functions
Date: Fri, 11 Nov 2022 12:26:48 +0800
Message-Id: <20221111042653.45520-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111042653.45520-1-yung-chuan.liao@linux.intel.com>
References: <20221111042653.45520-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The offsets and sequences are identical for interrupt enabling and
disabling, we can refactor the code with a single routine and a
boolean.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 120 +++++++++++++-------------------------
 1 file changed, 40 insertions(+), 80 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 7452a7dbb0e4..43ffcccec0be 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -134,112 +134,72 @@ static void mtl_disable_ipc_interrupts(struct snd_sof_dev *sdev)
 				MTL_DSP_REG_HFIPCXCTL_BUSY | MTL_DSP_REG_HFIPCXCTL_DONE, 0);
 }
 
-static int mtl_enable_interrupts(struct snd_sof_dev *sdev)
+static int mtl_enable_interrupts(struct snd_sof_dev *sdev, bool enable)
 {
 	u32 hfintipptr;
 	u32 irqinten;
-	u32 host_ipc;
 	u32 hipcie;
+	u32 mask;
+	u32 val;
 	int ret;
 
 	/* read Interrupt IP Pointer */
 	hfintipptr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_HFINTIPPTR) & MTL_HFINTIPPTR_PTR_MASK;
 
-	/* Enable Host IPC and SOUNDWIRE */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, hfintipptr,
-				MTL_IRQ_INTEN_L_HOST_IPC_MASK | MTL_IRQ_INTEN_L_SOUNDWIRE_MASK,
-				MTL_IRQ_INTEN_L_HOST_IPC_MASK | MTL_IRQ_INTEN_L_SOUNDWIRE_MASK);
+	/* Enable/Disable Host IPC and SOUNDWIRE */
+	mask = MTL_IRQ_INTEN_L_HOST_IPC_MASK | MTL_IRQ_INTEN_L_SOUNDWIRE_MASK;
+	if (enable)
+		val = mask;
+	else
+		val = 0;
+
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, hfintipptr, mask, val);
 
 	/* check if operation was successful */
-	host_ipc = MTL_IRQ_INTEN_L_HOST_IPC_MASK | MTL_IRQ_INTEN_L_SOUNDWIRE_MASK;
 	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, hfintipptr, irqinten,
-					    (irqinten & host_ipc) == host_ipc,
+					    (irqinten & mask) == val,
 					    HDA_DSP_REG_POLL_INTERVAL_US, HDA_DSP_RESET_TIMEOUT_US);
 	if (ret < 0) {
-		dev_err(sdev->dev, "failed to enable Host IPC and/or SOUNDWIRE\n");
+		dev_err(sdev->dev, "failed to %s Host IPC and/or SOUNDWIRE\n",
+			enable ? "enable" : "disable");
 		return ret;
 	}
 
-	/* Set Host IPC interrupt enable */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfHIPCIE,
-				MTL_DSP_REG_HfHIPCIE_IE_MASK, MTL_DSP_REG_HfHIPCIE_IE_MASK);
+	/* Enable/Disable Host IPC interrupt*/
+	mask = MTL_DSP_REG_HfHIPCIE_IE_MASK;
+	if (enable)
+		val = mask;
+	else
+		val = 0;
+
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfHIPCIE, mask, val);
 
 	/* check if operation was successful */
-	host_ipc = MTL_DSP_REG_HfHIPCIE_IE_MASK;
 	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfHIPCIE, hipcie,
-					    (hipcie & host_ipc) == host_ipc,
+					    (hipcie & mask) == val,
 					    HDA_DSP_REG_POLL_INTERVAL_US, HDA_DSP_RESET_TIMEOUT_US);
 	if (ret < 0) {
-		dev_err(sdev->dev, "failed to set Host IPC interrupt enable\n");
+		dev_err(sdev->dev, "failed to set Host IPC interrupt %s\n",
+			enable ? "enable" : "disable");
 		return ret;
 	}
 
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfSNDWIE,
-				MTL_DSP_REG_HfSNDWIE_IE_MASK, MTL_DSP_REG_HfSNDWIE_IE_MASK);
-	host_ipc = MTL_DSP_REG_HfSNDWIE_IE_MASK;
+	/* Enable/Disable SoundWire interrupt */
+	mask = MTL_DSP_REG_HfSNDWIE_IE_MASK;
+	if (enable)
+		val = mask;
+	else
+		val = 0;
+
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfSNDWIE, mask, val);
+
+	/* check if operation was successful */
 	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfSNDWIE, hipcie,
-					    (hipcie & host_ipc) == host_ipc,
+					    (hipcie & mask) == val,
 					    HDA_DSP_REG_POLL_INTERVAL_US, HDA_DSP_RESET_TIMEOUT_US);
 	if (ret < 0)
-		dev_err(sdev->dev, "failed to set SoundWire IPC interrupt enable\n");
-
-	return ret;
-}
-
-static int mtl_disable_interrupts(struct snd_sof_dev *sdev)
-{
-	u32 hfintipptr;
-	u32 irqinten;
-	u32 host_ipc;
-	u32 hipcie;
-	int ret1;
-	int ret;
-
-	/* read Interrupt IP Pointer */
-	hfintipptr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_HFINTIPPTR) & MTL_HFINTIPPTR_PTR_MASK;
-
-	/* Disable Host IPC and SOUNDWIRE */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, hfintipptr,
-				MTL_IRQ_INTEN_L_HOST_IPC_MASK | MTL_IRQ_INTEN_L_SOUNDWIRE_MASK, 0);
-
-	/* check if operation was successful */
-	host_ipc = MTL_IRQ_INTEN_L_HOST_IPC_MASK | MTL_IRQ_INTEN_L_SOUNDWIRE_MASK;
-	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, hfintipptr, irqinten,
-					    (irqinten & host_ipc) == 0,
-					    HDA_DSP_REG_POLL_INTERVAL_US, HDA_DSP_RESET_TIMEOUT_US);
-	/* Continue to disable other interrupts when error happens */
-	if (ret < 0)
-		dev_err(sdev->dev, "failed to disable Host IPC and SoundWire\n");
-
-	/* Set Host IPC interrupt disable */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfHIPCIE,
-				MTL_DSP_REG_HfHIPCIE_IE_MASK, 0);
-
-	/* check if operation was successful */
-	host_ipc = MTL_DSP_REG_HfHIPCIE_IE_MASK;
-	ret1 = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfHIPCIE, hipcie,
-					     (hipcie & host_ipc) == 0,
-					     HDA_DSP_REG_POLL_INTERVAL_US,
-					     HDA_DSP_RESET_TIMEOUT_US);
-	if (ret1 < 0) {
-		dev_err(sdev->dev, "failed to set Host IPC interrupt disable\n");
-		if (!ret)
-			ret = ret1;
-	}
-
-	/* Set SoundWire IPC interrupt disable */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfSNDWIE,
-				MTL_DSP_REG_HfSNDWIE_IE_MASK, 0);
-	host_ipc = MTL_DSP_REG_HfSNDWIE_IE_MASK;
-	ret1 = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfSNDWIE, hipcie,
-					     (hipcie & host_ipc) == 0,
-					     HDA_DSP_REG_POLL_INTERVAL_US,
-					     HDA_DSP_RESET_TIMEOUT_US);
-	if (ret1 < 0) {
-		dev_err(sdev->dev, "failed to set SoundWire IPC interrupt disable\n");
-		if (!ret)
-			ret = ret1;
-	}
+		dev_err(sdev->dev, "failed to set SoundWire IPC interrupt %s\n",
+			enable ? "enable" : "disable");
 
 	return ret;
 }
@@ -473,7 +433,7 @@ static int mtl_dsp_cl_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_bo
 				       chip->ipc_ack_mask);
 
 	/* step 4: enable interrupts */
-	ret = mtl_enable_interrupts(sdev);
+	ret = mtl_enable_interrupts(sdev, true);
 	if (ret < 0) {
 		if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 			dev_err(sdev->dev, "%s: failed to enable interrupts\n", __func__);
@@ -609,7 +569,7 @@ static void mtl_ipc_dump(struct snd_sof_dev *sdev)
 static int mtl_dsp_disable_interrupts(struct snd_sof_dev *sdev)
 {
 	mtl_disable_ipc_interrupts(sdev);
-	return mtl_disable_interrupts(sdev);
+	return mtl_enable_interrupts(sdev, false);
 }
 
 /* Meteorlake ops */
-- 
2.25.1

