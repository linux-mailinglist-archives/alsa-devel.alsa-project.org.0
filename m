Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D917F7755
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 16:09:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DB15E7F;
	Fri, 24 Nov 2023 16:09:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DB15E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700838585;
	bh=HE+HVflr/dMP7+v5zO2JHf1ebjW2yG0wUiLxBbEGi5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=am8fukR9m4RzcZW4BI8sEACAoQdYOvswidLqLS0gP/X/3AeeQcu3U8rbd8yaxSeWD
	 FLPcU68fW5scxe4F6HFqaNVrEMeTiS7Zs0FWPBYyK6OpmrzLDpkZPJNLrEUxdpD9m5
	 ugAKgASk0fUwtZGZf1y75XaSpts8KR1CrF8Urspg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF75DF805E4; Fri, 24 Nov 2023 16:08:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 222F7F805E7;
	Fri, 24 Nov 2023 16:08:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7750AF8057B; Fri, 24 Nov 2023 16:08:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3764DF80254
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 16:08:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3764DF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Kwb5muR8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700838514; x=1732374514;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HE+HVflr/dMP7+v5zO2JHf1ebjW2yG0wUiLxBbEGi5M=;
  b=Kwb5muR8parz5c68kPNvQUyet0bQpQSA3I7pM+uvbrPiOzWeU9/QZEgb
   uHsIByA2bO1OgtXxvwkE3osFVEsZ3kHmbh7icHpcirNwEK/kSEmfv4RkP
   +MQTqKkbeDUNYvVmiTcWzLK4u2JDorYcsCaekZUz5bVIOw5shsWdQ9uvZ
   aUjPPn0zl5EAlYsf38LdpPz1Krs0YI1lwyNBW11bAb6KXazMrpvd0yTjV
   vcCZU7Zg6gkA4AY0qZXvMTBPDuH/0+a81Nx20bzY1WQ4aqnsZaPinS8tR
   gIrC8fUYKZlP26fMYIzQbyKNFfSmwydjkLu4HkyFUxgC/k8w23WGpPDpr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="377477056"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="377477056"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:08:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="743915678"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="743915678"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:08:25 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 2/4] ASoC: SOF: ipc4: Add data struct for module notification
 message from firmware
Date: Fri, 24 Nov 2023 17:08:51 +0200
Message-ID: <20231124150853.18648-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
References: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YXEBPJSMBKFLPM4Z43AF3E56FIHDTAK7
X-Message-ID-Hash: YXEBPJSMBKFLPM4Z43AF3E56FIHDTAK7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YXEBPJSMBKFLPM4Z43AF3E56FIHDTAK7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

With the module notification message the information about the notification
is provided via the mailbox with the sof_ipc4_notify_module_data struct.

It contains the module and instance id of the sender of the notification,
the event_id and optionally additional data which is module and event
specific.

At the same time add definitions to identify ALSA kcontrol change
notification.
These notifications use standardized event_id, modules must follow this if
they support such notifications:
upper 16 bit: 0xA15A as a magic identification value
lower 16 bit: param_id of the changed control

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/ipc4/header.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index 574a9d581f88..2c81d6dde577 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -532,6 +532,35 @@ struct sof_ipc4_notify_resource_data {
 #define SOF_IPC4_DEBUG_SLOT_TELEMETRY		0x4c455400
 #define SOF_IPC4_DEBUG_SLOT_BROKEN		0x44414544
 
+/**
+ * struct sof_ipc4_notify_module_data - payload for module notification
+ * @instance_id: instance ID of the originator module of the notification
+ * @module_id: module ID of the originator of the notification
+ * @event_id: module specific event id
+ * @event_data_size: Size of the @event_data (if any) in bytes
+ * @event_data: Optional notification data, module and notification dependent
+ */
+struct sof_ipc4_notify_module_data {
+	uint16_t instance_id;
+	uint16_t module_id;
+	uint32_t event_id;
+	uint32_t event_data_size;
+	uint8_t event_data[];
+} __packed __aligned(4);
+
+/*
+ * ALSA kcontrol change notification
+ *
+ * The event_id of struct sof_ipc4_notify_module_data is divided into two u16:
+ *  upper u16: magic number for ALSA kcontrol types: 0xA15A
+ *  lower u16: param_id of the control, which is the type of the control
+ * The event_data contains the struct sof_ipc4_control_msg_payload of the control
+ * which sent the notification.
+ */
+#define SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_MASK		GENMASK(31, 16)
+#define SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_VAL		0xA15A0000
+#define SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_PARAMID_MASK	GENMASK(15, 0)
+
 /** @}*/
 
 #endif
-- 
2.42.1

