Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 867A6613E93
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 20:55:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F18B21672;
	Mon, 31 Oct 2022 20:54:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F18B21672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667246117;
	bh=PxjoafBV9hadLKPkcD9ArILSbah+naj2ZEdjx+dcaFs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bxhHXENzErRkCvd+4y6C9WEnh5yx81eY0rF1kNRzjHyAZr626PqHXvdsfc8ifAXw9
	 Y2ecpPHBq2cQFhPP8RjnXlAFMfHhRY9YzhYiuqS8vjZw/tj6wHTftX8wqACQ39c4Vw
	 mY6xTWdXdId61KHHE3wZIx0gpiZs0qlE8InlJXVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F614F800CC;
	Mon, 31 Oct 2022 20:54:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA68AF80163; Mon, 31 Oct 2022 20:54:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C38AF800E1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 20:54:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C38AF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="k1eQLSrx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667246055; x=1698782055;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PxjoafBV9hadLKPkcD9ArILSbah+naj2ZEdjx+dcaFs=;
 b=k1eQLSrxjPSDfMT/wVBH6LJaRo8jCSF/NRlFg2i1V6KbcPYxyrwbRRsh
 0sfjU02UEkQgkxVo7pkobVzPdCQhIoJzwbGdQ2i83AJ27h57dp8T2C7WM
 M8Df1RxBcY/dDa+fMMGzspNo4F9k2DbhXplH6ONL8suR02R+K199A85D+
 Gensot22iq4g/ft52APeN6w2WsOfIjfBWaIIQSUVExMHe6XEttlxgkffk
 F9Pawff6lpWhzkMgDME7PzUQnASNim809Ba3JrzOyfH/DoSbCRd5DKc0/
 ElKGbfbi4yqAz/LVmQrc6MJuxQCTbO8y/GDTLstREeBLzV8woHLi+YOhB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="310688400"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="310688400"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 12:53:59 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="666948554"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="666948554"
Received: from kumarhit-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.6.36])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 12:53:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: fix compilation issue with readb/writeb helpers
Date: Mon, 31 Oct 2022 15:53:40 -0400
Message-Id: <20221031195340.249868-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Nathan Chancellor <nathan@kernel.org>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Replace them with read8/write8 to avoid compilation issue on ARM. In
hindsight this is more consistent with the read64/write64 helpers
already used in SOF.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Link: https://lore.kernel.org/alsa-devel/Y1rTFrohLqaiZAy%2F@dev-arch.thelio-3990X/
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c    |  6 +++---
 sound/soc/sof/intel/hda-stream.c |  2 +-
 sound/soc/sof/intel/hda.c        |  2 +-
 sound/soc/sof/ops.h              | 18 +++++++++---------
 sound/soc/sof/sof-priv.h         |  4 ++--
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index c61bab1a5719..6d5c26a2147e 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -349,7 +349,7 @@ static int hda_dsp_wait_d0i3c_done(struct snd_sof_dev *sdev)
 {
 	int retry = HDA_DSP_REG_POLL_RETRY_COUNT;
 
-	while (snd_sof_dsp_readb(sdev, HDA_DSP_HDA_BAR, SOF_HDA_VS_D0I3C) & SOF_HDA_VS_D0I3C_CIP) {
+	while (snd_sof_dsp_read8(sdev, HDA_DSP_HDA_BAR, SOF_HDA_VS_D0I3C) & SOF_HDA_VS_D0I3C_CIP) {
 		if (!retry--)
 			return -ETIMEDOUT;
 		usleep_range(10, 15);
@@ -389,7 +389,7 @@ static int hda_dsp_update_d0i3c_register(struct snd_sof_dev *sdev, u8 value)
 	}
 
 	/* Update D0I3C register */
-	snd_sof_dsp_updateb(sdev, HDA_DSP_HDA_BAR,
+	snd_sof_dsp_update8(sdev, HDA_DSP_HDA_BAR,
 			    SOF_HDA_VS_D0I3C, SOF_HDA_VS_D0I3C_I3, value);
 
 	/* Wait for cmd in progress to be cleared before exiting the function */
@@ -399,7 +399,7 @@ static int hda_dsp_update_d0i3c_register(struct snd_sof_dev *sdev, u8 value)
 		return ret;
 	}
 
-	reg = snd_sof_dsp_readb(sdev, HDA_DSP_HDA_BAR, SOF_HDA_VS_D0I3C);
+	reg = snd_sof_dsp_read8(sdev, HDA_DSP_HDA_BAR, SOF_HDA_VS_D0I3C);
 	trace_sof_intel_D0I3C_updated(sdev, reg);
 
 	return 0;
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 8e3f05857632..7f0fd05a96e6 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -455,7 +455,7 @@ int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev, struct hdac_ext_st
 				mask, mask);
 
 	/* Follow HW recommendation to set the guardband value to 95us during FW boot */
-	snd_sof_dsp_updateb(sdev, HDA_DSP_HDA_BAR, HDA_VS_INTEL_LTRP,
+	snd_sof_dsp_update8(sdev, HDA_DSP_HDA_BAR, HDA_VS_INTEL_LTRP,
 			    HDA_VS_INTEL_LTRP_GB_MASK, HDA_LTRP_GB_VALUE_US);
 
 	/* start DMA */
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 99be5ef78324..348fbfb6a2c2 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -630,7 +630,7 @@ void hda_ipc_irq_dump(struct snd_sof_dev *sdev)
 	intsts = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTSTS);
 	intctl = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL);
 	ppsts = snd_sof_dsp_read(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPSTS);
-	rirbsts = snd_sof_dsp_readb(sdev, HDA_DSP_HDA_BAR, AZX_REG_RIRBSTS);
+	rirbsts = snd_sof_dsp_read8(sdev, HDA_DSP_HDA_BAR, AZX_REG_RIRBSTS);
 
 	dev_err(sdev->dev, "hda irq intsts 0x%8.8x intlctl 0x%8.8x rirb %2.2x\n",
 		intsts, intctl, rirbsts);
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 8cb93e7c0c67..c52752250565 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -302,11 +302,11 @@ static inline int snd_sof_debugfs_add_region_item(struct snd_sof_dev *sdev,
 }
 
 /* register IO */
-static inline void snd_sof_dsp_writeb(struct snd_sof_dev *sdev, u32 bar,
+static inline void snd_sof_dsp_write8(struct snd_sof_dev *sdev, u32 bar,
 				      u32 offset, u8 value)
 {
-	if (sof_ops(sdev)->writeb)
-		sof_ops(sdev)->writeb(sdev, sdev->bar[bar] + offset, value);
+	if (sof_ops(sdev)->write8)
+		sof_ops(sdev)->write8(sdev, sdev->bar[bar] + offset, value);
 	else
 		writeb(value,  sdev->bar[bar] + offset);
 }
@@ -329,11 +329,11 @@ static inline void snd_sof_dsp_write64(struct snd_sof_dev *sdev, u32 bar,
 		writeq(value, sdev->bar[bar] + offset);
 }
 
-static inline u8 snd_sof_dsp_readb(struct snd_sof_dev *sdev, u32 bar,
+static inline u8 snd_sof_dsp_read8(struct snd_sof_dev *sdev, u32 bar,
 				   u32 offset)
 {
-	if (sof_ops(sdev)->readb)
-		return sof_ops(sdev)->readb(sdev, sdev->bar[bar] + offset);
+	if (sof_ops(sdev)->read8)
+		return sof_ops(sdev)->read8(sdev, sdev->bar[bar] + offset);
 	else
 		return readb(sdev->bar[bar] + offset);
 }
@@ -356,15 +356,15 @@ static inline u64 snd_sof_dsp_read64(struct snd_sof_dev *sdev, u32 bar,
 		return readq(sdev->bar[bar] + offset);
 }
 
-static inline void snd_sof_dsp_updateb(struct snd_sof_dev *sdev, u32 bar,
+static inline void snd_sof_dsp_update8(struct snd_sof_dev *sdev, u32 bar,
 				       u32 offset, u8 value, u8 mask)
 {
 	u8 reg;
 
-	reg = snd_sof_dsp_readb(sdev, bar, offset);
+	reg = snd_sof_dsp_read8(sdev, bar, offset);
 	reg &= ~mask;
 	reg |= value;
-	snd_sof_dsp_writeb(sdev, bar, offset, reg);
+	snd_sof_dsp_write8(sdev, bar, offset, reg);
 }
 
 /* block IO */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 876e6fdbef4f..0ad48d73d1f7 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -174,9 +174,9 @@ struct snd_sof_dsp_ops {
 	 * TODO: consider removing these operations and calling respective
 	 * implementations directly
 	 */
-	void (*writeb)(struct snd_sof_dev *sof_dev, void __iomem *addr,
+	void (*write8)(struct snd_sof_dev *sof_dev, void __iomem *addr,
 		       u8 value); /* optional */
-	u8 (*readb)(struct snd_sof_dev *sof_dev,
+	u8 (*read8)(struct snd_sof_dev *sof_dev,
 		    void __iomem *addr); /* optional */
 	void (*write)(struct snd_sof_dev *sof_dev, void __iomem *addr,
 		      u32 value); /* optional */
-- 
2.34.1

