Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C443014D2DF
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 23:14:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65ED91664;
	Wed, 29 Jan 2020 23:13:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65ED91664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580336066;
	bh=Btv9e+Kg3atyNevmAZobk2loQLWOI1yhK9D/SD3QhD8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T1YXxiMVMu+pjEkB7fTfMzHSj9Gf7ceAXJDSRDfLep819kqOZxUfGhTrAyJ9yk2kR
	 YS8FsKCyMq3F6EZsYEnU4ay0UHIf8E2JECXvRfYIUPwdxxxb5cmVzoJsa29khzoRfh
	 4GIm7eFaPVcgg5OozHOKiAYGjMsnwoEM2/PGuaeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C94EF802D2;
	Wed, 29 Jan 2020 23:08:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C9D1F8028E; Wed, 29 Jan 2020 23:08:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C940F80218
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 23:07:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C940F80218
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 14:07:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,379,1574150400"; d="scan'208";a="402122397"
Received: from kjhudson-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.70.93])
 by orsmga005.jf.intel.com with ESMTP; 29 Jan 2020 14:07:51 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 29 Jan 2020 16:07:25 -0600
Message-Id: <20200129220726.31792-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
References: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 8/9] ASoC: SOF: Intel: cnl: Implement feature
	to support DSP D0i3 in S0
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

This patch implements support for DSP D0i3 when the system
is in S0. The basic idea is to schedule a delayed work after
every successful IPC TX that checks if there are only
D0I3-compatible streams active and if so transition
the DSP to D0I3.

With the introduction of DSP D0I3 in S0, we need to
ensure that the DSP is in D0I0 before sending any new
IPCs. The exception for this would be the
compact IPCs that are used to set the DSP in
D0I3/D0I0 states.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/cnl.c     | 37 +++++++++++++++++++++++++++------
 sound/soc/sof/intel/hda-dsp.c | 39 +++++++++++++++++++++++++++++++++--
 sound/soc/sof/intel/hda.c     |  5 +++++
 sound/soc/sof/intel/hda.h     | 11 ++++++++++
 sound/soc/sof/ipc.c           | 29 ++++++++++++++++++++++++--
 sound/soc/sof/sof-priv.h      |  3 +++
 6 files changed, 114 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 9e2d8afe0535..8a59fec72919 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -171,23 +171,48 @@ static bool cnl_compact_ipc_compress(struct snd_sof_ipc_msg *msg,
 static int cnl_ipc_send_msg(struct snd_sof_dev *sdev,
 			    struct snd_sof_ipc_msg *msg)
 {
+	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
+	struct sof_ipc_cmd_hdr *hdr;
 	u32 dr = 0;
 	u32 dd = 0;
 
+	/*
+	 * Currently the only compact IPC supported is the PM_GATE
+	 * IPC which is used for transitioning the DSP between the
+	 * D0I0 and D0I3 states. And these are sent only during the
+	 * set_power_state() op. Therefore, there will never be a case
+	 * that a compact IPC results in the DSP exiting D0I3 without
+	 * the host and FW being in sync.
+	 */
 	if (cnl_compact_ipc_compress(msg, &dr, &dd)) {
 		/* send the message via IPC registers */
 		snd_sof_dsp_write(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDD,
 				  dd);
 		snd_sof_dsp_write(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDR,
 				  CNL_DSP_REG_HIPCIDR_BUSY | dr);
-	} else {
-		/* send the message via mailbox */
-		sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
-				  msg->msg_size);
-		snd_sof_dsp_write(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDR,
-				  CNL_DSP_REG_HIPCIDR_BUSY);
+		return 0;
 	}
 
+	/* send the message via mailbox */
+	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
+			  msg->msg_size);
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDR,
+			  CNL_DSP_REG_HIPCIDR_BUSY);
+
+	hdr = msg->msg_data;
+
+	/*
+	 * Use mod_delayed_work() to schedule the delayed work
+	 * to avoid scheduling multiple workqueue items when
+	 * IPCs are sent at a high-rate. mod_delayed_work()
+	 * modifies the timer if the work is pending.
+	 * Also, a new delayed work should not be queued after the
+	 * the CTX_SAVE IPC, which is sent before the DSP enters D3.
+	 */
+	if (hdr->cmd != (SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CTX_SAVE))
+		mod_delayed_work(system_wq, &hdev->d0i3_work,
+				 msecs_to_jiffies(SOF_HDA_D0I3_WORK_DELAY_MS));
+
 	return 0;
 }
 
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 7b8425330ae0..ee604be715b9 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -17,6 +17,7 @@
 
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
+#include "../sof-audio.h"
 #include "../ops.h"
 #include "hda.h"
 #include "hda-ipc.h"
@@ -334,8 +335,9 @@ static int hda_dsp_send_pm_gate_ipc(struct snd_sof_dev *sdev, u32 flags)
 	pm_gate.flags = flags;
 
 	/* send pm_gate ipc to dsp */
-	return sof_ipc_tx_message(sdev->ipc, pm_gate.hdr.cmd, &pm_gate,
-				  sizeof(pm_gate), &reply, sizeof(reply));
+	return sof_ipc_tx_message_no_pm(sdev->ipc, pm_gate.hdr.cmd,
+					&pm_gate, sizeof(pm_gate), &reply,
+					sizeof(reply));
 }
 
 static int hda_dsp_update_d0i3c_register(struct snd_sof_dev *sdev, u8 value)
@@ -706,6 +708,9 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 	};
 	int ret;
 
+	/* cancel any attempt for DSP D0I3 */
+	cancel_delayed_work_sync(&hda->d0i3_work);
+
 	if (target_state == SOF_DSP_PM_D0) {
 		/* Set DSP power state */
 		ret = hda_dsp_set_power_state(sdev, &target_dsp_state);
@@ -780,3 +785,33 @@ int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 #endif
 	return 0;
 }
+
+void hda_dsp_d0i3_work(struct work_struct *work)
+{
+	struct sof_intel_hda_dev *hdev = container_of(work,
+						      struct sof_intel_hda_dev,
+						      d0i3_work.work);
+	struct hdac_bus *bus = &hdev->hbus.core;
+	struct snd_sof_dev *sdev = dev_get_drvdata(bus->dev);
+	struct sof_dsp_power_state target_state;
+	int ret;
+
+	target_state.state = SOF_DSP_PM_D0;
+
+	/* DSP can enter D0I3 iff only D0I3-compatible streams are active */
+	if (snd_sof_dsp_only_d0i3_compatible_stream_active(sdev))
+		target_state.substate = SOF_HDA_DSP_PM_D0I3;
+	else
+		target_state.substate = SOF_HDA_DSP_PM_D0I0;
+
+	/* remain in D0I0 */
+	if (target_state.substate == SOF_HDA_DSP_PM_D0I0)
+		return;
+
+	/* This can fail but error cannot be propagated */
+	ret = hda_dsp_set_power_state(sdev, &target_state);
+	if (ret < 0)
+		dev_err_ratelimited(sdev->dev,
+				    "error: failed to set DSP state %d substate %d\n",
+				    target_state.state, target_state.substate);
+}
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 65b86dd044f1..2b8754a76584 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -598,6 +598,8 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	/* set default mailbox offset for FW ready message */
 	sdev->dsp_box.offset = HDA_DSP_MBOX_UPLINK_OFFSET;
 
+	INIT_DELAYED_WORK(&hdev->d0i3_work, hda_dsp_d0i3_work);
+
 	return 0;
 
 free_ipc_irq:
@@ -622,6 +624,9 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	const struct sof_intel_dsp_desc *chip = hda->desc;
 
+	/* cancel any attempt for DSP D0I3 */
+	cancel_delayed_work_sync(&hda->d0i3_work);
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	/* codec removal, invoke bus_device_remove */
 	snd_hdac_ext_bus_device_remove(bus);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 02c2a7eadb1b..a46b66437a3d 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -392,6 +392,13 @@ struct sof_intel_dsp_bdl {
 #define SOF_HDA_PLAYBACK		0
 #define SOF_HDA_CAPTURE			1
 
+/*
+ * Time in ms for opportunistic D0I3 entry delay.
+ * This has been deliberately chosen to be long to avoid race conditions.
+ * Could be optimized in future.
+ */
+#define SOF_HDA_D0I3_WORK_DELAY_MS	5000
+
 /* HDA DSP D0 substate */
 enum sof_hda_D0_substate {
 	SOF_HDA_DSP_PM_D0I0,	/* default D0 substate */
@@ -420,6 +427,9 @@ struct sof_intel_hda_dev {
 
 	/* DMIC device */
 	struct platform_device *dmic_dev;
+
+	/* delayed work to enter D0I3 opportunistically */
+	struct delayed_work d0i3_work;
 };
 
 static inline struct hdac_bus *sof_to_bus(struct snd_sof_dev *s)
@@ -487,6 +497,7 @@ void hda_dsp_dump_skl(struct snd_sof_dev *sdev, u32 flags);
 void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags);
 void hda_ipc_dump(struct snd_sof_dev *sdev);
 void hda_ipc_irq_dump(struct snd_sof_dev *sdev);
+void hda_dsp_d0i3_work(struct work_struct *work);
 
 /*
  * DSP PCM Operations.
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index b63fc529b456..22d296f95761 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -268,7 +268,6 @@ static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
 	spin_unlock_irq(&sdev->ipc_lock);
 
 	if (ret < 0) {
-		/* So far IPC TX never fails, consider making the above void */
 		dev_err_ratelimited(sdev->dev,
 				    "error: ipc tx failed with error %d\n",
 				    ret);
@@ -288,6 +287,32 @@ static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
 int sof_ipc_tx_message(struct snd_sof_ipc *ipc, u32 header,
 		       void *msg_data, size_t msg_bytes, void *reply_data,
 		       size_t reply_bytes)
+{
+	const struct sof_dsp_power_state target_state = {
+		.state = SOF_DSP_PM_D0,
+	};
+	int ret;
+
+	/* ensure the DSP is in D0 before sending a new IPC */
+	ret = snd_sof_dsp_set_power_state(ipc->sdev, &target_state);
+	if (ret < 0) {
+		dev_err(ipc->sdev->dev, "error: resuming DSP %d\n", ret);
+		return ret;
+	}
+
+	return sof_ipc_tx_message_no_pm(ipc, header, msg_data, msg_bytes,
+					reply_data, reply_bytes);
+}
+EXPORT_SYMBOL(sof_ipc_tx_message);
+
+/*
+ * send IPC message from host to DSP without modifying the DSP state.
+ * This will be used for IPC's that can be handled by the DSP
+ * even in a low-power D0 substate.
+ */
+int sof_ipc_tx_message_no_pm(struct snd_sof_ipc *ipc, u32 header,
+			     void *msg_data, size_t msg_bytes,
+			     void *reply_data, size_t reply_bytes)
 {
 	int ret;
 
@@ -305,7 +330,7 @@ int sof_ipc_tx_message(struct snd_sof_ipc *ipc, u32 header,
 
 	return ret;
 }
-EXPORT_SYMBOL(sof_ipc_tx_message);
+EXPORT_SYMBOL(sof_ipc_tx_message_no_pm);
 
 /* handle reply message from DSP */
 int snd_sof_ipc_reply(struct snd_sof_dev *sdev, u32 msg_id)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index ef33aaadbc31..00084471d0de 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -470,6 +470,9 @@ int snd_sof_ipc_valid(struct snd_sof_dev *sdev);
 int sof_ipc_tx_message(struct snd_sof_ipc *ipc, u32 header,
 		       void *msg_data, size_t msg_bytes, void *reply_data,
 		       size_t reply_bytes);
+int sof_ipc_tx_message_no_pm(struct snd_sof_ipc *ipc, u32 header,
+			     void *msg_data, size_t msg_bytes,
+			     void *reply_data, size_t reply_bytes);
 
 /*
  * Trace/debug
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
