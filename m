Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAF43297A7
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 10:15:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA4CC16CD;
	Tue,  2 Mar 2021 10:14:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA4CC16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614676500;
	bh=1e7pcIMxuR4qz6MwGDnwEhIHwGbLazlEPmSKEM8hR20=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HT1t1PLBSr2m7xhWS1FEZt06P+gyp7XkNX2fO3sZvGe+0WNQOpZyfQtYAkhM9UH08
	 tlsMSQ367pOQQCHQb/C+66I8WY+g7XLJGl+3KPL6qbf/hqvwLB52RR6wuO2J9UbzY3
	 BMWp3+Tj/KKRLzmBMSk/GWwoSNiyIE9MfMuzjgVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7630CF804AE;
	Tue,  2 Mar 2021 10:12:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6B0FF804AA; Tue,  2 Mar 2021 10:11:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 707D0F80271
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 10:11:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 707D0F80271
IronPort-SDR: K8UKUWvOOkQFPXtoFMOfucfEbAHa20ONl84EWlqUtzq+YqE6Orw7kSxehXxLYDQNdPHjYoyGBQ
 iOOgCASPXyUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="248158729"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="248158729"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 01:11:39 -0800
IronPort-SDR: blCqt8sXMON9ynnNxUlss4K44BTW8WpnaYWN3FuqlUgNbVgYx0ch+YT7piKSPmBgtG9wpzROND
 sgNNj/XJOSUQ==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="506262278"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 01:11:38 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 04/11] soundwire: bus: demote clock stop prepare log to
 dev_dbg()
Date: Tue,  2 Mar 2021 17:11:15 +0800
Message-Id: <20210302091122.13952-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210302091122.13952-1-yung-chuan.liao@linux.intel.com>
References: <20210302091122.13952-1-yung-chuan.liao@linux.intel.com>
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

There is no real reason to provide this information except for debug
sessions, hence dev_dbg() is a better fit.

Reported-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 23e4c76d0ac2..742c2d4e2f27 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -906,8 +906,8 @@ static int sdw_bus_wait_for_clk_prep_deprep(struct sdw_bus *bus, u16 dev_num)
 		}
 		val &= SDW_SCP_STAT_CLK_STP_NF;
 		if (!val) {
-			dev_info(bus->dev, "clock stop prep/de-prep done slave:%d",
-				 dev_num);
+			dev_dbg(bus->dev, "clock stop prep/de-prep done slave:%d",
+				dev_num);
 			return 0;
 		}
 
-- 
2.17.1

