Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA4018D47F
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 17:33:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A82DD84B;
	Fri, 20 Mar 2020 17:32:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A82DD84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584722000;
	bh=Gis6zY4C8uv3xVtNtKl6kDO7e2F5qms6Zu4jeY818wU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R+3zpivC9T5NgfY5ZqMUU5FQi0N1+upZYRSMuKxkvC+b56QCSBR3+mUaqYx3F4rGH
	 0PrlX2f/XoRfHQex+1bK4DayeXC6t6vhiL6Z/RIdV2G+T4HyyNDpwuL0J/j5oNsI8J
	 AgC+OLI9uABDx1HZeH/SqTlhB2B8OaCyaJcLF2M8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EE6AF80299;
	Fri, 20 Mar 2020 17:30:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AA04F80256; Fri, 20 Mar 2020 17:30:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2825F8015B
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 17:30:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2825F8015B
IronPort-SDR: lxeEjVA2dV77DJBUaIMmEONbgfWPY51LG+9Rt4RbRgx6YZmeo1+4MRKyRBPRL/PEBnaPIMl3dQ
 3jgr9//mAxEQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 09:30:05 -0700
IronPort-SDR: bHWPirFfuFYtgMU59MmbNvzP61dZoKTzksjLxclgAiV7iNaeKV4yNZ16ocT2TZz07y/C009pf4
 p/Jot+7gEqLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,285,1580803200"; d="scan'208";a="248930916"
Received: from manallet-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.34.12])
 by orsmga006.jf.intel.com with ESMTP; 20 Mar 2020 09:30:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] soundwire: bus_type: protect cases where no driver name
 is provided
Date: Fri, 20 Mar 2020 11:29:44 -0500
Message-Id: <20200320162947.17663-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200320162947.17663-1-pierre-louis.bossart@linux.intel.com>
References: <20200320162947.17663-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

When the implementation only creates a sdw_master_device and does not
provide a master_name, we have a risk of kernel oopses with dereferences
of a NULL pointer.

Protect with explicit tests.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus_type.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 09a25075e770..c01d74c709d5 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -48,12 +48,14 @@ static int sdw_bus_match(struct device *dev, struct device_driver *ddrv)
 		md = dev_to_sdw_master_device(dev);
 		mdrv = drv_to_sdw_master_driver(ddrv);
 
-		/*
-		 * we don't have any hardware information so
-		 * match with a hopefully unique string
-		 */
-		ret = !strncmp(md->master_name, mdrv->driver.name,
-			       strlen(md->master_name));
+		if (md->master_name) {
+			/*
+			 * we don't have any hardware information so
+			 * match with a hopefully unique string
+			 */
+			ret = !strncmp(md->master_name, mdrv->driver.name,
+				       strlen(md->master_name));
+		}
 	}
 	return ret;
 }
@@ -71,9 +73,11 @@ static int sdw_master_modalias(const struct sdw_master_device *md,
 			       char *buf, size_t size)
 {
 	/* modalias is sdw:<string> since we don't have any hardware info */
-
-	return snprintf(buf, size, "sdw:%s\n",
-			md->master_name);
+	if (md->master_name)
+		return snprintf(buf, size, "sdw:%s\n",
+				md->master_name);
+	else
+		return snprintf(buf, size, "sdw:no_master_driver\n");
 }
 
 static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
-- 
2.20.1

