Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F016B7809
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 13:51:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 005381450;
	Mon, 13 Mar 2023 13:50:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 005381450
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678711873;
	bh=gxYne5N84nDbkbGXmaHB/FzGIg4VUJXfPkUV50AnpPg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uTI4YDElF9CfRhdMWhyWOqix2613CuwmGHIM1g9ikXddianNbK5+l141NPzsTrOyZ
	 UYcxCxfbdUbzg2HwdnchfS+pguZtEh1E4nCahX9BG9fxrPIpN7oRYhEahqbhaQ+waL
	 6k7vlYkBgy16LuYn4UlVJb46uSPEgDxsxbYNez3w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F35DF80533;
	Mon, 13 Mar 2023 13:49:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AA61F8052D; Mon, 13 Mar 2023 13:49:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2246EF8032D
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 13:49:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2246EF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gjH+/1Gk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678711742; x=1710247742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gxYne5N84nDbkbGXmaHB/FzGIg4VUJXfPkUV50AnpPg=;
  b=gjH+/1GkqAgAKiRUUdmjRnvmnZafglhYk3HHPI2YHXoVcbxaSew83/3r
   B48l5E6ervuFJivFZQXqdbksl/yNWvC4C0Y4Xe5mVOPwS6vlv3l7wBxdg
   CPxLwXbNuCEx1XRiRCvpSHkUyraqORa89pDddkLO3mja+V7i2KrQCsd+k
   5GP447H2SUCKfcL5XCVjHfQOM6hKC3fHQ0UKDck7qKauKTWT4tPyxUiSF
   9jGnv0MU85WPqSBRqETY+pglylejESX6o2F4UMEJ8EEE9/SJMI6iiJ2Xg
   myxQu4JwBGLzT+qymSSfjtFIu/OsEsM9YY20SllFwqspfSuTtvn9Swpnq
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="399728048"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="399728048"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="711116406"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="711116406"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:37 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 02/11] ASoC: SOF: Use input/output pin consistently
Date: Mon, 13 Mar 2023 14:48:47 +0200
Message-Id: <20230313124856.8140-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
References: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I36YF2THVLWHYIDTE5GXWVW5EGPZRO2U
X-Message-ID-Hash: I36YF2THVLWHYIDTE5GXWVW5EGPZRO2U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I36YF2THVLWHYIDTE5GXWVW5EGPZRO2U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Currently we use input/output and sink/source pins interchangeably.
Remove the references to sink/source pins and replace with input/output
pins everywhere for consistency and clarity.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h | 12 ++---
 sound/soc/sof/ipc4-topology.c   | 48 ++++++++++----------
 sound/soc/sof/sof-audio.h       | 32 ++++++-------
 sound/soc/sof/topology.c        | 80 ++++++++++++++++-----------------
 4 files changed, 86 insertions(+), 86 deletions(-)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index a1ef6b5c0d45..0b5110427132 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -88,14 +88,14 @@
 #define SOF_TKN_COMP_CPC			406
 #define SOF_TKN_COMP_IS_PAGES			409
 #define SOF_TKN_COMP_NUM_AUDIO_FORMATS		410
-#define SOF_TKN_COMP_NUM_SINK_PINS		411
-#define SOF_TKN_COMP_NUM_SOURCE_PINS		412
+#define SOF_TKN_COMP_NUM_INPUT_PINS		411
+#define SOF_TKN_COMP_NUM_OUTPUT_PINS		412
 /*
- * The token for sink/source pin binding, it specifies the widget
- * name that the sink/source pin is connected from/to.
+ * The token for input/output pin binding, it specifies the widget
+ * name that the input/output pin is connected from/to.
  */
-#define SOF_TKN_COMP_SINK_PIN_BINDING_WNAME	413
-#define SOF_TKN_COMP_SRC_PIN_BINDING_WNAME	414
+#define SOF_TKN_COMP_INPUT_PIN_BINDING_WNAME	413
+#define SOF_TKN_COMP_OUTPUT_PIN_BINDING_WNAME	414
 
 
 /* SSP */
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 0bb16ed38e48..a501eb9befa8 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1698,17 +1698,17 @@ static int sof_ipc4_get_queue_id(struct snd_sof_widget *src_widget,
 	u32 num_pins;
 	int i;
 
-	if (pin_type == SOF_PIN_TYPE_SOURCE) {
+	if (pin_type == SOF_PIN_TYPE_OUTPUT) {
 		current_swidget = src_widget;
-		pin_binding = src_widget->src_pin_binding;
-		queue_ida = &src_widget->src_queue_ida;
-		num_pins = src_widget->num_source_pins;
+		pin_binding = src_widget->output_pin_binding;
+		queue_ida = &src_widget->output_queue_ida;
+		num_pins = src_widget->num_output_pins;
 		buddy_name = sink_widget->widget->name;
 	} else {
 		current_swidget = sink_widget;
-		pin_binding = sink_widget->sink_pin_binding;
-		queue_ida = &sink_widget->sink_queue_ida;
-		num_pins = sink_widget->num_sink_pins;
+		pin_binding = sink_widget->input_pin_binding;
+		queue_ida = &sink_widget->input_queue_ida;
+		num_pins = sink_widget->num_input_pins;
 		buddy_name = src_widget->widget->name;
 	}
 
@@ -1716,12 +1716,12 @@ static int sof_ipc4_get_queue_id(struct snd_sof_widget *src_widget,
 
 	if (num_pins < 1) {
 		dev_err(scomp->dev, "invalid %s num_pins: %d for queue allocation for %s\n",
-			(pin_type == SOF_PIN_TYPE_SOURCE ? "source" : "sink"),
+			(pin_type == SOF_PIN_TYPE_OUTPUT ? "output" : "input"),
 			num_pins, current_swidget->widget->name);
 		return -EINVAL;
 	}
 
-	/* If there is only one sink/source pin, queue id must be 0 */
+	/* If there is only one input/output pin, queue id must be 0 */
 	if (num_pins == 1)
 		return 0;
 
@@ -1736,7 +1736,7 @@ static int sof_ipc4_get_queue_id(struct snd_sof_widget *src_widget,
 		 * mixed use pin binding array and ida for queue ID allocation.
 		 */
 		dev_err(scomp->dev, "no %s queue id found from pin binding array for %s\n",
-			(pin_type == SOF_PIN_TYPE_SOURCE ? "source" : "sink"),
+			(pin_type == SOF_PIN_TYPE_OUTPUT ? "output" : "input"),
 			current_swidget->widget->name);
 		return -EINVAL;
 	}
@@ -1752,14 +1752,14 @@ static void sof_ipc4_put_queue_id(struct snd_sof_widget *swidget, int queue_id,
 	char **pin_binding;
 	int num_pins;
 
-	if (pin_type == SOF_PIN_TYPE_SOURCE) {
-		pin_binding = swidget->src_pin_binding;
-		queue_ida = &swidget->src_queue_ida;
-		num_pins = swidget->num_source_pins;
+	if (pin_type == SOF_PIN_TYPE_OUTPUT) {
+		pin_binding = swidget->output_pin_binding;
+		queue_ida = &swidget->output_queue_ida;
+		num_pins = swidget->num_output_pins;
 	} else {
-		pin_binding = swidget->sink_pin_binding;
-		queue_ida = &swidget->sink_queue_ida;
-		num_pins = swidget->num_sink_pins;
+		pin_binding = swidget->input_pin_binding;
+		queue_ida = &swidget->input_queue_ida;
+		num_pins = swidget->num_input_pins;
 	}
 
 	/* Nothing to free if queue ID is not allocated with ida. */
@@ -1829,7 +1829,7 @@ static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 	int ret;
 
 	sroute->src_queue_id = sof_ipc4_get_queue_id(src_widget, sink_widget,
-						     SOF_PIN_TYPE_SOURCE);
+						     SOF_PIN_TYPE_OUTPUT);
 	if (sroute->src_queue_id < 0) {
 		dev_err(sdev->dev, "failed to get queue ID for source widget: %s\n",
 			src_widget->widget->name);
@@ -1837,12 +1837,12 @@ static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 	}
 
 	sroute->dst_queue_id = sof_ipc4_get_queue_id(src_widget, sink_widget,
-						     SOF_PIN_TYPE_SINK);
+						     SOF_PIN_TYPE_INPUT);
 	if (sroute->dst_queue_id < 0) {
 		dev_err(sdev->dev, "failed to get queue ID for sink widget: %s\n",
 			sink_widget->widget->name);
 		sof_ipc4_put_queue_id(src_widget, sroute->src_queue_id,
-				      SOF_PIN_TYPE_SOURCE);
+				      SOF_PIN_TYPE_OUTPUT);
 		return sroute->dst_queue_id;
 	}
 
@@ -1886,8 +1886,8 @@ static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 	return ret;
 
 out:
-	sof_ipc4_put_queue_id(src_widget, sroute->src_queue_id, SOF_PIN_TYPE_SOURCE);
-	sof_ipc4_put_queue_id(sink_widget, sroute->dst_queue_id, SOF_PIN_TYPE_SINK);
+	sof_ipc4_put_queue_id(src_widget, sroute->src_queue_id, SOF_PIN_TYPE_OUTPUT);
+	sof_ipc4_put_queue_id(sink_widget, sroute->dst_queue_id, SOF_PIN_TYPE_INPUT);
 	return ret;
 }
 
@@ -1932,8 +1932,8 @@ static int sof_ipc4_route_free(struct snd_sof_dev *sdev, struct snd_sof_route *s
 			src_widget->widget->name, sroute->src_queue_id,
 			sink_widget->widget->name, sroute->dst_queue_id);
 out:
-	sof_ipc4_put_queue_id(sink_widget, sroute->dst_queue_id, SOF_PIN_TYPE_SINK);
-	sof_ipc4_put_queue_id(src_widget, sroute->src_queue_id, SOF_PIN_TYPE_SOURCE);
+	sof_ipc4_put_queue_id(sink_widget, sroute->dst_queue_id, SOF_PIN_TYPE_INPUT);
+	sof_ipc4_put_queue_id(src_widget, sroute->src_queue_id, SOF_PIN_TYPE_OUTPUT);
 
 	return ret;
 }
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 239b82f37976..a1c4d3f34153 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -30,9 +30,9 @@
  */
 #define SOF_WIDGET_MAX_NUM_PINS	8
 
-/* The type of a widget pin is either sink or source */
-#define SOF_PIN_TYPE_SINK	0
-#define SOF_PIN_TYPE_SOURCE	1
+/* Widget pin type */
+#define SOF_PIN_TYPE_INPUT	0
+#define SOF_PIN_TYPE_OUTPUT	1
 
 /* max number of FE PCMs before BEs */
 #define SOF_BE_PCM_BASE		16
@@ -433,31 +433,31 @@ struct snd_sof_widget {
 	struct snd_sof_tuple *tuples;
 
 	/*
-	 * The allowed range for num_sink/source_pins is [0, SOF_WIDGET_MAX_NUM_PINS].
-	 * Widgets may have zero sink or source pins, for example the tone widget has
-	 * zero sink pins.
+	 * The allowed range for num_input/output_pins is [0, SOF_WIDGET_MAX_NUM_PINS].
+	 * Widgets may have zero input or output pins, for example the tone widget has
+	 * zero input pins.
 	 */
-	u32 num_sink_pins;
-	u32 num_source_pins;
+	u32 num_input_pins;
+	u32 num_output_pins;
 
 	/*
-	 * The sink/source pin binding array, it takes the form of
+	 * The input/output pin binding array, it takes the form of
 	 * [widget_name_connected_to_pin0, widget_name_connected_to_pin1, ...],
 	 * with the index as the queue ID.
 	 *
 	 * The array is used for special pin binding. Note that even if there
-	 * is only one sink/source pin requires special pin binding, pin binding
-	 * should be defined for all sink/source pins in topology, for pin(s) that
+	 * is only one input/output pin requires special pin binding, pin binding
+	 * should be defined for all input/output pins in topology, for pin(s) that
 	 * are not used, give the value "NotConnected".
 	 *
 	 * If pin binding is not defined in topology, nothing to parse in the kernel,
-	 * sink_pin_binding and src_pin_binding shall be NULL.
+	 * input_pin_binding and output_pin_binding shall be NULL.
 	 */
-	char **sink_pin_binding;
-	char **src_pin_binding;
+	char **input_pin_binding;
+	char **output_pin_binding;
 
-	struct ida src_queue_ida;
-	struct ida sink_queue_ida;
+	struct ida output_queue_ida;
+	struct ida input_queue_ida;
 
 	void *private;		/* core does not touch this */
 };
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 9f3a038fe21a..9f84b4c362c3 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -416,19 +416,19 @@ static const struct sof_topology_token led_tokens[] = {
 };
 
 static const struct sof_topology_token comp_pin_tokens[] = {
-	{SOF_TKN_COMP_NUM_SINK_PINS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct snd_sof_widget, num_sink_pins)},
-	{SOF_TKN_COMP_NUM_SOURCE_PINS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct snd_sof_widget, num_source_pins)},
+	{SOF_TKN_COMP_NUM_INPUT_PINS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct snd_sof_widget, num_input_pins)},
+	{SOF_TKN_COMP_NUM_OUTPUT_PINS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct snd_sof_widget, num_output_pins)},
 };
 
-static const struct sof_topology_token comp_sink_pin_binding_tokens[] = {
-	{SOF_TKN_COMP_SINK_PIN_BINDING_WNAME, SND_SOC_TPLG_TUPLE_TYPE_STRING,
+static const struct sof_topology_token comp_input_pin_binding_tokens[] = {
+	{SOF_TKN_COMP_INPUT_PIN_BINDING_WNAME, SND_SOC_TPLG_TUPLE_TYPE_STRING,
 		get_token_string, 0},
 };
 
-static const struct sof_topology_token comp_src_pin_binding_tokens[] = {
-	{SOF_TKN_COMP_SRC_PIN_BINDING_WNAME, SND_SOC_TPLG_TUPLE_TYPE_STRING,
+static const struct sof_topology_token comp_output_pin_binding_tokens[] = {
+	{SOF_TKN_COMP_OUTPUT_PIN_BINDING_WNAME, SND_SOC_TPLG_TUPLE_TYPE_STRING,
 		get_token_string, 0},
 };
 
@@ -1286,12 +1286,12 @@ static void sof_free_pin_binding(struct snd_sof_widget *swidget,
 	u32 num_pins;
 	int i;
 
-	if (pin_type == SOF_PIN_TYPE_SINK) {
-		pin_binding = swidget->sink_pin_binding;
-		num_pins = swidget->num_sink_pins;
+	if (pin_type == SOF_PIN_TYPE_INPUT) {
+		pin_binding = swidget->input_pin_binding;
+		num_pins = swidget->num_input_pins;
 	} else {
-		pin_binding = swidget->src_pin_binding;
-		num_pins = swidget->num_source_pins;
+		pin_binding = swidget->output_pin_binding;
+		num_pins = swidget->num_output_pins;
 	}
 
 	if (pin_binding) {
@@ -1313,14 +1313,14 @@ static int sof_parse_pin_binding(struct snd_sof_widget *swidget,
 	int ret;
 	int i;
 
-	if (pin_type == SOF_PIN_TYPE_SINK) {
-		num_pins = swidget->num_sink_pins;
-		pin_binding_token = comp_sink_pin_binding_tokens;
-		token_count = ARRAY_SIZE(comp_sink_pin_binding_tokens);
+	if (pin_type == SOF_PIN_TYPE_INPUT) {
+		num_pins = swidget->num_input_pins;
+		pin_binding_token = comp_input_pin_binding_tokens;
+		token_count = ARRAY_SIZE(comp_input_pin_binding_tokens);
 	} else {
-		num_pins = swidget->num_source_pins;
-		pin_binding_token = comp_src_pin_binding_tokens;
-		token_count = ARRAY_SIZE(comp_src_pin_binding_tokens);
+		num_pins = swidget->num_output_pins;
+		pin_binding_token = comp_output_pin_binding_tokens;
+		token_count = ARRAY_SIZE(comp_output_pin_binding_tokens);
 	}
 
 	memset(pin_binding, 0, SOF_WIDGET_MAX_NUM_PINS * sizeof(char *));
@@ -1337,10 +1337,10 @@ static int sof_parse_pin_binding(struct snd_sof_widget *swidget,
 			ret = -ENOMEM;
 			goto err;
 		}
-		if (pin_type == SOF_PIN_TYPE_SINK)
-			swidget->sink_pin_binding = pb;
+		if (pin_type == SOF_PIN_TYPE_INPUT)
+			swidget->input_pin_binding = pb;
 		else
-			swidget->src_pin_binding = pb;
+			swidget->output_pin_binding = pb;
 	}
 
 	return 0;
@@ -1379,8 +1379,8 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	swidget->private = NULL;
 	mutex_init(&swidget->setup_mutex);
 
-	ida_init(&swidget->src_queue_ida);
-	ida_init(&swidget->sink_queue_ida);
+	ida_init(&swidget->output_queue_ida);
+	ida_init(&swidget->input_queue_ida);
 
 	ret = sof_parse_tokens(scomp, swidget, comp_pin_tokens,
 			       ARRAY_SIZE(comp_pin_tokens), priv->array,
@@ -1391,29 +1391,29 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		goto widget_free;
 	}
 
-	if (swidget->num_sink_pins > SOF_WIDGET_MAX_NUM_PINS ||
-	    swidget->num_source_pins > SOF_WIDGET_MAX_NUM_PINS) {
-		dev_err(scomp->dev, "invalid pins for %s: [sink: %d, src: %d]\n",
-			swidget->widget->name, swidget->num_sink_pins, swidget->num_source_pins);
+	if (swidget->num_input_pins > SOF_WIDGET_MAX_NUM_PINS ||
+	    swidget->num_output_pins > SOF_WIDGET_MAX_NUM_PINS) {
+		dev_err(scomp->dev, "invalid pins for %s: [input: %d, output: %d]\n",
+			swidget->widget->name, swidget->num_input_pins, swidget->num_output_pins);
 		ret = -EINVAL;
 		goto widget_free;
 	}
 
-	if (swidget->num_sink_pins > 1) {
-		ret = sof_parse_pin_binding(swidget, priv, SOF_PIN_TYPE_SINK);
+	if (swidget->num_input_pins > 1) {
+		ret = sof_parse_pin_binding(swidget, priv, SOF_PIN_TYPE_INPUT);
 		/* on parsing error, pin binding is not allocated, nothing to free. */
 		if (ret < 0) {
-			dev_err(scomp->dev, "failed to parse sink pin binding for %s\n",
+			dev_err(scomp->dev, "failed to parse input pin binding for %s\n",
 				w->name);
 			goto widget_free;
 		}
 	}
 
-	if (swidget->num_source_pins > 1) {
-		ret = sof_parse_pin_binding(swidget, priv, SOF_PIN_TYPE_SOURCE);
+	if (swidget->num_output_pins > 1) {
+		ret = sof_parse_pin_binding(swidget, priv, SOF_PIN_TYPE_OUTPUT);
 		/* on parsing error, pin binding is not allocated, nothing to free. */
 		if (ret < 0) {
-			dev_err(scomp->dev, "failed to parse source pin binding for %s\n",
+			dev_err(scomp->dev, "failed to parse output pin binding for %s\n",
 				w->name);
 			goto widget_free;
 		}
@@ -1422,7 +1422,7 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	dev_dbg(scomp->dev,
 		"tplg: widget %d (%s) is ready [type: %d, pipe: %d, pins: %d / %d, stream: %s]\n",
 		swidget->comp_id, w->name, swidget->id, index,
-		swidget->num_sink_pins, swidget->num_source_pins,
+		swidget->num_input_pins, swidget->num_output_pins,
 		strnlen(w->sname, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) > 0 ? w->sname : "none");
 
 	widget_ops = tplg_ops ? tplg_ops->widget : NULL;
@@ -1643,11 +1643,11 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 	if (widget_ops && widget_ops[swidget->id].ipc_free)
 		widget_ops[swidget->id].ipc_free(swidget);
 
-	ida_destroy(&swidget->src_queue_ida);
-	ida_destroy(&swidget->sink_queue_ida);
+	ida_destroy(&swidget->output_queue_ida);
+	ida_destroy(&swidget->input_queue_ida);
 
-	sof_free_pin_binding(swidget, SOF_PIN_TYPE_SINK);
-	sof_free_pin_binding(swidget, SOF_PIN_TYPE_SOURCE);
+	sof_free_pin_binding(swidget, SOF_PIN_TYPE_INPUT);
+	sof_free_pin_binding(swidget, SOF_PIN_TYPE_OUTPUT);
 
 	kfree(swidget->tuples);
 
-- 
2.39.2

