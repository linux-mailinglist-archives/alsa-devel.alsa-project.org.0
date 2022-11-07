Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1139761EDF7
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 09:58:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E10EAEA;
	Mon,  7 Nov 2022 09:57:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E10EAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667811516;
	bh=8AdWr6gsw1IbehCj2aqwWLhJNGiYdPitsUyC103G0QU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sqXobNAtOuaKYfisq6PwjFIUIyiBdRQnV6/9TmlUi2NkGUawcs3msV0BO6nElKgRF
	 jlMrxS25oOdhZNqQcLTbCZdoPTm5V0YxbvTfTZK79jFE1ITdu0LrgZgZJNZx/nOiJM
	 VNlVjuzPufJQUjaSDYxMAMRbg2qRhBeBpNFWAUO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 561E5F80559;
	Mon,  7 Nov 2022 09:56:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 562CAF80557; Mon,  7 Nov 2022 09:56:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C86DF8024C
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 09:56:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C86DF8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NvxQyLeV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667811412; x=1699347412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8AdWr6gsw1IbehCj2aqwWLhJNGiYdPitsUyC103G0QU=;
 b=NvxQyLeVAaBww2Oi+DJ89tHyipAew2QPaMrQHtZioHTjtzEwOijgDG0W
 Fdy6DyWd/A1p32up0VviRbiQb7hCvilpzeX5IhRL6LKNZV6pCYlfdK8V9
 W+j3F3fuqXV9wFChUMyUuPUL4daNcPtIvSC4rd2fB1z5NCnYsY4A76H80
 2jpc3woZD2JgH9cIqiQjhIvPIYiddUzgA5Vj+hsbbof3Cb4c/OAhwXkcU
 C1zPO9Lz22CmADYmebOnEzl738d5mOFYaiDvmklmveOpazJEwU35/28qn
 5fa+OMl4BaS5h2UsN4UJ19j39NmgTCPp1q7BN8hRzsdIrD+pN+TzeNTH8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372481190"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372481190"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:56:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="635831466"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="635831466"
Received: from akharade-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.14.37])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:56:46 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	chao.song@linux.intel.com
Subject: [PATCH 3/3] ASoC: SOF: topology: Add helper to get/put widget queue id
Date: Mon,  7 Nov 2022 10:57:06 +0200
Message-Id: <20221107085706.2550-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107085706.2550-1-peter.ujfalusi@linux.intel.com>
References: <20221107085706.2550-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
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

From: Chao Song <chao.song@linux.intel.com>

Add get/put queue id helper to manage queue id in route
setup and route free.

The queue allocation rules are:

  - If widget only has one sink/source pin, zero will be
returned as the queue ID directly.

  - If widget has more than one sink/source pins, and pin
binding array is defined in topology, queue ID will be
allocated according to the pin binding array.

  - If widget has more than one sink/sink pins, and pin
binding array is not defined, Linux ID allocation will be
used to allocate queue ID dynamically.

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Suggested-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 133 ++++++++++++++++++++++++++++++----
 sound/soc/sof/sof-audio.h     |   6 ++
 sound/soc/sof/topology.c      |   5 ++
 3 files changed, 131 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index ab85dde4303b..92b5f934d20f 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1577,6 +1577,88 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 	return ret;
 }
 
+static int sof_ipc4_get_queue_id(struct snd_sof_widget *src_widget,
+				 struct snd_sof_widget *sink_widget, bool pin_type)
+{
+	struct snd_sof_widget *current_swidget;
+	struct snd_soc_component *scomp;
+	struct ida *queue_ida;
+	const char *buddy_name;
+	char **pin_binding;
+	u32 num_pins;
+	int i;
+
+	if (pin_type == SOF_PIN_TYPE_SOURCE) {
+		current_swidget = src_widget;
+		pin_binding = src_widget->src_pin_binding;
+		queue_ida = &src_widget->src_queue_ida;
+		num_pins = src_widget->num_source_pins;
+		buddy_name = sink_widget->widget->name;
+	} else {
+		current_swidget = sink_widget;
+		pin_binding = sink_widget->sink_pin_binding;
+		queue_ida = &sink_widget->sink_queue_ida;
+		num_pins = sink_widget->num_sink_pins;
+		buddy_name = src_widget->widget->name;
+	}
+
+	scomp = current_swidget->scomp;
+
+	if (num_pins < 1) {
+		dev_err(scomp->dev, "invalid %s num_pins: %d for queue allocation for %s\n",
+			(pin_type == SOF_PIN_TYPE_SOURCE ? "source" : "sink"),
+			num_pins, current_swidget->widget->name);
+		return -EINVAL;
+	}
+
+	/* If there is only one sink/source pin, queue id must be 0 */
+	if (num_pins == 1)
+		return 0;
+
+	/* Allocate queue ID from pin binding array if it is defined in topology. */
+	if (pin_binding) {
+		for (i = 0; i < num_pins; i++) {
+			if (!strcmp(pin_binding[i], buddy_name))
+				return i;
+		}
+		/*
+		 * Fail if no queue ID found from pin binding array, so that we don't
+		 * mixed use pin binding array and ida for queue ID allocation.
+		 */
+		dev_err(scomp->dev, "no %s queue id found from pin binding array for %s\n",
+			(pin_type == SOF_PIN_TYPE_SOURCE ? "source" : "sink"),
+			current_swidget->widget->name);
+		return -EINVAL;
+	}
+
+	/* If no pin binding array specified in topology, use ida to allocate one */
+	return ida_alloc_max(queue_ida, num_pins, GFP_KERNEL);
+}
+
+static void sof_ipc4_put_queue_id(struct snd_sof_widget *swidget, int queue_id,
+				  bool pin_type)
+{
+	struct ida *queue_ida;
+	char **pin_binding;
+	int num_pins;
+
+	if (pin_type == SOF_PIN_TYPE_SOURCE) {
+		pin_binding = swidget->src_pin_binding;
+		queue_ida = &swidget->src_queue_ida;
+		num_pins = swidget->num_source_pins;
+	} else {
+		pin_binding = swidget->sink_pin_binding;
+		queue_ida = &swidget->sink_queue_ida;
+		num_pins = swidget->num_sink_pins;
+	}
+
+	/* Nothing to free if queue ID is not allocated with ida. */
+	if (num_pins == 1 || pin_binding)
+		return;
+
+	ida_free(queue_ida, queue_id);
+}
+
 static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *sroute)
 {
 	struct snd_sof_widget *src_widget = sroute->src_widget;
@@ -1585,12 +1667,29 @@ static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 	struct sof_ipc4_fw_module *sink_fw_module = sink_widget->module_info;
 	struct sof_ipc4_msg msg = {{ 0 }};
 	u32 header, extension;
-	int src_queue = 0;
-	int dst_queue = 0;
 	int ret;
 
-	dev_dbg(sdev->dev, "bind %s -> %s\n",
-		src_widget->widget->name, sink_widget->widget->name);
+	sroute->src_queue_id = sof_ipc4_get_queue_id(src_widget, sink_widget,
+						     SOF_PIN_TYPE_SOURCE);
+	if (sroute->src_queue_id < 0) {
+		dev_err(sdev->dev, "failed to get queue ID for source widget: %s\n",
+			src_widget->widget->name);
+		return sroute->src_queue_id;
+	}
+
+	sroute->dst_queue_id = sof_ipc4_get_queue_id(src_widget, sink_widget,
+						     SOF_PIN_TYPE_SINK);
+	if (sroute->dst_queue_id < 0) {
+		dev_err(sdev->dev, "failed to get queue ID for sink widget: %s\n",
+			sink_widget->widget->name);
+		sof_ipc4_put_queue_id(src_widget, sroute->src_queue_id,
+				      SOF_PIN_TYPE_SOURCE);
+		return sroute->dst_queue_id;
+	}
+
+	dev_dbg(sdev->dev, "bind %s:%d -> %s:%d\n",
+		src_widget->widget->name, sroute->src_queue_id,
+		sink_widget->widget->name, sroute->dst_queue_id);
 
 	header = src_fw_module->man4_module_entry.id;
 	header |= SOF_IPC4_MOD_INSTANCE(src_widget->instance_id);
@@ -1600,17 +1699,23 @@ static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 
 	extension = sink_fw_module->man4_module_entry.id;
 	extension |= SOF_IPC4_MOD_EXT_DST_MOD_INSTANCE(sink_widget->instance_id);
-	extension |= SOF_IPC4_MOD_EXT_DST_MOD_QUEUE_ID(dst_queue);
-	extension |= SOF_IPC4_MOD_EXT_SRC_MOD_QUEUE_ID(src_queue);
+	extension |= SOF_IPC4_MOD_EXT_DST_MOD_QUEUE_ID(sroute->dst_queue_id);
+	extension |= SOF_IPC4_MOD_EXT_SRC_MOD_QUEUE_ID(sroute->src_queue_id);
 
 	msg.primary = header;
 	msg.extension = extension;
 
 	ret = sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(sdev->dev, "%s: failed to bind modules %s -> %s\n",
 			__func__, src_widget->widget->name, sink_widget->widget->name);
 
+		sof_ipc4_put_queue_id(src_widget, sroute->src_queue_id,
+				      SOF_PIN_TYPE_SOURCE);
+		sof_ipc4_put_queue_id(sink_widget, sroute->dst_queue_id,
+				      SOF_PIN_TYPE_SINK);
+	}
+
 	return ret;
 }
 
@@ -1622,12 +1727,11 @@ static int sof_ipc4_route_free(struct snd_sof_dev *sdev, struct snd_sof_route *s
 	struct sof_ipc4_fw_module *sink_fw_module = sink_widget->module_info;
 	struct sof_ipc4_msg msg = {{ 0 }};
 	u32 header, extension;
-	int src_queue = 0;
-	int dst_queue = 0;
 	int ret;
 
-	dev_dbg(sdev->dev, "unbind modules %s -> %s\n",
-		src_widget->widget->name, sink_widget->widget->name);
+	dev_dbg(sdev->dev, "unbind modules %s:%d -> %s:%d\n",
+		src_widget->widget->name, sroute->src_queue_id,
+		sink_widget->widget->name, sroute->dst_queue_id);
 
 	header = src_fw_module->man4_module_entry.id;
 	header |= SOF_IPC4_MOD_INSTANCE(src_widget->instance_id);
@@ -1637,8 +1741,8 @@ static int sof_ipc4_route_free(struct snd_sof_dev *sdev, struct snd_sof_route *s
 
 	extension = sink_fw_module->man4_module_entry.id;
 	extension |= SOF_IPC4_MOD_EXT_DST_MOD_INSTANCE(sink_widget->instance_id);
-	extension |= SOF_IPC4_MOD_EXT_DST_MOD_QUEUE_ID(dst_queue);
-	extension |= SOF_IPC4_MOD_EXT_SRC_MOD_QUEUE_ID(src_queue);
+	extension |= SOF_IPC4_MOD_EXT_DST_MOD_QUEUE_ID(sroute->dst_queue_id);
+	extension |= SOF_IPC4_MOD_EXT_SRC_MOD_QUEUE_ID(sroute->src_queue_id);
 
 	msg.primary = header;
 	msg.extension = extension;
@@ -1648,6 +1752,9 @@ static int sof_ipc4_route_free(struct snd_sof_dev *sdev, struct snd_sof_route *s
 		dev_err(sdev->dev, "failed to unbind modules %s -> %s\n",
 			src_widget->widget->name, sink_widget->widget->name);
 
+	sof_ipc4_put_queue_id(sink_widget, sroute->dst_queue_id, SOF_PIN_TYPE_SINK);
+	sof_ipc4_put_queue_id(src_widget, sroute->src_queue_id, SOF_PIN_TYPE_SOURCE);
+
 	return ret;
 }
 
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index efc80a5febc3..1b5b3ea53a6e 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -422,6 +422,9 @@ struct snd_sof_widget {
 	char **sink_pin_binding;
 	char **src_pin_binding;
 
+	struct ida src_queue_ida;
+	struct ida sink_queue_ida;
+
 	void *private;		/* core does not touch this */
 };
 
@@ -435,6 +438,9 @@ struct snd_sof_route {
 	struct snd_sof_widget *sink_widget;
 	bool setup;
 
+	int src_queue_id;
+	int dst_queue_id;
+
 	void *private;
 };
 
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 3b1290d34131..176f64a86c26 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1392,6 +1392,8 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	swidget->id = w->id;
 	swidget->pipeline_id = index;
 	swidget->private = NULL;
+	ida_init(&swidget->src_queue_ida);
+	ida_init(&swidget->sink_queue_ida);
 
 	ret = sof_parse_tokens(scomp, swidget, comp_pin_tokens,
 			       ARRAY_SIZE(comp_pin_tokens), priv->array,
@@ -1624,6 +1626,9 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 	if (widget_ops[swidget->id].ipc_free)
 		widget_ops[swidget->id].ipc_free(swidget);
 
+	ida_destroy(&swidget->src_queue_ida);
+	ida_destroy(&swidget->sink_queue_ida);
+
 	sof_free_pin_binding(swidget, SOF_PIN_TYPE_SINK);
 	sof_free_pin_binding(swidget, SOF_PIN_TYPE_SOURCE);
 
-- 
2.38.1

