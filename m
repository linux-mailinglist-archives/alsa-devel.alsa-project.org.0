Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F1A34A420
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 10:20:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15850167D;
	Fri, 26 Mar 2021 10:19:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15850167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616750428;
	bh=x2BzfGO7ObGB5s+MLtTv0MH0jc4PISdJRUtK/ppfoqE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXiUiX8wJ0w4tVKRzDMjpQkpB9F8uaes3ZTTuponAC8dTRqeGAO77BIuKlY+XP0PS
	 pykGdJatihT6q9zXruQbYBE2fQRAYc6RO7EPvLM85G7cCDkELC9x4uDRrXUJywXHSF
	 7qJpStfq+vzwa4M8iQcef2MJJ/IiiRJNtxhHgJb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD254F804E3;
	Fri, 26 Mar 2021 10:16:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC0C1F804BD; Fri, 26 Mar 2021 10:16:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF860F801EB
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 10:15:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF860F801EB
IronPort-SDR: 8JQ9t3DYGGJ+XG6nBaQepf19TapuAB/G5Q0TUWaE3cmYctdkGHSbV3GhGnRFz9jWgcu8/ZhNEA
 JiXjuFRv2wog==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="276249437"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="276249437"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 02:15:39 -0700
IronPort-SDR: pQW47v0JFARr6JLBn0yoFidywlZkX2laYcBYO1f3AY0YiJ6VwYa1ENOIR5tKzggUHB8yu/VQVj
 Drx6fv2A3RXA==
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="416463153"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 02:15:36 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RESEND PATCH 04/11] soundwire: bus: demote clock stop prepare log to
 dev_dbg()
Date: Fri, 26 Mar 2021 17:15:07 +0800
Message-Id: <20210326091514.20751-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326091514.20751-1-yung-chuan.liao@linux.intel.com>
References: <20210326091514.20751-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
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

There is no real reason to provide this information except for debug
sessions, hence dev_dbg() is a better fit.

Reported-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index d39e5baa3e64..8b6d8fe934ae 100644
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

