Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 738E747E27D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:42:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10DC018D4;
	Thu, 23 Dec 2021 12:41:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10DC018D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259735;
	bh=7Ie7V2A422DR/YZfLfx/T3EhUDMSWVD0hM/8L3vm/Ig=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S38tlUL7JHMsz4o90eDX8f2zGrNrdT35h0pycRRZvm04a25qtlXWEMwL3URwDR7jW
	 rRXgDTp4scfPKCPOgP7hG9/g6QH8res3ggP6V1kXUWYYGHLbVWdj0r8KiP113QIyZh
	 B6PDwXkf0WFAqMrc+f88er3GvUuwWhkyQzcBR18Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE893F8057C;
	Thu, 23 Dec 2021 12:37:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18EEBF80564; Thu, 23 Dec 2021 12:37:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB73AF80557
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB73AF80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SUY0gBRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259414; x=1671795414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Ie7V2A422DR/YZfLfx/T3EhUDMSWVD0hM/8L3vm/Ig=;
 b=SUY0gBRelMawcBmQF9YRm/Wbq0KeA+jwv5SVrPpRMWxNeOYbE91obxX1
 2lWTRu++k9Ru53RUl795C08wv3uq0rwDBhZwj+UwE1F2xdzb6mPAF0qD1
 AnX6cnxwVlwW/mbF1DGurfcfRyZt679Pg4+b84SNKnCPh8WcnQPVwjYVv
 0nwHmIFPAzIXHKwc8snINZv67hNayqVBcHzLGysIHwkUSfsKM7W8A5Yfq
 /CH2U1Xu6x0XgtqVXPX+penFBsLWG78s9uWC63QrwxGaT9Ruqn3ncLE6p
 aUi+0S8hcYjkMMm4Dk+sRN0FUmXLzFQA7fgaQRmfvRjaZSXjn5Ghq1tzq Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180861"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180861"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:51 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065254"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:48 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 17/20] ASoC: SOF: Rename snd_sof_get_status() and add kernel
 log level parameter
Date: Thu, 23 Dec 2021 13:36:25 +0200
Message-Id: <20211223113628.18582-18-peter.ujfalusi@linux.intel.com>
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

The snd_sof_get_status() is not the best name for a function which in fact
is tasked to print out DSP oops and stack. Rename it to
sof_print_oops_and_stack().

At the same time add a new parameter to specify the desired kernel log
level to be used for the prints.

When updating the users of the function, pass KERN_ERR for now to make sure
that there is no functional change happens.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/core.c           | 45 +++++++++++++++++++++-------------
 sound/soc/sof/imx/imx-common.c |  4 +--
 sound/soc/sof/intel/atom.c     |  4 +--
 sound/soc/sof/intel/bdw.c      |  4 +--
 sound/soc/sof/intel/hda.c      |  4 +--
 sound/soc/sof/sof-priv.h       |  8 +++---
 6 files changed, 40 insertions(+), 29 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index c3630ecc7d89..8f32b5b12b3e 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -68,23 +68,33 @@ static const struct sof_panic_msg panic_msg[] = {
 	{SOF_IPC_PANIC_ASSERT, "assertion failed"},
 };
 
-/*
+/**
+ * sof_print_oops_and_stack - Handle the printing of DSP oops and stack trace
+ * @sdev: Pointer to the device's sdev
+ * @level: prink log level to use for the printing
+ * @panic_code: the panic code
+ * @tracep_code: tracepoint code
+ * @oops: Pointer to DSP specific oops data
+ * @panic_info: Pointer to the received panic information message
+ * @stack: Pointer to the call stack data
+ * @stack_words: Number of words in the stack data
+ *
  * helper to be called from .dbg_dump callbacks. No error code is
  * provided, it's left as an exercise for the caller of .dbg_dump
  * (typically IPC or loader)
  */
-void snd_sof_get_status(struct snd_sof_dev *sdev, u32 panic_code,
-			u32 tracep_code, void *oops,
-			struct sof_ipc_panic_info *panic_info,
-			void *stack, size_t stack_words)
+void sof_print_oops_and_stack(struct snd_sof_dev *sdev, const char *level,
+			      u32 panic_code, u32 tracep_code, void *oops,
+			      struct sof_ipc_panic_info *panic_info,
+			      void *stack, size_t stack_words)
 {
 	u32 code;
 	int i;
 
 	/* is firmware dead ? */
 	if ((panic_code & SOF_IPC_PANIC_MAGIC_MASK) != SOF_IPC_PANIC_MAGIC) {
-		dev_err(sdev->dev, "unexpected fault %#010x trace %#010x\n",
-			panic_code, tracep_code);
+		dev_printk(level, sdev->dev, "unexpected fault %#010x trace %#010x\n",
+			   panic_code, tracep_code);
 		return; /* no fault ? */
 	}
 
@@ -92,24 +102,25 @@ void snd_sof_get_status(struct snd_sof_dev *sdev, u32 panic_code,
 
 	for (i = 0; i < ARRAY_SIZE(panic_msg); i++) {
 		if (panic_msg[i].id == code) {
-			dev_err(sdev->dev, "reason: %s (%#x)\n", panic_msg[i].msg,
-				code & SOF_IPC_PANIC_CODE_MASK);
-			dev_err(sdev->dev, "trace point: %#010x\n", tracep_code);
+			dev_printk(level, sdev->dev, "reason: %s (%#x)\n",
+				   panic_msg[i].msg, code & SOF_IPC_PANIC_CODE_MASK);
+			dev_printk(level, sdev->dev, "trace point: %#010x\n", tracep_code);
 			goto out;
 		}
 	}
 
 	/* unknown error */
-	dev_err(sdev->dev, "unknown panic code: %#x\n", code & SOF_IPC_PANIC_CODE_MASK);
-	dev_err(sdev->dev, "trace point: %#010x\n", tracep_code);
+	dev_printk(level, sdev->dev, "unknown panic code: %#x\n",
+		   code & SOF_IPC_PANIC_CODE_MASK);
+	dev_printk(level, sdev->dev, "trace point: %#010x\n", tracep_code);
 
 out:
-	dev_err(sdev->dev, "panic at %s:%d\n", panic_info->filename,
-		panic_info->linenum);
-	sof_oops(sdev, KERN_ERR, oops);
-	sof_stack(sdev, KERN_ERR, oops, stack, stack_words);
+	dev_printk(level, sdev->dev, "panic at %s:%d\n", panic_info->filename,
+		   panic_info->linenum);
+	sof_oops(sdev, level, oops);
+	sof_stack(sdev, level, oops, stack, stack_words);
 }
-EXPORT_SYMBOL(snd_sof_get_status);
+EXPORT_SYMBOL(sof_print_oops_and_stack);
 
 /*
  *			FW Boot State Transition Diagram
diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 9371e9062cb1..36e3d414a18f 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -69,8 +69,8 @@ void imx8_dump(struct snd_sof_dev *sdev, u32 flags)
 			   IMX8_STACK_DUMP_SIZE);
 
 	/* Print the information to the console */
-	snd_sof_get_status(sdev, status, status, &xoops, &panic_info, stack,
-			   IMX8_STACK_DUMP_SIZE);
+	sof_print_oops_and_stack(sdev, KERN_ERR, status, status, &xoops,
+				 &panic_info, stack, IMX8_STACK_DUMP_SIZE);
 }
 EXPORT_SYMBOL(imx8_dump);
 
diff --git a/sound/soc/sof/intel/atom.c b/sound/soc/sof/intel/atom.c
index bcb2eb2acf2e..ff5900b155dc 100644
--- a/sound/soc/sof/intel/atom.c
+++ b/sound/soc/sof/intel/atom.c
@@ -70,8 +70,8 @@ void atom_dump(struct snd_sof_dev *sdev, u32 flags)
 	panic = snd_sof_dsp_read64(sdev, DSP_BAR, SHIM_IPCX);
 	atom_get_registers(sdev, &xoops, &panic_info, stack,
 			   STACK_DUMP_SIZE);
-	snd_sof_get_status(sdev, status, panic, &xoops, &panic_info, stack,
-			   STACK_DUMP_SIZE);
+	sof_print_oops_and_stack(sdev, KERN_ERR, status, panic, &xoops,
+				 &panic_info, stack, STACK_DUMP_SIZE);
 
 	/* provide some context for firmware debug */
 	imrx = snd_sof_dsp_read64(sdev, DSP_BAR, SHIM_IMRX);
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 10c9a0b39371..d627b7498d5e 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -258,8 +258,8 @@ static void bdw_dump(struct snd_sof_dev *sdev, u32 flags)
 	panic = snd_sof_dsp_read(sdev, BDW_DSP_BAR, SHIM_IPCX);
 	bdw_get_registers(sdev, &xoops, &panic_info, stack,
 			  BDW_STACK_DUMP_SIZE);
-	snd_sof_get_status(sdev, status, panic, &xoops, &panic_info, stack,
-			   BDW_STACK_DUMP_SIZE);
+	sof_print_oops_and_stack(sdev, KERN_ERR, status, panic, &xoops,
+				 &panic_info, stack, BDW_STACK_DUMP_SIZE);
 
 	/* provide some context for firmware debug */
 	imrx = snd_sof_dsp_read(sdev, BDW_DSP_BAR, SHIM_IMRX);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 21100d2e6644..97027530ecef 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -554,8 +554,8 @@ void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 
 		hda_dsp_get_registers(sdev, &xoops, &panic_info, stack,
 				      HDA_DSP_STACK_DUMP_SIZE);
-		snd_sof_get_status(sdev, status, panic, &xoops, &panic_info,
-				   stack, HDA_DSP_STACK_DUMP_SIZE);
+		sof_print_oops_and_stack(sdev, KERN_ERR, status, panic, &xoops,
+					 &panic_info, stack, HDA_DSP_STACK_DUMP_SIZE);
 	} else {
 		hda_dsp_dump_ext_rom_status(sdev, flags);
 	}
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 598f858f0e1b..5fbd4f29321a 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -559,10 +559,10 @@ int snd_sof_debugfs_buf_item(struct snd_sof_dev *sdev,
 int snd_sof_trace_update_pos(struct snd_sof_dev *sdev,
 			     struct sof_ipc_dma_trace_posn *posn);
 void snd_sof_trace_notify_for_error(struct snd_sof_dev *sdev);
-void snd_sof_get_status(struct snd_sof_dev *sdev, u32 panic_code,
-			u32 tracep_code, void *oops,
-			struct sof_ipc_panic_info *panic_info,
-			void *stack, size_t stack_words);
+void sof_print_oops_and_stack(struct snd_sof_dev *sdev, const char *level,
+			      u32 panic_code, u32 tracep_code, void *oops,
+			      struct sof_ipc_panic_info *panic_info,
+			      void *stack, size_t stack_words);
 int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev);
 void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev);
 int snd_sof_dbg_memory_info_init(struct snd_sof_dev *sdev);
-- 
2.34.1

