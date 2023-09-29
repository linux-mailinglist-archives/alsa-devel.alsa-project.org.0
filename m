Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A677B3153
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 13:26:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3019DEE;
	Fri, 29 Sep 2023 13:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3019DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695986799;
	bh=2eC/pDdXmqeCZgHb5SmIzEM/IqoWfbYMuUrEu4qs/94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A25LAY6nnS9gR0O4YgndtGPVR2Y41ZpnLIyjTfa/Jg0hvy6BAqM1ODFcbLZeoA/4d
	 7eIHqf2zGzK5wh0x15JX4CbiRHAM5dgCf0stM8DoG7OhdRdwfaDLfdiRRXRJbD8AV1
	 i+2uEEwOKLD7Jh8XJ1UPNgjZoMX3/i/AqkN/RDzY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2E67F80571; Fri, 29 Sep 2023 13:24:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3F7AF8055A;
	Fri, 29 Sep 2023 13:24:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67600F8047D; Fri, 29 Sep 2023 13:24:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E02ABF800AE
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 13:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E02ABF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=F1Je6PJj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695986678; x=1727522678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2eC/pDdXmqeCZgHb5SmIzEM/IqoWfbYMuUrEu4qs/94=;
  b=F1Je6PJjgpolvMHkNcimU5x4icerb1vz2JKrtlnmV1a/uJtH4z+zCn4v
   ikClIZ8fbpMkVjZ8W1Jsat7rwqGbIY7xjV1STVyo3WyMcHCbWHaQu1SaP
   dOeJSMezrftWKniRMzgYXa5Lyy3ZZwDAiF2pEJIEhvwW8nNg3IC/Eq8H5
   BVHIDwqIANQJfS1IS7sNbY/EcAN2CkAg4HrnlnnoWBh+dO1DlE4VvqS2l
   E/pbUqM9YJhwhuqUtqKJuzyKO3XoxGiTYfeA1yLO+LZGDQPrHngKrD/3/
   JNAs7lQXQ7Sw/uL9m8xwSoEUzmjPV0DG5wZsLnuWBIpIV7IxpEx30ICg8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="880236"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="880236"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 04:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="753353640"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="753353640"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga007.fm.intel.com with ESMTP; 29 Sep 2023 04:24:28 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 1/6] ASoC: Intel: avs: Move IPC error messages one level down
Date: Fri, 29 Sep 2023 13:24:31 +0200
Message-Id: <20230929112436.787058-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929112436.787058-1-amadeuszx.slawinski@linux.intel.com>
References: <20230929112436.787058-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H6UJI72LRLWPCY3EFP2T4ULFIVMGH2EZ
X-Message-ID-Hash: H6UJI72LRLWPCY3EFP2T4ULFIVMGH2EZ
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H6UJI72LRLWPCY3EFP2T4ULFIVMGH2EZ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Cezary Rojewski <cezary.rojewski@intel.com>

Code size can be reduced if avs_dsp_send_xxx_msg()s take responsibility
for dumping logs in case of an IPC message failure. In consequence,
avs_ipc_err() helper is removed.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/avs.h      |  37 +++--------
 sound/soc/intel/avs/ipc.c      |  52 ++++++++++-----
 sound/soc/intel/avs/messages.c | 112 ++++++---------------------------
 3 files changed, 65 insertions(+), 136 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 0cf38c9e768e..0012f989b24f 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -224,39 +224,22 @@ struct avs_ipc {
 #define AVS_IPC_RET(ret) \
 	(((ret) <= 0) ? (ret) : -AVS_EIPC)
 
-static inline void avs_ipc_err(struct avs_dev *adev, struct avs_ipc_msg *tx,
-			       const char *name, int error)
-{
-	/*
-	 * If IPC channel is blocked e.g.: due to ongoing recovery,
-	 * -EPERM error code is expected and thus it's not an actual error.
-	 *
-	 * Unsupported IPCs are of no harm either.
-	 */
-	if (error == -EPERM || error == AVS_IPC_NOT_SUPPORTED)
-		dev_dbg(adev->dev, "%s 0x%08x 0x%08x failed: %d\n", name,
-			tx->glb.primary, tx->glb.ext.val, error);
-	else
-		dev_err(adev->dev, "%s 0x%08x 0x%08x failed: %d\n", name,
-			tx->glb.primary, tx->glb.ext.val, error);
-}
-
 irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id);
 irqreturn_t avs_dsp_irq_thread(int irq, void *dev_id);
 void avs_dsp_process_response(struct avs_dev *adev, u64 header);
-int avs_dsp_send_msg_timeout(struct avs_dev *adev,
-			     struct avs_ipc_msg *request,
-			     struct avs_ipc_msg *reply, int timeout);
-int avs_dsp_send_msg(struct avs_dev *adev,
-		     struct avs_ipc_msg *request, struct avs_ipc_msg *reply);
+int avs_dsp_send_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request,
+			     struct avs_ipc_msg *reply, int timeout, const char *name);
+int avs_dsp_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
+		     struct avs_ipc_msg *reply, const char *name);
 /* Two variants below are for messages that control DSP power states. */
 int avs_dsp_send_pm_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request,
-				struct avs_ipc_msg *reply, int timeout, bool wake_d0i0);
+				struct avs_ipc_msg *reply, int timeout, bool wake_d0i0,
+				const char *name);
 int avs_dsp_send_pm_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
-			struct avs_ipc_msg *reply, bool wake_d0i0);
-int avs_dsp_send_rom_msg_timeout(struct avs_dev *adev,
-				 struct avs_ipc_msg *request, int timeout);
-int avs_dsp_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg *request);
+			struct avs_ipc_msg *reply, bool wake_d0i0, const char *name);
+int avs_dsp_send_rom_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request, int timeout,
+				 const char *name);
+int avs_dsp_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg *request, const char *name);
 void avs_dsp_interrupt_control(struct avs_dev *adev, bool enable);
 int avs_ipc_init(struct avs_ipc *ipc, struct device *dev);
 void avs_ipc_block(struct avs_ipc *ipc);
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index bdf013c3dd12..65bfc83bd1f0 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -455,7 +455,7 @@ static void avs_dsp_send_tx(struct avs_dev *adev, struct avs_ipc_msg *tx, bool r
 }
 
 static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
-			       struct avs_ipc_msg *reply, int timeout)
+			       struct avs_ipc_msg *reply, int timeout, const char *name)
 {
 	struct avs_ipc *ipc = adev->ipc;
 	int ret;
@@ -482,6 +482,19 @@ static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request
 	}
 
 	ret = ipc->rx.rsp.status;
+	/*
+	 * If IPC channel is blocked e.g.: due to ongoing recovery,
+	 * -EPERM error code is expected and thus it's not an actual error.
+	 *
+	 * Unsupported IPCs are of no harm either.
+	 */
+	if (ret == -EPERM || ret == AVS_IPC_NOT_SUPPORTED)
+		dev_dbg(adev->dev, "%s (0x%08x 0x%08x) failed: %d\n",
+			name, request->glb.primary, request->glb.ext.val, ret);
+	else if (ret)
+		dev_err(adev->dev, "%s (0x%08x 0x%08x) failed: %d\n",
+			name, request->glb.primary, request->glb.ext.val, ret);
+
 	if (reply) {
 		reply->header = ipc->rx.header;
 		reply->size = ipc->rx.size;
@@ -496,7 +509,7 @@ static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request
 
 static int avs_dsp_send_msg_sequence(struct avs_dev *adev, struct avs_ipc_msg *request,
 				     struct avs_ipc_msg *reply, int timeout, bool wake_d0i0,
-				     bool schedule_d0ix)
+				     bool schedule_d0ix, const char *name)
 {
 	int ret;
 
@@ -507,7 +520,7 @@ static int avs_dsp_send_msg_sequence(struct avs_dev *adev, struct avs_ipc_msg *r
 			return ret;
 	}
 
-	ret = avs_dsp_do_send_msg(adev, request, reply, timeout);
+	ret = avs_dsp_do_send_msg(adev, request, reply, timeout, name);
 	if (ret)
 		return ret;
 
@@ -519,34 +532,37 @@ static int avs_dsp_send_msg_sequence(struct avs_dev *adev, struct avs_ipc_msg *r
 }
 
 int avs_dsp_send_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request,
-			     struct avs_ipc_msg *reply, int timeout)
+			     struct avs_ipc_msg *reply, int timeout, const char *name)
 {
 	bool wake_d0i0 = avs_dsp_op(adev, d0ix_toggle, request, true);
 	bool schedule_d0ix = avs_dsp_op(adev, d0ix_toggle, request, false);
 
-	return avs_dsp_send_msg_sequence(adev, request, reply, timeout, wake_d0i0, schedule_d0ix);
+	return avs_dsp_send_msg_sequence(adev, request, reply, timeout, wake_d0i0, schedule_d0ix,
+					 name);
 }
 
 int avs_dsp_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
-		     struct avs_ipc_msg *reply)
+		     struct avs_ipc_msg *reply, const char *name)
 {
-	return avs_dsp_send_msg_timeout(adev, request, reply, adev->ipc->default_timeout_ms);
+	return avs_dsp_send_msg_timeout(adev, request, reply, adev->ipc->default_timeout_ms, name);
 }
 
 int avs_dsp_send_pm_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request,
-				struct avs_ipc_msg *reply, int timeout, bool wake_d0i0)
+				struct avs_ipc_msg *reply, int timeout, bool wake_d0i0,
+				const char *name)
 {
-	return avs_dsp_send_msg_sequence(adev, request, reply, timeout, wake_d0i0, false);
+	return avs_dsp_send_msg_sequence(adev, request, reply, timeout, wake_d0i0, false, name);
 }
 
 int avs_dsp_send_pm_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
-			struct avs_ipc_msg *reply, bool wake_d0i0)
+			struct avs_ipc_msg *reply, bool wake_d0i0, const char *name)
 {
 	return avs_dsp_send_pm_msg_timeout(adev, request, reply, adev->ipc->default_timeout_ms,
-					   wake_d0i0);
+					   wake_d0i0, name);
 }
 
-static int avs_dsp_do_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg *request, int timeout)
+static int avs_dsp_do_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg *request, int timeout,
+				   const char *name)
 {
 	struct avs_ipc *ipc = adev->ipc;
 	int ret;
@@ -568,20 +584,24 @@ static int avs_dsp_do_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg *req
 		ret = wait_for_completion_timeout(&ipc->done_completion, msecs_to_jiffies(timeout));
 		ret = ret ? 0 : -ETIMEDOUT;
 	}
+	if (ret)
+		dev_err(adev->dev, "%s (0x%08x 0x%08x) failed: %d\n",
+			name, request->glb.primary, request->glb.ext.val, ret);
 
 	mutex_unlock(&ipc->msg_mutex);
 
 	return ret;
 }
 
-int avs_dsp_send_rom_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request, int timeout)
+int avs_dsp_send_rom_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request, int timeout,
+				 const char *name)
 {
-	return avs_dsp_do_send_rom_msg(adev, request, timeout);
+	return avs_dsp_do_send_rom_msg(adev, request, timeout, name);
 }
 
-int avs_dsp_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg *request)
+int avs_dsp_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg *request, const char *name)
 {
-	return avs_dsp_send_rom_msg_timeout(adev, request, adev->ipc->default_timeout_ms);
+	return avs_dsp_send_rom_msg_timeout(adev, request, adev->ipc->default_timeout_ms, name);
 }
 
 void avs_dsp_interrupt_control(struct avs_dev *adev, bool enable)
diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index f887ab5b0311..06b4394cabd2 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -16,71 +16,52 @@ int avs_ipc_set_boot_config(struct avs_dev *adev, u32 dma_id, u32 purge)
 {
 	union avs_global_msg msg = AVS_GLOBAL_REQUEST(ROM_CONTROL);
 	struct avs_ipc_msg request = {{0}};
-	int ret;
 
 	msg.boot_cfg.rom_ctrl_msg_type = AVS_ROM_SET_BOOT_CONFIG;
 	msg.boot_cfg.dma_id = dma_id;
 	msg.boot_cfg.purge_request = purge;
 	request.header = msg.val;
 
-	ret = avs_dsp_send_rom_msg(adev, &request);
-	if (ret)
-		avs_ipc_err(adev, &request, "set boot config", ret);
-
-	return ret;
+	return avs_dsp_send_rom_msg(adev, &request, "set boot config");
 }
 
 int avs_ipc_load_modules(struct avs_dev *adev, u16 *mod_ids, u32 num_mod_ids)
 {
 	union avs_global_msg msg = AVS_GLOBAL_REQUEST(LOAD_MULTIPLE_MODULES);
 	struct avs_ipc_msg request;
-	int ret;
 
 	msg.load_multi_mods.mod_cnt = num_mod_ids;
 	request.header = msg.val;
 	request.data = mod_ids;
 	request.size = sizeof(*mod_ids) * num_mod_ids;
 
-	ret = avs_dsp_send_msg_timeout(adev, &request, NULL, AVS_CL_TIMEOUT_MS);
-	if (ret)
-		avs_ipc_err(adev, &request, "load multiple modules", ret);
-
-	return ret;
+	return avs_dsp_send_msg_timeout(adev, &request, NULL, AVS_CL_TIMEOUT_MS,
+					"load multiple modules");
 }
 
 int avs_ipc_unload_modules(struct avs_dev *adev, u16 *mod_ids, u32 num_mod_ids)
 {
 	union avs_global_msg msg = AVS_GLOBAL_REQUEST(UNLOAD_MULTIPLE_MODULES);
 	struct avs_ipc_msg request;
-	int ret;
 
 	msg.load_multi_mods.mod_cnt = num_mod_ids;
 	request.header = msg.val;
 	request.data = mod_ids;
 	request.size = sizeof(*mod_ids) * num_mod_ids;
 
-	ret = avs_dsp_send_msg(adev, &request, NULL);
-	if (ret)
-		avs_ipc_err(adev, &request, "unload multiple modules", ret);
-
-	return ret;
+	return avs_dsp_send_msg(adev, &request, NULL, "unload multiple modules");
 }
 
 int avs_ipc_load_library(struct avs_dev *adev, u32 dma_id, u32 lib_id)
 {
 	union avs_global_msg msg = AVS_GLOBAL_REQUEST(LOAD_LIBRARY);
 	struct avs_ipc_msg request = {{0}};
-	int ret;
 
 	msg.load_lib.dma_id = dma_id;
 	msg.load_lib.lib_id = lib_id;
 	request.header = msg.val;
 
-	ret = avs_dsp_send_msg_timeout(adev, &request, NULL, AVS_CL_TIMEOUT_MS);
-	if (ret)
-		avs_ipc_err(adev, &request, "load library", ret);
-
-	return ret;
+	return avs_dsp_send_msg_timeout(adev, &request, NULL, AVS_CL_TIMEOUT_MS, "load library");
 }
 
 int avs_ipc_create_pipeline(struct avs_dev *adev, u16 req_size, u8 priority,
@@ -88,7 +69,6 @@ int avs_ipc_create_pipeline(struct avs_dev *adev, u16 req_size, u8 priority,
 {
 	union avs_global_msg msg = AVS_GLOBAL_REQUEST(CREATE_PIPELINE);
 	struct avs_ipc_msg request = {{0}};
-	int ret;
 
 	msg.create_ppl.ppl_mem_size = req_size;
 	msg.create_ppl.ppl_priority = priority;
@@ -97,27 +77,18 @@ int avs_ipc_create_pipeline(struct avs_dev *adev, u16 req_size, u8 priority,
 	msg.ext.create_ppl.attributes = attributes;
 	request.header = msg.val;
 
-	ret = avs_dsp_send_msg(adev, &request, NULL);
-	if (ret)
-		avs_ipc_err(adev, &request, "create pipeline", ret);
-
-	return ret;
+	return avs_dsp_send_msg(adev, &request, NULL, "create pipeline");
 }
 
 int avs_ipc_delete_pipeline(struct avs_dev *adev, u8 instance_id)
 {
 	union avs_global_msg msg = AVS_GLOBAL_REQUEST(DELETE_PIPELINE);
 	struct avs_ipc_msg request = {{0}};
-	int ret;
 
 	msg.ppl.instance_id = instance_id;
 	request.header = msg.val;
 
-	ret = avs_dsp_send_msg(adev, &request, NULL);
-	if (ret)
-		avs_ipc_err(adev, &request, "delete pipeline", ret);
-
-	return ret;
+	return avs_dsp_send_msg(adev, &request, NULL, "delete pipeline");
 }
 
 int avs_ipc_set_pipeline_state(struct avs_dev *adev, u8 instance_id,
@@ -125,17 +96,12 @@ int avs_ipc_set_pipeline_state(struct avs_dev *adev, u8 instance_id,
 {
 	union avs_global_msg msg = AVS_GLOBAL_REQUEST(SET_PIPELINE_STATE);
 	struct avs_ipc_msg request = {{0}};
-	int ret;
 
 	msg.set_ppl_state.ppl_id = instance_id;
 	msg.set_ppl_state.state = state;
 	request.header = msg.val;
 
-	ret = avs_dsp_send_msg(adev, &request, NULL);
-	if (ret)
-		avs_ipc_err(adev, &request, "set pipeline state", ret);
-
-	return ret;
+	return avs_dsp_send_msg(adev, &request, NULL, "set pipeline state");
 }
 
 int avs_ipc_get_pipeline_state(struct avs_dev *adev, u8 instance_id,
@@ -149,13 +115,9 @@ int avs_ipc_get_pipeline_state(struct avs_dev *adev, u8 instance_id,
 	msg.get_ppl_state.ppl_id = instance_id;
 	request.header = msg.val;
 
-	ret = avs_dsp_send_msg(adev, &request, &reply);
-	if (ret) {
-		avs_ipc_err(adev, &request, "get pipeline state", ret);
-		return ret;
-	}
-
-	*state = reply.rsp.ext.get_ppl_state.state;
+	ret = avs_dsp_send_msg(adev, &request, &reply, "get pipeline state");
+	if (!ret)
+		*state = reply.rsp.ext.get_ppl_state.state;
 	return ret;
 }
 
@@ -183,7 +145,6 @@ int avs_ipc_init_instance(struct avs_dev *adev, u16 module_id, u8 instance_id,
 {
 	union avs_module_msg msg = AVS_MODULE_REQUEST(INIT_INSTANCE);
 	struct avs_ipc_msg request;
-	int ret;
 
 	msg.module_id = module_id;
 	msg.instance_id = instance_id;
@@ -197,11 +158,7 @@ int avs_ipc_init_instance(struct avs_dev *adev, u16 module_id, u8 instance_id,
 	request.data = param;
 	request.size = param_size;
 
-	ret = avs_dsp_send_msg(adev, &request, NULL);
-	if (ret)
-		avs_ipc_err(adev, &request, "init instance", ret);
-
-	return ret;
+	return avs_dsp_send_msg(adev, &request, NULL, "init instance");
 }
 
 /*
@@ -222,17 +179,12 @@ int avs_ipc_delete_instance(struct avs_dev *adev, u16 module_id, u8 instance_id)
 {
 	union avs_module_msg msg = AVS_MODULE_REQUEST(DELETE_INSTANCE);
 	struct avs_ipc_msg request = {{0}};
-	int ret;
 
 	msg.module_id = module_id;
 	msg.instance_id = instance_id;
 	request.header = msg.val;
 
-	ret = avs_dsp_send_msg(adev, &request, NULL);
-	if (ret)
-		avs_ipc_err(adev, &request, "delete instance", ret);
-
-	return ret;
+	return avs_dsp_send_msg(adev, &request, NULL, "delete instance");
 }
 
 /*
@@ -252,7 +204,6 @@ int avs_ipc_bind(struct avs_dev *adev, u16 module_id, u8 instance_id,
 {
 	union avs_module_msg msg = AVS_MODULE_REQUEST(BIND);
 	struct avs_ipc_msg request = {{0}};
-	int ret;
 
 	msg.module_id = module_id;
 	msg.instance_id = instance_id;
@@ -262,11 +213,7 @@ int avs_ipc_bind(struct avs_dev *adev, u16 module_id, u8 instance_id,
 	msg.ext.bind_unbind.src_queue = src_queue;
 	request.header = msg.val;
 
-	ret = avs_dsp_send_msg(adev, &request, NULL);
-	if (ret)
-		avs_ipc_err(adev, &request, "bind modules", ret);
-
-	return ret;
+	return avs_dsp_send_msg(adev, &request, NULL, "bind modules");
 }
 
 /*
@@ -286,7 +233,6 @@ int avs_ipc_unbind(struct avs_dev *adev, u16 module_id, u8 instance_id,
 {
 	union avs_module_msg msg = AVS_MODULE_REQUEST(UNBIND);
 	struct avs_ipc_msg request = {{0}};
-	int ret;
 
 	msg.module_id = module_id;
 	msg.instance_id = instance_id;
@@ -296,11 +242,7 @@ int avs_ipc_unbind(struct avs_dev *adev, u16 module_id, u8 instance_id,
 	msg.ext.bind_unbind.src_queue = src_queue;
 	request.header = msg.val;
 
-	ret = avs_dsp_send_msg(adev, &request, NULL);
-	if (ret)
-		avs_ipc_err(adev, &request, "unbind modules", ret);
-
-	return ret;
+	return avs_dsp_send_msg(adev, &request, NULL, "unbind modules");
 }
 
 static int __avs_ipc_set_large_config(struct avs_dev *adev, u16 module_id, u8 instance_id,
@@ -309,7 +251,6 @@ static int __avs_ipc_set_large_config(struct avs_dev *adev, u16 module_id, u8 in
 {
 	union avs_module_msg msg = AVS_MODULE_REQUEST(LARGE_CONFIG_SET);
 	struct avs_ipc_msg request;
-	int ret;
 
 	msg.module_id = module_id;
 	msg.instance_id = instance_id;
@@ -322,11 +263,7 @@ static int __avs_ipc_set_large_config(struct avs_dev *adev, u16 module_id, u8 in
 	request.data = request_data;
 	request.size = request_size;
 
-	ret = avs_dsp_send_msg(adev, &request, NULL);
-	if (ret)
-		avs_ipc_err(adev, &request, "large config set", ret);
-
-	return ret;
+	return avs_dsp_send_msg(adev, &request, NULL, "large config set");
 }
 
 int avs_ipc_set_large_config(struct avs_dev *adev, u16 module_id,
@@ -398,9 +335,8 @@ int avs_ipc_get_large_config(struct avs_dev *adev, u16 module_id, u8 instance_id
 	request.size = request_size;
 	reply.size = AVS_MAILBOX_SIZE;
 
-	ret = avs_dsp_send_msg(adev, &request, &reply);
+	ret = avs_dsp_send_msg(adev, &request, &reply, "large config get");
 	if (ret) {
-		avs_ipc_err(adev, &request, "large config get", ret);
 		kfree(reply.data);
 		return ret;
 	}
@@ -422,7 +358,6 @@ int avs_ipc_set_dx(struct avs_dev *adev, u32 core_mask, bool powerup)
 	union avs_module_msg msg = AVS_MODULE_REQUEST(SET_DX);
 	struct avs_ipc_msg request;
 	struct avs_dxstate_info dx;
-	int ret;
 
 	dx.core_mask = core_mask;
 	dx.dx_mask = powerup ? core_mask : 0;
@@ -430,11 +365,7 @@ int avs_ipc_set_dx(struct avs_dev *adev, u32 core_mask, bool powerup)
 	request.data = &dx;
 	request.size = sizeof(dx);
 
-	ret = avs_dsp_send_pm_msg(adev, &request, NULL, true);
-	if (ret)
-		avs_ipc_err(adev, &request, "set dx", ret);
-
-	return ret;
+	return avs_dsp_send_pm_msg(adev, &request, NULL, true, "set dx");
 }
 
 /*
@@ -447,18 +378,13 @@ int avs_ipc_set_d0ix(struct avs_dev *adev, bool enable_pg, bool streaming)
 {
 	union avs_module_msg msg = AVS_MODULE_REQUEST(SET_D0IX);
 	struct avs_ipc_msg request = {{0}};
-	int ret;
 
 	msg.ext.set_d0ix.wake = enable_pg;
 	msg.ext.set_d0ix.streaming = streaming;
 
 	request.header = msg.val;
 
-	ret = avs_dsp_send_pm_msg(adev, &request, NULL, false);
-	if (ret)
-		avs_ipc_err(adev, &request, "set d0ix", ret);
-
-	return ret;
+	return avs_dsp_send_pm_msg(adev, &request, NULL, false, "set d0ix");
 }
 
 int avs_ipc_get_fw_config(struct avs_dev *adev, struct avs_fw_cfg *cfg)
-- 
2.34.1

