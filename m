Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2282112E0
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 20:40:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 580CC1687;
	Wed,  1 Jul 2020 20:39:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 580CC1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593628801;
	bh=yGWyDcdVfkvtpho8b2jyiO62asBgXebX425XZtHOxgw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PJpAra6l64RzuPaiQPKVLrKvhuP7Bw4Q/9FpsXiX0xYQf3nV+A5kUEfy7sgEfgV5+
	 5aUxxI/xdxIKsD1FndboeiJImrNgl220KTWvtMweMs3dvs3pZcf2duRx3oKsstn/Qn
	 QLZ69xm2r0H36TYLQj7JwRhVGbxcesGcZjum0PfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B16D7F80256;
	Wed,  1 Jul 2020 20:37:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B49AFF8025F; Wed,  1 Jul 2020 20:37:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EEB8F800EA
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 20:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EEB8F800EA
IronPort-SDR: cP8v1/HZ9SglM7nvYCFqLf7b7Bk1t3AaYI+YVf9vYydB1J4ffTHSxbFdINFplwO0U6mYYtfbAa
 cmf4K0nk9zKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="208193421"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="208193421"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:37:24 -0700
IronPort-SDR: LzJAlvzAvKoyATx2HuRf9l6heZU50+D235XZhGWk9ORNi1CrdDGWz0yDq2OosKZaf60JPREhty
 CoCLQ+Y4vVdg==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="481692831"
Received: from srnatla-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.76.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:37:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: Intel: atom: fix kernel-doc
Date: Wed,  1 Jul 2020 13:37:15 -0500
Message-Id: <20200701183716.83314-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200701183716.83314-1-pierre-louis.bossart@linux.intel.com>
References: <20200701183716.83314-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warnings. The kernel-doc format was probably never supported,
fix information as needed.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/atom/sst-atom-controls.c | 63 +++++++++++++++++-------
 sound/soc/intel/atom/sst/sst_loader.c    |  4 ++
 sound/soc/intel/atom/sst/sst_stream.c    | 43 +++++++++-------
 3 files changed, 73 insertions(+), 37 deletions(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index 69f3af4524ab..ca963383ac5e 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -61,8 +61,13 @@ static int sst_fill_and_send_cmd_unlocked(struct sst_data *drv,
 
 /**
  * sst_fill_and_send_cmd - generate the IPC message and send it to the FW
- * @ipc_msg:	type of IPC (CMD, SET_PARAMS, GET_PARAMS)
- * @cmd_data:	the IPC payload
+ * @drv: sst_data
+ * @ipc_msg: type of IPC (CMD, SET_PARAMS, GET_PARAMS)
+ * @block: block index
+ * @task_id: task index
+ * @pipe_id: pipe index
+ * @cmd_data: the IPC payload
+ * @len: length of data to be sent
  */
 static int sst_fill_and_send_cmd(struct sst_data *drv,
 				 u8 ipc_msg, u8 block, u8 task_id, u8 pipe_id,
@@ -78,7 +83,7 @@ static int sst_fill_and_send_cmd(struct sst_data *drv,
 	return ret;
 }
 
-/**
+/*
  * tx map value is a bitfield where each bit represents a FW channel
  *
  *			3 2 1 0		# 0 = codec0, 1 = codec1
@@ -90,7 +95,7 @@ static u8 sst_ssp_tx_map[SST_MAX_TDM_SLOTS] = {
 	0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80, /* default rx map */
 };
 
-/**
+/*
  * rx map value is a bitfield where each bit represents a slot
  *
  *			  76543210	# 0 = slot 0, 1 = slot 1
@@ -101,7 +106,7 @@ static u8 sst_ssp_rx_map[SST_MAX_TDM_SLOTS] = {
 	0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80, /* default tx map */
 };
 
-/**
+/*
  * NOTE: this is invoked with lock held
  */
 static int sst_send_slot_map(struct sst_data *drv)
@@ -145,7 +150,8 @@ static int sst_slot_enum_info(struct snd_kcontrol *kcontrol,
 
 /**
  * sst_slot_get - get the status of the interleaver/deinterleaver control
- *
+ * @kcontrol: control pointer
+ * @ucontrol: User data
  * Searches the map where the control status is stored, and gets the
  * channel/slot which is currently set for this enumerated control. Since it is
  * an enumerated control, there is only one possible value.
@@ -197,7 +203,8 @@ static int sst_check_and_send_slot_map(struct sst_data *drv, struct snd_kcontrol
 
 /**
  * sst_slot_put - set the status of interleaver/deinterleaver control
- *
+ * @kcontrol: control pointer
+ * @ucontrol: User data
  * (de)interleaver controls are defined in opposite sense to be user-friendly
  *
  * Instead of the enum value being the value written to the register, it is the
@@ -280,7 +287,9 @@ static int sst_send_algo_cmd(struct sst_data *drv,
 
 /**
  * sst_find_and_send_pipe_algo - send all the algo parameters for a pipe
- *
+ * @drv: sst_data
+ * @pipe: string identifier
+ * @ids: list of algorithms
  * The algos which are in each pipeline are sent to the firmware one by one
  *
  * Called with lock held
@@ -379,11 +388,15 @@ static int sst_gain_ctl_info(struct snd_kcontrol *kcontrol,
 
 /**
  * sst_send_gain_cmd - send the gain algorithm IPC to the FW
- * @gv:		the stored value of gain (also contains rampduration)
- * @mute:	flag that indicates whether this was called from the
- *		digital_mute callback or directly. If called from the
- *		digital_mute callback, module will be muted/unmuted based on this
- *		flag. The flag is always 0 if called directly.
+ * @drv: sst_data
+ * @gv:the stored value of gain (also contains rampduration)
+ * @task_id: task index
+ * @loc_id: location/position index
+ * @module_id: module index
+ * @mute: flag that indicates whether this was called from the
+ *  digital_mute callback or directly. If called from the
+ *  digital_mute callback, module will be muted/unmuted based on this
+ *  flag. The flag is always 0 if called directly.
  *
  * Called with sst_data.lock held
  *
@@ -544,9 +557,12 @@ static const uint swm_mixer_input_ids[SST_SWM_INPUT_COUNT] = {
 
 /**
  * fill_swm_input - fill in the SWM input ids given the register
+ * @cmpnt: ASoC component
+ * @swm_input: array of swm_input_ids
+ * @reg: the register value is a bit-field inicated which mixer inputs are ON.
  *
- * The register value is a bit-field inicated which mixer inputs are ON. Use the
- * lookup table to get the input-id and fill it in the structure.
+ * Use the lookup table to get the input-id and fill it in the
+ * structure.
  */
 static int fill_swm_input(struct snd_soc_component *cmpnt,
 		struct swm_input_ids *swm_input, unsigned int reg)
@@ -577,7 +593,7 @@ static int fill_swm_input(struct snd_soc_component *cmpnt,
 }
 
 
-/**
+/*
  * called with lock held
  */
 static int sst_set_pipe_gain(struct sst_ids *ids,
@@ -881,7 +897,7 @@ int sst_fill_ssp_config(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-/**
+/*
  * sst_ssp_config - contains SSP configuration for media UC
  * this can be overwritten by set_dai_xxx APIs
  */
@@ -1300,6 +1316,9 @@ static bool is_sst_dapm_widget(struct snd_soc_dapm_widget *w)
 
 /**
  * sst_send_pipe_gains - send gains for the front-end DAIs
+ * @dai: front-end dai
+ * @stream: direction
+ * @mute: boolean indicating mute status
  *
  * The gains in the pipes connected to the front-ends are muted/unmuted
  * automatically via the digital_mute() DAPM callback. This function sends the
@@ -1357,7 +1376,9 @@ int sst_send_pipe_gains(struct snd_soc_dai *dai, int stream, int mute)
 
 /**
  * sst_fill_module_list - populate the list of modules/gains for a pipe
- *
+ * @kctl: kcontrol pointer
+ * @w: dapm widget
+ * @type: widget type
  *
  * Fills the widget pointer in the kcontrol private data, and also fills the
  * kcontrol pointer in the widget private data.
@@ -1403,7 +1424,8 @@ static int sst_fill_module_list(struct snd_kcontrol *kctl,
 
 /**
  * sst_fill_widget_module_info - fill list of gains/algos for the pipe
- * @widget:	pipe modelled as a DAPM widget
+ * @w: pipe modeled as a DAPM widget
+ * @component: ASoC component
  *
  * Fill the list of gains/algos for the widget by looking at all the card
  * controls and comparing the name of the widget with the first part of control
@@ -1463,6 +1485,8 @@ static int sst_fill_widget_module_info(struct snd_soc_dapm_widget *w,
 
 /**
  * sst_fill_linked_widgets - fill the parent pointer for the linked widget
+ * @component: ASoC component
+ * @ids: sst_ids array
  */
 static void sst_fill_linked_widgets(struct snd_soc_component *component,
 						struct sst_ids *ids)
@@ -1480,6 +1504,7 @@ static void sst_fill_linked_widgets(struct snd_soc_component *component,
 
 /**
  * sst_map_modules_to_pipe - fill algo/gains list for all pipes
+ * @component: ASoC component
  */
 static int sst_map_modules_to_pipe(struct snd_soc_component *component)
 {
diff --git a/sound/soc/intel/atom/sst/sst_loader.c b/sound/soc/intel/atom/sst/sst_loader.c
index 9b0e3739c738..8ad0ca70ec62 100644
--- a/sound/soc/intel/atom/sst/sst_loader.c
+++ b/sound/soc/intel/atom/sst/sst_loader.c
@@ -49,6 +49,7 @@ void memcpy32_fromio(void *dst, const void __iomem *src, int count)
 
 /**
  * intel_sst_reset_dsp_mrfld - Resetting SST DSP
+ * @sst_drv_ctx: intel_sst_drv context pointer
  *
  * This resets DSP in case of MRFLD platfroms
  */
@@ -77,6 +78,7 @@ int intel_sst_reset_dsp_mrfld(struct intel_sst_drv *sst_drv_ctx)
 
 /**
  * sst_start_merrifield - Start the SST DSP processor
+ * @sst_drv_ctx: intel_sst_drv context pointer
  *
  * This starts the DSP in MERRIFIELD platfroms
  */
@@ -387,6 +389,8 @@ void sst_post_download_mrfld(struct intel_sst_drv *ctx)
 
 /**
  * sst_load_fw - function to load FW into DSP
+ * @sst_drv_ctx: intel_sst_drv context pointer
+ *
  * Transfers the FW to DSP using dma/memcpy
  */
 int sst_load_fw(struct intel_sst_drv *sst_drv_ctx)
diff --git a/sound/soc/intel/atom/sst/sst_stream.c b/sound/soc/intel/atom/sst/sst_stream.c
index ea09f4170201..c0221e103e79 100644
--- a/sound/soc/intel/atom/sst/sst_stream.c
+++ b/sound/soc/intel/atom/sst/sst_stream.c
@@ -92,8 +92,8 @@ int sst_alloc_stream_mrfld(struct intel_sst_drv *sst_drv_ctx, void *params)
 
 /**
  * sst_realloc_stream - Send msg for (re-)allocating a stream using the
- * @sst_drv_ctx  intel_sst_drv context pointer
- * @str_id:	 stream ID
+ * @sst_drv_ctx: intel_sst_drv context pointer
+ * @str_id: stream ID
  *
  * Send a msg for (re-)allocating a stream using the parameters previously
  * passed to sst_alloc_stream_mrfld() for the same stream ID.
@@ -142,12 +142,13 @@ int sst_realloc_stream(struct intel_sst_drv *sst_drv_ctx, int str_id)
 }
 
 /**
-* sst_start_stream - Send msg for a starting stream
-* @str_id:	 stream ID
-*
-* This function is called by any function which wants to start
-* a stream.
-*/
+ * sst_start_stream - Send msg for a starting stream
+ * @sst_drv_ctx: intel_sst_drv context pointer
+ * @str_id: stream ID
+ *
+ * This function is called by any function which wants to start
+ * a stream.
+ */
 int sst_start_stream(struct intel_sst_drv *sst_drv_ctx, int str_id)
 {
 	int retval = 0;
@@ -234,7 +235,8 @@ int sst_send_byte_stream_mrfld(struct intel_sst_drv *sst_drv_ctx,
 
 /**
  * sst_pause_stream - Send msg for a pausing stream
- * @str_id:	 stream ID
+ * @sst_drv_ctx: intel_sst_drv context pointer
+ * @str_id: stream ID
  *
  * This function is called by any function which wants to pause
  * an already running stream.
@@ -278,7 +280,8 @@ int sst_pause_stream(struct intel_sst_drv *sst_drv_ctx, int str_id)
 
 /**
  * sst_resume_stream - Send msg for resuming stream
- * @str_id:		stream ID
+ * @sst_drv_ctx: intel_sst_drv context pointer
+ * @str_id: stream ID
  *
  * This function is called by any function which wants to resume
  * an already paused stream.
@@ -345,7 +348,8 @@ int sst_resume_stream(struct intel_sst_drv *sst_drv_ctx, int str_id)
 
 /**
  * sst_drop_stream - Send msg for stopping stream
- * @str_id:		stream ID
+ * @sst_drv_ctx: intel_sst_drv context pointer
+ * @str_id: stream ID
  *
  * This function is called by any function which wants to stop
  * a stream.
@@ -377,12 +381,14 @@ int sst_drop_stream(struct intel_sst_drv *sst_drv_ctx, int str_id)
 }
 
 /**
-* sst_drain_stream - Send msg for draining stream
-* @str_id:		stream ID
-*
-* This function is called by any function which wants to drain
-* a stream.
-*/
+ * sst_drain_stream - Send msg for draining stream
+ * @sst_drv_ctx: intel_sst_drv context pointer
+ * @str_id: stream ID
+ * @partial_drain: boolean indicating if a gapless transition is taking place
+ *
+ * This function is called by any function which wants to drain
+ * a stream.
+ */
 int sst_drain_stream(struct intel_sst_drv *sst_drv_ctx,
 			int str_id, bool partial_drain)
 {
@@ -415,7 +421,8 @@ int sst_drain_stream(struct intel_sst_drv *sst_drv_ctx,
 
 /**
  * sst_free_stream - Frees a stream
- * @str_id:		stream ID
+ * @sst_drv_ctx: intel_sst_drv context pointer
+ * @str_id: stream ID
  *
  * This function is called by any function which wants to free
  * a stream.
-- 
2.25.1

