Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BAD3639AB
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 05:18:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0730168A;
	Mon, 19 Apr 2021 05:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0730168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618802279;
	bh=/gPh63zGcenqMzb5vfreUYc3HhRT9pJd8rWQc2VplvY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jCdqVIG+1ZZIauW3CgTW/WqzbqPJ82qozrgnN7rDVQnOXzfMhPR3gfocwxbDm0Ye0
	 eLORjLIGkWpbSmBT5+YLQ0h5m/GcN+WnCt2f79t9jSoluz3RAZ8NF27X5gzPPcsimK
	 wg4Yle9YD4yT3vx9ur+UUEYa2M3oMAJI7ufmuo/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48241F80256;
	Mon, 19 Apr 2021 05:16:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62836F80227; Mon, 19 Apr 2021 05:16:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B123EF80164
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 05:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B123EF80164
IronPort-SDR: HBamsbgXW9+j3o0pN9LVm+mj14gjv2I4QdVu8vfeQY3sH8XAWWXx/fUdWT4U1WEqIu/65pghVg
 jyEeEdQL3olg==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="192072592"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="192072592"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 20:16:17 -0700
IronPort-SDR: n7V6jxXMM8ia+dND8vy4OyFhrlPo4ON6ZkXpkCmaoTtSv9p3mdzvQbNRsA4qAhoKWgT0lffH+5
 mdjEfmw/8XDQ==
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="426344086"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 20:16:14 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: cadence_master: always set CMD_ACCEPT
Date: Mon, 19 Apr 2021 11:16:06 +0800
Message-Id: <20210419031606.32715-1-yung-chuan.liao@linux.intel.com>
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

