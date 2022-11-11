Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A20625280
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 05:27:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C732F165E;
	Fri, 11 Nov 2022 05:26:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C732F165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668140823;
	bh=H3/b94c2awslnDKSnAllz+db/ARNE7nM/0mor8r2krA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dSwkFiFCUOVXTzHwnGANlDL7bgTa7ggXPgyBuITcpaCB+QXHoGRS6irXt9gf0KiJG
	 S28Pt3OvgShAnvsy2ieC+I5oZQ4IwrjJluyWz/X7fJO43SNaeeeXQ3vGbjiZG55Q7a
	 zz8VwGsub/fdnIsZqVsEVUlAcm0gtYMvjzh/YjSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96074F804AB;
	Fri, 11 Nov 2022 05:25:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5708BF804AB; Fri, 11 Nov 2022 05:25:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FBC2F804AB
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 05:25:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FBC2F804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UF4s7Sda"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668140717; x=1699676717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H3/b94c2awslnDKSnAllz+db/ARNE7nM/0mor8r2krA=;
 b=UF4s7SdaLt7GjV4J/hIC0TXtdueE1nFvOyo77Qa7Xfz8gs7sDxh8bOqw
 Vc2RDCooG5hmdGrEcngM7hYR8K7tyM4GSBM6ztfqzc1rayfq0K86tVRon
 r3Wzn8/SGH/1cL22KUnZN8P5GRUnIc/k6XMVLeNthN5FNAR4JZfd54+xf
 W40ogMFzspZQ/6Aq1jwKBgIDDSy4pRiCQamTGlsr6C2j1uWL5BtabRA1J
 Ecq29mn48E5rIfFRyGCjd/ywvjh96/KxYnkWPlwWETQUIOVOQJIFcg1xf
 4REXJhgcbOl/7vSEqbBUD9mL9HB5TuvjZ7olXPt4hXChZ6bg49cZ0l+3n w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291923725"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="291923725"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="588440731"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="588440731"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:12 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 4/8] ASoC: SOF: Intel: mtl: move SoundWire interrupt enabling
 to callback
Date: Fri, 11 Nov 2022 12:26:49 +0800
Message-Id: <20221111042653.45520-5-yung-chuan.liao@linux.intel.com>
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

There's no real rationale for enabling the SoundWire interrupt in the
init, this can be done from the enable_sdw_irq() callback.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 44 ++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 43ffcccec0be..a0839804a6da 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -134,6 +134,31 @@ static void mtl_disable_ipc_interrupts(struct snd_sof_dev *sdev)
 				MTL_DSP_REG_HFIPCXCTL_BUSY | MTL_DSP_REG_HFIPCXCTL_DONE, 0);
 }
 
+static void mtl_enable_sdw_irq(struct snd_sof_dev *sdev, bool enable)
+{
+	u32 hipcie;
+	u32 mask;
+	u32 val;
+	int ret;
+
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
+	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfSNDWIE, hipcie,
+					    (hipcie & mask) == val,
+					    HDA_DSP_REG_POLL_INTERVAL_US, HDA_DSP_RESET_TIMEOUT_US);
+	if (ret < 0)
+		dev_err(sdev->dev, "failed to set SoundWire IPC interrupt %s\n",
+			enable ? "enable" : "disable");
+}
+
 static int mtl_enable_interrupts(struct snd_sof_dev *sdev, bool enable)
 {
 	u32 hfintipptr;
@@ -184,23 +209,6 @@ static int mtl_enable_interrupts(struct snd_sof_dev *sdev, bool enable)
 		return ret;
 	}
 
-	/* Enable/Disable SoundWire interrupt */
-	mask = MTL_DSP_REG_HfSNDWIE_IE_MASK;
-	if (enable)
-		val = mask;
-	else
-		val = 0;
-
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfSNDWIE, mask, val);
-
-	/* check if operation was successful */
-	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_DSP_REG_HfSNDWIE, hipcie,
-					    (hipcie & mask) == val,
-					    HDA_DSP_REG_POLL_INTERVAL_US, HDA_DSP_RESET_TIMEOUT_US);
-	if (ret < 0)
-		dev_err(sdev->dev, "failed to set SoundWire IPC interrupt %s\n",
-			enable ? "enable" : "disable");
-
 	return ret;
 }
 
@@ -568,6 +576,7 @@ static void mtl_ipc_dump(struct snd_sof_dev *sdev)
 
 static int mtl_dsp_disable_interrupts(struct snd_sof_dev *sdev)
 {
+	mtl_enable_sdw_irq(sdev, false);
 	mtl_disable_ipc_interrupts(sdev);
 	return mtl_enable_interrupts(sdev, false);
 }
@@ -645,6 +654,7 @@ const struct sof_intel_dsp_desc mtl_chip_info = {
 	.sdw_shim_base = SDW_SHIM_BASE_ACE,
 	.sdw_alh_base = SDW_ALH_BASE_ACE,
 	.d0i3_offset = MTL_HDA_VS_D0I3C,
+	.enable_sdw_irq = mtl_enable_sdw_irq,
 	.check_sdw_irq = mtl_dsp_check_sdw_irq,
 	.check_ipc_irq = mtl_dsp_check_ipc_irq,
 	.cl_init = mtl_dsp_cl_init,
-- 
2.25.1

