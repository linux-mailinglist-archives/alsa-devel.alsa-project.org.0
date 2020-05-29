Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 182201E8132
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 17:06:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A089317B8;
	Fri, 29 May 2020 17:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A089317B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590764773;
	bh=p7Jy3EnV8AsdYFhGEXVO1fHmq5s/FRPJVgtV0Db7LC4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=egdWMvHwrGW1jjoXpV30nBYHDxx7bC95Cj8YaIm3z0uNJO8I/IvvC68v/Cpj1I01w
	 yrl6QVrY4qjFqnyyuBHsW8BVctnAm95eck5VMoqG8ZOT8VJjVJHMDxUx4UENJ8ZQ5q
	 COA4QWGQJgzlL1WyW1GCx/52kojxkxK5nYl7IFJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3CD0F80149;
	Fri, 29 May 2020 17:04:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74053F8014E; Fri, 29 May 2020 17:04:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF997F80107
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 17:04:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF997F80107
IronPort-SDR: nsiDgQJ64+YrrrIXEfXazuDq8oZ2laymWaVOfugMnwwQoKumG2FQbOQsdR+TNzWMuuTk9CU9Mu
 WiuVqUOaxdVQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 08:04:19 -0700
IronPort-SDR: lt1dnw+6yS0JcOTZJKWboK/5ZfdyJAFt/GGEIvU8n/j1B1UKQ3A8jPanECr/1vCepfyz7VklXq
 OZeLttD1Mi1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,449,1583222400"; d="scan'208";a="256108282"
Received: from cloy-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.102.63])
 by fmsmga007.fm.intel.com with ESMTP; 29 May 2020 08:04:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Intel: Baytrail: fix 'defined but not used'
 warnings
Date: Fri, 29 May 2020 10:04:08 -0500
Message-Id: <20200529150408.17236-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Stephen Rothwell <sfr@canb.auug.org.au>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

With the allmodconfig option, CONFIG_SND_SOC_SOF_BAYTRAIL is disabled
due to mutual exclusion with the legacy driver. This generates
'defined by not used' warnings.

suspend/resume/remove are only supported for Baytrail for now, so move
the code under the CONFIG_SND_SOC_SOF_BAYTRAIL checks.

Fixes: ddcccd543f5d ("ASoC: SOF: Intel: byt: Add PM callbacks")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/byt.c | 72 +++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index e6ba8382b1de..49f67f1b94e0 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -432,42 +432,6 @@ static void byt_set_mach_params(const struct snd_soc_acpi_mach *mach,
 	mach_params->platform = dev_name(dev);
 }
 
-static void byt_reset_dsp_disable_int(struct snd_sof_dev *sdev)
-{
-	/* Disable Interrupt from both sides */
-	snd_sof_dsp_update_bits64(sdev, BYT_DSP_BAR, SHIM_IMRX, 0x3, 0x3);
-	snd_sof_dsp_update_bits64(sdev, BYT_DSP_BAR, SHIM_IMRD, 0x3, 0x3);
-
-	/* Put DSP into reset, set reset vector */
-	snd_sof_dsp_update_bits64(sdev, BYT_DSP_BAR, SHIM_CSR,
-				  SHIM_BYT_CSR_RST | SHIM_BYT_CSR_VECTOR_SEL,
-				  SHIM_BYT_CSR_RST | SHIM_BYT_CSR_VECTOR_SEL);
-}
-
-static int byt_suspend(struct snd_sof_dev *sdev, u32 target_state)
-{
-	byt_reset_dsp_disable_int(sdev);
-
-	return 0;
-}
-
-static int byt_resume(struct snd_sof_dev *sdev)
-{
-	/* enable BUSY and disable DONE Interrupt by default */
-	snd_sof_dsp_update_bits64(sdev, BYT_DSP_BAR, SHIM_IMRX,
-				  SHIM_IMRX_BUSY | SHIM_IMRX_DONE,
-				  SHIM_IMRX_DONE);
-
-	return 0;
-}
-
-static int byt_remove(struct snd_sof_dev *sdev)
-{
-	byt_reset_dsp_disable_int(sdev);
-
-	return 0;
-}
-
 /* Baytrail DAIs */
 static struct snd_soc_dai_driver byt_dai[] = {
 {
@@ -695,6 +659,42 @@ EXPORT_SYMBOL_NS(tng_chip_info, SND_SOC_SOF_MERRIFIELD);
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 
+static void byt_reset_dsp_disable_int(struct snd_sof_dev *sdev)
+{
+	/* Disable Interrupt from both sides */
+	snd_sof_dsp_update_bits64(sdev, BYT_DSP_BAR, SHIM_IMRX, 0x3, 0x3);
+	snd_sof_dsp_update_bits64(sdev, BYT_DSP_BAR, SHIM_IMRD, 0x3, 0x3);
+
+	/* Put DSP into reset, set reset vector */
+	snd_sof_dsp_update_bits64(sdev, BYT_DSP_BAR, SHIM_CSR,
+				  SHIM_BYT_CSR_RST | SHIM_BYT_CSR_VECTOR_SEL,
+				  SHIM_BYT_CSR_RST | SHIM_BYT_CSR_VECTOR_SEL);
+}
+
+static int byt_suspend(struct snd_sof_dev *sdev, u32 target_state)
+{
+	byt_reset_dsp_disable_int(sdev);
+
+	return 0;
+}
+
+static int byt_resume(struct snd_sof_dev *sdev)
+{
+	/* enable BUSY and disable DONE Interrupt by default */
+	snd_sof_dsp_update_bits64(sdev, BYT_DSP_BAR, SHIM_IMRX,
+				  SHIM_IMRX_BUSY | SHIM_IMRX_DONE,
+				  SHIM_IMRX_DONE);
+
+	return 0;
+}
+
+static int byt_remove(struct snd_sof_dev *sdev)
+{
+	byt_reset_dsp_disable_int(sdev);
+
+	return 0;
+}
+
 static const struct snd_sof_debugfs_map cht_debugfs[] = {
 	{"dmac0", BYT_DSP_BAR, DMAC0_OFFSET, DMAC_SIZE,
 	 SOF_DEBUGFS_ACCESS_ALWAYS},
-- 
2.20.1

