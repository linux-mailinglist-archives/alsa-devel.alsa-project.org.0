Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DC22CD18A
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 09:42:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA3A9182E;
	Thu,  3 Dec 2020 09:41:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA3A9182E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606984970;
	bh=Xz11wUahcIwMDr0yHeTPvTBaBLsrL0E+yTEzLp8Y2NQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gyAKT+Ls+z5K4KaMoqXV9JIYdZlK+ump/T0E3FNH3tG63S+s/MNGAlBkbhZQylM5N
	 wj99HjzN0jVu6pahHvS/cRlpyqlielr1FWqP7qVpiBSTJ52uiPbg+Cd5vKLyNvz6PA
	 cCRtqeoF28BTp9hkpeH4PaceWiJJf2maBt9scltI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 880FEF804E3;
	Thu,  3 Dec 2020 09:39:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11B19F804D6; Thu,  3 Dec 2020 09:39:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4519AF804CC
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 09:39:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4519AF804CC
IronPort-SDR: i4gcxwS8ogk1ZxZDHG3i3rNZqS4AzXR7UPZtYRenhG7Y/Re07vm5qgq5+jVDNXND7j6fMSU+wi
 0JkeKObnzOIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="237276595"
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="237276595"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2020 00:39:37 -0800
IronPort-SDR: bMduurmPYmWjKvgm7Uv90IrVC2Jvpti1d2fqq0OcjX8nx3Mp5c4FZleAXRXUYODQYYnv8jucgO
 xxteTOm3iyMg==
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="481881026"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2020 00:39:33 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 5/7] regmap: sdw: use no_pm routines for SoundWire 1.2 MBQ
Date: Thu,  3 Dec 2020 04:46:43 +0800
Message-Id: <20201202204645.23891-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202204645.23891-1-yung-chuan.liao@linux.intel.com>
References: <20201202204645.23891-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
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

Use no_pm versions for write and read.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
---
 drivers/base/regmap/regmap-sdw-mbq.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/base/regmap/regmap-sdw-mbq.c b/drivers/base/regmap/regmap-sdw-mbq.c
index 8ce30650b97c..fe3ac26b66ad 100644
--- a/drivers/base/regmap/regmap-sdw-mbq.c
+++ b/drivers/base/regmap/regmap-sdw-mbq.c
@@ -15,11 +15,11 @@ static int regmap_sdw_mbq_write(void *context, unsigned int reg, unsigned int va
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	int ret;
 
-	ret = sdw_write(slave, SDW_SDCA_MBQ_CTL(reg), (val >> 8) & 0xff);
+	ret = sdw_write_no_pm(slave, SDW_SDCA_MBQ_CTL(reg), (val >> 8) & 0xff);
 	if (ret < 0)
 		return ret;
 
-	return sdw_write(slave, reg, val & 0xff);
+	return sdw_write_no_pm(slave, reg, val & 0xff);
 }
 
 static int regmap_sdw_mbq_read(void *context, unsigned int reg, unsigned int *val)
@@ -29,11 +29,11 @@ static int regmap_sdw_mbq_read(void *context, unsigned int reg, unsigned int *va
 	int read0;
 	int read1;
 
-	read0 = sdw_read(slave, reg);
+	read0 = sdw_read_no_pm(slave, reg);
 	if (read0 < 0)
 		return read0;
 
-	read1 = sdw_read(slave, SDW_SDCA_MBQ_CTL(reg));
+	read1 = sdw_read_no_pm(slave, SDW_SDCA_MBQ_CTL(reg));
 	if (read1 < 0)
 		return read1;
 
@@ -98,4 +98,4 @@ struct regmap *__devm_regmap_init_sdw_mbq(struct sdw_slave *sdw,
 EXPORT_SYMBOL_GPL(__devm_regmap_init_sdw_mbq);
 
 MODULE_DESCRIPTION("Regmap SoundWire MBQ Module");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
-- 
2.17.1

