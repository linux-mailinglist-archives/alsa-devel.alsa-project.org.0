Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5017761EDF4
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 09:58:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBE5682A;
	Mon,  7 Nov 2022 09:57:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBE5682A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667811488;
	bh=6NOLQiprxbWl7gm5hGQ0fDn+Emygk2yamV9KwTqXbqo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/40AYCqmUaKA4FoysH7BaFcDzrXeKuTab3OKqO2ueh80tERVurfdcGBguy9i9sFB
	 uwYN9Ad7Kp8U/+1Hqu8rwpk7C2wJDghIMzZI0wEe6IAa2iXUwnvb36OVlmJP2qX6z/
	 eUHg/Wgruin+Ud3b/o16N8s7Ntl3TLb0lbjvGzp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 052A2F804DF;
	Mon,  7 Nov 2022 09:56:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73862F804D0; Mon,  7 Nov 2022 09:56:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAC2AF8025A
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 09:56:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAC2AF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ahjkaq/M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667811406; x=1699347406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6NOLQiprxbWl7gm5hGQ0fDn+Emygk2yamV9KwTqXbqo=;
 b=ahjkaq/MUIKxshlOJXZyh0pykJ0ovgs45leYsRJ5KjhUmrdXsXyiq2NC
 Yqz0XzxYXmiRbpA8+1qcqKvJbf8yl3erxaH9zFZEWfnUFk3TMiL05L9cK
 U9JHfR4UPivEzaiM5kcHWAup1Rl6urLxBYCKxc2xnteXOrWEKJ4XD7WTd
 hXPblVtsBsBmeFyMAOK8wDlr6LOja1a/9ZQXDpXpw38i/LNOVJZZeSGqh
 EewPCFuvxHLcTusuHq37zjCRb11R6tgYn06i6P3e9LxRpU8jAciY8wUH3
 AG3n4faIhJKM0ksgnuKdpsTzqkv5VuMDRkUAp3qH88hnytEJgwlX2ETCS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372481171"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372481171"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:56:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="635831444"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="635831444"
Received: from akharade-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.14.37])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:56:40 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	chao.song@linux.intel.com
Subject: [PATCH 1/3] ASoC: SOF: Add support for parsing the number of
 sink/source pins
Date: Mon,  7 Nov 2022 10:57:04 +0200
Message-Id: <20221107085706.2550-2-peter.ujfalusi@linux.intel.com>
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

Add support for parsing the number of sink/source pins
per widget from topology. They will be used to determine
the sink/source queue IDs during widget binding.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Chao Song <chao.song@linux.intel.com>
Suggested-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h |  2 ++
 sound/soc/sof/sof-audio.h       | 15 +++++++++++++++
 sound/soc/sof/topology.c        | 33 +++++++++++++++++++++++++++++----
 3 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 5caf75cadaf8..4f4881850650 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -88,6 +88,8 @@
 #define SOF_TKN_COMP_CPC			406
 #define SOF_TKN_COMP_IS_PAGES			409
 #define SOF_TKN_COMP_NUM_AUDIO_FORMATS		410
+#define SOF_TKN_COMP_NUM_SINK_PINS		411
+#define SOF_TKN_COMP_NUM_SOURCE_PINS		412
 
 /* SSP */
 #define SOF_TKN_INTEL_SSP_CLKS_CONTROL		500
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 4284ea2f3a1f..dfca713f00df 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -23,6 +23,13 @@
 
 #define SOF_AUDIO_PCM_DRV_NAME	"sof-audio-component"
 
+/*
+ * The ipc4 firmware only supports up to 8 sink or source pins
+ * per widget, because only 3 bits are used for queue(pin) ID
+ * in ipc4 protocol.
+ */
+#define SOF_WIDGET_MAX_NUM_PINS	8
+
 /* max number of FE PCMs before BEs */
 #define SOF_BE_PCM_BASE		16
 
@@ -387,6 +394,14 @@ struct snd_sof_widget {
 	int num_tuples;
 	struct snd_sof_tuple *tuples;
 
+	/*
+	 * The allowed range for num_sink/source_pins is [0, SOF_WIDGET_MAX_NUM_PINS].
+	 * Widgets may have zero sink or source pins, for example the tone widget has
+	 * zero sink pins.
+	 */
+	u32 num_sink_pins;
+	u32 num_source_pins;
+
 	void *private;		/* core does not touch this */
 };
 
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 38855dd60617..e839fcdc938b 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -392,6 +392,13 @@ static const struct sof_topology_token led_tokens[] = {
 		offsetof(struct snd_sof_led_control, direction)},
 };
 
+static const struct sof_topology_token comp_pin_tokens[] = {
+	{SOF_TKN_COMP_NUM_SINK_PINS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct snd_sof_widget, num_sink_pins)},
+	{SOF_TKN_COMP_NUM_SOURCE_PINS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct snd_sof_widget, num_source_pins)},
+};
+
 /**
  * sof_parse_uuid_tokens - Parse multiple sets of UUID tokens
  * @scomp: pointer to soc component
@@ -1259,6 +1266,7 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
 	const struct sof_ipc_tplg_widget_ops *widget_ops = ipc_tplg_ops->widget;
+	struct snd_soc_tplg_private *priv = &tw->priv;
 	struct snd_sof_widget *swidget;
 	struct snd_sof_dai *dai;
 	enum sof_tokens *token_list;
@@ -1277,10 +1285,27 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	swidget->pipeline_id = index;
 	swidget->private = NULL;
 
-	dev_dbg(scomp->dev, "tplg: ready widget id %d pipe %d type %d name : %s stream %s\n",
-		swidget->comp_id, index, swidget->id, tw->name,
-		strnlen(tw->sname, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) > 0
-			? tw->sname : "none");
+	ret = sof_parse_tokens(scomp, swidget, comp_pin_tokens,
+			       ARRAY_SIZE(comp_pin_tokens), priv->array,
+			       le32_to_cpu(priv->size));
+	if (ret < 0) {
+		dev_err(scomp->dev, "failed to parse component pin tokens for %s\n",
+			w->name);
+		return ret;
+	}
+
+	if (swidget->num_sink_pins > SOF_WIDGET_MAX_NUM_PINS ||
+	    swidget->num_source_pins > SOF_WIDGET_MAX_NUM_PINS) {
+		dev_err(scomp->dev, "invalid pins for %s: [sink: %d, src: %d]\n",
+			swidget->widget->name, swidget->num_sink_pins, swidget->num_source_pins);
+		return -EINVAL;
+	}
+
+	dev_dbg(scomp->dev,
+		"tplg: widget %d (%s) is ready [type: %d, pipe: %d, pins: %d / %d, stream: %s]\n",
+		swidget->comp_id, w->name, swidget->id, index,
+		swidget->num_sink_pins, swidget->num_source_pins,
+		strnlen(w->sname, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) > 0 ? w->sname : "none");
 
 	token_list = widget_ops[w->id].token_list;
 	token_list_size = widget_ops[w->id].token_list_size;
-- 
2.38.1

