Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DEC602BE6
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:41:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FF649D5D;
	Tue, 18 Oct 2022 14:40:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FF649D5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666096865;
	bh=UhpMgCF/L84aux6Bfy725veFgDc7JlI67Prul09fPg8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aVJTPJS5xRyUOxgMsef9IjmAvvI3BS4al5u0z2IcXauMulJ4y/IU0Jm8SG/AFWwGU
	 7xCI0rBpFdA4DSt+zzzeFCsIuHzjB1LgeFdrHMIx4Mf5dBQELhTYcgTCrjUvg+eX1q
	 WB27OSTev/rNTcTyiMUd2C1hNQhhZZQT05ZDV11o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57BABF804C1;
	Tue, 18 Oct 2022 14:40:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0D37F80542; Tue, 18 Oct 2022 14:39:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E28DDF8024C
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E28DDF8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NU4MnyHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666096793; x=1697632793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UhpMgCF/L84aux6Bfy725veFgDc7JlI67Prul09fPg8=;
 b=NU4MnyHUFoprMT+Qf/h/mHiiKuGAGj6euvclPqsJSKWCEos5Q9e1ePhS
 6fBcBglUTKQ3KIw6IwqW56cJaeIpwSIsbXRbcOkAAuRHUCfxueVCwaHHZ
 cwScdos4tyHHj/5EuR8zY49mFvkh34g4AiQnfEnMarlfz5qTLXu8Sc6oi
 +/4/cMz3cpbsytOzmW2788JpBFm6Wum8MaWKLCpxQhsW9eMJblL7tvaoU
 qRPqksQBn/NX++PJsuGDQ/RueKC2tVAZU4DGhHaO5pub+yXMYq02injrT
 7M63UA9h/5QqU7mWoinYo4MtSBfLGbhuCeZ7obBjBgo2gg2lZUoruaMyr Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="304828562"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="304828562"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:39:51 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="717912768"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="717912768"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:39:49 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/4] ASoC: SOF: Intel: ipc4: Read the interrupt reason
 registers at the same time
Date: Tue, 18 Oct 2022 15:40:06 +0300
Message-Id: <20221018124008.6846-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018124008.6846-1-peter.ujfalusi@linux.intel.com>
References: <20221018124008.6846-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, rander.wang@intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

Read both registers as the first step in the interrupt handler to make
sure that we are handling the event which triggered the interrupt.

The delayed reading of the target request register might reflect incorrect
information about the reason why the interrupt was risen.

Note also that the IPC3 interrupt handler is implemented in this way also.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/cnl.c     | 2 +-
 sound/soc/sof/intel/hda-ipc.c | 3 ++-
 sound/soc/sof/intel/mtl.c     | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 19d0b1909bfd..2f2bcde42759 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -41,6 +41,7 @@ irqreturn_t cnl_ipc4_irq_thread(int irq, void *context)
 	u32 hipcida, hipctdr;
 
 	hipcida = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDA);
+	hipctdr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCTDR);
 	if (hipcida & CNL_DSP_REG_HIPCIDA_DONE) {
 		/* DSP received the message */
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
@@ -51,7 +52,6 @@ irqreturn_t cnl_ipc4_irq_thread(int irq, void *context)
 		ipc_irq = true;
 	}
 
-	hipctdr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCTDR);
 	if (hipctdr & CNL_DSP_REG_HIPCTDR_BUSY) {
 		/* Message from DSP (reply or notification) */
 		u32 hipctdd = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 9b3667c705e4..4118532faf3f 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -126,6 +126,8 @@ irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context)
 	u32 hipcie, hipct;
 
 	hipcie = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCIE);
+	hipct = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCT);
+
 	if (hipcie & HDA_DSP_REG_HIPCIE_DONE) {
 		/* DSP received the message */
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCCTL,
@@ -135,7 +137,6 @@ irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context)
 		ipc_irq = true;
 	}
 
-	hipct = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCT);
 	if (hipct & HDA_DSP_REG_HIPCT_BUSY) {
 		/* Message from DSP (reply or notification) */
 		u32 hipcte = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 10298532816f..a9b31b31a4e4 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -497,6 +497,7 @@ static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 	u32 hipctdr;
 
 	hipcida = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HFIPCXIDA);
+	hipctdr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HFIPCXTDR);
 
 	/* reply message from DSP */
 	if (hipcida & MTL_DSP_REG_HFIPCXIDA_DONE) {
@@ -509,7 +510,6 @@ static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 		ipc_irq = true;
 	}
 
-	hipctdr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HFIPCXTDR);
 	if (hipctdr & MTL_DSP_REG_HFIPCXTDR_BUSY) {
 		/* Message from DSP (reply or notification) */
 		u32 extension = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HFIPCXTDDY);
-- 
2.38.0

