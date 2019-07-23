Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 411E772030
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 21:44:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A96BC18F4;
	Tue, 23 Jul 2019 21:43:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A96BC18F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563911054;
	bh=+s2ZnLCuV06+jWsGkTFKm85bQUiTt8fUnvCzq22BtFM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VYh0cgLhpnaQcCkN+TZAjrSRR8hwn/fsEMT7T7YIGM4gd3Un0I3saSodevDIuTNLy
	 zka/7AtS+vkFp00FcX0N3UHUWvtX//FVubEaX/Rat0MjXsrFzeVGOo+inEviDujMv6
	 Dbwy+OfnFFl6JGLgw07jvCDaQnMGz2O0tq1Q8uWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDFC3F80447;
	Tue, 23 Jul 2019 21:42:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3B8AF80447; Tue, 23 Jul 2019 21:42:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A33A9F8011C
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 21:42:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A33A9F8011C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 12:42:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; d="scan'208";a="368540096"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 23 Jul 2019 12:42:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 8B4BB81; Tue, 23 Jul 2019 22:42:19 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Date: Tue, 23 Jul 2019 22:42:18 +0300
Message-Id: <20190723194218.69168-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [alsa-devel] [PATCH v1] soundwire: mipi_disco: Switch to use
	fwnode_property_count_uXX()
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

Use use fwnode_property_count_uXX() directly, that makes code neater.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/soundwire/mipi_disco.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index 79fee1b21ab6..844e6b22974f 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -60,8 +60,7 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 				 "mipi-sdw-max-clock-frequency",
 				 &prop->max_clk_freq);
 
-	nval = fwnode_property_read_u32_array(link,
-			"mipi-sdw-clock-frequencies-supported", NULL, 0);
+	nval = fwnode_property_count_u32(link, "mipi-sdw-clock-frequencies-supported");
 	if (nval > 0) {
 		prop->num_clk_freq = nval;
 		prop->clk_freq = devm_kcalloc(bus->dev, prop->num_clk_freq,
@@ -87,8 +86,7 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 		}
 	}
 
-	nval = fwnode_property_read_u32_array(link,
-			"mipi-sdw-supported-clock-gears", NULL, 0);
+	nval = fwnode_property_count_u32(link, "mipi-sdw-supported-clock-gears");
 	if (nval > 0) {
 		prop->num_clk_gears = nval;
 		prop->clk_gears = devm_kcalloc(bus->dev, prop->num_clk_gears,
@@ -134,8 +132,7 @@ static int sdw_slave_read_dp0(struct sdw_slave *slave,
 	fwnode_property_read_u32(port, "mipi-sdw-port-min-wordlength",
 				 &dp0->min_word);
 
-	nval = fwnode_property_read_u32_array(port,
-			"mipi-sdw-port-wordlength-configs", NULL, 0);
+	nval = fwnode_property_count_u32(port, "mipi-sdw-port-wordlength-configs");
 	if (nval > 0) {
 
 		dp0->num_words = nval;
@@ -193,8 +190,7 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 		fwnode_property_read_u32(node, "mipi-sdw-port-min-wordlength",
 					 &dpn[i].min_word);
 
-		nval = fwnode_property_read_u32_array(node,
-				"mipi-sdw-port-wordlength-configs", NULL, 0);
+		nval = fwnode_property_count_u32(node, "mipi-sdw-port-wordlength-configs");
 		if (nval > 0) {
 			dpn[i].num_words = nval;
 			dpn[i].words = devm_kcalloc(&slave->dev,
@@ -233,8 +229,7 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 		fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
 					 &dpn[i].max_ch);
 
-		nval = fwnode_property_read_u32_array(node,
-				"mipi-sdw-channel-number-list", NULL, 0);
+		nval = fwnode_property_count_u32(node, "mipi-sdw-channel-number-list");
 		if (nval > 0) {
 			dpn[i].num_ch = nval;
 			dpn[i].ch = devm_kcalloc(&slave->dev, dpn[i].num_ch,
@@ -248,8 +243,7 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 					dpn[i].ch, dpn[i].num_ch);
 		}
 
-		nval = fwnode_property_read_u32_array(node,
-				"mipi-sdw-channel-combination-list", NULL, 0);
+		nval = fwnode_property_count_u32(node, "mipi-sdw-channel-combination-list");
 		if (nval > 0) {
 			dpn[i].num_ch_combinations = nval;
 			dpn[i].ch_combinations = devm_kcalloc(&slave->dev,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
