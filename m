Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 435F975BAC
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 01:52:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF2BA1F4E;
	Fri, 26 Jul 2019 01:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF2BA1F4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564098777;
	bh=KyEINfqKP76OHOlHfy7btuzNTOVd3O3dCLF9DHH2qU0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pU6rTnzy7KxHEsuHUbMC7WxVFiPSQ+GdAc/vN/s5sWZ98q1BN7z9DY8pDsBro9RyA
	 UwIk3atvibnlMa2Xm01aMMgcLDO2TVDw+3bjYPHsnxYFAikDr0AS3ll8VeAF29hQrx
	 GkkWxMS/XtV8gmzbNDIhstGqz9BZRpEFfLFIqIL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 158D3F80649;
	Fri, 26 Jul 2019 01:41:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDDE5F805F9; Fri, 26 Jul 2019 01:41:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3291F805AE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 01:41:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3291F805AE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 16:41:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,308,1559545200"; d="scan'208";a="369874711"
Received: from amrutaku-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.230.75])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2019 16:41:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 25 Jul 2019 18:40:07 -0500
Message-Id: <20190725234032.21152-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [RFC PATCH 15/40] soundwire: cadence_master: handle
	multiple status reports per Slave
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When a Slave reports multiple status in the sticky bits, find the
latest configuration from the mirror of the PING frame status and
update the status directly.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 34 ++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 889fa2cd49ae..25d5c7267c15 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -643,13 +643,35 @@ static int cdns_update_slave_status(struct sdw_cdns *cdns,
 
 		/* first check if Slave reported multiple status */
 		if (set_status > 1) {
+			u32 val;
+
 			dev_warn_ratelimited(cdns->dev,
-					     "Slave reported multiple Status: %d\n",
-					     mask);
-			/*
-			 * TODO: we need to reread the status here by
-			 * issuing a PING cmd
-			 */
+					     "Slave %d reported multiple Status: %d\n",
+					     i, mask);
+
+			/* re-check latest status extracted from PING commands */
+			val = cdns_readl(cdns, CDNS_MCP_SLAVE_STAT);
+			val >>= (i * 2);
+
+			switch (val & 0x3) {
+			case 0:
+				status[i] = SDW_SLAVE_UNATTACHED;
+				break;
+			case 1:
+				status[i] = SDW_SLAVE_ATTACHED;
+				break;
+			case 2:
+				status[i] = SDW_SLAVE_ALERT;
+				break;
+			default:
+				status[i] = SDW_SLAVE_RESERVED;
+				break;
+			}
+
+			dev_warn_ratelimited(cdns->dev,
+					     "Slave %d status updated to %d\n",
+					     i, status[i]);
+
 		}
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
