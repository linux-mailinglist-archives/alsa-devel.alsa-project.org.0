Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 874B970241
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 16:25:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11A601835;
	Mon, 22 Jul 2019 16:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11A601835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563805524;
	bh=+VxXzhauI9466MTWWZkR0AYzky34tklPRBJF8MooT/g=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bwvF1tP1IdYFzPAHEJfTUyhpBQPCfQ1y6RY35RCRlOmGppsIKG+uNt+ZRSuFODQaO
	 JkgMrdamLWY7RXffPExVAnl4k98XhdKbJ+pSmKUJIDNxsRIMj3xohxjUJ9EKgxB8SW
	 ZgWKLBI19adOwmw5yjixEsds1tBhdNdri/7oKUp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 159A7F80659;
	Mon, 22 Jul 2019 16:14:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA5B0F80534; Mon, 22 Jul 2019 16:14:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAEA0F804CB
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 16:14:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAEA0F804CB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 07:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="192733293"
Received: from agalla-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.103.46])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2019 07:14:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 22 Jul 2019 09:13:55 -0500
Message-Id: <20190722141402.7194-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
References: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 14/21] ASoC: SOF: Intel: hda: use SOF defined
	init chip in resume
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>

Unify resume code by using SOF common function hda_dsp_ctrl_init_chip()
which can handle both HDA and non-HDA cases. Move code to reset
stream-to-link mapping into hda_dsp_ctrl_init_chip().

Signed-off-by: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c |  9 +++++++++
 sound/soc/sof/intel/hda-dsp.c  | 26 --------------------------
 2 files changed, 9 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 015760284969..8b856dc35e20 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -164,6 +164,9 @@ int hda_dsp_ctrl_clock_power_gating(struct snd_sof_dev *sdev, bool enable)
 int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	struct hdac_ext_link *hlink;
+#endif
 	struct hdac_stream *stream;
 	int sd_offset, ret = 0;
 
@@ -253,6 +256,12 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 				  upper_32_bits(bus->posbuf.addr));
 	}
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	/* Reset stream-to-link mapping */
+	list_for_each_entry(hlink, &bus->hlink_list, list)
+		bus->io_ops->reg_writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
+#endif
+
 	bus->chip_init = true;
 
 	hda_dsp_ctrl_misc_clock_gating(sdev, true);
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index f9579edbca68..f08a5d649346 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -368,32 +368,6 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 	/* check dma status and clean up CORB/RIRB buffers */
 	if (!bus->cmd_dma_state)
 		snd_hdac_bus_stop_cmd_io(bus);
-#else
-
-	hda_dsp_ctrl_misc_clock_gating(sdev, false);
-
-	/* reset controller */
-	ret = hda_dsp_ctrl_link_reset(sdev, true);
-	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: failed to reset controller during resume\n");
-		return ret;
-	}
-
-	/* take controller out of reset */
-	ret = hda_dsp_ctrl_link_reset(sdev, false);
-	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: failed to ready controller during resume\n");
-		return ret;
-	}
-
-	/* enable hda bus irq */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL,
-				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN,
-				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN);
-
-	hda_dsp_ctrl_misc_clock_gating(sdev, true);
 #endif
 
 	/* enable ppcap interrupt */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
