Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8679D264A23
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 18:46:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28FF716BE;
	Thu, 10 Sep 2020 18:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28FF716BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599756389;
	bh=zRSPu9ucLPUMraJJ18brhwgoVoc7pdFxwv6JGMTyqE4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vMffLMFVNaSpIrgtlq5ikkYnEiTCaQ1/8YDYgBMJ5tjEh+xEvWfKNbuqB4BuYmEc4
	 jkjxGXO4M/d6EeHbERJrcX+OmpiXWi/nzRs+00y63+sEYxiUL+xSpVsHz4jRCYjy1T
	 qUTCyD44nr428kPBfx7uiYxSno8RBwlXaVtGzVtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 552ACF802DD;
	Thu, 10 Sep 2020 18:43:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB8C0F802C3; Thu, 10 Sep 2020 18:43:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F616F80264
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 18:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F616F80264
IronPort-SDR: SwW4auzZYvPHhYb1llDiOEBlkxcNXTKzjpCvZqGqcv1lzG+zMn4pfTSlMshydCn13omAn9xPGV
 +6U+1HZVMU+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="146278553"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="146278553"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 09:42:58 -0700
IronPort-SDR: 3jurNGPaBZRMDmrZQ9RjZkwXbiRw7TcWoocJBujknTaQUMoUQwmWt/pirDR38vHZ5rBJq9qwxc
 Df1vMggswV+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="304937901"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006.jf.intel.com with ESMTP; 10 Sep 2020 09:42:56 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/4] ASoC: SOF: Intel: remove the  HDA_DSP_CORE_MASK() macro
Date: Thu, 10 Sep 2020 19:41:24 +0300
Message-Id: <20200910164125.2033062-4-kai.vehmanen@linux.intel.com>
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

Remove the HDA_DSP_CORE_MASK() macro and use BIT() and GENMASK()
macros directly for more clarity.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/apl.c        |  2 +-
 sound/soc/sof/intel/cnl.c        | 15 ++++-----------
 sound/soc/sof/intel/hda-loader.c |  5 ++---
 sound/soc/sof/intel/hda.h        |  3 ---
 sound/soc/sof/intel/tgl.c        |  2 +-
 5 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 25d3f5775aac..4eeade2e77f7 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -129,7 +129,7 @@ const struct sof_intel_dsp_desc apl_chip_info = {
 	/* Apollolake */
 	.cores_num = 2,
 	.init_core_mask = 1,
-	.host_managed_cores_mask = HDA_DSP_CORE_MASK(0) | HDA_DSP_CORE_MASK(1),
+	.host_managed_cores_mask = GENMASK(1, 0),
 	.ipc_req = HDA_DSP_REG_HIPCI,
 	.ipc_req_mask = HDA_DSP_REG_HIPCI_BUSY,
 	.ipc_ack = HDA_DSP_REG_HIPCIE,
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 51e336d7348f..a5d3258104c0 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -334,10 +334,7 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 	/* Cannonlake */
 	.cores_num = 4,
 	.init_core_mask = 1,
-	.host_managed_cores_mask = HDA_DSP_CORE_MASK(0) |
-				HDA_DSP_CORE_MASK(1) |
-				HDA_DSP_CORE_MASK(2) |
-				HDA_DSP_CORE_MASK(3),
+	.host_managed_cores_mask = GENMASK(3, 0),
 	.ipc_req = CNL_DSP_REG_HIPCIDR,
 	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
 	.ipc_ack = CNL_DSP_REG_HIPCIDA,
@@ -353,10 +350,7 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 	/* Icelake */
 	.cores_num = 4,
 	.init_core_mask = 1,
-	.host_managed_cores_mask = HDA_DSP_CORE_MASK(0) |
-				HDA_DSP_CORE_MASK(1) |
-				HDA_DSP_CORE_MASK(2) |
-				HDA_DSP_CORE_MASK(3),
+	.host_managed_cores_mask = GENMASK(3, 0),
 	.ipc_req = CNL_DSP_REG_HIPCIDR,
 	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
 	.ipc_ack = CNL_DSP_REG_HIPCIDA,
@@ -372,7 +366,7 @@ const struct sof_intel_dsp_desc ehl_chip_info = {
 	/* Elkhartlake */
 	.cores_num = 4,
 	.init_core_mask = 1,
-	.host_managed_cores_mask = HDA_DSP_CORE_MASK(0),
+	.host_managed_cores_mask = BIT(0),
 	.ipc_req = CNL_DSP_REG_HIPCIDR,
 	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
 	.ipc_ack = CNL_DSP_REG_HIPCIDA,
@@ -388,8 +382,7 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	/* Jasperlake */
 	.cores_num = 2,
 	.init_core_mask = 1,
-	.host_managed_cores_mask = HDA_DSP_CORE_MASK(0) |
-				HDA_DSP_CORE_MASK(1),
+	.host_managed_cores_mask = GENMASK(1, 0),
 	.ipc_req = CNL_DSP_REG_HIPCIDR,
 	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
 	.ipc_ack = CNL_DSP_REG_HIPCIDA,
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 713ebe8d7311..5515c75e53e4 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -114,7 +114,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, int iteration)
 			  ((stream_tag - 1) << 9)));
 
 	/* step 3: unset core 0 reset state & unstall/run core 0 */
-	ret = hda_dsp_core_run(sdev, HDA_DSP_CORE_MASK(0));
+	ret = hda_dsp_core_run(sdev, BIT(0));
 	if (ret < 0) {
 		if (iteration == HDA_FW_BOOT_ATTEMPTS)
 			dev_err(sdev->dev,
@@ -146,8 +146,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, int iteration)
 				       chip->ipc_ack_mask);
 
 	/* step 5: power down corex */
-	ret = hda_dsp_core_power_down(sdev,
-				  chip->host_managed_cores_mask & ~(HDA_DSP_CORE_MASK(0)));
+	ret = hda_dsp_core_power_down(sdev, chip->host_managed_cores_mask & ~(BIT(0)));
 	if (ret < 0) {
 		if (iteration == HDA_FW_BOOT_ATTEMPTS)
 			dev_err(sdev->dev,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 5ee2f8354051..f0f8f95c082b 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -305,9 +305,6 @@
 #define HDA_DSP_ADSPCS_CPA_SHIFT	24
 #define HDA_DSP_ADSPCS_CPA_MASK(cm)	((cm) << HDA_DSP_ADSPCS_CPA_SHIFT)
 
-/* Mask for a given core index, c = 0.. number of supported cores - 1 */
-#define HDA_DSP_CORE_MASK(c)		BIT(c)
-
 /*
  * Mask for a given number of cores
  * nc = number of supported cores
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 8f3fe82a22bc..f8d04fd66ceb 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -124,7 +124,7 @@ const struct sof_intel_dsp_desc tgl_chip_info = {
 	/* Tigerlake */
 	.cores_num = 4,
 	.init_core_mask = 1,
-	.host_managed_cores_mask = HDA_DSP_CORE_MASK(0),
+	.host_managed_cores_mask = BIT(0),
 	.ipc_req = CNL_DSP_REG_HIPCIDR,
 	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
 	.ipc_ack = CNL_DSP_REG_HIPCIDA,
-- 
2.27.0

