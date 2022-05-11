Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B1B523B56
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 19:18:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A88A18D6;
	Wed, 11 May 2022 19:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A88A18D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652289531;
	bh=UKaZhF5/QJG0X6h5zdcto1ttT0j+Jd5mMY+08NNMXN4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cDVium8WWLAYNw6G8vdyJepVfKPcLCxMpZh3S5dh9ClqJMYha4T3jEnYe0Rniqruc
	 0oG75N0F/2CcIEgv4obCdBw7s9vZdzqnrUpVnsvQFcyt6H8HCHNytMUgdQpqGjRxAD
	 39eRdQzuG9dE+aU8+Stzisd2vOTPzJeJbnfY75rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAFA2F80516;
	Wed, 11 May 2022 19:17:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23DA8F80508; Wed, 11 May 2022 19:17:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19746F800BB
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 19:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19746F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RRz8BFSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652289424; x=1683825424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UKaZhF5/QJG0X6h5zdcto1ttT0j+Jd5mMY+08NNMXN4=;
 b=RRz8BFSj+B1yRSeEOv05UqB3/+KPvEBEyp8iaxBSfXpZLtPEYrj/z6sU
 INxn8euvY+zTyC03nzoQvTeUpm89pFAFtx3Yd4bcLtga4MAjmerLzLQRC
 jmdYHl3EHha9Ri16srNi+NCmzwIsAXJw0/tfhRrcbXiJv6bu5BDWm4A4/
 hwHp9s6jJjGZj5/hd1eoOxjNfpP/eUzLjhuO7OOPojcif6ePV1a9B56KG
 yfVr9dpzlUB8T9hQPl0+azhy9zla2ogkCpXKVi6pgGuo96uHarjIvtOw/
 1AfE6DlpCTbYSAErYu3yJS4A47tfC2BAvDhi221Q0OBaIcNNS7kxa1FWN w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269431625"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="269431625"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 10:16:54 -0700
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="697663169"
Received: from sjbrune-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.32.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 10:16:54 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ASoC: SOF: Intel: HDA: Set IPC4-specific DSP ops for CaVS
 platforms
Date: Wed, 11 May 2022 10:16:44 -0700
Message-Id: <20220511171648.1622993-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511171648.1622993-1-ranjani.sridharan@linux.intel.com>
References: <20220511171648.1622993-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

Add implementation of low level, platform dependent IPC4 message handling
and set the DSP ops for IPC4 for APL, CNL and TGL platforms.

Co-developed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/apl.c     | 17 ++++--
 sound/soc/sof/intel/cnl.c     | 97 +++++++++++++++++++++++++++++++++--
 sound/soc/sof/intel/hda-ipc.c | 82 +++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h     |  6 +++
 sound/soc/sof/intel/tgl.c     | 18 +++++--
 5 files changed, 208 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index b7839fd04dfb..4c67110a073e 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -37,11 +37,20 @@ int sof_apl_ops_init(struct snd_sof_dev *sdev)
 	/* probe/remove/shutdown */
 	sof_apl_ops.shutdown	= hda_dsp_shutdown;
 
-	/* doorbell */
-	sof_apl_ops.irq_thread	= hda_dsp_ipc_irq_thread;
+	if (sdev->pdata->ipc_type == SOF_IPC) {
+		/* doorbell */
+		sof_apl_ops.irq_thread	= hda_dsp_ipc_irq_thread;
 
-	/* ipc */
-	sof_apl_ops.send_msg	= hda_dsp_ipc_send_msg;
+		/* ipc */
+		sof_apl_ops.send_msg	= hda_dsp_ipc_send_msg;
+	}
+
+	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
+		sof_apl_ops.irq_thread	= hda_dsp_ipc4_irq_thread;
+
+		/* ipc */
+		sof_apl_ops.send_msg	= hda_dsp_ipc4_send_msg;
+	}
 
 	/* set DAI driver ops */
 	hda_set_dai_drv_ops(sdev, &sof_apl_ops);
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 98c4e4f61e7c..7a22d7e4a46c 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -15,6 +15,7 @@
  * Hardware interface for audio DSP on Cannonlake.
  */
 
+#include <sound/sof/ipc4/header.h>
 #include "../ops.h"
 #include "hda.h"
 #include "hda-ipc.h"
@@ -29,6 +30,68 @@ static const struct snd_sof_debugfs_map cnl_dsp_debugfs[] = {
 static void cnl_ipc_host_done(struct snd_sof_dev *sdev);
 static void cnl_ipc_dsp_done(struct snd_sof_dev *sdev);
 
+irqreturn_t cnl_ipc4_irq_thread(int irq, void *context)
+{
+	struct sof_ipc4_msg notification_data = {{ 0 }};
+	struct snd_sof_dev *sdev = context;
+	bool ipc_irq = false;
+	u32 hipcida, hipctdr;
+
+	hipcida = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDA);
+	if (hipcida & CNL_DSP_REG_HIPCIDA_DONE) {
+		/* DSP received the message */
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+					CNL_DSP_REG_HIPCCTL,
+					CNL_DSP_REG_HIPCCTL_DONE, 0);
+		cnl_ipc_dsp_done(sdev);
+
+		ipc_irq = true;
+	}
+
+	hipctdr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCTDR);
+	if (hipctdr & CNL_DSP_REG_HIPCTDR_BUSY) {
+		/* Message from DSP (reply or notification) */
+		u32 hipctdd = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+					       CNL_DSP_REG_HIPCTDD);
+		u32 primary = hipctdr & CNL_DSP_REG_HIPCTDR_MSG_MASK;
+		u32 extension = hipctdd & CNL_DSP_REG_HIPCTDD_MSG_MASK;
+
+		if (primary & SOF_IPC4_MSG_DIR_MASK) {
+			/* Reply received */
+			struct sof_ipc4_msg *data = sdev->ipc->msg.reply_data;
+
+			data->primary = primary;
+			data->extension = extension;
+
+			spin_lock_irq(&sdev->ipc_lock);
+
+			snd_sof_ipc_get_reply(sdev);
+			snd_sof_ipc_reply(sdev, data->primary);
+
+			spin_unlock_irq(&sdev->ipc_lock);
+		} else {
+			/* Notification received */
+			notification_data.primary = primary;
+			notification_data.extension = extension;
+
+			sdev->ipc->msg.rx_data = &notification_data;
+			snd_sof_ipc_msgs_rx(sdev);
+			sdev->ipc->msg.rx_data = NULL;
+		}
+
+		/* Let DSP know that we have finished processing the message */
+		cnl_ipc_host_done(sdev);
+
+		ipc_irq = true;
+	}
+
+	if (!ipc_irq)
+		/* This interrupt is not shared so no need to return IRQ_NONE. */
+		dev_dbg_ratelimited(sdev->dev, "nothing to do in IPC IRQ thread\n");
+
+	return IRQ_HANDLED;
+}
+
 irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
@@ -176,6 +239,22 @@ static bool cnl_compact_ipc_compress(struct snd_sof_ipc_msg *msg,
 	return false;
 }
 
+int cnl_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
+{
+	struct sof_ipc4_msg *msg_data = msg->msg_data;
+
+	/* send the message via mailbox */
+	if (msg_data->data_size)
+		sof_mailbox_write(sdev, sdev->host_box.offset, msg_data->data_ptr,
+				  msg_data->data_size);
+
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDD, msg_data->extension);
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDR,
+			  msg_data->primary | CNL_DSP_REG_HIPCIDR_BUSY);
+
+	return 0;
+}
+
 int cnl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 {
 	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
@@ -255,11 +334,21 @@ int sof_cnl_ops_init(struct snd_sof_dev *sdev)
 	/* probe/remove/shutdown */
 	sof_cnl_ops.shutdown	= hda_dsp_shutdown;
 
-	/* doorbell */
-	sof_cnl_ops.irq_thread	= cnl_ipc_irq_thread;
-
 	/* ipc */
-	sof_cnl_ops.send_msg	= cnl_ipc_send_msg;
+	if (sdev->pdata->ipc_type == SOF_IPC) {
+		/* doorbell */
+		sof_cnl_ops.irq_thread	= cnl_ipc_irq_thread;
+
+		/* ipc */
+		sof_cnl_ops.send_msg	= cnl_ipc_send_msg;
+	}
+
+	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
+		sof_cnl_ops.irq_thread	= cnl_ipc4_irq_thread;
+
+		/* ipc */
+		sof_cnl_ops.send_msg	= cnl_ipc4_send_msg;
+	}
 
 	/* set DAI driver ops */
 	hda_set_dai_drv_ops(sdev, &sof_cnl_ops);
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 0395638c43ae..f08011249955 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -15,6 +15,7 @@
  * Hardware interface for generic Intel audio DSP HDA IP
  */
 
+#include <sound/sof/ipc4/header.h>
 #include "../ops.h"
 #include "hda.h"
 
@@ -65,6 +66,22 @@ int hda_dsp_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 	return 0;
 }
 
+int hda_dsp_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
+{
+	struct sof_ipc4_msg *msg_data = msg->msg_data;
+
+	/* send the message via mailbox */
+	if (msg_data->data_size)
+		sof_mailbox_write(sdev, sdev->host_box.offset, msg_data->data_ptr,
+				  msg_data->data_size);
+
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCIE, msg_data->extension);
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCI,
+			  msg_data->primary | HDA_DSP_REG_HIPCI_BUSY);
+
+	return 0;
+}
+
 void hda_dsp_ipc_get_reply(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_ipc_msg *msg = sdev->msg;
@@ -100,6 +117,71 @@ void hda_dsp_ipc_get_reply(struct snd_sof_dev *sdev)
 	}
 }
 
+irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context)
+{
+	struct sof_ipc4_msg notification_data = {{ 0 }};
+	struct snd_sof_dev *sdev = context;
+	bool ipc_irq = false;
+	u32 hipcie, hipct;
+
+	hipcie = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCIE);
+	if (hipcie & HDA_DSP_REG_HIPCIE_DONE) {
+		/* DSP received the message */
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCCTL,
+					HDA_DSP_REG_HIPCCTL_DONE, 0);
+		hda_dsp_ipc_dsp_done(sdev);
+
+		ipc_irq = true;
+	}
+
+	hipct = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCT);
+	if (hipct & HDA_DSP_REG_HIPCT_BUSY) {
+		/* Message from DSP (reply or notification) */
+		u32 hipcte = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+					      HDA_DSP_REG_HIPCTE);
+		u32 primary = hipct & HDA_DSP_REG_HIPCT_MSG_MASK;
+		u32 extension = hipcte & HDA_DSP_REG_HIPCTE_MSG_MASK;
+
+		/* mask BUSY interrupt */
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCCTL,
+					HDA_DSP_REG_HIPCCTL_BUSY, 0);
+
+		if (primary & SOF_IPC4_MSG_DIR_MASK) {
+			/* Reply received */
+			struct sof_ipc4_msg *data = sdev->ipc->msg.reply_data;
+
+			data->primary = primary;
+			data->extension = extension;
+
+			spin_lock_irq(&sdev->ipc_lock);
+
+			snd_sof_ipc_get_reply(sdev);
+			snd_sof_ipc_reply(sdev, data->primary);
+
+			spin_unlock_irq(&sdev->ipc_lock);
+		} else {
+			/* Notification received */
+
+			notification_data.primary = primary;
+			notification_data.extension = extension;
+			sdev->ipc->msg.rx_data = &notification_data;
+			snd_sof_ipc_msgs_rx(sdev);
+			sdev->ipc->msg.rx_data = NULL;
+		}
+
+		/* Let DSP know that we have finished processing the message */
+		hda_dsp_ipc_host_done(sdev);
+
+		ipc_irq = true;
+	}
+
+	if (!ipc_irq)
+		/* This interrupt is not shared so no need to return IRQ_NONE. */
+		dev_dbg_ratelimited(sdev->dev, "nothing to do in IPC IRQ thread\n");
+
+	return IRQ_HANDLED;
+}
+
 /* IPC handler thread */
 irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 {
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index e52cade75617..535791c7d187 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -764,4 +764,10 @@ extern int sof_hda_position_quirk;
 
 void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops);
 
+/* IPC4 */
+irqreturn_t cnl_ipc4_irq_thread(int irq, void *context);
+int cnl_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
+irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context);
+int hda_dsp_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
+
 #endif
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index ed76f736afb4..c93526591a91 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -70,11 +70,21 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 	/* probe/remove/shutdown */
 	sof_tgl_ops.shutdown	= hda_dsp_shutdown;
 
-	/* doorbell */
-	sof_tgl_ops.irq_thread	= cnl_ipc_irq_thread;
+	if (sdev->pdata->ipc_type == SOF_IPC) {
+		/* doorbell */
+		sof_tgl_ops.irq_thread	= cnl_ipc_irq_thread;
 
-	/* ipc */
-	sof_tgl_ops.send_msg	= cnl_ipc_send_msg;
+		/* ipc */
+		sof_tgl_ops.send_msg	= cnl_ipc_send_msg;
+	}
+
+	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
+		/* doorbell */
+		sof_tgl_ops.irq_thread	= cnl_ipc4_irq_thread;
+
+		/* ipc */
+		sof_tgl_ops.send_msg	= cnl_ipc4_send_msg;
+	}
 
 	/* set DAI driver ops */
 	hda_set_dai_drv_ops(sdev, &sof_tgl_ops);
-- 
2.25.1

