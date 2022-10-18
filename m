Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52943602BE8
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:41:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 007D89D48;
	Tue, 18 Oct 2022 14:40:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 007D89D48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666096901;
	bh=Cj0vyCeT8hRFBYSIGfFgnpaekmuGw+CwRCb0zBS5rYQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VOokWeyaLABTX7367smR4FxZfEqgF6ySPpRzGFtLrO58WLvY22AiVLrDhP5MiL2EK
	 bCHBufk/f2tF9ea+HhGPNv3k6QKTmvduxWYvec9EmW4fKPT8NaZC/wLayOWz0B2tcM
	 dm+YljgosPnTtjStVbTBCyxWwfXjbOuckvTwwff0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77F62F80559;
	Tue, 18 Oct 2022 14:40:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF50DF804D0; Tue, 18 Oct 2022 14:40:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B85CF804D0
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B85CF804D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RraOyr5o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666096797; x=1697632797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cj0vyCeT8hRFBYSIGfFgnpaekmuGw+CwRCb0zBS5rYQ=;
 b=RraOyr5oI//1qjVZJD2Xk/lppnN5MQ8BrPsrjj++vsxJjjZ2SkdOF5Si
 50MUxDxnhNZYu9U5K8ktl2mAR8S8Dcjzn1pYh1ZM2lzgJYxsXN+ZSAIUX
 3EP9lcDdexNtl2W4COqVm2YDE70MeN4n5ELcjFtOrLpoKE4LSEc7KTJJ7
 2EeokKvH5HNGECewL+WHzYMFPhYRelYZkrWlM0mj65cMukK2ozwHXBxpW
 47w7u+IShSW/+pa4wNJnPSQlg9iXAQnc3crgySRHqTboS3Tcmg3AYePSw
 aV9u7lUu5/6fE//ck4++UIYChGQ+O8JOTaQNnKL2FcCkJcSdQau22GTJb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="304828567"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="304828567"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:39:54 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="717912779"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="717912779"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:39:51 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 3/4] ASoC: SOF: Intel: ipc4: Wait for channel to be free
 before sending a message
Date: Tue, 18 Oct 2022 15:40:07 +0300
Message-Id: <20221018124008.6846-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018124008.6846-1-peter.ujfalusi@linux.intel.com>
References: <20221018124008.6846-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, rander.wang@intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

Before attempting to send a message to the DSP we need to check if the
downstream BUSY flag has been cleared by the firmware to avoid lost IPC
messages by the firmware.

This is required by a firmware which only acks the received message after
it has sent a reply to the host.
With a bad luck, the host would send a message before the firmware gets to
the clearing the flag and thus losing a message.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/cnl.c     | 17 +++++++++++++++++
 sound/soc/sof/intel/hda-ipc.c | 17 +++++++++++++++++
 sound/soc/sof/intel/hda.c     | 11 +++++++++++
 sound/soc/sof/intel/hda.h     |  9 +++++++++
 sound/soc/sof/intel/mtl.c     | 17 +++++++++++++++++
 5 files changed, 71 insertions(+)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 2f2bcde42759..4bf233787757 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -37,6 +37,7 @@ irqreturn_t cnl_ipc4_irq_thread(int irq, void *context)
 {
 	struct sof_ipc4_msg notification_data = {{ 0 }};
 	struct snd_sof_dev *sdev = context;
+	bool ack_received = false;
 	bool ipc_irq = false;
 	u32 hipcida, hipctdr;
 
@@ -50,6 +51,7 @@ irqreturn_t cnl_ipc4_irq_thread(int irq, void *context)
 		cnl_ipc_dsp_done(sdev);
 
 		ipc_irq = true;
+		ack_received = true;
 	}
 
 	if (hipctdr & CNL_DSP_REG_HIPCTDR_BUSY) {
@@ -98,6 +100,13 @@ irqreturn_t cnl_ipc4_irq_thread(int irq, void *context)
 		/* This interrupt is not shared so no need to return IRQ_NONE. */
 		dev_dbg_ratelimited(sdev->dev, "nothing to do in IPC IRQ thread\n");
 
+	if (ack_received) {
+		struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
+
+		if (hdev->delayed_ipc_tx_msg)
+			cnl_ipc4_send_msg(sdev, hdev->delayed_ipc_tx_msg);
+	}
+
 	return IRQ_HANDLED;
 }
 
@@ -251,8 +260,16 @@ static bool cnl_compact_ipc_compress(struct snd_sof_ipc_msg *msg,
 
 int cnl_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 {
+	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 	struct sof_ipc4_msg *msg_data = msg->msg_data;
 
+	if (hda_ipc4_tx_is_busy(sdev)) {
+		hdev->delayed_ipc_tx_msg = msg;
+		return 0;
+	}
+
+	hdev->delayed_ipc_tx_msg = NULL;
+
 	/* send the message via mailbox */
 	if (msg_data->data_size)
 		sof_mailbox_write(sdev, sdev->host_box.offset, msg_data->data_ptr,
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 4118532faf3f..b4668c969a29 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -69,8 +69,16 @@ int hda_dsp_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 
 int hda_dsp_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 {
+	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 	struct sof_ipc4_msg *msg_data = msg->msg_data;
 
+	if (hda_ipc4_tx_is_busy(sdev)) {
+		hdev->delayed_ipc_tx_msg = msg;
+		return 0;
+	}
+
+	hdev->delayed_ipc_tx_msg = NULL;
+
 	/* send the message via mailbox */
 	if (msg_data->data_size)
 		sof_mailbox_write(sdev, sdev->host_box.offset, msg_data->data_ptr,
@@ -122,6 +130,7 @@ irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context)
 {
 	struct sof_ipc4_msg notification_data = {{ 0 }};
 	struct snd_sof_dev *sdev = context;
+	bool ack_received = false;
 	bool ipc_irq = false;
 	u32 hipcie, hipct;
 
@@ -135,6 +144,7 @@ irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context)
 		hda_dsp_ipc_dsp_done(sdev);
 
 		ipc_irq = true;
+		ack_received = true;
 	}
 
 	if (hipct & HDA_DSP_REG_HIPCT_BUSY) {
@@ -187,6 +197,13 @@ irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context)
 		/* This interrupt is not shared so no need to return IRQ_NONE. */
 		dev_dbg_ratelimited(sdev->dev, "nothing to do in IPC IRQ thread\n");
 
+	if (ack_received) {
+		struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
+
+		if (hdev->delayed_ipc_tx_msg)
+			hda_dsp_ipc4_send_msg(sdev, hdev->delayed_ipc_tx_msg);
+	}
+
 	return IRQ_HANDLED;
 }
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 1188ec51816b..eddd20beea0d 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -681,6 +681,17 @@ void hda_ipc4_dump(struct snd_sof_dev *sdev)
 		hipci, hipcie, hipct, hipcte, hipcctl);
 }
 
+bool hda_ipc4_tx_is_busy(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
+	u32 val;
+
+	val = snd_sof_dsp_read(sdev, HDA_DSP_BAR, chip->ipc_req);
+
+	return !!(val & chip->ipc_req_mask);
+}
+
 static int hda_init(struct snd_sof_dev *sdev)
 {
 	struct hda_bus *hbus;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 2ab3c3840b92..65657d145dc2 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -521,6 +521,14 @@ struct sof_intel_hda_dev {
 
 	/* Intel NHLT information */
 	struct nhlt_acpi_table *nhlt;
+
+	/*
+	 * Pointing to the IPC message if immediate sending was not possible
+	 * because the downlink communication channel was BUSY at the time.
+	 * The message will be re-tried when the channel becomes free (the ACK
+	 * is received from the DSP for the previous message)
+	 */
+	struct snd_sof_ipc_msg *delayed_ipc_tx_msg;
 };
 
 static inline struct hdac_bus *sof_to_bus(struct snd_sof_dev *s)
@@ -852,6 +860,7 @@ int hda_dsp_core_stall_reset(struct snd_sof_dev *sdev, unsigned int core_mask);
 irqreturn_t cnl_ipc4_irq_thread(int irq, void *context);
 int cnl_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
 irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context);
+bool hda_ipc4_tx_is_busy(struct snd_sof_dev *sdev);
 int hda_dsp_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
 void hda_ipc4_dump(struct snd_sof_dev *sdev);
 extern struct sdw_intel_ops sdw_callback;
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index a9b31b31a4e4..9d1bc74395e7 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -90,8 +90,16 @@ static bool mtl_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
 
 static int mtl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 {
+	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 	struct sof_ipc4_msg *msg_data = msg->msg_data;
 
+	if (hda_ipc4_tx_is_busy(sdev)) {
+		hdev->delayed_ipc_tx_msg = msg;
+		return 0;
+	}
+
+	hdev->delayed_ipc_tx_msg = NULL;
+
 	/* send the message via mailbox */
 	if (msg_data->data_size)
 		sof_mailbox_write(sdev, sdev->host_box.offset, msg_data->data_ptr,
@@ -492,6 +500,7 @@ static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 {
 	struct sof_ipc4_msg notification_data = {{ 0 }};
 	struct snd_sof_dev *sdev = context;
+	bool ack_received = false;
 	bool ipc_irq = false;
 	u32 hipcida;
 	u32 hipctdr;
@@ -508,6 +517,7 @@ static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 		mtl_ipc_dsp_done(sdev);
 
 		ipc_irq = true;
+		ack_received = true;
 	}
 
 	if (hipctdr & MTL_DSP_REG_HFIPCXTDR_BUSY) {
@@ -558,6 +568,13 @@ static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 		dev_dbg_ratelimited(sdev->dev, "nothing to do in IPC IRQ thread\n");
 	}
 
+	if (ack_received) {
+		struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
+
+		if (hdev->delayed_ipc_tx_msg)
+			mtl_ipc_send_msg(sdev, hdev->delayed_ipc_tx_msg);
+	}
+
 	return IRQ_HANDLED;
 }
 
-- 
2.38.0

