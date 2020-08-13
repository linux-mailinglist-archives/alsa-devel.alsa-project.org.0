Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EAF243FB0
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 22:11:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00C301693;
	Thu, 13 Aug 2020 22:10:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00C301693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597349485;
	bh=Y2w9M3Ft6XmyQN0G745zjpbXBUSB6sHW8qvZg62EkZg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HnpSdo7Ny7ZxgP/6MqFFpnpFvQ52W24YTl+MGPdofzWN4bk6xeOJhnLWxdSvvt/Av
	 4QNsXus7KWgBPbCTvf2u7QN+j5AVxt8zEtf3oMRPCqiIdD/Z2VsPumQrmXL3MePHzF
	 eEcSBvKFPFJQ5oXO+f6LtEp4QOY3Bvz1rWeGBUsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BE0AF802F8;
	Thu, 13 Aug 2020 22:02:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C194F80322; Thu, 13 Aug 2020 22:02:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB5B8F800F4
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 22:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB5B8F800F4
IronPort-SDR: 498va7x0CzqT2/yqEvzOC/49yrV9WaiGB1YxEVvwX+57oMppflaDmF+cV0owLg+Sn+Jl2r8y+i
 kZ4FlcCkNzkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="134374658"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="134374658"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:07 -0700
IronPort-SDR: 0T6cIYqfps+gLCvkY/ceuZNu4xVVAMYtECsBbEyTB22d9VcNHaOMMF7B0zUPAbLcIPZk0eLdLf
 74V1W9wU/NsQ==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="495506306"
Received: from jctorres-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.137.200])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:05 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/21] ASoC: Intel: Atom: (cosmetic) align parameters
Date: Thu, 13 Aug 2020 15:01:37 -0500
Message-Id: <20200813200147.61990-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200813200147.61990-1-pierre-louis.bossart@linux.intel.com>
References: <20200813200147.61990-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix cppcheck warnings and use same function parameters in headers and
C code.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/atom/sst-mfld-platform.h |  4 +--
 sound/soc/intel/atom/sst/sst.h           | 34 ++++++++++++------------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform.h b/sound/soc/intel/atom/sst-mfld-platform.h
index 10c9ecfa7038..8b5777d3229a 100644
--- a/sound/soc/intel/atom/sst-mfld-platform.h
+++ b/sound/soc/intel/atom/sst-mfld-platform.h
@@ -173,6 +173,6 @@ struct sst_data {
 	struct snd_soc_card *soc_card;
 	struct sst_cmd_sba_hw_set_ssp ssp_cmd;
 };
-int sst_register_dsp(struct sst_device *sst);
-int sst_unregister_dsp(struct sst_device *sst);
+int sst_register_dsp(struct sst_device *dev);
+int sst_unregister_dsp(struct sst_device *dev);
 #endif
diff --git a/sound/soc/intel/atom/sst/sst.h b/sound/soc/intel/atom/sst/sst.h
index 50441cf6f77d..2bee646e81b8 100644
--- a/sound/soc/intel/atom/sst/sst.h
+++ b/sound/soc/intel/atom/sst/sst.h
@@ -428,34 +428,34 @@ struct intel_sst_ops {
 };
 
 int sst_realloc_stream(struct intel_sst_drv *sst_drv_ctx, int str_id);
-int sst_pause_stream(struct intel_sst_drv *sst_drv_ctx, int id);
-int sst_resume_stream(struct intel_sst_drv *sst_drv_ctx, int id);
-int sst_drop_stream(struct intel_sst_drv *sst_drv_ctx, int id);
-int sst_free_stream(struct intel_sst_drv *sst_drv_ctx, int id);
+int sst_pause_stream(struct intel_sst_drv *sst_drv_ctx, int str_id);
+int sst_resume_stream(struct intel_sst_drv *sst_drv_ctx, int str_id);
+int sst_drop_stream(struct intel_sst_drv *sst_drv_ctx, int str_id);
+int sst_free_stream(struct intel_sst_drv *sst_drv_ctx, int str_id);
 int sst_start_stream(struct intel_sst_drv *sst_drv_ctx, int str_id);
-int sst_send_byte_stream_mrfld(struct intel_sst_drv *ctx,
-			struct snd_sst_bytes_v2 *sbytes);
+int sst_send_byte_stream_mrfld(struct intel_sst_drv *sst_drv_ctx,
+			struct snd_sst_bytes_v2 *bytes);
 int sst_set_stream_param(int str_id, struct snd_sst_params *str_param);
 int sst_set_metadata(int str_id, char *params);
-int sst_get_stream(struct intel_sst_drv *sst_drv_ctx,
+int sst_get_stream(struct intel_sst_drv *ctx,
 		struct snd_sst_params *str_param);
 int sst_get_stream_allocated(struct intel_sst_drv *ctx,
 		struct snd_sst_params *str_param,
 		struct snd_sst_lib_download **lib_dnld);
 int sst_drain_stream(struct intel_sst_drv *sst_drv_ctx,
 		int str_id, bool partial_drain);
-int sst_post_message_mrfld(struct intel_sst_drv *ctx,
-		struct ipc_post *msg, bool sync);
-void sst_process_reply_mrfld(struct intel_sst_drv *ctx, struct ipc_post *msg);
-int sst_start_mrfld(struct intel_sst_drv *ctx);
-int intel_sst_reset_dsp_mrfld(struct intel_sst_drv *ctx);
-void intel_sst_clear_intr_mrfld(struct intel_sst_drv *ctx);
-
-int sst_load_fw(struct intel_sst_drv *ctx);
+int sst_post_message_mrfld(struct intel_sst_drv *sst_drv_ctx,
+		struct ipc_post *ipc_msg, bool sync);
+void sst_process_reply_mrfld(struct intel_sst_drv *sst_drv_ctx, struct ipc_post *msg);
+int sst_start_mrfld(struct intel_sst_drv *sst_drv_ctx);
+int intel_sst_reset_dsp_mrfld(struct intel_sst_drv *sst_drv_ctx);
+void intel_sst_clear_intr_mrfld(struct intel_sst_drv *sst_drv_ctx);
+
+int sst_load_fw(struct intel_sst_drv *sst_drv_ctx);
 int sst_load_library(struct snd_sst_lib_download *lib, u8 ops);
 void sst_post_download_mrfld(struct intel_sst_drv *ctx);
 int sst_get_block_stream(struct intel_sst_drv *sst_drv_ctx);
-void sst_memcpy_free_resources(struct intel_sst_drv *ctx);
+void sst_memcpy_free_resources(struct intel_sst_drv *sst_drv_ctx);
 
 int sst_wait_interruptible(struct intel_sst_drv *sst_drv_ctx,
 				struct sst_block *block);
@@ -490,7 +490,7 @@ int sst_prepare_and_post_msg(struct intel_sst_drv *sst,
 		bool large, bool fill_dsp, bool sync, bool response);
 
 void sst_process_pending_msg(struct work_struct *work);
-int sst_assign_pvt_id(struct intel_sst_drv *sst_drv_ctx);
+int sst_assign_pvt_id(struct intel_sst_drv *drv);
 int sst_validate_strid(struct intel_sst_drv *sst_drv_ctx, int str_id);
 struct stream_info *get_stream_info(struct intel_sst_drv *sst_drv_ctx,
 		int str_id);
-- 
2.25.1

