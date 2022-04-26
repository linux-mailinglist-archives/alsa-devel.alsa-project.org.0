Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 002E451054F
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:22:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85C0D190A;
	Tue, 26 Apr 2022 19:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85C0D190A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650993771;
	bh=QSYk3YRRBgeJFO4e8u2ivNlK/k6SwlubtQU9W63iYIU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fioCH0LGiTk+Dlwjiez6wb+y1w86tW4oGi0fh3IC6XavgAa1kI0FVW8aHQKjEq932
	 bchfM+dz8ECxAUSg079dWVYeoK2jhk4T2VW4Fimw32fG/ecYrCIjzBbBX/AQcOt6wq
	 00sXQ7OOqJQxg7xd+r6/g1+m5S57Sm3EvjAdeC9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D16FF80553;
	Tue, 26 Apr 2022 19:18:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49408F80538; Tue, 26 Apr 2022 19:18:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4029F80534
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4029F80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WE7U+ebQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650993484; x=1682529484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QSYk3YRRBgeJFO4e8u2ivNlK/k6SwlubtQU9W63iYIU=;
 b=WE7U+ebQ+ns0BmyyfuUYg1cXJ2D6DwuOzIKgOacTFtk36Pv4AMCOapHP
 92z8U0/df1qaQxdtFjlQs1O8B4WF9N5YIgwU7xcLXgfb5w+/BGWHmZdBf
 2lqp8ZncrwJEZYIHsA8StvuyGQUbmnMA9rf+jsu8762RHWAdAtofYCm8o
 6FD1nYZXEW/7KfRFBmEUq9x8BAaK6iVhQspikeY1I7cK50AnJTSBGPbm3
 7Z4b1L8QwLNfVA0o6FoaHw85fr8lHSlouVZbwLZWLB/jAhk6RSA6W1pqK
 prm+CUgPPEAj0R7qRCyEGEIRYAmCM2GwLCj8epc14qQkjDONGX/YCwaP9 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="290807978"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="290807978"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:51 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="558431220"
Received: from shashinx-mobl.gar.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.0.53])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:51 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/11] ASoC: SOF: topology: Skip parsing DAI link tokens if
 not needed
Date: Tue, 26 Apr 2022 10:17:41 -0700
Message-Id: <20220426171743.171061-10-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
References: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

Do not parse these tokens if they are not defined in the IPC version
specific token list. In the case of IPC4 with HDA topologies for
example, no DAI link specific tokens need to be added in topology.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/topology.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 739f343010fc..b1fcab7ce48e 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1721,14 +1721,16 @@ static int sof_link_load(struct snd_soc_component *scomp, int index, struct snd_
 		return -ENOMEM;
 	}
 
-	/* parse one set of DAI link tokens */
-	ret = sof_copy_tuples(sdev, private->array, le32_to_cpu(private->size),
-			      SOF_DAI_LINK_TOKENS, 1, slink->tuples,
-			      num_tuples, &slink->num_tuples);
-	if (ret < 0) {
-		dev_err(scomp->dev, "failed to parse %s for dai link %s\n",
-			token_list[SOF_DAI_LINK_TOKENS].name, link->name);
-		goto err;
+	if (token_list[SOF_DAI_LINK_TOKENS].tokens) {
+		/* parse one set of DAI link tokens */
+		ret = sof_copy_tuples(sdev, private->array, le32_to_cpu(private->size),
+				      SOF_DAI_LINK_TOKENS, 1, slink->tuples,
+				      num_tuples, &slink->num_tuples);
+		if (ret < 0) {
+			dev_err(scomp->dev, "failed to parse %s for dai link %s\n",
+				token_list[SOF_DAI_LINK_TOKENS].name, link->name);
+			goto err;
+		}
 	}
 
 	/* nothing more to do if there are no DAI type-specific tokens defined */
-- 
2.25.1

