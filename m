Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6DF640913
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 16:14:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C21BF3;
	Fri,  2 Dec 2022 16:13:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C21BF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669994054;
	bh=+LoYldbAlBuQLqSNH3I+E1iNX5xOO5KcwotqAT4dLhI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GUghXzYMYwknrHjN3IHsCzioRmB7eVX8CMs8hque8eeeIWM1jVHmLHToaYZUJHSHz
	 /iALkA74O3aIv5jTv4qU6mgUUkFvnFGpAxz4WvOGzRdKdJ00adnGtDzHGqcGLj+66j
	 CwzeSiqcGw5a2AkpyS0hXFcxuzu+Ahdimo0nZUv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5681AF80570;
	Fri,  2 Dec 2022 16:11:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FE1EF80570; Fri,  2 Dec 2022 16:11:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22082F80570
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 16:11:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22082F80570
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="D4CgQepM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669993909; x=1701529909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+LoYldbAlBuQLqSNH3I+E1iNX5xOO5KcwotqAT4dLhI=;
 b=D4CgQepMdA1TGXFWqLnq1h26GCb2+bzTIiOkAZFUE1Ib55vihnEn17qO
 gPWH3uSjSoAWtmnS3AZ84k+UkhxcIhdz0eIMBneDIEYW75QnUcoLXlACC
 5FD0W1113mN0iA5BNIpygDjSLGaWx5LXdy5kfQqv91qiFUqkw4Cd5o1+A
 9iU4p4sBhW6bQxosaWrykaGZEy7MqCseQ4x+ouqWD18TJNQTZuuQy9upj
 Y/9vdYEQB1d9jsvaoXAcXJdyZ+Vz57oDUrXhmyeXDCMbprMB8jX4leo/Q
 523LtgYaCQNDFqKyNWahcNkTk5UeptaxtshJJAfGoFCiHn2UZVHtXK7D/ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="402251767"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="402251767"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 07:11:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="708504712"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="708504712"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2022 07:11:45 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 07/16] ASoC: Intel: avs: Make enable_logs() dependent on
 DEBUG_FS
Date: Fri,  2 Dec 2022 16:28:32 +0100
Message-Id: <20221202152841.672536-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221202152841.672536-1-cezary.rojewski@intel.com>
References: <20221202152841.672536-1-cezary.rojewski@intel.com>
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

