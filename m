Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0AD180545
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 18:47:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B8981681;
	Tue, 10 Mar 2020 18:46:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B8981681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583862437;
	bh=hLk7yg6f4ytf3k9WJUDnd/cNG3rnx2JSsSOTrYpvXss=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sTc4UzMbwLPgxB9PBo37ezhF70pHkDQcDEVXWW6VbAFjYXVrHu3Fy05rCvCp6s2lg
	 PkAERaM3p5wdFzUukmPM9vWl806CYFLkxeTKdy8cYViZzGb0UXKj+05vSS/9+XhvI5
	 KFjLIHJPGtFPagO8XCHWQLfVge28XXZbzSBYFOhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9FA8F80247;
	Tue, 10 Mar 2020 18:44:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22854F80247; Tue, 10 Mar 2020 18:44:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D2B45F8023F
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 18:44:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2B45F8023F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8082B7FA;
 Tue, 10 Mar 2020 10:44:48 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF8393F67D;
 Tue, 10 Mar 2020 10:44:47 -0700 (PDT)
Date: Tue, 10 Mar 2020 17:44:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Applied "ASoC: Intel: Allow for ROM init retry on CNL platforms" to
 the asoc tree
In-Reply-To: <20200305145314.32579-7-cezary.rojewski@intel.com>
Message-Id: <applied-20200305145314.32579-7-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>
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

The patch

   ASoC: Intel: Allow for ROM init retry on CNL platforms

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 024aa45f55ccd40704cfdef61b2a8b6d0de9cdd1 Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Thu, 5 Mar 2020 15:53:13 +0100
Subject: [PATCH] ASoC: Intel: Allow for ROM init retry on CNL platforms

Due to unconditional initial timeouts, firmware may fail to load during
its initialization. This issue cannot be resolved on driver side as it
is caused by external sources such as CSME but has to be accounted for
nonetheless.

Fixes: cb6a55284629 ("ASoC: Intel: cnl: Add sst library functions for cnl platform")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200305145314.32579-7-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/skylake/bxt-sst.c     |  2 --
 sound/soc/intel/skylake/cnl-sst.c     | 15 ++++++++++-----
 sound/soc/intel/skylake/skl-sst-dsp.h |  1 +
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index 92a82e6b5fe6..cdafade8abd6 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -38,8 +38,6 @@
 /* Delay before scheduling D0i3 entry */
 #define BXT_D0I3_DELAY 5000
 
-#define BXT_FW_ROM_INIT_RETRY 3
-
 static unsigned int bxt_get_errorcode(struct sst_dsp *ctx)
 {
 	 return sst_dsp_shim_read(ctx, BXT_ADSP_ERROR_CODE);
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index 4f64f097e9ae..060e47ae3391 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -109,7 +109,7 @@ static int cnl_load_base_firmware(struct sst_dsp *ctx)
 {
 	struct firmware stripped_fw;
 	struct skl_dev *cnl = ctx->thread_context;
-	int ret;
+	int ret, i;
 
 	if (!ctx->fw) {
 		ret = request_firmware(&ctx->fw, ctx->fw_name, ctx->dev);
@@ -131,12 +131,16 @@ static int cnl_load_base_firmware(struct sst_dsp *ctx)
 	stripped_fw.size = ctx->fw->size;
 	skl_dsp_strip_extended_manifest(&stripped_fw);
 
-	ret = cnl_prepare_fw(ctx, stripped_fw.data, stripped_fw.size);
-	if (ret < 0) {
-		dev_err(ctx->dev, "prepare firmware failed: %d\n", ret);
-		goto cnl_load_base_firmware_failed;
+	for (i = 0; i < BXT_FW_ROM_INIT_RETRY; i++) {
+		ret = cnl_prepare_fw(ctx, stripped_fw.data, stripped_fw.size);
+		if (!ret)
+			break;
+		dev_dbg(ctx->dev, "prepare firmware failed: %d\n", ret);
 	}
 
+	if (ret < 0)
+		goto cnl_load_base_firmware_failed;
+
 	ret = sst_transfer_fw_host_dma(ctx);
 	if (ret < 0) {
 		dev_err(ctx->dev, "transfer firmware failed: %d\n", ret);
@@ -158,6 +162,7 @@ static int cnl_load_base_firmware(struct sst_dsp *ctx)
 	return 0;
 
 cnl_load_base_firmware_failed:
+	dev_err(ctx->dev, "firmware load failed: %d\n", ret);
 	release_firmware(ctx->fw);
 	ctx->fw = NULL;
 
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
index cdfec0fca577..067d1ea11cde 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.h
+++ b/sound/soc/intel/skylake/skl-sst-dsp.h
@@ -67,6 +67,7 @@ struct skl_dev;
 
 #define SKL_FW_INIT			0x1
 #define SKL_FW_RFW_START		0xf
+#define BXT_FW_ROM_INIT_RETRY		3
 
 #define SKL_ADSPIC_IPC			1
 #define SKL_ADSPIS_IPC			1
-- 
2.20.1

