Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A10264A21
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 18:45:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69C7016D8;
	Thu, 10 Sep 2020 18:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69C7016D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599756343;
	bh=+UnrjGI+DKeB1aNaPkAk+/SityWmFAehB1d/CMj3pDY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=juFY6+KUKtFY5YChTrM1f4tdIpgQLhl61kSMQA/rH0b83BSe5kkQqUbaXqqcZKw+F
	 iQeWoQtv+5PA4ihIZdY8rLcs6cqL5PtM/klc68a/w2E88zUJ57VbtuGt0iphpXPWKd
	 YFFsecbyQiBZ3mIjIr2e470Xu4B5O9MtZSutCcqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5478FF802C4;
	Thu, 10 Sep 2020 18:43:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 001FCF802C4; Thu, 10 Sep 2020 18:43:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 799C2F801F2
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 18:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 799C2F801F2
IronPort-SDR: 3gZcmg7Alo/Oqp3+1+M0AgaPHWipg64vSSRbeXyLpmjco5OBV8kpFelYeH6S2LETCgibYrBaMV
 UYLKd/ydWvWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="146278531"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="146278531"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 09:42:51 -0700
IronPort-SDR: /aMZZRYojpNNlfTbsrhaNLyJUgdXczJdVso24kM//5Bl9qrnc7LsrTUIYHGl0gdMI6SzJbvZ7g
 xy2WM7sgckYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="304937878"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006.jf.intel.com with ESMTP; 10 Sep 2020 09:42:49 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/4] ASoC: SOF: rename cores_mask to host_managed_cores_mask
Date: Thu, 10 Sep 2020 19:41:22 +0300
Message-Id: <20200910164125.2033062-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200910164125.2033062-1-kai.vehmanen@linux.intel.com>
References: <20200910164125.2033062-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 Rander Wang <rander.wang@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Rename the cores_mask in struct sof_intel_dsp_desc to
host_managed_cores_mask to be more indicative of the fact that
only these cores can be powered up/down by the host.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/apl.c        | 2 +-
 sound/soc/sof/intel/bdw.c        | 2 +-
 sound/soc/sof/intel/byt.c        | 6 +++---
 sound/soc/sof/intel/cnl.c        | 8 ++++----
 sound/soc/sof/intel/hda-dsp.c    | 2 +-
 sound/soc/sof/intel/hda-loader.c | 6 +++---
 sound/soc/sof/intel/hda.c        | 2 +-
 sound/soc/sof/intel/shim.h       | 2 +-
 sound/soc/sof/intel/tgl.c        | 2 +-
 9 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 9e29d4fd393a..25d3f5775aac 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -129,7 +129,7 @@ const struct sof_intel_dsp_desc apl_chip_info = {
 	/* Apollolake */
 	.cores_num = 2,
 	.init_core_mask = 1,
-	.cores_mask = HDA_DSP_CORE_MASK(0) | HDA_DSP_CORE_MASK(1),
+	.host_managed_cores_mask = HDA_DSP_CORE_MASK(0) | HDA_DSP_CORE_MASK(1),
 	.ipc_req = HDA_DSP_REG_HIPCI,
 	.ipc_req_mask = HDA_DSP_REG_HIPCI_BUSY,
 	.ipc_ack = HDA_DSP_REG_HIPCIE,
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 99fd0bd7276e..50a4a73e6b9f 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -655,7 +655,7 @@ EXPORT_SYMBOL_NS(sof_bdw_ops, SND_SOC_SOF_BROADWELL);
 
 const struct sof_intel_dsp_desc bdw_chip_info = {
 	.cores_num = 1,
-	.cores_mask = 1,
+	.host_managed_cores_mask = 1,
 };
 EXPORT_SYMBOL_NS(bdw_chip_info, SND_SOC_SOF_BROADWELL);
 
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 49f67f1b94e0..186736ee5fc2 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -651,7 +651,7 @@ EXPORT_SYMBOL_NS(sof_tng_ops, SND_SOC_SOF_MERRIFIELD);
 
 const struct sof_intel_dsp_desc tng_chip_info = {
 	.cores_num = 1,
-	.cores_mask = 1,
+	.host_managed_cores_mask = 1,
 };
 EXPORT_SYMBOL_NS(tng_chip_info, SND_SOC_SOF_MERRIFIELD);
 
@@ -896,7 +896,7 @@ EXPORT_SYMBOL_NS(sof_byt_ops, SND_SOC_SOF_BAYTRAIL);
 
 const struct sof_intel_dsp_desc byt_chip_info = {
 	.cores_num = 1,
-	.cores_mask = 1,
+	.host_managed_cores_mask = 1,
 };
 EXPORT_SYMBOL_NS(byt_chip_info, SND_SOC_SOF_BAYTRAIL);
 
@@ -976,7 +976,7 @@ EXPORT_SYMBOL_NS(sof_cht_ops, SND_SOC_SOF_BAYTRAIL);
 
 const struct sof_intel_dsp_desc cht_chip_info = {
 	.cores_num = 1,
-	.cores_mask = 1,
+	.host_managed_cores_mask = 1,
 };
 EXPORT_SYMBOL_NS(cht_chip_info, SND_SOC_SOF_BAYTRAIL);
 
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 70f14b2aa954..51e336d7348f 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -334,7 +334,7 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	/* Cannonlake */
 	.cores_num = 4,
 	.init_core_mask = 1,
-	.cores_mask = HDA_DSP_CORE_MASK(0) |
+	.host_managed_cores_mask = HDA_DSP_CORE_MASK(0) |
 				HDA_DSP_CORE_MASK(1) |
 				HDA_DSP_CORE_MASK(2) |
 				HDA_DSP_CORE_MASK(3),
@@ -353,7 +353,7 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	/* Icelake */
 	.cores_num = 4,
 	.init_core_mask = 1,
-	.cores_mask = HDA_DSP_CORE_MASK(0) |
+	.host_managed_cores_mask = HDA_DSP_CORE_MASK(0) |
 				HDA_DSP_CORE_MASK(1) |
 				HDA_DSP_CORE_MASK(2) |
 				HDA_DSP_CORE_MASK(3),
@@ -372,7 +372,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	/* Elkhartlake */
 	.cores_num = 4,
 	.init_core_mask = 1,
-	.cores_mask = HDA_DSP_CORE_MASK(0),
+	.host_managed_cores_mask = HDA_DSP_CORE_MASK(0),
 	.ipc_req = CNL_DSP_REG_HIPCIDR,
 	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
 	.ipc_ack = CNL_DSP_REG_HIPCIDA,
@@ -388,7 +388,7 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	/* Jasperlake */
 	.cores_num = 2,
 	.init_core_mask = 1,
-	.cores_mask = HDA_DSP_CORE_MASK(0) |
+	.host_managed_cores_mask = HDA_DSP_CORE_MASK(0) |
 				HDA_DSP_CORE_MASK(1),
 	.ipc_req = CNL_DSP_REG_HIPCIDR,
 	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index ed4d65a29d3a..18d726669c6f 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -610,7 +610,7 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 #endif
 
 	/* power down DSP */
-	ret = hda_dsp_core_reset_power_down(sdev, chip->cores_mask);
+	ret = hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask);
 	if (ret < 0) {
 		dev_err(sdev->dev,
 			"error: failed to power down core during suspend\n");
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 70727495fdbf..713ebe8d7311 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -91,7 +91,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, int iteration)
 	int i;
 
 	/* step 1: power up corex */
-	ret = hda_dsp_core_power_up(sdev, chip->cores_mask);
+	ret = hda_dsp_core_power_up(sdev, chip->host_managed_cores_mask);
 	if (ret < 0) {
 		if (iteration == HDA_FW_BOOT_ATTEMPTS)
 			dev_err(sdev->dev, "error: dsp core 0/1 power up failed\n");
@@ -147,7 +147,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, int iteration)
 
 	/* step 5: power down corex */
 	ret = hda_dsp_core_power_down(sdev,
-				  chip->cores_mask & ~(HDA_DSP_CORE_MASK(0)));
+				  chip->host_managed_cores_mask & ~(HDA_DSP_CORE_MASK(0)));
 	if (ret < 0) {
 		if (iteration == HDA_FW_BOOT_ATTEMPTS)
 			dev_err(sdev->dev,
@@ -176,7 +176,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, int iteration)
 
 err:
 	hda_dsp_dump(sdev, SOF_DBG_REGS | SOF_DBG_PCI | SOF_DBG_MBOX);
-	hda_dsp_core_reset_power_down(sdev, chip->cores_mask);
+	hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask);
 
 	return ret;
 }
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index de8e85920402..882527119c70 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -928,7 +928,7 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 
 	/* disable cores */
 	if (chip)
-		hda_dsp_core_reset_power_down(sdev, chip->cores_mask);
+		hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask);
 
 	/* disable DSP */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 6fe8b004b50e..1e0afb5c8720 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -154,7 +154,7 @@
 /* DSP hardware descriptor */
 struct sof_intel_dsp_desc {
 	int cores_num;
-	int cores_mask;
+	int host_managed_cores_mask;
 	int init_core_mask; /* cores available after fw boot */
 	int ipc_req;
 	int ipc_req_mask;
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index d0e84b7747a0..8f3fe82a22bc 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -124,7 +124,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	/* Tigerlake */
 	.cores_num = 4,
 	.init_core_mask = 1,
-	.cores_mask = HDA_DSP_CORE_MASK(0),
+	.host_managed_cores_mask = HDA_DSP_CORE_MASK(0),
 	.ipc_req = CNL_DSP_REG_HIPCIDR,
 	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
 	.ipc_ack = CNL_DSP_REG_HIPCIDA,
-- 
2.27.0

