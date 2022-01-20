Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1804F4956A3
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 00:17:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1EBA2DD8;
	Fri, 21 Jan 2022 00:16:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1EBA2DD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642720651;
	bh=YzwhIx/BcLqW8OrP/DLYnVD9dmojhpOJVFWQweeBL0g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=usTF1OGHU9QucaiNzm2J/Yl6hjcoHVlSqgOfTD80oqMAey7AOdKnk2Qjo2s0+fqOd
	 WdzCRmJhIeUjOlDX7HF9Y4mcEjtaF5FV3Y88L7AL6Gi5QClP85W2Y9KnbLpiRw4VC3
	 a21FZNfsKWRscmL+TbmbqaYuo35Ua5FpC357svGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1972F80507;
	Fri, 21 Jan 2022 00:15:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95CE5F8050F; Fri, 21 Jan 2022 00:15:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3A44F800F2
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 00:15:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3A44F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MUxI/+e7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642720549; x=1674256549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YzwhIx/BcLqW8OrP/DLYnVD9dmojhpOJVFWQweeBL0g=;
 b=MUxI/+e7Mo7PKP5/2FFcKR9/dnVFgfU77EERWS9j0vard43gRxhsI5Uy
 7bY8+iBe1UsTITmnx6KhZ6ac0DRAGmOtsY54aAtueJufeCulBRO+3foaW
 ITDnONU/q9MZNUggQWwUwcUauArITZGf2aS2G44eC/IJMEmUKpQv0cBii
 lzTDIzkBwdRbotVhNhxxFBbRMJsewiwvnzbsUmBQj4s+RR8reL3TbLEwx
 vNXstoFwTcsLx0mY8TDM90hdXRQmW2QY5G24clA3iHd3SFmNbaPML8DY3
 EhO9oAxQfiSFOCp6rsR1XkzzDhfmzx7Ibi9Y27Hgk5jXG320LIH7WwpSj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245721376"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="245721376"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:15:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="672741386"
Received: from sthambit-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.44])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:15:41 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ASoC: SOF: Intel: use inclusive language for SSP clocks
Date: Thu, 20 Jan 2022 17:15:29 -0600
Message-Id: <20220120231532.196926-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120231532.196926-1-pierre-louis.bossart@linux.intel.com>
References: <20220120231532.196926-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
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

We introduced provider/consumer terms, and CBP_CFP acronyms for codec
drivers, let's use them as well in SOF.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 6 +++---
 sound/soc/sof/intel/hda.h        | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 33306d2023a7..43de6f1d62a9 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -101,14 +101,14 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 		goto err;
 	}
 
-	/* DSP is powered up, set all SSPs to slave mode */
+	/* DSP is powered up, set all SSPs to clock consumer/codec provider mode */
 	for (i = 0; i < chip->ssp_count; i++) {
 		snd_sof_dsp_update_bits_unlocked(sdev, HDA_DSP_BAR,
 						 chip->ssp_base_offset
 						 + i * SSP_DEV_MEM_SIZE
 						 + SSP_SSC1_OFFSET,
-						 SSP_SET_SLAVE,
-						 SSP_SET_SLAVE);
+						 SSP_SET_CBP_CFP,
+						 SSP_SET_CBP_CFP);
 	}
 
 	/* step 2: purge FW request */
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 03a6bb7a165c..7838a998ea95 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -383,9 +383,9 @@
 
 /* SSP Registers */
 #define SSP_SSC1_OFFSET		0x4
-#define SSP_SET_SCLK_SLAVE	BIT(25)
-#define SSP_SET_SFRM_SLAVE	BIT(24)
-#define SSP_SET_SLAVE		(SSP_SET_SCLK_SLAVE | SSP_SET_SFRM_SLAVE)
+#define SSP_SET_SCLK_CONSUMER	BIT(25)
+#define SSP_SET_SFRM_CONSUMER	BIT(24)
+#define SSP_SET_CBP_CFP		(SSP_SET_SCLK_CONSUMER | SSP_SET_SFRM_CONSUMER)
 
 #define HDA_IDISP_ADDR		2
 #define HDA_IDISP_CODEC(x) ((x) & BIT(HDA_IDISP_ADDR))
-- 
2.25.1

