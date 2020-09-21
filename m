Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECEB272171
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:49:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CADC41709;
	Mon, 21 Sep 2020 12:48:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CADC41709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600685352;
	bh=bGb5hHyIDFZYZ5C0vb740FfH5EvLnzghjFmqr1AvnKY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KFkhCmq7pR+Fb+HJ/7JVMoEb38Utt7aiTbzrUYL/ZERm+8Tzj0EIE3BzCwaFeFHqU
	 UDfF9v5AbLMqnS8B2gDOjQ7XDmj9yjmmmA7M3rjHeTiAShZb+M4wI7ECUDhnn68yHb
	 eJ0u5CvQKvKWKCDHnf1XRdrvTIcvtQ3bfpAV5dQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E42D7F800B2;
	Mon, 21 Sep 2020 12:47:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B11DF80162; Mon, 21 Sep 2020 12:47:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77BF3F8015F
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77BF3F8015F
IronPort-SDR: MWhM33R3c3hJgFUIwVbYlvA9jjK84Vjrf/ttUkmxS3RJ4bRWnWi62Tt5emq6I70A7/WauPa3K3
 yAuEFlHUESIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="159647507"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="159647507"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 03:47:17 -0700
IronPort-SDR: JS5d5X6DezwtlAFkqMWZ80InMIsM6cNtpbpwcoa/h6kNoMUeF4fNFifx1mUSj2FntUZOYXpfkk
 3w4KvKBoyxAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="341504171"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002.fm.intel.com with ESMTP; 21 Sep 2020 03:47:14 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: topology: fix the process being scheduled on core0
 always
Date: Mon, 21 Sep 2020 13:45:44 +0300
Message-Id: <20200921104544.2897112-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Jaska Uimonen <jaska.uimonen@intel.com>, kai.vehmanen@linux.intel.com,
 Keyon Jie <yang.jie@linux.intel.com>, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

From: Keyon Jie <yang.jie@linux.intel.com>

In commit 783898ce68de ("ASoC: SOF: append extended data to
sof_ipc_comp_process") the process components are set to run on the
fixed core 0, this break us from scheduling components on any other DSP
core.

Since we can get the DSP core index from swidget->core, it is duplicated
to pass the extra 'core' argument for those sof_widget_load_xx()
functions.

Here removes the duplicate 'core' argument and get component core from
swidget->core directly to fix the issue mentioned above.

Fixes: 783898ce68de ("ASoC: SOF: append extended data to sof_ipc_comp_process")
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Jaska Uimonen <jaska.uimonen@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/topology.c | 82 +++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 47 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index eaa1122d5a68..69313fbdb636 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1465,13 +1465,11 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
  * @ipc_size: IPC payload size that will be updated depending on valid
  *  extended data.
  * @index: ID of the pipeline the component belongs to
- * @core: index of the DSP core that the component should run on
  *
  * Return: The pointer to the new allocated component, NULL if failed.
  */
 static struct sof_ipc_comp *sof_comp_alloc(struct snd_sof_widget *swidget,
-					   size_t *ipc_size, int index,
-					   int core)
+					   size_t *ipc_size, int index)
 {
 	u8 nil_uuid[SOF_UUID_SIZE] = {0};
 	struct sof_ipc_comp *comp;
@@ -1490,7 +1488,7 @@ static struct sof_ipc_comp *sof_comp_alloc(struct snd_sof_widget *swidget,
 	comp->hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_COMP_NEW;
 	comp->id = swidget->comp_id;
 	comp->pipeline_id = index;
-	comp->core = core;
+	comp->core = swidget->core;
 
 	/* handle the extended data if needed */
 	if (total_size > *ipc_size) {
@@ -1505,7 +1503,7 @@ static struct sof_ipc_comp *sof_comp_alloc(struct snd_sof_widget *swidget,
 }
 
 static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
-			       struct snd_sof_widget *swidget, int core,
+			       struct snd_sof_widget *swidget,
 			       struct snd_soc_tplg_dapm_widget *tw,
 			       struct sof_ipc_comp_reply *r,
 			       struct snd_sof_dai *dai)
@@ -1517,7 +1515,7 @@ static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 	int ret;
 
 	comp_dai = (struct sof_ipc_comp_dai *)
-		   sof_comp_alloc(swidget, &ipc_size, index, core);
+		   sof_comp_alloc(swidget, &ipc_size, index);
 	if (!comp_dai)
 		return -ENOMEM;
 
@@ -1571,7 +1569,7 @@ static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
  */
 
 static int sof_widget_load_buffer(struct snd_soc_component *scomp, int index,
-				  struct snd_sof_widget *swidget, int core,
+				  struct snd_sof_widget *swidget,
 				  struct snd_soc_tplg_dapm_widget *tw,
 				  struct sof_ipc_comp_reply *r)
 {
@@ -1590,7 +1588,7 @@ static int sof_widget_load_buffer(struct snd_soc_component *scomp, int index,
 	buffer->comp.id = swidget->comp_id;
 	buffer->comp.type = SOF_COMP_BUFFER;
 	buffer->comp.pipeline_id = index;
-	buffer->comp.core = core;
+	buffer->comp.core = swidget->core;
 
 	ret = sof_parse_tokens(scomp, buffer, buffer_tokens,
 			       ARRAY_SIZE(buffer_tokens), private->array,
@@ -1642,7 +1640,7 @@ static int spcm_bind(struct snd_soc_component *scomp, struct snd_sof_pcm *spcm,
  */
 
 static int sof_widget_load_pcm(struct snd_soc_component *scomp, int index,
-			       struct snd_sof_widget *swidget, int core,
+			       struct snd_sof_widget *swidget,
 			       enum sof_ipc_stream_direction dir,
 			       struct snd_soc_tplg_dapm_widget *tw,
 			       struct sof_ipc_comp_reply *r)
@@ -1654,7 +1652,7 @@ static int sof_widget_load_pcm(struct snd_soc_component *scomp, int index,
 	int ret;
 
 	host = (struct sof_ipc_comp_host *)
-	       sof_comp_alloc(swidget, &ipc_size, index, core);
+	       sof_comp_alloc(swidget, &ipc_size, index);
 	if (!host)
 		return -ENOMEM;
 
@@ -1779,7 +1777,7 @@ static int sof_widget_load_pipeline(struct snd_soc_component *scomp, int index,
  */
 
 static int sof_widget_load_mixer(struct snd_soc_component *scomp, int index,
-				 struct snd_sof_widget *swidget, int core,
+				 struct snd_sof_widget *swidget,
 				 struct snd_soc_tplg_dapm_widget *tw,
 				 struct sof_ipc_comp_reply *r)
 {
@@ -1790,7 +1788,7 @@ static int sof_widget_load_mixer(struct snd_soc_component *scomp, int index,
 	int ret;
 
 	mixer = (struct sof_ipc_comp_mixer *)
-		sof_comp_alloc(swidget, &ipc_size, index, core);
+		sof_comp_alloc(swidget, &ipc_size, index);
 	if (!mixer)
 		return -ENOMEM;
 
@@ -1824,7 +1822,7 @@ static int sof_widget_load_mixer(struct snd_soc_component *scomp, int index,
  * Mux topology
  */
 static int sof_widget_load_mux(struct snd_soc_component *scomp, int index,
-			       struct snd_sof_widget *swidget, int core,
+			       struct snd_sof_widget *swidget,
 			       struct snd_soc_tplg_dapm_widget *tw,
 			       struct sof_ipc_comp_reply *r)
 {
@@ -1835,7 +1833,7 @@ static int sof_widget_load_mux(struct snd_soc_component *scomp, int index,
 	int ret;
 
 	mux = (struct sof_ipc_comp_mux *)
-	      sof_comp_alloc(swidget, &ipc_size, index, core);
+	      sof_comp_alloc(swidget, &ipc_size, index);
 	if (!mux)
 		return -ENOMEM;
 
@@ -1870,7 +1868,7 @@ static int sof_widget_load_mux(struct snd_soc_component *scomp, int index,
  */
 
 static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
-			       struct snd_sof_widget *swidget, int core,
+			       struct snd_sof_widget *swidget,
 			       struct snd_soc_tplg_dapm_widget *tw,
 			       struct sof_ipc_comp_reply *r)
 {
@@ -1884,7 +1882,7 @@ static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
 	int ret;
 
 	volume = (struct sof_ipc_comp_volume *)
-		 sof_comp_alloc(swidget, &ipc_size, index, core);
+		 sof_comp_alloc(swidget, &ipc_size, index);
 	if (!volume)
 		return -ENOMEM;
 
@@ -1946,7 +1944,7 @@ static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
  */
 
 static int sof_widget_load_src(struct snd_soc_component *scomp, int index,
-			       struct snd_sof_widget *swidget, int core,
+			       struct snd_sof_widget *swidget,
 			       struct snd_soc_tplg_dapm_widget *tw,
 			       struct sof_ipc_comp_reply *r)
 {
@@ -1957,7 +1955,7 @@ static int sof_widget_load_src(struct snd_soc_component *scomp, int index,
 	int ret;
 
 	src = (struct sof_ipc_comp_src *)
-	      sof_comp_alloc(swidget, &ipc_size, index, core);
+	      sof_comp_alloc(swidget, &ipc_size, index);
 	if (!src)
 		return -ENOMEM;
 
@@ -2003,7 +2001,7 @@ static int sof_widget_load_src(struct snd_soc_component *scomp, int index,
  */
 
 static int sof_widget_load_asrc(struct snd_soc_component *scomp, int index,
-				struct snd_sof_widget *swidget, int core,
+				struct snd_sof_widget *swidget,
 				struct snd_soc_tplg_dapm_widget *tw,
 				struct sof_ipc_comp_reply *r)
 {
@@ -2014,7 +2012,7 @@ static int sof_widget_load_asrc(struct snd_soc_component *scomp, int index,
 	int ret;
 
 	asrc = (struct sof_ipc_comp_asrc *)
-	       sof_comp_alloc(swidget, &ipc_size, index, core);
+	       sof_comp_alloc(swidget, &ipc_size, index);
 	if (!asrc)
 		return -ENOMEM;
 
@@ -2062,7 +2060,7 @@ static int sof_widget_load_asrc(struct snd_soc_component *scomp, int index,
  */
 
 static int sof_widget_load_siggen(struct snd_soc_component *scomp, int index,
-				  struct snd_sof_widget *swidget, int core,
+				  struct snd_sof_widget *swidget,
 				  struct snd_soc_tplg_dapm_widget *tw,
 				  struct sof_ipc_comp_reply *r)
 {
@@ -2073,7 +2071,7 @@ static int sof_widget_load_siggen(struct snd_soc_component *scomp, int index,
 	int ret;
 
 	tone = (struct sof_ipc_comp_tone *)
-	       sof_comp_alloc(swidget, &ipc_size, index, core);
+	       sof_comp_alloc(swidget, &ipc_size, index);
 	if (!tone)
 		return -ENOMEM;
 
@@ -2229,7 +2227,7 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 	}
 
 	process = (struct sof_ipc_comp_process *)
-		  sof_comp_alloc(swidget, &ipc_size, index, 0);
+		  sof_comp_alloc(swidget, &ipc_size, index);
 	if (!process) {
 		ret = -ENOMEM;
 		goto out;
@@ -2307,7 +2305,7 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
  */
 
 static int sof_widget_load_process(struct snd_soc_component *scomp, int index,
-				   struct snd_sof_widget *swidget, int core,
+				   struct snd_sof_widget *swidget,
 				   struct snd_soc_tplg_dapm_widget *tw,
 				   struct sof_ipc_comp_reply *r)
 {
@@ -2322,7 +2320,7 @@ static int sof_widget_load_process(struct snd_soc_component *scomp, int index,
 	}
 
 	memset(&config, 0, sizeof(config));
-	config.comp.core = core;
+	config.comp.core = swidget->core;
 
 	/* get the process token */
 	ret = sof_parse_tokens(scomp, &config, process_tokens,
@@ -2450,8 +2448,7 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 			return -ENOMEM;
 		}
 
-		ret = sof_widget_load_dai(scomp, index, swidget, comp.core,
-					  tw, &reply, dai);
+		ret = sof_widget_load_dai(scomp, index, swidget, tw, &reply, dai);
 		if (ret == 0) {
 			sof_connect_dai_widget(scomp, w, tw, dai);
 			list_add(&dai->list, &sdev->dai_list);
@@ -2461,12 +2458,10 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		}
 		break;
 	case snd_soc_dapm_mixer:
-		ret = sof_widget_load_mixer(scomp, index, swidget, comp.core,
-					    tw, &reply);
+		ret = sof_widget_load_mixer(scomp, index, swidget, tw, &reply);
 		break;
 	case snd_soc_dapm_pga:
-		ret = sof_widget_load_pga(scomp, index, swidget, comp.core,
-					  tw, &reply);
+		ret = sof_widget_load_pga(scomp, index, swidget, tw, &reply);
 		/* Find scontrol for this pga and set readback offset*/
 		list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
 			if (scontrol->comp_id == swidget->comp_id) {
@@ -2476,41 +2471,34 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		}
 		break;
 	case snd_soc_dapm_buffer:
-		ret = sof_widget_load_buffer(scomp, index, swidget, comp.core,
-					     tw, &reply);
+		ret = sof_widget_load_buffer(scomp, index, swidget, tw, &reply);
 		break;
 	case snd_soc_dapm_scheduler:
-		ret = sof_widget_load_pipeline(scomp, index, swidget,
-					       tw, &reply);
+		ret = sof_widget_load_pipeline(scomp, index, swidget, tw, &reply);
 		break;
 	case snd_soc_dapm_aif_out:
-		ret = sof_widget_load_pcm(scomp, index, swidget, comp.core,
+		ret = sof_widget_load_pcm(scomp, index, swidget,
 					  SOF_IPC_STREAM_CAPTURE, tw, &reply);
 		break;
 	case snd_soc_dapm_aif_in:
-		ret = sof_widget_load_pcm(scomp, index, swidget, comp.core,
+		ret = sof_widget_load_pcm(scomp, index, swidget,
 					  SOF_IPC_STREAM_PLAYBACK, tw, &reply);
 		break;
 	case snd_soc_dapm_src:
-		ret = sof_widget_load_src(scomp, index, swidget, comp.core,
-					  tw, &reply);
+		ret = sof_widget_load_src(scomp, index, swidget, tw, &reply);
 		break;
 	case snd_soc_dapm_asrc:
-		ret = sof_widget_load_asrc(scomp, index, swidget, comp.core,
-					   tw, &reply);
+		ret = sof_widget_load_asrc(scomp, index, swidget, tw, &reply);
 		break;
 	case snd_soc_dapm_siggen:
-		ret = sof_widget_load_siggen(scomp, index, swidget, comp.core,
-					     tw, &reply);
+		ret = sof_widget_load_siggen(scomp, index, swidget, tw, &reply);
 		break;
 	case snd_soc_dapm_effect:
-		ret = sof_widget_load_process(scomp, index, swidget, comp.core,
-					      tw, &reply);
+		ret = sof_widget_load_process(scomp, index, swidget, tw, &reply);
 		break;
 	case snd_soc_dapm_mux:
 	case snd_soc_dapm_demux:
-		ret = sof_widget_load_mux(scomp, index, swidget, comp.core,
-					  tw, &reply);
+		ret = sof_widget_load_mux(scomp, index, swidget, tw, &reply);
 		break;
 	case snd_soc_dapm_switch:
 	case snd_soc_dapm_dai_link:
-- 
2.27.0

