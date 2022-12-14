Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 560F864C77A
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 11:55:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97CCC2419;
	Wed, 14 Dec 2022 11:54:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97CCC2419
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671015339;
	bh=ZM/6Qk29C2N7v/XyHkpQgo5GfLrHVPMyzqRlHQRTobs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=devgh46QkiV3PMTnWxvE21ggSJkt3Zvw5S/xzDVd75plH+ejWnK2R6dI+sqniwQoe
	 +BeaUy0JYurTwVNFjgYiFxrIuUVxAPMp0n+2kQ4I2zSQrv8U/WhUiSDi1jC0MNAuqh
	 jSmdQ6WPoBGSsdfwNOfDnH7+m/swieRna/zH6fLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 187A1F801D5;
	Wed, 14 Dec 2022 11:54:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A852F801D5; Wed, 14 Dec 2022 11:54:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 788EAF801D5
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 11:54:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 788EAF801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OWqvETJq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671015256; x=1702551256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZM/6Qk29C2N7v/XyHkpQgo5GfLrHVPMyzqRlHQRTobs=;
 b=OWqvETJqL5kBqu1MJK0GxnMdM8ngTde6EKXpnfwaS88Rfes452Yfjnno
 VvKoVaj7wp2WsTd3BL7bot8bMGY+W3q5W/mx6WsxLuEpdNy9D92Ats8Px
 xtl6/vvK+JCX8hx59BHVbN1+0yC5EINwPv/lsGy35rUd/5JOEwa/2Y+16
 cjyY+rLt/aMCRcjTsXCjsNrd+83TbDWe+8uaKf/YWKc560Reh5gRBDzpf
 u1LvicQ3oPfbVjSN9M2uvipL4C+POFHUHrmSnGcQr2l4rZjJCfaBOSo+s
 mwpAaDOuG+UHJzkVymYu+nk4V/yeLTDKHxT43bVHrURcFczUG/Ur9RcMT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="318412879"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="318412879"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 02:54:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="679653306"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="679653306"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 14 Dec 2022 02:54:11 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/4] ASoC: Intel: avs: Add peakvol runtime-parameter requests
Date: Wed, 14 Dec 2022 19:54:57 +0100
Message-Id: <20221214185500.3896902-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214185500.3896902-1-amadeuszx.slawinski@linux.intel.com>
References: <20221214185500.3896902-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Peakvol module allows for setting and obtaining DSP volume as well as
modifying shape and duration at which volume actually changes. Add IPC
messages to expose those capabilities.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/messages.c | 29 +++++++++++++++++++++++++++++
 sound/soc/intel/avs/messages.h | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index e11ae4246416..f887ab5b0311 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -702,6 +702,35 @@ int avs_ipc_copier_set_sink_format(struct avs_dev *adev, u16 module_id,
 					(u8 *)&cpr_fmt, sizeof(cpr_fmt));
 }
 
+int avs_ipc_peakvol_set_volume(struct avs_dev *adev, u16 module_id, u8 instance_id,
+			       struct avs_volume_cfg *vol)
+{
+	return avs_ipc_set_large_config(adev, module_id, instance_id, AVS_PEAKVOL_VOLUME, (u8 *)vol,
+					sizeof(*vol));
+}
+
+int avs_ipc_peakvol_get_volume(struct avs_dev *adev, u16 module_id, u8 instance_id,
+			       struct avs_volume_cfg **vols, size_t *num_vols)
+{
+	size_t payload_size;
+	u8 *payload;
+	int ret;
+
+	ret = avs_ipc_get_large_config(adev, module_id, instance_id, AVS_PEAKVOL_VOLUME, NULL, 0,
+				       &payload, &payload_size);
+	if (ret)
+		return ret;
+
+	/* Non-zero payload expected for PEAKVOL_VOLUME. */
+	if (!payload_size)
+		return -EREMOTEIO;
+
+	*vols = (struct avs_volume_cfg *)payload;
+	*num_vols = payload_size / sizeof(**vols);
+
+	return 0;
+}
+
 #ifdef CONFIG_DEBUG_FS
 int avs_ipc_set_enable_logs(struct avs_dev *adev, u8 *log_info, size_t size)
 {
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 9dd835527e02..d3b60ae7d743 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -561,6 +561,12 @@ int avs_ipc_set_system_time(struct avs_dev *adev);
 #define AVS_COPIER_MOD_UUID \
 	GUID_INIT(0x9BA00C83, 0xCA12, 0x4A83, 0x94, 0x3C, 0x1F, 0xA2, 0xE8, 0x2F, 0x9D, 0xDA)
 
+#define AVS_PEAKVOL_MOD_UUID \
+	GUID_INIT(0x8A171323, 0x94A3, 0x4E1D, 0xAF, 0xE9, 0xFE, 0x5D, 0xBA, 0xa4, 0xC3, 0x93)
+
+#define AVS_GAIN_MOD_UUID \
+	GUID_INIT(0x61BCA9A8, 0x18D0, 0x4A18, 0x8E, 0x7B, 0x26, 0x39, 0x21, 0x98, 0x04, 0xB7)
+
 #define AVS_KPBUFF_MOD_UUID \
 	GUID_INIT(0xA8A0CB32, 0x4A77, 0x4DB1, 0x85, 0xC7, 0x53, 0xD7, 0xEE, 0x07, 0xBC, 0xE6)
 
@@ -729,6 +735,19 @@ struct avs_copier_cfg {
 	struct avs_copier_gtw_cfg gtw_cfg;
 } __packed;
 
+struct avs_volume_cfg {
+	u32 channel_id;
+	u32 target_volume;
+	u32 curve_type;
+	u32 reserved; /* alignment */
+	u64 curve_duration;
+} __packed;
+
+struct avs_peakvol_cfg {
+	struct avs_modcfg_base base;
+	struct avs_volume_cfg vols[];
+} __packed;
+
 struct avs_micsel_cfg {
 	struct avs_modcfg_base base;
 	struct avs_audio_format out_fmt;
@@ -802,6 +821,20 @@ int avs_ipc_copier_set_sink_format(struct avs_dev *adev, u16 module_id,
 				   const struct avs_audio_format *src_fmt,
 				   const struct avs_audio_format *sink_fmt);
 
+enum avs_peakvol_runtime_param {
+	AVS_PEAKVOL_VOLUME = 0,
+};
+
+enum avs_audio_curve_type {
+	AVS_AUDIO_CURVE_NONE = 0,
+	AVS_AUDIO_CURVE_WINDOWS_FADE = 1,
+};
+
+int avs_ipc_peakvol_set_volume(struct avs_dev *adev, u16 module_id, u8 instance_id,
+			       struct avs_volume_cfg *vol);
+int avs_ipc_peakvol_get_volume(struct avs_dev *adev, u16 module_id, u8 instance_id,
+			       struct avs_volume_cfg **vols, size_t *num_vols);
+
 #define AVS_PROBE_INST_ID	0
 
 enum avs_probe_runtime_param {
-- 
2.25.1

