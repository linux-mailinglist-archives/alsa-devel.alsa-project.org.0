Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2274C2D3AB9
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 06:37:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2CD816C5;
	Wed,  9 Dec 2020 06:36:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2CD816C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607492266;
	bh=FWPWx1yHVOFiLmrZOj85zq0BTGEDdg41d/OOYa4a7d8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nWESrD73231XtrXdKjNZ2b1TjOkpPbBeSb7K2VsKtCjJlRVV3HZkkB++WbDG4p2/L
	 Lm3cctjmkOtztXYXjGWKJLhWM7W0g1WaMucfBiYyjKY1AIFm6NubYObxLcjc54ksKM
	 HBLYVHK1ypK4Y4RrDsc3qrbggDwGpjyYywSq8m20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1767DF804C2;
	Wed,  9 Dec 2020 06:35:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E120F8027C; Wed,  9 Dec 2020 06:35:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01D43F800EF
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 06:35:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01D43F800EF
IronPort-SDR: i2wQZV1aqwBY8f/+X0zQ6Xhxek7PIbLBlFWuAXgO4n1vuWfzSoyb53YkXODlmD2yjeU6EX2SEF
 3bgYHkblaaIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="153258992"
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="153258992"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 21:35:17 -0800
IronPort-SDR: jJERFyK7Nsgxgl905jvdSfwvuUwiXXLzRy7WwhNiENmlEd/4/cCWLdMNDFc8HQrz+v0rLW5yo4
 R45crUGP1Ukw==
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="363989427"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 21:35:13 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 2/9] soundwire: bus: use sdw_write_no_pm when setting the
 bus scale registers
Date: Wed,  9 Dec 2020 13:34:52 +0800
Message-Id: <20201209053459.5515-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201209053459.5515-1-yung-chuan.liao@linux.intel.com>
References: <20201209053459.5515-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

When a Slave device is resumed, it may resume the bus and restart the
enumeration. During that process, we absolutely don't want to call
regular read/write routines which will wait for the resume to
complete, otherwise a deadlock occurs.

This patch fixes the same problem as the previous one, but is split to
make the life of linux-stable maintainers less painful.

Fixes: 29d158f90690 ('soundwire: bus: initialize bus clock base and scale registers')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 60c42508c6c6..b1830032b052 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1222,7 +1222,7 @@ static int sdw_slave_set_frequency(struct sdw_slave *slave)
 	}
 	scale_index++;
 
-	ret = sdw_write(slave, SDW_SCP_BUS_CLOCK_BASE, base);
+	ret = sdw_write_no_pm(slave, SDW_SCP_BUS_CLOCK_BASE, base);
 	if (ret < 0) {
 		dev_err(&slave->dev,
 			"SDW_SCP_BUS_CLOCK_BASE write failed:%d\n", ret);
@@ -1230,13 +1230,13 @@ static int sdw_slave_set_frequency(struct sdw_slave *slave)
 	}
 
 	/* initialize scale for both banks */
-	ret = sdw_write(slave, SDW_SCP_BUSCLOCK_SCALE_B0, scale_index);
+	ret = sdw_write_no_pm(slave, SDW_SCP_BUSCLOCK_SCALE_B0, scale_index);
 	if (ret < 0) {
 		dev_err(&slave->dev,
 			"SDW_SCP_BUSCLOCK_SCALE_B0 write failed:%d\n", ret);
 		return ret;
 	}
-	ret = sdw_write(slave, SDW_SCP_BUSCLOCK_SCALE_B1, scale_index);
+	ret = sdw_write_no_pm(slave, SDW_SCP_BUSCLOCK_SCALE_B1, scale_index);
 	if (ret < 0)
 		dev_err(&slave->dev,
 			"SDW_SCP_BUSCLOCK_SCALE_B1 write failed:%d\n", ret);
-- 
2.17.1

