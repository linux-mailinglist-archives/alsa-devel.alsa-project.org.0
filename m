Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 094766865F7
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 13:34:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1171684B;
	Wed,  1 Feb 2023 13:33:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1171684B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675254846;
	bh=gtpmEEHuWfTcPgw2xIUUgfvSBembuZyyZRCd2hCYkI8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZMR/xVpVrMfxj1+4guYYUc0XS5wrpG8+jqAjPN4iEFt8XJzwh/BCgHHh07wzMnVBG
	 yOKwjPTrRI6uPvCCE3gW0UL89V2x6DYp4nOA+X9cQtJRLa7Z0ecEzRjuPBunMC7t3A
	 ZKGd9WdlHuXTdERuK+AEqTu5D9dz8jc7oS9jmu94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EFFBF80524;
	Wed,  1 Feb 2023 13:32:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3175DF80544; Wed,  1 Feb 2023 13:32:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5570FF80246
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 13:32:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5570FF80246
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cw2n6glL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675254754; x=1706790754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gtpmEEHuWfTcPgw2xIUUgfvSBembuZyyZRCd2hCYkI8=;
 b=cw2n6glLeNND2iwpw5ahpv09KCE8KP/7h7gqqXYZsEjT+B8t7D9O8wdm
 GViwDDaJJCfV/GTQZleSrNuDU6Pxqiket+GohrItJcP3yg5n4IXRRqU+N
 92x/O1p1y+DMabvh4TtNC1B9kh4l3oHdPOWw+bjmMHDrpMXF256y0Aulj
 9ko20GjBQQk0XPcz4/CKq87Sl5pTdpNHh5IzEnKJzI1z7uieHMYsTIG6S
 NBwdAXTrDFqIEMANanK0u/W0oxW05bU2WNea58jCBok+3i/krzYQl1fpe
 bnCqkIiwsScVNRa0Ojvw5pUcMMsxiMa57gela0IhsX0bT2R1nitSUSWTN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="328143507"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="328143507"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 04:32:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="788865668"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="788865668"
Received: from jehdildi-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.31.67])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 04:32:24 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/9] ASoC: SOF: add ipc4_fw_reg header file
Date: Wed,  1 Feb 2023 14:32:23 +0200
Message-Id: <20230201123231.26361-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201123231.26361-1-peter.ujfalusi@linux.intel.com>
References: <20230201123231.26361-1-peter.ujfalusi@linux.intel.com>
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

