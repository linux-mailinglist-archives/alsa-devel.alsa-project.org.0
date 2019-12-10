Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43313117CA9
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 01:51:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD9CB1664;
	Tue, 10 Dec 2019 01:50:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD9CB1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575939101;
	bh=GIBx7HSzj8nfsu9CZjdzFeG0yYOoWC+IsZb1pLs8BQ8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oJr4gLH4JP3hvlgvvTW9ttGOIhR2wmToZP1U2u6RQaNFqf6vXojPqz1HfBQXJ4Ufc
	 zSnIiJOVpxbmFPCVVK1Nb6CIrmV6BPI5YC0Gc3uOk8UoK4gCr5HW3jz0B/kFhEfWQ4
	 nTgbH46CHzxIuc0GGDRs2Zqa6COoizRa85zzlPdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D855DF80259;
	Tue, 10 Dec 2019 01:49:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E877FF80254; Tue, 10 Dec 2019 01:49:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED,URIBL_DBL_SPAM autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DE60F800C4
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 01:49:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DE60F800C4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 16:49:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,297,1571727600"; d="scan'208";a="215398947"
Received: from sneuhier-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.188.78])
 by orsmga003.jf.intel.com with ESMTP; 09 Dec 2019 16:49:04 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 18:48:47 -0600
Message-Id: <20191210004854.16845-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210004854.16845-1-pierre-louis.bossart@linux.intel.com>
References: <20191210004854.16845-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/8] ASoC: SOF: Add asynchronous sample rate
	converter topology support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>

This patch adds into SOF topology the handling of ASRC DAPM type,
adds the tokens to configure the ASRC, and implement component IPC
into the driver.

Signed-off-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/topology.h    | 27 ++++++++++++
 include/uapi/sound/sof/abi.h    |  2 +-
 include/uapi/sound/sof/tokens.h |  6 +++
 sound/soc/sof/topology.c        | 78 +++++++++++++++++++++++++++++++++
 4 files changed, 112 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index c47b36240920..8e76178fedf0 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -36,6 +36,7 @@ enum sof_comp_type {
 	SOF_COMP_KPB,			/* A key phrase buffer component */
 	SOF_COMP_SELECTOR,		/**< channel selector component */
 	SOF_COMP_DEMUX,
+	SOF_COMP_ASRC,		/**< Asynchronous sample rate converter */
 	/* keep FILEREAD/FILEWRITE as the last ones */
 	SOF_COMP_FILEREAD = 10000,	/**< host test based file IO */
 	SOF_COMP_FILEWRITE = 10001,	/**< host test based file IO */
@@ -147,6 +148,32 @@ struct sof_ipc_comp_src {
 	uint32_t rate_mask;	/**< SOF_RATE_ supported rates */
 } __packed;
 
+/* generic ASRC component */
+struct sof_ipc_comp_asrc {
+	struct sof_ipc_comp comp;
+	struct sof_ipc_comp_config config;
+	/* either source or sink rate must be non zero */
+	uint32_t source_rate;		/**< Define fixed source rate or */
+					/**< use 0 to indicate need to get */
+					/**< the rate from stream */
+	uint32_t sink_rate;		/**< Define fixed sink rate or */
+					/**< use 0 to indicate need to get */
+					/**< the rate from stream */
+	uint32_t asynchronous_mode;	/**< synchronous 0, asynchronous 1 */
+					/**< When 1 the ASRC tracks and */
+					/**< compensates for drift. */
+	uint32_t operation_mode;	/**< push 0, pull 1, In push mode the */
+					/**< ASRC consumes a defined number */
+					/**< of frames at input, with varying */
+					/**< number of frames at output. */
+					/**< In pull mode the ASRC outputs */
+					/**< a defined number of frames while */
+					/**< number of input frames varies. */
+
+	/* reserved for future use */
+	uint32_t reserved[4];
+} __attribute__((packed));
+
 /* generic MUX component */
 struct sof_ipc_comp_mux {
 	struct sof_ipc_comp comp;
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index ebfdc20ca081..c0ef1643c753 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -26,7 +26,7 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 11
+#define SOF_ABI_MINOR 12
 #define SOF_ABI_PATCH 0
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 76883e6fb750..a9a5c4d0a892 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -57,6 +57,12 @@
 #define SOF_TKN_SRC_RATE_IN			300
 #define SOF_TKN_SRC_RATE_OUT			301
 
+/* ASRC */
+#define SOF_TKN_ASRC_RATE_IN			320
+#define SOF_TKN_ASRC_RATE_OUT			321
+#define SOF_TKN_ASRC_ASYNCHRONOUS_MODE		322
+#define SOF_TKN_ASRC_OPERATION_MODE		323
+
 /* PCM */
 #define SOF_TKN_PCM_DMAC_CONFIG			353
 
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index ff25d5c95b70..e06fa7c7e502 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -573,6 +573,20 @@ static const struct sof_topology_token src_tokens[] = {
 		offsetof(struct sof_ipc_comp_src, sink_rate), 0},
 };
 
+/* ASRC */
+static const struct sof_topology_token asrc_tokens[] = {
+	{SOF_TKN_ASRC_RATE_IN, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_comp_asrc, source_rate), 0},
+	{SOF_TKN_ASRC_RATE_OUT, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_comp_asrc, sink_rate), 0},
+	{SOF_TKN_ASRC_ASYNCHRONOUS_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		get_token_u32,
+		offsetof(struct sof_ipc_comp_asrc, asynchronous_mode), 0},
+	{SOF_TKN_ASRC_OPERATION_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		get_token_u32,
+		offsetof(struct sof_ipc_comp_asrc, operation_mode), 0},
+};
+
 /* Tone */
 static const struct sof_topology_token tone_tokens[] = {
 };
@@ -1782,6 +1796,67 @@ static int sof_widget_load_src(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
+/*
+ * ASRC Topology
+ */
+
+static int sof_widget_load_asrc(struct snd_soc_component *scomp, int index,
+				struct snd_sof_widget *swidget,
+				struct snd_soc_tplg_dapm_widget *tw,
+				struct sof_ipc_comp_reply *r)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct snd_soc_tplg_private *private = &tw->priv;
+	struct sof_ipc_comp_asrc *asrc;
+	int ret;
+
+	asrc = kzalloc(sizeof(*asrc), GFP_KERNEL);
+	if (!asrc)
+		return -ENOMEM;
+
+	/* configure ASRC IPC message */
+	asrc->comp.hdr.size = sizeof(*asrc);
+	asrc->comp.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_COMP_NEW;
+	asrc->comp.id = swidget->comp_id;
+	asrc->comp.type = SOF_COMP_ASRC;
+	asrc->comp.pipeline_id = index;
+	asrc->config.hdr.size = sizeof(asrc->config);
+
+	ret = sof_parse_tokens(scomp, asrc, asrc_tokens,
+			       ARRAY_SIZE(asrc_tokens), private->array,
+			       le32_to_cpu(private->size));
+	if (ret != 0) {
+		dev_err(scomp->dev, "error: parse asrc tokens failed %d\n",
+			private->size);
+		goto err;
+	}
+
+	ret = sof_parse_tokens(scomp, &asrc->config, comp_tokens,
+			       ARRAY_SIZE(comp_tokens), private->array,
+			       le32_to_cpu(private->size));
+	if (ret != 0) {
+		dev_err(scomp->dev, "error: parse asrc.cfg tokens failed %d\n",
+			le32_to_cpu(private->size));
+		goto err;
+	}
+
+	dev_dbg(scomp->dev, "asrc %s: source rate %d sink rate %d "
+		"asynch %d operation %d\n",
+		swidget->widget->name, asrc->source_rate, asrc->sink_rate,
+		asrc->asynchronous_mode, asrc->operation_mode);
+	sof_dbg_comp_config(scomp, &asrc->config);
+
+	swidget->private = asrc;
+
+	ret = sof_ipc_tx_message(sdev->ipc, asrc->comp.hdr.cmd, asrc,
+				 sizeof(*asrc), r, sizeof(*r));
+	if (ret >= 0)
+		return ret;
+err:
+	kfree(asrc);
+	return ret;
+}
+
 /*
  * Signal Generator Topology
  */
@@ -2195,6 +2270,9 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	case snd_soc_dapm_src:
 		ret = sof_widget_load_src(scomp, index, swidget, tw, &reply);
 		break;
+	case snd_soc_dapm_asrc:
+		ret = sof_widget_load_asrc(scomp, index, swidget, tw, &reply);
+		break;
 	case snd_soc_dapm_siggen:
 		ret = sof_widget_load_siggen(scomp, index, swidget, tw, &reply);
 		break;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
