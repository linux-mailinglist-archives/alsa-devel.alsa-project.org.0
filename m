Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3401593FD
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 16:54:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D94D8165D;
	Tue, 11 Feb 2020 16:54:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D94D8165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581436496;
	bh=CCNMwGixwnXz0RFp7j30gCStSb6vjuPXvFakhdNKdk8=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TBFt/to3K9QdeXrUKM08K9l4b6A7lu3jjbZhwu0hMgOgj9S9h4eZt4RgBDIvpQ4h4
	 jHwaYLnljojgpnvnOAxDQe/K0VULkuyhYsxgyGizVOxK6/bKf6PdshEQFV83IVpywx
	 IFIPBM9qvkONTMl+Fp+hJ6PeX6UNnzkdf4E3G4SU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37589F802D2;
	Tue, 11 Feb 2020 16:48:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EE91F802C3; Tue, 11 Feb 2020 16:48:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C2E8EF80292
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:48:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2E8EF80292
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F9B51045;
 Tue, 11 Feb 2020 07:48:40 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 866AB3F68E;
 Tue, 11 Feb 2020 07:48:39 -0800 (PST)
Date: Tue, 11 Feb 2020 15:48:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20200129220726.31792-9-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200129220726.31792-9-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: cnl: Implement feature to
	support DSP D0i3 in S0" to the asoc tree
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

The patch

   ASoC: SOF: Intel: cnl: Implement feature to support DSP D0i3 in S0

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 63e51fd33fef04b634a0c32ae491ab16a19cb17c Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 29 Jan 2020 16:07:25 -0600
Subject: [PATCH] ASoC: SOF: Intel: cnl: Implement feature to support DSP D0i3
 in S0

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
Link: https://lore.kernel.org/r/20200129220726.31792-9-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
