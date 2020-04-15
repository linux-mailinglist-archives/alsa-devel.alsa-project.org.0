Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 654351AB2B2
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:44:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A428168D;
	Wed, 15 Apr 2020 22:43:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A428168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586983467;
	bh=aWvdBcytoBT+Jpy6qZDARkbNPkc4Wnqf/pV9Gjh08jQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZVsh5mi6Em5hw0gb+DY8Ji7EOz4EeWWZLcDBvE104CH8D4BNQHLPOLWdl7cSfQxR9
	 X6vkKuFezIGTMVTmIU3D4vWxvkdeNr2qgqMSuCfl3inctxoeFoUhCExaaLbd9OBv5q
	 U/12SwOLcx/4zh+nI8+p5cT8HjdsDp/2Ulq3bL3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAFFBF8037D;
	Wed, 15 Apr 2020 22:29:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B166FF80316; Wed, 15 Apr 2020 22:29:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29C88F802F9
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:29:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29C88F802F9
IronPort-SDR: q+W1DdREwuSZR1n9erBqhlPUu5jj9MaTRybIY/trvZMb5tD0RzcPjCIvV+gt9ppYCRJC7gtF3S
 qhtBeX2CRiaQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:29:26 -0700
IronPort-SDR: QTc/qygLe/khjOFBXTFE66uKmB+SXKpuVI4o7SDWhLpAY0hp6masVEGwpgXONaVp4O2Y0oA0AN
 Z5a4f1JBDwsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656357"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:29:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 24/24] ASoC: SOF: topology: handle multiple sets of tuple
 arrays
Date: Wed, 15 Apr 2020 15:28:16 -0500
Message-Id: <20200415202816.934-25-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
References: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Jaska Uimonen <jaska.uimonen@linux.intel.com>
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

From: Jaska Uimonen <jaska.uimonen@linux.intel.com>

Widget's parameters are set in topology and they usually consist of
several different types of tuple arrays like strings, words and bytes.
Here this kind of combination is called a "set".

Lately we've seen more complex widget definitions with multiple
identical sets of tuple arrays. One example is the dmic pdm
configuration, which is currently handled as a special case in token
parsing. This is not scalable for other components with multiple sets.

So add a new function sof_parse_token_sets, which can be used to parse
multiple sets. This function defines the number of sets and an offset to
copy the tokens to correct positions in the destination ipc struct. Old
sof_parse_token function will be a special case of calling
sof_parse_token_sets to parse 1 set with offset 0.

Finally modify the dmic dai link loading to use the new
sof_parse_array_sets to load multiple pdm configs.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 123 +++++++++++++++++++++------------------
 1 file changed, 67 insertions(+), 56 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index d4d0c39d6e6e..e88ffc25025f 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -773,7 +773,8 @@ static int sof_parse_uuid_tokens(struct snd_soc_component *scomp,
 				 void *object,
 				 const struct sof_topology_token *tokens,
 				 int count,
-				 struct snd_soc_tplg_vendor_array *array)
+				 struct snd_soc_tplg_vendor_array *array,
+				 size_t offset)
 {
 	struct snd_soc_tplg_vendor_uuid_elem *elem;
 	int found = 0;
@@ -794,7 +795,8 @@ static int sof_parse_uuid_tokens(struct snd_soc_component *scomp,
 				continue;
 
 			/* matched - now load token */
-			tokens[j].get_token(elem, object, tokens[j].offset,
+			tokens[j].get_token(elem, object,
+					    offset + tokens[j].offset,
 					    tokens[j].size);
 
 			found++;
@@ -808,7 +810,8 @@ static int sof_parse_string_tokens(struct snd_soc_component *scomp,
 				   void *object,
 				   const struct sof_topology_token *tokens,
 				   int count,
-				   struct snd_soc_tplg_vendor_array *array)
+				   struct snd_soc_tplg_vendor_array *array,
+				   size_t offset)
 {
 	struct snd_soc_tplg_vendor_string_elem *elem;
 	int found = 0;
@@ -829,7 +832,8 @@ static int sof_parse_string_tokens(struct snd_soc_component *scomp,
 				continue;
 
 			/* matched - now load token */
-			tokens[j].get_token(elem, object, tokens[j].offset,
+			tokens[j].get_token(elem, object,
+					    offset + tokens[j].offset,
 					    tokens[j].size);
 
 			found++;
@@ -843,15 +847,12 @@ static int sof_parse_word_tokens(struct snd_soc_component *scomp,
 				 void *object,
 				 const struct sof_topology_token *tokens,
 				 int count,
-				 struct snd_soc_tplg_vendor_array *array)
+				 struct snd_soc_tplg_vendor_array *array,
+				 size_t offset)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_vendor_value_elem *elem;
-	size_t size = sizeof(struct sof_ipc_dai_dmic_pdm_ctrl);
 	int found = 0;
 	int i, j;
-	u32 offset;
-	u32 *index = NULL;
 
 	/* parse element by element */
 	for (i = 0; i < le32_to_cpu(array->num_elems); i++) {
@@ -870,40 +871,6 @@ static int sof_parse_word_tokens(struct snd_soc_component *scomp,
 			if (tokens[j].token != le32_to_cpu(elem->token))
 				continue;
 
-			/* pdm config array index */
-			if (sdev->private)
-				index = sdev->private;
-
-			/* matched - determine offset */
-			switch (tokens[j].token) {
-			case SOF_TKN_INTEL_DMIC_PDM_CTRL_ID:
-
-				/* inc number of pdm array index */
-				if (index)
-					(*index)++;
-				/* fallthrough */
-			case SOF_TKN_INTEL_DMIC_PDM_MIC_A_Enable:
-			case SOF_TKN_INTEL_DMIC_PDM_MIC_B_Enable:
-			case SOF_TKN_INTEL_DMIC_PDM_POLARITY_A:
-			case SOF_TKN_INTEL_DMIC_PDM_POLARITY_B:
-			case SOF_TKN_INTEL_DMIC_PDM_CLK_EDGE:
-			case SOF_TKN_INTEL_DMIC_PDM_SKEW:
-
-				/* check if array index is valid */
-				if (!index || *index == 0) {
-					dev_err(scomp->dev,
-						"error: invalid array offset\n");
-					continue;
-				} else {
-					/* offset within the pdm config array */
-					offset = size * (*index - 1);
-				}
-				break;
-			default:
-				offset = 0;
-				break;
-			}
-
 			/* load token */
 			tokens[j].get_token(elem, object,
 					    offset + tokens[j].offset,
@@ -916,17 +883,33 @@ static int sof_parse_word_tokens(struct snd_soc_component *scomp,
 	return found;
 }
 
-static int sof_parse_tokens(struct snd_soc_component *scomp,
-			    void *object,
-			    const struct sof_topology_token *tokens,
-			    int count,
-			    struct snd_soc_tplg_vendor_array *array,
-			    int priv_size)
-{
+/**
+ * sof_parse_token_sets - Parse multiple sets of tokens
+ * @scomp: pointer to soc component
+ * @object: target ipc struct for parsed values
+ * @tokens: token definition array describing what tokens to parse
+ * @count: number of tokens in definition array
+ * @array: source pointer to consecutive vendor arrays to be parsed
+ * @priv_size: total size of the consecutive source arrays
+ * @sets: number of similar token sets to be parsed, 1 set has count elements
+ * @object_size: offset to next target ipc struct with multiple sets
+ *
+ * This function parses multiple sets of tokens in vendor arrays into
+ * consecutive ipc structs.
+ */
+static int sof_parse_token_sets(struct snd_soc_component *scomp,
+				void *object,
+				const struct sof_topology_token *tokens,
+				int count,
+				struct snd_soc_tplg_vendor_array *array,
+				int priv_size, int sets, size_t object_size)
+{
+	size_t offset = 0;
 	int found = 0;
+	int total = 0;
 	int asize;
 
-	while (priv_size > 0 && found < count) {
+	while (priv_size > 0 && total < count * sets) {
 		asize = le32_to_cpu(array->size);
 
 		/* validate asize */
@@ -948,18 +931,18 @@ static int sof_parse_tokens(struct snd_soc_component *scomp,
 		switch (le32_to_cpu(array->type)) {
 		case SND_SOC_TPLG_TUPLE_TYPE_UUID:
 			found += sof_parse_uuid_tokens(scomp, object, tokens,
-						       count, array);
+						       count, array, offset);
 			break;
 		case SND_SOC_TPLG_TUPLE_TYPE_STRING:
 			found += sof_parse_string_tokens(scomp, object, tokens,
-							 count, array);
+							 count, array, offset);
 			break;
 		case SND_SOC_TPLG_TUPLE_TYPE_BOOL:
 		case SND_SOC_TPLG_TUPLE_TYPE_BYTE:
 		case SND_SOC_TPLG_TUPLE_TYPE_WORD:
 		case SND_SOC_TPLG_TUPLE_TYPE_SHORT:
 			found += sof_parse_word_tokens(scomp, object, tokens,
-						       count, array);
+						       count, array, offset);
 			break;
 		default:
 			dev_err(scomp->dev, "error: unknown token type %d\n",
@@ -970,10 +953,35 @@ static int sof_parse_tokens(struct snd_soc_component *scomp,
 		/* next array */
 		array = (struct snd_soc_tplg_vendor_array *)((u8 *)array
 			+ asize);
+
+		/* move to next target struct */
+		if (found >= count) {
+			offset += object_size;
+			total += found;
+			found = 0;
+		}
 	}
+
 	return 0;
 }
 
+static int sof_parse_tokens(struct snd_soc_component *scomp,
+			    void *object,
+			    const struct sof_topology_token *tokens,
+			    int count,
+			    struct snd_soc_tplg_vendor_array *array,
+			    int priv_size)
+{
+	/*
+	 * sof_parse_tokens is used when topology contains only a single set of
+	 * identical tuples arrays. So additional parameters to
+	 * sof_parse_token_sets are sets = 1 (only 1 set) and
+	 * object_size = 0 (irrelevant).
+	 */
+	return sof_parse_token_sets(scomp, object, tokens, count, array,
+				    priv_size, 1, 0);
+}
+
 static void sof_dbg_comp_config(struct snd_soc_component *scomp,
 				struct sof_ipc_comp_config *config)
 {
@@ -2951,9 +2959,12 @@ static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 		return -ENOMEM;
 
 	/* get DMIC PDM tokens */
-	ret = sof_parse_tokens(scomp, &config->dmic.pdm[0], dmic_pdm_tokens,
+	ret = sof_parse_token_sets(scomp, &config->dmic.pdm[0], dmic_pdm_tokens,
 			       ARRAY_SIZE(dmic_pdm_tokens), private->array,
-			       le32_to_cpu(private->size));
+			       le32_to_cpu(private->size),
+			       config->dmic.num_pdm_active,
+			       sizeof(struct sof_ipc_dai_dmic_pdm_ctrl));
+
 	if (ret != 0) {
 		dev_err(scomp->dev, "error: parse dmic pdm tokens failed %d\n",
 			le32_to_cpu(private->size));
-- 
2.20.1

