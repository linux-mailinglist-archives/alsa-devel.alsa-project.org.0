Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DED4B3C7CF0
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 05:27:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 748C41690;
	Wed, 14 Jul 2021 05:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 748C41690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626233247;
	bh=bzO8axkEo0RgVxo0VM+hzFZ12b16FJC1YLYTRdIo6SU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r8l7Tc1LPLX9xwgDud0cP0lnLUEmtnOT9kMQTDy0o4osM8oou74MGPiahzWjjRWWa
	 0xZifN5FIsSQgOG+1BeyB10hbArFOkxdfWBkxV/e2YukoJMhTiP7UV4V7ug4aPtVhb
	 YDu2ktXpoBWAnkOgxlsTPN65wePxofeoZGGGuoWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12789F80519;
	Wed, 14 Jul 2021 05:23:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EA35F804FE; Wed, 14 Jul 2021 05:22:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB527F804E5
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 05:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB527F804E5
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="232086461"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="232086461"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:22:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="459818208"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:22:45 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 09/10] soundwire: cadence: add debugfs interface for PDI
 loopbacks
Date: Wed, 14 Jul 2021 11:22:08 +0800
Message-Id: <20210714032209.11284-10-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
References: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

For debug, it's interesting to create a loopback stream for each link
and use debugfs to set a source and target PDI. The target PDI would
need to be an RX port and use the same register configurations as the
source PDI. This capability allows e.g. for the headphone playback
stream to be snooped on the headset capture stream, or alternatively
for the addition of a dedicated loopback stream, in addition of
regular capture for that link.

This patch only adds the debugfs part, the port/PDI handling will be
handled in the next patches.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 44 ++++++++++++++++++++++++++++++
 drivers/soundwire/cadence_master.h |  3 ++
 2 files changed, 47 insertions(+)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 9a9b6110e763..3e740fcebdfe 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -450,6 +450,40 @@ static int cdns_parity_error_injection(void *data, u64 value)
 DEFINE_DEBUGFS_ATTRIBUTE(cdns_parity_error_fops, NULL,
 			 cdns_parity_error_injection, "%llu\n");
 
+static int cdns_set_pdi_loopback_source(void *data, u64 value)
+{
+	struct sdw_cdns *cdns = data;
+	unsigned int pdi_out_num = cdns->pcm.num_bd + cdns->pcm.num_out;
+
+	if (value > pdi_out_num)
+		return -EINVAL;
+
+	/* Userspace changed the hardware state behind the kernel's back */
+	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+	cdns->pdi_loopback_source = value;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(cdns_pdi_loopback_source_fops, NULL, cdns_set_pdi_loopback_source, "%llu\n");
+
+static int cdns_set_pdi_loopback_target(void *data, u64 value)
+{
+	struct sdw_cdns *cdns = data;
+	unsigned int pdi_in_num = cdns->pcm.num_bd + cdns->pcm.num_in;
+
+	if (value > pdi_in_num)
+		return -EINVAL;
+
+	/* Userspace changed the hardware state behind the kernel's back */
+	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+	cdns->pdi_loopback_target = value;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(cdns_pdi_loopback_target_fops, NULL, cdns_set_pdi_loopback_target, "%llu\n");
+
 /**
  * sdw_cdns_debugfs_init() - Cadence debugfs init
  * @cdns: Cadence instance
@@ -464,6 +498,16 @@ void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root)
 
 	debugfs_create_file("cdns-parity-error-injection", 0200, root, cdns,
 			    &cdns_parity_error_fops);
+
+	cdns->pdi_loopback_source = -1;
+	cdns->pdi_loopback_target = -1;
+
+	debugfs_create_file("cdns-pdi-loopback-source", 0200, root, cdns,
+			    &cdns_pdi_loopback_source_fops);
+
+	debugfs_create_file("cdns-pdi-loopback-target", 0200, root, cdns,
+			    &cdns_pdi_loopback_target_fops);
+
 }
 EXPORT_SYMBOL_GPL(sdw_cdns_debugfs_init);
 
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 0e7f8b35bb21..6c039d456ba8 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -129,6 +129,9 @@ struct sdw_cdns {
 	struct sdw_cdns_streams pcm;
 	struct sdw_cdns_streams pdm;
 
+	int pdi_loopback_source;
+	int pdi_loopback_target;
+
 	void __iomem *registers;
 
 	bool link_up;
-- 
2.17.1

