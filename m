Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A1A47E26B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:39:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F5BF1861;
	Thu, 23 Dec 2021 12:38:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F5BF1861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259563;
	bh=9E3hb3yjd3gfBjVAKrt3hH6vk29BHonG9AJOm3shRBw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=om2G/aq6o8XBXLyTta4R76W46iOLEcXi2t11rzW+fnU/D70EbLrKdQBxXEJ3j99ng
	 +zz4w/N+MtnaC88rPwrOhwp8bWfvBS1IN1/29k5/17aOkJkQrniU7TAqH7E4drl6en
	 n2+xEbiNTKl9CCec7RcpjKut8etClbYFJFFHOAKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10E39F8051E;
	Thu, 23 Dec 2021 12:36:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7E30F80517; Thu, 23 Dec 2021 12:36:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B7D4F80431
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B7D4F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="D/mZDzof"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259383; x=1671795383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9E3hb3yjd3gfBjVAKrt3hH6vk29BHonG9AJOm3shRBw=;
 b=D/mZDzoffI6cZkhpOpTMDXgjoFG6lJrdwWgnewo67a0UJpAEQydBlzDn
 M5w4ftPEwhCAN4DLVWtoLbPagvUI1zC8Phn7kwRJa2EtvUuCVSDLynP6s
 V1uyRj7rZWp4Y5oKU4pHRHy+gtI2pQoRlEjr5dTG2IhgojJ2bV0cVVXln
 mtQEN/qWNgrxxBAKzvgxQH0ggVpDENeKLAazQDfx3Xxfwh+jNAxoXt5jq
 bD//uk4sOFLS9vEyNxCBmSm+QrTg0CFDSeemd/nWp9b1Z3ckqyJg+IR/T
 5dBJ1T22/UvGXgWxKE5S2BE3rNsTX0PkyZEDL702uvi7FH+UrFyVQXF/m A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180804"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180804"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065082"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:19 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 05/20] ASoC: SOF: Add 'non_recoverable' parameter to
 snd_sof_dsp_panic()
Date: Thu, 23 Dec 2021 13:36:13 +0200
Message-Id: <20211223113628.18582-6-peter.ujfalusi@linux.intel.com>
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

Some platforms use retries during firmware boot to overcome DSP startup
issues.
In these cases we might receive a DSP panic message which should not be
treated as fatal if it happens during boot.

Pass this information to snd_sof_dsp_panic() and omit the panic print if
it is not fatal or the user does not want to see all dumps.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c         |  2 +-
 sound/soc/sof/imx/imx8m.c        |  2 +-
 sound/soc/sof/intel/atom.c       |  4 ++--
 sound/soc/sof/intel/bdw.c        |  4 ++--
 sound/soc/sof/intel/cnl.c        | 21 ++++++++++++++++++---
 sound/soc/sof/intel/hda-ipc.c    | 19 +++++++++++++++++--
 sound/soc/sof/intel/hda-loader.c |  8 ++++++--
 sound/soc/sof/ops.c              | 24 ++++++++++++++++++------
 sound/soc/sof/ops.h              |  2 +-
 9 files changed, 66 insertions(+), 20 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 099b4356122c..f6baecbb57fb 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -97,7 +97,7 @@ static void imx8_dsp_handle_request(struct imx_dsp_ipc *ipc)
 
 	/* Check to see if the message is a panic code (0x0dead***) */
 	if ((p & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC)
-		snd_sof_dsp_panic(priv->sdev, p);
+		snd_sof_dsp_panic(priv->sdev, p, true);
 	else
 		snd_sof_ipc_msgs_rx(priv->sdev);
 }
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index c026caea4c8b..788e77bcb603 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -90,7 +90,7 @@ static void imx8m_dsp_handle_request(struct imx_dsp_ipc *ipc)
 
 	/* Check to see if the message is a panic code (0x0dead***) */
 	if ((p & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC)
-		snd_sof_dsp_panic(priv->sdev, p);
+		snd_sof_dsp_panic(priv->sdev, p, true);
 	else
 		snd_sof_ipc_msgs_rx(priv->sdev);
 }
diff --git a/sound/soc/sof/intel/atom.c b/sound/soc/sof/intel/atom.c
index 5aa064b28fca..bcb2eb2acf2e 100644
--- a/sound/soc/sof/intel/atom.c
+++ b/sound/soc/sof/intel/atom.c
@@ -165,8 +165,8 @@ irqreturn_t atom_irq_thread(int irq, void *context)
 
 		/* Handle messages from DSP Core */
 		if ((ipcd & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
-			snd_sof_dsp_panic(sdev, PANIC_OFFSET(ipcd) +
-					  MBOX_OFFSET);
+			snd_sof_dsp_panic(sdev, PANIC_OFFSET(ipcd) + MBOX_OFFSET,
+					  true);
 		} else {
 			snd_sof_ipc_msgs_rx(sdev);
 		}
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 1121711e9029..10c9a0b39371 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -344,8 +344,8 @@ static irqreturn_t bdw_irq_thread(int irq, void *context)
 
 		/* Handle messages from DSP Core */
 		if ((ipcd & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
-			snd_sof_dsp_panic(sdev, BDW_PANIC_OFFSET(ipcx) +
-					  MBOX_OFFSET);
+			snd_sof_dsp_panic(sdev, BDW_PANIC_OFFSET(ipcx) + MBOX_OFFSET,
+					  true);
 		} else {
 			snd_sof_ipc_msgs_rx(sdev);
 		}
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 3da158d08980..e615125d575e 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -82,9 +82,24 @@ irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 			 msg, msg_ext);
 
 		/* handle messages from DSP */
-		if ((hipctdr & SOF_IPC_PANIC_MAGIC_MASK) ==
-		   SOF_IPC_PANIC_MAGIC) {
-			snd_sof_dsp_panic(sdev, HDA_DSP_PANIC_OFFSET(msg_ext));
+		if ((hipctdr & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
+			struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+			bool non_recoverable = true;
+
+			/*
+			 * This is a PANIC message!
+			 *
+			 * If it is arriving during firmware boot and it is not
+			 * the last boot attempt then change the non_recoverable
+			 * to false as the DSP might be able to boot in the next
+			 * iteration(s)
+			 */
+			if (sdev->fw_state == SOF_FW_BOOT_IN_PROGRESS &&
+			    hda->boot_iteration < HDA_FW_BOOT_ATTEMPTS)
+				non_recoverable = false;
+
+			snd_sof_dsp_panic(sdev, HDA_DSP_PANIC_OFFSET(msg_ext),
+					  non_recoverable);
 		} else {
 			snd_sof_ipc_msgs_rx(sdev);
 		}
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 2019087a84ce..f0cf8019d72d 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -173,8 +173,23 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 
 		/* handle messages from DSP */
 		if ((hipct & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
-			/* this is a PANIC message !! */
-			snd_sof_dsp_panic(sdev, HDA_DSP_PANIC_OFFSET(msg_ext));
+			struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+			bool non_recoverable = true;
+
+			/*
+			 * This is a PANIC message!
+			 *
+			 * If it is arriving during firmware boot and it is not
+			 * the last boot attempt then change the non_recoverable
+			 * to false as the DSP might be able to boot in the next
+			 * iteration(s)
+			 */
+			if (sdev->fw_state == SOF_FW_BOOT_IN_PROGRESS &&
+			    hda->boot_iteration < HDA_FW_BOOT_ATTEMPTS)
+				non_recoverable = false;
+
+			snd_sof_dsp_panic(sdev, HDA_DSP_PANIC_OFFSET(msg_ext),
+					  non_recoverable);
 		} else {
 			/* normal message - process normally */
 			snd_sof_ipc_msgs_rx(sdev);
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 5f5f396f4fb8..8ef16f1082e3 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -413,9 +413,13 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 		hda_sdw_process_wakeen(sdev);
 
 	/*
-	 * at this point DSP ROM has been initialized and
-	 * should be ready for code loading and firmware boot
+	 * Set the boot_iteration to the last attempt, indicating that the
+	 * DSP ROM has been initialized and from this point there will be no
+	 * retry done to boot.
+	 *
+	 * Continue with code loading and firmware boot
 	 */
+	hda->boot_iteration = HDA_FW_BOOT_ATTEMPTS;
 	ret = cl_copy_fw(sdev, stream);
 	if (!ret) {
 		dev_dbg(sdev->dev, "Firmware download successful, booting...\n");
diff --git a/sound/soc/sof/ops.c b/sound/soc/sof/ops.c
index 1d6a95a00cf5..9abf7a8e55e0 100644
--- a/sound/soc/sof/ops.c
+++ b/sound/soc/sof/ops.c
@@ -142,7 +142,13 @@ void snd_sof_dsp_update_bits_forced(struct snd_sof_dev *sdev, u32 bar,
 }
 EXPORT_SYMBOL(snd_sof_dsp_update_bits_forced);
 
-void snd_sof_dsp_panic(struct snd_sof_dev *sdev, u32 offset)
+/**
+ * snd_sof_dsp_panic - handle a received DSP panic message
+ * @sdev: Pointer to the device's sdev
+ * @offset: offset of panic information
+ * @non_recoverable: the panic is fatal, no recovery will be done by the caller
+ */
+void snd_sof_dsp_panic(struct snd_sof_dev *sdev, u32 offset, bool non_recoverable)
 {
 	/*
 	 * if DSP is not ready and the dsp_oops_offset is not yet set, use the
@@ -160,12 +166,18 @@ void snd_sof_dsp_panic(struct snd_sof_dev *sdev, u32 offset)
 			 "%s: dsp_oops_offset %zu differs from panic offset %u\n",
 			 __func__, sdev->dsp_oops_offset, offset);
 
-	dev_err(sdev->dev, "DSP panic!\n");
+	/*
+	 * Only print the panic information if we have non recoverable panic or
+	 * if all dumps should be printed
+	 */
+	if (non_recoverable || sof_debug_check_flag(SOF_DBG_PRINT_ALL_DUMPS)) {
+		dev_err(sdev->dev, "DSP panic!\n");
 
-	/* We want to see the DSP panic! */
-	sdev->dbg_dump_printed = false;
+		/* We want to see the DSP panic! */
+		sdev->dbg_dump_printed = false;
 
-	snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
-	snd_sof_trace_notify_for_error(sdev);
+		snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
+		snd_sof_trace_notify_for_error(sdev);
+	}
 }
 EXPORT_SYMBOL(snd_sof_dsp_panic);
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index b0ffb2a93bcc..bca7d35536e4 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -643,5 +643,5 @@ int snd_sof_dsp_register_poll(struct snd_sof_dev *sdev, u32 bar, u32 offset,
 			      u32 mask, u32 target, u32 timeout_ms,
 			      u32 interval_us);
 
-void snd_sof_dsp_panic(struct snd_sof_dev *sdev, u32 offset);
+void snd_sof_dsp_panic(struct snd_sof_dev *sdev, u32 offset, bool non_recoverable);
 #endif
-- 
2.34.1

