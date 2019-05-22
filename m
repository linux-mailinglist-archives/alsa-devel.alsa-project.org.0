Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E97082683A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 18:28:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 764491670;
	Wed, 22 May 2019 18:28:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 764491670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558542534;
	bh=KK2TWWu3oR6tWXG2klCXWEDE9bO1fCWeTBi8dv34goE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PLavoynGnVwpi6DZ/JNewRP/z6odVLM4hQaoCFx1OMUji2lOePhU2SdZUiwjX5et+
	 rCcyMA0q02wX0SaK0G17MkyNtBBfFc54zwUdrjAIqm6+zT5o23Ko6xGJMBsaXqzCqM
	 SBVzO4ptgO7iIhNgjMID/xVgxF0wuGxBuQFsumhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 690A8F8974B;
	Wed, 22 May 2019 18:22:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C138BF89731; Wed, 22 May 2019 18:22:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABB9AF89718
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 18:21:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABB9AF89718
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 09:21:56 -0700
X-ExtLoop1: 1
Received: from avcaesar-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.140.52])
 by fmsmga001.fm.intel.com with ESMTP; 22 May 2019 09:21:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 22 May 2019 11:21:38 -0500
Message-Id: <20190522162142.11525-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
References: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 08/12] ASoC: SOF: ipc: fix a race,
	leading to IPC timeouts
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

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

Currently on all supported platforms the IPC IRQ thread first signals
the sender when an IPC response is received from the DSP, then
unmasks the IPC interrupt. Those actions are performed without
holding any locks, so the thread can be interrupted between them. IPC
timeouts have been observed in such scenarios: if the sender is woken
up and it proceeds with sending the next message without unmasking
the IPC interrupt, it can miss the next response. This patch takes a
spin-lock to prevent the IRQ thread from being preempted at that
point. It also makes sure, that the next IPC transmission by the host
cannot take place before the IRQ thread has finished updating all the
required IPC registers.

Fixes: 53e0c72d98b ("ASoC: SOF: Add support for IPC IO between DSP and Host")
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/bdw.c     | 10 +++++-----
 sound/soc/sof/intel/byt.c     | 11 ++++++-----
 sound/soc/sof/intel/cnl.c     |  5 +++++
 sound/soc/sof/intel/hda-ipc.c | 18 +++++++++++++++---
 sound/soc/sof/ipc.c           | 13 -------------
 5 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 065cb868bdfa..61353e710738 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -278,11 +278,14 @@ static irqreturn_t bdw_irq_thread(int irq, void *context)
 	/* reply message from DSP */
 	if (ipcx & SHIM_IPCX_DONE &&
 	    !(imrx & SHIM_IMRX_DONE)) {
+
 		/* Mask Done interrupt before return */
 		snd_sof_dsp_update_bits_unlocked(sdev, BDW_DSP_BAR,
 						 SHIM_IMRX, SHIM_IMRX_DONE,
 						 SHIM_IMRX_DONE);
 
+		spin_lock_irq(&sdev->ipc_lock);
+
 		/*
 		 * handle immediate reply from DSP core. If the msg is
 		 * found, set done bit in cmd_done which is called at the
@@ -294,6 +297,8 @@ static irqreturn_t bdw_irq_thread(int irq, void *context)
 		snd_sof_ipc_reply(sdev, ipcx);
 
 		bdw_dsp_done(sdev);
+
+		spin_unlock_irq(&sdev->ipc_lock);
 	}
 
 	ipcd = snd_sof_dsp_read(sdev, BDW_DSP_BAR, SHIM_IPCD);
@@ -485,7 +490,6 @@ static void bdw_get_reply(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_ipc_msg *msg = sdev->msg;
 	struct sof_ipc_reply reply;
-	unsigned long flags;
 	int ret = 0;
 
 	/*
@@ -501,8 +505,6 @@ static void bdw_get_reply(struct snd_sof_dev *sdev)
 	/* get reply */
 	sof_mailbox_read(sdev, sdev->host_box.offset, &reply, sizeof(reply));
 
-	spin_lock_irqsave(&sdev->ipc_lock, flags);
-
 	if (reply.error < 0) {
 		memcpy(msg->reply_data, &reply, sizeof(reply));
 		ret = reply.error;
@@ -521,8 +523,6 @@ static void bdw_get_reply(struct snd_sof_dev *sdev)
 	}
 
 	msg->reply_error = ret;
-
-	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
 }
 
 static void bdw_host_done(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 7bf9143d3106..de8893d837cd 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -324,11 +324,15 @@ static irqreturn_t byt_irq_thread(int irq, void *context)
 	/* reply message from DSP */
 	if (ipcx & SHIM_BYT_IPCX_DONE &&
 	    !(imrx & SHIM_IMRX_DONE)) {
+
 		/* Mask Done interrupt before first */
 		snd_sof_dsp_update_bits64_unlocked(sdev, BYT_DSP_BAR,
 						   SHIM_IMRX,
 						   SHIM_IMRX_DONE,
 						   SHIM_IMRX_DONE);
+
+		spin_lock_irq(&sdev->ipc_lock);
+
 		/*
 		 * handle immediate reply from DSP core. If the msg is
 		 * found, set done bit in cmd_done which is called at the
@@ -340,6 +344,8 @@ static irqreturn_t byt_irq_thread(int irq, void *context)
 		snd_sof_ipc_reply(sdev, ipcx);
 
 		byt_dsp_done(sdev);
+
+		spin_unlock_irq(&sdev->ipc_lock);
 	}
 
 	/* new message from DSP */
@@ -383,7 +389,6 @@ static void byt_get_reply(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_ipc_msg *msg = sdev->msg;
 	struct sof_ipc_reply reply;
-	unsigned long flags;
 	int ret = 0;
 
 	/*
@@ -399,8 +404,6 @@ static void byt_get_reply(struct snd_sof_dev *sdev)
 	/* get reply */
 	sof_mailbox_read(sdev, sdev->host_box.offset, &reply, sizeof(reply));
 
-	spin_lock_irqsave(&sdev->ipc_lock, flags);
-
 	if (reply.error < 0) {
 		memcpy(msg->reply_data, &reply, sizeof(reply));
 		ret = reply.error;
@@ -419,8 +422,6 @@ static void byt_get_reply(struct snd_sof_dev *sdev)
 	}
 
 	msg->reply_error = ret;
-
-	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
 }
 
 static void byt_host_done(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 08a1a3d3c08d..3a83e145ab8e 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -50,6 +50,7 @@ static irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 	/* reply message from DSP */
 	if (hipcida & CNL_DSP_REG_HIPCIDA_DONE &&
 	    hipcctl & CNL_DSP_REG_HIPCCTL_DONE) {
+
 		hipci = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
 					 CNL_DSP_REG_HIPCIDR);
 		msg_ext = hipci & CNL_DSP_REG_HIPCIDR_MSG_MASK;
@@ -64,6 +65,8 @@ static irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 					CNL_DSP_REG_HIPCCTL,
 					CNL_DSP_REG_HIPCCTL_DONE, 0);
 
+		spin_lock_irq(&sdev->ipc_lock);
+
 		/* handle immediate reply from DSP core */
 		hda_dsp_ipc_get_reply(sdev);
 		snd_sof_ipc_reply(sdev, msg);
@@ -75,6 +78,8 @@ static irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 
 		cnl_ipc_dsp_done(sdev);
 
+		spin_unlock_irq(&sdev->ipc_lock);
+
 		ret = IRQ_HANDLED;
 	}
 
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 73ead7070cde..f841032e88da 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -72,7 +72,6 @@ void hda_dsp_ipc_get_reply(struct snd_sof_dev *sdev)
 	struct snd_sof_ipc_msg *msg = sdev->msg;
 	struct sof_ipc_reply reply;
 	struct sof_ipc_cmd_hdr *hdr;
-	unsigned long flags;
 	int ret = 0;
 
 	/*
@@ -84,7 +83,6 @@ void hda_dsp_ipc_get_reply(struct snd_sof_dev *sdev)
 		dev_warn(sdev->dev, "unexpected ipc interrupt raised!\n");
 		return;
 	}
-	spin_lock_irqsave(&sdev->ipc_lock, flags);
 
 	hdr = msg->msg_data;
 	if (hdr->cmd == (SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CTX_SAVE)) {
@@ -123,7 +121,6 @@ void hda_dsp_ipc_get_reply(struct snd_sof_dev *sdev)
 out:
 	msg->reply_error = ret;
 
-	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
 }
 
 static bool hda_dsp_ipc_is_sof(uint32_t msg)
@@ -158,6 +155,7 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 	/* is this a reply message from the DSP */
 	if (hipcie & HDA_DSP_REG_HIPCIE_DONE &&
 	    hipcctl & HDA_DSP_REG_HIPCCTL_DONE) {
+
 		hipci = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
 					 HDA_DSP_REG_HIPCI);
 		msg = hipci & HDA_DSP_REG_HIPCI_MSG_MASK;
@@ -172,6 +170,18 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 					HDA_DSP_REG_HIPCCTL,
 					HDA_DSP_REG_HIPCCTL_DONE, 0);
 
+		/*
+		 * Make sure the interrupt thread cannot be preempted between
+		 * waking up the sender and re-enabling the interrupt. Also
+		 * protect against a theoretical race with sof_ipc_tx_message():
+		 * if the DSP is fast enough to receive an IPC message, reply to
+		 * it, and the host interrupt processing calls this function on
+		 * a different core from the one, where the sending is taking
+		 * place, the message might not yet be marked as expecting a
+		 * reply.
+		 */
+		spin_lock_irq(&sdev->ipc_lock);
+
 		/* handle immediate reply from DSP core - ignore ROM messages */
 		if (hda_dsp_ipc_is_sof(msg)) {
 			hda_dsp_ipc_get_reply(sdev);
@@ -187,6 +197,8 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 		/* set the done bit */
 		hda_dsp_ipc_dsp_done(sdev);
 
+		spin_unlock_irq(&sdev->ipc_lock);
+
 		ret = IRQ_HANDLED;
 	}
 
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 894e68cbd69d..10304a90cf25 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -308,19 +308,8 @@ EXPORT_SYMBOL(sof_ipc_tx_message);
 int snd_sof_ipc_reply(struct snd_sof_dev *sdev, u32 msg_id)
 {
 	struct snd_sof_ipc_msg *msg = &sdev->ipc->msg;
-	unsigned long flags;
-
-	/*
-	 * Protect against a theoretical race with sof_ipc_tx_message(): if the
-	 * DSP is fast enough to receive an IPC message, reply to it, and the
-	 * host interrupt processing calls this function on a different core
-	 * from the one, where the sending is taking place, the message might
-	 * not yet be marked as expecting a reply.
-	 */
-	spin_lock_irqsave(&sdev->ipc_lock, flags);
 
 	if (msg->ipc_complete) {
-		spin_unlock_irqrestore(&sdev->ipc_lock, flags);
 		dev_err(sdev->dev, "error: no reply expected, received 0x%x",
 			msg_id);
 		return -EINVAL;
@@ -330,8 +319,6 @@ int snd_sof_ipc_reply(struct snd_sof_dev *sdev, u32 msg_id)
 	msg->ipc_complete = true;
 	wake_up(&msg->waitq);
 
-	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
-
 	return 0;
 }
 EXPORT_SYMBOL(snd_sof_ipc_reply);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
