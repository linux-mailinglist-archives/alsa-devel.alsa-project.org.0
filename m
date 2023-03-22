Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1536C4570
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 09:56:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08798851;
	Wed, 22 Mar 2023 09:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08798851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679475388;
	bh=u4KsVs840Q+pNeotW8aTcy5v6pHqNVP3sAsXjuvAoQQ=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=j5Fo5qXKQffCXiyjpg4ls8xC+umNmmX0Vi5rQXvWIjX5iHMSJPIRW+2UTb5TLQm4r
	 xRv/9dtnFMyPMwOjhIMDqz150IayGSR+X0ZDgtdLbsDf52OQH0qlbiZgS1XjU0Q8Y+
	 zKu4CZJyoExZwJSi5suGRHuOzLRK/d1wjq82izkU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E101F80254;
	Wed, 22 Mar 2023 09:55:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B465CF8027B; Wed, 22 Mar 2023 09:55:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6EE3F80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 09:55:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6EE3F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WiI9fmga
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679475325; x=1711011325;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=u4KsVs840Q+pNeotW8aTcy5v6pHqNVP3sAsXjuvAoQQ=;
  b=WiI9fmgaf28aZP7YPraFEx8cm7cfy8pkKIBqd5LKpw8zwgQOHHMd2FJ3
   w4gAZ+WsSFDPANE+Zs4VO3/PMtukx0mFvQUN4ZDrKOCq/nvI6Em+NT7sH
   Fdhg9kEsp7M7jepqn1MLbKWE34R2E0dhC5YBz1/omSBdwkRXrxAtJE3Xq
   e8wcxbmRGV/aIp+aUsIlb7uAtbF1QKfSIs1mzOoy+gLoikwgAOPtOy1J3
   h5ttpnpbW5ifXjOtO/WIbAFj/m63dN02XDcWbvSANda2yAOIurer4xtbo
   xvFqineep+KzRBkHTHyIJ5jC0WP0v5VEoPTIPvrGl7GKVD2DRtftR9Vxy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366898860"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="366898860"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 01:55:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="746220304"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="746220304"
Received: from gjantea-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.222.2])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 01:55:09 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: ipc4: Ensure DSP is in D0I0 during
 sof_ipc4_set_get_data()
Date: Wed, 22 Mar 2023 10:55:38 +0200
Message-Id: <20230322085538.10214-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5QL6VZN4MVZDFP6MMMUD6DMAW4O6RYEJ
X-Message-ID-Hash: 5QL6VZN4MVZDFP6MMMUD6DMAW4O6RYEJ
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5QL6VZN4MVZDFP6MMMUD6DMAW4O6RYEJ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The set_get_data() IPC op bypasses the check for the no_pm flag as done
with the regular IPC tx_msg op. Since set_get_data should be performed
when the DSP is in D0I0, set the DSP power state to D0I0 before sending
the IPC's in sof_ipc4_set_get_data().

Fixes: ceb89acc4dc8 ("ASoC: SOF: ipc4: Add support for mandatory message handling functionality")
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 8ede4b952997..246b56d24a6f 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -405,6 +405,9 @@ static int sof_ipc4_tx_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_
 static int sof_ipc4_set_get_data(struct snd_sof_dev *sdev, void *data,
 				 size_t payload_bytes, bool set)
 {
+	const struct sof_dsp_power_state target_state = {
+			.state = SOF_DSP_PM_D0,
+	};
 	size_t payload_limit = sdev->ipc->max_payload_size;
 	struct sof_ipc4_msg *ipc4_msg = data;
 	struct sof_ipc4_msg tx = {{ 0 }};
@@ -435,6 +438,11 @@ static int sof_ipc4_set_get_data(struct snd_sof_dev *sdev, void *data,
 
 	tx.extension |= SOF_IPC4_MOD_EXT_MSG_FIRST_BLOCK(1);
 
+	/* ensure the DSP is in D0i0 before sending IPC */
+	ret = snd_sof_dsp_set_power_state(sdev, &target_state);
+	if (ret < 0)
+		return ret;
+
 	/* Serialise IPC TX */
 	mutex_lock(&sdev->ipc->tx_mutex);
 
-- 
2.40.0

