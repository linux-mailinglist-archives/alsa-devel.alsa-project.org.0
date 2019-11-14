Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA102FCC77
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 19:03:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0842A167A;
	Thu, 14 Nov 2019 19:02:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0842A167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573754611;
	bh=BKojAhxYEX8ONMVmtZleAQzTDDBV0NFaVwmO8Fp9QhA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X2ALYid5nDcp/N3p+2wxNo33SHb1Wg8PJR8hKCMbmqztBVmoJLyE07t4ZpxkfjrMg
	 UYA4DS+c5jxlu5/NfiByPIthrzvjSzylFuL7gBd9/t19ZJ7ZRTKthwe4ECK0IwUPuN
	 oMFtOB/Ru+/gtrMWpqMZOAxgx+XBjsUKxjVbVGXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61721F800E9;
	Thu, 14 Nov 2019 19:00:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D68AFF800FF; Thu, 14 Nov 2019 19:00:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A83DAF800E9
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 18:59:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A83DAF800E9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 09:59:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="207871435"
Received: from chiahuil-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.228.77])
 by orsmga003.jf.intel.com with ESMTP; 14 Nov 2019 09:59:54 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 14 Nov 2019 11:59:22 -0600
Message-Id: <20191114175933.21992-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191114175933.21992-1-pierre-louis.bossart@linux.intel.com>
References: <20191114175933.21992-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 04/15] soundwire: bus_type: rename sdw_drv_
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
