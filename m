Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B389646D1E9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:17:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51EBF2583;
	Wed,  8 Dec 2021 12:16:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51EBF2583
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962228;
	bh=HcpHWn5Hq4iwDwMmOebdPGfdHQXCnrT5YnpgCdVSJJk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mzqWTtxZ/UFSiAxQ8zsXTQ1QWmweMCtR564Txt47Yz1/JY5Bp4CbjCmMPsP/4+DGX
	 tbqXl1Pz8XYGYQQDflqNM5Bw+Lar/bwSrwLxRsj8sbgspXmphVoXc5D2BgH08Ng6S9
	 f9v9LCph3iUt8llm0DD1GWMp0hYTnsi59FaFSFhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1395F80563;
	Wed,  8 Dec 2021 12:11:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B947CF80568; Wed,  8 Dec 2021 12:11:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B6FFF8055A
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:11:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B6FFF8055A
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="237750434"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="237750434"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:11:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600180"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:11:26 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 12/37] ASoC: Intel: avs: Add power management requests
Date: Wed,  8 Dec 2021 12:12:36 +0100
Message-Id: <20211208111301.1817725-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208111301.1817725-1-cezary.rojewski@intel.com>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

Audio DSP supports low power states i.e.: transitions between D0 and D3
and D0-substates in form of D0i3. That process is a combination of core
and IPC operations. Here, Dx and D0ix IPC handlers are added.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.c | 43 ++++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/messages.h | 16 +++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index e870d5792a77..1b589689410f 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -347,3 +347,46 @@ int avs_ipc_get_large_config(struct avs_dev *adev, u16 module_id, u8 instance_id
 
 	return 0;
 }
+
+int avs_ipc_set_dx(struct avs_dev *adev, u32 core_mask, bool powerup)
+{
+	union avs_module_msg msg = AVS_MODULE_REQUEST(SET_DX);
+	struct avs_ipc_msg request;
+	struct avs_dxstate_info dx;
+	int ret;
+
+	dx.core_mask = core_mask;
+	dx.dx_mask = powerup ? core_mask : 0;
+	request.header = msg.val;
+	request.data = &dx;
+	request.size = sizeof(dx);
+
+	/*
+	 * SET_D0 is sent for non-main cores only while SET_D3 is used to
+	 * suspend for all of them. Both cases prevent any D0I3 transitions.
+	 */
+	ret = avs_dsp_send_pm_msg(adev, &request, NULL, true);
+	if (ret)
+		avs_ipc_err(adev, &request, "set dx", ret);
+
+	return ret;
+}
+
+int avs_ipc_set_d0ix(struct avs_dev *adev, bool enable_pg, bool streaming)
+{
+	union avs_module_msg msg = AVS_MODULE_REQUEST(SET_D0IX);
+	struct avs_ipc_msg request = {0};
+	int ret;
+
+	/* Wake & streaming for < cAVS 2.0 */
+	msg.ext.set_d0ix.wake = enable_pg;
+	msg.ext.set_d0ix.streaming = streaming;
+
+	request.header = msg.val;
+
+	ret = avs_dsp_send_pm_msg(adev, &request, NULL, false);
+	if (ret)
+		avs_ipc_err(adev, &request, "set d0ix", ret);
+
+	return ret;
+}
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 1dabd1005327..bbdba4631b1f 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -101,6 +101,8 @@ enum avs_module_msg_type {
 	AVS_MOD_LARGE_CONFIG_SET = 4,
 	AVS_MOD_BIND = 5,
 	AVS_MOD_UNBIND = 6,
+	AVS_MOD_SET_DX = 7,
+	AVS_MOD_SET_D0IX = 8,
 	AVS_MOD_DELETE_INSTANCE = 11,
 };
 
@@ -137,6 +139,11 @@ union avs_module_msg {
 				u32 dst_queue:3;
 				u32 src_queue:3;
 			} bind_unbind;
+			struct {
+				/* cAVS < 2.0 */
+				u32 wake:1;
+				u32 streaming:1;
+			} set_d0ix;
 		} ext;
 	};
 } __packed;
@@ -298,4 +305,13 @@ int avs_ipc_get_large_config(struct avs_dev *adev, u16 module_id, u8 instance_id
 			     u8 param_id, u8 *request_data, size_t request_size,
 			     u8 **reply_data, size_t *reply_size);
 
+/* DSP cores and domains power management messages */
+struct avs_dxstate_info {
+	u32 core_mask;
+	u32 dx_mask;
+} __packed;
+
+int avs_ipc_set_dx(struct avs_dev *adev, u32 core_mask, bool powerup);
+int avs_ipc_set_d0ix(struct avs_dev *adev, bool enable_pg, bool streaming);
+
 #endif /* __SOUND_SOC_INTEL_AVS_MSGS_H */
-- 
2.25.1

