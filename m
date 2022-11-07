Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 172EE61EDF6
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 09:58:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B8A186E;
	Mon,  7 Nov 2022 09:57:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B8A186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667811510;
	bh=UJKzT0Py+kFiOFG0cACG1TDGMnCalqnEMO1IsMZauyo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tC1HD6KOAQyU0Fas5X5msmHZZ/GWuaZNqDkbxo38GHqz6vuISOI5JRIFlgOVQkcYK
	 SNjzcuzQBRKdnZfAg+cMHP3g5MTd/nUC0T8RGCt5wNUfoucbI0tznH0FqU+zO41lwj
	 bKpBsgj/YwMyVqTn+KSYNtGmrXiZ+r4X/VgoEGR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71EA2F80558;
	Mon,  7 Nov 2022 09:56:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD356F8052E; Mon,  7 Nov 2022 09:56:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAEA6F800EC
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 09:56:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAEA6F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UKnEninA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667811408; x=1699347408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UJKzT0Py+kFiOFG0cACG1TDGMnCalqnEMO1IsMZauyo=;
 b=UKnEninA5R6nmCZ3+KOJtw6D4apAmMOyzJi/CFFoURX3fYhVGhpMmQEj
 hjfkr1EwrhmdE/sRTqusftnHWBYH+e1t28GCokOGJHHYwFzDI1HsYHOEZ
 3vc7nDnYWhBa8e78mIjEZCYFvlfKLaoJQsafTqp5iFl0Ky2H6okzMyu9o
 MnJEW1PhcLu4U1K6cfIbZgC9wBCOljqg8ao5cPqWYojMO2s1NNTmsWV9W
 bRMvRj8MAVfeoDcGgjn8h9WsTQGiuWDV3HgupCj7KeuaJxwcX1cVPAdHB
 jYCa/ULr9TlwqugDF4/VkRorxADaAZVHzGHxwN+Km2x0dHrTo60jDGE1z w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372481181"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372481181"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:56:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="635831450"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="635831450"
Received: from akharade-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.14.37])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:56:43 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	chao.song@linux.intel.com
Subject: [PATCH 2/3] ASoC: SOF: Add support to parse pin binding array from
 topology
Date: Mon,  7 Nov 2022 10:57:05 +0200
Message-Id: <20221107085706.2550-3-peter.ujfalusi@linux.intel.com>
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

Add support for parsing sink/source pin binding array
per widget from topology. The pin binding arrays will
be used to determine the source and sink queue IDs during
widget binding for widget that requires special pin binding.

An example of widget that requires special pin binding is
the smart amplifier widget, its feedback sink pin has to be
connected to a capture DAI copier for codec feedback, while
the other sink pin has to be connected to a host DAI copier.
Pin ID is required during widget binding for correct route setup.

Conversely, the pin ID for 'generic' pins is not defined in the
topology and will be allocated by the kernel dynamically. When
only one pin is supported, the pin ID shall always be zero. When
more than one pin is supported, the pin ID is determined with the
ID allocation mechanism in the kernel.

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Suggested-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h |   7 ++
 sound/soc/sof/sof-audio.h       |  21 +++++
 sound/soc/sof/topology.c        | 139 +++++++++++++++++++++++++++++++-
 3 files changed, 163 insertions(+), 4 deletions(-)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 4f4881850650..f187dfbd9325 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -90,6 +90,13 @@
 #define SOF_TKN_COMP_NUM_AUDIO_FORMATS		410
 #define SOF_TKN_COMP_NUM_SINK_PINS		411
 #define SOF_TKN_COMP_NUM_SOURCE_PINS		412
+/*
+ * The token for sink/source pin binding, it specifies the widget
+ * name that the sink/source pin is connected from/to.
+ */
+#define SOF_TKN_COMP_SINK_PIN_BINDING_WNAME	413
+#define SOF_TKN_COMP_SRC_PIN_BINDING_WNAME	414
+
 
 /* SSP */
 #define SOF_TKN_INTEL_SSP_CLKS_CONTROL		500
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index dfca713f00df..efc80a5febc3 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -30,6 +30,10 @@
  */
 #define SOF_WIDGET_MAX_NUM_PINS	8
 
+/* The type of a widget pin is either sink or source */
+#define SOF_PIN_TYPE_SINK	0
+#define SOF_PIN_TYPE_SOURCE	1
+
 /* max number of FE PCMs before BEs */
 #define SOF_BE_PCM_BASE		16
 
@@ -402,6 +406,22 @@ struct snd_sof_widget {
 	u32 num_sink_pins;
 	u32 num_source_pins;
 
+	/*
+	 * The sink/source pin binding array, it takes the form of
+	 * [widget_name_connected_to_pin0, widget_name_connected_to_pin1, ...],
+	 * with the index as the queue ID.
+	 *
+	 * The array is used for special pin binding. Note that even if there
+	 * is only one sink/source pin requires special pin binding, pin binding
+	 * should be defined for all sink/source pins in topology, for pin(s) that
+	 * are not used, give the value "NotConnected".
+	 *
+	 * If pin binding is not defined in topology, nothing to parse in the kernel,
+	 * sink_pin_binding and src_pin_binding shall be NULL.
+	 */
+	char **sink_pin_binding;
+	char **src_pin_binding;
+
 	void *private;		/* core does not touch this */
 };
 
@@ -546,6 +566,7 @@ int get_token_u16(void *elem, void *object, u32 offset);
 int get_token_comp_format(void *elem, void *object, u32 offset);
 int get_token_dai_type(void *elem, void *object, u32 offset);
 int get_token_uuid(void *elem, void *object, u32 offset);
+int get_token_string(void *elem, void *object, u32 offset);
 int sof_update_ipc_object(struct snd_soc_component *scomp, void *object, enum sof_tokens token_id,
 			  struct snd_sof_tuple *tuples, int num_tuples,
 			  size_t object_size, int token_instance_num);
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index e839fcdc938b..3b1290d34131 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -360,6 +360,21 @@ int get_token_uuid(void *elem, void *object, u32 offset)
 	return 0;
 }
 
+/*
+ * The string gets from topology will be stored in heap, the owner only
+ * holds a char* member point to the heap.
+ */
+int get_token_string(void *elem, void *object, u32 offset)
+{
+	/* "dst" here points to the char* member of the owner */
+	char **dst = (char **)((u8 *)object + offset);
+
+	*dst = kstrdup(elem, GFP_KERNEL);
+	if (!*dst)
+		return -ENOMEM;
+	return 0;
+};
+
 int get_token_comp_format(void *elem, void *object, u32 offset)
 {
 	u32 *val = (u32 *)((u8 *)object + offset);
@@ -399,6 +414,16 @@ static const struct sof_topology_token comp_pin_tokens[] = {
 		offsetof(struct snd_sof_widget, num_source_pins)},
 };
 
+static const struct sof_topology_token comp_sink_pin_binding_tokens[] = {
+	{SOF_TKN_COMP_SINK_PIN_BINDING_WNAME, SND_SOC_TPLG_TUPLE_TYPE_STRING,
+		get_token_string, 0},
+};
+
+static const struct sof_topology_token comp_src_pin_binding_tokens[] = {
+	{SOF_TKN_COMP_SRC_PIN_BINDING_WNAME, SND_SOC_TPLG_TUPLE_TYPE_STRING,
+		get_token_string, 0},
+};
+
 /**
  * sof_parse_uuid_tokens - Parse multiple sets of UUID tokens
  * @scomp: pointer to soc component
@@ -579,7 +604,7 @@ static int sof_parse_string_tokens(struct snd_soc_component *scomp,
 {
 	struct snd_soc_tplg_vendor_string_elem *elem;
 	int found = 0;
-	int i, j;
+	int i, j, ret;
 
 	/* parse element by element */
 	for (i = 0; i < le32_to_cpu(array->num_elems); i++) {
@@ -596,7 +621,9 @@ static int sof_parse_string_tokens(struct snd_soc_component *scomp,
 				continue;
 
 			/* matched - now load token */
-			tokens[j].get_token(elem->string, object, offset + tokens[j].offset);
+			ret = tokens[j].get_token(elem->string, object, offset + tokens[j].offset);
+			if (ret < 0)
+				return ret;
 
 			found++;
 		}
@@ -676,6 +703,7 @@ static int sof_parse_token_sets(struct snd_soc_component *scomp,
 	int found = 0;
 	int total = 0;
 	int asize;
+	int ret;
 
 	while (array_size > 0 && total < count * token_instance_num) {
 		asize = le32_to_cpu(array->size);
@@ -702,8 +730,15 @@ static int sof_parse_token_sets(struct snd_soc_component *scomp,
 						       array);
 			break;
 		case SND_SOC_TPLG_TUPLE_TYPE_STRING:
-			found += sof_parse_string_tokens(scomp, object, offset, tokens, count,
-							 array);
+
+			ret = sof_parse_string_tokens(scomp, object, offset, tokens, count,
+						      array);
+			if (ret < 0) {
+				dev_err(scomp->dev, "error: no memory to copy string token\n");
+				return ret;
+			}
+
+			found += ret;
 			break;
 		case SND_SOC_TPLG_TUPLE_TYPE_BOOL:
 		case SND_SOC_TPLG_TUPLE_TYPE_BYTE:
@@ -1258,6 +1293,79 @@ static int sof_widget_parse_tokens(struct snd_soc_component *scomp, struct snd_s
 	return ret;
 }
 
+static void sof_free_pin_binding(struct snd_sof_widget *swidget,
+				 bool pin_type)
+{
+	char **pin_binding;
+	u32 num_pins;
+	int i;
+
+	if (pin_type == SOF_PIN_TYPE_SINK) {
+		pin_binding = swidget->sink_pin_binding;
+		num_pins = swidget->num_sink_pins;
+	} else {
+		pin_binding = swidget->src_pin_binding;
+		num_pins = swidget->num_source_pins;
+	}
+
+	if (pin_binding) {
+		for (i = 0; i < num_pins; i++)
+			kfree(pin_binding[i]);
+	}
+
+	kfree(pin_binding);
+}
+
+static int sof_parse_pin_binding(struct snd_sof_widget *swidget,
+				 struct snd_soc_tplg_private *priv, bool pin_type)
+{
+	const struct sof_topology_token *pin_binding_token;
+	char *pin_binding[SOF_WIDGET_MAX_NUM_PINS];
+	int token_count;
+	u32 num_pins;
+	char **pb;
+	int ret;
+	int i;
+
+	if (pin_type == SOF_PIN_TYPE_SINK) {
+		num_pins = swidget->num_sink_pins;
+		pin_binding_token = comp_sink_pin_binding_tokens;
+		token_count = ARRAY_SIZE(comp_sink_pin_binding_tokens);
+	} else {
+		num_pins = swidget->num_source_pins;
+		pin_binding_token = comp_src_pin_binding_tokens;
+		token_count = ARRAY_SIZE(comp_src_pin_binding_tokens);
+	}
+
+	memset(pin_binding, 0, SOF_WIDGET_MAX_NUM_PINS * sizeof(char *));
+	ret = sof_parse_token_sets(swidget->scomp, pin_binding, pin_binding_token,
+				   token_count, priv->array, le32_to_cpu(priv->size),
+				   num_pins, sizeof(char *));
+	if (ret < 0)
+		goto err;
+
+	/* copy pin binding array to swidget only if it is defined in topology */
+	if (pin_binding[0]) {
+		pb = kmemdup(pin_binding, num_pins * sizeof(char *), GFP_KERNEL);
+		if (!pb) {
+			ret = -ENOMEM;
+			goto err;
+		}
+		if (pin_type == SOF_PIN_TYPE_SINK)
+			swidget->sink_pin_binding = pb;
+		else
+			swidget->src_pin_binding = pb;
+	}
+
+	return 0;
+
+err:
+	for (i = 0; i < num_pins; i++)
+		kfree(pin_binding[i]);
+
+	return ret;
+}
+
 /* external widget init - used for any driver specific init */
 static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 			    struct snd_soc_dapm_widget *w,
@@ -1301,6 +1409,26 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		return -EINVAL;
 	}
 
+	if (swidget->num_sink_pins > 1) {
+		ret = sof_parse_pin_binding(swidget, priv, SOF_PIN_TYPE_SINK);
+		/* on parsing error, pin binding is not allocated, nothing to free. */
+		if (ret < 0) {
+			dev_err(scomp->dev, "failed to parse sink pin binding for %s\n",
+				w->name);
+			return ret;
+		}
+	}
+
+	if (swidget->num_source_pins > 1) {
+		ret = sof_parse_pin_binding(swidget, priv, SOF_PIN_TYPE_SOURCE);
+		/* on parsing error, pin binding is not allocated, nothing to free. */
+		if (ret < 0) {
+			dev_err(scomp->dev, "failed to parse source pin binding for %s\n",
+				w->name);
+			return ret;
+		}
+	}
+
 	dev_dbg(scomp->dev,
 		"tplg: widget %d (%s) is ready [type: %d, pipe: %d, pins: %d / %d, stream: %s]\n",
 		swidget->comp_id, w->name, swidget->id, index,
@@ -1496,6 +1624,9 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 	if (widget_ops[swidget->id].ipc_free)
 		widget_ops[swidget->id].ipc_free(swidget);
 
+	sof_free_pin_binding(swidget, SOF_PIN_TYPE_SINK);
+	sof_free_pin_binding(swidget, SOF_PIN_TYPE_SOURCE);
+
 	kfree(swidget->tuples);
 
 	/* remove and free swidget object */
-- 
2.38.1

