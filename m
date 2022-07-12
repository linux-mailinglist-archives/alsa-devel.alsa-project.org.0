Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA359571A2B
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 14:39:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DE311672;
	Tue, 12 Jul 2022 14:38:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DE311672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657629568;
	bh=ybrg/LabNwAtguckYL8zo+9pDhIdyMF3KNL6QppL05k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OWuTyJle6b8XnvN761WHFDrdBxj+WEaFT5azmEaR31R24JURp9xo4mYWt4jovI9sT
	 7PoxcOznyVtmXy9kETNJzXsk+oWjUotPQMFrU+7bypdx4TeJz4An8KrRQax51IrIvt
	 MRo594h/a6ovU3i7P0VZYiH+d77/idgzgcgKU22c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7FC4F80279;
	Tue, 12 Jul 2022 14:38:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18D0DF800BD; Tue, 12 Jul 2022 14:38:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C228F800BD
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 14:38:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C228F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CV3+2V4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657629500; x=1689165500;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ybrg/LabNwAtguckYL8zo+9pDhIdyMF3KNL6QppL05k=;
 b=CV3+2V4eWB2VJlXeg8j7sLZd2E7M43z6A5M3T0n9ddrOzEboLyFPyIIJ
 IDSLssc9O2W+LpH4dJHLDGQCbZkvr6BNQymytLg2p6AUtwfqcGnpILo0O
 VSSYwvAC2RvVlhgUP+R66tGlyWGzFL5EBxFML0Q+oGe6vK5wpoJ5ewdvb
 ttnvEC4HrnSqlq6wUkmycYo/Zxj6g1cN16Vot+Ui8GhJ1XybLzJCNB2Mg
 64ZqJ2n54QWT1ZsXSqchmc8bqH8TmRski6UfOluPfztUEGIi5MWa9pALC
 eIsd9lWAedH54APCu8aiDuGIFiiOsZ6YnqdZbu+FsVwV17ABGafGjI3FI Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="283675933"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="283675933"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 05:38:16 -0700
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="922182570"
Received: from ahedstro-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.175])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 05:38:14 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: topology: remove unused variable
Date: Tue, 12 Jul 2022 15:39:02 +0300
Message-Id: <20220712123902.14696-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

'ret' is never used. Remove it and return 0 instead.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 7e54eb1bf77b..9273a70fec25 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1419,7 +1419,6 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 	struct soc_bytes_ext *sbe;
 	struct snd_sof_dai *dai;
 	struct soc_enum *se;
-	int ret = 0;
 	int i;
 
 	swidget = dobj->private;
@@ -1480,7 +1479,7 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 	list_del(&swidget->list);
 	kfree(swidget);
 
-	return ret;
+	return 0;
 }
 
 /*
-- 
2.37.0

