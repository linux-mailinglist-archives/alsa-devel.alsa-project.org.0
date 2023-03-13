Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F706B780E
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 13:52:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95E35144C;
	Mon, 13 Mar 2023 13:51:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95E35144C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678711944;
	bh=gNsrNxxBkLt+33+LlCAidTacTJORMT4ooAd470h4gfk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HASuGcRiMgwThZP2nxb8L8GHS3lFhUXEsncVzXNmALwz6PQRe46biP5fSc4qmDifD
	 AKWOq951JZzc4GGSJDGrlyu3JaWoXSbzasSHBuDUfqchRUbUuwc5CHvGShSHbFhnx8
	 FNoRbtj30/CYnqMMzCwjYhrKRkONPxXhhAKORdy4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AD5EF80567;
	Mon, 13 Mar 2023 13:49:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17AD7F8057C; Mon, 13 Mar 2023 13:49:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DC36F80558
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 13:49:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DC36F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UdMJiCGl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678711775; x=1710247775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gNsrNxxBkLt+33+LlCAidTacTJORMT4ooAd470h4gfk=;
  b=UdMJiCGls+7LbZOnJc5dhLPhw/48U+eAiVlUFhGFuEYuPohtui8w4CXe
   ASSQNvRHUriJAk0/2AcV1cMD8exqo50HdJNA9Dt67GPqXwqZoIJbJmEbG
   ClWSW7EKI3RKdDW54HbhLgpvCKEhjjO5kAMTIYUmS/KO9YWa8lb5tcpfA
   WAvY7s1jVVwKjjGLCvtzlDzAbtQRTs4+zPwdGI+fBjPKBw0pi0pcMqiOM
   jiNQKwH3gvWKWZU9kon+6UmBQ25sErycsPlPJokDxm3hqDn0Lxw340whF
   tGCwSJJ3pOc8eHhTt3A5SjkdCc/31C2OI9osqIQ/lRhZ61PF0SDQPlFpC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="399728099"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="399728099"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="711116499"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="711116499"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:51 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 07/11] ASoC: SOF: ipc4-topology: Modify the type of available
 input/output formats
Date: Mon, 13 Mar 2023 14:48:52 +0200
Message-Id: <20230313124856.8140-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
References: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FQXYUCERJTLKQQJCRHFC2ANCBAVEQ3GX
X-Message-ID-Hash: FQXYUCERJTLKQQJCRHFC2ANCBAVEQ3GX
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQXYUCERJTLKQQJCRHFC2ANCBAVEQ3GX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Introduce a new struct sof_ipc4_pin_format which contains the pin index
and the buffer size. Replace the type of available input/output audio
formats in struct sof_ipc4_available_audio_format with this new struct
type and rename them to input_pin_fmts and output_pin_fmts.

Also, add a new token, SOF_TKN_CAVS_AUDIO_FORMAT_PIN_INDEX that will be
used to parse the pin index for the audio format from topology.
Currently we only set the audio format for Pin 0 in topology, so the
default value will be 0 for all audio formats.

Finally, parse the pin_index and the input/output buffer sizes
along with audio formats into the pin_format arrays in struct
sof_ipc4_available_audio_format. This makes the base_config array in struct
sof_ipc4_available_audio_format redundant. So remove it. This change
will allow the addition of audio formats for the non-zero pins in
topology transparent to the topology parser in the kernel.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h |   1 +
 sound/soc/sof/ipc4-pcm.c        |   2 +-
 sound/soc/sof/ipc4-topology.c   | 181 +++++++++++++-------------------
 sound/soc/sof/ipc4-topology.h   |  27 +++--
 sound/soc/sof/sof-audio.h       |   1 -
 sound/soc/sof/topology.c        |   1 -
 6 files changed, 96 insertions(+), 117 deletions(-)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 9e91e2640dd4..92360601b49c 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -180,6 +180,7 @@
 #define SOF_TKN_CAVS_AUDIO_FORMAT_IN_INTERLEAVING_STYLE	1906
 #define SOF_TKN_CAVS_AUDIO_FORMAT_IN_FMT_CFG	1907
 #define SOF_TKN_CAVS_AUDIO_FORMAT_IN_SAMPLE_TYPE	1908
+#define SOF_TKN_CAVS_AUDIO_FORMAT_PIN_INDEX		1909
 /* intentional token numbering discontinuity, reserved for future use */
 #define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_RATE	1930
 #define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_BIT_DEPTH	1931
diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index a679c08d9bb1..701da5ee4e4e 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -389,7 +389,7 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 	snd_mask_none(fmt);
 	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
 
-	rate->min = ipc4_copier->available_fmt.input_audio_fmts->sampling_frequency;
+	rate->min = ipc4_copier->available_fmt.input_pin_fmts->audio_fmt.sampling_frequency;
 	rate->max = rate->min;
 
 	switch (ipc4_copier->dai_type) {
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 0e1e4fc9224c..c462db95f3b2 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -41,41 +41,44 @@ static const struct sof_topology_token ipc4_comp_tokens[] = {
 		offsetof(struct sof_ipc4_base_module_cfg, is_pages)},
 };
 
-static const struct sof_topology_token ipc4_audio_format_buffer_size_tokens[] = {
-	{SOF_TKN_CAVS_AUDIO_FORMAT_IBS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_base_module_cfg, ibs)},
-	{SOF_TKN_CAVS_AUDIO_FORMAT_OBS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_base_module_cfg, obs)},
-};
-
 static const struct sof_topology_token ipc4_in_audio_format_tokens[] = {
 	{SOF_TKN_CAVS_AUDIO_FORMAT_IN_RATE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_audio_format, sampling_frequency)},
+		offsetof(struct sof_ipc4_pin_format, audio_fmt.sampling_frequency)},
 	{SOF_TKN_CAVS_AUDIO_FORMAT_IN_BIT_DEPTH, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_audio_format, bit_depth)},
+		offsetof(struct sof_ipc4_pin_format, audio_fmt.bit_depth)},
 	{SOF_TKN_CAVS_AUDIO_FORMAT_IN_CH_MAP, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_audio_format, ch_map)},
+		offsetof(struct sof_ipc4_pin_format, audio_fmt.ch_map)},
 	{SOF_TKN_CAVS_AUDIO_FORMAT_IN_CH_CFG, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_audio_format, ch_cfg)},
+		offsetof(struct sof_ipc4_pin_format, audio_fmt.ch_cfg)},
 	{SOF_TKN_CAVS_AUDIO_FORMAT_IN_INTERLEAVING_STYLE, SND_SOC_TPLG_TUPLE_TYPE_WORD,
-		get_token_u32, offsetof(struct sof_ipc4_audio_format, interleaving_style)},
+		get_token_u32, offsetof(struct sof_ipc4_pin_format,
+		audio_fmt.interleaving_style)},
 	{SOF_TKN_CAVS_AUDIO_FORMAT_IN_FMT_CFG, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_audio_format, fmt_cfg)},
+		offsetof(struct sof_ipc4_pin_format, audio_fmt.fmt_cfg)},
+	{SOF_TKN_CAVS_AUDIO_FORMAT_PIN_INDEX, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc4_pin_format, pin_index)},
+	{SOF_TKN_CAVS_AUDIO_FORMAT_IBS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc4_pin_format, buffer_size)},
 };
 
 static const struct sof_topology_token ipc4_out_audio_format_tokens[] = {
 	{SOF_TKN_CAVS_AUDIO_FORMAT_OUT_RATE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_audio_format, sampling_frequency)},
+		offsetof(struct sof_ipc4_pin_format, audio_fmt.sampling_frequency)},
 	{SOF_TKN_CAVS_AUDIO_FORMAT_OUT_BIT_DEPTH, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_audio_format, bit_depth)},
+		offsetof(struct sof_ipc4_pin_format, audio_fmt.bit_depth)},
 	{SOF_TKN_CAVS_AUDIO_FORMAT_OUT_CH_MAP, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_audio_format, ch_map)},
+		offsetof(struct sof_ipc4_pin_format, audio_fmt.ch_map)},
 	{SOF_TKN_CAVS_AUDIO_FORMAT_OUT_CH_CFG, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_audio_format, ch_cfg)},
+		offsetof(struct sof_ipc4_pin_format, audio_fmt.ch_cfg)},
 	{SOF_TKN_CAVS_AUDIO_FORMAT_OUT_INTERLEAVING_STYLE, SND_SOC_TPLG_TUPLE_TYPE_WORD,
-		get_token_u32, offsetof(struct sof_ipc4_audio_format, interleaving_style)},
+		get_token_u32, offsetof(struct sof_ipc4_pin_format,
+		audio_fmt.interleaving_style)},
 	{SOF_TKN_CAVS_AUDIO_FORMAT_OUT_FMT_CFG, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_audio_format, fmt_cfg)},
+		offsetof(struct sof_ipc4_pin_format, audio_fmt.fmt_cfg)},
+	{SOF_TKN_CAVS_AUDIO_FORMAT_PIN_INDEX, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc4_pin_format, pin_index)},
+	{SOF_TKN_CAVS_AUDIO_FORMAT_OBS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc4_pin_format, buffer_size)},
 };
 
 static const struct sof_topology_token ipc4_copier_deep_buffer_tokens[] = {
@@ -135,9 +138,6 @@ static const struct sof_token_info ipc4_token_list[SOF_TOKEN_COUNT] = {
 		ipc4_in_audio_format_tokens, ARRAY_SIZE(ipc4_in_audio_format_tokens)},
 	[SOF_OUT_AUDIO_FORMAT_TOKENS] = {"IPC4 Output Audio format tokens",
 		ipc4_out_audio_format_tokens, ARRAY_SIZE(ipc4_out_audio_format_tokens)},
-	[SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS] = {"IPC4 Audio format buffer size tokens",
-		ipc4_audio_format_buffer_size_tokens,
-		ARRAY_SIZE(ipc4_audio_format_buffer_size_tokens)},
 	[SOF_COPIER_DEEP_BUFFER_TOKENS] = {"IPC4 Copier deep buffer tokens",
 		ipc4_copier_deep_buffer_tokens, ARRAY_SIZE(ipc4_copier_deep_buffer_tokens)},
 	[SOF_COPIER_TOKENS] = {"IPC4 Copier tokens", ipc4_copier_tokens,
@@ -148,20 +148,18 @@ static const struct sof_token_info ipc4_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_SRC_TOKENS] = {"SRC tokens", src_tokens, ARRAY_SIZE(src_tokens)},
 };
 
-static void sof_ipc4_dbg_audio_format(struct device *dev,
-				      struct sof_ipc4_audio_format *format,
-				      size_t object_size, int num_format)
+static void sof_ipc4_dbg_audio_format(struct device *dev, struct sof_ipc4_pin_format *pin_fmt,
+				      int num_formats)
 {
-	struct sof_ipc4_audio_format *fmt;
-	void *ptr = format;
 	int i;
 
-	for (i = 0; i < num_format; i++, ptr = (u8 *)ptr + object_size) {
-		fmt = ptr;
+	for (i = 0; i < num_formats; i++) {
+		struct sof_ipc4_audio_format *fmt = &pin_fmt[i].audio_fmt;
 		dev_dbg(dev,
-			" #%d: %uHz, %ubit (ch_map %#x ch_cfg %u interleaving_style %u fmt_cfg %#x)\n",
-			i, fmt->sampling_frequency, fmt->bit_depth, fmt->ch_map,
-			fmt->ch_cfg, fmt->interleaving_style, fmt->fmt_cfg);
+			"Pin index #%d: %uHz, %ubit (ch_map %#x ch_cfg %u interleaving_style %u fmt_cfg %#x) buffer size %d\n",
+			pin_fmt[i].pin_index, fmt->sampling_frequency, fmt->bit_depth, fmt->ch_map,
+			fmt->ch_cfg, fmt->interleaving_style, fmt->fmt_cfg,
+			pin_fmt[i].buffer_size);
 	}
 }
 
@@ -179,10 +177,9 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 				  struct sof_ipc4_available_audio_format *available_fmt,
 				  struct sof_ipc4_base_module_cfg *module_base_cfg)
 {
-	struct sof_ipc4_base_module_cfg *base_config;
-	struct sof_ipc4_audio_format *out_format, *in_format;
+	struct sof_ipc4_pin_format *out_format, *in_format;
 	int audio_fmt_num = 0;
-	int ret, i;
+	int ret;
 
 	ret = sof_update_ipc_object(scomp, &audio_fmt_num,
 				    SOF_AUDIO_FMT_NUM_TOKENS, swidget->tuples,
@@ -195,47 +192,25 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 
 	dev_dbg(scomp->dev, "Number of audio formats: %d\n", available_fmt->audio_fmt_num);
 
-	base_config = kcalloc(available_fmt->audio_fmt_num, sizeof(*base_config), GFP_KERNEL);
-	if (!base_config)
-		return -ENOMEM;
-
 	/* set cpc and is_pages in the module's base_config */
 	ret = sof_update_ipc_object(scomp, module_base_cfg, SOF_COMP_TOKENS, swidget->tuples,
 				    swidget->num_tuples, sizeof(*module_base_cfg), 1);
 	if (ret) {
 		dev_err(scomp->dev, "parse comp tokens for %s failed, error: %d\n",
 			swidget->widget->name, ret);
-		goto err;
+		return ret;
 	}
 
 	dev_dbg(scomp->dev, "widget %s cpc: %d is_pages: %d\n",
 		swidget->widget->name, module_base_cfg->cpc, module_base_cfg->is_pages);
 
-	/* copy the ibs/obs for each base_cfg */
-	ret = sof_update_ipc_object(scomp, base_config,
-				    SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS, swidget->tuples,
-				    swidget->num_tuples, sizeof(*base_config),
-				    available_fmt->audio_fmt_num);
-	if (ret) {
-		dev_err(scomp->dev, "parse buffer size tokens failed %d\n", ret);
-		goto err;
-	}
-
-	for (i = 0; i < available_fmt->audio_fmt_num; i++)
-		dev_dbg(scomp->dev, "%d: ibs: %d obs: %d\n", i,
-			base_config[i].ibs, base_config[i].obs);
-
-	in_format = kcalloc(available_fmt->audio_fmt_num,
-			    sizeof(struct sof_ipc4_audio_format), GFP_KERNEL);
-	if (!in_format) {
-		kfree(base_config);
-		ret = -ENOMEM;
-		goto err;
-	}
+	in_format = kcalloc(available_fmt->audio_fmt_num, sizeof(*in_format), GFP_KERNEL);
+	if (!in_format)
+		return -ENOMEM;
 
-	ret = sof_update_ipc_object(scomp, available_fmt->input_audio_fmts,
+	ret = sof_update_ipc_object(scomp, in_format,
 				    SOF_IN_AUDIO_FORMAT_TOKENS, swidget->tuples,
-				    swidget->num_tuples, sizeof(struct sof_ipc4_audio_format),
+				    swidget->num_tuples, sizeof(*in_format),
 				    available_fmt->audio_fmt_num);
 	if (ret) {
 		dev_err(scomp->dev, "parse base_config audio_fmt tokens failed %d\n", ret);
@@ -243,8 +218,7 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 	}
 
 	dev_dbg(scomp->dev, "Get input audio formats for %s\n", swidget->widget->name);
-	sof_ipc4_dbg_audio_format(scomp->dev, available_fmt->input_audio_fmts,
-				  sizeof(struct sof_ipc4_audio_format),
+	sof_ipc4_dbg_audio_format(scomp->dev, available_fmt->input_pin_fmts,
 				  available_fmt->audio_fmt_num);
 
 	out_format = kcalloc(available_fmt->audio_fmt_num, sizeof(*out_format), GFP_KERNEL);
@@ -264,12 +238,10 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 	}
 
 	dev_dbg(scomp->dev, "Get output audio formats for %s\n", swidget->widget->name);
-	sof_ipc4_dbg_audio_format(scomp->dev, out_format, sizeof(*out_format),
-				  available_fmt->audio_fmt_num);
+	sof_ipc4_dbg_audio_format(scomp->dev, out_format, available_fmt->audio_fmt_num);
 
-	available_fmt->base_config = base_config;
-	available_fmt->out_audio_fmt = out_format;
-	available_fmt->input_audio_fmts = in_format;
+	available_fmt->output_pin_fmts = out_format;
+	available_fmt->input_pin_fmts = in_format;
 
 	return 0;
 
@@ -277,8 +249,6 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 	kfree(out_format);
 err_in:
 	kfree(in_format);
-err:
-	kfree(base_config);
 	return ret;
 }
 
@@ -286,12 +256,10 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 static void sof_ipc4_free_audio_fmt(struct sof_ipc4_available_audio_format *available_fmt)
 
 {
-	kfree(available_fmt->base_config);
-	available_fmt->base_config = NULL;
-	kfree(available_fmt->out_audio_fmt);
-	available_fmt->out_audio_fmt = NULL;
-	kfree(available_fmt->input_audio_fmts);
-	available_fmt->input_audio_fmts = NULL;
+	kfree(available_fmt->output_pin_fmts);
+	available_fmt->output_pin_fmts = NULL;
+	kfree(available_fmt->input_pin_fmts);
+	available_fmt->input_pin_fmts = NULL;
 }
 
 static void sof_ipc4_widget_free_comp_pipeline(struct snd_sof_widget *swidget)
@@ -431,8 +399,7 @@ static void sof_ipc4_widget_free_comp_pcm(struct snd_sof_widget *swidget)
 		return;
 
 	available_fmt = &ipc4_copier->available_fmt;
-	kfree(available_fmt->base_config);
-	kfree(available_fmt->out_audio_fmt);
+	kfree(available_fmt->output_pin_fmts);
 	kfree(ipc4_copier->gtw_attr);
 	kfree(ipc4_copier);
 	swidget->private = NULL;
@@ -584,8 +551,7 @@ static void sof_ipc4_widget_free_comp_dai(struct snd_sof_widget *swidget)
 	ipc4_copier = dai->private;
 	available_fmt = &ipc4_copier->available_fmt;
 
-	kfree(available_fmt->base_config);
-	kfree(available_fmt->out_audio_fmt);
+	kfree(available_fmt->output_pin_fmts);
 	if (ipc4_copier->dai_type != SOF_DAI_INTEL_SSP &&
 	    ipc4_copier->dai_type != SOF_DAI_INTEL_DMIC)
 		kfree(ipc4_copier->copier_config);
@@ -866,14 +832,14 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 				   struct snd_pcm_hw_params *params,
 				   struct sof_ipc4_available_audio_format *available_fmt)
 {
-	struct sof_ipc4_audio_format *fmt = available_fmt->ref_audio_fmt;
+	struct sof_ipc4_pin_format *pin_fmt = available_fmt->ref_audio_fmt;
 	u32 valid_bits;
 	u32 channels;
 	u32 rate;
 	int sample_valid_bits;
 	int i;
 
-	if (!fmt) {
+	if (!pin_fmt) {
 		dev_err(sdev->dev, "no reference formats for %s\n", swidget->widget->name);
 		return -EINVAL;
 	}
@@ -902,7 +868,9 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 	 * Search supported audio formats to match rate, channels ,and
 	 * sample_valid_bytes from runtime params
 	 */
-	for (i = 0; i < available_fmt->audio_fmt_num; i++, fmt++) {
+	for (i = 0; i < available_fmt->audio_fmt_num; i++) {
+		struct sof_ipc4_audio_format *fmt = &pin_fmt[i].audio_fmt;
+
 		rate = fmt->sampling_frequency;
 		channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
 		valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
@@ -921,15 +889,16 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 	}
 
 	/* copy input format */
-	memcpy(&base_config->audio_fmt, &available_fmt->input_audio_fmts[i], sizeof(*fmt));
+	memcpy(&base_config->audio_fmt, &available_fmt->input_pin_fmts[i].audio_fmt,
+	       sizeof(*out_format));
 
 	/* set base_cfg ibs/obs */
-	base_config->ibs = available_fmt->base_config[i].ibs;
-	base_config->obs = available_fmt->base_config[i].obs;
+	base_config->ibs = available_fmt->input_pin_fmts[i].buffer_size;
+	base_config->obs = available_fmt->output_pin_fmts[i].buffer_size;
 
 	dev_dbg(sdev->dev, "Init input audio formats for %s\n", swidget->widget->name);
-	sof_ipc4_dbg_audio_format(sdev->dev, &base_config->audio_fmt,
-				  sizeof(*base_config), 1);
+	sof_ipc4_dbg_audio_format(sdev->dev, &available_fmt->input_pin_fmts[i], 1);
+
 	if (out_format) {
 		/*
 		 * Current topology defines pin 0 input and output formats only in pairs.
@@ -938,10 +907,10 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 		 * input format. This logic will need to be updated when the format definitions
 		 * in topology change.
 		 */
-		memcpy(out_format, &available_fmt->out_audio_fmt[i], sizeof(*fmt));
+		memcpy(out_format, &available_fmt->output_pin_fmts[i].audio_fmt,
+		       sizeof(*out_format));
 		dev_dbg(sdev->dev, "Init output audio formats for %s\n", swidget->widget->name);
-		sof_ipc4_dbg_audio_format(sdev->dev, out_format,
-					  sizeof(*out_format), 1);
+		sof_ipc4_dbg_audio_format(sdev->dev, &available_fmt->output_pin_fmts[i], 1);
 	}
 
 	/* Return the index of the matched format */
@@ -1144,13 +1113,13 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		available_fmt = &ipc4_copier->available_fmt;
 
 		/*
-		 * Use the input_audio_fmts to match pcm params for playback and the out_audio_fmt
+		 * Use the input_pin_fmts to match pcm params for playback and the output_pin_fmts
 		 * for capture.
 		 */
 		if (dir == SNDRV_PCM_STREAM_PLAYBACK)
-			available_fmt->ref_audio_fmt = available_fmt->input_audio_fmts;
+			available_fmt->ref_audio_fmt = available_fmt->input_pin_fmts;
 		else
-			available_fmt->ref_audio_fmt = available_fmt->out_audio_fmt;
+			available_fmt->ref_audio_fmt = available_fmt->output_pin_fmts;
 
 		copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
 		copier_data->gtw_cfg.node_id |=
@@ -1170,7 +1139,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		copier_data = &ipc4_copier->data;
 		available_fmt = &ipc4_copier->available_fmt;
 		if (dir == SNDRV_PCM_STREAM_CAPTURE) {
-			available_fmt->ref_audio_fmt = available_fmt->out_audio_fmt;
+			available_fmt->ref_audio_fmt = available_fmt->output_pin_fmts;
 
 			/*
 			 * modify the input params for the dai copier as it only supports
@@ -1180,7 +1149,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			snd_mask_none(fmt);
 			snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
 		} else {
-			available_fmt->ref_audio_fmt = available_fmt->input_audio_fmts;
+			available_fmt->ref_audio_fmt = available_fmt->input_pin_fmts;
 		}
 
 		ref_params = pipeline_params;
@@ -1201,7 +1170,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		available_fmt = &ipc4_copier->available_fmt;
 
 		/* Use the input formats as the reference to match pcm params */
-		available_fmt->ref_audio_fmt = available_fmt->input_audio_fmts;
+		available_fmt->ref_audio_fmt = available_fmt->input_pin_fmts;
 		ref_params = pipeline_params;
 
 		break;
@@ -1388,7 +1357,7 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	struct sof_ipc4_available_audio_format *available_fmt = &gain->available_fmt;
 	int ret;
 
-	available_fmt->ref_audio_fmt = available_fmt->input_audio_fmts;
+	available_fmt->ref_audio_fmt = available_fmt->input_pin_fmts;
 
 	/* output format is not required to be sent to the FW for gain */
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &gain->base_config,
@@ -1414,7 +1383,7 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 	int ret;
 
 	/* only 32bit is supported by mixer */
-	available_fmt->ref_audio_fmt = available_fmt->input_audio_fmts;
+	available_fmt->ref_audio_fmt = available_fmt->input_pin_fmts;
 
 	/* output format is not required to be sent to the FW for mixer */
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &mixer->base_config,
@@ -1440,7 +1409,7 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	struct snd_interval *rate;
 	int ret;
 
-	available_fmt->ref_audio_fmt = available_fmt->input_audio_fmts;
+	available_fmt->ref_audio_fmt = available_fmt->input_pin_fmts;
 
 	/* output format is not required to be sent to the FW for SRC */
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &src->base_config,
@@ -2147,7 +2116,6 @@ static int sof_ipc4_link_setup(struct snd_sof_dev *sdev, struct snd_soc_dai_link
 static enum sof_tokens common_copier_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
-	SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS,
 	SOF_IN_AUDIO_FORMAT_TOKENS,
 	SOF_OUT_AUDIO_FORMAT_TOKENS,
 	SOF_COPIER_DEEP_BUFFER_TOKENS,
@@ -2163,7 +2131,6 @@ static enum sof_tokens pipeline_token_list[] = {
 static enum sof_tokens dai_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
-	SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS,
 	SOF_IN_AUDIO_FORMAT_TOKENS,
 	SOF_OUT_AUDIO_FORMAT_TOKENS,
 	SOF_COPIER_TOKENS,
@@ -2175,8 +2142,8 @@ static enum sof_tokens pga_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_GAIN_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
-	SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS,
 	SOF_IN_AUDIO_FORMAT_TOKENS,
+	SOF_OUT_AUDIO_FORMAT_TOKENS,
 	SOF_COMP_EXT_TOKENS,
 };
 
@@ -2184,7 +2151,7 @@ static enum sof_tokens mixer_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
 	SOF_IN_AUDIO_FORMAT_TOKENS,
-	SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS,
+	SOF_OUT_AUDIO_FORMAT_TOKENS,
 	SOF_COMP_EXT_TOKENS,
 };
 
@@ -2193,7 +2160,7 @@ static enum sof_tokens src_token_list[] = {
 	SOF_SRC_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
 	SOF_IN_AUDIO_FORMAT_TOKENS,
-	SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS,
+	SOF_OUT_AUDIO_FORMAT_TOKENS,
 	SOF_COMP_EXT_TOKENS,
 };
 
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 696d6c39a21b..2d9b1ba549f7 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -145,19 +145,32 @@ struct ipc4_pipeline_set_state_data {
 	DECLARE_FLEX_ARRAY(u32, pipeline_ids);
 } __packed;
 
+/**
+ * struct sof_ipc4_pin_format - Module pin format
+ * @pin_index: pin index
+ * @buffer_size: buffer size in bytes
+ * @audio_fmt: audio format for the pin
+ *
+ * This structure can be used for both output or input pins and the pin_index is relative to the
+ * pin type i.e output/input pin
+ */
+struct sof_ipc4_pin_format {
+	u32 pin_index;
+	u32 buffer_size;
+	struct sof_ipc4_audio_format audio_fmt;
+};
+
 /**
  * struct sof_ipc4_available_audio_format - Available audio formats
- * @base_config: Available base config
- * @out_audio_fmt: Available output audio format
- * @input_audio_fmts: Available input audio formats
+ * @output_pin_fmts: Available output pin formats
+ * @input_pin_fmts: Available input pin formats
  * @ref_audio_fmt: Reference audio format to match runtime audio format
  * @audio_fmt_num: Number of available audio formats
  */
 struct sof_ipc4_available_audio_format {
-	struct sof_ipc4_base_module_cfg *base_config;
-	struct sof_ipc4_audio_format *out_audio_fmt;
-	struct sof_ipc4_audio_format *input_audio_fmts;
-	struct sof_ipc4_audio_format *ref_audio_fmt;
+	struct sof_ipc4_pin_format *output_pin_fmts;
+	struct sof_ipc4_pin_format *input_pin_fmts;
+	struct sof_ipc4_pin_format *ref_audio_fmt;
 	int audio_fmt_num;
 };
 
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 4504f9efdc50..d220af5f08fb 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -256,7 +256,6 @@ enum sof_tokens {
 	SOF_COMP_EXT_TOKENS,
 	SOF_IN_AUDIO_FORMAT_TOKENS,
 	SOF_OUT_AUDIO_FORMAT_TOKENS,
-	SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS,
 	SOF_COPIER_DEEP_BUFFER_TOKENS,
 	SOF_COPIER_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 2d76ab13b3d1..3a091f18731f 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1232,7 +1232,6 @@ static int sof_widget_parse_tokens(struct snd_soc_component *scomp, struct snd_s
 			continue;
 		case SOF_IN_AUDIO_FORMAT_TOKENS:
 		case SOF_OUT_AUDIO_FORMAT_TOKENS:
-		case SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS:
 			num_sets = sof_get_token_value(SOF_TKN_COMP_NUM_AUDIO_FORMATS,
 						       swidget->tuples, swidget->num_tuples);
 
-- 
2.39.2

