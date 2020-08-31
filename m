Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC68258532
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 03:39:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 286441753;
	Tue,  1 Sep 2020 03:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 286441753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598924383;
	bh=22ta/4+9hk70a0xdubH6aV9cHtZIM/89KtRdeWBdvGo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ruRvkJJdCspSB/3s1FtCGErnrYkaqRIqZ0wpMgGaaKBixcwSfQ4PV2ruaUqme4qMS
	 Te4Ly6IqIaOvIEcMGoDmGCBs+b91YZ64k9t2KgIPL7xemGif5cEhW41nrbfVWMnnBJ
	 YCsX/DyGKQMOj6RHoMTU06DWDyP4Q9ja0nvSzM8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E1FFF8021D;
	Tue,  1 Sep 2020 03:37:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC480F8021D; Tue,  1 Sep 2020 03:37:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58EDDF801EB
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 03:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58EDDF801EB
IronPort-SDR: nwUg05Ud+z0wcGhvYdQbFV9pMO6q8QOCF+aP94kkyeF4iiV9SVQf9ttCvgnzs3mkZwjY63i0dk
 WC+SVv8yxOvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="157090506"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="157090506"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 18:37:09 -0700
IronPort-SDR: RQC9SIDPAchTniEYKy2+rhW87zy1XH1PiVe8qO79TuSbA8KDY5dwHDPxqvVoVyXdsOMznx1rvc
 egEv1ctohclA==
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="476984112"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 18:37:04 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v4 1/3] ASoC: codecs: soundwire: remove port_ready[] usage
 from codecs.
Date: Mon, 31 Aug 2020 21:43:16 +0800
Message-Id: <20200831134318.11443-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200831134318.11443-1-yung-chuan.liao@linux.intel.com>
References: <20200831134318.11443-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

port_ready will be changed to a fixed array in sdw.h and all initialization
work will be done at soundwire side in the following patch. So remove them
from codec drivers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/max98373-sdw.c | 15 +--------------
 sound/soc/codecs/rt1308-sdw.c   | 14 +-------------
 sound/soc/codecs/rt5682-sdw.c   | 15 +--------------
 sound/soc/codecs/rt700-sdw.c    | 15 +--------------
 sound/soc/codecs/rt711-sdw.c    | 15 +--------------
 sound/soc/codecs/rt715-sdw.c    | 33 +--------------------------------
 6 files changed, 6 insertions(+), 101 deletions(-)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index 5fe724728e84..a3ec92775ea7 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -282,7 +282,7 @@ static const struct dev_pm_ops max98373_pm = {
 static int max98373_read_prop(struct sdw_slave *slave)
 {
 	struct sdw_slave_prop *prop = &slave->prop;
-	int nval, i, num_of_ports;
+	int nval, i;
 	u32 bit;
 	unsigned long addr;
 	struct sdw_dpn_prop *dpn;
@@ -295,7 +295,6 @@ static int max98373_read_prop(struct sdw_slave *slave)
 	prop->clk_stop_timeout = 20;
 
 	nval = hweight32(prop->source_ports);
-	num_of_ports = nval;
 	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
 					  sizeof(*prop->src_dpn_prop),
 					  GFP_KERNEL);
@@ -315,7 +314,6 @@ static int max98373_read_prop(struct sdw_slave *slave)
 
 	/* do this again for sink now */
 	nval = hweight32(prop->sink_ports);
-	num_of_ports += nval;
 	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
 					   sizeof(*prop->sink_dpn_prop),
 					   GFP_KERNEL);
@@ -333,17 +331,6 @@ static int max98373_read_prop(struct sdw_slave *slave)
 		i++;
 	}
 
-	/* Allocate port_ready based on num_of_ports */
-	slave->port_ready = devm_kcalloc(&slave->dev, num_of_ports,
-					 sizeof(*slave->port_ready),
-					 GFP_KERNEL);
-	if (!slave->port_ready)
-		return -ENOMEM;
-
-	/* Initialize completion */
-	for (i = 0; i < num_of_ports; i++)
-		init_completion(&slave->port_ready[i]);
-
 	/* set the timeout values */
 	prop->clk_stop_timeout = 20;
 
diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index b0ba0d2acbdd..09c69dbab12a 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -118,7 +118,7 @@ static int rt1308_clock_config(struct device *dev)
 static int rt1308_read_prop(struct sdw_slave *slave)
 {
 	struct sdw_slave_prop *prop = &slave->prop;
-	int nval, i, num_of_ports = 1;
+	int nval, i;
 	u32 bit;
 	unsigned long addr;
 	struct sdw_dpn_prop *dpn;
@@ -131,7 +131,6 @@ static int rt1308_read_prop(struct sdw_slave *slave)
 
 	/* for sink */
 	nval = hweight32(prop->sink_ports);
-	num_of_ports += nval;
 	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
 						sizeof(*prop->sink_dpn_prop),
 						GFP_KERNEL);
@@ -149,17 +148,6 @@ static int rt1308_read_prop(struct sdw_slave *slave)
 		i++;
 	}
 
-	/* Allocate port_ready based on num_of_ports */
-	slave->port_ready = devm_kcalloc(&slave->dev, num_of_ports,
-					sizeof(*slave->port_ready),
-					GFP_KERNEL);
-	if (!slave->port_ready)
-		return -ENOMEM;
-
-	/* Initialize completion */
-	for (i = 0; i < num_of_ports; i++)
-		init_completion(&slave->port_ready[i]);
-
 	/* set the timeout values */
 	prop->clk_stop_timeout = 20;
 
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 94bf6bee78e6..b7c97aba7f17 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -537,7 +537,7 @@ static int rt5682_update_status(struct sdw_slave *slave,
 static int rt5682_read_prop(struct sdw_slave *slave)
 {
 	struct sdw_slave_prop *prop = &slave->prop;
-	int nval, i, num_of_ports = 1;
+	int nval, i;
 	u32 bit;
 	unsigned long addr;
 	struct sdw_dpn_prop *dpn;
@@ -549,7 +549,6 @@ static int rt5682_read_prop(struct sdw_slave *slave)
 	prop->sink_ports = 0x2;		/* BITMAP: 00000010 */
 
 	nval = hweight32(prop->source_ports);
-	num_of_ports += nval;
 	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
 					  sizeof(*prop->src_dpn_prop),
 					  GFP_KERNEL);
@@ -569,7 +568,6 @@ static int rt5682_read_prop(struct sdw_slave *slave)
 
 	/* do this again for sink now */
 	nval = hweight32(prop->sink_ports);
-	num_of_ports += nval;
 	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
 					   sizeof(*prop->sink_dpn_prop),
 					   GFP_KERNEL);
@@ -587,17 +585,6 @@ static int rt5682_read_prop(struct sdw_slave *slave)
 		i++;
 	}
 
-	/* Allocate port_ready based on num_of_ports */
-	slave->port_ready = devm_kcalloc(&slave->dev, num_of_ports,
-					 sizeof(*slave->port_ready),
-					 GFP_KERNEL);
-	if (!slave->port_ready)
-		return -ENOMEM;
-
-	/* Initialize completion */
-	for (i = 0; i < num_of_ports; i++)
-		init_completion(&slave->port_ready[i]);
-
 	/* set the timeout values */
 	prop->clk_stop_timeout = 20;
 
diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 4d14048d1197..b19fbcc12c69 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -333,7 +333,7 @@ static int rt700_update_status(struct sdw_slave *slave,
 static int rt700_read_prop(struct sdw_slave *slave)
 {
 	struct sdw_slave_prop *prop = &slave->prop;
-	int nval, i, num_of_ports = 1;
+	int nval, i;
 	u32 bit;
 	unsigned long addr;
 	struct sdw_dpn_prop *dpn;
@@ -345,7 +345,6 @@ static int rt700_read_prop(struct sdw_slave *slave)
 	prop->sink_ports = 0xA; /* BITMAP:  00001010 */
 
 	nval = hweight32(prop->source_ports);
-	num_of_ports += nval;
 	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
 						sizeof(*prop->src_dpn_prop),
 						GFP_KERNEL);
@@ -365,7 +364,6 @@ static int rt700_read_prop(struct sdw_slave *slave)
 
 	/* do this again for sink now */
 	nval = hweight32(prop->sink_ports);
-	num_of_ports += nval;
 	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
 						sizeof(*prop->sink_dpn_prop),
 						GFP_KERNEL);
@@ -383,17 +381,6 @@ static int rt700_read_prop(struct sdw_slave *slave)
 		i++;
 	}
 
-	/* Allocate port_ready based on num_of_ports */
-	slave->port_ready = devm_kcalloc(&slave->dev, num_of_ports,
-					sizeof(*slave->port_ready),
-					GFP_KERNEL);
-	if (!slave->port_ready)
-		return -ENOMEM;
-
-	/* Initialize completion */
-	for (i = 0; i < num_of_ports; i++)
-		init_completion(&slave->port_ready[i]);
-
 	/* set the timeout values */
 	prop->clk_stop_timeout = 20;
 
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 45b928954b58..dc4a2b482462 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -337,7 +337,7 @@ static int rt711_update_status(struct sdw_slave *slave,
 static int rt711_read_prop(struct sdw_slave *slave)
 {
 	struct sdw_slave_prop *prop = &slave->prop;
-	int nval, i, num_of_ports = 1;
+	int nval, i;
 	u32 bit;
 	unsigned long addr;
 	struct sdw_dpn_prop *dpn;
@@ -349,7 +349,6 @@ static int rt711_read_prop(struct sdw_slave *slave)
 	prop->sink_ports = 0x8; /* BITMAP:  00001000 */
 
 	nval = hweight32(prop->source_ports);
-	num_of_ports += nval;
 	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
 						sizeof(*prop->src_dpn_prop),
 						GFP_KERNEL);
@@ -369,7 +368,6 @@ static int rt711_read_prop(struct sdw_slave *slave)
 
 	/* do this again for sink now */
 	nval = hweight32(prop->sink_ports);
-	num_of_ports += nval;
 	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
 						sizeof(*prop->sink_dpn_prop),
 						GFP_KERNEL);
@@ -387,17 +385,6 @@ static int rt711_read_prop(struct sdw_slave *slave)
 		i++;
 	}
 
-	/* Allocate port_ready based on num_of_ports */
-	slave->port_ready = devm_kcalloc(&slave->dev, num_of_ports,
-					sizeof(*slave->port_ready),
-					GFP_KERNEL);
-	if (!slave->port_ready)
-		return -ENOMEM;
-
-	/* Initialize completion */
-	for (i = 0; i < num_of_ports; i++)
-		init_completion(&slave->port_ready[i]);
-
 	/* set the timeout values */
 	prop->clk_stop_timeout = 20;
 
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index d11b23d6b240..d8ed07305ffc 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -431,7 +431,7 @@ static int rt715_update_status(struct sdw_slave *slave,
 static int rt715_read_prop(struct sdw_slave *slave)
 {
 	struct sdw_slave_prop *prop = &slave->prop;
-	int nval, i, num_of_ports = 1;
+	int nval, i;
 	u32 bit;
 	unsigned long addr;
 	struct sdw_dpn_prop *dpn;
@@ -443,7 +443,6 @@ static int rt715_read_prop(struct sdw_slave *slave)
 	prop->sink_ports = 0x0;	/* BITMAP:  00000000 */
 
 	nval = hweight32(prop->source_ports);
-	num_of_ports += nval;
 	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
 					sizeof(*prop->src_dpn_prop),
 					GFP_KERNEL);
@@ -460,36 +459,6 @@ static int rt715_read_prop(struct sdw_slave *slave)
 		i++;
 	}
 
-	/* do this again for sink now */
-	nval = hweight32(prop->sink_ports);
-	num_of_ports += nval;
-	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
-					sizeof(*prop->sink_dpn_prop),
-					GFP_KERNEL);
-	if (!prop->sink_dpn_prop)
-		return -ENOMEM;
-
-	dpn = prop->sink_dpn_prop;
-	i = 0;
-	addr = prop->sink_ports;
-	for_each_set_bit(bit, &addr, 32) {
-		dpn[i].num = bit;
-		dpn[i].simple_ch_prep_sm = true;
-		dpn[i].ch_prep_timeout = 10;
-		i++;
-	}
-
-	/* Allocate port_ready based on num_of_ports */
-	slave->port_ready = devm_kcalloc(&slave->dev, num_of_ports,
-					sizeof(*slave->port_ready),
-					GFP_KERNEL);
-	if (!slave->port_ready)
-		return -ENOMEM;
-
-	/* Initialize completion */
-	for (i = 0; i < num_of_ports; i++)
-		init_completion(&slave->port_ready[i]);
-
 	/* set the timeout values */
 	prop->clk_stop_timeout = 20;
 
-- 
2.17.1

