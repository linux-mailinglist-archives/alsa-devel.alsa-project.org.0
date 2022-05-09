Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCCC51F743
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 10:51:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2ADC18D3;
	Mon,  9 May 2022 10:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2ADC18D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652086269;
	bh=xZtV5nbjDISRteSMT5pjAAgirv49avg7vuS4c5N9XOQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cDMRJ/Y/te3VUg4uA5+rjknxfRASJh4d3NhTu/n4mk7aQqjzC0EDCJ+PCgBF6sCST
	 oOLAp0m/aJXvxBaRAk+ndvigvAyhAWb5+q2qrX3l+BhOYPWDi1CChSNN9lywdZhbjB
	 atcyZwZqpwhd5XVzih7zsqgR2GoHS/6EJvwhrB9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10A75F80528;
	Mon,  9 May 2022 10:49:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0917DF80535; Mon,  9 May 2022 10:49:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43FFAF80528
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 10:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43FFAF80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OhPhhZa+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652086137; x=1683622137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xZtV5nbjDISRteSMT5pjAAgirv49avg7vuS4c5N9XOQ=;
 b=OhPhhZa+GX0jACLH3IrGh+2oFiQT2l8bezchWye42Lup6k/6oEyZ5Q0e
 e4b31YWCvbQF5qFRisoUCHFqMxXfxgvDP3wqjNO/i/cNloCT7BipgSYDz
 +NeT2VkP5BJ2AfbZ4evu2vwA4qpWK+i9fjiEMFs7u3agPwJi/RJuI0Awy
 7ESYoPIhNVzuA/ImSUHtxNHCz1jtZ57zTyPnY9KQ/P4rE7TC9Rm99tHqU
 T8pDfr5fchKwV3kQKL9V8Pja/TmxcARND4ot4HMhGm3YRYx6uX6pqZH/j
 80OClIkj1R0kJYe0Q116gK9bo+YQR7uEDCHZPCBiHAcvVnbZKWdhG6i9W Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="294208546"
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; d="scan'208";a="294208546"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 01:48:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; d="scan'208";a="738068314"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 09 May 2022 01:48:50 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 06/15] ASoC: Intel: avs: Coredump and recovery flow
Date: Mon,  9 May 2022 10:58:12 +0200
Message-Id: <20220509085821.3852259-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509085821.3852259-1-cezary.rojewski@intel.com>
References: <20220509085821.3852259-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

In rare occasions, under stress conditions or hardware malfunction, DSP
firmware may fail. Software is notified about such situation with
EXCEPTION_CAUGHT notification. IPC timeout is also counted as critical
device failure. More often than not, driver can recover from such
situations by performing full reset: killing and restarting ADSP.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig        |  1 +
 sound/soc/intel/avs/avs.h      |  4 ++
 sound/soc/intel/avs/ipc.c      | 97 +++++++++++++++++++++++++++++++++-
 sound/soc/intel/avs/messages.h |  5 ++
 4 files changed, 105 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 039b45a4a799..1aaf9bdf721c 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -219,6 +219,7 @@ config SND_SOC_INTEL_AVS
 	select SND_HDA_EXT_CORE
 	select SND_HDA_DSP_LOADER
 	select SND_INTEL_DSP_CONFIG
+	select WANT_DEV_COREDUMP
 	help
 	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
 	  capabilities. This includes Skylake, Kabylake, Amberlake and
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index e628f78d1864..9096f6c3d598 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -42,6 +42,7 @@ struct avs_dsp_ops {
 	int (* const load_basefw)(struct avs_dev *, struct firmware *);
 	int (* const load_lib)(struct avs_dev *, struct firmware *, u32);
 	int (* const transfer_mods)(struct avs_dev *, bool, struct avs_module_entry *, u32);
+	int (* const coredump)(struct avs_dev *, union avs_notify_msg *);
 };
 
 #define avs_dsp_op(adev, op, ...) \
@@ -164,12 +165,15 @@ struct avs_ipc {
 	struct avs_ipc_msg rx;
 	u32 default_timeout_ms;
 	bool ready;
+	atomic_t recovering;
 
 	bool rx_completed;
 	spinlock_t rx_lock;
 	struct mutex msg_mutex;
 	struct completion done_completion;
 	struct completion busy_completion;
+
+	struct work_struct recovery_work;
 };
 
 #define AVS_EIPC	EREMOTEIO
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 68aaf01edbf2..98cdc05071fb 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -14,6 +14,89 @@
 
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
+		dev_err(adev->dev, "dsp reboot failed: %d\n", ret);
+
+	pm_runtime_mark_last_busy(adev->dev);
+	pm_runtime_enable(adev->dev);
+	pm_request_autosuspend(adev->dev);
+
+	atomic_set(&adev->ipc->recovering, 0);
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
+	struct avs_ipc *ipc = adev->ipc;
+
+	/* Account for the double-exception case. */
+	ipc->ready = false;
+
+	if (!atomic_add_unless(&ipc->recovering, 1, 1)) {
+		dev_err(adev->dev, "dsp recovery is already in progress\n");
+		return;
+	}
+
+	dev_crit(adev->dev, "communication severed, rebooting dsp..\n");
+
+	/* Re-enabled on recovery completion. */
+	pm_runtime_disable(adev->dev);
+
+	/* Process received notification. */
+	avs_dsp_op(adev, coredump, msg);
+
+	schedule_work(&ipc->recovery_work);
+}
+
 static void avs_dsp_receive_rx(struct avs_dev *adev, u64 header)
 {
 	struct avs_ipc *ipc = adev->ipc;
@@ -57,6 +140,9 @@ static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
 		data_size = sizeof(struct avs_notify_res_data);
 		break;
 
+	case AVS_NOTIFY_EXCEPTION_CAUGHT:
+		break;
+
 	case AVS_NOTIFY_MODULE_EVENT:
 		/* To know the total payload size, header needs to be read first. */
 		memcpy_fromio(&mod_data, avs_uplink_addr(adev), sizeof(mod_data));
@@ -84,6 +170,10 @@ static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
 		complete(&adev->fw_ready);
 		break;
 
+	case AVS_NOTIFY_EXCEPTION_CAUGHT:
+		avs_dsp_exception_caught(adev, &msg);
+		break;
+
 	default:
 		break;
 	}
@@ -278,9 +368,10 @@ static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request
 	ret = avs_ipc_wait_busy_completion(ipc, timeout);
 	if (ret) {
 		if (ret == -ETIMEDOUT) {
-			dev_crit(adev->dev, "communication severed: %d, rebooting dsp..\n", ret);
+			union avs_notify_msg msg = AVS_NOTIFICATION(EXCEPTION_CAUGHT);
 
-			avs_ipc_block(ipc);
+			/* Same treatment as on exception, just stack_dump=0. */
+			avs_dsp_exception_caught(adev, &msg);
 		}
 		goto exit;
 	}
@@ -368,6 +459,7 @@ int avs_ipc_init(struct avs_ipc *ipc, struct device *dev)
 	ipc->dev = dev;
 	ipc->ready = false;
 	ipc->default_timeout_ms = AVS_IPC_TIMEOUT_MS;
+	INIT_WORK(&ipc->recovery_work, avs_dsp_recovery_work);
 	init_completion(&ipc->done_completion);
 	init_completion(&ipc->busy_completion);
 	spin_lock_init(&ipc->rx_lock);
@@ -379,4 +471,5 @@ int avs_ipc_init(struct avs_ipc *ipc, struct device *dev)
 void avs_ipc_block(struct avs_ipc *ipc)
 {
 	ipc->ready = false;
+	cancel_work_sync(&ipc->recovery_work);
 }
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 0395dd7150eb..94875a153124 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -187,6 +187,7 @@ enum avs_notify_msg_type {
 	AVS_NOTIFY_PHRASE_DETECTED = 4,
 	AVS_NOTIFY_RESOURCE_EVENT = 5,
 	AVS_NOTIFY_FW_READY = 8,
+	AVS_NOTIFY_EXCEPTION_CAUGHT = 10,
 	AVS_NOTIFY_MODULE_EVENT = 12,
 };
 
@@ -205,6 +206,10 @@ union avs_notify_msg {
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

