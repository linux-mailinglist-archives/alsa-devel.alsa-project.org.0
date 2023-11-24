Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 005807F775A
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 16:10:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36381E7D;
	Fri, 24 Nov 2023 16:10:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36381E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700838620;
	bh=Q9WCbZVURpnqvd5xlh4EYvKFVSLfCjZ9vNYEc46ktjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YDfpywmi++jvcWvB+aHbdu7DAySsPVIGcv61iarkRW0LyvVf1iQsm5wmkrBiQRobe
	 QmeDMNb2NV7Oa1GCpy5Pka3/mMJFGwukbT5ufn7kGTCDOhZ8jvbyqCU8qnb83qxiI9
	 ZgVkpltIlFi//z6YLiFIqMTKtQcXnPIreEewIJgA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02464F80613; Fri, 24 Nov 2023 16:08:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79AF7F80623;
	Fri, 24 Nov 2023 16:08:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55DCEF805F4; Fri, 24 Nov 2023 16:08:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A11E7F802E8
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 16:08:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A11E7F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bjF0wv/V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700838515; x=1732374515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q9WCbZVURpnqvd5xlh4EYvKFVSLfCjZ9vNYEc46ktjw=;
  b=bjF0wv/VdBa4oXuEArr7le1Hsx/s4hP0JoMpBRf0MYnRV8gb2k0G7OO0
   mOTjFe34WBZzhwpXW0PETCaUc3BHkPjDmrmV0QX+8Z+utTeOuWI9csapG
   KjBhRJO489BLSA3NetYEZ7daBgJxTJkOLPoYqRs/7m0j493XD+aljqNwz
   NVjosgaC4HMFBxr/iQ8+DZb3QVfHpaC0m9BGTYzZu8I1QG/qh9tzvTtAe
   GHBcsQZ1z2PMSsXsdhQwSGnxoCicIC2rDIbNON3i13P0TpH9u/KVfputz
   wErD9D+z4okX/JMkPQlXP4mpK9anCq8bMpPYXgUqLuUouuLi+aa5EEwK5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="377477075"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="377477075"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:08:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="743915686"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="743915686"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:08:30 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 4/4] ASoC: SOF: ipc4: Handle ALSA kcontrol change notification
 from firmware
Date: Fri, 24 Nov 2023 17:08:53 +0200
Message-ID: <20231124150853.18648-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
References: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IZOLH5K3PEQTKMEWZ2JVGBF3CH72BEPB
X-Message-ID-Hash: IZOLH5K3PEQTKMEWZ2JVGBF3CH72BEPB
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IZOLH5K3PEQTKMEWZ2JVGBF3CH72BEPB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The control change notification is sent as module notification with a
standardized event_id (higher 16 bit is 0xA15A).
Add generic code to handle the module notification and invoke the control
update callback if the notification is an ALSA kcontrol change message.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4.c | 57 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 8441f4ae4065..a9d9800d2fcc 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -78,6 +78,9 @@ static const struct sof_ipc4_fw_status {
 	{165, "Reserved (ADSP_IPC_PIPELINE_ALREADY_EXISTS removed)"},
 };
 
+typedef void (*ipc4_notification_handler)(struct snd_sof_dev *sdev,
+					  struct sof_ipc4_msg *msg);
+
 static int sof_ipc4_check_reply_status(struct snd_sof_dev *sdev, u32 status)
 {
 	int i, ret;
@@ -610,9 +613,55 @@ static int ipc4_fw_ready(struct snd_sof_dev *sdev, struct sof_ipc4_msg *ipc4_msg
 	return sof_ipc4_init_msg_memory(sdev);
 }
 
+static void sof_ipc4_module_notification_handler(struct snd_sof_dev *sdev,
+						 struct sof_ipc4_msg *ipc4_msg)
+{
+	struct sof_ipc4_notify_module_data *data = ipc4_msg->data_ptr;
+
+	/*
+	 * If the notification includes additional, module specific data, then
+	 * we need to re-allocate the buffer and re-read the whole payload,
+	 * including the event_data
+	 */
+	if (data->event_data_size) {
+		void *new;
+		int ret;
+
+		ipc4_msg->data_size += data->event_data_size;
+
+		new = krealloc(ipc4_msg->data_ptr, ipc4_msg->data_size, GFP_KERNEL);
+		if (!new) {
+			ipc4_msg->data_size -= data->event_data_size;
+			return;
+		}
+
+		/* re-read the whole payload */
+		ipc4_msg->data_ptr = new;
+		ret = snd_sof_ipc_msg_data(sdev, NULL, ipc4_msg->data_ptr,
+					   ipc4_msg->data_size);
+		if (ret < 0) {
+			dev_err(sdev->dev,
+				"Failed to read the full module notification: %d\n",
+				ret);
+			return;
+		}
+		data = ipc4_msg->data_ptr;
+	}
+
+	/* Handle ALSA kcontrol notification */
+	if ((data->event_id & SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_MASK) ==
+	    SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_VAL) {
+		const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+
+		if (tplg_ops->control->update)
+			tplg_ops->control->update(sdev, ipc4_msg);
+	}
+}
+
 static void sof_ipc4_rx_msg(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc4_msg *ipc4_msg = sdev->ipc->msg.rx_data;
+	ipc4_notification_handler handler_func = NULL;
 	size_t data_size = 0;
 	int err;
 
@@ -648,6 +697,10 @@ static void sof_ipc4_rx_msg(struct snd_sof_dev *sdev)
 	case SOF_IPC4_NOTIFY_EXCEPTION_CAUGHT:
 		snd_sof_dsp_panic(sdev, 0, true);
 		break;
+	case SOF_IPC4_NOTIFY_MODULE_NOTIFICATION:
+		data_size = sizeof(struct sof_ipc4_notify_module_data);
+		handler_func = sof_ipc4_module_notification_handler;
+		break;
 	default:
 		dev_dbg(sdev->dev, "Unhandled DSP message: %#x|%#x\n",
 			ipc4_msg->primary, ipc4_msg->extension);
@@ -663,6 +716,10 @@ static void sof_ipc4_rx_msg(struct snd_sof_dev *sdev)
 		snd_sof_ipc_msg_data(sdev, NULL, ipc4_msg->data_ptr, ipc4_msg->data_size);
 	}
 
+	/* Handle notifications with payload */
+	if (handler_func)
+		handler_func(sdev, ipc4_msg);
+
 	sof_ipc4_log_header(sdev->dev, "ipc rx done ", ipc4_msg, true);
 
 	if (data_size) {
-- 
2.42.1

