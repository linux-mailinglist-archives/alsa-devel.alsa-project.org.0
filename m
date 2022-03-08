Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2176C4D1DAB
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 17:46:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A88B917D6;
	Tue,  8 Mar 2022 17:45:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A88B917D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646757977;
	bh=fXcFULdqt+D/S6yF+zMVLy1Q5LKKkVcSWG3r1TH3Ing=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m1kPMBgnm3oVDtCN0MQoW0fkgAfb7m/lO0VgceDWXUiCvVduBq3Ul1ekIVWC6bF19
	 F7Dvckp06rxFUrHRR4WMvj2g7DBJeR8/HISzvzSY48tgv9P07wRUS5q/044iX0jDfQ
	 jUE0XaLQ2pDySSTBabjjQ0E6K0J3a0WQCqhDnddQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA490F8052F;
	Tue,  8 Mar 2022 17:44:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD060F80527; Tue,  8 Mar 2022 17:44:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F8FFF8026A
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 17:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F8FFF8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ezL9+l2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646757845; x=1678293845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fXcFULdqt+D/S6yF+zMVLy1Q5LKKkVcSWG3r1TH3Ing=;
 b=ezL9+l2c/pfylwWHEtcOJeTK6hJ5GHc2QL4NAOsz3/58B+He2mLleKeg
 IlB3+G1wBCB9CJoX+gZUEvyz4rZCsrajO5Kc6GINNnuOhpN2OUaXT/1oR
 xHUe5SvkA/s9tLFYqF/IwwVyMheAPlfChQP1lQzj+aMkCMR/Okk+zzc9A
 KwZUegSaX6K52HkQB+MD9iaNIMgH2ISA8P8HkK2S6PXF84Vb072OQ6YWO
 9d7R8/wouwPod5+9qw6NHAxKVlqis4NMsZ8PaKf0f6X95LvN3vWPIvqye
 7Dj0mromLpbObrkHV9wEVfV5OXJud7LNzwQ2ffKA9+Km/JeKB00V0RD9M g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="341166847"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="341166847"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:58 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="537633272"
Received: from bustam3x-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.251.130.225])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:58 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 15/18] ASoC: SOF: topology: Rename arguments in
 sof_parse_token_sets()
Date: Tue,  8 Mar 2022 08:43:41 -0800
Message-Id: <20220308164344.577647-16-ranjani.sridharan@linux.intel.com>
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

Rename the priv_size arg to array_size and clarify the arguments in the
comments.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 8b2c01f45b72..0683b7d812eb 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -949,27 +949,26 @@ static int sof_parse_word_tokens(struct snd_soc_component *scomp,
  * @object: target ipc struct for parsed values
  * @tokens: token definition array describing what tokens to parse
  * @count: number of tokens in definition array
- * @array: source pointer to consecutive vendor arrays to be parsed
- * @priv_size: total size of the consecutive source arrays
- * @sets: number of similar token sets to be parsed, 1 set has count elements
+ * @array: source pointer to consecutive vendor arrays in topology
+ * @array_size: total size of @array
+ * @token_instance_num: number of times the same tokens needs to be parsed i.e. the function
+ *			looks for @token_instance_num of each token in the @tokens
  * @object_size: offset to next target ipc struct with multiple sets
  *
  * This function parses multiple sets of tokens in vendor arrays into
  * consecutive ipc structs.
  */
 static int sof_parse_token_sets(struct snd_soc_component *scomp,
-				void *object,
-				const struct sof_topology_token *tokens,
-				int count,
-				struct snd_soc_tplg_vendor_array *array,
-				int priv_size, int sets, size_t object_size)
+				void *object, const struct sof_topology_token *tokens,
+				int count, struct snd_soc_tplg_vendor_array *array,
+				int array_size, int token_instance_num, size_t object_size)
 {
 	size_t offset = 0;
 	int found = 0;
 	int total = 0;
 	int asize;
 
-	while (priv_size > 0 && total < count * sets) {
+	while (array_size > 0 && total < count * token_instance_num) {
 		asize = le32_to_cpu(array->size);
 
 		/* validate asize */
@@ -980,8 +979,8 @@ static int sof_parse_token_sets(struct snd_soc_component *scomp,
 		}
 
 		/* make sure there is enough data before parsing */
-		priv_size -= asize;
-		if (priv_size < 0) {
+		array_size -= asize;
+		if (array_size < 0) {
 			dev_err(scomp->dev, "error: invalid array size 0x%x\n",
 				asize);
 			return -EINVAL;
-- 
2.25.1

