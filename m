Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 018133297A9
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 10:15:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7252616BF;
	Tue,  2 Mar 2021 10:14:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7252616BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614676543;
	bh=7aIgzf83tafPDlWi6TOfjxkL4y59iX15usH+hW1PFkc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UsXEgS7GkHNN+aQaes/4zEol95JSHUaF3pd2KdSAUodqhd/Eii1iV6oM0UBs/4awK
	 TFfIZc31qgq7Tjk4xRhvuXLS10OhH23hYWAHIdKJA47jcB69+H9PPwcatbwxuA7iOF
	 YkMLz6p0geTI7Xr2Dj1VLqIMvNXrlEacw61yMI2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62EC9F804BD;
	Tue,  2 Mar 2021 10:12:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63283F804A9; Tue,  2 Mar 2021 10:11:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FEC8F802CA
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 10:11:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FEC8F802CA
IronPort-SDR: l1oNupLULi2XKa22Bk69PUXRBNG6qa7JSA1P7nyVNgPNtoKpkikevEiqfg1Oi1tYQJbAN0j4aP
 45qgcKNUGBEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="248158733"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="248158733"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 01:11:41 -0800
IronPort-SDR: c9tn6XcvuOkm6EZ4+9fVJuPn0ADm7w9PgjcUOizSjE252lmV7w39hBbKlsguuUAmHNEQNtNCAF
 ojUWaptKRQ8w==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="506262283"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 01:11:39 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 05/11] soundwire: bus: uniquify dev_err() for SCP_INT access
Date: Tue,  2 Mar 2021 17:11:16 +0800
Message-Id: <20210302091122.13952-6-yung-chuan.liao@linux.intel.com>
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

We have multiple cases where we read/write SCP_INT registers, but the
same error message in all cases. Add a distinct error message for each
case to help debug.

Reported-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 742c2d4e2f27..66ad87c1fb6b 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1597,7 +1597,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		ret = sdw_read_no_pm(slave, SDW_SCP_INT1);
 		if (ret < 0) {
 			dev_err(&slave->dev,
-				"SDW_SCP_INT1 read failed:%d\n", ret);
+				"SDW_SCP_INT1 recheck read failed:%d\n", ret);
 			goto io_err;
 		}
 		_buf = ret;
@@ -1605,7 +1605,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		ret = sdw_nread_no_pm(slave, SDW_SCP_INTSTAT2, 2, _buf2);
 		if (ret < 0) {
 			dev_err(&slave->dev,
-				"SDW_SCP_INT2/3 read failed:%d\n", ret);
+				"SDW_SCP_INT2/3 recheck read failed:%d\n", ret);
 			goto io_err;
 		}
 
@@ -1613,7 +1613,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 			ret = sdw_read_no_pm(slave, SDW_DP0_INT);
 			if (ret < 0) {
 				dev_err(&slave->dev,
-					"SDW_DP0_INT read failed:%d\n", ret);
+					"SDW_DP0_INT recheck read failed:%d\n", ret);
 				goto io_err;
 			}
 			sdca_cascade = ret & SDW_DP0_SDCA_CASCADE;
-- 
2.17.1

