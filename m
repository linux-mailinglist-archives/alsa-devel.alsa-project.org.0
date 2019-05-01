Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C3910A92
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 18:06:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50DC816FE;
	Wed,  1 May 2019 18:05:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50DC816FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556726766;
	bh=9KTrP4r7zLUOIyMvYLKqcgRn34+Yifzf1hDv+w16r7c=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F0sKooG6XjgXE3IS+mWVY8LsloH/CJJYPNfLg+8BRrONkjLvyFqgyJ0/tx/BzC7TU
	 QT0XIkpkOyUykcw06iO7uB4PhqIxM9dRk83DymDDorFZrppWqXhYtbK+IPr4IoWQxI
	 ZiPLzGONDEAgfcxfPBjp3FUpkBoZlLhzkDI5ZI/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F48BF8974D;
	Wed,  1 May 2019 17:58:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71F40F896B6; Wed,  1 May 2019 17:58:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA76CF896B6
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 17:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA76CF896B6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 08:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,418,1549958400"; d="scan'208";a="296115694"
Received: from modiarvi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.211])
 by orsmga004.jf.intel.com with ESMTP; 01 May 2019 08:58:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  1 May 2019 10:57:29 -0500
Message-Id: <20190501155745.21806-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH v4 06/22] soundwire: bus: remove useless
	parentheses
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

and make the code more readable

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index efdcefc62e1a..423dc6d17999 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -415,10 +415,10 @@ static struct sdw_slave *sdw_get_slave(struct sdw_bus *bus, int i)
 static int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id)
 {
 
-	if ((slave->id.unique_id != id.unique_id) ||
-	    (slave->id.mfg_id != id.mfg_id) ||
-	    (slave->id.part_id != id.part_id) ||
-	    (slave->id.class_id != id.class_id))
+	if (slave->id.unique_id != id.unique_id ||
+	    slave->id.mfg_id != id.mfg_id ||
+	    slave->id.part_id != id.part_id ||
+	    slave->id.class_id != id.class_id)
 		return -ENODEV;
 
 	return 0;
@@ -896,8 +896,8 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		}
 
 		/* Update the Slave driver */
-		if (slave_notify && (slave->ops) &&
-					(slave->ops->interrupt_callback)) {
+		if (slave_notify && slave->ops &&
+		    slave->ops->interrupt_callback) {
 			slave_intr.control_port = clear;
 			memcpy(slave_intr.port, &port_status,
 			       sizeof(slave_intr.port));
@@ -955,7 +955,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 static int sdw_update_slave_status(struct sdw_slave *slave,
 				   enum sdw_slave_status status)
 {
-	if ((slave->ops) && (slave->ops->update_status))
+	if (slave->ops && slave->ops->update_status)
 		return slave->ops->update_status(slave, status);
 
 	return 0;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
