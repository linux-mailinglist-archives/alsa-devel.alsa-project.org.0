Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC81811DD6B
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 06:08:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1A091756;
	Fri, 13 Dec 2019 06:07:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1A091756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576213680;
	bh=BKojAhxYEX8ONMVmtZleAQzTDDBV0NFaVwmO8Fp9QhA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BFq6y9Faj4likjY1sIUm6pqNgfNnOF62ime5Kso2KgIKb6vpZybgI0wDDlp7seChQ
	 crF9uD1ALfovVHVio18361egR4dZF9UKLpMGjqqZI33DTKkLN5u2gaDd1iSzihx3J4
	 sduQsAtxwCWzDZdV+DYxAXi74h7f6EIigJHj8iZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1A68F8026F;
	Fri, 13 Dec 2019 06:04:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74D52F8023F; Fri, 13 Dec 2019 06:04:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6DE9F8021D
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 06:04:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6DE9F8021D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 21:04:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,308,1571727600"; d="scan'208";a="208340703"
Received: from vbagrodi-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.130.70])
 by orsmga008.jf.intel.com with ESMTP; 12 Dec 2019 21:04:20 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 12 Dec 2019 23:03:58 -0600
Message-Id: <20191213050409.12776-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
References: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v4 04/15] soundwire: bus_type: rename sdw_drv_
	to sdw_slave_drv
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

Before we add master driver support, make sure there is no ambiguity
and no occurrences of sdw_drv_ functions.

No functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus_type.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 2b2830b622fa..9a0fd3ee1014 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -67,7 +67,7 @@ struct bus_type sdw_bus_type = {
 };
 EXPORT_SYMBOL_GPL(sdw_bus_type);
 
-static int sdw_drv_probe(struct device *dev)
+static int sdw_slave_drv_probe(struct device *dev)
 {
 	struct sdw_slave *slave = to_sdw_slave_device(dev);
 	struct sdw_driver *drv = to_sdw_slave_driver(dev->driver);
@@ -113,7 +113,7 @@ static int sdw_drv_probe(struct device *dev)
 	return 0;
 }
 
-static int sdw_drv_remove(struct device *dev)
+static int sdw_slave_drv_remove(struct device *dev)
 {
 	struct sdw_slave *slave = to_sdw_slave_device(dev);
 	struct sdw_driver *drv = to_sdw_slave_driver(dev->driver);
@@ -127,7 +127,7 @@ static int sdw_drv_remove(struct device *dev)
 	return ret;
 }
 
-static void sdw_drv_shutdown(struct device *dev)
+static void sdw_slave_drv_shutdown(struct device *dev)
 {
 	struct sdw_slave *slave = to_sdw_slave_device(dev);
 	struct sdw_driver *drv = to_sdw_slave_driver(dev->driver);
@@ -155,13 +155,13 @@ int __sdw_register_slave_driver(struct sdw_driver *drv,
 	}
 
 	drv->driver.owner = owner;
-	drv->driver.probe = sdw_drv_probe;
+	drv->driver.probe = sdw_slave_drv_probe;
 
 	if (drv->remove)
-		drv->driver.remove = sdw_drv_remove;
+		drv->driver.remove = sdw_slave_drv_remove;
 
 	if (drv->shutdown)
-		drv->driver.shutdown = sdw_drv_shutdown;
+		drv->driver.shutdown = sdw_slave_drv_shutdown;
 
 	return driver_register(&drv->driver);
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
