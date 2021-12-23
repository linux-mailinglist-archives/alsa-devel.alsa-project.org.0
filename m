Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7A047E27A
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:41:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F407F1890;
	Thu, 23 Dec 2021 12:40:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F407F1890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259700;
	bh=RtJEtsIDGMDL0/87WHTDh4mXKrJiHRJkpD8NOjv8+oQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U+xxHFTNuTtVVg/9ZsDunjcdiDysEONVMOUW9Punl2J8j5TZ+GKQ2WqsfZIRsF2Kn
	 3RHc5HTtqojIhVVMDW7vW2ifg6U3Gac3Lf/DOY7VuSHYhbS5ZsfaAnpsQuutsMt88G
	 8oRz+jGh7UdsBUo7JLuuEePU158sWw+ZtlHQB0lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FCCEF80564;
	Thu, 23 Dec 2021 12:37:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A5A8F80568; Thu, 23 Dec 2021 12:37:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5870CF80553
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5870CF80553
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PzW6uTE3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259413; x=1671795413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RtJEtsIDGMDL0/87WHTDh4mXKrJiHRJkpD8NOjv8+oQ=;
 b=PzW6uTE31WS4IDbyb21CwE1uVhujjRvJHJ/KotqBHWTgzNU+C1l1i0e8
 qvu2w8EeuVYrkyWsPD/YZwNOJKd89nRypnWws4y7J+30MS1VvIwfLuSTw
 LLZmL+H9pDkc5F3BNItIBqr5eHJe8+7iXgLdOXcTR4i8ErErrpNE4HY0d
 O0pc6IvoDFuNst5Wv/OmAu30sjCpvC1L1Qn5lxhTOjEjoAV0qQ4f6i7T8
 c7U774TxpFcgD7HNdy9hzHIYFABd/b/uN/xp6M5MDmi3LYjKsB2Kt3u7x
 zlsoVuguaQseLpIsyFB8TdI3FY2zrrQTsY3Aaub2WbdqTU3Zt4fB5jvbu Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180855"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180855"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065243"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:46 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 16/20] ASoC: SOF: dsp_arch_ops: add kernel log level parameter
 for oops and stack
Date: Thu, 23 Dec 2021 13:36:24 +0200
Message-Id: <20211223113628.18582-17-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
References: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 chao.song@intel.com, daniel.baluta@nxp.com
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

To allow custom log level to be used for the DSP oops and stack print, add
a kernel log level parameter to the two ops.

Modify the xtensa oops and stack functions tom use this new log level
parameter.

Pass KER_ERR from snd_sof_get_status() to make sure that there is no
functional change with this new parameter.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/core.c        |  4 ++--
 sound/soc/sof/sof-priv.h    | 15 +++++++------
 sound/soc/sof/xtensa/core.c | 44 +++++++++++++++++++++----------------
 3 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index bc3d7192bdda..c3630ecc7d89 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -106,8 +106,8 @@ void snd_sof_get_status(struct snd_sof_dev *sdev, u32 panic_code,
 out:
 	dev_err(sdev->dev, "panic at %s:%d\n", panic_info->filename,
 		panic_info->linenum);
-	sof_oops(sdev, oops);
-	sof_stack(sdev, oops, stack, stack_words);
+	sof_oops(sdev, KERN_ERR, oops);
+	sof_stack(sdev, KERN_ERR, oops, stack, stack_words);
 }
 EXPORT_SYMBOL(snd_sof_get_status);
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 44ae8d8d1333..598f858f0e1b 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -309,8 +309,8 @@ struct snd_sof_dsp_ops {
 
 /* DSP architecture specific callbacks for oops and stack dumps */
 struct dsp_arch_ops {
-	void (*dsp_oops)(struct snd_sof_dev *sdev, void *oops);
-	void (*dsp_stack)(struct snd_sof_dev *sdev, void *oops,
+	void (*dsp_oops)(struct snd_sof_dev *sdev, const char *level, void *oops);
+	void (*dsp_stack)(struct snd_sof_dev *sdev, const char *level, void *oops,
 			  u32 *stack, u32 stack_words);
 };
 
@@ -573,16 +573,17 @@ int snd_sof_debugfs_add_region_item_iomem(struct snd_sof_dev *sdev,
 /*
  * DSP Architectures.
  */
-static inline void sof_stack(struct snd_sof_dev *sdev, void *oops, u32 *stack,
-			     u32 stack_words)
+static inline void sof_stack(struct snd_sof_dev *sdev, const char *level,
+			     void *oops, u32 *stack, u32 stack_words)
 {
-		sof_dsp_arch_ops(sdev)->dsp_stack(sdev, oops, stack, stack_words);
+		sof_dsp_arch_ops(sdev)->dsp_stack(sdev, level,  oops, stack,
+						  stack_words);
 }
 
-static inline void sof_oops(struct snd_sof_dev *sdev, void *oops)
+static inline void sof_oops(struct snd_sof_dev *sdev, const char *level, void *oops)
 {
 	if (sof_dsp_arch_ops(sdev)->dsp_oops)
-		sof_dsp_arch_ops(sdev)->dsp_oops(sdev, oops);
+		sof_dsp_arch_ops(sdev)->dsp_oops(sdev, level, oops);
 }
 
 extern const struct dsp_arch_ops sof_xtensa_arch_ops;
diff --git a/sound/soc/sof/xtensa/core.c b/sound/soc/sof/xtensa/core.c
index bd09c3825caf..bebbe3a2865c 100644
--- a/sound/soc/sof/xtensa/core.c
+++ b/sound/soc/sof/xtensa/core.c
@@ -81,33 +81,39 @@ static const struct xtensa_exception_cause xtensa_exception_causes[] = {
 };
 
 /* only need xtensa atm */
-static void xtensa_dsp_oops(struct snd_sof_dev *sdev, void *oops)
+static void xtensa_dsp_oops(struct snd_sof_dev *sdev, const char *level, void *oops)
 {
 	struct sof_ipc_dsp_oops_xtensa *xoops = oops;
 	int i;
 
-	dev_err(sdev->dev, "error: DSP Firmware Oops\n");
+	dev_printk(level, sdev->dev, "error: DSP Firmware Oops\n");
 	for (i = 0; i < ARRAY_SIZE(xtensa_exception_causes); i++) {
 		if (xtensa_exception_causes[i].id == xoops->exccause) {
-			dev_err(sdev->dev, "error: Exception Cause: %s, %s\n",
-				xtensa_exception_causes[i].msg,
-				xtensa_exception_causes[i].description);
+			dev_printk(level, sdev->dev,
+				   "error: Exception Cause: %s, %s\n",
+				   xtensa_exception_causes[i].msg,
+				   xtensa_exception_causes[i].description);
 		}
 	}
-	dev_err(sdev->dev, "EXCCAUSE 0x%8.8x EXCVADDR 0x%8.8x PS       0x%8.8x SAR     0x%8.8x\n",
-		xoops->exccause, xoops->excvaddr, xoops->ps, xoops->sar);
-	dev_err(sdev->dev, "EPC1     0x%8.8x EPC2     0x%8.8x EPC3     0x%8.8x EPC4    0x%8.8x",
-		xoops->epc1, xoops->epc2, xoops->epc3, xoops->epc4);
-	dev_err(sdev->dev, "EPC5     0x%8.8x EPC6     0x%8.8x EPC7     0x%8.8x DEPC    0x%8.8x",
-		xoops->epc5, xoops->epc6, xoops->epc7, xoops->depc);
-	dev_err(sdev->dev, "EPS2     0x%8.8x EPS3     0x%8.8x EPS4     0x%8.8x EPS5    0x%8.8x",
-		xoops->eps2, xoops->eps3, xoops->eps4, xoops->eps5);
-	dev_err(sdev->dev, "EPS6     0x%8.8x EPS7     0x%8.8x INTENABL 0x%8.8x INTERRU 0x%8.8x",
-		xoops->eps6, xoops->eps7, xoops->intenable, xoops->interrupt);
+	dev_printk(level, sdev->dev,
+		   "EXCCAUSE 0x%8.8x EXCVADDR 0x%8.8x PS       0x%8.8x SAR     0x%8.8x\n",
+		   xoops->exccause, xoops->excvaddr, xoops->ps, xoops->sar);
+	dev_printk(level, sdev->dev,
+		   "EPC1     0x%8.8x EPC2     0x%8.8x EPC3     0x%8.8x EPC4    0x%8.8x",
+		   xoops->epc1, xoops->epc2, xoops->epc3, xoops->epc4);
+	dev_printk(level, sdev->dev,
+		   "EPC5     0x%8.8x EPC6     0x%8.8x EPC7     0x%8.8x DEPC    0x%8.8x",
+		   xoops->epc5, xoops->epc6, xoops->epc7, xoops->depc);
+	dev_printk(level, sdev->dev,
+		   "EPS2     0x%8.8x EPS3     0x%8.8x EPS4     0x%8.8x EPS5    0x%8.8x",
+		   xoops->eps2, xoops->eps3, xoops->eps4, xoops->eps5);
+	dev_printk(level, sdev->dev,
+		   "EPS6     0x%8.8x EPS7     0x%8.8x INTENABL 0x%8.8x INTERRU 0x%8.8x",
+		   xoops->eps6, xoops->eps7, xoops->intenable, xoops->interrupt);
 }
 
-static void xtensa_stack(struct snd_sof_dev *sdev, void *oops, u32 *stack,
-			 u32 stack_words)
+static void xtensa_stack(struct snd_sof_dev *sdev, const char *level, void *oops,
+			 u32 *stack, u32 stack_words)
 {
 	struct sof_ipc_dsp_oops_xtensa *xoops = oops;
 	u32 stack_ptr = xoops->plat_hdr.stackptr;
@@ -115,7 +121,7 @@ static void xtensa_stack(struct snd_sof_dev *sdev, void *oops, u32 *stack,
 	unsigned char buf[4 * 8 + 3 + 1];
 	int i;
 
-	dev_err(sdev->dev, "stack dump from 0x%8.8x\n", stack_ptr);
+	dev_printk(level, sdev->dev, "stack dump from 0x%8.8x\n", stack_ptr);
 
 	/*
 	 * example output:
@@ -124,7 +130,7 @@ static void xtensa_stack(struct snd_sof_dev *sdev, void *oops, u32 *stack,
 	for (i = 0; i < stack_words; i += 4) {
 		hex_dump_to_buffer(stack + i, 16, 16, 4,
 				   buf, sizeof(buf), false);
-		dev_err(sdev->dev, "0x%08x: %s\n", stack_ptr + i * 4, buf);
+		dev_printk(level, sdev->dev, "0x%08x: %s\n", stack_ptr + i * 4, buf);
 	}
 }
 
-- 
2.34.1

