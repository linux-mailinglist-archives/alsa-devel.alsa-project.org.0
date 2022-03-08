Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6A74D1DA5
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 17:45:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2931817D6;
	Tue,  8 Mar 2022 17:44:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2931817D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646757918;
	bh=xbGV6LCIDOxoIJu3f0sW9UeupE2WbvC8p22pJTrFZvs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ktYDXPpKHblPDakvP4VbpvdgO9ddr4hBigkZFIeyC5Hw1veIipelpADM+7UTQPPYN
	 8ycLqhmlkM22CfSTx0rhyoz5KE0giuI0WnyEfGpjGAitBbzjd2MPIuC7XMa4YvV1s5
	 uJ4xdorjR5YlZK2mbvHIoe0yfakvPbMiGV71oZlc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB216F80517;
	Tue,  8 Mar 2022 17:44:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0149F804F3; Tue,  8 Mar 2022 17:44:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29630F80121
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 17:44:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29630F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LwuHIycf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646757843; x=1678293843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xbGV6LCIDOxoIJu3f0sW9UeupE2WbvC8p22pJTrFZvs=;
 b=LwuHIycfA96kNkwc0yrztZ2zoMC7W7RYNgr1oU7Nco0Yclb8KvVgLAFd
 daj5B4AX7hekgFH55sg5knQmKKu9gCuSkG+KoEU2CyF34MEypKm+3akXP
 0iYIv89lNNeEkKhdZBO2eBPXuaYY4eyTMv0DoYT/cDToVtOBivcxt0QLR
 ECxjPu9evyPcAc8BnFVAEwXFc4gzJGBfgHoe/5laz8iNmUh8Vsos144br
 kz53ULgAbagdlm6It/uP+mQswndMZKq4j1dr//v06Hmn5JCnIXE1RJYjN
 a0CQHfAEzGwSEybRs/7PGoeCamb+WoovZrxFzwR4hp0wdKrpOKVur7cgw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="341166846"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="341166846"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:58 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="537633269"
Received: from bustam3x-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.251.130.225])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:58 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 14/18] ASoC: SOF: topology: Modify signature for token
 parsing functions
Date: Tue,  8 Mar 2022 08:43:40 -0800
Message-Id: <20220308164344.577647-15-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
References: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Modify the signature for sof_parse_uuid_tokens(),
sof_parse_word_tokens() and sof_parse_string_tokens() to reorder the
arguments to be more intuitive and rename the count arg to num_tokens.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 78 ++++++++++++++++++++++++++--------------
 1 file changed, 52 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 42260d0b9740..8b2c01f45b72 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -807,12 +807,21 @@ static const struct sof_topology_token afe_tokens[] = {
 		offsetof(struct sof_ipc_dai_mtk_afe_params, format)},
 };
 
+/**
+ * sof_parse_uuid_tokens - Parse multiple sets of UUID tokens
+ * @scomp: pointer to soc component
+ * @object: target ipc struct for parsed values
+ * @offset: offset within the object pointer
+ * @tokens: array of struct sof_topology_token containing the tokens to be matched
+ * @num_tokens: number of tokens in tokens array
+ * @array: source pointer to consecutive vendor arrays in topology
+ *
+ * This function parses multiple sets of string type tokens in vendor arrays
+ */
 static int sof_parse_uuid_tokens(struct snd_soc_component *scomp,
-				 void *object,
-				 const struct sof_topology_token *tokens,
-				 int count,
-				 struct snd_soc_tplg_vendor_array *array,
-				 size_t offset)
+				  void *object, size_t offset,
+				  const struct sof_topology_token *tokens, int num_tokens,
+				  struct snd_soc_tplg_vendor_array *array)
 {
 	struct snd_soc_tplg_vendor_uuid_elem *elem;
 	int found = 0;
@@ -823,7 +832,7 @@ static int sof_parse_uuid_tokens(struct snd_soc_component *scomp,
 		elem = &array->uuid[i];
 
 		/* search for token */
-		for (j = 0; j < count; j++) {
+		for (j = 0; j < num_tokens; j++) {
 			/* match token type */
 			if (tokens[j].type != SND_SOC_TPLG_TUPLE_TYPE_UUID)
 				continue;
@@ -843,12 +852,21 @@ static int sof_parse_uuid_tokens(struct snd_soc_component *scomp,
 	return found;
 }
 
+/**
+ * sof_parse_string_tokens - Parse multiple sets of tokens
+ * @scomp: pointer to soc component
+ * @object: target ipc struct for parsed values
+ * @offset: offset within the object pointer
+ * @tokens: array of struct sof_topology_token containing the tokens to be matched
+ * @num_tokens: number of tokens in tokens array
+ * @array: source pointer to consecutive vendor arrays in topology
+ *
+ * This function parses multiple sets of string type tokens in vendor arrays
+ */
 static int sof_parse_string_tokens(struct snd_soc_component *scomp,
-				   void *object,
-				   const struct sof_topology_token *tokens,
-				   int count,
-				   struct snd_soc_tplg_vendor_array *array,
-				   size_t offset)
+				   void *object, int offset,
+				   const struct sof_topology_token *tokens, int num_tokens,
+				   struct snd_soc_tplg_vendor_array *array)
 {
 	struct snd_soc_tplg_vendor_string_elem *elem;
 	int found = 0;
@@ -859,7 +877,7 @@ static int sof_parse_string_tokens(struct snd_soc_component *scomp,
 		elem = &array->string[i];
 
 		/* search for token */
-		for (j = 0; j < count; j++) {
+		for (j = 0; j < num_tokens; j++) {
 			/* match token type */
 			if (tokens[j].type != SND_SOC_TPLG_TUPLE_TYPE_STRING)
 				continue;
@@ -878,12 +896,21 @@ static int sof_parse_string_tokens(struct snd_soc_component *scomp,
 	return found;
 }
 
+/**
+ * sof_parse_word_tokens - Parse multiple sets of tokens
+ * @scomp: pointer to soc component
+ * @object: target ipc struct for parsed values
+ * @offset: offset within the object pointer
+ * @tokens: array of struct sof_topology_token containing the tokens to be matched
+ * @num_tokens: number of tokens in tokens array
+ * @array: source pointer to consecutive vendor arrays in topology
+ *
+ * This function parses multiple sets of word type tokens in vendor arrays
+ */
 static int sof_parse_word_tokens(struct snd_soc_component *scomp,
-				 void *object,
-				 const struct sof_topology_token *tokens,
-				 int count,
-				 struct snd_soc_tplg_vendor_array *array,
-				 size_t offset)
+				  void *object, int offset,
+				  const struct sof_topology_token *tokens, int num_tokens,
+				  struct snd_soc_tplg_vendor_array *array)
 {
 	struct snd_soc_tplg_vendor_value_elem *elem;
 	int found = 0;
@@ -894,7 +921,7 @@ static int sof_parse_word_tokens(struct snd_soc_component *scomp,
 		elem = &array->value[i];
 
 		/* search for token */
-		for (j = 0; j < count; j++) {
+		for (j = 0; j < num_tokens; j++) {
 			/* match token type */
 			if (!(tokens[j].type == SND_SOC_TPLG_TUPLE_TYPE_WORD ||
 			      tokens[j].type == SND_SOC_TPLG_TUPLE_TYPE_SHORT ||
@@ -907,8 +934,7 @@ static int sof_parse_word_tokens(struct snd_soc_component *scomp,
 				continue;
 
 			/* load token */
-			tokens[j].get_token(elem, object,
-					    offset + tokens[j].offset);
+			tokens[j].get_token(elem, object, offset + tokens[j].offset);
 
 			found++;
 		}
@@ -964,19 +990,19 @@ static int sof_parse_token_sets(struct snd_soc_component *scomp,
 		/* call correct parser depending on type */
 		switch (le32_to_cpu(array->type)) {
 		case SND_SOC_TPLG_TUPLE_TYPE_UUID:
-			found += sof_parse_uuid_tokens(scomp, object, tokens,
-						       count, array, offset);
+			found += sof_parse_uuid_tokens(scomp, object, offset, tokens, count,
+						       array);
 			break;
 		case SND_SOC_TPLG_TUPLE_TYPE_STRING:
-			found += sof_parse_string_tokens(scomp, object, tokens,
-							 count, array, offset);
+			found += sof_parse_string_tokens(scomp, object, offset, tokens, count,
+							 array);
 			break;
 		case SND_SOC_TPLG_TUPLE_TYPE_BOOL:
 		case SND_SOC_TPLG_TUPLE_TYPE_BYTE:
 		case SND_SOC_TPLG_TUPLE_TYPE_WORD:
 		case SND_SOC_TPLG_TUPLE_TYPE_SHORT:
-			found += sof_parse_word_tokens(scomp, object, tokens,
-						       count, array, offset);
+			found += sof_parse_word_tokens(scomp, object, offset, tokens, count,
+						       array);
 			break;
 		default:
 			dev_err(scomp->dev, "error: unknown token type %d\n",
-- 
2.25.1

