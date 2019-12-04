Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3F9113717
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 22:31:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB556166C;
	Wed,  4 Dec 2019 22:30:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB556166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575495063;
	bh=5WdRDE0p+AKoCHbbRBaH/4fcbD584nbBAfP+PPje/Ew=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YeGRbf6/oVpWcqigKEMO9HkTbjxWOhGZFwAPbcqgugHyyzmB3TyF3vA3i27fkN7au
	 gMmg15mCJSoOAPsE6uCnjRq1q4WSruZeV86F+WqU/Joi4YL9FISthVzi7wVihms7al
	 hUHn0mnqjE9MNNe6bQV2fdxsBW7nFSdTIdbWyhnI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF24DF801D9;
	Wed,  4 Dec 2019 22:29:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BFC7F801EC; Wed,  4 Dec 2019 22:29:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B079BF8010F
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 22:29:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B079BF8010F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 13:29:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="412723523"
Received: from rgolani-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.153.236])
 by fmsmga006.fm.intel.com with ESMTP; 04 Dec 2019 13:29:08 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  4 Dec 2019 15:28:59 -0600
Message-Id: <20191204212859.13239-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: SOF: Intel: hda: solve MSI issues by
	merging ipc and stream irq handlers
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The existing code uses two handlers for a shared edge-based MSI interrupts.
In corner cases, interrupts are lost, leading to IPC timeouts. Those
timeouts do not appear in legacy mode.

This patch merges the two handlers and threads into a single one, and
simplifies the mask/unmask operations by using a single top-level mask
(Global Interrupt Enable). The handler only checks for interrupt
sources using the Global Interrupt Status (GIS) field, and all the
actual work happens in the thread. This also enables us to remove the
use of spin locks. Stream events are prioritized over IPC ones.

This patch was tested with HDaudio and SoundWire platforms, and all
known IPC timeout issues are solved in MSI mode. The
SoundWire-specific patches will be provided in follow-up patches,
where the SoundWire interrupts are handled in the same thread as IPC
and stream interrupts.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/apl.c        |  1 -
 sound/soc/sof/intel/cnl.c        |  5 ---
 sound/soc/sof/intel/hda-ipc.c    | 23 +++--------
 sound/soc/sof/intel/hda-stream.c | 20 ++++-----
 sound/soc/sof/intel/hda.c        | 69 ++++++++++++++++++++++----------
 sound/soc/sof/intel/hda.h        | 11 ++---
 6 files changed, 70 insertions(+), 59 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 9e4d859b4dba..aeed1422900b 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -42,7 +42,6 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 	.block_write	= sof_block_write,
 
 	/* doorbell */
-	.irq_handler	= hda_dsp_ipc_irq_handler,
 	.irq_thread	= hda_dsp_ipc_irq_thread,
 
 	/* ipc */
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 3541063ba84c..6b44f6d02082 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -107,10 +107,6 @@ static irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 				    "nothing to do in IPC IRQ thread\n");
 	}
 
-	/* re-enable IPC interrupt */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIC,
-				HDA_DSP_ADSPIC_IPC, HDA_DSP_ADSPIC_IPC);
-
 	return IRQ_HANDLED;
 }
 
@@ -232,7 +228,6 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 	.block_write	= sof_block_write,
 
 	/* doorbell */
-	.irq_handler	= hda_dsp_ipc_irq_handler,
 	.irq_thread	= cnl_ipc_irq_thread,
 
 	/* ipc */
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 0fd2153c1769..1837f66e361f 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -230,22 +230,15 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 				    "nothing to do in IPC IRQ thread\n");
 	}
 
-	/* re-enable IPC interrupt */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIC,
-				HDA_DSP_ADSPIC_IPC, HDA_DSP_ADSPIC_IPC);
-
 	return IRQ_HANDLED;
 }
 
-/* is this IRQ for ADSP ? - we only care about IPC here */
-irqreturn_t hda_dsp_ipc_irq_handler(int irq, void *context)
+/* Check if an IPC IRQ occurred */
+bool hda_dsp_check_ipc_irq(struct snd_sof_dev *sdev)
 {
-	struct snd_sof_dev *sdev = context;
-	int ret = IRQ_NONE;
+	bool ret = false;
 	u32 irq_status;
 
-	spin_lock(&sdev->hw_lock);
-
 	/* store status */
 	irq_status = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIS);
 	dev_vdbg(sdev->dev, "irq handler: irq_status:0x%x\n", irq_status);
@@ -255,16 +248,10 @@ irqreturn_t hda_dsp_ipc_irq_handler(int irq, void *context)
 		goto out;
 
 	/* IPC message ? */
-	if (irq_status & HDA_DSP_ADSPIS_IPC) {
-		/* disable IPC interrupt */
-		snd_sof_dsp_update_bits_unlocked(sdev, HDA_DSP_BAR,
-						 HDA_DSP_REG_ADSPIC,
-						 HDA_DSP_ADSPIC_IPC, 0);
-		ret = IRQ_WAKE_THREAD;
-	}
+	if (irq_status & HDA_DSP_ADSPIS_IPC)
+		ret = true;
 
 out:
-	spin_unlock(&sdev->hw_lock);
 	return ret;
 }
 
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 92643a801f4f..c0ab9bb2a797 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -550,22 +550,23 @@ int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
 	return 0;
 }
 
-irqreturn_t hda_dsp_stream_interrupt(int irq, void *context)
+bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev)
 {
-	struct hdac_bus *bus = context;
-	int ret = IRQ_WAKE_THREAD;
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	bool ret = false;
 	u32 status;
 
-	spin_lock(&bus->reg_lock);
+	/* The function can be called at irq thread, so use spin_lock_irq */
+	spin_lock_irq(&bus->reg_lock);
 
 	status = snd_hdac_chip_readl(bus, INTSTS);
 	dev_vdbg(bus->dev, "stream irq, INTSTS status: 0x%x\n", status);
 
-	/* Register inaccessible, ignore it.*/
-	if (status == 0xffffffff)
-		ret = IRQ_NONE;
+	/* if Register inaccessible, ignore it.*/
+	if (status != 0xffffffff)
+		ret = true;
 
-	spin_unlock(&bus->reg_lock);
+	spin_unlock_irq(&bus->reg_lock);
 
 	return ret;
 }
@@ -603,7 +604,8 @@ static bool hda_dsp_stream_check(struct hdac_bus *bus, u32 status)
 
 irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context)
 {
-	struct hdac_bus *bus = context;
+	struct snd_sof_dev *sdev = context;
+	struct hdac_bus *bus = sof_to_bus(sdev);
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	u32 rirb_status;
 #endif
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 84279f43576c..8d27846d9048 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -402,6 +402,49 @@ static const struct sof_intel_dsp_desc
 	return chip_info;
 }
 
+static irqreturn_t hda_dsp_interrupt_handler(int irq, void *context)
+{
+	struct snd_sof_dev *sdev = context;
+
+	/*
+	 * Get global interrupt status. It includes all hardware interrupt
+	 * sources in the Intel HD Audio controller.
+	 */
+	if (snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTSTS) &
+	    SOF_HDA_INTSTS_GIS) {
+
+		/* disable GIE interrupt */
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
+					SOF_HDA_INTCTL,
+					SOF_HDA_INT_GLOBAL_EN,
+					0);
+
+		return IRQ_WAKE_THREAD;
+	}
+
+	return IRQ_NONE;
+}
+
+static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
+{
+	struct snd_sof_dev *sdev = context;
+
+	/* deal with streams and controller first */
+	if (hda_dsp_check_stream_irq(sdev))
+		hda_dsp_stream_threaded_handler(irq, sdev);
+
+	if (hda_dsp_check_ipc_irq(sdev))
+		sof_ops(sdev)->irq_thread(irq, sdev);
+
+	/* enable GIE interrupt */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
+				SOF_HDA_INTCTL,
+				SOF_HDA_INT_GLOBAL_EN,
+				SOF_HDA_INT_GLOBAL_EN);
+
+	return IRQ_HANDLED;
+}
+
 int hda_dsp_probe(struct snd_sof_dev *sdev)
 {
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
@@ -506,9 +549,7 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	 */
 	if (hda_use_msi && pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_MSI) > 0) {
 		dev_info(sdev->dev, "use msi interrupt mode\n");
-		hdev->irq = pci_irq_vector(pci, 0);
-		/* ipc irq number is the same of hda irq */
-		sdev->ipc_irq = hdev->irq;
+		sdev->ipc_irq = pci_irq_vector(pci, 0);
 		/* initialised to "false" by kzalloc() */
 		sdev->msi_enabled = true;
 	}
@@ -519,28 +560,17 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 		 * in IO-APIC mode, hda->irq and ipc_irq are using the same
 		 * irq number of pci->irq
 		 */
-		hdev->irq = pci->irq;
 		sdev->ipc_irq = pci->irq;
 	}
 
-	dev_dbg(sdev->dev, "using HDA IRQ %d\n", hdev->irq);
-	ret = request_threaded_irq(hdev->irq, hda_dsp_stream_interrupt,
-				   hda_dsp_stream_threaded_handler,
-				   IRQF_SHARED, "AudioHDA", bus);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to register HDA IRQ %d\n",
-			hdev->irq);
-		goto free_irq_vector;
-	}
-
 	dev_dbg(sdev->dev, "using IPC IRQ %d\n", sdev->ipc_irq);
-	ret = request_threaded_irq(sdev->ipc_irq, hda_dsp_ipc_irq_handler,
-				   sof_ops(sdev)->irq_thread, IRQF_SHARED,
-				   "AudioDSP", sdev);
+	ret = request_threaded_irq(sdev->ipc_irq, hda_dsp_interrupt_handler,
+				   hda_dsp_interrupt_thread,
+				   IRQF_SHARED, "AudioDSP", sdev);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to register IPC IRQ %d\n",
 			sdev->ipc_irq);
-		goto free_hda_irq;
+		goto free_irq_vector;
 	}
 
 	pci_set_master(pci);
@@ -571,8 +601,6 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 
 free_ipc_irq:
 	free_irq(sdev->ipc_irq, sdev);
-free_hda_irq:
-	free_irq(hdev->irq, bus);
 free_irq_vector:
 	if (sdev->msi_enabled)
 		pci_free_irq_vectors(pci);
@@ -618,7 +646,6 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 				SOF_HDA_PPCTL_GPROCEN, 0);
 
 	free_irq(sdev->ipc_irq, sdev);
-	free_irq(hda->irq, bus);
 	if (sdev->msi_enabled)
 		pci_free_irq_vectors(pci);
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 97c3fcb23d15..01529c7058f3 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -43,11 +43,14 @@
 /* SOF_HDA_GCTL register bist */
 #define SOF_HDA_GCTL_RESET		BIT(0)
 
-/* SOF_HDA_INCTL and SOF_HDA_INTSTS regs */
+/* SOF_HDA_INCTL regs */
 #define SOF_HDA_INT_GLOBAL_EN		BIT(31)
 #define SOF_HDA_INT_CTRL_EN		BIT(30)
 #define SOF_HDA_INT_ALL_STREAM		0xff
 
+/* SOF_HDA_INTSTS regs */
+#define SOF_HDA_INTSTS_GIS		BIT(31)
+
 #define SOF_HDA_MAX_CAPS		10
 #define SOF_HDA_CAP_ID_OFF		16
 #define SOF_HDA_CAP_ID_MASK		GENMASK(SOF_HDA_CAP_ID_OFF + 11,\
@@ -406,8 +409,6 @@ struct sof_intel_hda_dev {
 	/* the maximum number of streams (playback + capture) supported */
 	u32 stream_max;
 
-	int irq;
-
 	/* PM related */
 	bool l1_support_changed;/* during suspend, is L1SEN changed or not */
 
@@ -511,11 +512,12 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 			     struct snd_pcm_hw_params *params);
 int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
 			   struct hdac_ext_stream *stream, int cmd);
-irqreturn_t hda_dsp_stream_interrupt(int irq, void *context);
 irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context);
 int hda_dsp_stream_setup_bdl(struct snd_sof_dev *sdev,
 			     struct snd_dma_buffer *dmab,
 			     struct hdac_stream *stream);
+bool hda_dsp_check_ipc_irq(struct snd_sof_dev *sdev);
+bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev);
 
 struct hdac_ext_stream *
 	hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction);
@@ -540,7 +542,6 @@ void hda_dsp_ipc_get_reply(struct snd_sof_dev *sdev);
 int hda_dsp_ipc_get_mailbox_offset(struct snd_sof_dev *sdev);
 int hda_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id);
 
-irqreturn_t hda_dsp_ipc_irq_handler(int irq, void *context);
 irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context);
 int hda_dsp_ipc_cmd_done(struct snd_sof_dev *sdev, int dir);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
