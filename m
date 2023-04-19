Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 945A76E8208
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 21:43:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21CA7EFF;
	Wed, 19 Apr 2023 21:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21CA7EFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681933391;
	bh=FiIvs2GJRoNgRkQ4E3hYGiS2X7wWBcm7oDuUes7XXc0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bGJmEJcnFu9Z6ADSC6vOC+MZSAIpg4YOdgcJOrFefYpH2VE67/VAHqdYCTA/AqRLY
	 72oVM+TIllszWr9UFF54wQuYzqHJFUuNJQjgWDOSylbjt0lSCCUUts5dcPPhSUVg+Z
	 gqLYUy5lLnOPwLXw2T1yLYRRZDNWS/MUJfmhxim0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2E4DF80510;
	Wed, 19 Apr 2023 21:41:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3BD5F8019B; Wed, 19 Apr 2023 21:41:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FA5FF800D0
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 21:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FA5FF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QAxQcGKU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681933282; x=1713469282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FiIvs2GJRoNgRkQ4E3hYGiS2X7wWBcm7oDuUes7XXc0=;
  b=QAxQcGKUIDvAKju7jCm5maEYL6Io1+s5TeuK8LrQLZO78MEJl4bfki1z
   URJPhtyAD5FVcVxzGNqOUinMKPDJbu8xZawXVy2Tx8o5ZV0yuQIJEALcS
   Dsgodv6gCC+PmudSU3SzpR1oPoyzCcuaYaoY/0+84L6FGSUeU2lNBPMIg
   1gqKSJSNqIqRTQodIHfhuGN/tNXCVI34GR58pXaR9FA3F5X5/n2VZTU5b
   rwcATnk3z2InbNMfaKklaQidUr4F8aftzcUc05KtIWKJuKvXQZfty53YQ
   FsGno5A72fWpStaOhCChc9WlbqVL4w31r4G+4KeQUR7+IULtoGebhgvdp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="431822104"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="431822104"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:41:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="694191220"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="694191220"
Received: from gargicha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.74.38])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:41:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] ASoC: SOF: ipc: Add no reply inline calls
Date: Wed, 19 Apr 2023 14:40:56 -0500
Message-Id: <20230419194057.42205-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230419194057.42205-1-pierre-louis.bossart@linux.intel.com>
References: <20230419194057.42205-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7W53VMMY7QZZ5MGFKIKKX2J4EBWRSZKD
X-Message-ID-Hash: 7W53VMMY7QZZ5MGFKIKKX2J4EBWRSZKD
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, broonie@kernel.org,
 Curtis Malainey <cujomalainey@chromium.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7W53VMMY7QZZ5MGFKIKKX2J4EBWRSZKD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

95% of the calls inside SOF to TX an IPC don't care about a reply. Yet
the previous commit cleaned up a bunch of replies that were being
populated and then thrown away. This adds some functions so users who do
not need replies don't feel obligated to provide the space to the API.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-client.h |  4 ++++
 sound/soc/sof/sof-priv.h   | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/sof/sof-client.h b/sound/soc/sof/sof-client.h
index 2589714eaa91..10571d1ea9a7 100644
--- a/sound/soc/sof/sof-client.h
+++ b/sound/soc/sof/sof-client.h
@@ -39,6 +39,10 @@ struct sof_client_dev {
 
 int sof_client_ipc_tx_message(struct sof_client_dev *cdev, void *ipc_msg,
 			      void *reply_data, size_t reply_bytes);
+static inline int sof_client_ipc_tx_message_no_reply(struct sof_client_dev *cdev, void *ipc_msg)
+{
+	return sof_client_ipc_tx_message(cdev, ipc_msg, NULL, 0);
+}
 int sof_client_ipc_set_get_data(struct sof_client_dev *cdev, void *ipc_msg,
 				bool set);
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 1170989bea57..cd4f6ac126ec 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -711,10 +711,20 @@ static inline void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev)
 }
 int sof_ipc_tx_message(struct snd_sof_ipc *ipc, void *msg_data, size_t msg_bytes,
 		       void *reply_data, size_t reply_bytes);
+static inline int sof_ipc_tx_message_no_reply(struct snd_sof_ipc *ipc, void *msg_data,
+					      size_t msg_bytes)
+{
+	return sof_ipc_tx_message(ipc, msg_data, msg_bytes, NULL, 0);
+}
 int sof_ipc_set_get_data(struct snd_sof_ipc *ipc, void *msg_data,
 			 size_t msg_bytes, bool set);
 int sof_ipc_tx_message_no_pm(struct snd_sof_ipc *ipc, void *msg_data, size_t msg_bytes,
 			     void *reply_data, size_t reply_bytes);
+static inline int sof_ipc_tx_message_no_pm_no_reply(struct snd_sof_ipc *ipc, void *msg_data,
+						    size_t msg_bytes)
+{
+	return sof_ipc_tx_message_no_pm(ipc, msg_data, msg_bytes, NULL, 0);
+}
 int sof_ipc_send_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_bytes,
 		     size_t reply_bytes);
 
-- 
2.37.2

