Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2670827617
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 08:37:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD5FD1616;
	Thu, 23 May 2019 08:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD5FD1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558593438;
	bh=PwVRs8K5gBWZA+MquGvRkc9Q/EUs+mrdx/D3qCM8wkY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h5WByMUQVYlh5tq5pRgB8XxQnMLY6VdYq2zYMy/h/2r7bxJMxLgO0cTsOrBaWGJoj
	 +2F9XnCHXwbiTpUTEbbECt29xuO8DXJoH3W6AAcYIMVTDYbnu3bfrLQk4RJ5WAMyIg
	 HoiOAy5hc58BNycJ9PaAsd7eOUviA6Tz93T+xZCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39B1AF89707;
	Thu, 23 May 2019 08:35:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 084A4F89674; Thu, 23 May 2019 08:35:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 725BDF8079B
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 08:35:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 725BDF8079B
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 23:35:25 -0700
X-ExtLoop1: 1
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO debian.ka.intel.com)
 ([10.249.33.91])
 by orsmga005.jf.intel.com with ESMTP; 22 May 2019 23:35:23 -0700
Date: Thu, 23 May 2019 08:34:35 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190523063433.6zuwdlt4vzw6urxj@debian.ka.intel.com>
References: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
 <20190522162142.11525-9-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522162142.11525-9-pierre-louis.bossart@linux.intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
Subject: [alsa-devel] [PATCH v3 08/12] ASoC: SOF: ipc: fix a race,
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

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---

Hi Takashi,

Unfortunately there were 4 empty lines added in the version, that Pierre
had sent to you, that weren't in the patch, that I have provided to him.
Below the correct version - if not too late yet.

Thanks
Guennadi

 sound/soc/sof/intel/bdw.c     |  9 ++++-----
 sound/soc/sof/intel/byt.c     | 10 +++++-----
 sound/soc/sof/intel/cnl.c     |  4 ++++
 sound/soc/sof/intel/hda-ipc.c | 17 ++++++++++++++---
 sound/soc/sof/ipc.c           | 13 -------------
 5 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 065cb86..8ff3ee5 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -283,6 +283,8 @@ static irqreturn_t bdw_irq_thread(int irq, void *context)
 						 SHIM_IMRX, SHIM_IMRX_DONE,
 						 SHIM_IMRX_DONE);
 
+		spin_lock_irq(&sdev->ipc_lock);
+
 		/*
 		 * handle immediate reply from DSP core. If the msg is
 		 * found, set done bit in cmd_done which is called at the
@@ -294,6 +296,8 @@ static irqreturn_t bdw_irq_thread(int irq, void *context)
 		snd_sof_ipc_reply(sdev, ipcx);
 
 		bdw_dsp_done(sdev);
+
+		spin_unlock_irq(&sdev->ipc_lock);
 	}
 
 	ipcd = snd_sof_dsp_read(sdev, BDW_DSP_BAR, SHIM_IPCD);
@@ -485,7 +489,6 @@ static void bdw_get_reply(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_ipc_msg *msg = sdev->msg;
 	struct sof_ipc_reply reply;
-	unsigned long flags;
 	int ret = 0;
 
 	/*
@@ -501,8 +504,6 @@ static void bdw_get_reply(struct snd_sof_dev *sdev)
 	/* get reply */
 	sof_mailbox_read(sdev, sdev->host_box.offset, &reply, sizeof(reply));
 
-	spin_lock_irqsave(&sdev->ipc_lock, flags);
-
 	if (reply.error < 0) {
 		memcpy(msg->reply_data, &reply, sizeof(reply));
 		ret = reply.error;
@@ -521,8 +522,6 @@ static void bdw_get_reply(struct snd_sof_dev *sdev)
 	}
 
 	msg->reply_error = ret;
-
-	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
 }
 
 static void bdw_host_done(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 7bf9143..9e4c07e 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -329,6 +329,9 @@ static irqreturn_t byt_irq_thread(int irq, void *context)
 						   SHIM_IMRX,
 						   SHIM_IMRX_DONE,
 						   SHIM_IMRX_DONE);
+
+		spin_lock_irq(&sdev->ipc_lock);
+
 		/*
 		 * handle immediate reply from DSP core. If the msg is
 		 * found, set done bit in cmd_done which is called at the
@@ -340,6 +343,8 @@ static irqreturn_t byt_irq_thread(int irq, void *context)
 		snd_sof_ipc_reply(sdev, ipcx);
 
 		byt_dsp_done(sdev);
+
+		spin_unlock_irq(&sdev->ipc_lock);
 	}
 
 	/* new message from DSP */
@@ -383,7 +388,6 @@ static void byt_get_reply(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_ipc_msg *msg = sdev->msg;
 	struct sof_ipc_reply reply;
-	unsigned long flags;
 	int ret = 0;
 
 	/*
@@ -399,8 +403,6 @@ static void byt_get_reply(struct snd_sof_dev *sdev)
 	/* get reply */
 	sof_mailbox_read(sdev, sdev->host_box.offset, &reply, sizeof(reply));
 
-	spin_lock_irqsave(&sdev->ipc_lock, flags);
-
 	if (reply.error < 0) {
 		memcpy(msg->reply_data, &reply, sizeof(reply));
 		ret = reply.error;
@@ -419,8 +421,6 @@ static void byt_get_reply(struct snd_sof_dev *sdev)
 	}
 
 	msg->reply_error = ret;
-
-	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
 }
 
 static void byt_host_done(struct snd_sof_dev *sdev)
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index c059d11..e59d180 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -64,6 +64,8 @@ static irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 					CNL_DSP_REG_HIPCCTL,
 					CNL_DSP_REG_HIPCCTL_DONE, 0);
 
+		spin_lock_irq(&sdev->ipc_lock);
+
 		/* handle immediate reply from DSP core */
 		hda_dsp_ipc_get_reply(sdev);
 		snd_sof_ipc_reply(sdev, msg);
@@ -75,6 +77,8 @@ static irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 
 		cnl_ipc_dsp_done(sdev);
 
+		spin_unlock_irq(&sdev->ipc_lock);
+
 		ret = IRQ_HANDLED;
 	}
 
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 73ead70..51b2851 100644
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
@@ -172,6 +169,18 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
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
@@ -187,6 +196,8 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 		/* set the done bit */
 		hda_dsp_ipc_dsp_done(sdev);
 
+		spin_unlock_irq(&sdev->ipc_lock);
+
 		ret = IRQ_HANDLED;
 	}
 
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 894e68c..10304a9 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -308,19 +308,8 @@ int sof_ipc_tx_message(struct snd_sof_ipc *ipc, u32 header,
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
1.9.3


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
