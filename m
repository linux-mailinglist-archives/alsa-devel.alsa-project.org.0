Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A560946D210
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:22:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 492392694;
	Wed,  8 Dec 2021 12:21:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 492392694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962555;
	bh=COzCVz3dM6GMLmmpEmj0iYNBEz9yXRcNSy9+Tu+aSNI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G2MqSxYQneysj//PjJaNs6gJVtbKcc7wDb3Cfmpqqkcb5AZ4u2vrWAJTnt5VIUYNh
	 Yqt2wOznklRe650/BKCyC48xsvRa0Qqd8rQjGE4jiiAkrd71XM4aqrkroGvZlgKTbE
	 RBB21a1VKdtURjtRRNrYYI7CUJIxK56SOLkjE+yk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91566F80608;
	Wed,  8 Dec 2021 12:12:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E479AF80605; Wed,  8 Dec 2021 12:12:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2FCEF805FC
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:12:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2FCEF805FC
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236548478"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="236548478"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:12:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600494"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:12:30 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 29/37] ASoC: Intel: avs: Coredump and recovery flow
Date: Wed,  8 Dec 2021 12:12:53 +0100
Message-Id: <20211208111301.1817725-30-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208111301.1817725-1-cezary.rojewski@intel.com>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

In rare occassions, under stress conditions or hardware malfunction, DSP
firmware may fail. Software is notified about such situation with
EXCEPTION_CAUGHT notification. IPC timeout is also counted as critical
device failure. More often than not, driver can recover from such
situations by performing full reset: killing and restarting ADSP.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig        |  1 +
 sound/soc/intel/avs/avs.h      |  3 ++
 sound/soc/intel/avs/ipc.c      | 87 ++++++++++++++++++++++++++++++++--
 sound/soc/intel/avs/messages.h |  5 ++
 4 files changed, 93 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index b01c492d3514..8c059e2a5a36 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -220,6 +220,7 @@ config SND_SOC_INTEL_AVS
 	select SND_HDA_EXT_CORE
 	select SND_HDA_DSP_LOADER
 	select SND_INTEL_NHLT
+	select WANT_DEV_COREDUMP
 	help
 	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
 	  capabilities. This includes Skylake, Kabylake, Amberlake and
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 74194d8c04fe..4562f187939d 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -33,6 +33,7 @@ struct avs_dsp_ops {
 	int (* const load_lib)(struct avs_dev *, struct firmware *, u32);
 	int (* const transfer_mods)(struct avs_dev *, bool,
 				    struct avs_module_entry *, u32);
+	int (* const coredump)(struct avs_dev *, union avs_notify_msg *);
 };
 
 #define avs_dsp_op(adev, op, ...) \
@@ -147,6 +148,8 @@ struct avs_ipc {
 	struct mutex msg_mutex;
 	struct completion done_completion;
 	struct completion busy_completion;
+
+	struct work_struct recovery_work;
 };
 
 #define AVS_EIPC	EREMOTEIO
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index c461f7db3683..a8d2323e07a7 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -14,6 +14,78 @@
 
 #define AVS_IPC_TIMEOUT_MS	300
 
+static void avs_dsp_recovery(struct avs_dev *adev)
+{
+	struct avs_soc_component *acomp;
+	unsigned int core_mask;
+	int ret;
+
+	mutex_lock(&adev->comp_list_mutex);
+	/* disconnect all running streams */
+	list_for_each_entry(acomp, &adev->comp_list, node) {
+		struct snd_soc_pcm_runtime *rtd;
+		struct snd_soc_card *card;
+
+		card = acomp->base.card;
+		if (!card)
+			continue;
+
+		for_each_card_rtds(card, rtd) {
+			struct snd_pcm *pcm;
+			int dir;
+
+			pcm = rtd->pcm;
+			if (!pcm || rtd->dai_link->no_pcm)
+				continue;
+
+			for_each_pcm_streams(dir) {
+				struct snd_pcm_substream *substream;
+
+				substream = pcm->streams[dir].substream;
+				if (!substream || !substream->runtime)
+					continue;
+
+				snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
+			}
+		}
+	}
+	mutex_unlock(&adev->comp_list_mutex);
+
+	/* forcibly shutdown all cores */
+	core_mask = GENMASK(adev->hw_cfg.dsp_cores - 1, 0);
+	avs_dsp_core_disable(adev, core_mask);
+
+	/* attempt dsp reboot */
+	ret = avs_dsp_boot_firmware(adev, true);
+	if (ret < 0)
+		dev_err(adev->dev, "firmware reboot failed: %d\n", ret);
+
+	pm_runtime_mark_last_busy(adev->dev);
+	pm_runtime_enable(adev->dev);
+	pm_request_autosuspend(adev->dev);
+}
+
+static void avs_dsp_recovery_work(struct work_struct *work)
+{
+	struct avs_ipc *ipc = container_of(work, struct avs_ipc, recovery_work);
+
+	avs_dsp_recovery(to_avs_dev(ipc->dev));
+}
+
+static void avs_dsp_exception_caught(struct avs_dev *adev, union avs_notify_msg *msg)
+{
+	dev_crit(adev->dev, "communication severed, rebooting dsp..\n");
+
+	/* Re-enabled on recovery completion. */
+	avs_ipc_block(adev->ipc);
+	pm_runtime_disable(adev->dev);
+
+	/* Process received notification. */
+	avs_dsp_op(adev, coredump, msg);
+
+	schedule_work(&adev->ipc->recovery_work);
+}
+
 static void avs_dsp_receive_rx(struct avs_dev *adev, u64 header)
 {
 	struct avs_ipc *ipc = adev->ipc;
@@ -51,6 +123,9 @@ static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
 		data_size = sizeof(struct avs_notify_res_data);
 		break;
 
+	case AVS_NOTIFY_EXCEPTION_CAUGHT:
+		break;
+
 	case AVS_NOTIFY_MODULE_EVENT:
 		memcpy_fromio(&mod_data, avs_uplink_addr(adev), sizeof(mod_data));
 		data_size = sizeof(mod_data) + mod_data.data_size;
@@ -78,6 +153,10 @@ static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
 		complete(&adev->fw_ready);
 		break;
 
+	case AVS_NOTIFY_EXCEPTION_CAUGHT:
+		avs_dsp_exception_caught(adev, &msg);
+		break;
+
 	default:
 		break;
 	}
@@ -264,10 +343,10 @@ static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request
 	ret = avs_ipc_wait_busy_completion(ipc, timeout);
 	if (ret) {
 		if (ret == -ETIMEDOUT) {
-			dev_crit(adev->dev, "communication severed: %d, rebooting dsp..\n",
-				 ret);
+			union avs_notify_msg msg = AVS_NOTIFICATION(EXCEPTION_CAUGHT);
 
-			avs_ipc_block(ipc);
+			/* Same treatment as on exception, just stack_dump=0. */
+			avs_dsp_exception_caught(adev, &msg);
 		}
 		goto exit;
 	}
@@ -389,6 +468,7 @@ int avs_ipc_init(struct avs_ipc *ipc, struct device *dev)
 	ipc->dev = dev;
 	ipc->ready = false;
 	ipc->default_timeout_ms = AVS_IPC_TIMEOUT_MS;
+	INIT_WORK(&ipc->recovery_work, avs_dsp_recovery_work);
 	init_completion(&ipc->done_completion);
 	init_completion(&ipc->busy_completion);
 	spin_lock_init(&ipc->rx_lock);
@@ -400,4 +480,5 @@ int avs_ipc_init(struct avs_ipc *ipc, struct device *dev)
 void avs_ipc_block(struct avs_ipc *ipc)
 {
 	ipc->ready = false;
+	cancel_work_sync(&ipc->recovery_work);
 }
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index a79aadba161d..f289c3498096 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -192,6 +192,7 @@ enum avs_notify_msg_type {
 	AVS_NOTIFY_PHRASE_DETECTED = 4,
 	AVS_NOTIFY_RESOURCE_EVENT = 5,
 	AVS_NOTIFY_FW_READY = 8,
+	AVS_NOTIFY_EXCEPTION_CAUGHT = 10,
 	AVS_NOTIFY_MODULE_EVENT = 12,
 };
 
@@ -210,6 +211,10 @@ union avs_notify_msg {
 		};
 		union {
 			u32 val;
+			struct {
+				u32 core_id:2;
+				u32 stack_dump_size:16;
+			} coredump;
 		} ext;
 	};
 } __packed;
-- 
2.25.1

