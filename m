Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 242DA334D3
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 18:22:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A08761697;
	Mon,  3 Jun 2019 18:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A08761697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559578973;
	bh=7pxbdInJOdDtLREB4xo4av6qa6E4pWf0OBztfBe3KMw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SwnzQ/bVPtinB6FngmvQXLYRO7+BQkZfWyQ3Lw79AViNLxwcjTQSvjo6no60cjPa7
	 mgT/QE8RuoZswPnLpmAgIJTywdzGFMT7+vPNI4M5G3Ijl6lQ8MhvA+nLchRAvBRPuw
	 6yzqNhwuVqaqUBVZtBKA9jInq3JTY5Cl1Ex0AqL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 751FCF8973A;
	Mon,  3 Jun 2019 18:18:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 683E3F89731; Mon,  3 Jun 2019 18:18:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2D0AF80CC4
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 18:18:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2D0AF80CC4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 09:18:29 -0700
X-ExtLoop1: 1
Received: from chiannaa-mobl6.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.97.98])
 by orsmga008.jf.intel.com with ESMTP; 03 Jun 2019 09:18:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  3 Jun 2019 11:18:15 -0500
Message-Id: <20190603161821.7486-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190603161821.7486-1-pierre-louis.bossart@linux.intel.com>
References: <20190603161821.7486-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/9] ASoC: SOF: fix DSP oops definitions in FW
	ABI
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

The definitions for DSP oops structures were not aligned
correctly to current FW ABI version 3.6.0, leading to
invalid data being printed out to debug logs. Fix the structs
and update related platform code accordingly.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/header.h  | 21 +++++++++++++++++++++
 include/sound/sof/xtensa.h  |  9 +++++++--
 sound/soc/sof/intel/bdw.c   | 17 ++++++++++-------
 sound/soc/sof/intel/byt.c   | 15 +++++++++------
 sound/soc/sof/intel/hda.c   | 16 ++++++++++------
 sound/soc/sof/xtensa/core.c |  2 +-
 6 files changed, 58 insertions(+), 22 deletions(-)

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index 0aeb2c8ad6fd..1efcf7b18ec2 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -155,6 +155,27 @@ struct sof_ipc_compound_hdr {
 	uint32_t count;		/**< count of 0 means end of compound sequence */
 }  __packed;
 
+/**
+ * OOPS header architecture specific data.
+ */
+struct sof_ipc_dsp_oops_arch_hdr {
+	uint32_t arch;		/* Identifier of architecture */
+	uint32_t totalsize;	/* Total size of oops message */
+}  __packed;
+
+/**
+ * OOPS header platform specific data.
+ */
+struct sof_ipc_dsp_oops_plat_hdr {
+	uint32_t configidhi;	/* ConfigID hi 32bits */
+	uint32_t configidlo;	/* ConfigID lo 32bits */
+	uint32_t numaregs;	/* Special regs num */
+	uint32_t stackoffset;	/* Offset to stack pointer from beginning of
+				 * oops message
+				 */
+	uint32_t stackptr;	/* Stack ptr */
+}  __packed;
+
 /** @}*/
 
 #endif
diff --git a/include/sound/sof/xtensa.h b/include/sound/sof/xtensa.h
index a7189984000d..d25c764b10e8 100644
--- a/include/sound/sof/xtensa.h
+++ b/include/sound/sof/xtensa.h
@@ -17,7 +17,8 @@
 
 /* Xtensa Firmware Oops data */
 struct sof_ipc_dsp_oops_xtensa {
-	struct sof_ipc_hdr hdr;
+	struct sof_ipc_dsp_oops_arch_hdr arch_hdr;
+	struct sof_ipc_dsp_oops_plat_hdr plat_hdr;
 	uint32_t exccause;
 	uint32_t excvaddr;
 	uint32_t ps;
@@ -38,7 +39,11 @@ struct sof_ipc_dsp_oops_xtensa {
 	uint32_t intenable;
 	uint32_t interrupt;
 	uint32_t sar;
-	uint32_t stack;
+	uint32_t debugcause;
+	uint32_t windowbase;
+	uint32_t windowstart;
+	uint32_t excsave1;
+	uint32_t ar[];
 }  __packed;
 
 #endif
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 8ff3ee520aea..70d524ef9bc0 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -220,17 +220,20 @@ static void bdw_get_registers(struct snd_sof_dev *sdev,
 			      struct sof_ipc_panic_info *panic_info,
 			      u32 *stack, size_t stack_words)
 {
-	/* first read regsisters */
-	sof_mailbox_read(sdev, sdev->dsp_oops_offset, xoops, sizeof(*xoops));
+	u32 offset = sdev->dsp_oops_offset;
+
+	/* first read registers */
+	sof_mailbox_read(sdev, offset, xoops, sizeof(*xoops));
+
+	/* note: variable AR register array is not read */
 
 	/* then get panic info */
-	sof_mailbox_read(sdev, sdev->dsp_oops_offset + sizeof(*xoops),
-			 panic_info, sizeof(*panic_info));
+	offset += xoops->arch_hdr.totalsize;
+	sof_mailbox_read(sdev, offset, panic_info, sizeof(*panic_info));
 
 	/* then get the stack */
-	sof_mailbox_read(sdev, sdev->dsp_oops_offset + sizeof(*xoops) +
-			   sizeof(*panic_info), stack,
-			   stack_words * sizeof(u32));
+	offset += sizeof(*panic_info);
+	sof_mailbox_read(sdev, offset, stack, stack_words * sizeof(u32));
 }
 
 static void bdw_dump(struct snd_sof_dev *sdev, u32 flags)
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 8765eedfcf54..107d711efc3f 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -265,17 +265,20 @@ static void byt_get_registers(struct snd_sof_dev *sdev,
 			      struct sof_ipc_panic_info *panic_info,
 			      u32 *stack, size_t stack_words)
 {
+	u32 offset = sdev->dsp_oops_offset;
+
 	/* first read regsisters */
-	sof_mailbox_read(sdev, sdev->dsp_oops_offset, xoops, sizeof(*xoops));
+	sof_mailbox_read(sdev, offset, xoops, sizeof(*xoops));
+
+	/* note: variable AR register array is not read */
 
 	/* then get panic info */
-	sof_mailbox_read(sdev, sdev->dsp_oops_offset + sizeof(*xoops),
-			 panic_info, sizeof(*panic_info));
+	offset += xoops->arch_hdr.totalsize;
+	sof_mailbox_read(sdev, offset, panic_info, sizeof(*panic_info));
 
 	/* then get the stack */
-	sof_mailbox_read(sdev, sdev->dsp_oops_offset + sizeof(*xoops) +
-			   sizeof(*panic_info), stack,
-			   stack_words * sizeof(u32));
+	offset += sizeof(*panic_info);
+	sof_mailbox_read(sdev, offset, stack, stack_words * sizeof(u32));
 }
 
 static void byt_dump(struct snd_sof_dev *sdev, u32 flags)
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 68db2ac8b6f8..5b6c21565b96 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -111,17 +111,21 @@ static void hda_dsp_get_registers(struct snd_sof_dev *sdev,
 				  struct sof_ipc_panic_info *panic_info,
 				  u32 *stack, size_t stack_words)
 {
+	u32 offset = sdev->dsp_oops_offset;
+
 	/* first read registers */
-	sof_block_read(sdev, sdev->mmio_bar, sdev->dsp_oops_offset, xoops,
-		       sizeof(*xoops));
+	sof_mailbox_read(sdev, offset, xoops, sizeof(*xoops));
+
+	/* note: variable AR register array is not read */
 
 	/* then get panic info */
-	sof_block_read(sdev, sdev->mmio_bar, sdev->dsp_oops_offset +
-		       sizeof(*xoops), panic_info, sizeof(*panic_info));
+	offset += xoops->arch_hdr.totalsize;
+	sof_block_read(sdev, sdev->mmio_bar, offset,
+		       panic_info, sizeof(*panic_info));
 
 	/* then get the stack */
-	sof_block_read(sdev, sdev->mmio_bar, sdev->dsp_oops_offset +
-		       sizeof(*xoops) + sizeof(*panic_info), stack,
+	offset += sizeof(*panic_info);
+	sof_block_read(sdev, sdev->mmio_bar, offset, stack,
 		       stack_words * sizeof(u32));
 }
 
diff --git a/sound/soc/sof/xtensa/core.c b/sound/soc/sof/xtensa/core.c
index c3ad23a85b99..46a4905a9dce 100644
--- a/sound/soc/sof/xtensa/core.c
+++ b/sound/soc/sof/xtensa/core.c
@@ -110,7 +110,7 @@ static void xtensa_stack(struct snd_sof_dev *sdev, void *oops, u32 *stack,
 			 u32 stack_words)
 {
 	struct sof_ipc_dsp_oops_xtensa *xoops = oops;
-	u32 stack_ptr = xoops->stack;
+	u32 stack_ptr = xoops->plat_hdr.stackptr;
 	/* 4 * 8chars + 3 ws + 1 terminating NUL */
 	unsigned char buf[4 * 8 + 3 + 1];
 	int i;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
