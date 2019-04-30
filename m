Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E38DC10341
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 01:20:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77E3D1694;
	Wed,  1 May 2019 01:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77E3D1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556666419;
	bh=XW0E+NBbRcrQWMJcZRyoWRnNqDfwJgBxPvFLE0is1kc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZdWrqeDDVXFsEdG/5kgIfoUdezqrTNOqQKeL3BrxxTPrlhebZJSeSTCzTU6Xicz2n
	 e7gmTzZov26W0V8KKKug8UD7ped2ltBNKhYTBjuQ1/RFE08QzjFhz0gfn8qyx1BMPI
	 C2CHOyY8wz4Et9OWJl+fwQ+CcKo4DM7VQWF8PoC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F484F89760;
	Wed,  1 May 2019 01:10:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F164F89740; Wed,  1 May 2019 01:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10504F89729
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 01:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10504F89729
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 16:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,415,1549958400"; d="scan'208";a="166540954"
Received: from slawsonx-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.128])
 by fmsmga004.fm.intel.com with ESMTP; 30 Apr 2019 16:10:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 30 Apr 2019 18:09:28 -0500
Message-Id: <20190430230934.4321-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
References: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 13/19] ASoC: SOF: Intel: hda-ipc: simplify
	handling of IPC IRQ
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

From: Keyon Jie <yang.jie@linux.intel.com>

When using a shared IRQ between IPC interrupt and stream IOC interrupt,
the interrupt handlers need to check the interrupt source before
scheduling their respective IRQ threads. In the case of IPC handler, it
should check if it is an IPC interrupt before waking up the IPC IRQ
thread.

The IPC IRQ thread, once scheduled, does not need to check the IRQ
source again. So, remove the superfluous check in the thread. Remove the
irq_status field from snd_sof_dev struct also as it is no longer needed.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/cnl.c     |  4 ----
 sound/soc/sof/intel/hda-ipc.c | 13 +++++--------
 sound/soc/sof/sof-priv.h      |  1 -
 3 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 3afd96d9c925..d128839b2450 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -39,10 +39,6 @@ static irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 	u32 msg_ext;
 	irqreturn_t ret = IRQ_NONE;
 
-	/* here we handle IPC interrupts only */
-	if (!(sdev->irq_status & HDA_DSP_ADSPIS_IPC))
-		return ret;
-
 	hipcida = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDA);
 	hipcctl = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCCTL);
 	hipctdr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCTDR);
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index a938f568dbb1..73ead7070cde 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -145,10 +145,6 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 	u32 msg;
 	u32 msg_ext;
 
-	/* here we handle IPC interrupts only */
-	if (!(sdev->irq_status & HDA_DSP_ADSPIS_IPC))
-		return IRQ_NONE;
-
 	/* read IPC status */
 	hipcie = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
 				  HDA_DSP_REG_HIPCIE);
@@ -234,19 +230,20 @@ irqreturn_t hda_dsp_ipc_irq_handler(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
 	int ret = IRQ_NONE;
+	u32 irq_status;
 
 	spin_lock(&sdev->hw_lock);
 
 	/* store status */
-	sdev->irq_status = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
-					    HDA_DSP_REG_ADSPIS);
+	irq_status = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIS);
+	dev_vdbg(sdev->dev, "irq handler: irq_status:0x%x\n", irq_status);
 
 	/* invalid message ? */
-	if (sdev->irq_status == 0xffffffff)
+	if (irq_status == 0xffffffff)
 		goto out;
 
 	/* IPC message ? */
-	if (sdev->irq_status & HDA_DSP_ADSPIS_IPC) {
+	if (irq_status & HDA_DSP_ADSPIS_IPC) {
 		/* disable IPC interrupt */
 		snd_sof_dsp_update_bits_unlocked(sdev, HDA_DSP_BAR,
 						 HDA_DSP_REG_ADSPIC,
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 675bb10c82f5..bbc285018f9a 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -366,7 +366,6 @@ struct snd_sof_dev {
 	struct snd_sof_mailbox host_box;	/* Host initiated IPC */
 	struct snd_sof_mailbox stream_box;	/* Stream position update */
 	struct snd_sof_ipc_msg *msg;
-	u64 irq_status;
 	int ipc_irq;
 	u32 next_comp_id; /* monotonic - reset during S3 */
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
