Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D27899FA8
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:16:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD3361675;
	Thu, 22 Aug 2019 21:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD3361675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501411;
	bh=89uoc+Ft2GFtqz47Z9trE08p33iojDGI/it8DmPt/J4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OPXGv2Nl+ev3RKERABbKYwXMxxajJxRJJpqLhSMS5BRIdkfJzem/wkAYZ+RBf5p1q
	 hnZysbJzv2kNjCniUrqvhBAAfX3f+I9Wb+saz82+C08tZqhhLVVEMRfZIhkUDGEUU5
	 +jLHHvN+ecCXeqGkplV8waBGKxmPZ4MNHpm77V/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8B17F80746;
	Thu, 22 Aug 2019 21:06:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0437F8068A; Thu, 22 Aug 2019 21:05:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A959AF805FC
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A959AF805FC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524373"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:06 +0200
Message-Id: <20190822190425.23001-17-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 16/35] ASoC: Intel: Skylake: Make
	dsp_ops::stream_tag obsolete
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

stream_tag field is the last obstacle in removing skl_dsp_loader_ops
structure. It is required only during fw load procedure and never lives
outside of that process - prepare_fw functions take place directly
before actual FW file transfer and once that's done, these are
redundant. Update _prepare_fw routines to return stream_tag on success
and use said return immediately in _transfer_fw_host_dma.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/bxt-sst.c | 14 ++++++--------
 sound/soc/intel/skylake/cnl-sst.c | 13 ++++++-------
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index 1ca4fba0f35f..45da02f74f4d 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -107,7 +107,6 @@ static int sst_bxt_prepare_fw(struct sst_dsp *ctx,
 		return stream_tag;
 	}
 
-	ctx->dsp_ops.stream_tag = stream_tag;
 	memcpy(ctx->dmab.area, fwdata, fwsize);
 
 	/* Step 1: Power up core 0 and core1 */
@@ -159,7 +158,7 @@ static int sst_bxt_prepare_fw(struct sst_dsp *ctx,
 		goto base_fw_load_failed;
 	}
 
-	return ret;
+	return stream_tag;
 
 base_fw_load_failed:
 	skl_dsp_cleanup(ctx->dev, &ctx->dmab, stream_tag);
@@ -168,16 +167,16 @@ static int sst_bxt_prepare_fw(struct sst_dsp *ctx,
 	return ret;
 }
 
-static int sst_transfer_fw_host_dma(struct sst_dsp *ctx)
+static int sst_transfer_fw_host_dma(struct sst_dsp *ctx, int stream_tag)
 {
 	int ret;
 
-	skl_dsp_trigger(ctx->dev, true, ctx->dsp_ops.stream_tag);
+	skl_dsp_trigger(ctx->dev, true, stream_tag);
 	ret = sst_dsp_register_poll(ctx, BXT_ADSP_FW_STATUS, SKL_FW_STS_MASK,
 			BXT_ROM_INIT, BXT_BASEFW_TIMEOUT, "Firmware boot");
 
-	skl_dsp_trigger(ctx->dev, false, ctx->dsp_ops.stream_tag);
-	skl_dsp_cleanup(ctx->dev, &ctx->dmab, ctx->dsp_ops.stream_tag);
+	skl_dsp_trigger(ctx->dev, false, stream_tag);
+	skl_dsp_cleanup(ctx->dev, &ctx->dmab, stream_tag);
 
 	return ret;
 }
@@ -207,7 +206,6 @@ static int bxt_load_base_firmware(struct sst_dsp *ctx)
 	stripped_fw.size = ctx->fw->size;
 	skl_dsp_strip_extended_manifest(&stripped_fw);
 
-
 	for (i = 0; i < BXT_FW_ROM_INIT_RETRY; i++) {
 		ret = sst_bxt_prepare_fw(ctx, stripped_fw.data, stripped_fw.size);
 		if (ret == 0)
@@ -223,7 +221,7 @@ static int bxt_load_base_firmware(struct sst_dsp *ctx)
 		goto sst_load_base_firmware_failed;
 	}
 
-	ret = sst_transfer_fw_host_dma(ctx);
+	ret = sst_transfer_fw_host_dma(ctx, ret);
 	if (ret < 0) {
 		dev_err(ctx->dev, "Transfer firmware failed %d\n", ret);
 		dev_info(ctx->dev, "Error code=0x%x: FW status=0x%x\n",
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index 5ad34e9f51eb..4d9a4d5886f4 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -54,7 +54,6 @@ static int cnl_prepare_fw(struct sst_dsp *ctx, const void *fwdata, u32 fwsize)
 		return stream_tag;
 	}
 
-	ctx->dsp_ops.stream_tag = stream_tag;
 	memcpy(ctx->dmab.area, fwdata, fwsize);
 
 	/* purge FW request */
@@ -81,7 +80,7 @@ static int cnl_prepare_fw(struct sst_dsp *ctx, const void *fwdata, u32 fwsize)
 		goto base_fw_load_failed;
 	}
 
-	return 0;
+	return stream_tag;
 
 base_fw_load_failed:
 	skl_dsp_cleanup(ctx->dev, &ctx->dmab, stream_tag);
@@ -90,17 +89,17 @@ static int cnl_prepare_fw(struct sst_dsp *ctx, const void *fwdata, u32 fwsize)
 	return ret;
 }
 
-static int sst_transfer_fw_host_dma(struct sst_dsp *ctx)
+static int sst_transfer_fw_host_dma(struct sst_dsp *ctx, int stream_tag)
 {
 	int ret;
 
-	skl_dsp_trigger(ctx->dev, true, ctx->dsp_ops.stream_tag);
+	skl_dsp_trigger(ctx->dev, true, stream_tag);
 	ret = sst_dsp_register_poll(ctx, CNL_ADSP_FW_STATUS, CNL_FW_STS_MASK,
 				    CNL_FW_INIT, CNL_BASEFW_TIMEOUT,
 				    "firmware boot");
 
-	skl_dsp_trigger(ctx->dev, false, ctx->dsp_ops.stream_tag);
-	skl_dsp_cleanup(ctx->dev, &ctx->dmab, ctx->dsp_ops.stream_tag);
+	skl_dsp_trigger(ctx->dev, false, stream_tag);
+	skl_dsp_cleanup(ctx->dev, &ctx->dmab, stream_tag);
 
 	return ret;
 }
@@ -137,7 +136,7 @@ static int cnl_load_base_firmware(struct sst_dsp *ctx)
 		goto cnl_load_base_firmware_failed;
 	}
 
-	ret = sst_transfer_fw_host_dma(ctx);
+	ret = sst_transfer_fw_host_dma(ctx, ret);
 	if (ret < 0) {
 		dev_err(ctx->dev, "transfer firmware failed: %d\n", ret);
 		cnl_dsp_disable_core(ctx, SKL_DSP_CORE0_MASK);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
