Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0F4E0ECF
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 01:57:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2C651686;
	Wed, 23 Oct 2019 01:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2C651686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571788653;
	bh=xFSMBH9+xIN4vwKSwMkgqmPtqDrHjq1V2AyPGp81a9U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JtMxHm4uGppPtjz8kIer98qA3KP6H2CubVPkXs8Y88Jo+4B8+TnIwinzfFkM2vR3G
	 Jnu09esXTRrx15FzHdTnEF/O8Da5yx79ClODI/9rsBzLdQRPr9a7nYL+t4m6of7y3a
	 dmYio8x/rOUcs+vUt83ORgsP+kM6tc0wmhugY3RU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C741EF80322;
	Wed, 23 Oct 2019 01:55:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A07A4F80112; Wed, 23 Oct 2019 01:55:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71699F80112
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 01:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71699F80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 16:54:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,218,1569308400"; d="scan'208";a="196612842"
Received: from srajamoh-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.20.203])
 by fmsmga008.fm.intel.com with ESMTP; 22 Oct 2019 16:54:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 22 Oct 2019 18:54:45 -0500
Message-Id: <20191022235448.17586-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022235448.17586-1-pierre-louis.bossart@linux.intel.com>
References: <20191022235448.17586-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 2/5] soundwire: cadence_master: add hw_reset
	capability in debugfs
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

Provide debugfs capability to kick link and devices into hard-reset
(as defined by MIPI). This capability is really useful when some
devices are no longer responsive and/or to check the software handling
of resynchronization.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 5337ccacccd1..7476e867468d 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -333,6 +333,26 @@ static int cdns_reg_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(cdns_reg);
 
+static int cdns_hw_reset(void *data, u64 value)
+{
+	struct sdw_cdns *cdns = data;
+	int ret;
+
+	if (value != 1)
+		return -EINVAL;
+
+	/* Userspace changed the hardware state behind the kernel's back */
+	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+	ret = sdw_cdns_exit_reset(cdns);
+
+	dev_dbg(cdns->dev, "link hw_reset done: %d\n", ret);
+
+	return ret;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(cdns_hw_reset_fops, NULL, cdns_hw_reset, "%llu\n");
+
 /**
  * sdw_cdns_debugfs_init() - Cadence debugfs init
  * @cdns: Cadence instance
@@ -341,6 +361,9 @@ DEFINE_SHOW_ATTRIBUTE(cdns_reg);
 void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root)
 {
 	debugfs_create_file("cdns-registers", 0400, root, cdns, &cdns_reg_fops);
+
+	debugfs_create_file("cdns-hw-reset", 0200, root, cdns,
+			    &cdns_hw_reset_fops);
 }
 EXPORT_SYMBOL_GPL(sdw_cdns_debugfs_init);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
