Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7858DEF0CD
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 23:51:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 125D81718;
	Mon,  4 Nov 2019 23:50:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 125D81718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572907895;
	bh=2+TuoiavilIU+7NNEMeb9rjUBvNHP2lRmw+Jnlg+rPA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V43kNLLo8DgsBAgnva+p2Np5gkuELJes5xiotEfLjmGfqWP0CTPEYo0f+J8N1Xj29
	 vWkq4C1+WMVY9OQAXREallq1JMw1L9iul0hU5RSsafw2M+kEOFwAH0CyOn8toQB9g6
	 p8kR6UFb1oMs9xlbi60ND3uKiIejy0yGKXSHSwIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66DACF8060D;
	Mon,  4 Nov 2019 23:48:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4411EF80600; Mon,  4 Nov 2019 23:48:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C58B6F8015B
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 23:48:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C58B6F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 14:48:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,268,1569308400"; d="scan'208";a="195616736"
Received: from njdenler-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.94.55])
 by orsmga008.jf.intel.com with ESMTP; 04 Nov 2019 14:48:09 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  4 Nov 2019 14:48:12 -0800
Message-Id: <20191104224812.3393-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104224812.3393-1-ranjani.sridharan@linux.intel.com>
References: <20191104224812.3393-1-ranjani.sridharan@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v2 2/2] ASoC: SOF: topology: set trigger order
	for FE DAI link
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

Set trigger order for FE DAI links to SND_SOC_DPCM_TRIGGER_POST
to trigger the BE DAI's before the FE DAI's. This prevents the
xruns seen on playback pipelines using the link DMA.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index e0e2ae734632..e7076692119b 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2951,6 +2951,10 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 	if (!link->no_pcm) {
 		link->nonatomic = true;
 
+		/* set trigger order */
+		link->trigger[0] = SND_SOC_DPCM_TRIGGER_POST;
+		link->trigger[1] = SND_SOC_DPCM_TRIGGER_POST;
+
 		/* nothing more to do for FE dai links */
 		return 0;
 	}
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
