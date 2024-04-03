Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1AB896A4B
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 11:16:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 739B12C92;
	Wed,  3 Apr 2024 11:16:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 739B12C92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712135792;
	bh=TIYDuamY99Xghx3cSn4teoxVFT0wk7VjYsDuL74bV9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TkxTch8rsA6KWWEjHV2QXaxi/PIB1ZFXkXBPoQZ7t7Po5yTZhGmj3nhj2ryvDAYPs
	 yxHbdc/PtPiFhs74GvfPhXzhOUUsy8S4/2QsTWLVIg+3QIu8tzt8Y0WYIXIgr/GY+A
	 BDnh0RGytMyR9YHn4X3RWb66e7Yk5yErSeBASP2Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1F48F80616; Wed,  3 Apr 2024 11:15:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C206F805F9;
	Wed,  3 Apr 2024 11:15:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8660AF805FC; Wed,  3 Apr 2024 11:15:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F7EBF8016E
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 11:14:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F7EBF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Vq7aXlX+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712135698; x=1743671698;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TIYDuamY99Xghx3cSn4teoxVFT0wk7VjYsDuL74bV9c=;
  b=Vq7aXlX+oy9ZJeAGjL8Osgd2/YhVjZBdC7s3mWLA7K02lQWkxzI+01a7
   vxFNh8hF3Ws08pmP2kne6iACUFH4ZNH0secT0nz4dkNv8laogz8gJRcTK
   121ZpIqMzdD48jKMx/CcB/Y9ZPRyCNL7ZKdqDfYEVYBC8qiRhpkuR7kBu
   9awumC7xW3QjKN53xPYGJ2UlqMcyK6mROk+daENFSMrtVoFPPDDBCKLVL
   hR9g0NDwzvMXxhC7PSn5w208MBQFP82zoBigUbaLe/BxGf2bp0rNLIurY
   ajKpClTuv5hN9fMgr0QIeGgqmtdGS+Q62TGQqBlmnXzWc1WTsesEVyarA
   A==;
X-CSE-ConnectionGUID: OjMcnQxmQPaDMd5Ug6VLDA==
X-CSE-MsgGUID: s6rVGLHQR9yDsEFal04I7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="10322549"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="10322549"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:14:55 -0700
X-CSE-ConnectionGUID: M578HhvySnSeiRM4KwNtsA==
X-CSE-MsgGUID: QuEuiGDRQBeFMZu0UVl3jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18410501"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2024 02:14:53 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	cujomalainey@chromium.org,
	lmajczak@google.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/4] ASoC: Intel: Skylake: Remove soc-topology ABI v4 support
Date: Wed,  3 Apr 2024 11:16:26 +0200
Message-Id: <20240403091629.647267-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240403091629.647267-1-cezary.rojewski@intel.com>
References: <20240403091629.647267-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NOXSHEURJHL2SAS2E7TYBUH2WM7K7PVJ
X-Message-ID-Hash: NOXSHEURJHL2SAS2E7TYBUH2WM7K7PVJ
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NOXSHEURJHL2SAS2E7TYBUH2WM7K7PVJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The only known users are Chromebook configurations. Starting from
kernel v5.4, all of them are making use of soc-topology ABI v5.

Cc: Curtis Malainey <cujomalainey@chromium.org>
Cc: Łukasz Majczak <lmajczak@google.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/uapi/sound/skl-tplg-interface.h |  74 -----------
 sound/soc/intel/skylake/skl-topology.c  | 169 ------------------------
 2 files changed, 243 deletions(-)

diff --git a/include/uapi/sound/skl-tplg-interface.h b/include/uapi/sound/skl-tplg-interface.h
index 4bf9c4f9add8..940c4269322b 100644
--- a/include/uapi/sound/skl-tplg-interface.h
+++ b/include/uapi/sound/skl-tplg-interface.h
@@ -165,78 +165,4 @@ enum skl_tuple_type {
 	SKL_TYPE_DATA
 };
 
-/* v4 configuration data */
-
-struct skl_dfw_v4_module_pin {
-	__u16 module_id;
-	__u16 instance_id;
-} __packed;
-
-struct skl_dfw_v4_module_fmt {
-	__u32 channels;
-	__u32 freq;
-	__u32 bit_depth;
-	__u32 valid_bit_depth;
-	__u32 ch_cfg;
-	__u32 interleaving_style;
-	__u32 sample_type;
-	__u32 ch_map;
-} __packed;
-
-struct skl_dfw_v4_module_caps {
-	__u32 set_params:2;
-	__u32 rsvd:30;
-	__u32 param_id;
-	__u32 caps_size;
-	__u32 caps[HDA_SST_CFG_MAX];
-} __packed;
-
-struct skl_dfw_v4_pipe {
-	__u8 pipe_id;
-	__u8 pipe_priority;
-	__u16 conn_type:4;
-	__u16 rsvd:4;
-	__u16 memory_pages:8;
-} __packed;
-
-struct skl_dfw_v4_module {
-	char uuid[SKL_UUID_STR_SZ];
-
-	__u16 module_id;
-	__u16 instance_id;
-	__u32 max_mcps;
-	__u32 mem_pages;
-	__u32 obs;
-	__u32 ibs;
-	__u32 vbus_id;
-
-	__u32 max_in_queue:8;
-	__u32 max_out_queue:8;
-	__u32 time_slot:8;
-	__u32 core_id:4;
-	__u32 rsvd1:4;
-
-	__u32 module_type:8;
-	__u32 conn_type:4;
-	__u32 dev_type:4;
-	__u32 hw_conn_type:4;
-	__u32 rsvd2:12;
-
-	__u32 params_fixup:8;
-	__u32 converter:8;
-	__u32 input_pin_type:1;
-	__u32 output_pin_type:1;
-	__u32 is_dynamic_in_pin:1;
-	__u32 is_dynamic_out_pin:1;
-	__u32 is_loadable:1;
-	__u32 rsvd3:11;
-
-	struct skl_dfw_v4_pipe pipe;
-	struct skl_dfw_v4_module_fmt in_fmt[MAX_IN_QUEUE];
-	struct skl_dfw_v4_module_fmt out_fmt[MAX_OUT_QUEUE];
-	struct skl_dfw_v4_module_pin in_pin[MAX_IN_QUEUE];
-	struct skl_dfw_v4_module_pin out_pin[MAX_OUT_QUEUE];
-	struct skl_dfw_v4_module_caps caps;
-} __packed;
-
 #endif
diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 96cfebded072..e27f0fc3d897 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -2682,168 +2682,6 @@ static int skl_tplg_get_desc_blocks(struct device *dev,
 	return -EINVAL;
 }
 
-/* Functions to parse private data from configuration file format v4 */
-
-/*
- * Add pipeline from topology binary into driver pipeline list
- *
- * If already added we return that instance
- * Otherwise we create a new instance and add into driver list
- */
-static int skl_tplg_add_pipe_v4(struct device *dev,
-			struct skl_module_cfg *mconfig, struct skl_dev *skl,
-			struct skl_dfw_v4_pipe *dfw_pipe)
-{
-	struct skl_pipeline *ppl;
-	struct skl_pipe *pipe;
-	struct skl_pipe_params *params;
-
-	list_for_each_entry(ppl, &skl->ppl_list, node) {
-		if (ppl->pipe->ppl_id == dfw_pipe->pipe_id) {
-			mconfig->pipe = ppl->pipe;
-			return 0;
-		}
-	}
-
-	ppl = devm_kzalloc(dev, sizeof(*ppl), GFP_KERNEL);
-	if (!ppl)
-		return -ENOMEM;
-
-	pipe = devm_kzalloc(dev, sizeof(*pipe), GFP_KERNEL);
-	if (!pipe)
-		return -ENOMEM;
-
-	params = devm_kzalloc(dev, sizeof(*params), GFP_KERNEL);
-	if (!params)
-		return -ENOMEM;
-
-	pipe->ppl_id = dfw_pipe->pipe_id;
-	pipe->memory_pages = dfw_pipe->memory_pages;
-	pipe->pipe_priority = dfw_pipe->pipe_priority;
-	pipe->conn_type = dfw_pipe->conn_type;
-	pipe->state = SKL_PIPE_INVALID;
-	pipe->p_params = params;
-	INIT_LIST_HEAD(&pipe->w_list);
-
-	ppl->pipe = pipe;
-	list_add(&ppl->node, &skl->ppl_list);
-
-	mconfig->pipe = pipe;
-
-	return 0;
-}
-
-static void skl_fill_module_pin_info_v4(struct skl_dfw_v4_module_pin *dfw_pin,
-					struct skl_module_pin *m_pin,
-					bool is_dynamic, int max_pin)
-{
-	int i;
-
-	for (i = 0; i < max_pin; i++) {
-		m_pin[i].id.module_id = dfw_pin[i].module_id;
-		m_pin[i].id.instance_id = dfw_pin[i].instance_id;
-		m_pin[i].in_use = false;
-		m_pin[i].is_dynamic = is_dynamic;
-		m_pin[i].pin_state = SKL_PIN_UNBIND;
-	}
-}
-
-static void skl_tplg_fill_fmt_v4(struct skl_module_pin_fmt *dst_fmt,
-				 struct skl_dfw_v4_module_fmt *src_fmt,
-				 int pins)
-{
-	int i;
-
-	for (i = 0; i < pins; i++) {
-		dst_fmt[i].fmt.channels  = src_fmt[i].channels;
-		dst_fmt[i].fmt.s_freq = src_fmt[i].freq;
-		dst_fmt[i].fmt.bit_depth = src_fmt[i].bit_depth;
-		dst_fmt[i].fmt.valid_bit_depth = src_fmt[i].valid_bit_depth;
-		dst_fmt[i].fmt.ch_cfg = src_fmt[i].ch_cfg;
-		dst_fmt[i].fmt.ch_map = src_fmt[i].ch_map;
-		dst_fmt[i].fmt.interleaving_style =
-						src_fmt[i].interleaving_style;
-		dst_fmt[i].fmt.sample_type = src_fmt[i].sample_type;
-	}
-}
-
-static int skl_tplg_get_pvt_data_v4(struct snd_soc_tplg_dapm_widget *tplg_w,
-				    struct skl_dev *skl, struct device *dev,
-				    struct skl_module_cfg *mconfig)
-{
-	struct skl_dfw_v4_module *dfw =
-				(struct skl_dfw_v4_module *)tplg_w->priv.data;
-	int ret;
-	int idx = mconfig->fmt_cfg_idx;
-
-	dev_dbg(dev, "Parsing Skylake v4 widget topology data\n");
-
-	ret = guid_parse(dfw->uuid, (guid_t *)mconfig->guid);
-	if (ret)
-		return ret;
-	mconfig->id.module_id = -1;
-	mconfig->id.instance_id = dfw->instance_id;
-	mconfig->module->resources[0].cpc = dfw->max_mcps / 1000;
-	mconfig->module->resources[0].ibs = dfw->ibs;
-	mconfig->module->resources[0].obs = dfw->obs;
-	mconfig->core_id = dfw->core_id;
-	mconfig->module->max_input_pins = dfw->max_in_queue;
-	mconfig->module->max_output_pins = dfw->max_out_queue;
-	mconfig->module->loadable = dfw->is_loadable;
-	skl_tplg_fill_fmt_v4(mconfig->module->formats[0].inputs, dfw->in_fmt,
-			     MAX_IN_QUEUE);
-	skl_tplg_fill_fmt_v4(mconfig->module->formats[0].outputs, dfw->out_fmt,
-			     MAX_OUT_QUEUE);
-
-	mconfig->params_fixup = dfw->params_fixup;
-	mconfig->converter = dfw->converter;
-	mconfig->m_type = dfw->module_type;
-	mconfig->vbus_id = dfw->vbus_id;
-	mconfig->module->resources[0].is_pages = dfw->mem_pages;
-
-	ret = skl_tplg_add_pipe_v4(dev, mconfig, skl, &dfw->pipe);
-	if (ret)
-		return ret;
-
-	mconfig->dev_type = dfw->dev_type;
-	mconfig->hw_conn_type = dfw->hw_conn_type;
-	mconfig->time_slot = dfw->time_slot;
-	mconfig->formats_config[idx].caps_size = dfw->caps.caps_size;
-
-	mconfig->m_in_pin = devm_kcalloc(dev,
-				MAX_IN_QUEUE, sizeof(*mconfig->m_in_pin),
-				GFP_KERNEL);
-	if (!mconfig->m_in_pin)
-		return -ENOMEM;
-
-	mconfig->m_out_pin = devm_kcalloc(dev,
-				MAX_OUT_QUEUE, sizeof(*mconfig->m_out_pin),
-				GFP_KERNEL);
-	if (!mconfig->m_out_pin)
-		return -ENOMEM;
-
-	skl_fill_module_pin_info_v4(dfw->in_pin, mconfig->m_in_pin,
-				    dfw->is_dynamic_in_pin,
-				    mconfig->module->max_input_pins);
-	skl_fill_module_pin_info_v4(dfw->out_pin, mconfig->m_out_pin,
-				    dfw->is_dynamic_out_pin,
-				    mconfig->module->max_output_pins);
-
-	if (mconfig->formats_config[idx].caps_size) {
-		mconfig->formats_config[idx].set_params = dfw->caps.set_params;
-		mconfig->formats_config[idx].param_id = dfw->caps.param_id;
-		mconfig->formats_config[idx].caps =
-		devm_kzalloc(dev, mconfig->formats_config[idx].caps_size,
-			     GFP_KERNEL);
-		if (!mconfig->formats_config[idx].caps)
-			return -ENOMEM;
-		memcpy(mconfig->formats_config[idx].caps, dfw->caps.caps,
-		       dfw->caps.caps_size);
-	}
-
-	return 0;
-}
-
 static int skl_tplg_get_caps_data(struct device *dev, char *data,
 				  struct skl_module_cfg *mconfig)
 {
@@ -2877,13 +2715,6 @@ static int skl_tplg_get_pvt_data(struct snd_soc_tplg_dapm_widget *tplg_w,
 	char *data;
 	int ret;
 
-	/*
-	 * v4 configuration files have a valid UUID at the start of
-	 * the widget's private data.
-	 */
-	if (uuid_is_valid((char *)tplg_w->priv.data))
-		return skl_tplg_get_pvt_data_v4(tplg_w, skl, dev, mconfig);
-
 	/* Read the NUM_DATA_BLOCKS descriptor */
 	array = (struct snd_soc_tplg_vendor_array *)tplg_w->priv.data;
 	ret = skl_tplg_get_desc_blocks(dev, array);
-- 
2.25.1

