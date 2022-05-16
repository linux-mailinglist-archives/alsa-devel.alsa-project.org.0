Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AB552816B
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 12:06:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42EE71692;
	Mon, 16 May 2022 12:05:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42EE71692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652695570;
	bh=r+OfKnBWB5+ynyOQWCg/KkTG12dj1A5V6gC/bp6XD/I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ncHNFxIznXMETP7hmJT/11fv+0veoJ7PxWPO5wiqs2FgqMdw5cgPrJoXW7WNgsw3Q
	 GUk1pk+RYUcFx4VhfVsRej0lALmy6pQJDWwSbcp2sHHecoH83Nqw3UhGn7kZAe5WMd
	 pSIXmqSslYrjq+jjvKRNGliFS6gFo2fq2d4Cp5KU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 539FEF80566;
	Mon, 16 May 2022 12:02:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 403BEF8051C; Mon, 16 May 2022 12:02:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DA1EF8051C
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 12:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DA1EF8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nXiXd83V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652695330; x=1684231330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r+OfKnBWB5+ynyOQWCg/KkTG12dj1A5V6gC/bp6XD/I=;
 b=nXiXd83VzDeSqQ7+JbZn2lxn5ZWkeHW+bIJDkpkGuSIXCqTnMHjODNaT
 7K/k/mUgWk4cKKgyMfQq131yB/g3FYY+0NvziquzxP0Ywbw1iZqA+O5B0
 DX9AP39uM+n6tRT9uUWVQ2McilPHr5WLyIRJHdtfpYTy7O9MfpBBqlolO
 8o4pbPa3o7XxbcuBU3c9eGQDT92yTb5V+9Epr0YamF/pvp86thhIwgnTA
 fni3E81d0T6Ps2c2emjT6/obIRBj5AGmzHk44/bz3liEB1/OGwGf2sxh8
 b4dWCl3dttJJV/GU/TkWBOzgxqjwX5Qi9U68BVbioU73SifGsa5FIh45r g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333846325"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="333846325"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:02:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="522382636"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 16 May 2022 03:02:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 08/15] ASoC: Intel: avs: D0ix power state support
Date: Mon, 16 May 2022 12:11:09 +0200
Message-Id: <20220516101116.190192-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516101116.190192-1-cezary.rojewski@intel.com>
References: <20220516101116.190192-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 rad@semihalf.com, pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
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

Audio DSP device supports D0 substates in form of D0ix, allowing for
preserving more power even when device is still considered active (D0).
When entered, certain domains which are not being currently used become
power gated. Entering and leaving D0ix is a complex process and differs
between firmware generations.

Conditions that disallow D0i3 and require immediate D0i0 transition
include but may not be limited to: IPC traffic, firmware tracing and
SRAM I/O. To make D0ix toggling sane, delay D0i3 transition and refresh
the timer each time an IPC is requested.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h      |  14 ++++
 sound/soc/intel/avs/dsp.c      |  14 ++++
 sound/soc/intel/avs/ipc.c      | 121 ++++++++++++++++++++++++++++++++-
 sound/soc/intel/avs/messages.c |   4 +-
 4 files changed, 150 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 263ceb39d25d..583f46d5a9bc 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -22,6 +22,7 @@ struct avs_dev;
 struct avs_tplg;
 struct avs_tplg_library;
 struct avs_soc_component;
+struct avs_ipc_msg;
 
 /*
  * struct avs_dsp_ops - Platform-specific DSP operations
@@ -48,6 +49,8 @@ struct avs_dsp_ops {
 	int (* const log_buffer_offset)(struct avs_dev *, u32);
 	int (* const log_buffer_status)(struct avs_dev *, union avs_notify_msg *);
 	int (* const coredump)(struct avs_dev *, union avs_notify_msg *);
+	bool (* const d0ix_toggle)(struct avs_dev *, struct avs_ipc_msg *, bool);
+	int (* const set_d0ix)(struct avs_dev *, bool);
 };
 
 #define avs_dsp_op(adev, op, ...) \
@@ -191,6 +194,9 @@ struct avs_ipc {
 	struct completion busy_completion;
 
 	struct work_struct recovery_work;
+	struct delayed_work d0ix_work;
+	atomic_t d0ix_disable_depth;
+	bool in_d0ix;
 };
 
 #define AVS_EIPC	EREMOTEIO
@@ -227,6 +233,11 @@ int avs_dsp_send_msg_timeout(struct avs_dev *adev,
 			     struct avs_ipc_msg *reply, int timeout);
 int avs_dsp_send_msg(struct avs_dev *adev,
 		     struct avs_ipc_msg *request, struct avs_ipc_msg *reply);
+/* Two variants below are for messages that control DSP power states. */
+int avs_dsp_send_pm_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request,
+				struct avs_ipc_msg *reply, int timeout, bool wake_d0i0);
+int avs_dsp_send_pm_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
+			struct avs_ipc_msg *reply, bool wake_d0i0);
 int avs_dsp_send_rom_msg_timeout(struct avs_dev *adev,
 				 struct avs_ipc_msg *request, int timeout);
 int avs_dsp_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg *request);
@@ -234,6 +245,9 @@ void avs_dsp_interrupt_control(struct avs_dev *adev, bool enable);
 int avs_ipc_init(struct avs_ipc *ipc, struct device *dev);
 void avs_ipc_block(struct avs_ipc *ipc);
 
+int avs_dsp_disable_d0ix(struct avs_dev *adev);
+int avs_dsp_enable_d0ix(struct avs_dev *adev);
+
 /* Firmware resources management */
 
 int avs_get_module_entry(struct avs_dev *adev, const guid_t *uuid, struct avs_module_entry *entry);
diff --git a/sound/soc/intel/avs/dsp.c b/sound/soc/intel/avs/dsp.c
index 3ff17bd22a5a..2f18b137ff42 100644
--- a/sound/soc/intel/avs/dsp.c
+++ b/sound/soc/intel/avs/dsp.c
@@ -152,6 +152,15 @@ static int avs_dsp_get_core(struct avs_dev *adev, u32 core_id)
 
 	adev->core_refs[core_id]++;
 	if (adev->core_refs[core_id] == 1) {
+		/*
+		 * No cores other than main-core can be running for DSP
+		 * to achieve d0ix. Conscious SET_D0IX IPC failure is permitted,
+		 * simply d0ix power state will no longer be attempted.
+		 */
+		ret = avs_dsp_disable_d0ix(adev);
+		if (ret && ret != -AVS_EIPC)
+			goto err_disable_d0ix;
+
 		ret = avs_dsp_enable(adev, mask);
 		if (ret)
 			goto err_enable_dsp;
@@ -160,6 +169,8 @@ static int avs_dsp_get_core(struct avs_dev *adev, u32 core_id)
 	return 0;
 
 err_enable_dsp:
+	avs_dsp_enable_d0ix(adev);
+err_disable_d0ix:
 	adev->core_refs[core_id]--;
 err:
 	dev_err(adev->dev, "get core %d failed: %d\n", core_id, ret);
@@ -185,6 +196,9 @@ static int avs_dsp_put_core(struct avs_dev *adev, u32 core_id)
 		ret = avs_dsp_disable(adev, mask);
 		if (ret)
 			goto err;
+
+		/* Match disable_d0ix in avs_dsp_get_core(). */
+		avs_dsp_enable_d0ix(adev);
 	}
 
 	return 0;
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index feb900ba1db9..2cf4cb4f0c56 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -13,6 +13,82 @@
 #include "registers.h"
 
 #define AVS_IPC_TIMEOUT_MS	300
+#define AVS_D0IX_DELAY_MS	300
+
+static int
+avs_dsp_set_d0ix(struct avs_dev *adev, bool enable)
+{
+	struct avs_ipc *ipc = adev->ipc;
+	int ret;
+
+	/* Is transition required? */
+	if (ipc->in_d0ix == enable)
+		return 0;
+
+	ret = avs_dsp_op(adev, set_d0ix, enable);
+	if (ret) {
+		/* Prevent further d0ix attempts on conscious IPC failure. */
+		if (ret == -AVS_EIPC)
+			atomic_inc(&ipc->d0ix_disable_depth);
+
+		ipc->in_d0ix = false;
+		return ret;
+	}
+
+	ipc->in_d0ix = enable;
+	return 0;
+}
+
+static void avs_dsp_schedule_d0ix(struct avs_dev *adev, struct avs_ipc_msg *tx)
+{
+	if (atomic_read(&adev->ipc->d0ix_disable_depth))
+		return;
+
+	mod_delayed_work(system_power_efficient_wq, &adev->ipc->d0ix_work,
+			 msecs_to_jiffies(AVS_D0IX_DELAY_MS));
+}
+
+static void avs_dsp_d0ix_work(struct work_struct *work)
+{
+	struct avs_ipc *ipc = container_of(work, struct avs_ipc, d0ix_work.work);
+
+	avs_dsp_set_d0ix(to_avs_dev(ipc->dev), true);
+}
+
+static int avs_dsp_wake_d0i0(struct avs_dev *adev, struct avs_ipc_msg *tx)
+{
+	struct avs_ipc *ipc = adev->ipc;
+
+	if (!atomic_read(&ipc->d0ix_disable_depth)) {
+		cancel_delayed_work_sync(&ipc->d0ix_work);
+		return avs_dsp_set_d0ix(adev, false);
+	}
+
+	return 0;
+}
+
+int avs_dsp_disable_d0ix(struct avs_dev *adev)
+{
+	struct avs_ipc *ipc = adev->ipc;
+
+	/* Prevent PG only on the first disable. */
+	if (atomic_add_return(1, &ipc->d0ix_disable_depth) == 1) {
+		cancel_delayed_work_sync(&ipc->d0ix_work);
+		return avs_dsp_set_d0ix(adev, false);
+	}
+
+	return 0;
+}
+
+int avs_dsp_enable_d0ix(struct avs_dev *adev)
+{
+	struct avs_ipc *ipc = adev->ipc;
+
+	if (atomic_dec_and_test(&ipc->d0ix_disable_depth))
+		queue_delayed_work(system_power_efficient_wq, &ipc->d0ix_work,
+				   msecs_to_jiffies(AVS_D0IX_DELAY_MS));
+	return 0;
+}
 
 static void avs_dsp_recovery(struct avs_dev *adev)
 {
@@ -88,6 +164,8 @@ static void avs_dsp_exception_caught(struct avs_dev *adev, union avs_notify_msg
 
 	dev_crit(adev->dev, "communication severed, rebooting dsp..\n");
 
+	cancel_delayed_work_sync(&ipc->d0ix_work);
+	ipc->in_d0ix = false;
 	/* Re-enabled on recovery completion. */
 	pm_runtime_disable(adev->dev);
 
@@ -393,10 +471,35 @@ static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request
 	return ret;
 }
 
+static int avs_dsp_send_msg_sequence(struct avs_dev *adev, struct avs_ipc_msg *request,
+				     struct avs_ipc_msg *reply, int timeout, bool wake_d0i0,
+				     bool schedule_d0ix)
+{
+	int ret;
+
+	if (wake_d0i0) {
+		ret = avs_dsp_wake_d0i0(adev, request);
+		if (ret)
+			return ret;
+	}
+
+	ret = avs_dsp_do_send_msg(adev, request, reply, timeout);
+	if (ret)
+		return ret;
+
+	if (schedule_d0ix)
+		avs_dsp_schedule_d0ix(adev, request);
+
+	return 0;
+}
+
 int avs_dsp_send_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request,
 			     struct avs_ipc_msg *reply, int timeout)
 {
-	return avs_dsp_do_send_msg(adev, request, reply, timeout);
+	bool wake_d0i0 = avs_dsp_op(adev, d0ix_toggle, request, true);
+	bool schedule_d0ix = avs_dsp_op(adev, d0ix_toggle, request, false);
+
+	return avs_dsp_send_msg_sequence(adev, request, reply, timeout, wake_d0i0, schedule_d0ix);
 }
 
 int avs_dsp_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
@@ -405,6 +508,19 @@ int avs_dsp_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
 	return avs_dsp_send_msg_timeout(adev, request, reply, adev->ipc->default_timeout_ms);
 }
 
+int avs_dsp_send_pm_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request,
+				struct avs_ipc_msg *reply, int timeout, bool wake_d0i0)
+{
+	return avs_dsp_send_msg_sequence(adev, request, reply, timeout, wake_d0i0, false);
+}
+
+int avs_dsp_send_pm_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
+			struct avs_ipc_msg *reply, bool wake_d0i0)
+{
+	return avs_dsp_send_pm_msg_timeout(adev, request, reply, adev->ipc->default_timeout_ms,
+					   wake_d0i0);
+}
+
 static int avs_dsp_do_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg *request, int timeout)
 {
 	struct avs_ipc *ipc = adev->ipc;
@@ -465,6 +581,7 @@ int avs_ipc_init(struct avs_ipc *ipc, struct device *dev)
 	ipc->ready = false;
 	ipc->default_timeout_ms = AVS_IPC_TIMEOUT_MS;
 	INIT_WORK(&ipc->recovery_work, avs_dsp_recovery_work);
+	INIT_DELAYED_WORK(&ipc->d0ix_work, avs_dsp_d0ix_work);
 	init_completion(&ipc->done_completion);
 	init_completion(&ipc->busy_completion);
 	spin_lock_init(&ipc->rx_lock);
@@ -477,4 +594,6 @@ void avs_ipc_block(struct avs_ipc *ipc)
 {
 	ipc->ready = false;
 	cancel_work_sync(&ipc->recovery_work);
+	cancel_delayed_work_sync(&ipc->d0ix_work);
+	ipc->in_d0ix = false;
 }
diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index 3da33150aabf..6404fce8cde4 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -432,7 +432,7 @@ int avs_ipc_set_dx(struct avs_dev *adev, u32 core_mask, bool powerup)
 	request.data = &dx;
 	request.size = sizeof(dx);
 
-	ret = avs_dsp_send_msg(adev, &request, NULL);
+	ret = avs_dsp_send_pm_msg(adev, &request, NULL, true);
 	if (ret)
 		avs_ipc_err(adev, &request, "set dx", ret);
 
@@ -456,7 +456,7 @@ int avs_ipc_set_d0ix(struct avs_dev *adev, bool enable_pg, bool streaming)
 
 	request.header = msg.val;
 
-	ret = avs_dsp_send_msg(adev, &request, NULL);
+	ret = avs_dsp_send_pm_msg(adev, &request, NULL, false);
 	if (ret)
 		avs_ipc_err(adev, &request, "set d0ix", ret);
 
-- 
2.25.1

