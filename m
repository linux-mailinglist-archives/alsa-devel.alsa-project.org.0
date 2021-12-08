Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED63D46D213
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:22:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75E05269F;
	Wed,  8 Dec 2021 12:22:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75E05269F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962575;
	bh=xi3RCx0niuc/T9SUaRBoGDpbq7gBHJFXk0iBolWcEhw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VPzYmcD//o310uD0NtmpmdvLpZgah8K+gOt86fqyJs1VDLIb3RhKghNsXKaNzV/V3
	 3EZTrqLUHrH1RKDQiGfB9QfUckXq6lwm8IsESDyOg8yOcw4idd6gToWTybvHFuBhJg
	 FCwvpPjjXFzx9fzoiTSqBNN5w4cnQFHX639IPJHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34C3FF8060D;
	Wed,  8 Dec 2021 12:12:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED5BCF804FB; Wed,  8 Dec 2021 12:12:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03CD6F80606
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:12:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03CD6F80606
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236548485"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="236548485"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:12:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600508"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:12:33 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 30/37] ASoC: Intel: avs: Prepare for firmware tracing
Date: Wed,  8 Dec 2021 12:12:54 +0100
Message-Id: <20211208111301.1817725-31-cezary.rojewski@intel.com>
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

Firmware provides its own debug functionality. While coredump is one of
these, traces are the main area of interest. kfifo is enlisted to cache
log data that is being pumped to driver through SRAM. Separate DSP
operations are declared as actual feature implementation differs between
firmware generations.

As log gathering involves usage of IPCs, add all necessary: ENABLE_LOGS
and SYSTEM_TIME.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h       | 29 +++++++++++++++++++++++++++++
 sound/soc/intel/avs/ipc.c       |  5 +++++
 sound/soc/intel/avs/messages.c  | 32 ++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/messages.h  | 21 +++++++++++++++++++++
 sound/soc/intel/avs/registers.h |  1 +
 sound/soc/intel/avs/utils.c     | 23 +++++++++++++++++++++++
 6 files changed, 111 insertions(+)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 4562f187939d..fb4c594d4ddb 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -11,6 +11,7 @@
 
 #include <linux/device.h>
 #include <linux/firmware.h>
+#include <linux/kfifo.h>
 #include <sound/hda_codec.h>
 #include <sound/hda_register.h>
 #include <sound/soc-component.h>
@@ -33,6 +34,10 @@ struct avs_dsp_ops {
 	int (* const load_lib)(struct avs_dev *, struct firmware *, u32);
 	int (* const transfer_mods)(struct avs_dev *, bool,
 				    struct avs_module_entry *, u32);
+	int (* const enable_logs)(struct avs_dev *, enum avs_log_enable,
+				  u32, u32, unsigned long, u32 *);
+	unsigned int (* const log_buffer_offset)(struct avs_dev *, u32);
+	int (* const log_buffer_status)(struct avs_dev *, union avs_notify_msg *);
 	int (* const coredump)(struct avs_dev *, union avs_notify_msg *);
 };
 
@@ -75,6 +80,16 @@ struct avs_fw_entry {
 	struct list_head node;
 };
 
+struct avs_debug {
+	struct kfifo trace_fifo;
+	spinlock_t fifo_lock;	/* serialize I/O for trace_fifo */
+	spinlock_t trace_lock;	/* serialize debug window I/O between each LOG_BUFFER_STATUS */
+	wait_queue_head_t trace_waitq;
+	u32 aging_timer_period;
+	u32 fifo_full_timer_period;
+	u32 logged_resources;	/* context dependent: core or library */
+};
+
 struct avs_dev {
 	struct hda_bus base;
 	struct device *dev;
@@ -101,6 +116,8 @@ struct avs_dev {
 	struct list_head path_list;
 	spinlock_t path_list_lock;
 	struct mutex path_mutex;
+
+	struct avs_debug dbg;
 };
 
 /* from hda_bus to avs_dev */
@@ -262,4 +279,16 @@ int avs_ssp_platform_register(struct avs_dev *adev, const char *name,
 			      unsigned long port_mask, unsigned long *tdms);
 int avs_hda_platform_register(struct avs_dev *adev, const char *name);
 
+/* Firmware tracing helpers */
+
+unsigned int __kfifo_fromio_locked(struct kfifo *fifo, const void __iomem *src,
+				   unsigned int len, spinlock_t *lock);
+
+#define avs_log_buffer_size(adev) \
+	((adev)->fw_cfg.trace_log_bytes / (adev)->hw_cfg.dsp_cores)
+
+#define avs_log_buffer_addr(adev, core) \
+	(avs_sram_addr(adev, AVS_DEBUG_WINDOW) + \
+	 avs_dsp_op(adev, log_buffer_offset, core))
+
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index a8d2323e07a7..49f7e0da0fdc 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -123,6 +123,7 @@ static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
 		data_size = sizeof(struct avs_notify_res_data);
 		break;
 
+	case AVS_NOTIFY_LOG_BUFFER_STATUS:
 	case AVS_NOTIFY_EXCEPTION_CAUGHT:
 		break;
 
@@ -153,6 +154,10 @@ static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
 		complete(&adev->fw_ready);
 		break;
 
+	case AVS_NOTIFY_LOG_BUFFER_STATUS:
+		avs_dsp_op(adev, log_buffer_status, &msg);
+		break;
+
 	case AVS_NOTIFY_EXCEPTION_CAUGHT:
 		avs_dsp_exception_caught(adev, &msg);
 		break;
diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index b9d2bd06fe3a..96dae14a3ec7 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -624,6 +624,38 @@ int avs_ipc_get_modules_info(struct avs_dev *adev, struct avs_mods_info **info)
 	return 0;
 }
 
+int avs_ipc_set_enable_logs(struct avs_dev *adev, u8 *log_info, size_t size)
+{
+	int ret;
+
+	ret = avs_ipc_set_large_config(adev, AVS_BASEFW_MOD_ID, AVS_BASEFW_INST_ID,
+				       AVS_BASEFW_ENABLE_LOGS, log_info, size);
+	if (ret)
+		dev_err(adev->dev, "enable logs failed: %d\n", ret);
+
+	return ret;
+}
+
+int avs_ipc_set_system_time(struct avs_dev *adev)
+{
+	struct avs_sys_time sys_time;
+	int ret;
+	u64 us;
+
+	/* firmware expects UTC time in micro seconds */
+	us = ktime_to_us(ktime_get());
+	sys_time.val_l = us & UINT_MAX;
+	sys_time.val_u = us >> 32;
+
+	ret = avs_ipc_set_large_config(adev, AVS_BASEFW_MOD_ID, AVS_BASEFW_INST_ID,
+				       AVS_BASEFW_SYSTEM_TIME,
+				       (u8 *)&sys_time, sizeof(sys_time));
+	if (ret)
+		dev_err(adev->dev, "set system time failed: %d\n", ret);
+
+	return ret;
+}
+
 int avs_ipc_copier_set_sink_format(struct avs_dev *adev, u16 module_id,
 				   u8 instance_id, u32 sink_id,
 				   const struct avs_audio_format *src_fmt,
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index f289c3498096..fa4ba364e5b8 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -191,6 +191,7 @@ union avs_reply_msg {
 enum avs_notify_msg_type {
 	AVS_NOTIFY_PHRASE_DETECTED = 4,
 	AVS_NOTIFY_RESOURCE_EVENT = 5,
+	AVS_NOTIFY_LOG_BUFFER_STATUS = 6,
 	AVS_NOTIFY_FW_READY = 8,
 	AVS_NOTIFY_EXCEPTION_CAUGHT = 10,
 	AVS_NOTIFY_MODULE_EVENT = 12,
@@ -208,6 +209,10 @@ union avs_notify_msg {
 				u32 msg_direction:1;
 				u32 msg_target:1;
 			};
+			struct {
+				u16 rsvd:12;
+				u16 core:4;
+			} log;
 		};
 		union {
 			u32 val;
@@ -339,12 +344,21 @@ int avs_ipc_set_d0ix(struct avs_dev *adev, bool enable_pg, bool streaming);
 #define AVS_BASEFW_INST_ID	0
 
 enum avs_basefw_runtime_param {
+	AVS_BASEFW_ENABLE_LOGS = 6,
 	AVS_BASEFW_FIRMWARE_CONFIG = 7,
 	AVS_BASEFW_HARDWARE_CONFIG = 8,
 	AVS_BASEFW_MODULES_INFO = 9,
 	AVS_BASEFW_LIBRARIES_INFO = 16,
+	AVS_BASEFW_SYSTEM_TIME = 20,
+};
+
+enum avs_log_enable {
+	AVS_LOG_DISABLE = 0,
+	AVS_LOG_ENABLE = 1
 };
 
+int avs_ipc_set_enable_logs(struct avs_dev *adev, u8 *log_info, size_t size);
+
 struct avs_fw_version {
 	u16 major;
 	u16 minor;
@@ -512,6 +526,13 @@ static inline bool avs_module_entry_is_loaded(struct avs_module_entry *mentry)
 
 int avs_ipc_get_modules_info(struct avs_dev *adev, struct avs_mods_info **info);
 
+struct avs_sys_time {
+	u32 val_l;
+	u32 val_u;
+} __packed;
+
+int avs_ipc_set_system_time(struct avs_dev *adev);
+
 /* Module configuration */
 
 #define AVS_MIXIN_MOD_UUID \
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
index d607edd877d8..369c55c62f81 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -58,6 +58,7 @@
 #define AVS_UPLINK_WINDOW		AVS_FW_REGS_WINDOW
 /* HOST -> DSP communication window */
 #define AVS_DOWNLINK_WINDOW		1
+#define AVS_DEBUG_WINDOW		2
 
 /* registry I/O helpers */
 #define avs_sram_offset(adev, window_idx) \
diff --git a/sound/soc/intel/avs/utils.c b/sound/soc/intel/avs/utils.c
index cf8663c32609..457f82472e8f 100644
--- a/sound/soc/intel/avs/utils.c
+++ b/sound/soc/intel/avs/utils.c
@@ -7,6 +7,7 @@
 //
 
 #include <linux/firmware.h>
+#include <linux/kfifo.h>
 #include <linux/slab.h>
 #include "avs.h"
 #include "messages.h"
@@ -280,3 +281,25 @@ void avs_release_firmwares(struct avs_dev *adev)
 		kfree(entry);
 	}
 }
+
+unsigned int __kfifo_fromio_locked(struct kfifo *fifo, const void __iomem *src,
+				   unsigned int len, spinlock_t *lock)
+{
+	struct __kfifo *__fifo = &fifo->kfifo;
+	unsigned long flags;
+	unsigned int l, off;
+
+	spin_lock_irqsave(lock, flags);
+	len = min(len, kfifo_avail(fifo));
+	off = __fifo->in & __fifo->mask;
+	l = min(len, kfifo_size(fifo) - off);
+
+	memcpy_fromio(__fifo->data + off, src, l);
+	memcpy_fromio(__fifo->data, src + l, len - l);
+	/* Make sure data copied from SRAM is visible for all CPUs. */
+	smp_mb();
+	__fifo->in += len;
+	spin_unlock_irqrestore(lock, flags);
+
+	return len;
+}
-- 
2.25.1

