Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF53247CBF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 05:27:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EE6D171B;
	Tue, 18 Aug 2020 05:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EE6D171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597721253;
	bh=SV5ZZXwqrJMWvlQMLbK3GYdap22mKwncx3K4d7bsJL4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TUeOG7fuwT1BpG+g+eqZZnYKdS/sr0A3uQWgh7npxLppKpONo5he8FYHP20PEmh/Y
	 jAaNHx+8EMtQc/PaMZrMojyprHi4ZT5fWtwu9rg/MAq7+GazOvDXdQU/qDsPuUPlXQ
	 +bWadOwYprYCquu4cfEblIEUoKiIzi5oDvU4jMY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70E62F802E9;
	Tue, 18 Aug 2020 05:23:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87FEAF802DC; Tue, 18 Aug 2020 05:23:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F6F6F80114
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 05:23:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F6F6F80114
IronPort-SDR: FdDGLAl2XL03pbHlS3vebbH7E2y+CJwXk+lULa4a8EzLteKK8Jet1rLOcwYe9wzIVTWBSSshXg
 CPtjkthpWEIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="152243015"
X-IronPort-AV: E=Sophos;i="5.76,325,1592895600"; d="scan'208";a="152243015"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 20:23:28 -0700
IronPort-SDR: 7lviDtFcctncIe1LaCVudtXIv5Kt5cIeFEAq1qjEQyLA8i1YSIzVe/QfMJwRL5lkjInXmdRCT6
 lxAnRRXSgJgQ==
X-IronPort-AV: E=Sophos;i="5.76,325,1592895600"; d="scan'208";a="441084575"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 20:23:25 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 04/12] soundwire: intel: call helper to reset Slave states
 on resume
Date: Mon, 17 Aug 2020 23:29:15 +0800
Message-Id: <20200817152923.3259-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817152923.3259-1-yung-chuan.liao@linux.intel.com>
References: <20200817152923.3259-1-yung-chuan.liao@linux.intel.com>
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

This helps make sure they are all UNATTACHED and reset the state
machines.

At the moment we perform a bus reset both for system resume and
pm_runtime resume, this will be modified when clock-stop mode is
supported

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 00c5de1250ec..10dd0e208ce7 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1516,6 +1516,12 @@ static int intel_resume(struct device *dev)
 		return ret;
 	}
 
+	/*
+	 * make sure all Slaves are tagged as UNATTACHED and provide
+	 * reason for reinitialization
+	 */
+	sdw_clear_slave_status(bus, SDW_UNATTACH_REQUEST_MASTER_RESET);
+
 	ret = sdw_cdns_enable_interrupt(cdns, true);
 	if (ret < 0) {
 		dev_err(dev, "cannot enable interrupts during resume\n");
@@ -1562,6 +1568,12 @@ static int intel_resume_runtime(struct device *dev)
 		return ret;
 	}
 
+	/*
+	 * make sure all Slaves are tagged as UNATTACHED and provide
+	 * reason for reinitialization
+	 */
+	sdw_clear_slave_status(bus, SDW_UNATTACH_REQUEST_MASTER_RESET);
+
 	ret = sdw_cdns_enable_interrupt(cdns, true);
 	if (ret < 0) {
 		dev_err(dev, "cannot enable interrupts during resume\n");
-- 
2.17.1

