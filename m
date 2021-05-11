Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 252D6379D30
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 04:54:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FDBD1771;
	Tue, 11 May 2021 04:53:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FDBD1771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620701681;
	bh=/gPh63zGcenqMzb5vfreUYc3HhRT9pJd8rWQc2VplvY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DownQacYx0MBCkj8W3zEXb+9dIiU6dwGLnCsecj/2qnvKQ5sUJYMzGVCEiiAYzNUL
	 HmTwH3KflvnbHf/QPd6t33nYwKTlwcIm+XkTfsj/hp6XFhNScFonouf23LD9RjPnwz
	 4pLY7QDnPYISb/Omd+pAtr1SxvLGDmZbUpCBlSaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1795CF800E9;
	Tue, 11 May 2021 04:53:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A98F9F8016B; Tue, 11 May 2021 04:53:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3566DF80156
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 04:53:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3566DF80156
IronPort-SDR: u1H1n5lAyZgR4RD5s5bRa8J7BUOwPRjHrI24gmNENhwznb3ib32pnu5UV9EklDSpmCwi7WJ9bf
 KwkdndT7p3ig==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179603362"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="179603362"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 19:52:59 -0700
IronPort-SDR: a+LmUs2pnZ3NWKyOeSYzMi/t/Df9BoWLcrqScvL0XZf5gG1VytkbFj1TPq1XCvFReO7mdS77gO
 kn6QP3tlBz7w==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="436428063"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 19:52:56 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RESEND PATCH] soundwire: cadence_master: always set CMD_ACCEPT
Date: Tue, 11 May 2021 10:52:47 +0800
Message-Id: <20210511025247.25339-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
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

The Cadence IP can be configured in two different ways to deal with
CMD_IGNORED replies to broadcast commands. The CMD_ACCEPT bitfield
controls whether the command is discarded or if the IP proceeds with
the change (typically a bank switch or clock stop command).

The existing code seems to be inconsistent:
a) For some historical reason, we set this CMD_ACCEPT bitfield during
the initialization, but we don't during a resume from a clock-stoppped
state.
b) In addition, the loop used in the clock-stop sequence is quite
racy, it's possible that a device has lost sync but it's still tagged
as ATTACHED.
c) If somehow a Device loses sync and is unable to ack a broadcast
command, we do not have an error handling mechanism anyways. The IP
should go ahead and let the Device regain sync at a later time.

Make sure the CMD_ACCEPT bit is always set.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 192dac10f0c2..25950422b085 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1428,20 +1428,6 @@ int sdw_cdns_clock_stop(struct sdw_cdns *cdns, bool block_wake)
 		}
 	}
 
-	/*
-	 * This CMD_ACCEPT should be used when there are no devices
-	 * attached on the link when entering clock stop mode. If this is
-	 * not set and there is a broadcast write then the command ignored
-	 * will be treated as a failure
-	 */
-	if (!slave_present)
-		cdns_updatel(cdns, CDNS_MCP_CONTROL,
-			     CDNS_MCP_CONTROL_CMD_ACCEPT,
-			     CDNS_MCP_CONTROL_CMD_ACCEPT);
-	else
-		cdns_updatel(cdns, CDNS_MCP_CONTROL,
-			     CDNS_MCP_CONTROL_CMD_ACCEPT, 0);
-
 	/* commit changes */
 	ret = cdns_config_update(cdns);
 	if (ret < 0) {
@@ -1508,11 +1494,8 @@ int sdw_cdns_clock_restart(struct sdw_cdns *cdns, bool bus_reset)
 	cdns_updatel(cdns, CDNS_MCP_CONTROL,
 		     CDNS_MCP_CONTROL_BLOCK_WAKEUP, 0);
 
-	/*
-	 * clear CMD_ACCEPT so that the command ignored
-	 * will be treated as a failure during a broadcast write
-	 */
-	cdns_updatel(cdns, CDNS_MCP_CONTROL, CDNS_MCP_CONTROL_CMD_ACCEPT, 0);
+	cdns_updatel(cdns, CDNS_MCP_CONTROL, CDNS_MCP_CONTROL_CMD_ACCEPT,
+		     CDNS_MCP_CONTROL_CMD_ACCEPT);
 
 	if (!bus_reset) {
 
-- 
2.17.1

