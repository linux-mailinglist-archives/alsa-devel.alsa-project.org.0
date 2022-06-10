Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA3E5459AF
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 03:52:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DC3E202A;
	Fri, 10 Jun 2022 03:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DC3E202A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654825949;
	bh=oSdC3O+POFF40bTteE4J5n5uoo0yRjFF5UGT4T/X844=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o7DmdNQoqkbINoIVMJQ2d8vdVvvp1zXfeQv+JeXxz6VGz2+TxMZpJbBxHsgdxFsKX
	 a1maLTo2fe77ba6ko1wj5dxAlHcZCzEMRLGE6sfqNciqlYhC8LW2uhmkxzxl2HlYlB
	 XuylkMzEltigFEqS8eiklCUsUW0N9I2PdOwHgkc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DCA1F804D8;
	Fri, 10 Jun 2022 03:51:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AF8FF804D2; Fri, 10 Jun 2022 03:51:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 519A4F800DF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 03:51:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 519A4F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AORq8MbD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654825884; x=1686361884;
 h=from:to:cc:subject:date:message-id;
 bh=oSdC3O+POFF40bTteE4J5n5uoo0yRjFF5UGT4T/X844=;
 b=AORq8MbDwcXYiqdW/W7ng7mc0S/Np5AMvci5wKQvSnALikbddpcP6AT0
 8JZ6y6pJH7FI7tg290Xhfgxw/T1Ec+u+Y9aL2DI4Ra14Uu3McpARIrL6i
 dJoGZI1YEArZaHhYV37msI9g8S7ZjPPGaLKOjUiJCg2TnnCfovIzjcH3t
 YC4J6J1vZd8EhAvt1F57m/LrJimVoyERCiQKFgNkF5lCAgPRX+2X1Upmi
 Q+r123obTp4tRQ0gi+Wz8/ufIghVLB7tgkX2iUm6HEzHcGNU61G8BqyyG
 MLBAExVp08Zq4aah8yUe3JBDhN3YAyI94gFcmXZXGvGNAl3R0KzNnZ0aO w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="277510444"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="277510444"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 18:51:17 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="724715862"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 18:51:15 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: bus_type: fix remove and shutdown support
Date: Fri, 10 Jun 2022 09:51:05 +0800
Message-Id: <20220610015105.25987-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

The bus sdw_drv_remove() and sdw_drv_shutdown() helpers are used
conditionally, if the driver provides these routines.

These helpers already test if the driver provides a .remove or
.shutdown callback, so there's no harm in invoking the
sdw_drv_remove() and sdw_drv_shutdown() unconditionally.

In addition, the current code is imbalanced with
dev_pm_domain_attach() called from sdw_drv_probe(), but
dev_pm_domain_detach() called from sdw_drv_remove() only if the driver
provides a .remove callback.

Fixes: 9251345dca24b ("soundwire: Add SoundWire bus type")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus_type.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 893296f3fe39..b81e04dd3a9f 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -193,12 +193,8 @@ int __sdw_register_driver(struct sdw_driver *drv, struct module *owner)
 
 	drv->driver.owner = owner;
 	drv->driver.probe = sdw_drv_probe;
-
-	if (drv->remove)
-		drv->driver.remove = sdw_drv_remove;
-
-	if (drv->shutdown)
-		drv->driver.shutdown = sdw_drv_shutdown;
+	drv->driver.remove = sdw_drv_remove;
+	drv->driver.shutdown = sdw_drv_shutdown;
 
 	return driver_register(&drv->driver);
 }
-- 
2.17.1

