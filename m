Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 862F2250E34
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 03:28:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B7881676;
	Tue, 25 Aug 2020 03:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B7881676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598318896;
	bh=GMQu29kYpAu2O0b6RiIpAJ5yMO5F4UTXq5ofudxliSk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hzs/O3s9vPyimq9MErN7gOqO4Dpkqur1Bro8VaTYd2m+3MV5+WXgujDv4uBFQjhzD
	 6FFPQwXUKzh2VyTbBm5y3iT4wI499Hx06bHdBNAbVPPYXmmlR0rmrpmnqIWAYqbCQE
	 khaoDDiXXvwHBIOvpf2pHMuzWrq28rSVTIuR1Kc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 393ABF8013D;
	Tue, 25 Aug 2020 03:26:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 261B6F801D9; Tue, 25 Aug 2020 03:26:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E90A6F8013D
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 03:26:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E90A6F8013D
IronPort-SDR: wRbRsSVmcKgiJAE4N/6calDmdr2VoKsgm9qSLAcgsdHxjvxTXn8XzVPL0kf0lPxqTIV0LXscNt
 4mASncnMRU2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="153436552"
X-IronPort-AV: E=Sophos;i="5.76,350,1592895600"; d="scan'208";a="153436552"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 18:26:20 -0700
IronPort-SDR: 0U9UupZ1piSB1NCBH8/LgXnxrutyJ+D+zfVz4+5kZRuuwBZsSNjLNwMRR3NOo0xuRAqEEHxSP3
 zbawr9UyAHIg==
X-IronPort-AV: E=Sophos;i="5.76,350,1592895600"; d="scan'208";a="443446093"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 18:26:16 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2] soundwire: intel: fix intel_suspend/resume defined but not
 used warning
Date: Mon, 24 Aug 2020 21:32:34 +0800
Message-Id: <20200824133234.28115-1-yung-chuan.liao@linux.intel.com>
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

When CONFIG_PM_SLEEP is not defined, GCC throws compilation warnings:

drivers/soundwire/intel.c:1799:12: warning: ‘intel_resume’ defined but not
used [-Wunused-function]
 static int intel_resume(struct device *dev)
            ^~~~~~~~~~~~
drivers/soundwire/intel.c:1683:12: warning: ‘intel_suspend’ defined but not
used [-Wunused-function]
 static int intel_suspend(struct device *dev)
            ^~~~~~~~~~~~~

Fix by using __maybe_unused macro.

Suggested-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
Changelog:
v2:
 - use __maybe_unused macro instead of wrapping in another ifdef.
---
 drivers/soundwire/intel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index dbcbe2708563..ebca8ced59ec 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1527,7 +1527,7 @@ int intel_master_process_wakeen_event(struct platform_device *pdev)
 
 #ifdef CONFIG_PM
 
-static int intel_suspend(struct device *dev)
+static int __maybe_unused intel_suspend(struct device *dev)
 {
 	struct sdw_cdns *cdns = dev_get_drvdata(dev);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
@@ -1625,7 +1625,7 @@ static int intel_suspend_runtime(struct device *dev)
 	return ret;
 }
 
-static int intel_resume(struct device *dev)
+static int __maybe_unused intel_resume(struct device *dev)
 {
 	struct sdw_cdns *cdns = dev_get_drvdata(dev);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
-- 
2.17.1

