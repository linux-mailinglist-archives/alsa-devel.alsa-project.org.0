Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3296262496
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 03:42:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AE9116FD;
	Wed,  9 Sep 2020 03:41:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AE9116FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599615749;
	bh=52BTKVwY2GkOchS+DuuM5KEacSEEIXHBLmjH22fn1Mc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lWvAFrEe+SdIswlJZvHV3jC1LQH/6PB5wPav7vB/i79vds3Ln6/RUgaFxY77nR9J+
	 2W0RjGEN8V+nUxcW+7GSCTtxxpJGdFRV1Zw8f7RDhO6tXn1tLJC4Nb/ue4WbeFPg5S
	 crUDVCRsnNKbSgS2CzsEXTez4O3NGi1kKsB3dLjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73AAAF802C4;
	Wed,  9 Sep 2020 03:39:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9106BF8028D; Wed,  9 Sep 2020 03:39:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDFB1F800E9
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 03:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDFB1F800E9
IronPort-SDR: NVF96tu1negI/QaQMn+jzHln+pRFzh/TadbqL6049ikpTqZEv82W7j7wbJmIuRkypBsoF5S6bW
 mRw6HEYVC+AQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="222458463"
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="222458463"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 18:39:13 -0700
IronPort-SDR: Ik9VcC61IreXChdeMB1F4svObvNssA7XFY7DGDFXdqArt85RctHr3ABh7FQ/q67RJrY6ljXYBI
 w5j0veT0Jxww==
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="449018091"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 18:39:09 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 2/7] soundwire: bus: filter-out unwanted interrupt reports
Date: Tue,  8 Sep 2020 21:45:16 +0800
Message-Id: <20200908134521.6781-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908134521.6781-1-yung-chuan.liao@linux.intel.com>
References: <20200908134521.6781-1-yung-chuan.liao@linux.intel.com>
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

Unlike the traditional usage, in the SoundWire specification the
interrupt masks only gate the propagation of an interrupt condition to
the PING frame status. They do not gate the changes of the INT_STAT
registers, which will happen regardless of the mask settings. See
Figure 116 of the SoundWire 1.2 specification for an in-depth
description of the interrupt model.

When the bus driver reads the SCP_INT1_STAT register, it will retrieve
all the interrupt status, including for the mask fields that were not
explicitly set. For example, even if the PARITY mask is not set, the
PARITY error status will be reported if an implementation-defined
interrupt for jack detection is enabled and occurs.

Filtering undesired interrupt reports and handling has to be
implemented in software. This patch enables this filtering for the
INT1_IMPL_DEF, PARITY and BUS_CLASH interrupt sources.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 9f4cc24ccea3..029818b1f568 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1394,12 +1394,14 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		 * interrupt
 		 */
 		if (buf & SDW_SCP_INT1_PARITY) {
-			dev_err(&slave->dev, "Parity error detected\n");
+			if (slave->prop.scp_int1_mask & SDW_SCP_INT1_PARITY)
+				dev_err(&slave->dev, "Parity error detected\n");
 			clear |= SDW_SCP_INT1_PARITY;
 		}
 
 		if (buf & SDW_SCP_INT1_BUS_CLASH) {
-			dev_err(&slave->dev, "Bus clash error detected\n");
+			if (slave->prop.scp_int1_mask & SDW_SCP_INT1_BUS_CLASH)
+				dev_err(&slave->dev, "Bus clash detected\n");
 			clear |= SDW_SCP_INT1_BUS_CLASH;
 		}
 
@@ -1411,9 +1413,11 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		 */
 
 		if (buf & SDW_SCP_INT1_IMPL_DEF) {
-			dev_dbg(&slave->dev, "Slave impl defined interrupt\n");
+			if (slave->prop.scp_int1_mask & SDW_SCP_INT1_IMPL_DEF) {
+				dev_dbg(&slave->dev, "Slave impl defined interrupt\n");
+				slave_notify = true;
+			}
 			clear |= SDW_SCP_INT1_IMPL_DEF;
-			slave_notify = true;
 		}
 
 		/* Check port 0 - 3 interrupts */
-- 
2.17.1

