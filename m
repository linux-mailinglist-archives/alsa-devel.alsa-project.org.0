Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C814D3B25
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 21:34:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F5491813;
	Wed,  9 Mar 2022 21:33:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F5491813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646858049;
	bh=qaTyULVfHaLm3NVsFZ3HMvVFK2rbsy3kPt3ceZY5Hj4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=te8AmBSHN5a7uY5POHjo8SuiGB/+7I2jZFPTCkCuYZr3Y1vd1PJgu3srYee6S7S1D
	 +G1pVPUnYFDM+7RGqJUSn7Macv1Wn+lfprg/I6hybu6SCpD0zWC/dqYURqGSfUCIvg
	 4kH2bGItlhb08c3dKGXrFdesBjc4u2vywkdBjsrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8D7AF80558;
	Wed,  9 Mar 2022 21:30:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DF32F80549; Wed,  9 Mar 2022 21:30:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7C8BF8053B
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 21:30:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7C8BF8053B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TA6gW6Oh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646857830; x=1678393830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qaTyULVfHaLm3NVsFZ3HMvVFK2rbsy3kPt3ceZY5Hj4=;
 b=TA6gW6OhrG8JkfLV1eu7xzIoQB/HB6W3Hon+jWtdVFuktlfNKXJBeJf/
 bTmhZOcJi+UPqdWenHJ6x0AIDHU0YePckuhXrD3nsVrnSf8/wqFGcZLvJ
 jSi6ATOYDsayw1L+iWUDs2Uh/WQFWxPV+ZBA61j4rrzvInE7mhbpFTKbz
 LSKQS7LYuCdnCTvPGaJVghbfmQCrqs4feCoAYml9nzgeeNNg2sOLeGnmK
 mbpz3PWZznETMnc7ixRMeCzgGkVCpuJAHNgFeAFcUo1MJLm47VOq0gSut
 eKiRIghiMBJFzQxICtGtJuVbpEeiuhGaDvKRv30/7JEJtzozeaVgqjq8o g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="255028758"
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="255028758"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 12:30:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="578527179"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga001.jf.intel.com with ESMTP; 09 Mar 2022 12:30:24 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 09/17] ASoC: Intel: avs: Add ROM requests
Date: Wed,  9 Mar 2022 21:40:21 +0100
Message-Id: <20220309204029.89040-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220309204029.89040-1-cezary.rojewski@intel.com>
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
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

ROM requests are messages initiated by Host to alter firmware early boot
process. They specify whether the next boot should be a fresh start or if
IMR can be used to speed things up.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.c | 18 ++++++++++++++++++
 sound/soc/intel/avs/messages.h | 14 ++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index e8f441b28d71..f7d00e541323 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -12,6 +12,24 @@
 
 #define AVS_CL_TIMEOUT_MS	5000
 
+int avs_ipc_set_boot_config(struct avs_dev *adev, u32 dma_id, u32 purge)
+{
+	union avs_global_msg msg = AVS_GLOBAL_REQUEST(ROM_CONTROL);
+	struct avs_ipc_msg request = {{0}};
+	int ret;
+
+	msg.boot_cfg.rom_ctrl_msg_type = AVS_ROM_SET_BOOT_CONFIG;
+	msg.boot_cfg.dma_id = dma_id;
+	msg.boot_cfg.purge_request = purge;
+	request.header = msg.val;
+
+	ret = avs_dsp_send_rom_msg(adev, &request);
+	if (ret)
+		avs_ipc_err(adev, &request, "set boot config", ret);
+
+	return ret;
+}
+
 int avs_ipc_load_modules(struct avs_dev *adev, u16 *mod_ids, u32 num_mod_ids)
 {
 	union avs_global_msg msg = AVS_GLOBAL_REQUEST(LOAD_MULTIPLE_MODULES);
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 69920f5e802b..615a61cef4f6 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -24,6 +24,7 @@ enum avs_msg_direction {
 };
 
 enum avs_global_msg_type {
+	AVS_GLB_ROM_CONTROL = 1,
 	AVS_GLB_LOAD_MULTIPLE_MODULES = 15,
 	AVS_GLB_UNLOAD_MULTIPLE_MODULES = 16,
 	AVS_GLB_CREATE_PIPELINE = 17,
@@ -45,6 +46,12 @@ union avs_global_msg {
 				u32 msg_direction:1;
 				u32 msg_target:1;
 			};
+			/* set boot config */
+			struct {
+				u32 rom_ctrl_msg_type:9;
+				u32 dma_id:5;
+				u32 purge_request:1;
+			} boot_cfg;
 			/* module loading */
 			struct {
 				u32 mod_cnt:8;
@@ -255,6 +262,13 @@ struct avs_notify_mod_data {
 	u32 data[];
 } __packed;
 
+/* ROM messages */
+enum avs_rom_control_msg_type {
+	AVS_ROM_SET_BOOT_CONFIG = 0,
+};
+
+int avs_ipc_set_boot_config(struct avs_dev *adev, u32 dma_id, u32 purge);
+
 /* Code loading messages */
 int avs_ipc_load_modules(struct avs_dev *adev, u16 *mod_ids, u32 num_mod_ids);
 int avs_ipc_unload_modules(struct avs_dev *adev, u16 *mod_ids, u32 num_mod_ids);
-- 
2.25.1

