Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB191189F2
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 14:36:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1530815E0;
	Tue, 10 Dec 2019 14:35:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1530815E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575984996;
	bh=1I9nPeFQwV046DFJI8LHOn6SynCNbBbFVwe3d1TAl2I=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=JaLlj0HPdxN82ZAROXPfYhKVfGQFFEzHbZ8I59vVLritSSRmJ73epu4n6PEyJfXbl
	 5RiVSypkQmCC7jOR40J425tsaJIbHfh7LzwWLZ/etefLkhKP4b0spxEguf/2auE4Sd
	 tkp8rLrufxQ0aVQyOO8SeRpxrzxFdPs8tge+m8KI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 634E6F80346;
	Tue, 10 Dec 2019 14:23:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E80A3F80217; Tue, 10 Dec 2019 14:23:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id F27C4F80343
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:23:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F27C4F80343
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3270A11B3;
 Tue, 10 Dec 2019 05:23:22 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A3FE3F52E;
 Tue, 10 Dec 2019 05:23:21 -0800 (PST)
Date: Tue, 10 Dec 2019 13:23:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
In-Reply-To: <20191210004854.16845-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191210004854.16845-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Add asynchronous sample rate
	converter topology support" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: Add asynchronous sample rate converter topology support

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 433363e779ecb772c2e9ffea5c9f266115c24441 Mon Sep 17 00:00:00 2001
From: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Date: Mon, 9 Dec 2019 18:48:47 -0600
Subject: [PATCH] ASoC: SOF: Add asynchronous sample rate converter topology
 support

This patch adds into SOF topology the handling of ASRC DAPM type,
adds the tokens to configure the ASRC, and implement component IPC
into the driver.

Signed-off-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191210004854.16845-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
index 1ae06a1f9b0b..215f4d23ddfe 100644
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
