Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3057A5FE4
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:44:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98048E95;
	Tue, 19 Sep 2023 12:43:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98048E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695120289;
	bh=ISylLT2R9VcwfQ0T9cAtWonHLbwxkLQqtIxnqW+ZObA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EGmXo9kHGg4Mt+a3xWnL2gzgndJVGKAMk+tVtWM3DB9wFB4GMvE3JZpY1kE6gXhtL
	 qFyI+Jwll0RsuVocY1LvK2pt2dAPo5g0kltmWyjH0lEiw9q0ecvCV1YfCxMmSvDVH2
	 aPrdllpeOSwLTioFBZCRZaQs8p9kgeu3AB3ek4dE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10CC5F805B0; Tue, 19 Sep 2023 12:42:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94698F805B1;
	Tue, 19 Sep 2023 12:42:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77DA6F805A9; Tue, 19 Sep 2023 12:42:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37774F80568
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37774F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jkyWE+aw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695120154; x=1726656154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ISylLT2R9VcwfQ0T9cAtWonHLbwxkLQqtIxnqW+ZObA=;
  b=jkyWE+awJ2Tk7yujygiA7BttLPwM0iieA1gBTmGF/jYCh42a4ikJUlE3
   1iO2vGUU4s4iE9S9mGfkGIR1TVVJLm5K4b3x7TPGeKr8uu1j9DmnADjae
   zJ1I9TaMycv87H8Bs1lN/rW1K7O5dhtEiBS//eq1vZ9QXTq9+NgKbOLpJ
   JxBoKxMawfg0VD0YyVqPL+JgwU/uSS7Ajo2Xv/JQbIUdpessfa/sX+l5f
   qsOOOrohreyKrt+T5BAbRPKcz/OCXdo7ZAWINh4nqd4+qFH7RRtTFZl2a
   sB7W4FpcKV4fyABCv5nPEVsL8BRSJVDshDUTJsOcZCtVMe1I2C4pNVIVX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382658476"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="382658476"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="722823260"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="722823260"
Received: from mokashi-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.50.26])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:42:29 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com,
	rander.wang@intel.com
Subject: [PATCH 4/9] ASoC: SOF: Use generic names for IPC types
Date: Tue, 19 Sep 2023 13:42:21 +0300
Message-ID: <20230919104226.32239-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
References: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SEXNK2AVIPFCK2UM5AARKMV7OJHNL6F5
X-Message-ID-Hash: SEXNK2AVIPFCK2UM5AARKMV7OJHNL6F5
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SEXNK2AVIPFCK2UM5AARKMV7OJHNL6F5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the new SOF_IPC_TYPE_3, SOF_IPC_TYPE_4 in core code.

No functional changes, just renaming.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc.c                         |  4 ++--
 sound/soc/sof/ipc3-dtrace.c                 |  2 +-
 sound/soc/sof/sof-acpi-dev.c                |  8 +++----
 sound/soc/sof/sof-client-ipc-msg-injector.c |  4 ++--
 sound/soc/sof/sof-client-probes.c           |  4 ++--
 sound/soc/sof/sof-client.c                  | 24 ++++++++++-----------
 sound/soc/sof/sof-of-dev.c                  |  6 +++---
 7 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 8a7eb3cb019a..febe372f9aa8 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -165,12 +165,12 @@ struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev)
 
 	switch (sdev->pdata->ipc_type) {
 #if defined(CONFIG_SND_SOC_SOF_IPC3)
-	case SOF_IPC:
+	case SOF_IPC_TYPE_3:
 		ops = &ipc3_ops;
 		break;
 #endif
 #if defined(CONFIG_SND_SOC_SOF_IPC4)
-	case SOF_INTEL_IPC4:
+	case SOF_IPC_TYPE_4:
 		ops = &ipc4_ops;
 		break;
 #endif
diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index bd07f0472efd..0dca139322f3 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -494,7 +494,7 @@ static int ipc3_dtrace_init(struct snd_sof_dev *sdev)
 	int ret;
 
 	/* dtrace is only supported with SOF_IPC */
-	if (sdev->pdata->ipc_type != SOF_IPC)
+	if (sdev->pdata->ipc_type != SOF_IPC_TYPE_3)
 		return -EOPNOTSUPP;
 
 	if (sdev->fw_trace_data) {
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 1b04dcb33293..5c4e5ab31abf 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -74,20 +74,18 @@ int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc
 
 	sof_pdata->desc = desc;
 	sof_pdata->dev = &pdev->dev;
-	sof_pdata->fw_filename = desc->default_fw_filename[SOF_IPC];
+	sof_pdata->fw_filename = desc->default_fw_filename[SOF_IPC_TYPE_3];
 
 	/* alternate fw and tplg filenames ? */
 	if (fw_path)
 		sof_pdata->fw_filename_prefix = fw_path;
 	else
-		sof_pdata->fw_filename_prefix =
-			sof_pdata->desc->default_fw_path[SOF_IPC];
+		sof_pdata->fw_filename_prefix = desc->default_fw_path[SOF_IPC_TYPE_3];
 
 	if (tplg_path)
 		sof_pdata->tplg_filename_prefix = tplg_path;
 	else
-		sof_pdata->tplg_filename_prefix =
-			sof_pdata->desc->default_tplg_path[SOF_IPC];
+		sof_pdata->tplg_filename_prefix = desc->default_tplg_path[SOF_IPC_TYPE_3];
 
 	/* set callback to be called on successful device probe to enable runtime_pm */
 	sof_pdata->sof_probe_complete = sof_acpi_probe_complete;
diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index 752d5320680f..e249d3a9afb5 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -267,7 +267,7 @@ static int sof_msg_inject_probe(struct auxiliary_device *auxdev,
 	priv->max_msg_size = sof_client_get_ipc_max_payload_size(cdev);
 	alloc_size = priv->max_msg_size;
 
-	if (priv->ipc_type == SOF_INTEL_IPC4)
+	if (priv->ipc_type == SOF_IPC_TYPE_4)
 		alloc_size += sizeof(struct sof_ipc4_msg);
 
 	priv->tx_buffer = devm_kmalloc(dev, alloc_size, GFP_KERNEL);
@@ -275,7 +275,7 @@ static int sof_msg_inject_probe(struct auxiliary_device *auxdev,
 	if (!priv->tx_buffer || !priv->rx_buffer)
 		return -ENOMEM;
 
-	if (priv->ipc_type == SOF_INTEL_IPC4) {
+	if (priv->ipc_type == SOF_IPC_TYPE_4) {
 		struct sof_ipc4_msg *ipc4_msg;
 
 		ipc4_msg = priv->tx_buffer;
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 390cdb8423ef..7cc9e8f18de7 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -424,12 +424,12 @@ static int sof_probes_client_probe(struct auxiliary_device *auxdev,
 
 	switch (sof_client_get_ipc_type(cdev)) {
 #ifdef CONFIG_SND_SOC_SOF_IPC4
-	case SOF_INTEL_IPC4:
+	case SOF_IPC_TYPE_4:
 		priv->ipc_ops = &ipc4_probe_ops;
 		break;
 #endif
 #ifdef CONFIG_SND_SOC_SOF_IPC3
-	case SOF_IPC:
+	case SOF_IPC_TYPE_3:
 		priv->ipc_ops = &ipc3_probe_ops;
 		break;
 #endif
diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index e1a8edbefff7..3f636b82173e 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -75,7 +75,7 @@ static int sof_register_ipc_flood_test(struct snd_sof_dev *sdev)
 	int ret = 0;
 	int i;
 
-	if (sdev->pdata->ipc_type != SOF_IPC)
+	if (sdev->pdata->ipc_type != SOF_IPC_TYPE_3)
 		return 0;
 
 	for (i = 0; i < CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM; i++) {
@@ -131,7 +131,7 @@ static inline void sof_unregister_ipc_msg_injector(struct snd_sof_dev *sdev) {}
 static int sof_register_ipc_kernel_injector(struct snd_sof_dev *sdev)
 {
 	/* Only IPC3 supported right now */
-	if (sdev->pdata->ipc_type != SOF_IPC)
+	if (sdev->pdata->ipc_type != SOF_IPC_TYPE_3)
 		return 0;
 
 	return sof_client_dev_register(sdev, "kernel_injector", 0, NULL, 0);
@@ -287,12 +287,12 @@ EXPORT_SYMBOL_NS_GPL(sof_client_dev_unregister, SND_SOC_SOF_CLIENT);
 int sof_client_ipc_tx_message(struct sof_client_dev *cdev, void *ipc_msg,
 			      void *reply_data, size_t reply_bytes)
 {
-	if (cdev->sdev->pdata->ipc_type == SOF_IPC) {
+	if (cdev->sdev->pdata->ipc_type == SOF_IPC_TYPE_3) {
 		struct sof_ipc_cmd_hdr *hdr = ipc_msg;
 
 		return sof_ipc_tx_message(cdev->sdev->ipc, ipc_msg, hdr->size,
 					  reply_data, reply_bytes);
-	} else if (cdev->sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
+	} else if (cdev->sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
 		struct sof_ipc4_msg *msg = ipc_msg;
 
 		return sof_ipc_tx_message(cdev->sdev->ipc, ipc_msg, msg->data_size,
@@ -305,7 +305,7 @@ EXPORT_SYMBOL_NS_GPL(sof_client_ipc_tx_message, SND_SOC_SOF_CLIENT);
 
 int sof_client_ipc_rx_message(struct sof_client_dev *cdev, void *ipc_msg, void *msg_buf)
 {
-	if (cdev->sdev->pdata->ipc_type == SOF_IPC) {
+	if (cdev->sdev->pdata->ipc_type == SOF_IPC_TYPE_3) {
 		struct sof_ipc_cmd_hdr *hdr = ipc_msg;
 
 		if (hdr->size < sizeof(hdr)) {
@@ -324,12 +324,12 @@ EXPORT_SYMBOL_NS_GPL(sof_client_ipc_rx_message, SND_SOC_SOF_CLIENT);
 int sof_client_ipc_set_get_data(struct sof_client_dev *cdev, void *ipc_msg,
 				bool set)
 {
-	if (cdev->sdev->pdata->ipc_type == SOF_IPC) {
+	if (cdev->sdev->pdata->ipc_type == SOF_IPC_TYPE_3) {
 		struct sof_ipc_cmd_hdr *hdr = ipc_msg;
 
 		return sof_ipc_set_get_data(cdev->sdev->ipc, ipc_msg, hdr->size,
 					    set);
-	} else if (cdev->sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
+	} else if (cdev->sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
 		struct sof_ipc4_msg *msg = ipc_msg;
 
 		return sof_ipc_set_get_data(cdev->sdev->ipc, ipc_msg,
@@ -345,7 +345,7 @@ struct sof_ipc4_fw_module *sof_client_ipc4_find_module(struct sof_client_dev *c,
 {
 	struct snd_sof_dev *sdev = c->sdev;
 
-	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4)
+	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4)
 		return sof_ipc4_find_module_by_uuid(sdev, uuid);
 	dev_err(sdev->dev, "Only supported with IPC4\n");
 
@@ -463,11 +463,11 @@ void sof_client_ipc_rx_dispatcher(struct snd_sof_dev *sdev, void *msg_buf)
 	struct sof_ipc_event_entry *event;
 	u32 msg_type;
 
-	if (sdev->pdata->ipc_type == SOF_IPC) {
+	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_3) {
 		struct sof_ipc_cmd_hdr *hdr = msg_buf;
 
 		msg_type = hdr->cmd & SOF_GLB_TYPE_MASK;
-	} else if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
+	} else if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
 		struct sof_ipc4_msg *msg = msg_buf;
 
 		msg_type = SOF_IPC4_NOTIFICATION_TYPE_GET(msg->primary);
@@ -497,10 +497,10 @@ int sof_client_register_ipc_rx_handler(struct sof_client_dev *cdev,
 	if (!callback)
 		return -EINVAL;
 
-	if (cdev->sdev->pdata->ipc_type == SOF_IPC) {
+	if (cdev->sdev->pdata->ipc_type == SOF_IPC_TYPE_3) {
 		if (!(ipc_msg_type & SOF_GLB_TYPE_MASK))
 			return -EINVAL;
-	} else if (cdev->sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
+	} else if (cdev->sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
 		if (!(ipc_msg_type & SOF_IPC4_NOTIFICATION_TYPE_MASK))
 			return -EINVAL;
 	} else {
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 53faeccedd4f..b0e8bd06f78a 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -64,17 +64,17 @@ int sof_of_probe(struct platform_device *pdev)
 
 	sof_pdata->desc = desc;
 	sof_pdata->dev = &pdev->dev;
-	sof_pdata->fw_filename = desc->default_fw_filename[SOF_IPC];
+	sof_pdata->fw_filename = desc->default_fw_filename[SOF_IPC_TYPE_3];
 
 	if (fw_path)
 		sof_pdata->fw_filename_prefix = fw_path;
 	else
-		sof_pdata->fw_filename_prefix = sof_pdata->desc->default_fw_path[SOF_IPC];
+		sof_pdata->fw_filename_prefix = desc->default_fw_path[SOF_IPC_TYPE_3];
 
 	if (tplg_path)
 		sof_pdata->tplg_filename_prefix = tplg_path;
 	else
-		sof_pdata->tplg_filename_prefix = sof_pdata->desc->default_tplg_path[SOF_IPC];
+		sof_pdata->tplg_filename_prefix = desc->default_tplg_path[SOF_IPC_TYPE_3];
 
 	/* set callback to be called on successful device probe to enable runtime_pm */
 	sof_pdata->sof_probe_complete = sof_of_probe_complete;
-- 
2.42.0

