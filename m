Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 329F9687BDA
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 12:13:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E523DF0;
	Thu,  2 Feb 2023 12:12:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E523DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675336394;
	bh=gtpmEEHuWfTcPgw2xIUUgfvSBembuZyyZRCd2hCYkI8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KOXhirkh74begMXVS4o4jhU6//Qu+SAqedivjdHUu3iPSrSIGvlGXP0IyRrAbG3fN
	 ZOjmZhAT5eJCApwvUhjUwqOJ7Puo6guO2E6UsI0/L8v6xVXndtpYwKKO7OvoiqRhPZ
	 YzDNhp23tsN+l7enoQtfN18niY41+1di+L7S6+dg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDEE7F80548;
	Thu,  2 Feb 2023 12:11:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22026F8053D; Thu,  2 Feb 2023 12:11:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43DEAF80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 12:11:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43DEAF80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fBXzEdZW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675336283; x=1706872283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gtpmEEHuWfTcPgw2xIUUgfvSBembuZyyZRCd2hCYkI8=;
 b=fBXzEdZWl/LBFEff5EiI1lFy7riFvuxikcvKL6C+2wzQqB8PqSocReFD
 K0qrU03cVHz2HzMYvfVvWL+9MTrhqUhsIIoGf7plWmhqRO9WBRSH2wd1i
 Lp896ECybnQt3PnI//+HtrEngZ/aXqzGWCOAg+e+nK8LNuMY58GMj7Dvm
 KmjPZm8Sedxi7KFezPPWbgFAzN1pHUp7oIorviwaSmEr8X8Zp4uu6/WrX
 Aylaf/FMmne7CQ2ntfI00VpAT41IkgB9S4syGCDXqj8+r7EcOBr7XqHPi
 WZULIVMKUpOvaD/fsjb3rA4MRR8rynWIMOMvO/+KeDVLl6RQHy+PA4sj1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="414625131"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="414625131"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 03:11:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695747665"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="695747665"
Received: from jpdamery-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.1.104])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 03:11:16 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz
Subject: [PATCH v2 1/9] ASoC: SOF: add ipc4_fw_reg header file
Date: Thu,  2 Feb 2023 13:11:15 +0200
Message-Id: <20230202111123.25231-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202111123.25231-1-peter.ujfalusi@linux.intel.com>
References: <20230202111123.25231-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Ipc4_fw_reg defines the content of memory window 0 shared by fw.
Host driver can get fw information by data structure defined in
this file.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-fw-reg.h | 155 ++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)
 create mode 100644 sound/soc/sof/ipc4-fw-reg.h

diff --git a/sound/soc/sof/ipc4-fw-reg.h b/sound/soc/sof/ipc4-fw-reg.h
new file mode 100644
index 000000000000..7226161e57e1
--- /dev/null
+++ b/sound/soc/sof/ipc4-fw-reg.h
@@ -0,0 +1,155 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2022 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __IPC4_FW_REG_H__
+#define __IPC4_FW_REG_H__
+
+#define SOF_IPC4_INVALID_STREAM_POSITION	ULLONG_MAX
+
+/**
+ * struct sof_ipc4_pipeline_registers - Pipeline start and end information in fw
+ * @stream_start_offset: Stream start offset (LPIB) reported by mixin
+ * module allocated on pipeline attached to Host Output Gateway when
+ * first data is being mixed to mixout module. When data is not mixed
+ * (right after creation/after reset) value "(u64)-1" is reported
+ * @stream_end_offset: Stream end offset (LPIB) reported by mixin
+ * module allocated on pipeline attached to Host Output Gateway
+ * during transition from RUNNING to PAUSED. When data is not mixed
+ * (right after creation or after reset) value "(u64)-1" is reported.
+ * When first data is mixed then value "0"is reported.
+ */
+struct sof_ipc4_pipeline_registers {
+	u64 stream_start_offset;
+	u64 stream_end_offset;
+} __packed __aligned(4);
+
+#define SOF_IPC4_PV_MAX_SUPPORTED_CHANNELS 8
+
+/**
+ * struct sof_ipc4_peak_volume_regs - Volume information in fw
+ * @peak_meter: Peak volume value in fw
+ * @current_volume: Current volume value in fw
+ * @target_volume: Target volume value in fw
+ */
+struct sof_ipc4_peak_volume_regs {
+	u32 peak_meter[SOF_IPC4_PV_MAX_SUPPORTED_CHANNELS];
+	u32 current_volume[SOF_IPC4_PV_MAX_SUPPORTED_CHANNELS];
+	u32 target_volume[SOF_IPC4_PV_MAX_SUPPORTED_CHANNELS];
+} __packed __aligned(4);
+
+/**
+ * struct sof_ipc4_llp_reading - Llp information in fw
+ * @llp_l: Lower part of 64-bit LLP
+ * @llp_u: Upper part of 64-bit LLP
+ * @wclk_l: Lower part of 64-bit Wallclock
+ * @wclk_u: Upper part of 64-bit Wallclock
+ */
+struct sof_ipc4_llp_reading {
+	u32 llp_l;
+	u32 llp_u;
+	u32 wclk_l;
+	u32 wclk_u;
+} __packed __aligned(4);
+
+/**
+ * struct of sof_ipc4_llp_reading_extended - Extended llp info
+ * @llp_reading: Llp information in memory window
+ * @tpd_low: Total processed data (low part)
+ * @tpd_high: Total processed data (high part)
+ */
+struct sof_ipc4_llp_reading_extended {
+	struct sof_ipc4_llp_reading llp_reading;
+	u32 tpd_low;
+	u32 tpd_high;
+} __packed __aligned(4);
+
+/**
+ * struct sof_ipc4_llp_reading_slot - Llp slot information in memory window
+ * @node_id: Dai gateway node id
+ * @reading: Llp information in memory window
+ */
+struct sof_ipc4_llp_reading_slot {
+	u32 node_id;
+	struct sof_ipc4_llp_reading reading;
+} __packed __aligned(4);
+
+/* ROM information */
+#define SOF_IPC4_FW_FUSE_VALUE_MASK		GENMASK(7, 0)
+#define SOF_IPC4_FW_LOAD_METHOD_MASK		BIT(8)
+#define SOF_IPC4_FW_DOWNLINK_IPC_USE_DMA_MASK	BIT(9)
+#define SOF_IPC4_FW_LOAD_METHOD_REV_MASK	GENMASK(11, 10)
+#define SOF_IPC4_FW_REVISION_MIN_MASK		GENMASK(15, 12)
+#define SOF_IPC4_FW_REVISION_MAJ_MASK		GENMASK(19, 16)
+#define SOF_IPC4_FW_VERSION_MIN_MASK		GENMASK(23, 20)
+#define SOF_IPC4_FW_VERSION_MAJ_MASK		GENMASK(27, 24)
+
+/* Number of dsp core supported in FW Regs. */
+#define SOF_IPC4_MAX_SUPPORTED_ADSP_CORES	8
+
+/* Number of host pipeline registers slots in FW Regs. */
+#define SOF_IPC4_MAX_PIPELINE_REG_SLOTS		16
+
+/* Number of PeakVol registers slots in FW Regs. */
+#define SOF_IPC4_MAX_PEAK_VOL_REG_SLOTS		16
+
+/* Number of GPDMA LLP Reading slots in FW Regs. */
+#define SOF_IPC4_MAX_LLP_GPDMA_READING_SLOTS	24
+
+/* Number of Aggregated SNDW Reading slots in FW Regs. */
+#define SOF_IPC4_MAX_LLP_SNDW_READING_SLOTS	15
+
+/* Current ABI version of the Fw registers layout. */
+#define SOF_IPC4_FW_REGS_ABI_VER		1
+
+/**
+ * struct sof_ipc4_fw_registers - FW Registers exposes additional
+ * DSP / FW state information to the driver
+ * @fw_status: Current ROM / FW status
+ * @lec: Last ROM / FW error code
+ * @fps: Current DSP clock status
+ * @lnec: Last Native Error Code(from external library)
+ * @ltr: Copy of LTRC HW register value(FW only)
+ * @rsvd0: Reserved0
+ * @rom_info: ROM info
+ * @abi_ver: Version of the layout, set to the current FW_REGS_ABI_VER
+ * @slave_core_sts: Slave core states
+ * @rsvd2: Reserved2
+ * @pipeline_regs: State of pipelines attached to host output  gateways
+ * @peak_vol_regs: State of PeakVol instances indexed by the PeakVol's instance_id
+ * @llp_gpdma_reading_slots: LLP Readings for single link gateways
+ * @llp_sndw_reading_slots: SNDW aggregated link gateways
+ * @llp_evad_reading_slot: LLP Readings for EVAD gateway
+ */
+struct sof_ipc4_fw_registers {
+	u32 fw_status;
+	u32 lec;
+	u32 fps;
+	u32 lnec;
+	u32 ltr;
+	u32 rsvd0;
+	u32 rom_info;
+	u32 abi_ver;
+	u8 slave_core_sts[SOF_IPC4_MAX_SUPPORTED_ADSP_CORES];
+	u32 rsvd2[6];
+
+	struct sof_ipc4_pipeline_registers
+		pipeline_regs[SOF_IPC4_MAX_PIPELINE_REG_SLOTS];
+
+	struct sof_ipc4_peak_volume_regs
+		peak_vol_regs[SOF_IPC4_MAX_PEAK_VOL_REG_SLOTS];
+
+	struct sof_ipc4_llp_reading_slot
+		llp_gpdma_reading_slots[SOF_IPC4_MAX_LLP_GPDMA_READING_SLOTS];
+
+	struct sof_ipc4_llp_reading_slot
+		llp_sndw_reading_slots[SOF_IPC4_MAX_LLP_SNDW_READING_SLOTS];
+
+	struct sof_ipc4_llp_reading_slot llp_evad_reading_slot;
+} __packed __aligned(4);
+
+#endif
-- 
2.39.1

