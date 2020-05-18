Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B46661D9211
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 10:33:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62C8C1711;
	Tue, 19 May 2020 10:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62C8C1711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589877196;
	bh=jGGXjKbdj0A2fNAby+0rcsd8HTQSKFYgkU5Wb4zh/F8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MURwjoBAaFkyt9Lg/b5U9zoFnj3fdonwPbiciPIYUJ8CyJzAjGzS5YMK4t/xBNeUh
	 BWTM91eNRz5W2MyH+TIIU+uTTzr9D9QOiAw7WkofBM1uZTebTIkOqUe6dtd9lQaqiR
	 bJSFG5t0Yf0DC5dvDeMbXX7sm5pTSpqbbGhIjioU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC5CDF8025E;
	Tue, 19 May 2020 10:30:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C047FF8025E; Tue, 19 May 2020 10:30:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44CAAF800C9
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 10:30:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44CAAF800C9
IronPort-SDR: JiKc/NX029WMHoFbYX4qnTJxH0FpromM9KTflZTWwXh4ABvYC8Gh/Csz39NzZwQgI3yV1u1r0r
 Te5oHkrSP+fQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2020 01:30:40 -0700
IronPort-SDR: gaXqNWvjg8kCkmUz7jDm7ZIZiK+jr2wYSiQvRU+fSCgdHqkOJW0WITrnSitAbdoy+lsjEyhPlz
 o2pgjWk2kojw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,409,1583222400"; d="scan'208";a="264233991"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga003.jf.intel.com with ESMTP; 19 May 2020 01:30:36 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/3] soundwire: disco: s/ch/channels/
Date: Tue, 19 May 2020 04:35:49 +0800
Message-Id: <20200518203551.2053-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200518203551.2053-1-yung-chuan.liao@linux.intel.com>
References: <20200518203551.2053-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
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

Use more meaningful member names in preparation for sysfs support.
No functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/mipi_disco.c | 11 ++++++-----
 include/linux/soundwire/sdw.h  |  8 ++++----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index 844e6b22974f..4ae62b452b8c 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -231,16 +231,17 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 
 		nval = fwnode_property_count_u32(node, "mipi-sdw-channel-number-list");
 		if (nval > 0) {
-			dpn[i].num_ch = nval;
-			dpn[i].ch = devm_kcalloc(&slave->dev, dpn[i].num_ch,
-						 sizeof(*dpn[i].ch),
+			dpn[i].num_channels = nval;
+			dpn[i].channels = devm_kcalloc(&slave->dev,
+						       dpn[i].num_channels,
+						       sizeof(*dpn[i].channels),
 						 GFP_KERNEL);
-			if (!dpn[i].ch)
+			if (!dpn[i].channels)
 				return -ENOMEM;
 
 			fwnode_property_read_u32_array(node,
 					"mipi-sdw-channel-number-list",
-					dpn[i].ch, dpn[i].num_ch);
+					dpn[i].channels, dpn[i].num_channels);
 		}
 
 		nval = fwnode_property_count_u32(node, "mipi-sdw-channel-combination-list");
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 7658d9698dd5..9c27a32df9bb 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -291,8 +291,8 @@ struct sdw_dpn_audio_mode {
  * implementation-defined interrupts
  * @max_ch: Maximum channels supported
  * @min_ch: Minimum channels supported
- * @num_ch: Number of discrete channels supported
- * @ch: Discrete channels supported
+ * @num_channels: Number of discrete channels supported
+ * @channels: Discrete channels supported
  * @num_ch_combinations: Number of channel combinations supported
  * @ch_combinations: Channel combinations supported
  * @modes: SDW mode supported
@@ -316,8 +316,8 @@ struct sdw_dpn_prop {
 	u32 imp_def_interrupts;
 	u32 max_ch;
 	u32 min_ch;
-	u32 num_ch;
-	u32 *ch;
+	u32 num_channels;
+	u32 *channels;
 	u32 num_ch_combinations;
 	u32 *ch_combinations;
 	u32 modes;
-- 
2.17.1

