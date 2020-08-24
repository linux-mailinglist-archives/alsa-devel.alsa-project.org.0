Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC422509D0
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Aug 2020 22:12:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9E1E168B;
	Mon, 24 Aug 2020 22:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9E1E168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598299936;
	bh=GB5ftGGn4TxE3ex8yYPyH4Ez6c/gxp1v3SGWXv77P7A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vPS91FHUrmm8sI1LeCo+c+PYGfaScEckysJ4xPbfpJgRhBCsARUq5AFmdXszLHKQ+
	 bwse1fbM1a/ipDilz1iS6BjlcJzGJUSDGnksfJCn9hJXVS8Rgb27rnvzWwI59edJQH
	 Yirl5ee0xR+m3IhIHUOhy2VNVjysrpdn377SJMRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8D19F802DC;
	Mon, 24 Aug 2020 22:09:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DFC2F802C2; Mon, 24 Aug 2020 22:09:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFEA5F801EC
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 22:09:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFEA5F801EC
IronPort-SDR: w9Liju9UQzl0/bO9AXpGJKHtHrGe/4vm7uI7uBvpFGXr4Z8KK4pn8nBQd8B8TtxIRyWb8E7AqE
 wfElYlTtyrJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="157033727"
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; d="scan'208";a="157033727"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 13:09:24 -0700
IronPort-SDR: QN/m0Malu6nHKIu92Cuu5siflwaAPB77aJC9EU94ivcacQBmf5Z6584VG5/13ev6kn7J11wbHt
 ywlT6EOTPGYg==
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; d="scan'208";a="443351189"
Received: from dentoneb-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.223.13])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 13:09:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/8] ASoC: SOF: topology: remove unnecessary memory alloc for
 sdev->private
Date: Mon, 24 Aug 2020 15:09:07 -0500
Message-Id: <20200824200912.46852-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200824200912.46852-1-pierre-louis.bossart@linux.intel.com>
References: <20200824200912.46852-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Looks like it was left over from the previous implementation of
DMIC PDM token parsing. It is not used anymore.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 3b4e09089643..36dc87514dce 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2944,14 +2944,6 @@ static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 		return ret;
 	}
 
-	/*
-	 * alloc memory for private member
-	 * Used to track the pdm config array index currently being parsed
-	 */
-	sdev->private = kzalloc(sizeof(u32), GFP_KERNEL);
-	if (!sdev->private)
-		return -ENOMEM;
-
 	/* get DMIC PDM tokens */
 	ret = sof_parse_token_sets(scomp, &config->dmic.pdm[0], dmic_pdm_tokens,
 			       ARRAY_SIZE(dmic_pdm_tokens), private->array,
@@ -2962,7 +2954,7 @@ static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 	if (ret != 0) {
 		dev_err(scomp->dev, "error: parse dmic pdm tokens failed %d\n",
 			le32_to_cpu(private->size));
-		goto err;
+		return ret;
 	}
 
 	/* set IPC header size */
@@ -3007,9 +2999,6 @@ static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 		dev_err(scomp->dev, "error: failed to save DAI config for DMIC%d\n",
 			config->dai_index);
 
-err:
-	kfree(sdev->private);
-
 	return ret;
 }
 
-- 
2.25.1

