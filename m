Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1C0363B03
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 07:30:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2B2A16BF;
	Mon, 19 Apr 2021 07:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2B2A16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618810204;
	bh=bCzrmL6MKF3sdq8A6iirzCWDVeZidLosjFfqxuA3mwU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QE9mtnuD9CQFb59YxHTG+Xu7AYQ2CLaY6Ptm0VBz2gBqG8KKpVksmYKbmXNaN6yIL
	 eokqT3IuJ+legA+ST54YN64E5aoFcaGufYOUalsaobre7wVn+dRglv7fY6ZXrUwFBx
	 KHYieAv3wvTLe02sqmfT9Jgh6YDn/56fNHwvCkBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FC2AF80475;
	Mon, 19 Apr 2021 07:27:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B886EF80256; Mon, 19 Apr 2021 07:27:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33095F80256
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 07:27:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33095F80256
IronPort-SDR: Kk2zxGjyXgDSnHGYMX8cRDZl3ZMTOKcaMyQy14L7nGYQ2eitjDWyhpdEWhWDAyQpIfyrXlZWrf
 vxAUkMTi50aA==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="192081498"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="192081498"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 22:27:29 -0700
IronPort-SDR: ms2BEBhN+Wq8k9uTvtBVF01gFdVNNZU7jFUut+1bGH12lD9AX+AGBgvGW1Y5LqEGAFSJznEJVe
 kbN851T54o6g==
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="426370617"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 22:27:26 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 4/4] soundwire: bus: add missing \n in dynamic debug
Date: Mon, 19 Apr 2021 13:27:03 +0800
Message-Id: <20210419052703.2782-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419052703.2782-1-yung-chuan.liao@linux.intel.com>
References: <20210419052703.2782-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

They were missed in previous contributions.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 100d904bf700..85bcf60f9697 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -886,7 +886,7 @@ static int sdw_bus_wait_for_clk_prep_deprep(struct sdw_bus *bus, u16 dev_num)
 		}
 		val &= SDW_SCP_STAT_CLK_STP_NF;
 		if (!val) {
-			dev_dbg(bus->dev, "clock stop prep/de-prep done slave:%d",
+			dev_dbg(bus->dev, "clock stop prep/de-prep done slave:%d\n",
 				dev_num);
 			return 0;
 		}
@@ -895,7 +895,7 @@ static int sdw_bus_wait_for_clk_prep_deprep(struct sdw_bus *bus, u16 dev_num)
 		retry--;
 	} while (retry);
 
-	dev_err(bus->dev, "clock stop prep/de-prep failed slave:%d",
+	dev_err(bus->dev, "clock stop prep/de-prep failed slave:%d\n",
 		dev_num);
 
 	return -ETIMEDOUT;
-- 
2.17.1

