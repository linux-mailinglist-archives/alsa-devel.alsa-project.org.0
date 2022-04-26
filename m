Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E6751051C
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:18:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4903118BE;
	Tue, 26 Apr 2022 19:17:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4903118BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650993491;
	bh=/f7kaOiKHzY8Ak/Ul+FSHazPFicrvkKUmLI98jsdG1A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=md8RFUlGd8YvOmt3BLBFmI7wK0hn3xDlYcHcDdRzYfZSVlSB9mcH7PK9hIzLZRvWY
	 fQJb0nh1A/drKdcmyhb6lFpwNSTDXwXdWllXQHEeFg9u6YwvBmQM6a8p1yZRvtkUAB
	 9hrZCpht/fR9c2sytwEgQi2Sk+Bguy74PpQUOJLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22102F80552;
	Tue, 26 Apr 2022 19:15:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 851BAF80542; Tue, 26 Apr 2022 19:15:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA0D4F8052F
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA0D4F8052F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fkMIbL15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650993312; x=1682529312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/f7kaOiKHzY8Ak/Ul+FSHazPFicrvkKUmLI98jsdG1A=;
 b=fkMIbL15/4dc8Bhpz0UnpWUuWcV0XyCERr9lqz8fTNzdirYC7MhOyYRn
 Vg1gX78LWTtTwm7bvmfl2Olx9SWTFb+6oHMjCnvGklsevQcgBYFEZJNDI
 xkFT/oJvWDrXVAwcHKLNM91XL8gX9H2E2csUw/D/Fz0suNa4QeYnHu6ep
 Brj4o6UeUhyk7O+QLteTABWNhiXiKAnIn0ElfrSGVypOfwKphcR4OIgpF
 lbS5V5Rgm3ljfTxK0MKgcNMJyjqPpDvI383UlF1K+eP31/y6yS6g0y4gE
 zd7JrLR89bVDBmCi7bGGiMqPmmCSVOGp4LJx/K2BFKJPB6PLzpVmtGlB2 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="264507974"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="264507974"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:15:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="650305521"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Apr 2022 10:14:52 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 06/14] ASoC: Intel: avs: Coredump and recovery flow
Date: Tue, 26 Apr 2022 19:23:38 +0200
Message-Id: <20220426172346.3508411-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426172346.3508411-1-cezary.rojewski@intel.com>
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
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

In rare occassions, under stress conditions or hardware malfunction, DSP
firmware may fail. Software is notified about such situation with
EXCEPTION_CAUGHT notification. IPC timeout is also counted as critical
device failure. More often than not, driver can recover from such
situations by performing full reset: killing and restarting ADSP.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig        |  1 +
 sound/soc/intel/avs/avs.h      |  4 ++
 sound/soc/intel/avs/ipc.c      | 95 +++++++++++++++++++++++++++++++++-
 sound/soc/intel/avs/messages.h |  5 ++
 4 files changed, 103 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index c364ddf22267..05ad6bdecfc5 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -218,6 +218,7 @@ config SND_SOC_INTEL_AVS
 	select SND_HDA_EXT_CORE
 	select SND_HDA_DSP_LOADER
 	select SND_INTEL_NHLT
+	select WANT_DEV_COREDUMP
 	help
 	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
 	  capabilities. This includes Skylake, Kabylake, Amberlake and
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index e628f78d1864..02c2aa1bcd5c 100644
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
+	bool recovering;
 
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
index 68aaf01edbf2..84cb411c82fa 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -14,6 +14,87 @@
 
 #define AVS_IPC_TIMEOUT_MS	300
 
+static void avs_dsp_recovery(struct avs_dev *adev)
+{
+	struct avs_soc_component *acomp;
+	unsigned int core_mask;
+	int ret;
+
+	if (adev->ipc->recovering)
+		return;
+	adev->ipc->recovering = true;
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
+	adev->ipc->recovering = false;
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
+	if (adev->ipc->recovering)
+		return;
+
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
@@ -57,6 +138,9 @@ static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
 		data_size = sizeof(struct avs_notify_res_data);
 		break;
 
+	case AVS_NOTIFY_EXCEPTION_CAUGHT:
+		break;
+
 	case AVS_NOTIFY_MODULE_EVENT:
 		/* To know the total payload size, header needs to be read first. */
 		memcpy_fromio(&mod_data, avs_uplink_addr(adev), sizeof(mod_data));
@@ -84,6 +168,10 @@ static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
 		complete(&adev->fw_ready);
 		break;
 
+	case AVS_NOTIFY_EXCEPTION_CAUGHT:
+		avs_dsp_exception_caught(adev, &msg);
+		break;
+
 	default:
 		break;
 	}
@@ -278,9 +366,10 @@ static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request
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
@@ -368,6 +457,7 @@ int avs_ipc_init(struct avs_ipc *ipc, struct device *dev)
 	ipc->dev = dev;
 	ipc->ready = false;
 	ipc->default_timeout_ms = AVS_IPC_TIMEOUT_MS;
+	INIT_WORK(&ipc->recovery_work, avs_dsp_recovery_work);
 	init_completion(&ipc->done_completion);
 	init_completion(&ipc->busy_completion);
 	spin_lock_init(&ipc->rx_lock);
@@ -379,4 +469,5 @@ int avs_ipc_init(struct avs_ipc *ipc, struct device *dev)
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

