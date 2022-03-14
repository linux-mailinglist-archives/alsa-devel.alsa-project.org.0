Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD58F4D8DE3
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 21:09:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34FAA181C;
	Mon, 14 Mar 2022 21:08:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34FAA181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647288580;
	bh=P+BzivRfqWu4OiXUzHCbevL7Fg+IUHhO4d6QAvee0Zo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ulla4IMVZ31KCGN/qvGurmhHM/mYh/Kf116p0+YvLk8KT2HSH64vFTzQ3uw2BHqAR
	 V5LciQfiQIIGbsAl/3gHUDqBPAb7eWvHRFnkPn03Y0oY29Rpxy5D5ZiOuzLTJb1Y37
	 LVKeXvhb/f25izW/gtDQSglFG7Eco3YJWQVRXnXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54FDDF80557;
	Mon, 14 Mar 2022 21:06:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6AFCF8053B; Mon, 14 Mar 2022 21:05:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CB6EF8011C
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 21:05:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CB6EF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PDiKwUey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647288345; x=1678824345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P+BzivRfqWu4OiXUzHCbevL7Fg+IUHhO4d6QAvee0Zo=;
 b=PDiKwUey0RYzRMJohWUCxUpvrqzT4PUYYjiOzKwJn+SfgzWLvY9waob2
 slE1gseoRnnNE4JcXmMT1d4r5UKR7JjRYlF4alyqM9XMu9D6gv3FGDK83
 +wALvuKdZY43c1c3PcGKpvFkCESKg9eMcjq1EnbqN5/WYe9RS441Q47xB
 AhenyMcqVUROWB47xgrArQ3jXAGRFE8EW8sIhfgK3NRj4sBmRci7/EBP+
 I+Il6kVwkTWyCaLUMDzQ0qQ09ShLGoGwHu07UovaYbr6q8KbTq9lc3ZN+
 0VQo1SdRFaua6hkJVNObe8rXOHzZSIs9JCj0vimPfZE3pshZtwl8ft8FD A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342563473"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="342563473"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="634339893"
Received: from pmishr1-mobl1.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.25.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:32 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/18] ASoC: SOF: topology: Make buffer widget parsing IPC
 agnostic
Date: Mon, 14 Mar 2022 13:05:08 -0700
Message-Id: <20220314200520.1233427-8-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314200520.1233427-1-ranjani.sridharan@linux.intel.com>
References: <20220314200520.1233427-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =tiwai@suse.com,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Define the list of tokens pertaining to the buffer widgets, parse and
save them as part of the swidget tuples array. Once topology parsing is
complete, these tokens will be applied to create the IPC structure for the
buffer component based on the topology widget_setup op in ipc3_tplg_ops.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 50 +++++++++++++++++++++++++++++++++
 sound/soc/sof/topology.c      | 52 -----------------------------------
 2 files changed, 50 insertions(+), 52 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 15299ffb7b15..e05d6b816fac 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -13,6 +13,14 @@
 #include "sof-audio.h"
 #include "ops.h"
 
+/* Buffers */
+static const struct sof_topology_token buffer_tokens[] = {
+	{SOF_TKN_BUF_SIZE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_buffer, size)},
+	{SOF_TKN_BUF_CAPS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_buffer, caps)},
+};
+
 /* scheduling */
 static const struct sof_topology_token sched_tokens[] = {
 	{SOF_TKN_SCHED_PERIOD, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
@@ -71,6 +79,7 @@ static const struct sof_token_info ipc3_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_COMP_TOKENS] = {"Comp tokens", comp_tokens, ARRAY_SIZE(comp_tokens)},
 	[SOF_CORE_TOKENS] = {"Core tokens", core_tokens, ARRAY_SIZE(core_tokens)},
 	[SOF_COMP_EXT_TOKENS] = {"AFE tokens", comp_ext_tokens, ARRAY_SIZE(comp_ext_tokens)},
+	[SOF_BUFFER_TOKENS] = {"Buffer tokens", buffer_tokens, ARRAY_SIZE(buffer_tokens)},
 };
 
 /**
@@ -237,6 +246,41 @@ static int sof_ipc3_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 	return ret;
 }
 
+static int sof_ipc3_widget_setup_comp_buffer(struct snd_sof_widget *swidget)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct sof_ipc_buffer *buffer;
+	int ret;
+
+	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	swidget->private = buffer;
+
+	/* configure dai IPC message */
+	buffer->comp.hdr.size = sizeof(*buffer);
+	buffer->comp.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_BUFFER_NEW;
+	buffer->comp.id = swidget->comp_id;
+	buffer->comp.type = SOF_COMP_BUFFER;
+	buffer->comp.pipeline_id = swidget->pipeline_id;
+	buffer->comp.core = swidget->core;
+
+	/* parse one set of buffer tokens */
+	ret = sof_update_ipc_object(scomp, buffer, SOF_BUFFER_TOKENS, swidget->tuples,
+				    swidget->num_tuples, sizeof(*buffer), 1);
+	if (ret < 0) {
+		kfree(swidget->private);
+		swidget->private = NULL;
+		return ret;
+	}
+
+	dev_dbg(scomp->dev, "buffer %s: size %d caps 0x%x\n",
+		swidget->widget->name, buffer->size, buffer->caps);
+
+	return 0;
+}
+
 /* token list for each topology object */
 static enum sof_tokens host_token_list[] = {
 	SOF_CORE_TOKENS,
@@ -245,6 +289,10 @@ static enum sof_tokens host_token_list[] = {
 	SOF_COMP_TOKENS,
 };
 
+static enum sof_tokens buffer_token_list[] = {
+	SOF_BUFFER_TOKENS,
+};
+
 static enum sof_tokens pipeline_token_list[] = {
 	SOF_CORE_TOKENS,
 	SOF_COMP_EXT_TOKENS,
@@ -257,6 +305,8 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc3_widget_ops[SND_SOC_DAPM_TY
 				  host_token_list, ARRAY_SIZE(host_token_list), NULL},
 	[snd_soc_dapm_aif_out] = {sof_ipc3_widget_setup_comp_host, sof_ipc3_widget_free_comp,
 				  host_token_list, ARRAY_SIZE(host_token_list), NULL},
+	[snd_soc_dapm_buffer] = {sof_ipc3_widget_setup_comp_buffer, sof_ipc3_widget_free_comp,
+				 buffer_token_list, ARRAY_SIZE(buffer_token_list), NULL},
 	[snd_soc_dapm_scheduler] = {sof_ipc3_widget_setup_comp_pipeline, sof_ipc3_widget_free_comp,
 				    pipeline_token_list, ARRAY_SIZE(pipeline_token_list), NULL},
 };
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 4dd4e98e87cf..88214ec2df5a 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -611,14 +611,6 @@ static int get_token_process_type(void *elem, void *object, u32 offset)
 	return 0;
 }
 
-/* Buffers */
-static const struct sof_topology_token buffer_tokens[] = {
-	{SOF_TKN_BUF_SIZE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_buffer, size)},
-	{SOF_TKN_BUF_CAPS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_buffer, caps)},
-};
-
 /* DAI */
 static const struct sof_topology_token dai_tokens[] = {
 	{SOF_TKN_DAI_TYPE, SND_SOC_TPLG_TUPLE_TYPE_STRING, get_token_dai_type,
@@ -1721,48 +1713,6 @@ static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
-/*
- * Buffer topology
- */
-
-static int sof_widget_load_buffer(struct snd_soc_component *scomp, int index,
-				  struct snd_sof_widget *swidget,
-				  struct snd_soc_tplg_dapm_widget *tw)
-{
-	struct snd_soc_tplg_private *private = &tw->priv;
-	struct sof_ipc_buffer *buffer;
-	int ret;
-
-	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
-	if (!buffer)
-		return -ENOMEM;
-
-	/* configure dai IPC message */
-	buffer->comp.hdr.size = sizeof(*buffer);
-	buffer->comp.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_BUFFER_NEW;
-	buffer->comp.id = swidget->comp_id;
-	buffer->comp.type = SOF_COMP_BUFFER;
-	buffer->comp.pipeline_id = index;
-	buffer->comp.core = swidget->core;
-
-	ret = sof_parse_tokens(scomp, buffer, buffer_tokens,
-			       ARRAY_SIZE(buffer_tokens), private->array,
-			       le32_to_cpu(private->size));
-	if (ret != 0) {
-		dev_err(scomp->dev, "error: parse buffer tokens failed %d\n",
-			private->size);
-		kfree(buffer);
-		return ret;
-	}
-
-	dev_dbg(scomp->dev, "buffer %s: size %d caps 0x%x\n",
-		swidget->widget->name, buffer->size, buffer->caps);
-
-	swidget->private = buffer;
-
-	return 0;
-}
-
 /* bind PCM ID to host component ID */
 static int spcm_bind(struct snd_soc_component *scomp, struct snd_sof_pcm *spcm,
 		     int dir)
@@ -2479,8 +2429,6 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		ret = sof_widget_load_pga(scomp, index, swidget, tw);
 		break;
 	case snd_soc_dapm_buffer:
-		ret = sof_widget_load_buffer(scomp, index, swidget, tw);
-		break;
 	case snd_soc_dapm_scheduler:
 	case snd_soc_dapm_aif_out:
 	case snd_soc_dapm_aif_in:
-- 
2.25.1

