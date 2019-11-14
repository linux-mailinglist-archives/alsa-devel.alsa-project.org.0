Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 349EAFCCCF
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 19:08:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB51A167B;
	Thu, 14 Nov 2019 19:07:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB51A167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573754906;
	bh=O/3K6ni6GwohNn/E809MifKqju8W9wg6rTsi72zCk4o=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WrJB5dPUA1LtLez9UWe2BWJe3lhLi0fdF4RJxb8z600iJe6bSKtgkdKxrB6iDt7kR
	 3MAJjWdmUsyRbjePXgyf2YEqvf1qM/GN5Qep4qSXiMiTHxvVl/igGvxYSZb+FU29pL
	 bUkjCLb4EFDW5gApK826dSfwRHJEIrvNIXdNO3nk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A64A4F801EC;
	Thu, 14 Nov 2019 19:00:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5094CF8012D; Thu, 14 Nov 2019 19:00:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F07CF8010C
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 19:00:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F07CF8010C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 10:00:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="207871615"
Received: from chiahuil-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.228.77])
 by orsmga003.jf.intel.com with ESMTP; 14 Nov 2019 10:00:07 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 14 Nov 2019 11:59:28 -0600
Message-Id: <20191114175933.21992-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191114175933.21992-1-pierre-louis.bossart@linux.intel.com>
References: <20191114175933.21992-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 10/15] soundwire: add device driver to
	sdw_md_driver
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Setting an device driver is necessary for ASoC to register DAI
components.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c     | 4 ++++
 drivers/soundwire/master.c    | 2 ++
 include/linux/soundwire/sdw.h | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index ba3bc410d816..492684ba08c3 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1059,6 +1059,10 @@ static int intel_master_remove(struct sdw_master_device *md)
 }
 
 struct sdw_md_driver intel_sdw_driver = {
+	.driver = {
+		.name = "intel-sdw",
+		.owner = THIS_MODULE,
+	},
 	.probe = intel_master_probe,
 	.startup = intel_master_startup,
 	.remove = intel_master_remove,
diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
index 6210098c892b..d23111d43fd6 100644
--- a/drivers/soundwire/master.c
+++ b/drivers/soundwire/master.c
@@ -57,6 +57,8 @@ struct sdw_master_device *sdw_md_add(struct sdw_md_driver *driver,
 		put_device(&md->dev);
 	}
 
+	md->dev.driver = &driver->driver;
+
 	return md;
 }
 EXPORT_SYMBOL(sdw_md_add);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index af0a72e7afdf..d22950b1a5d9 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -627,6 +627,7 @@ struct sdw_md_driver {
 	 */
 	int (*autonomous_clock_stop_enable)(struct sdw_master_device *md,
 					    bool state);
+	struct device_driver driver;
 };
 
 #define SDW_SLAVE_ENTRY(_mfg_id, _part_id, _drv_data) \
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
