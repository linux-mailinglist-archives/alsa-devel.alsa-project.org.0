Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 543DD63F64E
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:42:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B796B17EF;
	Thu,  1 Dec 2022 18:41:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B796B17EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669916525;
	bh=+LoYldbAlBuQLqSNH3I+E1iNX5xOO5KcwotqAT4dLhI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=obJiFXydBg2F3bdkt3/S2HO68DuEDybcU3s8MmyGzo+atBjzoMUPT0FjfU5s/+m8y
	 bPZ80Yv1SX0X3R1aIiSHqSHFH0f65j622A9/RZpS7JsqKMyZJDmWH5uuQcNU3j2Jm6
	 DDie6JmC+hJJrj8qybq3gubo3Ziq3+4qWyLXn1OQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AA63F8057B;
	Thu,  1 Dec 2022 18:39:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0945CF80563; Thu,  1 Dec 2022 18:39:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D2C3F8028D
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:39:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D2C3F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZzApFuT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669916374; x=1701452374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+LoYldbAlBuQLqSNH3I+E1iNX5xOO5KcwotqAT4dLhI=;
 b=ZzApFuT2eNY6SifPpCOugw4zosyG691yPnCk8RRRTy+DL4iddZPYKudF
 c5YXaOaOtl0QtV4UzN5zTSdR0FC7ua3rPl+8LodZ2876aXwDecbM6i5i1
 hehKI+C1oFL/kBzuE3AC4wM+XgTOB4IobjmLzjaHZbooncFxsve+sAQpJ
 DmUTofgvHp+WD2TOUCGLgLx/4Mzhy3qUcumCGOfqTITetSUJYGoG+6lQE
 sYyHhpCorHjIKzcDsUQDyRfsrnykkT1yRA4Fi2N+Pv0Etfi3UeT/Cva4D
 AV8NlEy2/XVzvEWGJL6yS2fh8F0IGhUOfWZ05Dlai/wywt2JJ1DLwSk4z Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="377908363"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="377908363"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 09:39:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="889823947"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="889823947"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2022 09:39:29 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 07/16] ASoC: Intel: avs: Make enable_logs() dependent on
 DEBUG_FS
Date: Thu,  1 Dec 2022 18:56:10 +0100
Message-Id: <20221201175619.504758-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221201175619.504758-1-cezary.rojewski@intel.com>
References: <20221201175619.504758-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Without debug filesystem present, this code is redundant.
Operations: log_buffer_status and log_buffer_offset are left as is as
EXCEPTION_CAUGHT and even unexpected LOG_BUFFER_STATUS notifications may
occur without user ever touching debugfs.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/apl.c      |  7 ++++---
 sound/soc/intel/avs/avs.h      |  5 +++++
 sound/soc/intel/avs/messages.c | 36 ++++++++++++++++++----------------
 sound/soc/intel/avs/skl.c      |  7 ++++---
 4 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
index 66672ffd95df..beef308c9428 100644
--- a/sound/soc/intel/avs/apl.c
+++ b/sound/soc/intel/avs/apl.c
@@ -13,8 +13,9 @@
 #include "path.h"
 #include "topology.h"
 
-static int apl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
-			   u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
+static int __maybe_unused
+apl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
+		u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
 {
 	struct apl_log_state_info *info;
 	u32 size, num_cores = adev->hw_cfg.dsp_cores;
@@ -239,10 +240,10 @@ const struct avs_dsp_ops apl_dsp_ops = {
 	.load_basefw = avs_hda_load_basefw,
 	.load_lib = avs_hda_load_library,
 	.transfer_mods = avs_hda_transfer_modules,
-	.enable_logs = apl_enable_logs,
 	.log_buffer_offset = skl_log_buffer_offset,
 	.log_buffer_status = apl_log_buffer_status,
 	.coredump = apl_coredump,
 	.d0ix_toggle = apl_d0ix_toggle,
 	.set_d0ix = apl_set_d0ix,
+	AVS_SET_ENABLE_LOGS_OP(apl)
 };
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 3687d03f87d4..f8f11d8b5936 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -376,10 +376,15 @@ struct apl_log_buffer_layout {
 	(addr + sizeof(struct apl_log_buffer_layout))
 
 #ifdef CONFIG_DEBUG_FS
+#define AVS_SET_ENABLE_LOGS_OP(name) \
+	.enable_logs = name##_enable_logs
+
 bool avs_logging_fw(struct avs_dev *adev);
 void avs_dump_fw_log(struct avs_dev *adev, const void __iomem *src, unsigned int len);
 void avs_dump_fw_log_wakeup(struct avs_dev *adev, const void __iomem *src, unsigned int len);
 #else
+#define AVS_SET_ENABLE_LOGS_OP(name)
+
 static inline bool avs_logging_fw(struct avs_dev *adev)
 {
 	return false;
diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index 6b0fecbf07c3..f734d49e42be 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -685,6 +685,24 @@ int avs_ipc_get_modules_info(struct avs_dev *adev, struct avs_mods_info **info)
 	return 0;
 }
 
+int avs_ipc_copier_set_sink_format(struct avs_dev *adev, u16 module_id,
+				   u8 instance_id, u32 sink_id,
+				   const struct avs_audio_format *src_fmt,
+				   const struct avs_audio_format *sink_fmt)
+{
+	struct avs_copier_sink_format cpr_fmt;
+
+	cpr_fmt.sink_id = sink_id;
+	/* Firmware expects driver to resend copier's input format. */
+	cpr_fmt.src_fmt = *src_fmt;
+	cpr_fmt.sink_fmt = *sink_fmt;
+
+	return avs_ipc_set_large_config(adev, module_id, instance_id,
+					AVS_COPIER_SET_SINK_FORMAT,
+					(u8 *)&cpr_fmt, sizeof(cpr_fmt));
+}
+
+#ifdef CONFIG_DEBUG_FS
 int avs_ipc_set_enable_logs(struct avs_dev *adev, u8 *log_info, size_t size)
 {
 	return avs_ipc_set_large_config(adev, AVS_BASEFW_MOD_ID, AVS_BASEFW_INST_ID,
@@ -704,20 +722,4 @@ int avs_ipc_set_system_time(struct avs_dev *adev)
 	return avs_ipc_set_large_config(adev, AVS_BASEFW_MOD_ID, AVS_BASEFW_INST_ID,
 					AVS_BASEFW_SYSTEM_TIME, (u8 *)&sys_time, sizeof(sys_time));
 }
-
-int avs_ipc_copier_set_sink_format(struct avs_dev *adev, u16 module_id,
-				   u8 instance_id, u32 sink_id,
-				   const struct avs_audio_format *src_fmt,
-				   const struct avs_audio_format *sink_fmt)
-{
-	struct avs_copier_sink_format cpr_fmt;
-
-	cpr_fmt.sink_id = sink_id;
-	/* Firmware expects driver to resend copier's input format. */
-	cpr_fmt.src_fmt = *src_fmt;
-	cpr_fmt.sink_fmt = *sink_fmt;
-
-	return avs_ipc_set_large_config(adev, module_id, instance_id,
-					AVS_COPIER_SET_SINK_FORMAT,
-					(u8 *)&cpr_fmt, sizeof(cpr_fmt));
-}
+#endif
diff --git a/sound/soc/intel/avs/skl.c b/sound/soc/intel/avs/skl.c
index 936cd44eb73e..c5edb0b0df14 100644
--- a/sound/soc/intel/avs/skl.c
+++ b/sound/soc/intel/avs/skl.c
@@ -12,8 +12,9 @@
 #include "avs.h"
 #include "messages.h"
 
-static int skl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
-			   u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
+static int __maybe_unused
+skl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
+		u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
 {
 	struct skl_log_state_info *info;
 	u32 size, num_cores = adev->hw_cfg.dsp_cores;
@@ -111,10 +112,10 @@ const struct avs_dsp_ops skl_dsp_ops = {
 	.load_basefw = avs_cldma_load_basefw,
 	.load_lib = avs_cldma_load_library,
 	.transfer_mods = avs_cldma_transfer_modules,
-	.enable_logs = skl_enable_logs,
 	.log_buffer_offset = skl_log_buffer_offset,
 	.log_buffer_status = skl_log_buffer_status,
 	.coredump = skl_coredump,
 	.d0ix_toggle = skl_d0ix_toggle,
 	.set_d0ix = skl_set_d0ix,
+	AVS_SET_ENABLE_LOGS_OP(skl)
 };
-- 
2.25.1

