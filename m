Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC70A3C7CFC
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 05:37:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75DF016A1;
	Wed, 14 Jul 2021 05:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75DF016A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626233878;
	bh=j96DafEgk8bwnmrU6btL31yi7nloCW4HH2Fs+3W4EjU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fJ0bZFFGrZevqAXx/DELf9AZOERbvzq6EuSh0j6C+ORg2sFU/2MlC2P7mIbYIEwPC
	 OLGDX/x5s0GsJr6lTwCImLMKUR2KFrpugOhvrv1xlEDS9F+HIFIuZpipmP5I24ZOKZ
	 bdwJxzip10hxKlNfPG68alyknTj/Y6t502iAVemI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 428F4F8025B;
	Wed, 14 Jul 2021 05:36:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FDE4F80254; Wed, 14 Jul 2021 05:36:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38BF7F8013C
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 05:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38BF7F8013C
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="190657571"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="190657571"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:36:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="505068174"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:36:17 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: bus: update Slave status in sdw_clear_slave_status
Date: Wed, 14 Jul 2021 11:36:09 +0800
Message-Id: <20210714033609.11963-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
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

Call to sdw_update_slave_status() needs to be added to sdw_clear_slave_
status() to ensure Slaves are informed of the new status via update_
status() callback.

This will enable codec drivers to reset their internal states and make
sure the register settings are properly restored on pm_runtime or
system resume

BugLink: https://github.com/thesofproject/linux/issues/2908
BugLink: https://github.com/thesofproject/linux/issues/2637
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/soundwire/bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index baa236cb5484..1b115734a8f6 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1860,6 +1860,7 @@ void sdw_clear_slave_status(struct sdw_bus *bus, u32 request)
 		if (slave->status != SDW_SLAVE_UNATTACHED) {
 			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
 			slave->first_interrupt_done = false;
+			sdw_update_slave_status(slave, SDW_SLAVE_UNATTACHED);
 		}
 
 		/* keep track of request, used in pm_runtime resume */
-- 
2.17.1

