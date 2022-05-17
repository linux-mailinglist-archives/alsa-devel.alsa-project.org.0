Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EC152A94F
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 19:33:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFC70886;
	Tue, 17 May 2022 19:32:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFC70886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652808810;
	bh=CIN3llFIXMjAgK4mAjhOBfwt63OVOEG19IJ6tqxHZ6I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D6XhH3J/nUQrLQYnHgrZccJ3ccpiTleIcgR/ILlMS6T69h2cuKE8otdLL6JhgixLF
	 x7FlRonBgpTy2IIYQiTex6kLys1HiJoMfsFcwOyOIwMoA3Tbh4gDRwVdNtXRsaNfyR
	 Yc1OaQtgYr2dy7vxK/CSUFt0ue5rQMIbFu75Jufw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00BDEF80519;
	Tue, 17 May 2022 19:31:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E35A2F8047C; Tue, 17 May 2022 19:31:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36905F801D8
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 19:31:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36905F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DrPruaYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652808706; x=1684344706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CIN3llFIXMjAgK4mAjhOBfwt63OVOEG19IJ6tqxHZ6I=;
 b=DrPruaYsOV1z9XxvH0wjR6hjrkHMq6xXMmd8UAkI/ze4pZJ3qPdHVrgP
 CCWvRN2e2FiANT9QMorHxFBx8hxEIq7zgYaChGXTU1UVsGftASqnWHN5t
 PROLFv8PS+rVtQ/+ECsGoT45WS4qfTGS1mRi+VUEQ7NDpjKQH9iE73X39
 He8s8tYlGSy9mN51gcJUIedEGrh9cCBpnkGVg172oxXYcWRq7u0pl0prX
 Q+rvmYy97+hAs49diOr9PEvNAKyOEd196WOVxVY0Qi/CGoElwr/9k9chn
 e7fHuGZMj8MDPj+HDDnlZMkRc89k/ufQdIarxvM6llX2knYHTI++6K4zR A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="258824308"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="258824308"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 10:31:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="672959377"
Received: from sfilary-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.67.235])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 10:31:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: SOF: mediatek: Add mt8195 debug dump
Date: Tue, 17 May 2022 12:31:09 -0500
Message-Id: <20220517173109.468568-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220517173109.468568-1-pierre-louis.bossart@linux.intel.com>
References: <20220517173109.468568-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

Add mt8195_adsp_dump in mt8195.c for debug_dump callback to dump
mt8195 debug registers and call mtk_adsp_dump.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: YC Hung <yc.hung@mediatek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index f4b24afb6f751..756b59fb79be4 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -25,6 +25,7 @@
 #include "../../sof-of-dev.h"
 #include "../../sof-audio.h"
 #include "../adsp_helper.h"
+#include "../mtk-adsp-common.h"
 #include "mt8195.h"
 #include "mt8195-clk.h"
 
@@ -486,6 +487,31 @@ static int mt8195_ipc_msg_data(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+static void mt8195_adsp_dump(struct snd_sof_dev *sdev, u32 flags)
+{
+	u32 dbg_pc, dbg_data, dbg_bus0, dbg_bus1, dbg_inst;
+	u32 dbg_ls0stat, dbg_ls1stat, faultbus, faultinfo, swrest;
+
+	/* dump debug registers */
+	dbg_pc = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGPC);
+	dbg_data = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGDATA);
+	dbg_bus0 = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGBUS0);
+	dbg_bus1 = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGBUS1);
+	dbg_inst = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGINST);
+	dbg_ls0stat = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGLS0STAT);
+	dbg_ls1stat = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUGLS1STAT);
+	faultbus = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PFAULTBUS);
+	faultinfo = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PFAULTINFO);
+	swrest = snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_RESET_SW);
+
+	dev_info(sdev->dev, "adsp dump : pc %#x, data %#x, bus0 %#x, bus1 %#x, swrest %#x",
+		 dbg_pc, dbg_data, dbg_bus0, dbg_bus1, swrest);
+	dev_info(sdev->dev, "dbg_inst %#x, ls0stat %#x, ls1stat %#x, faultbus %#x, faultinfo %#x",
+		 dbg_inst, dbg_ls0stat, dbg_ls1stat, faultbus, faultinfo);
+
+	mtk_adsp_dump(sdev, flags);
+}
+
 static struct snd_soc_dai_driver mt8195_dai[] = {
 {
 	.name = "SOF_DL2",
@@ -553,6 +579,9 @@ static struct snd_sof_dsp_ops sof_mt8195_ops = {
 	/* Firmware ops */
 	.dsp_arch_ops = &sof_xtensa_arch_ops,
 
+	/* Debug information */
+	.dbg_dump = mt8195_adsp_dump,
+
 	/* DAI drivers */
 	.drv = mt8195_dai,
 	.num_drv = ARRAY_SIZE(mt8195_dai),
-- 
2.30.2

