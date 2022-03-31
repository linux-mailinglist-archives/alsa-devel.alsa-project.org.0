Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A51A24EDAC2
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 15:44:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 462231933;
	Thu, 31 Mar 2022 15:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 462231933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648734244;
	bh=DhbwIhYY5+y7maBdgv0eNU3IzQNwYRQ518+9UsPAwJM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DHy6SGN/bj/k9Ap2Kpc9OXvldlt08EMrwRRPrNH/RE7VrivARvUyHO9cEeV8h9lL7
	 9G4sva05rHmFAYMtfl5PuqM8WKiI0YiYQWbeUNN1sDTb+q1DbvcHNdUcpr4G3zap/p
	 G+9hAbiwCik5pGcuWKhAzMzEVvgLn2qYcursrx/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50E23F8051D;
	Thu, 31 Mar 2022 15:42:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04EFFF80519; Thu, 31 Mar 2022 15:42:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04E5BF800B8
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 15:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04E5BF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="D86VQrqB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648734140; x=1680270140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DhbwIhYY5+y7maBdgv0eNU3IzQNwYRQ518+9UsPAwJM=;
 b=D86VQrqBABGd1hMJKjmb9hy2rUXLRwRqg1Ux80b0aYEqEmzO0X8FmD88
 jPF+DtllxhClgDMzlhsu4+z4hxehzqz2AmjmVhjsjq7i7jVqiBUg4I0tA
 NsYFE3t01JAEm/YmpQ3P/Xb4Y1nLJiiU4TiC15/eUPaLFkj3idd/brx1x
 ugBubdyc8Lup2ebu18UJh/TbJPKMt6UHYjKouJJalhFtK2WCdw5Zpt+w6
 HM4AA5GoxvdncvvNYE6WpyQCUfiYXXt9JSzixcD7PEF/iEQB+CUKNb1L8
 4JpvQmVy/E0Jtq1xeAtBjBXnR3rTzIVsM0dWeXoTxdfBrTVUAeINbnTf6 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259819093"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="259819093"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:42:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="522349109"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 31 Mar 2022 06:42:13 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 02/14] ASoC: Intel: avs: Add topology parsing infrastructure
Date: Thu, 31 Mar 2022 15:52:34 +0200
Message-Id: <20220331135246.993089-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331135246.993089-1-cezary.rojewski@intel.com>
References: <20220331135246.993089-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
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

AVS topology is split into two major parts: dictionaries - found within
ASoC topology manifest - and path templates.

Dictionaries job is to reduce the total amount of memory
occupied by topology elements. Rather than having every pipeline and
module carry its own information, each refers to specific entry in
specific dictionary by provided (from topology file) indexes. In
consequence, most struct avs_tplg_xxx are made out of pointers.

To support the above, range of parsing helpers for all value-types known
to ALSA: uuid, bool, byte, short, word and string are added. Additional
handlers help translate pointer-types and more complex objects such as
audio formats and module base configs.

Path templates are similar to path descriptions found in skylake-driver
and they describe how given path shall look like in runtime - number of
modules and pipelines that shape it and how they are laid out.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h      |  14 +
 sound/soc/intel/avs/topology.c | 595 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/topology.h |  44 +++
 3 files changed, 653 insertions(+)
 create mode 100644 sound/soc/intel/avs/topology.c
 create mode 100644 sound/soc/intel/avs/topology.h

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index b48a342fd184..77bbaf292b01 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -13,10 +13,12 @@
 #include <linux/firmware.h>
 #include <sound/hda_codec.h>
 #include <sound/hda_register.h>
+#include <sound/soc-component.h>
 #include "messages.h"
 #include "registers.h"
 
 struct avs_dev;
+struct avs_tplg;
 
 /*
  * struct avs_dsp_ops - Platform-specific DSP operations
@@ -244,4 +246,16 @@ int avs_hda_load_library(struct avs_dev *adev, struct firmware *lib, u32 id);
 int avs_hda_transfer_modules(struct avs_dev *adev, bool load,
 			     struct avs_module_entry *mods, u32 num_mods);
 
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
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
new file mode 100644
index 000000000000..4ac44cb318f7
--- /dev/null
+++ b/sound/soc/intel/avs/topology.c
@@ -0,0 +1,595 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/uuid.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-topology.h>
+#include <uapi/sound/intel/avs/tokens.h>
+#include "avs.h"
+#include "topology.h"
+
+/* Get pointer to vendor array at the specified offset. */
+#define avs_tplg_vendor_array_at(array, offset) \
+	((struct snd_soc_tplg_vendor_array *)((u8 *)array + offset))
+
+/* Get pointer to vendor array that is next in line. */
+#define avs_tplg_vendor_array_next(array) \
+	(avs_tplg_vendor_array_at(array, le32_to_cpu((array)->size)))
+
+/*
+ * Scan provided block of tuples for the specified token. If found,
+ * @offset is updated with position at which first matching token is
+ * located.
+ *
+ * Returns 0 on success, -ENOENT if not found and error code otherwise.
+ */
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
+/*
+ * See avs_tplg_vendor_array_lookup() for description.
+ *
+ * Behaves exactly like avs_tplg_vendor_lookup() but starts from the
+ * next vendor array in line. Useful when searching for the finish line
+ * of an arbitrary entry in a list of entries where each is composed of
+ * several vendor tuples and a specific token marks the beginning of
+ * a new entry block.
+ */
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
+/*
+ * Scan provided block of tuples for the specified token which marks
+ * the border of an entry block. Behavior is similar to
+ * avs_tplg_vendor_array_lookup() except 0 is also returned if no
+ * matching token has been found. In such case, returned @size is
+ * assigned to @block_size as the entire block belongs to the current
+ * entry.
+ *
+ * Returns 0 on success, error code otherwise.
+ */
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
+/*
+ * Vendor tuple parsing descriptor.
+ *
+ * @token: vendor specific token that identifies tuple
+ * @type: tuple type, one of SND_SOC_TPLG_TUPLE_TYPE_XXX
+ * @offset: offset of a struct's field to initialize
+ * @parse: parsing function, extracts and assigns value to object's field
+ */
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
+			dev_err(comp->dev, "parsing %zu tokens of %d type failed: %d\n",
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
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
new file mode 100644
index 000000000000..a3ab5d15c9ee
--- /dev/null
+++ b/sound/soc/intel/avs/topology.h
@@ -0,0 +1,44 @@
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
+#endif
-- 
2.25.1

