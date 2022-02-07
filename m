Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7126A4ABE83
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 13:22:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 079FD16D2;
	Mon,  7 Feb 2022 13:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 079FD16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644236539;
	bh=Yn144WF6zBViJm5R64PcXJTQhr+2vz5MwG0180TiVNY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p9m4vSa308GkYIXO0Y49V8uZNZQhvNHYRaxAvEoIpN2oK7Q4PyrvFwnFlTNF/0K6v
	 ytBFhDU5H/X/lVt/4GuL419kBQdxZQCjvCuAcIQqpq50ESLbbQBMIN4kw19EKuX0ks
	 76XNEa/IQXYMsZMMjsApCBVXOO+xffmweJS1qHwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84C3DF80537;
	Mon,  7 Feb 2022 13:19:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0E5DF8051C; Mon,  7 Feb 2022 13:19:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C353F800F5
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 13:19:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C353F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gltJfOPI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644236373; x=1675772373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yn144WF6zBViJm5R64PcXJTQhr+2vz5MwG0180TiVNY=;
 b=gltJfOPINpUTq02CQnfxCKUNp3P70NoGRh+7LeYVd08Udrdr102ZftNH
 vwu1LwvwagUK3Kn5O1DVOlKJD1o13CtWoHg2puu5yuu2r/g6C4IwRH4cf
 +fAo3ard3KFsZbvh0l0VyJQ1uSpa/FZkvL5xfniRgimqfB4yAonhQv22w
 zUgwAYORM8eJSyzUUY+eJY/23OzghK0jR6NKP3tRJZrs2DvPGzYUPhxDZ
 z7oGXqti6of6qwzcpZF/TdCCrn7r45iRIBa0pgROtrXNlLZjh9/x15/F2
 k305ftsWCFMRwSH0xEauxMqMORNVIpI+r4MUgfBwCLejh7eQIeUu+Wph6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="248914835"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="248914835"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 04:19:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="525112540"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 07 Feb 2022 04:19:18 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/17] ASoC: Intel: avs: Add ROM requests
Date: Mon,  7 Feb 2022 13:21:00 +0100
Message-Id: <20220207122108.3780926-10-cezary.rojewski@intel.com>
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
index 1b589689410f..b7a4ba6717b7 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -12,6 +12,24 @@
 
 #define AVS_CL_TIMEOUT_MS	5000
 
+int avs_ipc_set_boot_config(struct avs_dev *adev, u32 dma_id, u32 purge)
+{
+	union avs_global_msg msg = AVS_GLOBAL_REQUEST(ROM_CONTROL);
+	struct avs_ipc_msg request = {0};
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
index bbdba4631b1f..580229772395 100644
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
@@ -260,6 +267,13 @@ struct avs_notify_mod_data {
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

