Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9304C4D0623
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 19:16:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27B051696;
	Mon,  7 Mar 2022 19:15:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27B051696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646676983;
	bh=6nf6gjhKmCGxdmmQo1nS6ppCfQdNpjonM7KFNAfKu7I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qxvC8oerxVLZBSxzLiwCazYEPGs+zm1Nn6M8N8vQyD9r0VzibpbrXHHs6t8APfAFW
	 cSFqAu2jF/YqNWpaoanstzjrjCT5NaUz2LLxu/Q2WsOhKp0TKn3VwcbaQj1g9VYUlA
	 8l9zP5v/cA2YtQMO4ZmiCQg1KueR02bBHyWjApwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5326F80571;
	Mon,  7 Mar 2022 19:11:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC627F8054A; Mon,  7 Mar 2022 19:11:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39CEBF8020D
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 19:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39CEBF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Vc54vmQI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646676700; x=1678212700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6nf6gjhKmCGxdmmQo1nS6ppCfQdNpjonM7KFNAfKu7I=;
 b=Vc54vmQIuF27TBZ1S0tscKPHOaJnFG3vMZEx8OntfFtmJ+FfyscgNLF3
 kAr+rHWvA1CEf5V6stmv6px6MrAn29eD0YuMnT+sYXeLfN87NWSY/oSzk
 lnf5CX+6axrYw84oXzeWQToZbV3kpXb5HWnVZGG2MRY4576EhFWKJBYyP
 LFPoqwf2CdrrigZzTOqD0/wWxsCTsLgrz79nLPhtt5i1MUbHsat5ok/7B
 HUFdQE5iLpV8CzDYB9QUD5Snq0w9pCsYhCShemDwu/QzXipTshlPYcSld
 cTz3wZ4LjOeTV17JVhttpxl3bOgTHeZHepPp+lwdkk1wFtVzQER+lxtAC Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254401344"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254401344"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:29 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="495146686"
Received: from echun1-mobl.amr.corp.intel.com (HELO rsridh2-mobl1.localdomain)
 ([10.251.130.219])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:29 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 15/18] ASoC: SOF: topology: Rename arguments in
 sof_parse_token_sets()
Date: Mon,  7 Mar 2022 10:11:08 -0800
Message-Id: <20220307181111.49392-16-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
References: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
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
index 4710a7e3f40a..b96ecef43284 100644
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

