Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5998E24C9CE
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 04:00:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4EF81689;
	Fri, 21 Aug 2020 03:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4EF81689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597975222;
	bh=i+SVszx5HEmUv00UcCS6NR45pFE+TE/3RRn9gheqqeg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n+zoBNo4ubXoIiPcwCJdCsoQozz16ecGWGRJ8Qe+IC+fY05NmjoLbiCwKKVWxCPCk
	 oipaZiY82xFvPa0GHQLD711B9pOCfNZOscJeBaSXFoVhVfrpT7XmcyV+L//vCpjpeF
	 iq8/5a9siBOR3WmZ3GsugPwayfQBytrslAeL/Xd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA4FDF80253;
	Fri, 21 Aug 2020 03:58:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CC9AF80218; Fri, 21 Aug 2020 03:58:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1627CF800D3
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 03:58:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1627CF800D3
IronPort-SDR: 0krxu58R/oGOBr7Ci+V7ckW1jbb2nfkeOdvJ8NuTTm4+mkNQp5VbxJjampqA/EASHRLySjIfb8
 jpMYpin5gCqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9719"; a="153046737"
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; d="scan'208";a="153046737"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 18:58:28 -0700
IronPort-SDR: 4FFHH7EkeEOP8Eho1sxBO9KAGbft4Lpkgk1r0N4SyuLMHYa9vMMfeW/pVwLzxQ5+beLmnIS/iG
 fvaYi+hvG1fQ==
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; d="scan'208";a="280150774"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 18:58:25 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: intel: fix CONFIG_PM and CONFIG_PM_SLEEP confusion
Date: Thu, 20 Aug 2020 22:04:41 +0800
Message-Id: <20200820140441.9478-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

When CONFIG_PM_SLEEP is not defined, GCC throws compilation warnings:

drivers/soundwire/intel.c:1816:12: warning: ‘intel_resume’ defined but
not used [-Wunused-function]
 1816 | static int intel_resume(struct device *dev)
      |            ^~~~~~~~~~~~

drivers/soundwire/intel.c:1697:12: warning: ‘intel_suspend’ defined
but not used [-Wunused-function]
 1697 | static int intel_suspend(struct device *dev)

Fix by adding the missing CONFIG_PM_SLEEP.

Note that we could move code around and use only 2 ifdefs, but this
will generate conflicts so let's do this when all the pm handling is
merged.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index dbcbe2708563..a2f0026cb2c1 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1525,7 +1525,7 @@ int intel_master_process_wakeen_event(struct platform_device *pdev)
  * PM calls
  */
 
-#ifdef CONFIG_PM
+#ifdef CONFIG_PM_SLEEP
 
 static int intel_suspend(struct device *dev)
 {
@@ -1562,6 +1562,9 @@ static int intel_suspend(struct device *dev)
 
 	return 0;
 }
+#endif
+
+#ifdef CONFIG_PM
 
 static int intel_suspend_runtime(struct device *dev)
 {
@@ -1624,6 +1627,9 @@ static int intel_suspend_runtime(struct device *dev)
 
 	return ret;
 }
+#endif
+
+#ifdef CONFIG_PM_SLEEP
 
 static int intel_resume(struct device *dev)
 {
@@ -1691,6 +1697,9 @@ static int intel_resume(struct device *dev)
 
 	return ret;
 }
+#endif
+
+#ifdef CONFIG_PM
 
 static int intel_resume_runtime(struct device *dev)
 {
@@ -1797,7 +1806,6 @@ static int intel_resume_runtime(struct device *dev)
 
 	return ret;
 }
-
 #endif
 
 static const struct dev_pm_ops intel_pm = {
-- 
2.17.1

