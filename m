Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EECB4FCD53
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 19:22:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89BBB168D;
	Thu, 14 Nov 2019 19:21:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89BBB168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573755767;
	bh=HEHu7tFSFMZyG2wG8tfj621p92oj1w0kqnJyIW5XJmU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fJCE3OT5QMQGn4D/OB6Ecy5d6uP2mzO2tJt4STvupKaJ1NDCK910bTqsPQrjXgIzs
	 76KejXb2WkwKE6UF0V9j3wqDNTczLvmVdddNlrf+y//u8/Q65ZM27usmVz/qMVDHHU
	 /L6VbIhlpzUkWH+/v0L1LhlAaxkMNabKHVrFQOkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB65CF8013A;
	Thu, 14 Nov 2019 19:18:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 937F2F8010B; Thu, 14 Nov 2019 19:17:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20115F800FF
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 19:17:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20115F800FF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 10:17:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="195123409"
Received: from chiahuil-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.228.77])
 by orsmga007.jf.intel.com with ESMTP; 14 Nov 2019 10:17:36 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 14 Nov 2019 12:16:45 -0600
Message-Id: <20191114181702.22254-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191114181702.22254-1-pierre-louis.bossart@linux.intel.com>
References: <20191114181702.22254-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 05/22] soundwire: intel: add helpers for
	link power down and shim wake
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

These routines are required for power management

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c | 53 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 23c5c3f9d30d..00fa5c3a6c1f 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -362,6 +362,59 @@ static int intel_shim_init(struct sdw_intel *sdw)
 	return ret;
 }
 
+static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
+{
+	void __iomem *shim = sdw->link_res->shim;
+	unsigned int link_id = sdw->instance;
+	u16 wake_en, wake_sts;
+
+	if (wake_enable) {
+		/* Enable the wakeup */
+		intel_writew(shim, SDW_SHIM_WAKEEN,
+			     (SDW_SHIM_WAKEEN_ENABLE << link_id));
+	} else {
+		/* Disable the wake up interrupt */
+		wake_en = intel_readw(shim, SDW_SHIM_WAKEEN);
+		wake_en &= ~(SDW_SHIM_WAKEEN_ENABLE << link_id);
+		intel_writew(shim, SDW_SHIM_WAKEEN, wake_en);
+
+		/* Clear wake status */
+		wake_sts = intel_readw(shim, SDW_SHIM_WAKESTS);
+		wake_sts |= (SDW_SHIM_WAKEEN_ENABLE << link_id);
+		intel_writew(shim, SDW_SHIM_WAKESTS_STATUS, wake_sts);
+	}
+}
+
+static int intel_link_power_down(struct sdw_intel *sdw)
+{
+	int link_control, spa_mask, cpa_mask, ret;
+	unsigned int link_id = sdw->instance;
+	void __iomem *shim = sdw->link_res->shim;
+	u16 ioctl;
+
+	/* Glue logic */
+	ioctl = intel_readw(shim, SDW_SHIM_IOCTL(link_id));
+	ioctl |= SDW_SHIM_IOCTL_BKE;
+	ioctl |= SDW_SHIM_IOCTL_COE;
+	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+
+	ioctl &= ~(SDW_SHIM_IOCTL_MIF);
+	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
+
+	/* Link power down sequence */
+	link_control = intel_readl(shim, SDW_SHIM_LCTL);
+	spa_mask = ~(SDW_SHIM_LCTL_SPA << link_id);
+	cpa_mask = (SDW_SHIM_LCTL_CPA << link_id);
+	link_control &=  spa_mask;
+
+	ret = intel_clear_bit(shim, SDW_SHIM_LCTL, link_control, cpa_mask);
+	if (ret < 0)
+		return ret;
+
+	sdw->cdns.link_up = false;
+	return 0;
+}
+
 /*
  * PDI routines
  */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
