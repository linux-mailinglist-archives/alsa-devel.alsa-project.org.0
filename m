Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D511C303833
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 09:40:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B6D817BD;
	Tue, 26 Jan 2021 09:39:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B6D817BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611650448;
	bh=bZugPgpYmKusiNd0s4UdBA8MODuCtlHSxkrdrTvgMhY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lauLhcCprfn0Z3oaTNcwvGZY66FdxJSJ2AZC2VYe8L2WSkWSBTdlaiqTvoijXt2Gq
	 rQa0jBFtLZQ552EqiRR4nfJkUEJzoy9PxcJdtpDpPg2glPigf+5u5SJJVM0wjxxG5R
	 SNQOtfQSM+pFQ2E5QnPBtWldgtnkCkLwn9EfSAPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C3EAF804CC;
	Tue, 26 Jan 2021 09:38:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08F5CF804B1; Tue, 26 Jan 2021 09:38:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61F36F80158
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 09:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61F36F80158
IronPort-SDR: PyhjIvc6Y6E/OongcSsIlUt38qccNhhOjJwUh7ng+FP3dSHIw09srzrEUJMcwLpQFFaG9gVIyF
 L+FVTyKUCvnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="198653725"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="198653725"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 00:38:05 -0800
IronPort-SDR: 1d9CLidnFpCJ+x7uxzkeQmk0n5naV+VadWcUvdkWpRRML1ryGTjUzELBuhOLcP4LdTjA/yLTXB
 BMzmT9WIYtwQ==
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="577731243"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 00:38:02 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/3] soundwire: bus: clear parity interrupt before the mask is
 enabled
Date: Tue, 26 Jan 2021 16:37:46 +0800
Message-Id: <20210126083746.3238-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210126083746.3238-1-yung-chuan.liao@linux.intel.com>
References: <20210126083746.3238-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

We recently added the ability to discard bus clash interrupts reported
on startup. These bus clash interrupts can happen randomly on some
platforms and don't seem to be valid. A master-level quirk helped
squelch those spurious errors.

Additional tests on a new platform with the Maxim 98373 amplifier
showed a rare case where the parity interrupt is also thrown on
startup, at the same time as bus clashes. This issue only seems to
happen infrequently and was only observed during suspend-resume stress
tests while audio is streaming. We could make the problem go away by
adding a Slave-level quirk, but there is no evidence that the issue is
actually a Slave problem: the parity is provided by the Master, which
could also set an invalid parity in corner cases.

This patch suggests an additional bus-level quirk for parity, which is
only applied when the codec device is not known to have an issue with
parity. The initial parity error will be ignored, but a trace will be
logged to help identify potential root causes (likely a combination of
issues on both master and slave sides influenced by board-specific
electrical parameters).

BugLink: https://github.com/thesofproject/linux/issues/2533
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c       | 9 +++++++++
 drivers/soundwire/intel.c     | 3 ++-
 include/linux/soundwire/sdw.h | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index d394905936e4..57581fdb2ea9 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1256,6 +1256,15 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
 			sdw_write_no_pm(slave, SDW_SCP_INT1, SDW_SCP_INT1_BUS_CLASH);
 		}
 	}
+	if ((slave->bus->prop.quirks & SDW_MASTER_QUIRKS_CLEAR_INITIAL_PARITY) &&
+	    !(slave->prop.quirks & SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY)) {
+		/* Clear parity interrupt before enabling interrupt mask */
+		status = sdw_read_no_pm(slave, SDW_SCP_INT1);
+		if (status & SDW_SCP_INT1_PARITY) {
+			dev_warn(&slave->dev, "PARITY error detected before INT mask is enabled\n");
+			sdw_write_no_pm(slave, SDW_SCP_INT1, SDW_SCP_INT1_PARITY);
+		}
+	}
 
 	/*
 	 * Set SCP_INT1_MASK register, typically bus clash and
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index f7ba1a77a1df..c1fdc85d0a74 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1286,7 +1286,8 @@ static int sdw_master_read_intel_prop(struct sdw_bus *bus)
 	if (quirk_mask & SDW_INTEL_QUIRK_MASK_BUS_DISABLE)
 		prop->hw_disabled = true;
 
-	prop->quirks = SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH;
+	prop->quirks = SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH |
+		SDW_MASTER_QUIRKS_CLEAR_INITIAL_PARITY;
 
 	return 0;
 }
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index a2766c3b603d..30415354d419 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -426,6 +426,7 @@ struct sdw_master_prop {
 };
 
 #define SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH	BIT(0)
+#define SDW_MASTER_QUIRKS_CLEAR_INITIAL_PARITY	BIT(1)
 
 int sdw_master_read_prop(struct sdw_bus *bus);
 int sdw_slave_read_prop(struct sdw_slave *slave);
-- 
2.17.1

