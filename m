Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D94345578
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 03:27:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41D6615E2;
	Tue, 23 Mar 2021 03:26:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41D6615E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616466443;
	bh=9u4FLIEFdB9oWFUHMl9YIIOBd6NMAretkwgaz3Bqg/U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VTcUZQMAobi/09CwudTmRvi7bVnZ4oXSwvQZkfFobm/YUsEEV2OHPVYTplXBOqxWJ
	 bnc26WHeWo4olYP3nPZAInjAWBzUUUdc4DjPLisF/uo+dYZlEVcKnB98XEdquml6Rf
	 ZVcCWVO0XMjo1IV5i5oOiuMQLhAXJnzHK2AlhnxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7DDAF801D5;
	Tue, 23 Mar 2021 03:25:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB40FF8016B; Tue, 23 Mar 2021 03:25:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B78BCF80107
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 03:25:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B78BCF80107
IronPort-SDR: rUO9fWYCApOvXDIT1hS4znDndeVFs98hNfoO/PbU6l5vEM4cul5TyywXDkUVzgZZCa9kuJARNB
 HwV08AsDwn2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="177958153"
X-IronPort-AV: E=Sophos;i="5.81,270,1610438400"; d="scan'208";a="177958153"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 19:25:42 -0700
IronPort-SDR: Ov9wswf9uFOPGcZiDu+jkVsxI0EX4JqdmTfALU0YnRF1hwGceR0SNSuBGyE3FVgMYll87xhg+K
 qSHEzmqfUtsw==
X-IronPort-AV: E=Sophos;i="5.81,270,1610438400"; d="scan'208";a="414751850"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 19:25:39 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: add slave device to linked list after
 device_register()
Date: Tue, 23 Mar 2021 10:25:29 +0800
Message-Id: <20210323022529.21915-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
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

We currently add the slave device to a linked list before
device_register(), and then remove it if device_register() fails.

It's not clear why this sequence was necessary, this patch moves the
linked list management to after the device_register().

Suggested-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/slave.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 112b21967c7a..0c92db2e1ddc 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -65,9 +65,6 @@ int sdw_slave_add(struct sdw_bus *bus,
 	for (i = 0; i < SDW_MAX_PORTS; i++)
 		init_completion(&slave->port_ready[i]);
 
-	mutex_lock(&bus->bus_lock);
-	list_add_tail(&slave->node, &bus->slaves);
-	mutex_unlock(&bus->bus_lock);
 
 	ret = device_register(&slave->dev);
 	if (ret) {
@@ -77,13 +74,15 @@ int sdw_slave_add(struct sdw_bus *bus,
 		 * On err, don't free but drop ref as this will be freed
 		 * when release method is invoked.
 		 */
-		mutex_lock(&bus->bus_lock);
-		list_del(&slave->node);
-		mutex_unlock(&bus->bus_lock);
 		put_device(&slave->dev);
 
 		return ret;
 	}
+
+	mutex_lock(&bus->bus_lock);
+	list_add_tail(&slave->node, &bus->slaves);
+	mutex_unlock(&bus->bus_lock);
+
 	sdw_slave_debugfs_init(slave);
 
 	return ret;
-- 
2.17.1

