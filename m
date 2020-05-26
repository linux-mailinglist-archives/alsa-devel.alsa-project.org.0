Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E431E302B
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 22:42:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 697F01770;
	Tue, 26 May 2020 22:41:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 697F01770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590525765;
	bh=M/+0zgw00LVMs3nbKJXc6JMZDGT2JDgAs+ziCroz2QQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LFqIrawqSNAJCLEWWDgrjgvUHhq6FY1eQrvQkURcuke5bMyamGYsQ0VADd2PmOogQ
	 ApufDDJLrJyZ7tEUC95VwTLeb+fPbCZZFgjtKdf5Vfn5Vqy4DY3mnSgleqQ/Kzj5uF
	 CQFgtRXiNMKZpY6YQvqP+qpvtOVmZl76tWPlWboU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36EE0F802E2;
	Tue, 26 May 2020 22:37:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C1FDF802A9; Tue, 26 May 2020 22:37:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A04E4F8026A
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 22:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A04E4F8026A
IronPort-SDR: hf6RPU6GQ/o4QZE4oxX5+mUqYMX2KLYmohJnfNH4pWnNNJoJEM42FEkX5aa3bLDcvu9JVGgX6D
 oR6GjtyozcfA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 13:36:52 -0700
IronPort-SDR: TJHkmKuMOKJT44nUHT8Vb4ZOzssfeyKiPJLXgHgllXkabZ99hj12au864T42EanpMKQ6RzrHJB
 8PKNd8f672XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; d="scan'208";a="270208892"
Received: from lfnguyen-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.61])
 by orsmga006.jf.intel.com with ESMTP; 26 May 2020 13:36:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/8] ASoC: SOF: Intel: BYT: mask BUSY or DONE interrupts in
 handler
Date: Tue, 26 May 2020 15:36:39 -0500
Message-Id: <20200526203640.25980-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526203640.25980-1-pierre-louis.bossart@linux.intel.com>
References: <20200526203640.25980-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
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

The DSP may send the same interrupt multiple times before it's handled
in the interrupt thread. Rather than masking it in the thread, mask it
in the handler directly.

This patch also removes useless checks that cannot happen, and masks
that are set don't need to be re-tested.

BugLink: https://github.com/thesofproject/linux/issues/1492
Suggested-by: Keyon Jie <yang.jie@linux.intel.com>
Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/byt.c | 46 +++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 8784c7319098..c6ac914ee56c 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -160,13 +160,31 @@ static void byt_dump(struct snd_sof_dev *sdev, u32 flags)
 static irqreturn_t byt_irq_handler(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
-	u64 isr;
+	u64 ipcx, ipcd;
 	int ret = IRQ_NONE;
 
-	/* Interrupt arrived, check src */
-	isr = snd_sof_dsp_read64(sdev, BYT_DSP_BAR, SHIM_ISRX);
-	if (isr & (SHIM_ISRX_DONE | SHIM_ISRX_BUSY))
+	ipcx = snd_sof_dsp_read64(sdev, BYT_DSP_BAR, SHIM_IPCX);
+	ipcd = snd_sof_dsp_read64(sdev, BYT_DSP_BAR, SHIM_IPCD);
+
+	if (ipcx & SHIM_BYT_IPCX_DONE) {
+
+		/* reply message from DSP, Mask Done interrupt first */
+		snd_sof_dsp_update_bits64_unlocked(sdev, BYT_DSP_BAR,
+						   SHIM_IMRX,
+						   SHIM_IMRX_DONE,
+						   SHIM_IMRX_DONE);
 		ret = IRQ_WAKE_THREAD;
+	}
+
+	if (ipcd & SHIM_BYT_IPCD_BUSY) {
+
+		/* new message from DSP, Mask Busy interrupt first */
+		snd_sof_dsp_update_bits64_unlocked(sdev, BYT_DSP_BAR,
+						   SHIM_IMRX,
+						   SHIM_IMRX_BUSY,
+						   SHIM_IMRX_BUSY);
+		ret = IRQ_WAKE_THREAD;
+	}
 
 	return ret;
 }
@@ -175,19 +193,12 @@ static irqreturn_t byt_irq_thread(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
 	u64 ipcx, ipcd;
-	u64 imrx;
 
-	imrx = snd_sof_dsp_read64(sdev, BYT_DSP_BAR, SHIM_IMRX);
 	ipcx = snd_sof_dsp_read64(sdev, BYT_DSP_BAR, SHIM_IPCX);
+	ipcd = snd_sof_dsp_read64(sdev, BYT_DSP_BAR, SHIM_IPCD);
 
 	/* reply message from DSP */
-	if (ipcx & SHIM_BYT_IPCX_DONE &&
-	    !(imrx & SHIM_IMRX_DONE)) {
-		/* Mask Done interrupt before first */
-		snd_sof_dsp_update_bits64_unlocked(sdev, BYT_DSP_BAR,
-						   SHIM_IMRX,
-						   SHIM_IMRX_DONE,
-						   SHIM_IMRX_DONE);
+	if (ipcx & SHIM_BYT_IPCX_DONE) {
 
 		spin_lock_irq(&sdev->ipc_lock);
 
@@ -207,14 +218,7 @@ static irqreturn_t byt_irq_thread(int irq, void *context)
 	}
 
 	/* new message from DSP */
-	ipcd = snd_sof_dsp_read64(sdev, BYT_DSP_BAR, SHIM_IPCD);
-	if (ipcd & SHIM_BYT_IPCD_BUSY &&
-	    !(imrx & SHIM_IMRX_BUSY)) {
-		/* Mask Busy interrupt before return */
-		snd_sof_dsp_update_bits64_unlocked(sdev, BYT_DSP_BAR,
-						   SHIM_IMRX,
-						   SHIM_IMRX_BUSY,
-						   SHIM_IMRX_BUSY);
+	if (ipcd & SHIM_BYT_IPCD_BUSY) {
 
 		/* Handle messages from DSP Core */
 		if ((ipcd & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
-- 
2.20.1

