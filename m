Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE743EFE73
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 09:59:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9F3D167A;
	Wed, 18 Aug 2021 09:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9F3D167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629273544;
	bh=VZ0+xyMg78HUE9W3QG1+TZan/Bu1uiTptXgGfhwNTww=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eHu1NPSoxwkq7fwJW4efJvkriUWlwmoVperDaMZpNtyJlLQcvukBL6Uyx7SxIy1qv
	 pOZ256iq45vQiUC0k/MzR6Y+69UFrQI8H0MIncgj6l2xJvpi+BvjF+nymIgz0isJ6J
	 w9gr0dtdqYNG8ABeYh5r0OrFYJFrnNItN7KtV4lw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20534F8051C;
	Wed, 18 Aug 2021 09:55:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4148BF8051B; Wed, 18 Aug 2021 09:55:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4E9EF804EB
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 09:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4E9EF804EB
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="195855576"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="195855576"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 00:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="676975000"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 18 Aug 2021 00:55:21 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/11] ASoC: Intel: Skylake: Support modules with generic
 extension
Date: Wed, 18 Aug 2021 09:57:40 +0200
Message-Id: <20210818075742.1515155-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818075742.1515155-1-cezary.rojewski@intel.com>
References: <20210818075742.1515155-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Szymon Mielczarek <szymonx.mielczarek@intel.com>, jairaj.arava@intel.com,
 upstream@semihalf.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 harshapriya.n@intel.com, cujomalainey@google.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com,
 Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>, hdegoede@redhat.com,
 broonie@kernel.org, jenny.tc@intel.com, lma@semihalf.com,
 vamshi.krishna.gopal@intel.com
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

From: Szymon Mielczarek <szymonx.mielczarek@intel.com>

Some DSP modules require, besides the module base configuration, a
generic extension containing audio format for all module's pins that are
in use.

Signed-off-by: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>
Signed-off-by: Szymon Mielczarek <szymonx.mielczarek@intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-messages.c | 82 ++++++++++++++++++++++----
 sound/soc/intel/skylake/skl-topology.h | 15 +++++
 2 files changed, 84 insertions(+), 13 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index 7257acf0b6ee..8886f984ae26 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -472,6 +472,75 @@ static void skl_set_base_module_format(struct skl_dev *skl,
 	base_cfg->is_pages = res->is_pages;
 }
 
+static void fill_pin_params(struct skl_audio_data_format *pin_fmt,
+			    struct skl_module_fmt *format)
+{
+	pin_fmt->number_of_channels = format->channels;
+	pin_fmt->s_freq = format->s_freq;
+	pin_fmt->bit_depth = format->bit_depth;
+	pin_fmt->valid_bit_depth = format->valid_bit_depth;
+	pin_fmt->ch_cfg = format->ch_cfg;
+	pin_fmt->sample_type = format->sample_type;
+	pin_fmt->channel_map = format->ch_map;
+	pin_fmt->interleaving = format->interleaving_style;
+}
+
+/*
+ * Any module configuration begins with a base module configuration but
+ * can be followed by a generic extension containing audio format for all
+ * module's pins that are in use.
+ */
+static void skl_set_base_ext_module_format(struct skl_dev *skl,
+					   struct skl_module_cfg *mconfig,
+					   struct skl_base_cfg_ext *base_cfg_ext)
+{
+	struct skl_module *module = mconfig->module;
+	struct skl_module_pin_resources *pin_res;
+	struct skl_module_iface *fmt = &module->formats[mconfig->fmt_idx];
+	struct skl_module_res *res = &module->resources[mconfig->res_idx];
+	struct skl_module_fmt *format;
+	struct skl_pin_format *pin_fmt;
+	char *params;
+	int i;
+
+	base_cfg_ext->nr_input_pins = res->nr_input_pins;
+	base_cfg_ext->nr_output_pins = res->nr_output_pins;
+	base_cfg_ext->priv_param_length =
+		mconfig->formats_config[SKL_PARAM_INIT].caps_size;
+
+	for (i = 0; i < res->nr_input_pins; i++) {
+		pin_res = &res->input[i];
+		pin_fmt = &base_cfg_ext->pins_fmt[i];
+
+		pin_fmt->pin_idx = pin_res->pin_index;
+		pin_fmt->buf_size = pin_res->buf_size;
+
+		format = &fmt->inputs[pin_res->pin_index].fmt;
+		fill_pin_params(&pin_fmt->audio_fmt, format);
+	}
+
+	for (i = 0; i < res->nr_output_pins; i++) {
+		pin_res = &res->output[i];
+		pin_fmt = &base_cfg_ext->pins_fmt[res->nr_input_pins + i];
+
+		pin_fmt->pin_idx = pin_res->pin_index;
+		pin_fmt->buf_size = pin_res->buf_size;
+
+		format = &fmt->outputs[pin_res->pin_index].fmt;
+		fill_pin_params(&pin_fmt->audio_fmt, format);
+	}
+
+	if (!base_cfg_ext->priv_param_length)
+		return;
+
+	params = (char *)base_cfg_ext + sizeof(struct skl_base_cfg_ext);
+	params += (base_cfg_ext->nr_input_pins + base_cfg_ext->nr_output_pins) *
+		  sizeof(struct skl_pin_format);
+
+	memcpy(params, mconfig->formats_config[SKL_PARAM_INIT].caps,
+	       mconfig->formats_config[SKL_PARAM_INIT].caps_size);
+}
+
 /*
  * Copies copier capabilities into copier module and updates copier module
  * config size.
@@ -1091,19 +1160,6 @@ int skl_unbind_modules(struct skl_dev *skl,
 	return ret;
 }
 
-static void fill_pin_params(struct skl_audio_data_format *pin_fmt,
-				struct skl_module_fmt *format)
-{
-	pin_fmt->number_of_channels = format->channels;
-	pin_fmt->s_freq = format->s_freq;
-	pin_fmt->bit_depth = format->bit_depth;
-	pin_fmt->valid_bit_depth = format->valid_bit_depth;
-	pin_fmt->ch_cfg = format->ch_cfg;
-	pin_fmt->sample_type = format->sample_type;
-	pin_fmt->channel_map = format->ch_map;
-	pin_fmt->interleaving = format->interleaving_style;
-}
-
 #define CPR_SINK_FMT_PARAM_ID 2
 
 /*
diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
index ef332c83d5c0..f0695b2ac5dd 100644
--- a/sound/soc/intel/skylake/skl-topology.h
+++ b/sound/soc/intel/skylake/skl-topology.h
@@ -152,6 +152,21 @@ struct skl_up_down_mixer_cfg {
 	u32 ch_map;
 } __packed;
 
+struct skl_pin_format {
+	u32 pin_idx;
+	u32 buf_size;
+	struct skl_audio_data_format audio_fmt;
+} __packed;
+
+struct skl_base_cfg_ext {
+	u16 nr_input_pins;
+	u16 nr_output_pins;
+	u8 reserved[8];
+	u32 priv_param_length;
+	/* Input pin formats followed by output ones. */
+	struct skl_pin_format pins_fmt[0];
+} __packed;
+
 struct skl_algo_cfg {
 	struct skl_base_cfg  base_cfg;
 	char params[];
-- 
2.25.1

