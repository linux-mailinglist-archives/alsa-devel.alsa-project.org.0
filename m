Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 001801AB2A4
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:43:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 999BE167B;
	Wed, 15 Apr 2020 22:43:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 999BE167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586983438;
	bh=NiNFEi4w0IgYGzRBRvd4XoA0gBJkpX2R+DfLvPEL/i8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vft4x1KhtJs+a/N+J/eOdOoqwfkcWa2y7LkSBF/ZXwGT+NUyV5bROHv96Hjq/2z+N
	 irs2nVHCgFSuhUsgvkwFKyU8ihZsmQNvPxOH6RN4LamlTyoD8ebaniJcp7gvJ0sAHq
	 WekjW0OpPdEkPdYhWGs0d7qmitPFlt61MDPmeyBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58723F8036B;
	Wed, 15 Apr 2020 22:29:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37160F80303; Wed, 15 Apr 2020 22:29:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDC07F802E9
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDC07F802E9
IronPort-SDR: yfKHmNLf6AgOKwZMrKnGT9gt3O46BC8g/jompYdRRslR3ZjWjxetBsxwvW5abpcYuya2SpkfCS
 gKXECR/cV2NQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:29:24 -0700
IronPort-SDR: YzChBrrvbSnFGAOIfpXMTDqq9+1Hq4kFRAsn3DXQH9WpmhGbYna5l5/ZrO0bjJbvDVuNjDkVgT
 YOPqyt8MWaCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656347"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:29:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 23/24] ASoC: SOF: topology: stop parsing when all tokens have
 been found
Date: Wed, 15 Apr 2020 15:28:15 -0500
Message-Id: <20200415202816.934-24-pierre-louis.bossart@linux.intel.com>
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

Optimize the parsing so that it will stop after all required tokens
have been found as there is no reason to continue after that.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 60 +++++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index a1287924a12d..d4d0c39d6e6e 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -769,13 +769,14 @@ static const struct sof_topology_token led_tokens[] = {
 	 get_token_u32, offsetof(struct snd_sof_led_control, direction), 0},
 };
 
-static void sof_parse_uuid_tokens(struct snd_soc_component *scomp,
-				  void *object,
-				  const struct sof_topology_token *tokens,
-				  int count,
-				  struct snd_soc_tplg_vendor_array *array)
+static int sof_parse_uuid_tokens(struct snd_soc_component *scomp,
+				 void *object,
+				 const struct sof_topology_token *tokens,
+				 int count,
+				 struct snd_soc_tplg_vendor_array *array)
 {
 	struct snd_soc_tplg_vendor_uuid_elem *elem;
+	int found = 0;
 	int i, j;
 
 	/* parse element by element */
@@ -795,17 +796,22 @@ static void sof_parse_uuid_tokens(struct snd_soc_component *scomp,
 			/* matched - now load token */
 			tokens[j].get_token(elem, object, tokens[j].offset,
 					    tokens[j].size);
+
+			found++;
 		}
 	}
+
+	return found;
 }
 
-static void sof_parse_string_tokens(struct snd_soc_component *scomp,
-				    void *object,
-				    const struct sof_topology_token *tokens,
-				    int count,
-				    struct snd_soc_tplg_vendor_array *array)
+static int sof_parse_string_tokens(struct snd_soc_component *scomp,
+				   void *object,
+				   const struct sof_topology_token *tokens,
+				   int count,
+				   struct snd_soc_tplg_vendor_array *array)
 {
 	struct snd_soc_tplg_vendor_string_elem *elem;
+	int found = 0;
 	int i, j;
 
 	/* parse element by element */
@@ -825,19 +831,24 @@ static void sof_parse_string_tokens(struct snd_soc_component *scomp,
 			/* matched - now load token */
 			tokens[j].get_token(elem, object, tokens[j].offset,
 					    tokens[j].size);
+
+			found++;
 		}
 	}
+
+	return found;
 }
 
-static void sof_parse_word_tokens(struct snd_soc_component *scomp,
-				  void *object,
-				  const struct sof_topology_token *tokens,
-				  int count,
-				  struct snd_soc_tplg_vendor_array *array)
+static int sof_parse_word_tokens(struct snd_soc_component *scomp,
+				 void *object,
+				 const struct sof_topology_token *tokens,
+				 int count,
+				 struct snd_soc_tplg_vendor_array *array)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_vendor_value_elem *elem;
 	size_t size = sizeof(struct sof_ipc_dai_dmic_pdm_ctrl);
+	int found = 0;
 	int i, j;
 	u32 offset;
 	u32 *index = NULL;
@@ -897,8 +908,12 @@ static void sof_parse_word_tokens(struct snd_soc_component *scomp,
 			tokens[j].get_token(elem, object,
 					    offset + tokens[j].offset,
 					    tokens[j].size);
+
+			found++;
 		}
 	}
+
+	return found;
 }
 
 static int sof_parse_tokens(struct snd_soc_component *scomp,
@@ -908,9 +923,10 @@ static int sof_parse_tokens(struct snd_soc_component *scomp,
 			    struct snd_soc_tplg_vendor_array *array,
 			    int priv_size)
 {
+	int found = 0;
 	int asize;
 
-	while (priv_size > 0) {
+	while (priv_size > 0 && found < count) {
 		asize = le32_to_cpu(array->size);
 
 		/* validate asize */
@@ -931,19 +947,19 @@ static int sof_parse_tokens(struct snd_soc_component *scomp,
 		/* call correct parser depending on type */
 		switch (le32_to_cpu(array->type)) {
 		case SND_SOC_TPLG_TUPLE_TYPE_UUID:
-			sof_parse_uuid_tokens(scomp, object, tokens, count,
-					      array);
+			found += sof_parse_uuid_tokens(scomp, object, tokens,
+						       count, array);
 			break;
 		case SND_SOC_TPLG_TUPLE_TYPE_STRING:
-			sof_parse_string_tokens(scomp, object, tokens, count,
-						array);
+			found += sof_parse_string_tokens(scomp, object, tokens,
+							 count, array);
 			break;
 		case SND_SOC_TPLG_TUPLE_TYPE_BOOL:
 		case SND_SOC_TPLG_TUPLE_TYPE_BYTE:
 		case SND_SOC_TPLG_TUPLE_TYPE_WORD:
 		case SND_SOC_TPLG_TUPLE_TYPE_SHORT:
-			sof_parse_word_tokens(scomp, object, tokens, count,
-					      array);
+			found += sof_parse_word_tokens(scomp, object, tokens,
+						       count, array);
 			break;
 		default:
 			dev_err(scomp->dev, "error: unknown token type %d\n",
-- 
2.20.1

