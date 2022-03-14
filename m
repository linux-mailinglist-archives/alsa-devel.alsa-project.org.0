Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9794D8DD5
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 21:07:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EDD01788;
	Mon, 14 Mar 2022 21:06:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EDD01788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647288447;
	bh=VVVYSwdmNeQo6PpJMzYLgQ0vNK678XGoWOAeE8mXLxg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GiAv3ijkMDiHvpMzO7h5iBg8tRR4H4kTA8iGQ2ed3F+tRq3D/TbwdVSnNON8GlAIL
	 wBofkZSEU+3yO5KlokNfOuuKIWxGQECxEt72+SkyP0G5WmGrh1FymTzNfgDll99WZp
	 9WqTM+vL/Rv7Ot/x9dEEeCk7G1/W5eSzfWEPbHZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80496F8051E;
	Mon, 14 Mar 2022 21:05:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3885F80517; Mon, 14 Mar 2022 21:05:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83CA5F801EC
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 21:05:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83CA5F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ab5JYuqE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647288341; x=1678824341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VVVYSwdmNeQo6PpJMzYLgQ0vNK678XGoWOAeE8mXLxg=;
 b=Ab5JYuqEES3CecC5IZ2gmMQA98NFdg8gzTR7/oEiDAvMfJXfL1ZPYRXU
 VJEMc80dszFYCS1a+pgoHslJNNEhZhTdAxJOZQ33H/nO5WFODDNsPB84g
 j5QcI8mR/JmjXV7Afetq3ek3OLsPdVrH3M+j+KlryXaNsKWQ1lA1XEYdM
 265iW5DUcXIUz1Y/IdA8nR3M9Mk7PnxI1h6a9YMnpU3U5xOYXo/cKh5BW
 Plawzvi3KZDkNahAZdb4sdmBv3gGXxiqJIIll8aeB/hZ7HCubgIntOgpQ
 t3ADC4FN1caEApjrYlmfAmLB416va/BdT/xrRUSFuhu8MovarhCYjx8qG Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342563468"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="342563468"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="634339886"
Received: from pmishr1-mobl1.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.25.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:32 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/18] ASoC: SOF: IPC: Introduce IPC ops
Date: Mon, 14 Mar 2022 13:05:04 -0700
Message-Id: <20220314200520.1233427-4-ranjani.sridharan@linux.intel.com>
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

In preparation for supporting a new IPC version that will be introduced
in the SOF firmware, add a new set of ops that will be version specific.

For now, the IPC ops contain only the topology-related ops for setting
up widgets and pipeline connections. It will be expanded later to also
abstract the IPC-specific items in the component driver and DAI driver.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.h | 36 ++++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-priv.h  | 13 +++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 548d443e83b0..79041622987f 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -30,6 +30,42 @@
 
 #define WIDGET_IS_DAI(id) ((id) == snd_soc_dapm_dai_in || (id) == snd_soc_dapm_dai_out)
 
+struct snd_sof_widget;
+struct snd_sof_route;
+
+/**
+ * struct sof_ipc_tplg_widget_ops - IPC-specific ops for topology widgets
+ * @ipc_setup: Function pointer for setting up widget IPC params
+ * @ipc_free: Function pointer for freeing widget IPC params
+ * @token_list: List of token ID's that should be parsed for the widget
+ * @token_list_size: number of elements in token_list
+ * @bind_event: Function pointer for binding events to the widget
+ */
+struct sof_ipc_tplg_widget_ops {
+	int (*ipc_setup)(struct snd_sof_widget *swidget);
+	void (*ipc_free)(struct snd_sof_widget *swidget);
+	enum sof_tokens *token_list;
+	int token_list_size;
+	int (*bind_event)(struct snd_soc_component *scomp, struct snd_sof_widget *swidget,
+			  u16 event_type);
+};
+
+/**
+ * struct sof_ipc_tplg_ops - IPC-specific topology ops
+ * @widget: Array of pointers to IPC-specific ops for widgets. This should always be of size
+ *	    SND_SOF_DAPM_TYPE_COUNT i.e one per widget type. Unsupported widget types will be
+ *	    initialized to 0.
+ * @route_setup: Function pointer for setting up pipeline connections
+ * @token_list: List of all tokens supported by the IPC version. The size of the token_list
+ *		array should be SOF_TOKEN_COUNT. The unused elements in the array will be
+ *		initialized to 0.
+ */
+struct sof_ipc_tplg_ops {
+	const struct sof_ipc_tplg_widget_ops *widget;
+	int (*route_setup)(struct snd_sof_dev *sdev, struct snd_sof_route *sroute);
+	const struct sof_token_info *token_list;
+};
+
 /** struct snd_sof_tuple - Tuple info
  * @token:	Token ID
  * @value:	union of a string or a u32 values
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 28d3f1ac8be8..0dab5b70406e 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -360,6 +360,16 @@ struct snd_sof_ipc_msg {
 	bool ipc_complete;
 };
 
+struct sof_ipc_tplg_ops;
+
+/**
+ * struct sof_ipc_ops - IPC-specific ops
+ * @tplg:	Pointer to IPC-specific topology ops
+ */
+struct sof_ipc_ops {
+	const struct sof_ipc_tplg_ops *tplg;
+};
+
 /* SOF generic IPC data */
 struct snd_sof_ipc {
 	struct snd_sof_dev *sdev;
@@ -370,6 +380,9 @@ struct snd_sof_ipc {
 	bool disable_ipc_tx;
 
 	struct snd_sof_ipc_msg msg;
+
+	/* IPC ops based on version */
+	const struct sof_ipc_ops *ops;
 };
 
 /*
-- 
2.25.1

