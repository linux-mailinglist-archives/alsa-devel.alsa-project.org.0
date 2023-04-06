Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 325176D9CBB
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 17:52:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1E9DF22;
	Thu,  6 Apr 2023 17:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1E9DF22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680796352;
	bh=FiIvs2GJRoNgRkQ4E3hYGiS2X7wWBcm7oDuUes7XXc0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=byAjZ3+3Uil5c40PqYdqh4t57IMsevSECKuZZ5p/l4YAJD9OdAmEhDt1d3PHI/DP0
	 ohmUCeT9VeljJqhZXQ0x8DuoVAarqwaQ1hE4CFLaXOWoJTfl4MBm4U+Sst2NdaWEqq
	 NJ9T2Qhqhn0WleXIdgkQa+p6kbEsGF+LAucr3YVc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10AAAF8051F;
	Thu,  6 Apr 2023 17:51:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BC8DF80171; Thu,  6 Apr 2023 17:50:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34CFFF80171
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 17:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34CFFF80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jEX5B+z/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680796245; x=1712332245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FiIvs2GJRoNgRkQ4E3hYGiS2X7wWBcm7oDuUes7XXc0=;
  b=jEX5B+z/9O3MuGyGJSwRODd+2rtjiJNcfI6JULrIB/YWIl3ge/qWK0vB
   hLLhlZFIK5hK83DT1DTkivoHEpnBcecJ74A3eoimL/n9nH3f28GyEuumX
   xuAu7MgxD4+cZgNHb4QHr0q5v9iaTY9bcIWOajfn9HFjQs10/uX8WCAO8
   1XW9caBMDvknHqZkfXwotDGVDkgf6Y/jHuiTxA9BbFzVieiY2GWQdHc39
   lyovmrJ8pWF2uJqPVY9fW85ag+GPL9h/wWf/89EuOXQwuadF3/xIk/Pr8
   pgyzDdsy3ITW1jKeXjyirQZv3ioR+y4yOAy85qyAfl4Y94V1j6Y2+5OSD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="331407021"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="331407021"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 08:50:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="830802325"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="830802325"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.83.247])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 08:50:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: SOF: ipc: Add no reply inline calls
Date: Thu,  6 Apr 2023 10:50:25 -0500
Message-Id: <20230406155026.18723-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230406155026.18723-1-pierre-louis.bossart@linux.intel.com>
References: <20230406155026.18723-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P2BA2CUTBMGX2C2X2463QATHBUDGPU6U
X-Message-ID-Hash: P2BA2CUTBMGX2C2X2463QATHBUDGPU6U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P2BA2CUTBMGX2C2X2463QATHBUDGPU6U/>
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

