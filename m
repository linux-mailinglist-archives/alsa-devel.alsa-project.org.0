Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9584D1DBE
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 17:49:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5574A1872;
	Tue,  8 Mar 2022 17:48:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5574A1872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646758161;
	bh=Qwl2gT+HUShVvX4bxNfJsfKBxAKHNoQDseaSoqIr3Nc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UTTt5GcHEMXFQflpiIi4ZtJRrqUd561aZCPdvHZrRuV4WQPm0Gr2rUk2HdkvvlMdd
	 BkuNDiGQ/f1WVzak3cJKREZPI7vNPzk1nyt901iX9nOonFhz+0jIGDEnufTsQCmwpw
	 V82jy4FXetH4zhidiGn96QAGrSgT+GJaDRUOAfo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41E3AF80589;
	Tue,  8 Mar 2022 17:44:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57CBFF80542; Tue,  8 Mar 2022 17:44:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 671F7F8026A
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 17:44:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 671F7F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WEHVW0QV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646757854; x=1678293854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qwl2gT+HUShVvX4bxNfJsfKBxAKHNoQDseaSoqIr3Nc=;
 b=WEHVW0QVgx2zf3oEEnd6d932sFkVhYnHSpCn4R0s7XyF6S9uI7a9/2Do
 tvIzf8Dm9/eho5dhBJMcNA6/6/4sWwG4br2nBuC054XqDPkWxujv71I3e
 mbfUG5RujLzQ4gAbR4RVcZiyNjUVfIYwEoE7TgYqB3v6fgclm2Zkxj/v1
 UDbBuZBHz6WJ+t6IOmzglwx0zFRbDGO7K7dppwAMbVif2TWXydQwkgPE7
 NpuKFVxEpPJH3c/PgyLfgZ05hPchkMa4H21OswZOh6SEQ7RUCuJN3rgVY
 ueBo9SSGaaseifEv5Nq1XYf/+X5J0qH8kiRil9+pDngiR/qOGBHQkDfQA A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252307224"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252307224"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:55 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="537633248"
Received: from bustam3x-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.251.130.225])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:54 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 07/18] ASoC: SOF: topology: Drop the size parameter from
 struct sof_topology_token
Date: Tue,  8 Mar 2022 08:43:33 -0800
Message-Id: <20220308164344.577647-8-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
References: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

It is always 0 and never used while parsing.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 163 ++++++++++++++++++---------------------
 1 file changed, 75 insertions(+), 88 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index c31358aa8a75..7280e14c13bc 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -473,12 +473,11 @@ static enum sof_comp_type find_process_comp_type(enum sof_ipc_process_type type)
 struct sof_topology_token {
 	u32 token;
 	u32 type;
-	int (*get_token)(void *elem, void *object, u32 offset, u32 size);
+	int (*get_token)(void *elem, void *object, u32 offset);
 	u32 offset;
-	u32 size;
 };
 
-static int get_token_u32(void *elem, void *object, u32 offset, u32 size)
+static int get_token_u32(void *elem, void *object, u32 offset)
 {
 	struct snd_soc_tplg_vendor_value_elem *velem = elem;
 	u32 *val = (u32 *)((u8 *)object + offset);
@@ -487,7 +486,7 @@ static int get_token_u32(void *elem, void *object, u32 offset, u32 size)
 	return 0;
 }
 
-static int get_token_u16(void *elem, void *object, u32 offset, u32 size)
+static int get_token_u16(void *elem, void *object, u32 offset)
 {
 	struct snd_soc_tplg_vendor_value_elem *velem = elem;
 	u16 *val = (u16 *)((u8 *)object + offset);
@@ -496,7 +495,7 @@ static int get_token_u16(void *elem, void *object, u32 offset, u32 size)
 	return 0;
 }
 
-static int get_token_uuid(void *elem, void *object, u32 offset, u32 size)
+static int get_token_uuid(void *elem, void *object, u32 offset)
 {
 	struct snd_soc_tplg_vendor_uuid_elem *velem = elem;
 	u8 *dst = (u8 *)object + offset;
@@ -506,7 +505,7 @@ static int get_token_uuid(void *elem, void *object, u32 offset, u32 size)
 	return 0;
 }
 
-static int get_token_comp_format(void *elem, void *object, u32 offset, u32 size)
+static int get_token_comp_format(void *elem, void *object, u32 offset)
 {
 	struct snd_soc_tplg_vendor_string_elem *velem = elem;
 	u32 *val = (u32 *)((u8 *)object + offset);
@@ -515,7 +514,7 @@ static int get_token_comp_format(void *elem, void *object, u32 offset, u32 size)
 	return 0;
 }
 
-static int get_token_dai_type(void *elem, void *object, u32 offset, u32 size)
+static int get_token_dai_type(void *elem, void *object, u32 offset)
 {
 	struct snd_soc_tplg_vendor_string_elem *velem = elem;
 	u32 *val = (u32 *)((u8 *)object + offset);
@@ -524,8 +523,7 @@ static int get_token_dai_type(void *elem, void *object, u32 offset, u32 size)
 	return 0;
 }
 
-static int get_token_process_type(void *elem, void *object, u32 offset,
-				  u32 size)
+static int get_token_process_type(void *elem, void *object, u32 offset)
 {
 	struct snd_soc_tplg_vendor_string_elem *velem = elem;
 	u32 *val = (u32 *)((u8 *)object + offset);
@@ -537,80 +535,80 @@ static int get_token_process_type(void *elem, void *object, u32 offset,
 /* Buffers */
 static const struct sof_topology_token buffer_tokens[] = {
 	{SOF_TKN_BUF_SIZE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_buffer, size), 0},
+		offsetof(struct sof_ipc_buffer, size)},
 	{SOF_TKN_BUF_CAPS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_buffer, caps), 0},
+		offsetof(struct sof_ipc_buffer, caps)},
 };
 
 /* DAI */
 static const struct sof_topology_token dai_tokens[] = {
 	{SOF_TKN_DAI_TYPE, SND_SOC_TPLG_TUPLE_TYPE_STRING, get_token_dai_type,
-		offsetof(struct sof_ipc_comp_dai, type), 0},
+		offsetof(struct sof_ipc_comp_dai, type)},
 	{SOF_TKN_DAI_INDEX, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_comp_dai, dai_index), 0},
+		offsetof(struct sof_ipc_comp_dai, dai_index)},
 	{SOF_TKN_DAI_DIRECTION, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_comp_dai, direction), 0},
+		offsetof(struct sof_ipc_comp_dai, direction)},
 };
 
 /* BE DAI link */
 static const struct sof_topology_token dai_link_tokens[] = {
 	{SOF_TKN_DAI_TYPE, SND_SOC_TPLG_TUPLE_TYPE_STRING, get_token_dai_type,
-		offsetof(struct sof_ipc_dai_config, type), 0},
+		offsetof(struct sof_ipc_dai_config, type)},
 	{SOF_TKN_DAI_INDEX, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_dai_config, dai_index), 0},
+		offsetof(struct sof_ipc_dai_config, dai_index)},
 };
 
 /* scheduling */
 static const struct sof_topology_token sched_tokens[] = {
 	{SOF_TKN_SCHED_PERIOD, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_pipe_new, period), 0},
+		offsetof(struct sof_ipc_pipe_new, period)},
 	{SOF_TKN_SCHED_PRIORITY, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_pipe_new, priority), 0},
+		offsetof(struct sof_ipc_pipe_new, priority)},
 	{SOF_TKN_SCHED_MIPS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_pipe_new, period_mips), 0},
+		offsetof(struct sof_ipc_pipe_new, period_mips)},
 	{SOF_TKN_SCHED_CORE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_pipe_new, core), 0},
+		offsetof(struct sof_ipc_pipe_new, core)},
 	{SOF_TKN_SCHED_FRAMES, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_pipe_new, frames_per_sched), 0},
+		offsetof(struct sof_ipc_pipe_new, frames_per_sched)},
 	{SOF_TKN_SCHED_TIME_DOMAIN, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_pipe_new, time_domain), 0},
+		offsetof(struct sof_ipc_pipe_new, time_domain)},
 };
 
 static const struct sof_topology_token pipeline_tokens[] = {
 	{SOF_TKN_SCHED_DYNAMIC_PIPELINE, SND_SOC_TPLG_TUPLE_TYPE_BOOL, get_token_u16,
-		offsetof(struct snd_sof_widget, dynamic_pipeline_widget), 0},
+		offsetof(struct snd_sof_widget, dynamic_pipeline_widget)},
 
 };
 
 /* volume */
 static const struct sof_topology_token volume_tokens[] = {
 	{SOF_TKN_VOLUME_RAMP_STEP_TYPE, SND_SOC_TPLG_TUPLE_TYPE_WORD,
-		get_token_u32, offsetof(struct sof_ipc_comp_volume, ramp), 0},
+		get_token_u32, offsetof(struct sof_ipc_comp_volume, ramp)},
 	{SOF_TKN_VOLUME_RAMP_STEP_MS,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_comp_volume, initial_ramp), 0},
+		offsetof(struct sof_ipc_comp_volume, initial_ramp)},
 };
 
 /* SRC */
 static const struct sof_topology_token src_tokens[] = {
 	{SOF_TKN_SRC_RATE_IN, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_comp_src, source_rate), 0},
+		offsetof(struct sof_ipc_comp_src, source_rate)},
 	{SOF_TKN_SRC_RATE_OUT, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_comp_src, sink_rate), 0},
+		offsetof(struct sof_ipc_comp_src, sink_rate)},
 };
 
 /* ASRC */
 static const struct sof_topology_token asrc_tokens[] = {
 	{SOF_TKN_ASRC_RATE_IN, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_comp_asrc, source_rate), 0},
+		offsetof(struct sof_ipc_comp_asrc, source_rate)},
 	{SOF_TKN_ASRC_RATE_OUT, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_comp_asrc, sink_rate), 0},
+		offsetof(struct sof_ipc_comp_asrc, sink_rate)},
 	{SOF_TKN_ASRC_ASYNCHRONOUS_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD,
 		get_token_u32,
-		offsetof(struct sof_ipc_comp_asrc, asynchronous_mode), 0},
+		offsetof(struct sof_ipc_comp_asrc, asynchronous_mode)},
 	{SOF_TKN_ASRC_OPERATION_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD,
 		get_token_u32,
-		offsetof(struct sof_ipc_comp_asrc, operation_mode), 0},
+		offsetof(struct sof_ipc_comp_asrc, operation_mode)},
 };
 
 /* Tone */
@@ -621,62 +619,62 @@ static const struct sof_topology_token tone_tokens[] = {
 static const struct sof_topology_token process_tokens[] = {
 	{SOF_TKN_PROCESS_TYPE, SND_SOC_TPLG_TUPLE_TYPE_STRING,
 		get_token_process_type,
-		offsetof(struct sof_ipc_comp_process, type), 0},
+		offsetof(struct sof_ipc_comp_process, type)},
 };
 
 /* PCM */
 static const struct sof_topology_token pcm_tokens[] = {
 	{SOF_TKN_PCM_DMAC_CONFIG, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_comp_host, dmac_config), 0},
+		offsetof(struct sof_ipc_comp_host, dmac_config)},
 };
 
 /* PCM */
 static const struct sof_topology_token stream_tokens[] = {
 	{SOF_TKN_STREAM_PLAYBACK_COMPATIBLE_D0I3,
 		SND_SOC_TPLG_TUPLE_TYPE_BOOL, get_token_u16,
-		offsetof(struct snd_sof_pcm, stream[0].d0i3_compatible), 0},
+		offsetof(struct snd_sof_pcm, stream[0].d0i3_compatible)},
 	{SOF_TKN_STREAM_CAPTURE_COMPATIBLE_D0I3,
 		SND_SOC_TPLG_TUPLE_TYPE_BOOL, get_token_u16,
-		offsetof(struct snd_sof_pcm, stream[1].d0i3_compatible), 0},
+		offsetof(struct snd_sof_pcm, stream[1].d0i3_compatible)},
 };
 
 /* Generic components */
 static const struct sof_topology_token comp_tokens[] = {
 	{SOF_TKN_COMP_PERIOD_SINK_COUNT,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_comp_config, periods_sink), 0},
+		offsetof(struct sof_ipc_comp_config, periods_sink)},
 	{SOF_TKN_COMP_PERIOD_SOURCE_COUNT,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_comp_config, periods_source), 0},
+		offsetof(struct sof_ipc_comp_config, periods_source)},
 	{SOF_TKN_COMP_FORMAT,
 		SND_SOC_TPLG_TUPLE_TYPE_STRING, get_token_comp_format,
-		offsetof(struct sof_ipc_comp_config, frame_fmt), 0},
+		offsetof(struct sof_ipc_comp_config, frame_fmt)},
 };
 
 /* SSP */
 static const struct sof_topology_token ssp_tokens[] = {
 	{SOF_TKN_INTEL_SSP_CLKS_CONTROL,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_dai_ssp_params, clks_control), 0},
+		offsetof(struct sof_ipc_dai_ssp_params, clks_control)},
 	{SOF_TKN_INTEL_SSP_MCLK_ID,
 		SND_SOC_TPLG_TUPLE_TYPE_SHORT, get_token_u16,
-		offsetof(struct sof_ipc_dai_ssp_params, mclk_id), 0},
+		offsetof(struct sof_ipc_dai_ssp_params, mclk_id)},
 	{SOF_TKN_INTEL_SSP_SAMPLE_BITS, SND_SOC_TPLG_TUPLE_TYPE_WORD,
 		get_token_u32,
-		offsetof(struct sof_ipc_dai_ssp_params, sample_valid_bits), 0},
+		offsetof(struct sof_ipc_dai_ssp_params, sample_valid_bits)},
 	{SOF_TKN_INTEL_SSP_FRAME_PULSE_WIDTH, SND_SOC_TPLG_TUPLE_TYPE_SHORT,
 		get_token_u16,
-		offsetof(struct sof_ipc_dai_ssp_params, frame_pulse_width), 0},
+		offsetof(struct sof_ipc_dai_ssp_params, frame_pulse_width)},
 	{SOF_TKN_INTEL_SSP_QUIRKS, SND_SOC_TPLG_TUPLE_TYPE_WORD,
 		get_token_u32,
-		offsetof(struct sof_ipc_dai_ssp_params, quirks), 0},
+		offsetof(struct sof_ipc_dai_ssp_params, quirks)},
 	{SOF_TKN_INTEL_SSP_TDM_PADDING_PER_SLOT, SND_SOC_TPLG_TUPLE_TYPE_BOOL,
 		get_token_u16,
 		offsetof(struct sof_ipc_dai_ssp_params,
-			 tdm_per_slot_padding_flag), 0},
+			 tdm_per_slot_padding_flag)},
 	{SOF_TKN_INTEL_SSP_BCLK_DELAY, SND_SOC_TPLG_TUPLE_TYPE_WORD,
 		get_token_u32,
-		offsetof(struct sof_ipc_dai_ssp_params, bclk_delay), 0},
+		offsetof(struct sof_ipc_dai_ssp_params, bclk_delay)},
 
 };
 
@@ -684,43 +682,42 @@ static const struct sof_topology_token ssp_tokens[] = {
 static const struct sof_topology_token alh_tokens[] = {
 	{SOF_TKN_INTEL_ALH_RATE,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_dai_alh_params, rate), 0},
+		offsetof(struct sof_ipc_dai_alh_params, rate)},
 	{SOF_TKN_INTEL_ALH_CH,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_dai_alh_params, channels), 0},
+		offsetof(struct sof_ipc_dai_alh_params, channels)},
 };
 
 /* DMIC */
 static const struct sof_topology_token dmic_tokens[] = {
 	{SOF_TKN_INTEL_DMIC_DRIVER_VERSION,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_dai_dmic_params, driver_ipc_version),
-		0},
+		offsetof(struct sof_ipc_dai_dmic_params, driver_ipc_version)},
 	{SOF_TKN_INTEL_DMIC_CLK_MIN,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_dai_dmic_params, pdmclk_min), 0},
+		offsetof(struct sof_ipc_dai_dmic_params, pdmclk_min)},
 	{SOF_TKN_INTEL_DMIC_CLK_MAX,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_dai_dmic_params, pdmclk_max), 0},
+		offsetof(struct sof_ipc_dai_dmic_params, pdmclk_max)},
 	{SOF_TKN_INTEL_DMIC_SAMPLE_RATE,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_dai_dmic_params, fifo_fs), 0},
+		offsetof(struct sof_ipc_dai_dmic_params, fifo_fs)},
 	{SOF_TKN_INTEL_DMIC_DUTY_MIN,
 		SND_SOC_TPLG_TUPLE_TYPE_SHORT, get_token_u16,
-		offsetof(struct sof_ipc_dai_dmic_params, duty_min), 0},
+		offsetof(struct sof_ipc_dai_dmic_params, duty_min)},
 	{SOF_TKN_INTEL_DMIC_DUTY_MAX,
 		SND_SOC_TPLG_TUPLE_TYPE_SHORT, get_token_u16,
-		offsetof(struct sof_ipc_dai_dmic_params, duty_max), 0},
+		offsetof(struct sof_ipc_dai_dmic_params, duty_max)},
 	{SOF_TKN_INTEL_DMIC_NUM_PDM_ACTIVE,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
 		offsetof(struct sof_ipc_dai_dmic_params,
-			 num_pdm_active), 0},
+			 num_pdm_active)},
 	{SOF_TKN_INTEL_DMIC_FIFO_WORD_LENGTH,
 		SND_SOC_TPLG_TUPLE_TYPE_SHORT, get_token_u16,
-		offsetof(struct sof_ipc_dai_dmic_params, fifo_bits), 0},
+		offsetof(struct sof_ipc_dai_dmic_params, fifo_bits)},
 	{SOF_TKN_INTEL_DMIC_UNMUTE_RAMP_TIME_MS,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_dai_dmic_params, unmute_ramp_time), 0},
+		offsetof(struct sof_ipc_dai_dmic_params, unmute_ramp_time)},
 
 };
 
@@ -728,28 +725,28 @@ static const struct sof_topology_token dmic_tokens[] = {
 static const struct sof_topology_token esai_tokens[] = {
 	{SOF_TKN_IMX_ESAI_MCLK_ID,
 		SND_SOC_TPLG_TUPLE_TYPE_SHORT, get_token_u16,
-		offsetof(struct sof_ipc_dai_esai_params, mclk_id), 0},
+		offsetof(struct sof_ipc_dai_esai_params, mclk_id)},
 };
 
 /* SAI */
 static const struct sof_topology_token sai_tokens[] = {
 	{SOF_TKN_IMX_SAI_MCLK_ID,
 		SND_SOC_TPLG_TUPLE_TYPE_SHORT, get_token_u16,
-		offsetof(struct sof_ipc_dai_sai_params, mclk_id), 0},
+		offsetof(struct sof_ipc_dai_sai_params, mclk_id)},
 };
 
 /* Core tokens */
 static const struct sof_topology_token core_tokens[] = {
 	{SOF_TKN_COMP_CORE_ID,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_comp, core), 0},
+		offsetof(struct sof_ipc_comp, core)},
 };
 
 /* Component extended tokens */
 static const struct sof_topology_token comp_ext_tokens[] = {
 	{SOF_TKN_COMP_UUID,
 		SND_SOC_TPLG_TUPLE_TYPE_UUID, get_token_uuid,
-		offsetof(struct sof_ipc_comp_ext, uuid), 0},
+		offsetof(struct sof_ipc_comp_ext, uuid)},
 };
 
 /*
@@ -761,63 +758,56 @@ static const struct sof_topology_token comp_ext_tokens[] = {
 static const struct sof_topology_token dmic_pdm_tokens[] = {
 	{SOF_TKN_INTEL_DMIC_PDM_CTRL_ID,
 		SND_SOC_TPLG_TUPLE_TYPE_SHORT, get_token_u16,
-		offsetof(struct sof_ipc_dai_dmic_pdm_ctrl, id),
-		0},
+		offsetof(struct sof_ipc_dai_dmic_pdm_ctrl, id),},
 	{SOF_TKN_INTEL_DMIC_PDM_MIC_A_Enable,
 		SND_SOC_TPLG_TUPLE_TYPE_SHORT, get_token_u16,
-		offsetof(struct sof_ipc_dai_dmic_pdm_ctrl, enable_mic_a),
-		0},
+		offsetof(struct sof_ipc_dai_dmic_pdm_ctrl, enable_mic_a)},
 	{SOF_TKN_INTEL_DMIC_PDM_MIC_B_Enable,
 		SND_SOC_TPLG_TUPLE_TYPE_SHORT, get_token_u16,
-		offsetof(struct sof_ipc_dai_dmic_pdm_ctrl, enable_mic_b),
-		0},
+		offsetof(struct sof_ipc_dai_dmic_pdm_ctrl, enable_mic_b)},
 	{SOF_TKN_INTEL_DMIC_PDM_POLARITY_A,
 		SND_SOC_TPLG_TUPLE_TYPE_SHORT, get_token_u16,
-		offsetof(struct sof_ipc_dai_dmic_pdm_ctrl, polarity_mic_a),
-		0},
+		offsetof(struct sof_ipc_dai_dmic_pdm_ctrl, polarity_mic_a)},
 	{SOF_TKN_INTEL_DMIC_PDM_POLARITY_B,
 		SND_SOC_TPLG_TUPLE_TYPE_SHORT, get_token_u16,
-		offsetof(struct sof_ipc_dai_dmic_pdm_ctrl, polarity_mic_b),
-		0},
+		offsetof(struct sof_ipc_dai_dmic_pdm_ctrl, polarity_mic_b)},
 	{SOF_TKN_INTEL_DMIC_PDM_CLK_EDGE,
 		SND_SOC_TPLG_TUPLE_TYPE_SHORT, get_token_u16,
-		offsetof(struct sof_ipc_dai_dmic_pdm_ctrl, clk_edge),
-		0},
+		offsetof(struct sof_ipc_dai_dmic_pdm_ctrl, clk_edge)},
 	{SOF_TKN_INTEL_DMIC_PDM_SKEW,
 		SND_SOC_TPLG_TUPLE_TYPE_SHORT, get_token_u16,
-		offsetof(struct sof_ipc_dai_dmic_pdm_ctrl, skew),
-		0},
+		offsetof(struct sof_ipc_dai_dmic_pdm_ctrl, skew)},
 };
 
 /* HDA */
 static const struct sof_topology_token hda_tokens[] = {
 	{SOF_TKN_INTEL_HDA_RATE,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_dai_hda_params, rate), 0},
+		offsetof(struct sof_ipc_dai_hda_params, rate)},
 	{SOF_TKN_INTEL_HDA_CH,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_dai_hda_params, channels), 0},
+		offsetof(struct sof_ipc_dai_hda_params, channels)},
 };
 
 /* Leds */
 static const struct sof_topology_token led_tokens[] = {
 	{SOF_TKN_MUTE_LED_USE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-	 offsetof(struct snd_sof_led_control, use_led), 0},
+	 offsetof(struct snd_sof_led_control, use_led)},
 	{SOF_TKN_MUTE_LED_DIRECTION, SND_SOC_TPLG_TUPLE_TYPE_WORD,
-	 get_token_u32, offsetof(struct snd_sof_led_control, direction), 0},
+	 get_token_u32, offsetof(struct snd_sof_led_control, direction)},
 };
 
 /* AFE */
 static const struct sof_topology_token afe_tokens[] = {
 	{SOF_TKN_MEDIATEK_AFE_RATE,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_dai_mtk_afe_params, rate), 0},
+		offsetof(struct sof_ipc_dai_mtk_afe_params, rate)},
 	{SOF_TKN_MEDIATEK_AFE_CH,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_dai_mtk_afe_params, channels), 0},
+		offsetof(struct sof_ipc_dai_mtk_afe_params, channels)},
 	{SOF_TKN_MEDIATEK_AFE_FORMAT,
 		SND_SOC_TPLG_TUPLE_TYPE_STRING, get_token_comp_format,
-		offsetof(struct sof_ipc_dai_mtk_afe_params, format), 0},
+		offsetof(struct sof_ipc_dai_mtk_afe_params, format)},
 };
 
 static int sof_parse_uuid_tokens(struct snd_soc_component *scomp,
@@ -847,8 +837,7 @@ static int sof_parse_uuid_tokens(struct snd_soc_component *scomp,
 
 			/* matched - now load token */
 			tokens[j].get_token(elem, object,
-					    offset + tokens[j].offset,
-					    tokens[j].size);
+					    offset + tokens[j].offset);
 
 			found++;
 		}
@@ -884,8 +873,7 @@ static int sof_parse_string_tokens(struct snd_soc_component *scomp,
 
 			/* matched - now load token */
 			tokens[j].get_token(elem, object,
-					    offset + tokens[j].offset,
-					    tokens[j].size);
+					    offset + tokens[j].offset);
 
 			found++;
 		}
@@ -924,8 +912,7 @@ static int sof_parse_word_tokens(struct snd_soc_component *scomp,
 
 			/* load token */
 			tokens[j].get_token(elem, object,
-					    offset + tokens[j].offset,
-					    tokens[j].size);
+					    offset + tokens[j].offset);
 
 			found++;
 		}
-- 
2.25.1

