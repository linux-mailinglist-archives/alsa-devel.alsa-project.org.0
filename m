Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA333297A8
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 10:15:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D350816CF;
	Tue,  2 Mar 2021 10:14:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D350816CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614676510;
	bh=pi0dRpFXKUxCIZtfXJAq0ztTLMjXy9OYxcaYGZE5iPY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LdcTtaKKeBqv/ucZzGS34CmYQx3IS12WBKwnl/S5m10BIop1tuBkYt+sdLWONdazQ
	 z88Q/raVn60SjEf5q/9/Xm8oMhkZXvjERZsSd/gSLe0KakrzEkFINk9Uqs5FKTqWuZ
	 dMMsGLm/y+sdkGRBKogG7zotgle1JQlg7Hh18sFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E1B0F80271;
	Tue,  2 Mar 2021 10:12:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0BDAF804AC; Tue,  2 Mar 2021 10:11:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43FB3F802E3
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 10:11:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43FB3F802E3
IronPort-SDR: h5AlKI+tDyY8a9esNziVi/oxImFCxZthiHMZv3dfirzGy3TGwJ912SGpBx9MQw3RoxpFtwq1hE
 8dLzhYEgSs7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="248158736"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="248158736"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 01:11:43 -0800
IronPort-SDR: jUrvMi15tQNk4ij2o02MTX2/AbuXKBpwl0Jsh9yRBn8ymgPneuhLSF//dvnz9ziFBx/RhjzkyR
 ja6nX1+zbQNA==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="506262288"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 01:11:41 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 06/11] soundwire: bus: remove useless initialization
Date: Tue,  2 Mar 2021 17:11:17 +0800
Message-Id: <20210302091122.13952-7-yung-chuan.liao@linux.intel.com>
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

Cppcheck complains about a possible null pointer dereference, but it's
more like there is an unnecessary initialization before walking
through a list.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 66ad87c1fb6b..e5ffe21a06d4 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -593,7 +593,7 @@ EXPORT_SYMBOL(sdw_write);
 /* called with bus_lock held */
 static struct sdw_slave *sdw_get_slave(struct sdw_bus *bus, int i)
 {
-	struct sdw_slave *slave = NULL;
+	struct sdw_slave *slave;
 
 	list_for_each_entry(slave, &bus->slaves, node) {
 		if (slave->dev_num == i)
-- 
2.17.1

