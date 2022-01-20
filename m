Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 003404956A6
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 00:18:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87AE22DD6;
	Fri, 21 Jan 2022 00:17:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87AE22DD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642720698;
	bh=xQ0h0y9Vb3cD8N/wsytdboHwPDiRYKgn1vzcCHjPUdQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QTVMZl6j5v1K4d2EgXp6YXLJNHmtGCVhbA6CchHPm29loiQjXb9/HK497RBpaxKVj
	 59JNuVdtBimTOcbSXyOgdcFlKcdspAKoNddJHMMFTkz01DdtdCfJhqD68C2I6y0py0
	 7LNwq4+S/1Yn76q6tIJJIfJyfM9psV1CFYoyXGQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42CC1F8051A;
	Fri, 21 Jan 2022 00:16:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B459F80128; Fri, 21 Jan 2022 00:16:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16BF3F80248
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 00:15:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16BF3F80248
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="E3zWrDbU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642720551; x=1674256551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xQ0h0y9Vb3cD8N/wsytdboHwPDiRYKgn1vzcCHjPUdQ=;
 b=E3zWrDbUKreyHp16/15VJ6IX6v7pueIQ8RtsJb+jyo3SOapX3Ps4pFU2
 0ZCv5/lbm4pV0W1A/RSbukmGfjq3s+/tB9IJEIQaMVdDQg70aatZTfsAD
 2QscDMcZzoqw6nRX/+3l3V3jDhK4HLrhE2zxE63f8K0wop/Lk3LdoUza5
 a5b+patKfLzO8u1vBsbbrJBAi7HW2ONAI3+X2jxhjbUihEvjR9GNRrl0f
 HcZVlCQYL6nUbFtVlPWYpNKx563O2UBCDrE29fNt56v1hpPVtU5Ye6HYM
 fVN5KkDIHjuAlEWlMEL1hJKp+ZSRwWd2ZjYxHOSO210jfib+f2rLox4kJ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245721377"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="245721377"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:15:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="672741392"
Received: from sthambit-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.44])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:15:42 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ASoC: SOF: Intel: hda-loader: add SSP helper
Date: Thu, 20 Jan 2022 17:15:30 -0600
Message-Id: <20220120231532.196926-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120231532.196926-1-pierre-louis.bossart@linux.intel.com>
References: <20220120231532.196926-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Keyon Jie <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Keyon Jie <yang.jie@linux.intel.com>

Move the SSP clock configuration to the hda_set_ssp_cbp_cfp() helper,
to be used in follow-up patches

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 43de6f1d62a9..7f1b1d0f2422 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -25,6 +25,23 @@
 
 #define HDA_CL_STREAM_FORMAT 0x40
 
+static void hda_ssp_set_cbp_cfp(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
+	int i;
+
+	/* DSP is powered up, set all SSPs to clock consumer/codec provider mode */
+	for (i = 0; i < chip->ssp_count; i++) {
+		snd_sof_dsp_update_bits_unlocked(sdev, HDA_DSP_BAR,
+						 chip->ssp_base_offset
+						 + i * SSP_DEV_MEM_SIZE
+						 + SSP_SSC1_OFFSET,
+						 SSP_SET_CBP_CFP,
+						 SSP_SET_CBP_CFP);
+	}
+}
+
 static struct hdac_ext_stream *cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
 						 unsigned int size, struct snd_dma_buffer *dmab,
 						 int direction)
@@ -91,7 +108,6 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 	char *dump_msg;
 	u32 flags, j;
 	int ret;
-	int i;
 
 	/* step 1: power up corex */
 	ret = hda_dsp_enable_core(sdev, chip->host_managed_cores_mask);
@@ -101,15 +117,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 		goto err;
 	}
 
-	/* DSP is powered up, set all SSPs to clock consumer/codec provider mode */
-	for (i = 0; i < chip->ssp_count; i++) {
-		snd_sof_dsp_update_bits_unlocked(sdev, HDA_DSP_BAR,
-						 chip->ssp_base_offset
-						 + i * SSP_DEV_MEM_SIZE
-						 + SSP_SSC1_OFFSET,
-						 SSP_SET_CBP_CFP,
-						 SSP_SET_CBP_CFP);
-	}
+	hda_ssp_set_cbp_cfp(sdev);
 
 	/* step 2: purge FW request */
 	snd_sof_dsp_write(sdev, HDA_DSP_BAR, chip->ipc_req,
-- 
2.25.1

