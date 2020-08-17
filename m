Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B46B248283
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 12:05:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D7091748;
	Tue, 18 Aug 2020 12:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D7091748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597745117;
	bh=VhOVSFqmwsMUgRmMg0oHZlB95AZAJLaxKNuqI4ueVtc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iI8HaXDPcYHDvR0gcq4Vnd7mlml5EwkKBna4AF9XojxKt5g3trIGptfWCF9Tdowxe
	 lTDjcSGRdM/3GzXHKBP8NjCzUiKOE89gmz1Z2bOprYX91Are8jdlloNcx71NscVQt/
	 xd0hwrHdZ98JcNTNn7NKaCLp268l8disrKdGi9NA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35B63F80273;
	Tue, 18 Aug 2020 12:03:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02CC0F8023F; Tue, 18 Aug 2020 12:03:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D085FF80104
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 12:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D085FF80104
IronPort-SDR: +7hTac31LBqGDRoghhHUlZ11JbgnAK9aEXH8DcSxl12LRWbrayWKY6SOdScT3JbfcCArph6DHk
 I8YMFPK/kJlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="142500860"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="142500860"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 03:03:20 -0700
IronPort-SDR: m8Ve8D5BXxeh4ID9DWVU5LTg1lzZarhd2hgU3HcA7T4DdrLbSyxj1Sq3MIx/qXwP17aQLKWYvp
 veBRYZXln21A==
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="471749319"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 03:03:16 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: bus: fix typo in comment on INTSTAT registers
Date: Tue, 18 Aug 2020 06:09:33 +0800
Message-Id: <20200817220933.17492-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
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

s/Instat/Intstat/

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index e6e0fb9a81b4..da0201693c24 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1372,7 +1372,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		return ret;
 	}
 
-	/* Read Instat 1, Instat 2 and Instat 3 registers */
+	/* Read Intstat 1, Intstat 2 and Intstat 3 registers */
 	ret = sdw_read(slave, SDW_SCP_INT1);
 	if (ret < 0) {
 		dev_err(slave->bus->dev,
-- 
2.17.1

