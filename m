Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 969E84D8DDB
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 21:08:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C70017E8;
	Mon, 14 Mar 2022 21:07:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C70017E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647288486;
	bh=u3bwTvbNX9x0xvyI0+4ZlXRcVsxh2WQH7lYr92L3+U4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PMDheRBdMSI7yvettAeDi5qYhk9MxZD/IEadivZAZkPzRxD7soIKOyvq6PDLLqkd/
	 YytMyHFrxqiW7KlTsZ55qtv31MebqhvNLYPheCdNEH0oFAabUV8duYqip1h9JGukAR
	 4x/oTuN+qT+Ykvz2wSWmuruPNWmGQqe3MZkinoFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7C98F80533;
	Mon, 14 Mar 2022 21:05:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83C67F8052D; Mon, 14 Mar 2022 21:05:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D709F80475
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 21:05:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D709F80475
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Dz0+ujyu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647288343; x=1678824343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u3bwTvbNX9x0xvyI0+4ZlXRcVsxh2WQH7lYr92L3+U4=;
 b=Dz0+ujyuEl741WLkFDGqeQKfMkgEiLk4BoXCpufBnPqFFkqHMhfl5rGZ
 lwJI80AckV24gwjBpk322S/B4cGB0DWWlTEsC3RA7vO/dFzmeUQp/b5Bs
 HLr0dAI9RxT/lsHyedECFBAX+lB9J4yw37iOQ99oclOmHSJM25eGVQ0bI
 MWN0gw6D10doQCSJCc9rs0wQBbp8dABzamsLkOjewZdp1RsBAx+LPa//b
 PQk6kFfM1M9/KTCy3WeLRyWlnCLo52SqBY2gYw9gCO7giUnFSyv8E/8kq
 hStaO0LgDLap6Pbfek2cLHTzwXjq/XxlkbMs8+ItTLNzuc+tSwyoK9DJy w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342563470"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="342563470"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="634339888"
Received: from pmishr1-mobl1.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.25.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:32 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/18] ASoC: SOF: topology: Add helper function for processing
 tuple arrays
Date: Mon, 14 Mar 2022 13:05:05 -0700
Message-Id: <20220314200520.1233427-5-ranjani.sridharan@linux.intel.com>
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

Add a helper function for processing tuple arrays and populating the
IPC structure objects based on the token ID passed.

Introduce a new enum representing token ID for the tokens
currently used in the topology parse and a new struct sof_token_info
to store the information about a token set. Finally, expose the struct
snd_sof_topology token as it will be used by IPC-specific code.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.h |  54 +++++++++++++++++++
 sound/soc/sof/topology.c  | 106 +++++++++++++++++++++++++++++++++-----
 2 files changed, 148 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 79041622987f..bde86e078e08 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -78,6 +78,57 @@ struct snd_sof_tuple {
 	} value;
 };
 
+/*
+ * List of SOF token ID's. The order of ID's does not matter as token arrays are looked up based on
+ * the ID.
+ */
+enum sof_tokens {
+	SOF_PCM_TOKENS,
+	SOF_PIPELINE_TOKENS,
+	SOF_SCHED_TOKENS,
+	SOF_ASRC_TOKENS,
+	SOF_SRC_TOKENS,
+	SOF_COMP_TOKENS,
+	SOF_BUFFER_TOKENS,
+	SOF_VOLUME_TOKENS,
+	SOF_PROCESS_TOKENS,
+	SOF_DAI_TOKENS,
+	SOF_DAI_LINK_TOKENS,
+	SOF_HDA_TOKENS,
+	SOF_SSP_TOKENS,
+	SOF_ALH_TOKENS,
+	SOF_DMIC_TOKENS,
+	SOF_DMIC_PDM_TOKENS,
+	SOF_ESAI_TOKENS,
+	SOF_SAI_TOKENS,
+	SOF_AFE_TOKENS,
+	SOF_CORE_TOKENS,
+	SOF_COMP_EXT_TOKENS,
+
+	/* this should be the last */
+	SOF_TOKEN_COUNT,
+};
+
+/**
+ * struct sof_topology_token - SOF topology token definition
+ * @token:		Token number
+ * @type:		Token type
+ * @get_token:		Function pointer to parse the token value and save it in a object
+ * @offset:		Offset within an object to save the token value into
+ */
+struct sof_topology_token {
+	u32 token;
+	u32 type;
+	int (*get_token)(void *elem, void *object, u32 offset);
+	u32 offset;
+};
+
+struct sof_token_info {
+	const char *name;
+	const struct sof_topology_token *tokens;
+	int count;
+};
+
 /* PCM stream, mapped to FW component  */
 struct snd_sof_pcm_stream {
 	u32 comp_id;
@@ -333,4 +384,7 @@ int get_token_u16(void *elem, void *object, u32 offset);
 int get_token_comp_format(void *elem, void *object, u32 offset);
 int get_token_dai_type(void *elem, void *object, u32 offset);
 int get_token_uuid(void *elem, void *object, u32 offset);
+int sof_update_ipc_object(struct snd_soc_component *scomp, void *object, enum sof_tokens token_id,
+			  struct snd_sof_tuple *tuples, int num_tuples,
+			  size_t object_size, int token_instance_num);
 #endif
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index afd9eda67631..a127d3d2eab7 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -47,6 +47,100 @@
 /* size of tplg abi in byte */
 #define SOF_TPLG_ABI_SIZE 3
 
+/**
+ * sof_update_ipc_object - Parse multiple sets of tokens within the token array associated with the
+ *			    token ID.
+ * @scomp: pointer to SOC component
+ * @object: target IPC struct to save the parsed values
+ * @token_id: token ID for the token array to be searched
+ * @tuples: pointer to the tuples array
+ * @num_tuples: number of tuples in the tuples array
+ * @object_size: size of the object
+ * @token_instance_num: number of times the same @token_id needs to be parsed i.e. the function
+ *			looks for @token_instance_num of each token in the token array associated
+ *			with the @token_id
+ */
+int sof_update_ipc_object(struct snd_soc_component *scomp, void *object, enum sof_tokens token_id,
+			  struct snd_sof_tuple *tuples, int num_tuples,
+			  size_t object_size, int token_instance_num)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_token_info *token_list = ipc_tplg_ops->token_list;
+	const struct sof_topology_token *tokens;
+	int i, j;
+
+	if (token_list[token_id].count < 0) {
+		dev_err(scomp->dev, "Invalid token count for token ID: %d\n", token_id);
+		return -EINVAL;
+	}
+
+	/* No tokens to match */
+	if (!token_list[token_id].count)
+		return 0;
+
+	tokens = token_list[token_id].tokens;
+	if (!tokens) {
+		dev_err(scomp->dev, "Invalid tokens for token id: %d\n", token_id);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < token_list[token_id].count; i++) {
+		int offset = 0;
+		int num_tokens_matched = 0;
+
+		for (j = 0; j < num_tuples; j++) {
+			if (tokens[i].token == tuples[j].token) {
+				switch (tokens[i].type) {
+				case SND_SOC_TPLG_TUPLE_TYPE_WORD:
+				{
+					u32 *val = (u32 *)((u8 *)object + tokens[i].offset +
+							   offset);
+
+					*val = tuples[j].value.v;
+					break;
+				}
+				case SND_SOC_TPLG_TUPLE_TYPE_SHORT:
+				case SND_SOC_TPLG_TUPLE_TYPE_BOOL:
+				{
+					u16 *val = (u16 *)((u8 *)object + tokens[i].offset +
+							    offset);
+
+					*val = (u16)tuples[j].value.v;
+					break;
+				}
+				case SND_SOC_TPLG_TUPLE_TYPE_STRING:
+				{
+					if (!tokens[i].get_token) {
+						dev_err(scomp->dev,
+							"get_token not defined for token %d in %s\n",
+							tokens[i].token, token_list[token_id].name);
+						return -EINVAL;
+					}
+
+					tokens[i].get_token((void *)tuples[j].value.s, object,
+							    tokens[i].offset + offset);
+					break;
+				}
+				default:
+					break;
+				}
+
+				num_tokens_matched++;
+
+				/* found all required sets of current token. Move to the next one */
+				if (!(num_tokens_matched % token_instance_num))
+					break;
+
+				/* move to the next object */
+				offset += object_size;
+			}
+		}
+	}
+
+	return 0;
+}
+
 struct sof_widget_data {
 	int ctrl_type;
 	int ipc_cmd;
@@ -465,18 +559,6 @@ static enum sof_comp_type find_process_comp_type(enum sof_ipc_process_type type)
 	return SOF_COMP_NONE;
 }
 
-/*
- * Topology Token Parsing.
- * New tokens should be added to headers and parsing tables below.
- */
-
-struct sof_topology_token {
-	u32 token;
-	u32 type;
-	int (*get_token)(void *elem, void *object, u32 offset);
-	u32 offset;
-};
-
 int get_token_u32(void *elem, void *object, u32 offset)
 {
 	struct snd_soc_tplg_vendor_value_elem *velem = elem;
-- 
2.25.1

