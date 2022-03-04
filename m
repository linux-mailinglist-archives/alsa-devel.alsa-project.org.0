Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5638D4CD6FC
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 16:00:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDD6E1B06;
	Fri,  4 Mar 2022 15:59:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDD6E1B06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646406049;
	bh=Seoz8srvVmTM8vKg5Oz5rYDxBwi/6jVTsVMix1grgL8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jTg8VwNopY4xUh+NrCB0PWg6uzEtjstsdle9QMNod9bm7Xx6vAjzKlSiQSusIqWOD
	 p0oszCSWsmqZ925uRnq2X8XiY8LJxcX2iXV3yrYNUVDtLyL6OjhGP2JPrKYZTMTDoe
	 q1Cj6cyJAUDVR2JfvUxu9+Hj7UH5M5FF0oxJ4CQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16473F8057A;
	Fri,  4 Mar 2022 15:56:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D3BEF8057D; Fri,  4 Mar 2022 15:56:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E709F80566
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 15:56:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E709F80566
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JP6ae/z3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646405787; x=1677941787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Seoz8srvVmTM8vKg5Oz5rYDxBwi/6jVTsVMix1grgL8=;
 b=JP6ae/z39Xjpn6M5WagardZgOSChvij6a2PCruGLkVPjF2Wm767Wi0xy
 wS9UaLEoWUMqyPni0G6XTywIu/LmT1XbpLfpvL2r9GPKzq8ojoQ9XQyF+
 kaIbdAdj5Yx5VkBMAfm1J9jI5yBJxBBQztaZUll5BJOJASiYhNtsx7ywk
 AV+9bMfzeaRY1Ulqu0arENnObC8eMQKH1iELnDej/7VZcTTiAdA8qc/i6
 E1W+seIoV/HvkFe4o/paVgpCRRrLo/UesLGO5NgLtXDlOKBFZYvwLhBZB
 immhrmmkDw/PwQ5HCAsqFiVz8QzYyGs663cJpiUePi9q65uYCskAX9taV w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="233949208"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="233949208"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 06:56:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="609963523"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 04 Mar 2022 06:56:21 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 12/17] ASoC: Intel: avs: Declare module configuration types
Date: Fri,  4 Mar 2022 15:57:50 +0100
Message-Id: <20220304145755.2844173-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304145755.2844173-1-cezary.rojewski@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Declare structures and constants for all modules being part of basefw
binary. These are used in streaming operations to communicate the needs
of software to firmware side.

While adding module types, append handler for SET_SINK_FORMAT runtime
for COPIER module which allows for configuration of output pin other
than the default one (0).

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.c |  17 +++
 sound/soc/intel/avs/messages.h | 252 +++++++++++++++++++++++++++++++++
 2 files changed, 269 insertions(+)

diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index 7a2a7206df4b..44566705e56c 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -678,3 +678,20 @@ int avs_ipc_get_modules_info(struct avs_dev *adev, struct avs_mods_info **info)
 	*info = (struct avs_mods_info *)payload;
 	return 0;
 }
+
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
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 67ba0a6347a1..966139e9663d 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -498,4 +498,256 @@ static inline bool avs_module_entry_is_loaded(struct avs_module_entry *mentry)
 
 int avs_ipc_get_modules_info(struct avs_dev *adev, struct avs_mods_info **info);
 
+/* Module configuration */
+
+#define AVS_MIXIN_MOD_UUID \
+	GUID_INIT(0x39656EB2, 0x3B71, 0x4049, 0x8D, 0x3F, 0xF9, 0x2C, 0xD5, 0xC4, 0x3C, 0x09)
+
+#define AVS_MIXOUT_MOD_UUID \
+	GUID_INIT(0x3C56505A, 0x24D7, 0x418F, 0xBD, 0xDC, 0xC1, 0xF5, 0xA3, 0xAC, 0x2A, 0xE0)
+
+#define AVS_COPIER_MOD_UUID \
+	GUID_INIT(0x9BA00C83, 0xCA12, 0x4A83, 0x94, 0x3C, 0x1F, 0xA2, 0xE8, 0x2F, 0x9D, 0xDA)
+
+#define AVS_KPBUFF_MOD_UUID \
+	GUID_INIT(0xA8A0CB32, 0x4A77, 0x4DB1, 0x85, 0xC7, 0x53, 0xD7, 0xEE, 0x07, 0xBC, 0xE6)
+
+#define AVS_MICSEL_MOD_UUID \
+	GUID_INIT(0x32FE92C1, 0x1E17, 0x4FC2, 0x97, 0x58, 0xC7, 0xF3, 0x54, 0x2E, 0x98, 0x0A)
+
+#define AVS_MUX_MOD_UUID \
+	GUID_INIT(0x64CE6E35, 0x857A, 0x4878, 0xAC, 0xE8, 0xE2, 0xA2, 0xF4, 0x2e, 0x30, 0x69)
+
+#define AVS_UPDWMIX_MOD_UUID \
+	GUID_INIT(0x42F8060C, 0x832F, 0x4DBF, 0xB2, 0x47, 0x51, 0xE9, 0x61, 0x99, 0x7b, 0x35)
+
+#define AVS_SRCINTC_MOD_UUID \
+	GUID_INIT(0xE61BB28D, 0x149A, 0x4C1F, 0xB7, 0x09, 0x46, 0x82, 0x3E, 0xF5, 0xF5, 0xAE)
+
+#define AVS_PROBE_MOD_UUID \
+	GUID_INIT(0x7CAD0808, 0xAB10, 0xCD23, 0xEF, 0x45, 0x12, 0xAB, 0x34, 0xCD, 0x56, 0xEF)
+
+#define AVS_AEC_MOD_UUID \
+	GUID_INIT(0x46CB87FB, 0xD2C9, 0x4970, 0x96, 0xD2, 0x6D, 0x7E, 0x61, 0x4B, 0xB6, 0x05)
+
+#define AVS_ASRC_MOD_UUID \
+	GUID_INIT(0x66B4402D, 0xB468, 0x42F2, 0x81, 0xA7, 0xB3, 0x71, 0x21, 0x86, 0x3D, 0xD4)
+
+#define AVS_INTELWOV_MOD_UUID \
+	GUID_INIT(0xEC774FA9, 0x28D3, 0x424A, 0x90, 0xE4, 0x69, 0xF9, 0x84, 0xF1, 0xEE, 0xB7)
+
+/* channel map */
+enum avs_channel_index {
+	AVS_CHANNEL_LEFT = 0,
+	AVS_CHANNEL_RIGHT = 1,
+	AVS_CHANNEL_CENTER = 2,
+	AVS_CHANNEL_LEFT_SURROUND = 3,
+	AVS_CHANNEL_CENTER_SURROUND = 3,
+	AVS_CHANNEL_RIGHT_SURROUND = 4,
+	AVS_CHANNEL_LFE = 7,
+	AVS_CHANNEL_INVALID = 0xF,
+};
+
+enum avs_channel_config {
+	AVS_CHANNEL_CONFIG_MONO = 0,
+	AVS_CHANNEL_CONFIG_STEREO = 1,
+	AVS_CHANNEL_CONFIG_2_1 = 2,
+	AVS_CHANNEL_CONFIG_3_0 = 3,
+	AVS_CHANNEL_CONFIG_3_1 = 4,
+	AVS_CHANNEL_CONFIG_QUATRO = 5,
+	AVS_CHANNEL_CONFIG_4_0 = 6,
+	AVS_CHANNEL_CONFIG_5_0 = 7,
+	AVS_CHANNEL_CONFIG_5_1 = 8,
+	AVS_CHANNEL_CONFIG_DUAL_MONO = 9,
+	AVS_CHANNEL_CONFIG_I2S_DUAL_STEREO_0 = 10,
+	AVS_CHANNEL_CONFIG_I2S_DUAL_STEREO_1 = 11,
+	AVS_CHANNEL_CONFIG_4_CHANNEL = 12,
+	AVS_CHANNEL_CONFIG_INVALID
+};
+
+enum avs_interleaving {
+	AVS_INTERLEAVING_PER_CHANNEL = 0,
+	AVS_INTERLEAVING_PER_SAMPLE = 1,
+};
+
+enum avs_sample_type {
+	AVS_SAMPLE_TYPE_INT_MSB = 0,
+	AVS_SAMPLE_TYPE_INT_LSB = 1,
+	AVS_SAMPLE_TYPE_INT_SIGNED = 2,
+	AVS_SAMPLE_TYPE_INT_UNSIGNED = 3,
+	AVS_SAMPLE_TYPE_FLOAT = 4,
+};
+
+#define AVS_CHANNELS_MAX	8
+#define AVS_ALL_CHANNELS_MASK	UINT_MAX
+
+struct avs_audio_format {
+	u32 sampling_freq;
+	u32 bit_depth;
+	u32 channel_map;
+	u32 channel_config;
+	u32 interleaving;
+	u32 num_channels:8;
+	u32 valid_bit_depth:8;
+	u32 sample_type:8;
+	u32 reserved:8;
+} __packed;
+
+struct avs_modcfg_base {
+	u32 cpc;
+	u32 ibs;
+	u32 obs;
+	u32 is_pages;
+	struct avs_audio_format audio_fmt;
+} __packed;
+
+struct avs_pin_format {
+	u32 pin_index;
+	u32 iobs;
+	struct avs_audio_format audio_fmt;
+} __packed;
+
+struct avs_modcfg_ext {
+	struct avs_modcfg_base base;
+	u16 num_input_pins;
+	u16 num_output_pins;
+	u8 reserved[12];
+	/* input pin formats followed by output ones */
+	struct avs_pin_format pin_fmts[];
+} __packed;
+
+enum avs_dma_type {
+	AVS_DMA_HDA_HOST_OUTPUT = 0,
+	AVS_DMA_HDA_HOST_INPUT = 1,
+	AVS_DMA_HDA_LINK_OUTPUT = 8,
+	AVS_DMA_HDA_LINK_INPUT = 9,
+	AVS_DMA_DMIC_LINK_INPUT = 11,
+	AVS_DMA_I2S_LINK_OUTPUT = 12,
+	AVS_DMA_I2S_LINK_INPUT = 13,
+};
+
+union avs_virtual_index {
+	u8 val;
+	struct {
+		u8 time_slot:4;
+		u8 instance:4;
+	} i2s;
+	struct {
+		u8 queue_id:3;
+		u8 time_slot:2;
+		u8 instance:3;
+	} dmic;
+} __packed;
+
+union avs_connector_node_id {
+	u32 val;
+	struct {
+		u32 vindex:8;
+		u32 dma_type:5;
+		u32 rsvd:19;
+	};
+} __packed;
+
+#define INVALID_PIPELINE_ID	0xFF
+#define INVALID_NODE_ID \
+	((union avs_connector_node_id) { UINT_MAX })
+
+union avs_gtw_attributes {
+	u32 val;
+	struct {
+		u32 lp_buffer_alloc:1;
+		u32 rsvd:31;
+	};
+} __packed;
+
+struct avs_copier_gtw_cfg {
+	union avs_connector_node_id node_id;
+	u32 dma_buffer_size;
+	u32 config_length;
+	struct {
+		union avs_gtw_attributes attrs;
+		u32 blob[];
+	} config;
+} __packed;
+
+struct avs_copier_cfg {
+	struct avs_modcfg_base base;
+	struct avs_audio_format out_fmt;
+	u32 feature_mask;
+	struct avs_copier_gtw_cfg gtw_cfg;
+} __packed;
+
+struct avs_micsel_cfg {
+	struct avs_modcfg_base base;
+	struct avs_audio_format out_fmt;
+} __packed;
+
+struct avs_mux_cfg {
+	struct avs_modcfg_base base;
+	struct avs_audio_format ref_fmt;
+	struct avs_audio_format out_fmt;
+} __packed;
+
+struct avs_updown_mixer_cfg {
+	struct avs_modcfg_base base;
+	u32 out_channel_config;
+	u32 coefficients_select;
+	s32 coefficients[AVS_CHANNELS_MAX];
+	u32 channel_map;
+} __packed;
+
+struct avs_src_cfg {
+	struct avs_modcfg_base base;
+	u32 out_freq;
+} __packed;
+
+struct avs_probe_gtw_cfg {
+	union avs_connector_node_id node_id;
+	u32 dma_buffer_size;
+} __packed;
+
+struct avs_probe_cfg {
+	struct avs_modcfg_base base;
+	struct avs_probe_gtw_cfg gtw_cfg;
+} __packed;
+
+struct avs_aec_cfg {
+	struct avs_modcfg_base base;
+	struct avs_audio_format ref_fmt;
+	struct avs_audio_format out_fmt;
+	u32 cpc_lp_mode;
+} __packed;
+
+struct avs_asrc_cfg {
+	struct avs_modcfg_base base;
+	u32 out_freq;
+	u32 rsvd0:1;
+	u32 mode:1;
+	u32 rsvd2:2;
+	u32 disable_jitter_buffer:1;
+	u32 rsvd3:27;
+} __packed;
+
+struct avs_wov_cfg {
+	struct avs_modcfg_base base;
+	u32 cpc_lp_mode;
+} __packed;
+
+/* Module runtime parameters */
+
+enum avs_copier_runtime_param {
+	AVS_COPIER_SET_SINK_FORMAT = 2,
+};
+
+struct avs_copier_sink_format {
+	u32 sink_id;
+	struct avs_audio_format src_fmt;
+	struct avs_audio_format sink_fmt;
+} __packed;
+
+int avs_ipc_copier_set_sink_format(struct avs_dev *adev, u16 module_id,
+				   u8 instance_id, u32 sink_id,
+				   const struct avs_audio_format *src_fmt,
+				   const struct avs_audio_format *sink_fmt);
+
 #endif /* __SOUND_SOC_INTEL_AVS_MSGS_H */
-- 
2.25.1

