Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B922C35DB
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 02:02:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3431F166D;
	Wed, 25 Nov 2020 02:01:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3431F166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606266131;
	bh=jzARBhXnkn64q6Nimj0Hrunqu5xb/kFNre+u1+aQXww=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kdz16VbB+PIhP3ywmBzGlxsyte6kN/TKq9f5YVqgn3tO+QRQ9KIEuXjHQt4qRXuk3
	 nQtT93e2z48iWmXWXBGhCvyyvcdQpWiv0VxlM7/eStmYY8IGEEbOvfmMXWm9sDDpI0
	 h/cU3KLViwPDRlZcBTh9s41uamz59+qi5sqOHZWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B926BF800C1;
	Wed, 25 Nov 2020 02:00:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3E4AF80165; Wed, 25 Nov 2020 02:00:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 326F7F8015A
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 02:00:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 326F7F8015A
IronPort-SDR: FDP/jsXLpA6rgIE3Y/rzcpX1+t3xxCGXPHTpxoQNnMayCKJdDGqXS0/QhV6ODg3hxcqaDpNZR9
 LztFCwdPAYog==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="151882358"
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="151882358"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 17:00:22 -0800
IronPort-SDR: wqtsynaXEuKC8omiAFywZvNW6esy3Q8b5g946HV+w66hUJYtyQCudyYuJAyJUiIiukUNBW5c17
 LshZzceMJ2rg==
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="478717652"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 17:00:18 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: master: use pm_runtime_set_active() on add
Date: Tue, 24 Nov 2020 21:07:42 +0800
Message-Id: <20201124130742.10986-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
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

The 'master' device acts as a glue layer used during bus
initialization only, and it needs to be 'transparent' for pm_runtime
management. Its behavior should be that it becomes active when one of
its children becomes active, and suspends when all of its children are
suspended.

In our tests on Intel platforms, we routinely see these sort of
warnings on the initial boot:

[ 21.447345] rt715 sdw:3:25d:715:0: runtime PM trying to activate
child device sdw:3:25d:715:0 but parent (sdw-master-3) is not active

This is root-caused to a missing setup to make the device 'active' on
probe. Since we don't want the device to remain active forever after
the probe, the autosuspend configuration is also enabled at the end of
the probe - the device will actually autosuspend only in the case
where there are no devices physically attached. In practice, the
master device will suspend when all its children are no longer active.

Fixes: bd84256e86ecf ('soundwire: master: enable pm runtime')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/master.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
index 3488bb824e84..9b05c9e25ebe 100644
--- a/drivers/soundwire/master.c
+++ b/drivers/soundwire/master.c
@@ -8,6 +8,15 @@
 #include <linux/soundwire/sdw_type.h>
 #include "bus.h"
 
+/*
+ * The 3s value for autosuspend will only be used if there are no
+ * devices physically attached on a bus segment. In practice enabling
+ * the bus operation will result in children devices become active and
+ * the master device will only suspend when all its children are no
+ * longer active.
+ */
+#define SDW_MASTER_SUSPEND_DELAY_MS 3000
+
 /*
  * The sysfs for properties reflects the MIPI description as given
  * in the MIPI DisCo spec
@@ -154,7 +163,12 @@ int sdw_master_device_add(struct sdw_bus *bus, struct device *parent,
 	bus->dev = &md->dev;
 	bus->md = md;
 
+	pm_runtime_set_autosuspend_delay(&bus->md->dev, SDW_MASTER_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(&bus->md->dev);
+	pm_runtime_mark_last_busy(&bus->md->dev);
+	pm_runtime_set_active(&bus->md->dev);
 	pm_runtime_enable(&bus->md->dev);
+	pm_runtime_idle(&bus->md->dev);
 device_register_err:
 	return ret;
 }
-- 
2.17.1

