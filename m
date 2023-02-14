Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B83E6960DE
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 11:35:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A449E850;
	Tue, 14 Feb 2023 11:35:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A449E850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676370954;
	bh=EV3KUHudqsxWRyx9RPZgbwJYDSg6T1d0WVQDenLg5co=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=euphmb/aXhV5UxchvXe/iruTM7kmNST4DeDyK7ZsYJH2YTcgCqzml0U+A/ClOCyyp
	 VAWnXJ99e45CFivJyz7j8axilyh8vk1pOk219/9MBwG092OjdqCk49qA2ipcY4kE8h
	 a9oTZKEHbWvM9BKYAcpWJsHO0WwJ+jY0gm6c5oCc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A8F7F80534;
	Tue, 14 Feb 2023 11:33:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC3E1F80526; Tue, 14 Feb 2023 11:33:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2613BF801C0
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 11:33:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2613BF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FSYjFUA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676370825; x=1707906825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EV3KUHudqsxWRyx9RPZgbwJYDSg6T1d0WVQDenLg5co=;
  b=FSYjFUA5paVNYLtkQT+pLiBk2vrxQk+izkeO8taI7qN58gCsa7dgd2cc
   2g2PHp5qrP4fmGGmwfl/vRqN4hp8aEPbFrxPZKpmjg/Pv4RbEmYcQI/Eq
   PGXwm8uz0EDB+7NMsZJhh+7Fr+lz9MsidKnI+qplRcjphcnf/3/K8dao3
   iVswPmHk0REojOoM/xPMYCmMI+Hjruiv861WbDqw4/rOtzpVWj1iad/Kl
   hgaymSG6zZ6u5kbNNOhmDfpxOCixlhJEoIH0ujQKbswMgKCCmTwGr84nZ
   wTPQUDdA9++M3oA1FZDqpf1q4ufRCyZAgNzKfpaK/P3xeGUjPftJ9sF4F
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="395745439"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000";
   d="scan'208";a="395745439"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 02:33:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="811971916"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000";
   d="scan'208";a="811971916"
Received: from unknown (HELO pujfalus-desk.ger.corp.intel.com)
 ([10.252.18.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 02:33:41 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 4/5] ASoC: SOF: Intel: Enable d0i3 work for ipc4
Date: Tue, 14 Feb 2023 12:33:44 +0200
Message-Id: <20230214103345.30669-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214103345.30669-1-peter.ujfalusi@linux.intel.com>
References: <20230214103345.30669-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J67ZU4M7L32IHIWGXQEZ5NCLQGG23MYN
X-Message-ID-Hash: J67ZU4M7L32IHIWGXQEZ5NCLQGG23MYN
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J67ZU4M7L32IHIWGXQEZ5NCLQGG23MYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Schedule a delayed work for d0i3 entry after every non-pm ipc msg.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/cnl.c     |  2 ++
 sound/soc/sof/intel/hda-ipc.c | 28 ++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h     |  2 ++
 sound/soc/sof/intel/mtl.c     |  2 ++
 4 files changed, 34 insertions(+)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 6b075bbe5bfb..a08a77fa946b 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -280,6 +280,8 @@ int cnl_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 	snd_sof_dsp_write(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDR,
 			  msg_data->primary | CNL_DSP_REG_HIPCIDR_BUSY);
 
+	hda_dsp_ipc4_schedule_d0i3_work(hdev, msg);
+
 	return 0;
 }
 
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index d7e16e6b6f52..df541b22b2d2 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -67,6 +67,32 @@ int hda_dsp_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 	return 0;
 }
 
+static inline bool hda_dsp_ipc4_pm_msg(u32 primary)
+{
+	/* pm setting is only supported by module msg */
+	if (SOF_IPC4_MSG_IS_MODULE_MSG(primary) != SOF_IPC4_MODULE_MSG)
+		return false;
+
+	if (SOF_IPC4_MSG_TYPE_GET(primary) == SOF_IPC4_MOD_SET_DX ||
+	    SOF_IPC4_MSG_TYPE_GET(primary) == SOF_IPC4_MOD_SET_D0IX)
+		return true;
+
+	return false;
+}
+
+void hda_dsp_ipc4_schedule_d0i3_work(struct sof_intel_hda_dev *hdev,
+				     struct snd_sof_ipc_msg *msg)
+{
+	struct sof_ipc4_msg *msg_data = msg->msg_data;
+
+	/* Schedule a delayed work for d0i3 entry after sending non-pm ipc msg */
+	if (hda_dsp_ipc4_pm_msg(msg_data->primary))
+		return;
+
+	mod_delayed_work(system_wq, &hdev->d0i3_work,
+			 msecs_to_jiffies(SOF_HDA_D0I3_WORK_DELAY_MS));
+}
+
 int hda_dsp_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 {
 	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
@@ -88,6 +114,8 @@ int hda_dsp_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 	snd_sof_dsp_write(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCI,
 			  msg_data->primary | HDA_DSP_REG_HIPCI_BUSY);
 
+	hda_dsp_ipc4_schedule_d0i3_work(hdev, msg);
+
 	return 0;
 }
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index b3080b82ca25..45f9d4248f14 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -919,6 +919,8 @@ irqreturn_t cnl_ipc4_irq_thread(int irq, void *context);
 int cnl_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
 irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context);
 bool hda_ipc4_tx_is_busy(struct snd_sof_dev *sdev);
+void hda_dsp_ipc4_schedule_d0i3_work(struct sof_intel_hda_dev *hdev,
+				     struct snd_sof_ipc_msg *msg);
 int hda_dsp_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
 void hda_ipc4_dump(struct snd_sof_dev *sdev);
 extern struct sdw_intel_ops sdw_callback;
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 67b8ccbc2e94..307faad2ecf4 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -110,6 +110,8 @@ static int mtl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *ms
 	snd_sof_dsp_write(sdev, HDA_DSP_BAR, MTL_DSP_REG_HFIPCXIDR,
 			  msg_data->primary | MTL_DSP_REG_HFIPCXIDR_BUSY);
 
+	hda_dsp_ipc4_schedule_d0i3_work(hdev, msg);
+
 	return 0;
 }
 
-- 
2.39.1

