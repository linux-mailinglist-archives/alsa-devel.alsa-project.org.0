Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 841AD7A5F9D
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:32:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3AEFDF4;
	Tue, 19 Sep 2023 12:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3AEFDF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695119539;
	bh=Cj6S3Tosfu1CFPwdQuX2+GhSEmgcO+nYQK2tZvvKHnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sPFKBKirpEXsqr8FrbkSftkCMrUZepEeB6bDl5zqOM3070Ieb7r8M6hgj1LjtxapV
	 /izmiw+Aal+mTMlolU3s8P2p8B6zycesRk7oM/8QAGi3gy5hlbK2tS2OIyvlROmd3g
	 Ys5nArPl07Q/GXVZXGuSurHVlz9j5BxGvUwzikGM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D589EF80563; Tue, 19 Sep 2023 12:31:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46544F8025A;
	Tue, 19 Sep 2023 12:31:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66C2CF8055A; Tue, 19 Sep 2023 12:31:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09CB5F801F5
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09CB5F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QUJJRIiV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695119477; x=1726655477;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cj6S3Tosfu1CFPwdQuX2+GhSEmgcO+nYQK2tZvvKHnU=;
  b=QUJJRIiV2D0Uyld5AIplxRT3jGafMJ/AXFN2cqU/h6/EJaKFogPbtrLI
   Mjl4HrwrqXRMld02ZeIz6ZlAjWKPnO4V5ANbEYzaK6jY/LcPxSj8RrWCf
   nPsYj274PCh8PXYYze9YxhGlJR2rMtvRhTz3KgVPhp5aDtJc69q+gUBLj
   N3YAG73SMcHRkIiOwRuSkPoMCAZhf5Cc388A6/Ki5KcH/bEFY6XQYL5Pq
   uRUE+rtTWZ6HNbWvfKpFXYfuin2jhHFRO1e6JHYlr/BR9ncQj2ooLtY24
   mtANXoJMOAMKZXS7NtR4Yaj0A1D04RdCRL1S/zts5Ywx8ltBeadM0zLte
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="443990503"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="443990503"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:31:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861486849"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="861486849"
Received: from mokashi-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.50.26])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:31:09 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 1/3] ASoC: SOF: ipc4-topology: Add definition for generic
 switch/enum control
Date: Tue, 19 Sep 2023 13:31:13 +0300
Message-ID: <20230919103115.30783-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919103115.30783-1-peter.ujfalusi@linux.intel.com>
References: <20230919103115.30783-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UO75RWFULNOD4VRJLMVQ2NUDX5X2J7FQ
X-Message-ID-Hash: UO75RWFULNOD4VRJLMVQ2NUDX5X2J7FQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UO75RWFULNOD4VRJLMVQ2NUDX5X2J7FQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently IPC4 has no notion of a switch or enum type of control which is
a generic concept in ALSA.

The generic support for these control types will be as follows:
- large config is used to send the channel-value par array
- param_id of a SWITCH type is 200
- param_id of an ENUM type is 201

Each module need to support a switch or/and enum must handle these
universal param_ids.
The message payload is described by struct sof_ipc4_control_msg_payload.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.h | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index d94f0ab4aee3..0a57b8ab3e08 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -319,7 +319,7 @@ struct sof_ipc4_copier {
 /**
  * struct sof_ipc4_ctrl_value_chan: generic channel mapped value data
  * @channel: Channel ID
- * @value: gain value
+ * @value: Value associated with @channel
  */
 struct sof_ipc4_ctrl_value_chan {
 	u32 channel;
@@ -343,6 +343,23 @@ struct sof_ipc4_control_data {
 	};
 };
 
+#define SOF_IPC4_SWITCH_CONTROL_PARAM_ID	200
+#define SOF_IPC4_ENUM_CONTROL_PARAM_ID		201
+
+/**
+ * struct sof_ipc4_control_msg_payload - IPC payload for kcontrol parameters
+ * @id: unique id of the control
+ * @num_elems: Number of elements in the chanv array
+ * @reserved: reserved for future use, must be set to 0
+ * @chanv: channel ID and value array
+ */
+struct sof_ipc4_control_msg_payload {
+	uint16_t id;
+	uint16_t num_elems;
+	uint32_t reserved[4];
+	DECLARE_FLEX_ARRAY(struct sof_ipc4_ctrl_value_chan, chanv);
+} __packed;
+
 /**
  * struct sof_ipc4_gain_data - IPC gain blob
  * @channels: Channels
-- 
2.42.0

