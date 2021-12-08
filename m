Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1982946D1F9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:18:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6DCF25D8;
	Wed,  8 Dec 2021 12:17:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6DCF25D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962309;
	bh=EGoSQVIs9ez68C1hkUNyVDrZRRK35aFGObMpOSMPYvU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fc4RLHqGpmVPZL8o0YyOO9XRheUGqJ3ToUt/tp1as1RwTRXQyii7pz98bNTz8BCRG
	 Q89ZZrzHLxqi9UdJIHQ+gUB0COyxuZ92PlBhQ3+T7O1zMNRFgApSStChZ8MCjKUiNh
	 J7M0Ur2Gpe6Jo5XaNUjmXV1tMR+OfB9q6K7W+dFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A07CFF805AD;
	Wed,  8 Dec 2021 12:12:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 229A2F805AC; Wed,  8 Dec 2021 12:12:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49CB0F8057A
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49CB0F8057A
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236548379"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="236548379"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:11:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600268"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:11:49 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 18/37] ASoC: Intel: avs: Topology parsing
Date: Wed,  8 Dec 2021 12:12:42 +0100
Message-Id: <20211208111301.1817725-19-cezary.rojewski@intel.com>
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

Implementation of ASoC topology feature for AVS driver. AudioDSP
firmware supports a wide range of audio formats, module configurations
and multi-pipeline streams. To represent all of this in form of static
ALSA topology file, which resides usually in /lib/firmware/, while
simultaneously not hindering user from any of the possibilities, 'path
template' and its 'path variants' concept is introduced. These are later
converted into actual runtime path. This part is explained in follow-up
change.

Path template is just a pattern like its name suggests. It is tied to
DAPM widget which represents a FE or a BE and is used during path
instantiation when substream is opened for streaming. It carries a range
of available variants and only these represent actual implementation of
a runtime path in AudioDSP. Only one variant of given path template can
be instantiated at a time and selection is based off of audio format
provided from userspace and currently selected one on the codec.

As firmware needs concrete data, every piece the stream is made of -
pipelines, modules - has its representing type in topology.h file. These
match firmware equivalents 1:1 in most cases. To reduce the number of
structures added - given the range of configurations supported - union
is enlisted.

AVS topology is split into two major parts: dictionaries - found within
ASoC topology manifest - and path templates - found within DAPM widget
private data. Dictionaries job is to reduce the total amount of memory
occupied by topology elements. Rather than having every pipeline and
module carry its own information, each refers to specific entry in
specific dictionary by provided (from topology file) indexes and thus
all avs_tplg_* structures and unions are mostly made of pointer fields.

tokens.h header exposes range of driver-specific tuples recognized. To
reduce code size, parsing mechanism focused around struct
avs_tplg_token_parser is added. Primitive handlers translate all
value-types known to ALSA: uuid, bool, byte, short, word and string.
Several custom parsers handle pointer-types and more complex objects.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/uapi/sound/intel/avs/tokens.h |  131 +++
 sound/soc/intel/Kconfig               |    1 +
 sound/soc/intel/avs/Makefile          |    2 +-
 sound/soc/intel/avs/avs.h             |   16 +
 sound/soc/intel/avs/topology.c        | 1565 +++++++++++++++++++++++++
 sound/soc/intel/avs/topology.h        |  195 +++
 6 files changed, 1909 insertions(+), 1 deletion(-)
 create mode 100644 include/uapi/sound/intel/avs/tokens.h
 create mode 100644 sound/soc/intel/avs/topology.c
 create mode 100644 sound/soc/intel/avs/topology.h

diff --git a/include/uapi/sound/intel/avs/tokens.h b/include/uapi/sound/intel/avs/tokens.h
new file mode 100644
index 000000000000..3621227b89b9
--- /dev/null
+++ b/include/uapi/sound/intel/avs/tokens.h
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ *
+ * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+ *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+ */
+
+#ifndef __UAPI_SOUND_INTEL_AVS_TOKENS_H
+#define __UAPI_SOUND_INTEL_AVS_TOKENS_H
+
+enum avs_tplg_token {
+	/* struct avs_tplg */
+	AVS_TKN_MANIFEST_NAME_STRING			= 1,
+	AVS_TKN_MANIFEST_VERSION_U32			= 2,
+	AVS_TKN_MANIFEST_NUM_LIBRARIES_U32		= 3,
+	AVS_TKN_MANIFEST_NUM_AFMTS_U32			= 4,
+	AVS_TKN_MANIFEST_NUM_MODCFGS_BASE_U32		= 5,
+	AVS_TKN_MANIFEST_NUM_MODCFGS_EXT_U32		= 6,
+	AVS_TKN_MANIFEST_NUM_PPLCFGS_U32		= 7,
+	AVS_TKN_MANIFEST_NUM_BINDINGS_U32		= 8,
+
+	/* struct avs_tplg_library */
+	AVS_TKN_LIBRARY_ID_U32				= 101,
+	AVS_TKN_LIBRARY_NAME_STRING			= 102,
+
+	/* struct avs_audio_format */
+	AVS_TKN_AFMT_ID_U32				= 201,
+	AVS_TKN_AFMT_SAMPLE_RATE_U32			= 202,
+	AVS_TKN_AFMT_BIT_DEPTH_U32			= 203,
+	AVS_TKN_AFMT_CHANNEL_MAP_U32			= 204,
+	AVS_TKN_AFMT_CHANNEL_CFG_U32			= 205,
+	AVS_TKN_AFMT_INTERLEAVING_U32			= 206,
+	AVS_TKN_AFMT_NUM_CHANNELS_U32			= 207,
+	AVS_TKN_AFMT_VALID_BIT_DEPTH_U32		= 208,
+	AVS_TKN_AFMT_SAMPLE_TYPE_U32			= 209,
+
+	/* struct avs_tplg_modcfg_base */
+	AVS_TKN_MODCFG_BASE_ID_U32			= 301,
+	AVS_TKN_MODCFG_BASE_CPC_U32			= 302,
+	AVS_TKN_MODCFG_BASE_IBS_U32			= 303,
+	AVS_TKN_MODCFG_BASE_OBS_U32			= 304,
+	AVS_TKN_MODCFG_BASE_PAGES_U32			= 305,
+
+	/* struct avs_tplg_modcfg_ext */
+	AVS_TKN_MODCFG_EXT_ID_U32			= 401,
+	AVS_TKN_MODCFG_EXT_TYPE_UUID			= 402,
+	AVS_TKN_MODCFG_CPR_OUT_AFMT_ID_U32		= 403,
+	AVS_TKN_MODCFG_CPR_FEATURE_MASK_U32		= 404,
+	AVS_TKN_MODCFG_CPR_DMA_TYPE_U32			= 405,
+	AVS_TKN_MODCFG_CPR_DMABUFF_SIZE_U32		= 406,
+	AVS_TKN_MODCFG_CPR_VINDEX_U8			= 407,
+	AVS_TKN_MODCFG_CPR_BLOB_FMT_ID_U32		= 408,
+	AVS_TKN_MODCFG_MICSEL_OUT_AFMT_ID_U32		= 409,
+	AVS_TKN_MODCFG_INTELWOV_CPC_LP_MODE_U32		= 410,
+	AVS_TKN_MODCFG_SRC_OUT_FREQ_U32			= 411,
+	AVS_TKN_MODCFG_PEAKVOL_CHANNEL_ID_U32		= 412,
+	AVS_TKN_MODCFG_PEAKVOL_TARGET_VOL_U32		= 413,
+	AVS_TKN_MODCFG_PEAKVOL_CURVE_TYPE_U32		= 414,
+	AVS_TKN_MODCFG_PEAKVOL_CURVE_DURATION_UP_U32	= 415,
+	AVS_TKN_MODCFG_PEAKVOL_CURVE_DURATION_LO_U32	= 416,
+	AVS_TKN_MODCFG_MUX_REF_AFMT_ID_U32		= 417,
+	AVS_TKN_MODCFG_MUX_OUT_AFMT_ID_U32		= 418,
+	AVS_TKN_MODCFG_AEC_REF_AFMT_ID_U32		= 419,
+	AVS_TKN_MODCFG_AEC_OUT_AFMT_ID_U32		= 420,
+	AVS_TKN_MODCFG_AEC_CPC_LP_MODE_U32		= 421,
+	AVS_TKN_MODCFG_ASRC_OUT_FREQ_U32		= 422,
+	AVS_TKN_MODCFG_ASRC_MODE_U8			= 423,
+	AVS_TKN_MODCFG_ASRC_DISABLE_JITTER_U8		= 424,
+	AVS_TKN_MODCFG_UPDOWN_MIX_OUT_CHAN_CFG_U32	= 425,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_SELECT_U32	= 426,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_0_S32		= 427,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_1_S32		= 428,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_2_S32		= 429,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_3_S32		= 430,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_4_S32		= 431,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_5_S32		= 432,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_6_S32		= 433,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_7_S32		= 434,
+	AVS_TKN_MODCFG_UPDOWN_MIX_CHAN_MAP_U32		= 435,
+	AVS_TKN_MODCFG_EXT_NUM_INPUT_PINS_U16		= 436,
+	AVS_TKN_MODCFG_EXT_NUM_OUTPUT_PINS_U16		= 437,
+
+	/* struct avs_tplg_pplcfg */
+	AVS_TKN_PPLCFG_ID_U32				= 1401,
+	AVS_TKN_PPLCFG_REQ_SIZE_U16			= 1402,
+	AVS_TKN_PPLCFG_PRIORITY_U8			= 1403,
+	AVS_TKN_PPLCFG_LOW_POWER_BOOL			= 1404,
+	AVS_TKN_PPLCFG_ATTRIBUTES_U16			= 1405,
+	AVS_TKN_PPLCFG_TRIGGER_U32			= 1406,
+
+	/* struct avs_tplg_binding */
+	AVS_TKN_BINDING_ID_U32				= 1501,
+	AVS_TKN_BINDING_TARGET_TPLG_NAME_STRING		= 1502,
+	AVS_TKN_BINDING_TARGET_PATH_TMPL_ID_U32		= 1503,
+	AVS_TKN_BINDING_TARGET_PPL_ID_U32		= 1504,
+	AVS_TKN_BINDING_TARGET_MOD_ID_U32		= 1505,
+	AVS_TKN_BINDING_TARGET_MOD_PIN_U8		= 1506,
+	AVS_TKN_BINDING_MOD_ID_U32			= 1507,
+	AVS_TKN_BINDING_MOD_PIN_U8			= 1508,
+	AVS_TKN_BINDING_IS_SINK_U8			= 1509,
+
+	/* struct avs_tplg_pipeline */
+	AVS_TKN_PPL_ID_U32				= 1601,
+	AVS_TKN_PPL_PPLCFG_ID_U32			= 1602,
+	AVS_TKN_PPL_NUM_BINDING_IDS_U32			= 1603,
+	AVS_TKN_PPL_BINDING_ID_U32			= 1604,
+
+	/* struct avs_tplg_module */
+	AVS_TKN_MOD_ID_U32				= 1701,
+	AVS_TKN_MOD_MODCFG_BASE_ID_U32			= 1702,
+	AVS_TKN_MOD_IN_AFMT_ID_U32			= 1703,
+	AVS_TKN_MOD_CORE_ID_U8				= 1704,
+	AVS_TKN_MOD_PROC_DOMAIN_U8			= 1705,
+	AVS_TKN_MOD_MODCFG_EXT_ID_U32			= 1706,
+
+	/* struct avs_tplg_path_template */
+	AVS_TKN_PATH_TMPL_ID_U32			= 1801,
+
+	/* struct avs_tplg_path */
+	AVS_TKN_PATH_ID_U32				= 1901,
+	AVS_TKN_PATH_FE_FMT_ID_U32			= 1902,
+	AVS_TKN_PATH_BE_FMT_ID_U32			= 1903,
+
+	/* struct avs_tplg_pin_format */
+	AVS_TKN_PIN_FMT_INDEX_U32			= 2201,
+	AVS_TKN_PIN_FMT_IOBS_U32			= 2202,
+	AVS_TKN_PIN_FMT_AFMT_ID_U32			= 2203,
+};
+
+#endif
diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 5b4941d88101..dddd2cc8fef3 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -216,6 +216,7 @@ config SND_SOC_INTEL_AVS
 	depends on SND_SOC_INTEL_SKYLAKE_FAMILY=n
 	default n
 	select SND_SOC_ACPI
+	select SND_SOC_TOPOLOGY
 	select SND_HDA_EXT_CORE
 	help
 	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index d9f92c5f5407..c7f1623264af 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o
+snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o topology.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 44b3b87a10b9..701802017423 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -11,9 +11,11 @@
 
 #include <linux/device.h>
 #include <sound/hda_codec.h>
+#include <sound/soc-component.h>
 #include "messages.h"
 
 struct avs_dev;
+struct avs_tplg;
 
 struct avs_dsp_ops {
 	int (* const power)(struct avs_dev *, u32, bool);
@@ -197,4 +199,18 @@ int avs_dsp_create_pipeline(struct avs_dev *adev, u16 req_size, u8 priority,
 			    bool lp, u16 attributes, u8 *instance_id);
 int avs_dsp_delete_pipeline(struct avs_dev *adev, u8 instance_id);
 
+/* Soc component members */
+
+struct avs_soc_component {
+	struct snd_soc_component base;
+	struct avs_tplg *tplg;
+
+	struct list_head node;
+};
+
+#define to_avs_soc_component(comp) \
+	container_of(comp, struct avs_soc_component, base)
+
+extern const struct snd_soc_dai_ops avs_dai_fe_ops;
+
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
new file mode 100644
index 000000000000..c33e1b415f52
--- /dev/null
+++ b/sound/soc/intel/avs/topology.c
@@ -0,0 +1,1565 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/firmware.h>
+#include <linux/uuid.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-topology.h>
+#include <uapi/sound/intel/avs/tokens.h>
+#include "avs.h"
+#include "topology.h"
+
+const struct snd_soc_dai_ops avs_dai_fe_ops;
+
+/* Vendor tuples manipulation helpers */
+#define avs_tplg_vendor_array_at(array, offset) \
+	((struct snd_soc_tplg_vendor_array *)((u8 *)array + offset))
+
+#define avs_tplg_vendor_array_next(array) \
+	(avs_tplg_vendor_array_at(array, le32_to_cpu((array)->size)))
+
+static int
+avs_tplg_vendor_array_lookup(struct snd_soc_tplg_vendor_array *tuples,
+			     u32 block_size, u32 token, u32 *offset)
+{
+	u32 pos = 0;
+
+	while (block_size > 0) {
+		struct snd_soc_tplg_vendor_value_elem *tuple;
+		u32 tuples_size = le32_to_cpu(tuples->size);
+
+		if (tuples_size > block_size)
+			return -EINVAL;
+
+		tuple = tuples->value;
+		if (le32_to_cpu(tuple->token) == token) {
+			*offset = pos;
+			return 0;
+		}
+
+		block_size -= tuples_size;
+		pos += tuples_size;
+		tuples = avs_tplg_vendor_array_next(tuples);
+	}
+
+	return -ENOENT;
+}
+
+static int
+avs_tplg_vendor_array_lookup_next(struct snd_soc_tplg_vendor_array *tuples,
+				  u32 block_size, u32 token, u32 *offset)
+{
+	u32 tuples_size = le32_to_cpu(tuples->size);
+	int ret;
+
+	if (tuples_size > block_size)
+		return -EINVAL;
+
+	tuples = avs_tplg_vendor_array_next(tuples);
+	block_size -= tuples_size;
+
+	ret = avs_tplg_vendor_array_lookup(tuples, block_size, token, offset);
+	if (!ret)
+		*offset += tuples_size;
+	return ret;
+}
+
+static int
+avs_tplg_vendor_entry_size(struct snd_soc_tplg_vendor_array *tuples,
+			   u32 block_size, u32 entry_id_token, u32 *size)
+{
+	int ret;
+
+	ret = avs_tplg_vendor_array_lookup_next(tuples, block_size, entry_id_token, size);
+	if (ret == -ENOENT) {
+		*size = block_size;
+		ret = 0;
+	}
+
+	return ret;
+}
+
+struct avs_tplg_token_parser {
+	enum avs_tplg_token token;
+	u32 type;
+	u32 offset;
+	int (*parse)(struct snd_soc_component *comp, void *elem, void *object, u32 offset);
+};
+
+static int
+avs_parse_uuid_token(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
+{
+	struct snd_soc_tplg_vendor_value_elem *tuple = elem;
+	guid_t *val = (guid_t *)((u8 *)object + offset);
+
+	guid_copy((guid_t *)val, (const guid_t *)&tuple->value);
+
+	return 0;
+}
+
+static int
+avs_parse_bool_token(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
+{
+	struct snd_soc_tplg_vendor_value_elem *tuple = elem;
+	bool *val = (bool *)((u8 *)object + offset);
+
+	*val = le32_to_cpu(tuple->value);
+
+	return 0;
+}
+
+static int
+avs_parse_byte_token(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
+{
+	struct snd_soc_tplg_vendor_value_elem *tuple = elem;
+	u8 *val = ((u8 *)object + offset);
+
+	*val = le32_to_cpu(tuple->value);
+
+	return 0;
+}
+
+static int
+avs_parse_short_token(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
+{
+	struct snd_soc_tplg_vendor_value_elem *tuple = elem;
+	u16 *val = (u16 *)((u8 *)object + offset);
+
+	*val = le32_to_cpu(tuple->value);
+
+	return 0;
+}
+
+static int
+avs_parse_word_token(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
+{
+	struct snd_soc_tplg_vendor_value_elem *tuple = elem;
+	u32 *val = (u32 *)((u8 *)object + offset);
+
+	*val = le32_to_cpu(tuple->value);
+
+	return 0;
+}
+
+static int
+avs_parse_string_token(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
+{
+	struct snd_soc_tplg_vendor_string_elem *tuple = elem;
+	char *val = (char *)((u8 *)object + offset);
+
+	snprintf(val, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s", tuple->string);
+
+	return 0;
+}
+
+static int avs_parse_uuid_tokens(struct snd_soc_component *comp, void *object,
+				 const struct avs_tplg_token_parser *parsers, int count,
+				 struct snd_soc_tplg_vendor_array *tuples)
+{
+	struct snd_soc_tplg_vendor_uuid_elem *tuple;
+	int ret, i, j;
+
+	/* Parse element by element. */
+	for (i = 0; i < le32_to_cpu(tuples->num_elems); i++) {
+		tuple = &tuples->uuid[i];
+
+		for (j = 0; j < count; j++) {
+			/* Ignore non-UUID tokens. */
+			if (parsers[j].type != SND_SOC_TPLG_TUPLE_TYPE_UUID ||
+			    parsers[j].token != le32_to_cpu(tuple->token))
+				continue;
+
+			ret = parsers[j].parse(comp, tuple, object, parsers[j].offset);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int avs_parse_string_tokens(struct snd_soc_component *comp, void *object,
+				   const struct avs_tplg_token_parser *parsers, int count,
+				   struct snd_soc_tplg_vendor_array *tuples)
+{
+	struct snd_soc_tplg_vendor_string_elem *tuple;
+	int ret, i, j;
+
+	/* Parse element by element. */
+	for (i = 0; i < le32_to_cpu(tuples->num_elems); i++) {
+		tuple = &tuples->string[i];
+
+		for (j = 0; j < count; j++) {
+			/* Ignore non-string tokens. */
+			if (parsers[j].type != SND_SOC_TPLG_TUPLE_TYPE_STRING ||
+			    parsers[j].token != le32_to_cpu(tuple->token))
+				continue;
+
+			ret = parsers[j].parse(comp, tuple, object, parsers[j].offset);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int avs_parse_word_tokens(struct snd_soc_component *comp, void *object,
+				 const struct avs_tplg_token_parser *parsers, int count,
+				 struct snd_soc_tplg_vendor_array *tuples)
+{
+	struct snd_soc_tplg_vendor_value_elem *tuple;
+	int ret, i, j;
+
+	/* Parse element by element. */
+	for (i = 0; i < le32_to_cpu(tuples->num_elems); i++) {
+		tuple = &tuples->value[i];
+
+		for (j = 0; j < count; j++) {
+			/* Ignore non-integer tokens. */
+			if (!(parsers[j].type == SND_SOC_TPLG_TUPLE_TYPE_WORD ||
+			      parsers[j].type == SND_SOC_TPLG_TUPLE_TYPE_SHORT ||
+			      parsers[j].type == SND_SOC_TPLG_TUPLE_TYPE_BYTE ||
+			      parsers[j].type == SND_SOC_TPLG_TUPLE_TYPE_BOOL))
+				continue;
+
+			if (parsers[j].token != le32_to_cpu(tuple->token))
+				continue;
+
+			ret = parsers[j].parse(comp, tuple, object, parsers[j].offset);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int avs_parse_tokens(struct snd_soc_component *comp, void *object,
+			    const struct avs_tplg_token_parser *parsers, size_t count,
+			    struct snd_soc_tplg_vendor_array *tuples, int priv_size)
+{
+	int array_size, ret;
+
+	while (priv_size > 0) {
+		array_size = le32_to_cpu(tuples->size);
+
+		if (array_size <= 0) {
+			dev_err(comp->dev, "invalid array size 0x%x\n", array_size);
+			return -EINVAL;
+		}
+
+		/* Make sure there is enough data before parsing. */
+		priv_size -= array_size;
+		if (priv_size < 0) {
+			dev_err(comp->dev, "invalid array size 0x%x\n", array_size);
+			return -EINVAL;
+		}
+
+		switch (le32_to_cpu(tuples->type)) {
+		case SND_SOC_TPLG_TUPLE_TYPE_UUID:
+			ret = avs_parse_uuid_tokens(comp, object, parsers, count, tuples);
+			break;
+		case SND_SOC_TPLG_TUPLE_TYPE_STRING:
+			ret = avs_parse_string_tokens(comp, object, parsers, count, tuples);
+			break;
+		case SND_SOC_TPLG_TUPLE_TYPE_BOOL:
+		case SND_SOC_TPLG_TUPLE_TYPE_BYTE:
+		case SND_SOC_TPLG_TUPLE_TYPE_SHORT:
+		case SND_SOC_TPLG_TUPLE_TYPE_WORD:
+			ret = avs_parse_word_tokens(comp, object, parsers, count, tuples);
+			break;
+		default:
+			dev_err(comp->dev, "unknown token type %d\n", tuples->type);
+			ret = -EINVAL;
+		}
+
+		if (ret) {
+			dev_err(comp->dev, "parsing %ld tokens of %d type failed: %d\n",
+				count, tuples->type, ret);
+			return ret;
+		}
+
+		tuples = avs_tplg_vendor_array_next(tuples);
+	}
+
+	return 0;
+}
+
+#define AVS_DEFINE_PTR_PARSER(name, type, member) \
+static int \
+avs_parse_##name##_ptr(struct snd_soc_component *comp, void *elem, void *object, u32 offset) \
+{ \
+	struct snd_soc_tplg_vendor_value_elem *tuple = elem;		\
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);	\
+	type **val = (type **)(object + offset);			\
+	u32 idx;							\
+									\
+	idx = le32_to_cpu(tuple->value);				\
+	if (idx >= acomp->tplg->num_##member)				\
+		return -EINVAL;						\
+									\
+	*val = &acomp->tplg->member[idx];				\
+									\
+	return 0;							\
+}
+
+AVS_DEFINE_PTR_PARSER(audio_format, struct avs_audio_format, fmts);
+AVS_DEFINE_PTR_PARSER(modcfg_base, struct avs_tplg_modcfg_base, modcfgs_base);
+AVS_DEFINE_PTR_PARSER(modcfg_ext, struct avs_tplg_modcfg_ext, modcfgs_ext);
+AVS_DEFINE_PTR_PARSER(pplcfg, struct avs_tplg_pplcfg, pplcfgs);
+AVS_DEFINE_PTR_PARSER(binding, struct avs_tplg_binding, bindings);
+
+static int
+parse_audio_format_bitfield(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
+{
+	struct snd_soc_tplg_vendor_value_elem *velem = elem;
+	struct avs_audio_format *audio_format = object;
+
+	switch (offset) {
+	case AVS_TKN_AFMT_NUM_CHANNELS_U32:
+		audio_format->num_channels = le32_to_cpu(velem->value);
+		break;
+	case AVS_TKN_AFMT_VALID_BIT_DEPTH_U32:
+		audio_format->valid_bit_depth = le32_to_cpu(velem->value);
+		break;
+	case AVS_TKN_AFMT_SAMPLE_TYPE_U32:
+		audio_format->sample_type = le32_to_cpu(velem->value);
+		break;
+	}
+
+	return 0;
+}
+
+static int parse_link_formatted_string(struct snd_soc_component *comp, void *elem,
+				       void *object, u32 offset)
+{
+	struct snd_soc_tplg_vendor_string_elem *tuple = elem;
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(comp->card->dev);
+	char *val = (char *)((u8 *)object + offset);
+
+	/*
+	 * Dynamic naming - string formats, e.g.: ssp%d - supported only for
+	 * topologies describing single device e.g.: an I2S codec on SSP0.
+	 */
+	if (hweight_long(mach->link_mask) != 1)
+		return avs_parse_string_token(comp, elem, object, offset);
+
+	snprintf(val, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, tuple->string,
+		 __ffs(mach->link_mask));
+
+	return 0;
+}
+
+static int
+parse_dictionary_header(struct snd_soc_component *comp,
+			struct snd_soc_tplg_vendor_array *tuples,
+			void **dict, u32 *num_entries, size_t entry_size,
+			u32 num_entries_token)
+{
+	struct snd_soc_tplg_vendor_value_elem *tuple;
+
+	/* Dictionary header consists of single tuple - entry count. */
+	tuple = tuples->value;
+	if (le32_to_cpu(tuple->token) != num_entries_token) {
+		dev_err(comp->dev, "invalid dictionary header, expected: %d\n",
+			num_entries_token);
+		return -EINVAL;
+	}
+
+	*num_entries = le32_to_cpu(tuple->value);
+	*dict = devm_kcalloc(comp->card->dev, *num_entries, entry_size, GFP_KERNEL);
+	if (!*dict)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int
+parse_dictionary_entries(struct snd_soc_component *comp,
+			 struct snd_soc_tplg_vendor_array *tuples, u32 block_size,
+			 void *dict, u32 num_entries, size_t entry_size,
+			 u32 entry_id_token,
+			 const struct avs_tplg_token_parser *parsers, size_t num_parsers)
+{
+	void *pos = dict;
+	int i;
+
+	for (i = 0; i < num_entries; i++) {
+		u32 esize;
+		int ret;
+
+		ret = avs_tplg_vendor_entry_size(tuples, block_size,
+						 entry_id_token, &esize);
+		if (ret)
+			return ret;
+
+		ret = avs_parse_tokens(comp, pos, parsers, num_parsers, tuples, esize);
+		if (ret < 0) {
+			dev_err(comp->dev, "parse entry: %d of type: %d failed: %d\n",
+				i, entry_id_token, ret);
+			return ret;
+		}
+
+		pos += entry_size;
+		block_size -= esize;
+		tuples = avs_tplg_vendor_array_at(tuples, esize);
+	}
+
+	return 0;
+}
+
+static int parse_dictionary(struct snd_soc_component *comp,
+			    struct snd_soc_tplg_vendor_array *tuples, u32 block_size,
+			    void **dict, u32 *num_entries, size_t entry_size,
+			    u32 num_entries_token, u32 entry_id_token,
+			    const struct avs_tplg_token_parser *parsers, size_t num_parsers)
+{
+	int ret;
+
+	ret = parse_dictionary_header(comp, tuples, dict, num_entries,
+				      entry_size, num_entries_token);
+	if (ret)
+		return ret;
+
+	block_size -= le32_to_cpu(tuples->size);
+	/* With header parsed, move on to parsing entries. */
+	tuples = avs_tplg_vendor_array_next(tuples);
+
+	return parse_dictionary_entries(comp, tuples, block_size, *dict,
+					*num_entries, entry_size,
+					entry_id_token, parsers, num_parsers);
+}
+
+static const struct avs_tplg_token_parser library_parsers[] = {
+	{
+		.token = AVS_TKN_LIBRARY_NAME_STRING,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_STRING,
+		.offset = offsetof(struct avs_tplg_library, name),
+		.parse = avs_parse_string_token,
+	},
+};
+
+static int avs_tplg_parse_libraries(struct snd_soc_component *comp,
+				    struct snd_soc_tplg_vendor_array *tuples, u32 block_size)
+{
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);
+	struct avs_tplg *tplg = acomp->tplg;
+
+	return parse_dictionary(comp, tuples, block_size, (void **)&tplg->libs,
+				&tplg->num_libs, sizeof(*tplg->libs),
+				AVS_TKN_MANIFEST_NUM_LIBRARIES_U32,
+				AVS_TKN_LIBRARY_ID_U32,
+				library_parsers, ARRAY_SIZE(library_parsers));
+}
+
+static const struct avs_tplg_token_parser audio_format_parsers[] = {
+	{
+		.token = AVS_TKN_AFMT_SAMPLE_RATE_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_audio_format, sampling_freq),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_AFMT_BIT_DEPTH_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_audio_format, bit_depth),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_AFMT_CHANNEL_MAP_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_audio_format, channel_map),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_AFMT_CHANNEL_CFG_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_audio_format, channel_config),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_AFMT_INTERLEAVING_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_audio_format, interleaving),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_AFMT_NUM_CHANNELS_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = AVS_TKN_AFMT_NUM_CHANNELS_U32,
+		.parse = parse_audio_format_bitfield,
+	},
+	{
+		.token = AVS_TKN_AFMT_VALID_BIT_DEPTH_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = AVS_TKN_AFMT_VALID_BIT_DEPTH_U32,
+		.parse = parse_audio_format_bitfield,
+	},
+	{
+		.token = AVS_TKN_AFMT_SAMPLE_TYPE_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = AVS_TKN_AFMT_SAMPLE_TYPE_U32,
+		.parse = parse_audio_format_bitfield,
+	},
+};
+
+static int avs_tplg_parse_audio_formats(struct snd_soc_component *comp,
+					struct snd_soc_tplg_vendor_array *tuples,
+					u32 block_size)
+{
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);
+	struct avs_tplg *tplg = acomp->tplg;
+
+	return parse_dictionary(comp, tuples, block_size, (void **)&tplg->fmts,
+				&tplg->num_fmts, sizeof(*tplg->fmts),
+				AVS_TKN_MANIFEST_NUM_AFMTS_U32,
+				AVS_TKN_AFMT_ID_U32,
+				audio_format_parsers, ARRAY_SIZE(audio_format_parsers));
+}
+
+static const struct avs_tplg_token_parser modcfg_base_parsers[] = {
+	{
+		.token = AVS_TKN_MODCFG_BASE_CPC_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_base, cpc),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_BASE_IBS_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_base, ibs),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_BASE_OBS_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_base, obs),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_BASE_PAGES_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_base, is_pages),
+		.parse = avs_parse_word_token,
+	},
+};
+
+static int avs_tplg_parse_modcfgs_base(struct snd_soc_component *comp,
+				       struct snd_soc_tplg_vendor_array *tuples,
+				       u32 block_size)
+{
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);
+	struct avs_tplg *tplg = acomp->tplg;
+
+	return parse_dictionary(comp, tuples, block_size, (void **)&tplg->modcfgs_base,
+				&tplg->num_modcfgs_base, sizeof(*tplg->modcfgs_base),
+				AVS_TKN_MANIFEST_NUM_MODCFGS_BASE_U32,
+				AVS_TKN_MODCFG_BASE_ID_U32,
+				modcfg_base_parsers, ARRAY_SIZE(modcfg_base_parsers));
+}
+
+static const struct avs_tplg_token_parser modcfg_ext_parsers[] = {
+	{
+		.token = AVS_TKN_MODCFG_EXT_TYPE_UUID,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_UUID,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, type),
+		.parse = avs_parse_uuid_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_CPR_OUT_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, copier.out_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MODCFG_CPR_FEATURE_MASK_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, copier.feature_mask),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_CPR_VINDEX_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, copier.vindex),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_CPR_DMA_TYPE_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, copier.dma_type),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_CPR_DMABUFF_SIZE_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, copier.dma_buffer_size),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_CPR_BLOB_FMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, copier.blob_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MODCFG_MICSEL_OUT_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, micsel.out_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MODCFG_INTELWOV_CPC_LP_MODE_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, wov.cpc_lp_mode),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_SRC_OUT_FREQ_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, src.out_freq),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_MUX_REF_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, mux.ref_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MODCFG_MUX_OUT_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, mux.out_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MODCFG_AEC_REF_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, aec.ref_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MODCFG_AEC_OUT_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, aec.out_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MODCFG_AEC_CPC_LP_MODE_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, aec.cpc_lp_mode),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_ASRC_OUT_FREQ_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, asrc.out_freq),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_ASRC_MODE_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, asrc.mode),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_ASRC_DISABLE_JITTER_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, asrc.disable_jitter_buffer),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_OUT_CHAN_CFG_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.out_channel_config),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_SELECT_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients_select),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_0_S32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients[0]),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_1_S32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients[1]),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_2_S32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients[2]),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_3_S32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients[3]),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_4_S32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients[4]),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_5_S32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients[5]),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_6_S32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients[6]),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_7_S32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients[7]),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_CHAN_MAP_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.channel_map),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_EXT_NUM_INPUT_PINS_U16,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_SHORT,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, generic.num_input_pins),
+		.parse = avs_parse_short_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_EXT_NUM_OUTPUT_PINS_U16,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_SHORT,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, generic.num_output_pins),
+		.parse = avs_parse_short_token,
+	},
+};
+
+static const struct avs_tplg_token_parser pin_format_parsers[] = {
+	{
+		.token = AVS_TKN_PIN_FMT_INDEX_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_pin_format, pin_index),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_PIN_FMT_IOBS_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_pin_format, iobs),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_PIN_FMT_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_pin_format, fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+};
+
+static int avs_tplg_parse_modcfg_ext(struct snd_soc_component *comp,
+				     struct avs_tplg_modcfg_ext *cfg,
+				     struct snd_soc_tplg_vendor_array *tuples,
+				     u32 block_size)
+{
+	u32 esize;
+	int ret;
+
+	/* See where pin block starts. */
+	ret = avs_tplg_vendor_entry_size(tuples, block_size,
+					 AVS_TKN_PIN_FMT_INDEX_U32, &esize);
+	if (ret)
+		return ret;
+
+	ret = avs_parse_tokens(comp, cfg, modcfg_ext_parsers,
+			       ARRAY_SIZE(modcfg_ext_parsers), tuples, esize);
+	if (ret)
+		return ret;
+
+	block_size -= esize;
+	/* Parse trailing in/out pin formats if any. */
+	if (block_size) {
+		struct avs_tplg_pin_format *pins;
+		u32 num_pins;
+
+		num_pins = cfg->generic.num_input_pins + cfg->generic.num_output_pins;
+		if (!num_pins)
+			return -EINVAL;
+
+		pins = devm_kcalloc(comp->card->dev, num_pins, sizeof(*pins), GFP_KERNEL);
+		if (!pins)
+			return -ENOMEM;
+
+		tuples = avs_tplg_vendor_array_at(tuples, esize);
+		ret = parse_dictionary_entries(comp, tuples, block_size,
+					       pins, num_pins, sizeof(*pins),
+					       AVS_TKN_PIN_FMT_INDEX_U32,
+					       pin_format_parsers,
+					       ARRAY_SIZE(pin_format_parsers));
+		if (ret)
+			return ret;
+		cfg->generic.pin_fmts = pins;
+	}
+
+	return 0;
+}
+
+static int avs_tplg_parse_modcfgs_ext(struct snd_soc_component *comp,
+				      struct snd_soc_tplg_vendor_array *tuples,
+				      u32 block_size)
+{
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);
+	struct avs_tplg *tplg = acomp->tplg;
+	int ret, i;
+
+	ret = parse_dictionary_header(comp, tuples, (void **)&tplg->modcfgs_ext,
+				      &tplg->num_modcfgs_ext,
+				      sizeof(*tplg->modcfgs_ext),
+				      AVS_TKN_MANIFEST_NUM_MODCFGS_EXT_U32);
+	if (ret)
+		return ret;
+
+	block_size -= le32_to_cpu(tuples->size);
+	/* With header parsed, move on to parsing entries. */
+	tuples = avs_tplg_vendor_array_next(tuples);
+
+	for (i = 0; i < tplg->num_modcfgs_ext; i++) {
+		struct avs_tplg_modcfg_ext *cfg = &tplg->modcfgs_ext[i];
+		u32 esize;
+
+		ret = avs_tplg_vendor_entry_size(tuples, block_size,
+						 AVS_TKN_MODCFG_EXT_ID_U32, &esize);
+		if (ret)
+			return ret;
+
+		ret = avs_tplg_parse_modcfg_ext(comp, cfg, tuples, esize);
+		if (ret)
+			return ret;
+
+		block_size -= esize;
+		tuples = avs_tplg_vendor_array_at(tuples, esize);
+	}
+
+	return 0;
+}
+
+static const struct avs_tplg_token_parser pplcfg_parsers[] = {
+	{
+		.token = AVS_TKN_PPLCFG_REQ_SIZE_U16,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_SHORT,
+		.offset = offsetof(struct avs_tplg_pplcfg, req_size),
+		.parse = avs_parse_short_token,
+	},
+	{
+		.token = AVS_TKN_PPLCFG_PRIORITY_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_pplcfg, priority),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_PPLCFG_LOW_POWER_BOOL,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BOOL,
+		.offset = offsetof(struct avs_tplg_pplcfg, lp),
+		.parse = avs_parse_bool_token,
+	},
+	{
+		.token = AVS_TKN_PPLCFG_ATTRIBUTES_U16,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_SHORT,
+		.offset = offsetof(struct avs_tplg_pplcfg, attributes),
+		.parse = avs_parse_short_token,
+	},
+	{
+		.token = AVS_TKN_PPLCFG_TRIGGER_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_pplcfg, trigger),
+		.parse = avs_parse_word_token,
+	},
+};
+
+static int avs_tplg_parse_pplcfgs(struct snd_soc_component *comp,
+				  struct snd_soc_tplg_vendor_array *tuples,
+				  u32 block_size)
+{
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);
+	struct avs_tplg *tplg = acomp->tplg;
+
+	return parse_dictionary(comp, tuples, block_size, (void **)&tplg->pplcfgs,
+				&tplg->num_pplcfgs, sizeof(*tplg->pplcfgs),
+				AVS_TKN_MANIFEST_NUM_PPLCFGS_U32,
+				AVS_TKN_PPLCFG_ID_U32,
+				pplcfg_parsers, ARRAY_SIZE(pplcfg_parsers));
+}
+
+static const struct avs_tplg_token_parser binding_parsers[] = {
+	{
+		.token = AVS_TKN_BINDING_TARGET_TPLG_NAME_STRING,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_STRING,
+		.offset = offsetof(struct avs_tplg_binding, target_tplg_name),
+		.parse = parse_link_formatted_string,
+	},
+	{
+		.token = AVS_TKN_BINDING_TARGET_PATH_TMPL_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_binding, target_path_tmpl_id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_BINDING_TARGET_PPL_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_binding, target_ppl_id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_BINDING_TARGET_MOD_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_binding, target_mod_id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_BINDING_TARGET_MOD_PIN_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_binding, target_mod_pin),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_BINDING_MOD_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_binding, mod_id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_BINDING_MOD_PIN_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_binding, mod_pin),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_BINDING_IS_SINK_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_binding, is_sink),
+		.parse = avs_parse_byte_token,
+	},
+};
+
+static int avs_tplg_parse_bindings(struct snd_soc_component *comp,
+				   struct snd_soc_tplg_vendor_array *tuples,
+				   u32 block_size)
+{
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);
+	struct avs_tplg *tplg = acomp->tplg;
+
+	return parse_dictionary(comp, tuples, block_size, (void **)&tplg->bindings,
+				&tplg->num_bindings, sizeof(*tplg->bindings),
+				AVS_TKN_MANIFEST_NUM_BINDINGS_U32,
+				AVS_TKN_BINDING_ID_U32,
+				binding_parsers, ARRAY_SIZE(binding_parsers));
+}
+
+static const struct avs_tplg_token_parser module_parsers[] = {
+	{
+		.token = AVS_TKN_MOD_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_module, id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MOD_MODCFG_BASE_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_module, cfg_base),
+		.parse = avs_parse_modcfg_base_ptr,
+	},
+	{
+		.token = AVS_TKN_MOD_IN_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_module, in_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MOD_CORE_ID_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_module, core_id),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_MOD_PROC_DOMAIN_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_module, domain),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_MOD_MODCFG_EXT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_module, cfg_ext),
+		.parse = avs_parse_modcfg_ext_ptr,
+	},
+};
+
+static struct avs_tplg_module *
+avs_tplg_module_create(struct snd_soc_component *comp, struct avs_tplg_pipeline *owner,
+		       struct snd_soc_tplg_vendor_array *tuples, u32 block_size)
+{
+	struct avs_tplg_module *module;
+	int ret;
+
+	module = devm_kzalloc(comp->card->dev, sizeof(*module), GFP_KERNEL);
+	if (!module)
+		return ERR_PTR(-ENOMEM);
+
+	ret = avs_parse_tokens(comp, module, module_parsers,
+			       ARRAY_SIZE(module_parsers), tuples, block_size);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	module->owner = owner;
+	INIT_LIST_HEAD(&module->node);
+
+	return module;
+}
+
+static const struct avs_tplg_token_parser pipeline_parsers[] = {
+	{
+		.token = AVS_TKN_PPL_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_pipeline, id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_PPL_PPLCFG_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_pipeline, cfg),
+		.parse = avs_parse_pplcfg_ptr,
+	},
+	{
+		.token = AVS_TKN_PPL_NUM_BINDING_IDS_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_pipeline, num_bindings),
+		.parse = avs_parse_word_token,
+	},
+};
+
+static const struct avs_tplg_token_parser bindings_parsers[] = {
+	{
+		.token = AVS_TKN_PPL_BINDING_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = 0, /* to treat pipeline->bindings as dictionary */
+		.parse = avs_parse_binding_ptr,
+	},
+};
+
+static struct avs_tplg_pipeline *
+avs_tplg_pipeline_create(struct snd_soc_component *comp, struct avs_tplg_path *owner,
+			 struct snd_soc_tplg_vendor_array *tuples, u32 block_size)
+{
+	struct avs_tplg_pipeline *pipeline;
+	u32 modblk_size, offset;
+	int ret;
+
+	pipeline = devm_kzalloc(comp->card->dev, sizeof(*pipeline), GFP_KERNEL);
+	if (!pipeline)
+		return ERR_PTR(-ENOMEM);
+
+	pipeline->owner = owner;
+	INIT_LIST_HEAD(&pipeline->mod_list);
+
+	/* Pipeline header MUST be followed by at least one module. */
+	ret = avs_tplg_vendor_array_lookup(tuples, block_size,
+					   AVS_TKN_MOD_ID_U32, &offset);
+	if (!ret && !offset)
+		ret = -EINVAL;
+	if (ret)
+		return ERR_PTR(ret);
+
+	/* Process header which precedes module sections. */
+	ret = avs_parse_tokens(comp, pipeline, pipeline_parsers,
+			       ARRAY_SIZE(pipeline_parsers), tuples, offset);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	block_size -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	/* Optionally, binding sections follow module ones. */
+	ret = avs_tplg_vendor_array_lookup_next(tuples, block_size,
+						AVS_TKN_PPL_BINDING_ID_U32, &offset);
+	if (ret) {
+		if (ret != -ENOENT)
+			return ERR_PTR(ret);
+
+		/* Does header information match actual block layout? */
+		if (pipeline->num_bindings)
+			return ERR_PTR(-EINVAL);
+
+		modblk_size = block_size;
+	} else {
+		pipeline->bindings = devm_kcalloc(comp->card->dev, pipeline->num_bindings,
+						  sizeof(*pipeline->bindings), GFP_KERNEL);
+		if (!pipeline->bindings)
+			return ERR_PTR(-ENOMEM);
+
+		modblk_size = offset;
+	}
+
+	block_size -= modblk_size;
+	do {
+		struct avs_tplg_module *module;
+		u32 esize;
+
+		ret = avs_tplg_vendor_entry_size(tuples, modblk_size,
+						 AVS_TKN_MOD_ID_U32, &esize);
+		if (ret)
+			return ERR_PTR(ret);
+
+		module = avs_tplg_module_create(comp, pipeline, tuples, esize);
+		if (IS_ERR(module)) {
+			dev_err(comp->dev, "parse module failed: %ld\n",
+				PTR_ERR(module));
+			return ERR_CAST(module);
+		}
+
+		list_add_tail(&module->node, &pipeline->mod_list);
+		modblk_size -= esize;
+		tuples = avs_tplg_vendor_array_at(tuples, esize);
+	} while (modblk_size > 0);
+
+	/* What's left is optional range of bindings. */
+	ret = parse_dictionary_entries(comp, tuples, block_size, pipeline->bindings,
+				       pipeline->num_bindings, sizeof(*pipeline->bindings),
+				       AVS_TKN_PPL_BINDING_ID_U32,
+				       bindings_parsers, ARRAY_SIZE(bindings_parsers));
+	if (ret)
+		return ERR_PTR(ret);
+
+	return pipeline;
+}
+
+static const struct avs_tplg_token_parser path_parsers[] = {
+	{
+		.token = AVS_TKN_PATH_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path, id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_PATH_FE_FMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path, fe_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_PATH_BE_FMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path, be_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+};
+
+static struct avs_tplg_path *
+avs_tplg_path_create(struct snd_soc_component *comp, struct avs_tplg_path_template *owner,
+		     struct snd_soc_tplg_vendor_array *tuples, u32 block_size,
+		     const struct avs_tplg_token_parser *parsers, u32 num_parsers)
+{
+	struct avs_tplg_pipeline *pipeline;
+	struct avs_tplg_path *path;
+	u32 offset;
+	int ret;
+
+	path = devm_kzalloc(comp->card->dev, sizeof(*path), GFP_KERNEL);
+	if (!path)
+		return ERR_PTR(-ENOMEM);
+
+	path->owner = owner;
+	INIT_LIST_HEAD(&path->ppl_list);
+	INIT_LIST_HEAD(&path->node);
+
+	/* Path header MAY be followed by one or more pipelines. */
+	ret = avs_tplg_vendor_array_lookup(tuples, block_size,
+					   AVS_TKN_PPL_ID_U32, &offset);
+	if (ret == -ENOENT)
+		offset = block_size;
+	else if (ret)
+		return ERR_PTR(ret);
+	else if (!offset)
+		return ERR_PTR(-EINVAL);
+
+	/* Process header which precedes pipeline sections. */
+	ret = avs_parse_tokens(comp, path, parsers, num_parsers, tuples, offset);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	block_size -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+	while (block_size > 0) {
+		u32 esize;
+
+		ret = avs_tplg_vendor_entry_size(tuples, block_size,
+						 AVS_TKN_PPL_ID_U32, &esize);
+		if (ret)
+			return ERR_PTR(ret);
+
+		pipeline = avs_tplg_pipeline_create(comp, path, tuples, esize);
+		if (IS_ERR(pipeline)) {
+			dev_err(comp->dev, "parse pipeline failed: %ld\n",
+				PTR_ERR(pipeline));
+			return ERR_CAST(pipeline);
+		}
+
+		list_add_tail(&pipeline->node, &path->ppl_list);
+		block_size -= esize;
+		tuples = avs_tplg_vendor_array_at(tuples, esize);
+	}
+
+	return path;
+}
+
+static const struct avs_tplg_token_parser path_tmpl_parsers[] = {
+	{
+		.token = AVS_TKN_PATH_TMPL_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path_template, id),
+		.parse = avs_parse_word_token,
+	},
+};
+
+static int parse_path_template(struct snd_soc_component *comp,
+			       struct snd_soc_tplg_vendor_array *tuples, u32 block_size,
+			       struct avs_tplg_path_template *template,
+			       const struct avs_tplg_token_parser *tmpl_tokens, u32 num_tmpl_tokens,
+			       const struct avs_tplg_token_parser *path_tokens, u32 num_path_tokens)
+{
+	struct avs_tplg_path *path;
+	u32 offset;
+	int ret;
+
+	/* Path template header MUST be followed by at least one path variant. */
+	ret = avs_tplg_vendor_array_lookup(tuples, block_size,
+					   AVS_TKN_PATH_ID_U32, &offset);
+	if (ret)
+		return ret;
+
+	/* Process header which precedes path variants sections. */
+	ret = avs_parse_tokens(comp, template, tmpl_tokens, num_tmpl_tokens, tuples, offset);
+	if (ret < 0)
+		return ret;
+
+	block_size -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+	do {
+		u32 esize;
+
+		ret = avs_tplg_vendor_entry_size(tuples, block_size,
+						 AVS_TKN_PATH_ID_U32, &esize);
+		if (ret)
+			return ret;
+
+		path = avs_tplg_path_create(comp, template, tuples, esize, path_tokens,
+					    num_path_tokens);
+		if (IS_ERR(path)) {
+			dev_err(comp->dev, "parse path failed: %ld\n", PTR_ERR(path));
+			return PTR_ERR(path);
+		}
+
+		list_add_tail(&path->node, &template->path_list);
+		block_size -= esize;
+		tuples = avs_tplg_vendor_array_at(tuples, esize);
+	} while (block_size > 0);
+
+	return 0;
+}
+
+static struct avs_tplg_path_template *
+avs_tplg_path_template_create(struct snd_soc_component *comp, struct avs_tplg *owner,
+			      struct snd_soc_tplg_vendor_array *tuples, u32 block_size)
+{
+	struct avs_tplg_path_template *template;
+	int ret;
+
+	template = devm_kzalloc(comp->card->dev, sizeof(*template), GFP_KERNEL);
+	if (!template)
+		return ERR_PTR(-ENOMEM);
+
+	template->owner = owner; /* Used when building sysfs hierarchy. */
+	INIT_LIST_HEAD(&template->path_list);
+	INIT_LIST_HEAD(&template->node);
+
+	ret = parse_path_template(comp, tuples, block_size, template, path_tmpl_parsers,
+				  ARRAY_SIZE(path_tmpl_parsers), path_parsers,
+				  ARRAY_SIZE(path_parsers));
+	if (ret)
+		return ERR_PTR(ret);
+
+	return template;
+}
+
+static int avs_route_load(struct snd_soc_component *comp, int index,
+			  struct snd_soc_dapm_route *route)
+{
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(comp->card->dev);
+	size_t len = SNDRV_CTL_ELEM_ID_NAME_MAXLEN;
+	char buf[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+	u32 port;
+
+	/* See parse_link_formatted_string() for dynamic naming when(s). */
+	if (hweight_long(mach->link_mask) == 1) {
+		port = __ffs(mach->link_mask);
+
+		snprintf(buf, len, route->source, port);
+		strncpy((char *)route->source, buf, len);
+		snprintf(buf, len, route->sink, port);
+		strncpy((char *)route->sink, buf, len);
+		if (route->control) {
+			snprintf(buf, len, route->control, port);
+			strncpy((char *)route->control, buf, len);
+		}
+	}
+
+	return 0;
+}
+
+static int avs_widget_load(struct snd_soc_component *comp, int index,
+			   struct snd_soc_dapm_widget *w,
+			   struct snd_soc_tplg_dapm_widget *dw)
+{
+	struct snd_soc_acpi_mach *mach;
+	struct avs_tplg_path_template *template;
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);
+	struct avs_tplg *tplg;
+
+	if (!le32_to_cpu(dw->priv.size))
+		return 0;
+
+	tplg = acomp->tplg;
+	mach = dev_get_platdata(comp->card->dev);
+
+	/* See parse_link_formatted_string() for dynamic naming when(s). */
+	if (hweight_long(mach->link_mask) == 1) {
+		kfree(w->name);
+		/* ->name is freed later by soc_tplg_dapm_widget_create() */
+		w->name = kasprintf(GFP_KERNEL, dw->name, __ffs(mach->link_mask));
+		if (!w->name)
+			return -ENOMEM;
+	}
+
+	template = avs_tplg_path_template_create(comp, tplg, dw->priv.array,
+						 le32_to_cpu(dw->priv.size));
+	if (IS_ERR(template)) {
+		dev_err(comp->dev, "widget %s load failed: %ld\n", dw->name,
+			PTR_ERR(template));
+		return PTR_ERR(template);
+	}
+
+	w->priv = template; /* link path information to widget */
+	list_add_tail(&template->node, &tplg->path_tmpl_list);
+	return 0;
+}
+
+static int avs_dai_load(struct snd_soc_component *comp, int index,
+			struct snd_soc_dai_driver *dai_drv, struct snd_soc_tplg_pcm *pcm,
+			struct snd_soc_dai *dai)
+{
+	if (pcm)
+		dai_drv->ops = &avs_dai_fe_ops;
+	return 0;
+}
+
+static int avs_link_load(struct snd_soc_component *comp, int index, struct snd_soc_dai_link *link,
+			 struct snd_soc_tplg_link_config *cfg)
+{
+	/* Stream control handled by IPCs. */
+	link->nonatomic = true;
+
+	if (!link->no_pcm) {
+		/* Open LINK (BE) pipes last and close them first to prevent xruns. */
+		link->trigger[0] = SND_SOC_DPCM_TRIGGER_PRE;
+		link->trigger[1] = SND_SOC_DPCM_TRIGGER_PRE;
+	}
+
+	return 0;
+}
+
+static const struct avs_tplg_token_parser manifest_parsers[] = {
+	{
+		.token = AVS_TKN_MANIFEST_NAME_STRING,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_STRING,
+		.offset = offsetof(struct avs_tplg, name),
+		.parse = parse_link_formatted_string,
+	},
+	{
+		.token = AVS_TKN_MANIFEST_VERSION_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg, version),
+		.parse = avs_parse_word_token,
+	},
+};
+
+static int avs_manifest(struct snd_soc_component *comp, int index,
+			struct snd_soc_tplg_manifest *manifest)
+{
+	struct snd_soc_tplg_vendor_array *tuples = manifest->priv.array;
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);
+	size_t remaining = le32_to_cpu(manifest->priv.size);
+	u32 offset;
+	int ret;
+
+	ret = avs_tplg_vendor_array_lookup(tuples, remaining,
+					   AVS_TKN_MANIFEST_NUM_LIBRARIES_U32, &offset);
+	/* Manifest MUST begin with a header. */
+	if (!ret && !offset)
+		ret = -EINVAL;
+	if (ret) {
+		dev_err(comp->dev, "incorrect manifest format: %d\n", ret);
+		return ret;
+	}
+
+	/* Process header which precedes any of the dictionaries. */
+	ret = avs_parse_tokens(comp, acomp->tplg, manifest_parsers,
+			       ARRAY_SIZE(manifest_parsers), tuples, offset);
+	if (ret < 0)
+		return ret;
+
+	remaining -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	ret = avs_tplg_vendor_array_lookup(tuples, remaining,
+					   AVS_TKN_MANIFEST_NUM_AFMTS_U32, &offset);
+	if (ret) {
+		dev_err(comp->dev, "audio formats lookup failed: %d\n", ret);
+		return ret;
+	}
+
+	/* Libraries dictionary. */
+	ret = avs_tplg_parse_libraries(comp, tuples, offset);
+	if (ret < 0)
+		return ret;
+
+	remaining -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	ret = avs_tplg_vendor_array_lookup(tuples, remaining,
+					   AVS_TKN_MANIFEST_NUM_MODCFGS_BASE_U32, &offset);
+	if (ret) {
+		dev_err(comp->dev, "modcfgs_base lookup failed: %d\n", ret);
+		return ret;
+	}
+
+	/* Audio formats dictionary. */
+	ret = avs_tplg_parse_audio_formats(comp, tuples, offset);
+	if (ret < 0)
+		return ret;
+
+	remaining -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	ret = avs_tplg_vendor_array_lookup(tuples, remaining,
+					   AVS_TKN_MANIFEST_NUM_MODCFGS_EXT_U32, &offset);
+	if (ret) {
+		dev_err(comp->dev, "modcfgs_ext lookup failed: %d\n", ret);
+		return ret;
+	}
+
+	/* Module configs-base dictionary. */
+	ret = avs_tplg_parse_modcfgs_base(comp, tuples, offset);
+	if (ret < 0)
+		return ret;
+
+	remaining -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	ret = avs_tplg_vendor_array_lookup(tuples, remaining,
+					   AVS_TKN_MANIFEST_NUM_PPLCFGS_U32, &offset);
+	if (ret) {
+		dev_err(comp->dev, "pplcfgs lookup failed: %d\n", ret);
+		return ret;
+	}
+
+	/* Module configs-ext dictionary. */
+	ret = avs_tplg_parse_modcfgs_ext(comp, tuples, offset);
+	if (ret < 0)
+		return ret;
+
+	remaining -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	ret = avs_tplg_vendor_array_lookup(tuples, remaining,
+					   AVS_TKN_MANIFEST_NUM_BINDINGS_U32, &offset);
+	if (ret) {
+		dev_err(comp->dev, "bindings lookup failed: %d\n", ret);
+		return ret;
+	}
+
+	/* Pipeline configs dictionary. */
+	ret = avs_tplg_parse_pplcfgs(comp, tuples, offset);
+	if (ret < 0)
+		return ret;
+
+	remaining -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	/* Bindings dictionary. */
+	return avs_tplg_parse_bindings(comp, tuples, remaining);
+}
+
+static struct snd_soc_tplg_ops avs_tplg_ops = {
+	.dapm_route_load = avs_route_load,
+	.widget_load	= avs_widget_load,
+	.dai_load	= avs_dai_load,
+	.link_load	= avs_link_load,
+	.manifest	= avs_manifest,
+};
+
+struct avs_tplg *avs_tplg_new(struct snd_soc_component *comp)
+{
+	struct avs_tplg *tplg;
+
+	tplg = devm_kzalloc(comp->card->dev, sizeof(*tplg), GFP_KERNEL);
+	if (!tplg)
+		return NULL;
+
+	tplg->comp = comp;
+	INIT_LIST_HEAD(&tplg->path_tmpl_list);
+
+	return tplg;
+}
+
+int avs_load_topology(struct snd_soc_component *comp, const char *filename)
+{
+	const struct firmware *fw;
+	int ret;
+
+	ret = request_firmware(&fw, filename, comp->dev);
+	if (ret < 0) {
+		dev_err(comp->dev, "request topology \"%s\" failed: %d\n", filename, ret);
+		return ret;
+	}
+
+	ret = snd_soc_tplg_component_load(comp, &avs_tplg_ops, fw);
+	if (ret < 0)
+		dev_err(comp->dev, "load topology \"%s\" failed: %d\n", filename, ret);
+
+	release_firmware(fw);
+	return ret;
+}
+
+int avs_remove_topology(struct snd_soc_component *comp)
+{
+	snd_soc_tplg_component_remove(comp);
+
+	return 0;
+}
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
new file mode 100644
index 000000000000..6058d868f802
--- /dev/null
+++ b/sound/soc/intel/avs/topology.h
@@ -0,0 +1,195 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ *
+ * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+ *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+ */
+
+#ifndef __SOUND_SOC_INTEL_AVS_TPLG_H
+#define __SOUND_SOC_INTEL_AVS_TPLG_H
+
+#include <linux/list.h>
+#include "messages.h"
+
+#define INVALID_OBJECT_ID	UINT_MAX
+
+struct snd_soc_component;
+
+struct avs_tplg {
+	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+	u32 version;
+	struct snd_soc_component *comp;
+
+	struct avs_tplg_library *libs;
+	u32 num_libs;
+	struct avs_audio_format *fmts;
+	u32 num_fmts;
+	struct avs_tplg_modcfg_base *modcfgs_base;
+	u32 num_modcfgs_base;
+	struct avs_tplg_modcfg_ext *modcfgs_ext;
+	u32 num_modcfgs_ext;
+	struct avs_tplg_pplcfg *pplcfgs;
+	u32 num_pplcfgs;
+	struct avs_tplg_binding *bindings;
+	u32 num_bindings;
+
+	struct list_head path_tmpl_list;
+};
+
+struct avs_tplg_library {
+	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+};
+
+/* Matches header of struct avs_mod_cfg_base. */
+struct avs_tplg_modcfg_base {
+	u32 cpc;
+	u32 ibs;
+	u32 obs;
+	u32 is_pages;
+};
+
+struct avs_tplg_pin_format {
+	u32 pin_index;
+	u32 iobs;
+	struct avs_audio_format *fmt;
+};
+
+struct avs_tplg_modcfg_ext {
+	guid_t type;
+
+	union {
+		struct {
+			u16 num_input_pins;
+			u16 num_output_pins;
+			struct avs_tplg_pin_format *pin_fmts;
+		} generic;
+		struct {
+			struct avs_audio_format *out_fmt;
+			struct avs_audio_format *blob_fmt; /* optional override */
+			u32 feature_mask;
+			union avs_virtual_index vindex;
+			u32 dma_type;
+			u32 dma_buffer_size;
+			u32 config_length;
+			/* config_data part of priv data */
+		} copier;
+		struct {
+			u32 out_channel_config;
+			u32 coefficients_select;
+			s32 coefficients[AVS_CHANNELS_MAX];
+			u32 channel_map;
+		} updown_mix;
+		struct {
+			u32 out_freq;
+		} src;
+		struct {
+			u32 out_freq;
+			u8 mode;
+			u8 disable_jitter_buffer;
+		} asrc;
+		struct {
+			u32 cpc_lp_mode;
+		} wov;
+		struct {
+			struct avs_audio_format *ref_fmt;
+			struct avs_audio_format *out_fmt;
+			u32 cpc_lp_mode;
+		} aec;
+		struct {
+			struct avs_audio_format *ref_fmt;
+			struct avs_audio_format *out_fmt;
+		} mux;
+		struct {
+			struct avs_audio_format *out_fmt;
+		} micsel;
+	};
+};
+
+/* Specifies path behaviour during PCM ->trigger(START) commnand. */
+enum avs_tplg_trigger {
+	AVS_TPLG_TRIGGER_AUTO = 0,
+	AVS_TPLG_TRIGGER_USERSPACE = 1, /* via sysfs */
+};
+
+struct avs_tplg_pplcfg {
+	u16 req_size;
+	u8 priority;
+	bool lp;
+	u16 attributes;
+	enum avs_tplg_trigger trigger;
+};
+
+struct avs_tplg_binding {
+	char target_tplg_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+	u32 target_path_tmpl_id;
+	u32 target_ppl_id;
+	u32 target_mod_id;
+	u8 target_mod_pin;
+	u32 mod_id;
+	u8 mod_pin;
+	u8 is_sink;
+};
+
+struct avs_tplg_path_template_id {
+	u32 id;
+	char tplg_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+};
+
+struct avs_tplg_path_template {
+	u32 id;
+
+	struct list_head path_list;
+
+	struct avs_tplg *owner;
+	/* Driver path templates management. */
+	struct list_head node;
+};
+
+struct avs_tplg_path {
+	u32 id;
+
+	/* Path format requirements. */
+	struct avs_audio_format *fe_fmt;
+	struct avs_audio_format *be_fmt;
+
+	struct list_head ppl_list;
+
+	struct avs_tplg_path_template *owner;
+	/* Path template path-variants management. */
+	struct list_head node;
+};
+
+struct avs_tplg_pipeline {
+	u32 id;
+
+	struct avs_tplg_pplcfg *cfg;
+	struct avs_tplg_binding **bindings;
+	u32 num_bindings;
+	struct list_head mod_list;
+
+	struct avs_tplg_path *owner;
+	/* Path pipelines management. */
+	struct list_head node;
+};
+
+struct avs_tplg_module {
+	u32 id;
+
+	struct avs_tplg_modcfg_base *cfg_base;
+	struct avs_audio_format *in_fmt;
+	u8 core_id;
+	u8 domain;
+	struct avs_tplg_modcfg_ext *cfg_ext;
+
+	struct avs_tplg_pipeline *owner;
+	/* Pipeline modules management. */
+	struct list_head node;
+};
+
+struct avs_tplg *avs_tplg_new(struct snd_soc_component *comp);
+
+int avs_load_topology(struct snd_soc_component *comp, const char *filename);
+int avs_remove_topology(struct snd_soc_component *comp);
+
+#endif
-- 
2.25.1

