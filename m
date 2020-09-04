Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD0C25DA12
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 15:39:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA0E41EDE;
	Fri,  4 Sep 2020 15:38:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA0E41EDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599226753;
	bh=mG1xSbF+WCtu2zxxsWgj/h9+hEwijWLCyNnW4CEVgJM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uvJf+cqHoFeteZ+UeJMrod/9ifKmnc9uJrRJnXEO6EYWedlQrHWHQcEbMZqOaT5Wt
	 V7JZ9IPN1eG+zxlf13AXA6eeY42glm4qCTBrUxSSBvNPtTKijW+EfGEXian0UQN1K9
	 Ryaj4ar5JMpC5U2ZGjvfKPubfeP4oeIrLFiGh64k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2B36F80349;
	Fri,  4 Sep 2020 15:30:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEC4AF80332; Fri,  4 Sep 2020 15:30:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6C90F8031A
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 15:30:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6C90F8031A
IronPort-SDR: 7zRB8BwIDTARXF6aAgHMv7Q2AL7W+ZfsbXQscrhoy/h0l37KffrK3ThK8qcD7biXyZ1ODbX0+k
 Ze+xSK8NzB1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="157002904"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="157002904"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:30:03 -0700
IronPort-SDR: 6cbZEFoC7TViTnry+LrhvJ20GJOGjsWEY37Pp0z0hZ79v7RKJnHy5ZcxqFXnwkBUi4fqwEgWG/
 lUPHscBlIybg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="284416789"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2020 06:30:01 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 16/16] ASoC: SOF: topology: make process type optional
Date: Fri,  4 Sep 2020 16:27:44 +0300
Message-Id: <20200904132744.1699575-17-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
References: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, Curtis Malainey <curtis@malainey.com>,
 Keyon Jie <yang.jie@linux.intel.com>, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

From: Keyon Jie <yang.jie@linux.intel.com>

As components can be now identified with a UUID based mechanism, the
process type is no longer required. For new DSP components, process and
its component type can be set to SOF_PROCESS_NONE and SOF_COMP_NONE.
Allow this combination in topology load, modify the load time check for
process type to reflect this.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Curtis Malainey <curtis@malainey.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/topology.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 69865df60033..49fae48961a9 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2197,12 +2197,6 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 	int ret;
 	int i;
 
-	if (type == SOF_COMP_NONE) {
-		dev_err(scomp->dev, "error: invalid process comp type %d\n",
-			type);
-		return -EINVAL;
-	}
-
 	/* allocate struct for widget control data sizes and types */
 	if (widget->num_kcontrols) {
 		wdata = kcalloc(widget->num_kcontrols,
-- 
2.27.0

