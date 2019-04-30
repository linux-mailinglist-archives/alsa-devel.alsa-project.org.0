Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AD010331
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 01:14:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42BBD1695;
	Wed,  1 May 2019 01:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42BBD1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556666062;
	bh=gB/VPEU3DqurEvttaksRl3p2pTrbi7sDJCfvoo8YHgo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZEUHG95+lnaLHREp/UXdGBNvlN0LOk47rMcGLZ7Cq8q5tmu+gpxwELprnM2A8J7gL
	 yRr9EHd8wfA+ZXgzXjuLlkQDPp+brtzVJSMXwl5ldnV6EhlUG9ilfZDnXETfngQMb/
	 zkTs6DMVSKTI3tPPVOfDsyAxKDbrzix4UKUvsYIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35EDAF89739;
	Wed,  1 May 2019 01:10:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27AA3F89736; Wed,  1 May 2019 01:10:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7978FF8971A
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 01:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7978FF8971A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 16:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,415,1549958400"; d="scan'208";a="166540923"
Received: from slawsonx-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.128])
 by fmsmga004.fm.intel.com with ESMTP; 30 Apr 2019 16:09:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 30 Apr 2019 18:09:22 -0500
Message-Id: <20190430230934.4321-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
References: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 07/19] ASoC: SOF: Intel: hda: set I2S slave
	before enabling DSP
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>

By default, the I2S ports are configured in master mode during
DSP powerup sequences, the FS and BCLK lines will be driven on
startup, even when the topology file explicitly requires the
SSP to be slave.

This may be problematic for external components configured in
master mode who don't expect the Intel SOC/PCH to drive. Fix by
configuring the SSP as slave before the SSP outputs are enabled
to avoid this transient behavior.

When the topology file configures the SSP as clock master, the
initial slave configuration will be overridden.

Signed-off-by: Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 11 +++++++++++
 sound/soc/sof/intel/hda.h        |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 6a44bc349e44..6427f0b3a2f1 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -84,6 +84,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, const void *fwdata,
 	const struct sof_intel_dsp_desc *chip = hda->desc;
 	unsigned int status;
 	int ret;
+	int i;
 
 	/* step 1: power up corex */
 	ret = hda_dsp_core_power_up(sdev, chip->cores_mask);
@@ -92,6 +93,16 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, const void *fwdata,
 		goto err;
 	}
 
+	/* DSP is powered up, set all SSPs to slave mode */
+	for (i = 0; i < chip->ssp_count; i++) {
+		snd_sof_dsp_update_bits_unlocked(sdev, HDA_DSP_BAR,
+						 chip->ssp_base_offset
+						 + i * SSP_DEV_MEM_SIZE
+						 + SSP_SSC1_OFFSET,
+						 SSP_SET_SLAVE,
+						 SSP_SET_SLAVE);
+	}
+
 	/* step 2: purge FW request */
 	snd_sof_dsp_write(sdev, HDA_DSP_BAR, chip->ipc_req,
 			  chip->ipc_req_mask | (HDA_DSP_IPC_PURGE_FW |
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index b2cf6fa15575..3799a3518106 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -349,6 +349,12 @@
 #define APL_SSP_COUNT		6
 #define CNL_SSP_COUNT		3
 
+/* SSP Registers */
+#define SSP_SSC1_OFFSET		0x4
+#define SSP_SET_SCLK_SLAVE	BIT(25)
+#define SSP_SET_SFRM_SLAVE	BIT(24)
+#define SSP_SET_SLAVE		(SSP_SET_SCLK_SLAVE | SSP_SET_SFRM_SLAVE)
+
 #define HDA_IDISP_CODEC(x) ((x) & BIT(2))
 
 struct sof_intel_dsp_bdl {
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
