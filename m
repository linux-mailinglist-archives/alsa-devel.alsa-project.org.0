Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2894A4D64A1
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 16:31:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B769118FC;
	Fri, 11 Mar 2022 16:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B769118FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647012670;
	bh=LTmt7VEfzGH4E3vCnOtaQ9c8UxiOPtrq3hlf6lcNQYU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mccN4y65zfGWtxRR3ticp7eDIuxNg62HToOGe/BLGSWZGBpf7pfXB2aFR/1QG6fzh
	 fFKj8uVO+mrCFDW5pz2MjOermks38b0NOlA1rnG3EP6a5Dx+fO0CO7hy8SgXmKF6eG
	 Vf0230UbhB1jdaLLNIHI8/VSikJRPdFHdT9McbO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA722F8053E;
	Fri, 11 Mar 2022 16:28:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88215F8053A; Fri, 11 Mar 2022 16:28:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE96CF80536
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 16:28:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE96CF80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Yb2CZpzM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647012485; x=1678548485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LTmt7VEfzGH4E3vCnOtaQ9c8UxiOPtrq3hlf6lcNQYU=;
 b=Yb2CZpzMhdnBGUW6j5UamQG4L9YpUZTonDMPGcqDmp6ugmE25aSxRoiQ
 RDrCFxjc7BDR19S44pOfb98VTG4p4j0n9QP1kNMgiIVqw77L+fLvUFs+p
 r2I4YW9uOjoyhZ0bZvjL/PCtZ7GmB2t1XEfozq2F2vOsl4Ql2vJrLrVoQ
 6ytPVhVoERM2aFk6B+/iYWCh3Rset0Kxmzld9O1tjUaxvi3ZWlogd2Jtr
 uOvhnBGH9FWg89pgTqNMZMp5/PFDGUZbodI9AEy5OinlVP7fEJJBjpQqp
 +Mhs1PT7/2iqh25ViQlpnU9ss5CRQMX8mVs/L1+dPvtml7Xs3e5QyzNbA g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="318813347"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="318813347"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 07:28:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="514532805"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 11 Mar 2022 07:28:01 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 08/17] ASoC: Intel: avs: Add power management requests
Date: Fri, 11 Mar 2022 16:35:35 +0100
Message-Id: <20220311153544.136854-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311153544.136854-1-cezary.rojewski@intel.com>
References: <20220311153544.136854-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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
and D0-substates in form of D0i0 and D0i3. That process is a combination
of core and IPC operations. Here, Dx and D0ix IPC handlers are added.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.c | 44 ++++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/messages.h | 15 ++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index 2e775798a6c3..f51f18d67cfb 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -400,3 +400,47 @@ int avs_ipc_get_large_config(struct avs_dev *adev, u16 module_id, u8 instance_id
 
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
+	ret = avs_dsp_send_msg(adev, &request, NULL);
+	if (ret)
+		avs_ipc_err(adev, &request, "set dx", ret);
+
+	return ret;
+}
+
+/*
+ * avs_ipc_set_d0ix - Set power gating policy (entering D0IX substates)
+ *
+ * @enable_pg: Whether to enable or disable power gating
+ * @streaming: Whether a stream is running when transitioning
+ */
+int avs_ipc_set_d0ix(struct avs_dev *adev, bool enable_pg, bool streaming)
+{
+	union avs_module_msg msg = AVS_MODULE_REQUEST(SET_D0IX);
+	struct avs_ipc_msg request = {{0}};
+	int ret;
+
+	msg.ext.set_d0ix.wake = enable_pg;
+	msg.ext.set_d0ix.streaming = streaming;
+
+	request.header = msg.val;
+
+	ret = avs_dsp_send_msg(adev, &request, NULL);
+	if (ret)
+		avs_ipc_err(adev, &request, "set d0ix", ret);
+
+	return ret;
+}
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index d744fe453033..7ace78ed5980 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -97,6 +97,8 @@ enum avs_module_msg_type {
 	AVS_MOD_LARGE_CONFIG_SET = 4,
 	AVS_MOD_BIND = 5,
 	AVS_MOD_UNBIND = 6,
+	AVS_MOD_SET_DX = 7,
+	AVS_MOD_SET_D0IX = 8,
 	AVS_MOD_DELETE_INSTANCE = 11,
 };
 
@@ -133,6 +135,10 @@ union avs_module_msg {
 				u32 dst_queue:3;
 				u32 src_queue:3;
 			} bind_unbind;
+			struct {
+				u32 wake:1;
+				u32 streaming:1;
+			} set_d0ix;
 		} ext;
 	};
 } __packed;
@@ -289,4 +295,13 @@ int avs_ipc_get_large_config(struct avs_dev *adev, u16 module_id, u8 instance_id
 			     u8 param_id, u8 *request_data, size_t request_size,
 			     u8 **reply_data, size_t *reply_size);
 
+/* DSP cores and domains power management messages */
+struct avs_dxstate_info {
+	u32 core_mask;	/* which cores are subject for power transition */
+	u32 dx_mask;	/* bit[n]=1 core n goes to D0, bit[n]=0 it goes to D3 */
+} __packed;
+
+int avs_ipc_set_dx(struct avs_dev *adev, u32 core_mask, bool powerup);
+int avs_ipc_set_d0ix(struct avs_dev *adev, bool enable_pg, bool streaming);
+
 #endif /* __SOUND_SOC_INTEL_AVS_MSGS_H */
-- 
2.25.1

