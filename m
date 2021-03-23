Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B29A6345463
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 02:02:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4899D1669;
	Tue, 23 Mar 2021 02:01:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4899D1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616461332;
	bh=NzgG6fu1YAkTYxMXh01OGaiUTjDet6TaKW/2rscx7H0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nu50/FD0WPJ8xSLafaqEaIDXI+5iDA9sr4TGMAGRdKBMz2tqd5ck4+y7TKcp8Prr+
	 okhckvG7FxxKnC3FQbJO6/BBnoVerXv7UHGLkCkZBnQWwzGd4Jlx8/haDecpDhQYsQ
	 k0Q8t53leQfBkzF1AQDKWXqxq3AnR6VlXtjNPE+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A2EAF80431;
	Tue, 23 Mar 2021 01:59:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BCCFF80424; Tue, 23 Mar 2021 01:59:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE15EF8016B
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 01:59:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE15EF8016B
IronPort-SDR: cIOTns7KdSMVbnubdxrcqu94gUGzScJVWED9QtZE0M2RC64QZE8Fgy64Vxgd1AbXQPkcdkC78I
 asUvKA/QIYoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="275477951"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="275477951"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 17:59:15 -0700
IronPort-SDR: F1wX+Xi+TbDUIKuJ9J+eNAu6OlRmZx+5UQFaNA7+CyjpxgmWPG7aXO/qho9LIuxdvKlR+mKTK7
 Wi8oGcndI/2g==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="414728350"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 17:59:12 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/5] soundwire: cadence: add missing \n in dev_err()
Date: Tue, 23 Mar 2021 08:58:53 +0800
Message-Id: <20210323005855.20890-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323005855.20890-1-yung-chuan.liao@linux.intel.com>
References: <20210323005855.20890-1-yung-chuan.liao@linux.intel.com>
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

We fixed a lot of warnings in 2019 but the magic of copy-paste keeps
adding new ones...

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index d05442e646a3..1b50cf7abe66 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1462,7 +1462,7 @@ int sdw_cdns_clock_stop(struct sdw_cdns *cdns, bool block_wake)
 	 */
 	ret = sdw_bus_clk_stop(&cdns->bus);
 	if (ret < 0 && slave_present && ret != -ENODATA) {
-		dev_err(cdns->dev, "bus clock stop failed %d", ret);
+		dev_err(cdns->dev, "bus clock stop failed %d\n", ret);
 		return ret;
 	}
 
-- 
2.17.1

