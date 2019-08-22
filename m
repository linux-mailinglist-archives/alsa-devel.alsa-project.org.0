Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABBC9A003
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:27:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 816CE1699;
	Thu, 22 Aug 2019 21:27:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 816CE1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566502071;
	bh=kel+G/1locQ5d/oq3fsna8zy7M6XqK71O7qDMMNfgUI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qOOGdxnQI/1KPzhMzlpLWfn3DVxleTXADJo3EG5F9B4fvuPgjrcWzaWXUoMGdNqaN
	 Qd8x/oIHlRplQKfha8sv+CAe5AvW0mmptkaTQ9h8kmHUtSZ3lqwBroD9W8Bj1K6Egl
	 mdBX7xdzc4/8M78wcxip56HOw4rauOLEtpyJ87ug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 940A2F80CB8;
	Thu, 22 Aug 2019 21:07:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ABC0F8074D; Thu, 22 Aug 2019 21:06:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F182F80679
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F182F80679
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524614"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:31 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:21 +0200
Message-Id: <20190822190425.23001-32-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 31/35] ASoC: Intel: Reuse sst_pdata::fw field
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

Similarly to fw_name, sst_pdata::fw can be used to unify usage of
firmware objects for all SSTs.

This change invalidates sst_dsp::fw field.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/bxt-sst.c | 16 +++++++++-------
 sound/soc/intel/skylake/cnl-sst.c | 15 ++++++++-------
 sound/soc/intel/skylake/skl-sst.c | 23 +++++++++++++----------
 3 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index 286da9fbc4de..79728e418176 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -185,10 +185,11 @@ static int bxt_load_base_firmware(struct sst_dsp *ctx)
 {
 	struct firmware stripped_fw;
 	struct skl_dev *skl = ctx->thread_context;
+	struct sst_pdata *pdata = ctx->pdata;
 	int ret, i;
 
-	if (ctx->fw == NULL) {
-		ret = request_firmware(&ctx->fw, ctx->fw_name, ctx->dev);
+	if (!pdata->fw) {
+		ret = request_firmware(&pdata->fw, ctx->fw_name, ctx->dev);
 		if (ret < 0) {
 			dev_err(ctx->dev, "Request firmware failed %d\n", ret);
 			return ret;
@@ -197,13 +198,14 @@ static int bxt_load_base_firmware(struct sst_dsp *ctx)
 
 	/* prase uuids on first boot */
 	if (skl->is_first_boot) {
-		ret = snd_skl_parse_uuids(ctx, ctx->fw, BXT_ADSP_FW_BIN_HDR_OFFSET, 0);
+		ret = snd_skl_parse_uuids(ctx, pdata->fw,
+				BXT_ADSP_FW_BIN_HDR_OFFSET, 0);
 		if (ret < 0)
 			goto sst_load_base_firmware_failed;
 	}
 
-	stripped_fw.data = ctx->fw->data;
-	stripped_fw.size = ctx->fw->size;
+	stripped_fw.data = pdata->fw->data;
+	stripped_fw.size = pdata->fw->size;
 	skl_dsp_strip_extended_manifest(&stripped_fw);
 
 	for (i = 0; i < BXT_FW_ROM_INIT_RETRY; i++) {
@@ -246,8 +248,8 @@ static int bxt_load_base_firmware(struct sst_dsp *ctx)
 	return ret;
 
 sst_load_base_firmware_failed:
-	release_firmware(ctx->fw);
-	ctx->fw = NULL;
+	release_firmware(pdata->fw);
+	pdata->fw = NULL;
 	return ret;
 }
 
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index a6113d8afcbb..58efeb6c8a8a 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -108,10 +108,11 @@ static int cnl_load_base_firmware(struct sst_dsp *ctx)
 {
 	struct firmware stripped_fw;
 	struct skl_dev *cnl = ctx->thread_context;
+	struct sst_pdata *pdata = ctx->pdata;
 	int ret;
 
-	if (!ctx->fw) {
-		ret = request_firmware(&ctx->fw, ctx->fw_name, ctx->dev);
+	if (!pdata->fw) {
+		ret = request_firmware(&pdata->fw, ctx->fw_name, ctx->dev);
 		if (ret < 0) {
 			dev_err(ctx->dev, "request firmware failed: %d\n", ret);
 			goto cnl_load_base_firmware_failed;
@@ -120,14 +121,14 @@ static int cnl_load_base_firmware(struct sst_dsp *ctx)
 
 	/* parse uuids if first boot */
 	if (cnl->is_first_boot) {
-		ret = snd_skl_parse_uuids(ctx, ctx->fw,
+		ret = snd_skl_parse_uuids(ctx, pdata->fw,
 					  CNL_ADSP_FW_HDR_OFFSET, 0);
 		if (ret < 0)
 			goto cnl_load_base_firmware_failed;
 	}
 
-	stripped_fw.data = ctx->fw->data;
-	stripped_fw.size = ctx->fw->size;
+	stripped_fw.data = pdata->fw->data;
+	stripped_fw.size = pdata->fw->size;
 	skl_dsp_strip_extended_manifest(&stripped_fw);
 
 	ret = cnl_prepare_fw(ctx, stripped_fw.data, stripped_fw.size);
@@ -157,8 +158,8 @@ static int cnl_load_base_firmware(struct sst_dsp *ctx)
 	return 0;
 
 cnl_load_base_firmware_failed:
-	release_firmware(ctx->fw);
-	ctx->fw = NULL;
+	release_firmware(pdata->fw);
+	pdata->fw = NULL;
 
 	return ret;
 }
diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index e0f2bf828541..8e1d02e29a32 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -67,14 +67,15 @@ static int skl_load_base_firmware(struct sst_dsp *ctx)
 {
 	int ret = 0, i;
 	struct skl_dev *skl = ctx->thread_context;
+	struct sst_pdata *pdata = ctx->pdata;
 	struct firmware stripped_fw;
 	u32 reg;
 
 	skl->boot_complete = false;
 	init_waitqueue_head(&skl->boot_wait);
 
-	if (ctx->fw == NULL) {
-		ret = request_firmware(&ctx->fw, ctx->fw_name, ctx->dev);
+	if (!pdata->fw) {
+		ret = request_firmware(&pdata->fw, ctx->fw_name, ctx->dev);
 		if (ret < 0) {
 			dev_err(ctx->dev, "Request firmware failed %d\n", ret);
 			return -EIO;
@@ -83,18 +84,19 @@ static int skl_load_base_firmware(struct sst_dsp *ctx)
 
 	/* prase uuids on first boot */
 	if (skl->is_first_boot) {
-		ret = snd_skl_parse_uuids(ctx, ctx->fw, SKL_ADSP_FW_BIN_HDR_OFFSET, 0);
+		ret = snd_skl_parse_uuids(ctx, pdata->fw,
+				SKL_ADSP_FW_BIN_HDR_OFFSET, 0);
 		if (ret < 0) {
 			dev_err(ctx->dev, "UUID parsing err: %d\n", ret);
-			release_firmware(ctx->fw);
+			release_firmware(pdata->fw);
 			skl_dsp_disable_core(ctx, SKL_DSP_CORE0_MASK);
 			return ret;
 		}
 	}
 
 	/* check for extended manifest */
-	stripped_fw.data = ctx->fw->data;
-	stripped_fw.size = ctx->fw->size;
+	stripped_fw.data = pdata->fw->data;
+	stripped_fw.size = pdata->fw->size;
 
 	skl_dsp_strip_extended_manifest(&stripped_fw);
 
@@ -152,8 +154,8 @@ static int skl_load_base_firmware(struct sst_dsp *ctx)
 	ctx->cl_dev.ops.cl_cleanup_controller(ctx);
 skl_load_base_firmware_failed:
 	skl_dsp_disable_core(ctx, SKL_DSP_CORE0_MASK);
-	release_firmware(ctx->fw);
-	ctx->fw = NULL;
+	release_firmware(pdata->fw);
+	pdata->fw = NULL;
 	return ret;
 }
 
@@ -602,10 +604,11 @@ EXPORT_SYMBOL_GPL(skl_sst_init_fw);
 void skl_sst_dsp_cleanup(struct skl_dev *skl)
 {
 	struct sst_dsp *dsp = skl->dsp;
+	struct sst_pdata *pdata = dsp->pdata;
 
 	skl_release_library(skl->lib_info, skl->lib_count);
-	if (dsp->fw)
-		release_firmware(dsp->fw);
+	if (pdata->fw)
+		release_firmware(pdata->fw);
 	skl_clear_module_table(dsp);
 
 	skl_freeup_uuid_list(skl);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
