Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D65F4D0636
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 19:17:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8DE517E9;
	Mon,  7 Mar 2022 19:17:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8DE517E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646677077;
	bh=scbGiTy6fmadYaIGjLgmz4sDbgfeN2rLNb6RB+CCOEg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pn8HpFcQq9Ni+4+fML1tKb+0+U34dmS2/Ls0xvweSB55raZdQXbp4ktHWzm7szXAv
	 KlC3NecIf1AsOW9UdBIslSJFEoJlKB7bUXYVxYkdPVgVYQB7K6jXxBI5gnBI7RMEP1
	 MGGW6oyGLpoa+iF1eg6bZVDQHptHuVUXN6wcX+cY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43643F805BF;
	Mon,  7 Mar 2022 19:11:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 678ABF80566; Mon,  7 Mar 2022 19:11:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94FC1F80515
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 19:11:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94FC1F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Jvp27R3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646676703; x=1678212703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=scbGiTy6fmadYaIGjLgmz4sDbgfeN2rLNb6RB+CCOEg=;
 b=Jvp27R3UYRQ/OxXsEepAG+TjjPSnkHtAEByLzZCzl6fXg9tHnJsrvOps
 frU/9+tAcz3kl2zsmOLJpcMBvdn6mkeq+CIn+wCwpauMKKyMb4Wusbud9
 Op8Ug2LADdSXw4BO3Civ1dRYXxbXtjMUFAH6XEH/WK9t1jjl8RJyirnjd
 Z3i6/38eMb/EHuojmLXvkILA6uL/tUZRPmrigQo6bZAt/EUOJP/YEjb41
 EG107tzpWVyFbGCtb5ndG1xWFwYmcUOPBUPjlGDG4uK6e6bkrHmYDYWQj
 TiLU3RcIyBQE+cn3Tw5ztnwkYRmcU8TCw5SOtuYlgsOP4OGqFyMLC6GJU g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254401356"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254401356"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:30 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="495146687"
Received: from echun1-mobl.amr.corp.intel.com (HELO rsridh2-mobl1.localdomain)
 ([10.251.130.219])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:29 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 16/18] ASoC: SOF: topology: Rename arguments in
 sof_parse_tokens()
Date: Mon,  7 Mar 2022 10:11:09 -0800
Message-Id: <20220307181111.49392-17-ranjani.sridharan@linux.intel.com>
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

Rename the count and priv_size arguments in sof_parse_tokens() and add
comments to clarify the arguments.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index b96ecef43284..71de61255779 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1024,12 +1024,23 @@ static int sof_parse_token_sets(struct snd_soc_component *scomp,
 	return 0;
 }
 
-static int sof_parse_tokens(struct snd_soc_component *scomp,
-			    void *object,
-			    const struct sof_topology_token *tokens,
-			    int count,
+/**
+ * sof_parse_tokens - Parse one set of tokens
+ * @scomp: pointer to soc component
+ * @object: target ipc struct for parsed values
+ * @tokens: token definition array describing what tokens to parse
+ * @num_tokens: number of tokens in definition array
+ * @array: source pointer to consecutive vendor arrays in topology
+ * @array_size: total size of @array
+ *
+ * This function parses a single set of tokens in vendor arrays into
+ * consecutive ipc structs.
+ */
+static int sof_parse_tokens(struct snd_soc_component *scomp,  void *object,
+			    const struct sof_topology_token *tokens, int num_tokens,
 			    struct snd_soc_tplg_vendor_array *array,
-			    int priv_size)
+			    int array_size)
+
 {
 	/*
 	 * sof_parse_tokens is used when topology contains only a single set of
@@ -1037,8 +1048,8 @@ static int sof_parse_tokens(struct snd_soc_component *scomp,
 	 * sof_parse_token_sets are sets = 1 (only 1 set) and
 	 * object_size = 0 (irrelevant).
 	 */
-	return sof_parse_token_sets(scomp, object, tokens, count, array,
-				    priv_size, 1, 0);
+	return sof_parse_token_sets(scomp, object, tokens, num_tokens, array,
+				    array_size, 1, 0);
 }
 
 static void sof_dbg_comp_config(struct snd_soc_component *scomp,
-- 
2.25.1

