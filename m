Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E38753F15D
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 23:05:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D751A1B45;
	Mon,  6 Jun 2022 23:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D751A1B45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654549510;
	bh=ifS3X2ZVVG41fQyv/amh9Pz2vpi1bsQx0bn1dTNiyfQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Km0L8p9wwfPmVH7Z3ZYY9OCmTvNQ2X5uDuiFGMmm19oV93p9gA877KbaH/SglkDzl
	 GRq05ZJQFGIEmRA/VrJeYvkJL8XMUGtCCsxLTzi/8isiY+tpwOZWoC9Zo7eNuY1Vrc
	 hn2dpsVdR85R+E6ksYNI8ul7XW8GYosPHSto6hlU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F368FF8053E;
	Mon,  6 Jun 2022 23:02:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48BFCF8053B; Mon,  6 Jun 2022 23:02:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 334F4F80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 23:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 334F4F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ilDlwyi4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654549362; x=1686085362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ifS3X2ZVVG41fQyv/amh9Pz2vpi1bsQx0bn1dTNiyfQ=;
 b=ilDlwyi4295sX51mim6ypi4+MjHLD65RBZ7zBTGXh6x7RTE3ec1Smemj
 u5kBHAjf7Dm3Q8G82JJ4Kv1ggXo6mmyVi7mnuG0K8wubYf6cmFjjJ48UI
 WEwJ+8e4IGl7KdSPSPjVzMbCV6oHAj3AY9ra0WvqhEL/oOoj3Da4o1sVi
 JQqYnQ2nMYtUV4aTVXI4aQ5vqX0ZZfo0C5Sh8fPYqLpbVo3YxMcJA9B3I
 bBMySz6S87FY4uSu0N1LUU4S4MGJdFHvaPdF96jyTmRsZcwtKNMyn0dkV
 8sc40FbTRvOHUc4IMU/1LjSdoW0c3gE4vKyiNxiGoOo4mLHHOiglfI5s9 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="275467625"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="275467625"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 14:02:31 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="608914456"
Received: from yantem-mobl9.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.24.154])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 14:02:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] ASoC: SOF: mediatek: mt8195 suspend check dsp idle
Date: Mon,  6 Jun 2022 16:02:12 -0500
Message-Id: <20220606210212.146626-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606210212.146626-1-pierre-louis.bossart@linux.intel.com>
References: <20220606210212.146626-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 YC Hung <yc.hung@mediatek.com>
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

From: YC Hung <yc.hung@mediatek.com>

During suspend flow, sof_suspend will be called and the pm_ops->ctx_save
callback notifies DSP of the upcoming power down.

Upon receipt of the ctx_save IPC, the DSP will start the D3 transition.
Before the DSP enter idle, an interrupt is generated to notify the host of
the power state change.

Since the host and DSP are two different processors, there could be a
race condition, which can be avoided by polling with 1s timeout and 500us
intervals

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: YC Hung <yc.hung@mediatek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 13 +++++++++++++
 sound/soc/sof/mediatek/mt8195/mt8195.h |  5 +++++
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 64d1b5a4e31b1..9c146015cd1b7 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -443,6 +443,19 @@ static int mt8195_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 {
 	struct platform_device *pdev = container_of(sdev->dev, struct platform_device, dev);
 	int ret;
+	u32 reset_sw, dbg_pc;
+
+	/* wait dsp enter idle, timeout is 1 second */
+	ret = snd_sof_dsp_read_poll_timeout(sdev, DSP_REG_BAR,
+					    DSP_RESET_SW, reset_sw,
+					    ((reset_sw & ADSP_PWAIT) == ADSP_PWAIT),
+					    SUSPEND_DSP_IDLE_POLL_INTERVAL_US,
+					    SUSPEND_DSP_IDLE_TIMEOUT_US);
+	if (ret < 0) {
+		dbg_pc = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGPC);
+		dev_warn(sdev->dev, "dsp not idle, powering off anyway : swrest %#x, pc %#x, ret %d\n",
+			 reset_sw, dbg_pc, ret);
+	}
 
 	/* stall and reset dsp */
 	sof_hifixdsp_shutdown(sdev);
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.h b/sound/soc/sof/mediatek/mt8195/mt8195.h
index 9294241823572..7ffd523f936c8 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.h
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.h
@@ -34,6 +34,7 @@ struct snd_sof_dev;
 #define ADSP_DRESET_SW			BIT(1)
 #define ADSP_RUNSTALL			BIT(3)
 #define STATVECTOR_SEL			BIT(4)
+#define ADSP_PWAIT			BIT(16)
 #define DSP_PFAULTBUS			0x0028
 #define DSP_PFAULTINFO			0x002c
 #define DSP_GPR00			0x0030
@@ -153,6 +154,10 @@ struct snd_sof_dev;
 #define DRAM_REMAP_SHIFT	12
 #define DRAM_REMAP_MASK		(BIT(DRAM_REMAP_SHIFT) - 1)
 
+/* suspend dsp idle check interval and timeout */
+#define SUSPEND_DSP_IDLE_TIMEOUT_US		1000000	/* timeout to wait dsp idle, 1 sec */
+#define SUSPEND_DSP_IDLE_POLL_INTERVAL_US	500	/* 0.5 msec */
+
 void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr);
 void sof_hifixdsp_shutdown(struct snd_sof_dev *sdev);
 #endif
-- 
2.34.1

