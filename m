Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFE146D214
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:23:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC714269C;
	Wed,  8 Dec 2021 12:22:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC714269C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962599;
	bh=mvUa4SdCqx6cwU9cxrP9bOQpv1verYCSACLkhTPD6Io=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m4FfqG9JgU1G4J3N3r1b9VFoVtn+bjygABF2WoilGHZV8hGhtKCHu0KALV49JUqmo
	 iGutkzT9w9cUpYeA1fCQVctpjn5NuVtC/Scm+Pxzkehx3DMyTVxck7sc8fQEAeWU5P
	 AU/Zzu4OaM1/cyk73OFgAyg6fJhjnLIXxfXQvAUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D24C1F8060B;
	Wed,  8 Dec 2021 12:12:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F163F80610; Wed,  8 Dec 2021 12:12:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59014F8060B
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:12:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59014F8060B
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236548494"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="236548494"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:12:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600522"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:12:36 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 31/37] ASoC: Intel: avs: D0ix power state support
Date: Wed,  8 Dec 2021 12:12:55 +0100
Message-Id: <20211208111301.1817725-32-cezary.rojewski@intel.com>
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

Audio DSP device supports D0 substates in form of D0ix, allowing for
preserving more power even when device is still considered active (D0).
When entered, certain domains which are not being currently used become
power gated. Entering and leaving D0ix is a complex process and differs
between firmware generations.

Conditions that disallow D0i3 and require immediate D0i0 transition
include but may not be limited to: IPC traffic, firmware tracing and
SRAM I/O. To make D0ix toggling sane, delay D0i3 transition and refresh
the timer each time an IPC is requrested.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h |   9 ++++
 sound/soc/intel/avs/dsp.c |  14 +++++
 sound/soc/intel/avs/ipc.c | 104 +++++++++++++++++++++++++++++++++++++-
 3 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index fb4c594d4ddb..dea9b93e3131 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -22,6 +22,7 @@ struct avs_dev;
 struct avs_tplg;
 struct avs_tplg_library;
 struct avs_soc_component;
+struct avs_ipc_msg;
 
 struct avs_dsp_ops {
 	int (* const power)(struct avs_dev *, u32, bool);
@@ -39,6 +40,8 @@ struct avs_dsp_ops {
 	unsigned int (* const log_buffer_offset)(struct avs_dev *, u32);
 	int (* const log_buffer_status)(struct avs_dev *, union avs_notify_msg *);
 	int (* const coredump)(struct avs_dev *, union avs_notify_msg *);
+	bool (* const d0ix_toggle)(struct avs_dev *, struct avs_ipc_msg *, bool);
+	int (* const set_d0ix)(struct avs_dev *, bool);
 };
 
 #define avs_dsp_op(adev, op, ...) \
@@ -167,6 +170,9 @@ struct avs_ipc {
 	struct completion busy_completion;
 
 	struct work_struct recovery_work;
+	struct delayed_work d0ix_work;
+	atomic_t d0ix_disable_depth;
+	bool in_d0ix;
 };
 
 #define AVS_EIPC	EREMOTEIO
@@ -217,6 +223,9 @@ void avs_dsp_interrupt_control(struct avs_dev *adev, bool enable);
 int avs_ipc_init(struct avs_ipc *ipc, struct device *dev);
 void avs_ipc_block(struct avs_ipc *ipc);
 
+int avs_dsp_disable_d0ix(struct avs_dev *adev);
+int avs_dsp_enable_d0ix(struct avs_dev *adev);
+
 /* Firmware resources management */
 
 int avs_get_module_entry(struct avs_dev *adev, const guid_t *uuid, struct avs_module_entry *entry);
diff --git a/sound/soc/intel/avs/dsp.c b/sound/soc/intel/avs/dsp.c
index 77d4ec939531..823f9c969ea6 100644
--- a/sound/soc/intel/avs/dsp.c
+++ b/sound/soc/intel/avs/dsp.c
@@ -153,6 +153,15 @@ int avs_dsp_get_core(struct avs_dev *adev, u32 core_id)
 
 	ref = &adev->core_refs[core_id];
 	if (atomic_add_return(1, ref) == 1) {
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
@@ -161,6 +170,8 @@ int avs_dsp_get_core(struct avs_dev *adev, u32 core_id)
 	return 0;
 
 err_enable_dsp:
+	avs_dsp_enable_d0ix(adev);
+err_disable_d0ix:
 	atomic_dec(ref);
 err:
 	dev_err(adev->dev, "get core failed: %d\n", ret);
@@ -187,6 +198,9 @@ int avs_dsp_put_core(struct avs_dev *adev, u32 core_id)
 		ret = avs_dsp_disable(adev, mask);
 		if (ret)
 			goto err;
+
+		/* Match disable_d0ix in avs_dsp_get_core(). */
+		avs_dsp_enable_d0ix(adev);
 	}
 
 	return 0;
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 49f7e0da0fdc..19bdf3a53491 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -13,6 +13,85 @@
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
+	mod_delayed_work(system_power_efficient_wq,
+			 &adev->ipc->d0ix_work,
+			 msecs_to_jiffies(AVS_D0IX_DELAY_MS));
+}
+
+static void avs_dsp_d0ix_work(struct work_struct *work)
+{
+	struct avs_ipc *ipc =
+		container_of(work, struct avs_ipc, d0ix_work.work);
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
+		queue_delayed_work(system_power_efficient_wq,
+				   &ipc->d0ix_work,
+				   msecs_to_jiffies(AVS_D0IX_DELAY_MS));
+	return 0;
+}
 
 static void avs_dsp_recovery(struct avs_dev *adev)
 {
@@ -373,14 +452,32 @@ static int avs_dsp_send_msg_sequence(struct avs_dev *adev,
 				     struct avs_ipc_msg *reply, int timeout,
 				     bool wake_d0i0, bool schedule_d0ix)
 {
-	return avs_dsp_do_send_msg(adev, request, reply, timeout);
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
 }
 
 int avs_dsp_send_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request,
 			     struct avs_ipc_msg *reply, int timeout)
 {
+	bool wake_d0i0 = avs_dsp_op(adev, d0ix_toggle, request, true);
+	bool schedule_d0ix = avs_dsp_op(adev, d0ix_toggle, request, false);
+
 	return avs_dsp_send_msg_sequence(adev, request, reply, timeout,
-					 false, false);
+					 wake_d0i0, schedule_d0ix);
 }
 
 int avs_dsp_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
@@ -474,6 +571,7 @@ int avs_ipc_init(struct avs_ipc *ipc, struct device *dev)
 	ipc->ready = false;
 	ipc->default_timeout_ms = AVS_IPC_TIMEOUT_MS;
 	INIT_WORK(&ipc->recovery_work, avs_dsp_recovery_work);
+	INIT_DELAYED_WORK(&ipc->d0ix_work, avs_dsp_d0ix_work);
 	init_completion(&ipc->done_completion);
 	init_completion(&ipc->busy_completion);
 	spin_lock_init(&ipc->rx_lock);
@@ -486,4 +584,6 @@ void avs_ipc_block(struct avs_ipc *ipc)
 {
 	ipc->ready = false;
 	cancel_work_sync(&ipc->recovery_work);
+	cancel_delayed_work_sync(&ipc->d0ix_work);
+	ipc->in_d0ix = false;
 }
-- 
2.25.1

