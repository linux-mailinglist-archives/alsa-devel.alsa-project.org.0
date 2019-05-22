Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2D126F07
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 21:54:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD6AF15E5;
	Wed, 22 May 2019 21:53:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD6AF15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558554854;
	bh=4tZp41E6sbZarLTQVYdL3JFu8ouOFRsbfVvseLeKFxQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pNve49Jk9H3N6EJ5mczX0+ruPV8DXvqEb16PaFNaiQ2/WBxqxg/daSd4w8AgduMei
	 a/rxw4roYRegNOkZy7aaDbIZG5IViLvAZhAedj03MS7K4aRQcS4g+i4kTSCEJDuB3V
	 7zuO9lpzcyUU8X2Z5SBNkeH1R5T/v7Epng2jkRVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A24FF89746;
	Wed, 22 May 2019 21:48:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70FB6F89731; Wed, 22 May 2019 21:48:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19AD5F896E9
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 21:47:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19AD5F896E9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 12:47:57 -0700
X-ExtLoop1: 1
Received: from cjpowell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.154.39])
 by fmsmga008.fm.intel.com with ESMTP; 22 May 2019 12:47:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 22 May 2019 14:47:23 -0500
Message-Id: <20190522194732.25704-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522194732.25704-1-pierre-louis.bossart@linux.intel.com>
References: <20190522194732.25704-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH v2 07/15] soundwire: mipi-disco: fix clock stop
	modes
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

Fix support for clock_stop_mode0 and 1. The existing code uses a
bitmask between enums, one of which being zero. Or-ing with zero is
not very useful in general...Fix by or-ing with a BIT dependent on the
enum value.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/mipi_disco.c | 4 ++--
 include/linux/soundwire/sdw.h  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index b1770af43fa8..efb87ee0e7fc 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -50,11 +50,11 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 
 	if (fwnode_property_read_bool(link,
 				      "mipi-sdw-clock-stop-mode0-supported"))
-		prop->clk_stop_mode = SDW_CLK_STOP_MODE0;
+		prop->clk_stop_modes |= BIT(SDW_CLK_STOP_MODE0);
 
 	if (fwnode_property_read_bool(link,
 				      "mipi-sdw-clock-stop-mode1-supported"))
-		prop->clk_stop_mode |= SDW_CLK_STOP_MODE1;
+		prop->clk_stop_modes |= BIT(SDW_CLK_STOP_MODE1);
 
 	fwnode_property_read_u32(link,
 				 "mipi-sdw-max-clock-frequency",
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index c6ded0d7a9f2..0e3fdd03e589 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -364,7 +364,7 @@ struct sdw_slave_prop {
 /**
  * struct sdw_master_prop - Master properties
  * @revision: MIPI spec version of the implementation
- * @clk_stop_mode: Bitmap for Clock Stop modes supported
+ * @clk_stop_modes: Bitmap, bit N set when clock-stop-modeN supported
  * @max_clk_freq: Maximum Bus clock frequency, in Hz
  * @num_clk_gears: Number of clock gears supported
  * @clk_gears: Clock gears supported
@@ -379,7 +379,7 @@ struct sdw_slave_prop {
  */
 struct sdw_master_prop {
 	u32 revision;
-	enum sdw_clk_stop_mode clk_stop_mode;
+	u32 clk_stop_modes;
 	u32 max_clk_freq;
 	u32 num_clk_gears;
 	u32 *clk_gears;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
