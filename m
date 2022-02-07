Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C344ABE84
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 13:22:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF14116EC;
	Mon,  7 Feb 2022 13:21:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF14116EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644236566;
	bh=HcpHWn5Hq4iwDwMmOebdPGfdHQXCnrT5YnpgCdVSJJk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OYEfgDYyjyiX3Jm/tcSTgTsIC0v/saiFNGARwxbeqxo5Gc8qrO3HFOx7wW7jhE4Ll
	 qe/edL2dTiKyzcpqF5DDAz+EMM0OR2Vh2M2ywvEoMkGkzEGlrfow3FuZMhZeEhNyax
	 aH7LfIH0i68S6A03y/X4bmcpWqxLef6bZ8QuFyZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88FB1F8051C;
	Mon,  7 Feb 2022 13:19:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D53C6F8051A; Mon,  7 Feb 2022 13:19:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CCD6F80519
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 13:19:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CCD6F80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cplV8jE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644236371; x=1675772371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HcpHWn5Hq4iwDwMmOebdPGfdHQXCnrT5YnpgCdVSJJk=;
 b=cplV8jE2xkREYY+nNpywYguhvujmEWQxisQj/FiQHz5xdaO1mn9elPZ8
 R895ANyMw/e2rBUQ6jQVfuPTuWAAUsoGJMLgJXCMRLhWAUngBNBReinHF
 zlDkfrcT0L2Evu6SNsE74stz3a+3PgDpfDtyir2gAn2JtElfdIiCdM7kh
 7ieOuiVXcKhwTc/3aVpu02Advr9Jxu8QtsmU8fCPZC3XLZFZWI1WNFMKq
 PS8HjKaa6BTgA+Wf1bjeIzg41tGVE/qLKk7f8zfatCXTnGrih9XeTd6Vi
 Wt0n+iQpSWob26W9PFeaJQ9MV7KUMvI67CmbhNfJawu5U+6aQ0TMrV4kC w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="248914832"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="248914832"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 04:19:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="525112506"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 07 Feb 2022 04:19:14 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/17] ASoC: Intel: avs: Add power management requests
Date: Mon,  7 Feb 2022 13:20:59 +0100
Message-Id: <20220207122108.3780926-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207122108.3780926-1-cezary.rojewski@intel.com>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

