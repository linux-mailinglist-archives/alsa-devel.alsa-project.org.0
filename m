Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C670175BBB
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 01:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DC071F75;
	Fri, 26 Jul 2019 01:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DC071F75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564099012;
	bh=C+z35H8h/9U3ys3z5bMt5OKhDLPCp5IFo4l3tnqoHDs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lMZECXs/MbV0nbIvRx0HD3K600ngvI/EIE1rC/VP+9iVTUeesW71/SJYHmdmZTheY
	 8zx22IkN/OpGROtajkgQI4ifW+Uu/EZ/8/QdnHyG6lGXIwUgRuxBXGfXCW+WqSit/j
	 hPCeRs8CeMx2PhoF1H50e0BBBoxQCx6+hX+JYqQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF610F80716;
	Fri, 26 Jul 2019 01:41:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C571CF80649; Fri, 26 Jul 2019 01:41:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B187F80639
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 01:41:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B187F80639
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 16:41:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,308,1559545200"; d="scan'208";a="369874750"
Received: from amrutaku-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.230.75])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2019 16:41:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 25 Jul 2019 18:40:13 -0500
Message-Id: <20190725234032.21152-22-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [RFC PATCH 21/40] soundwire: export helpers to find
	row and column values
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

Add a prefix for common tables and export 2 helpers to set the frame
shapes based on row/col values.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.h    |  7 +++++--
 drivers/soundwire/stream.c | 14 ++++++++------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 06ac4adb0074..c57c9c23f6ca 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -73,8 +73,11 @@ struct sdw_msg {
 
 #define SDW_DOUBLE_RATE_FACTOR		2
 
-extern int rows[SDW_FRAME_ROWS];
-extern int cols[SDW_FRAME_COLS];
+extern int sdw_rows[SDW_FRAME_ROWS];
+extern int sdw_cols[SDW_FRAME_COLS];
+
+int sdw_find_row_index(int row);
+int sdw_find_col_index(int col);
 
 /**
  * sdw_port_runtime: Runtime port parameters for Master or Slave
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index a0476755a459..53f5e790fcd7 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -21,37 +21,39 @@
  * The rows are arranged as per the array index value programmed
  * in register. The index 15 has dummy value 0 in order to fill hole.
  */
-int rows[SDW_FRAME_ROWS] = {48, 50, 60, 64, 75, 80, 125, 147,
+int sdw_rows[SDW_FRAME_ROWS] = {48, 50, 60, 64, 75, 80, 125, 147,
 			96, 100, 120, 128, 150, 160, 250, 0,
 			192, 200, 240, 256, 72, 144, 90, 180};
 
-int cols[SDW_FRAME_COLS] = {2, 4, 6, 8, 10, 12, 14, 16};
+int sdw_cols[SDW_FRAME_COLS] = {2, 4, 6, 8, 10, 12, 14, 16};
 
-static int sdw_find_col_index(int col)
+int sdw_find_col_index(int col)
 {
 	int i;
 
 	for (i = 0; i < SDW_FRAME_COLS; i++) {
-		if (cols[i] == col)
+		if (sdw_cols[i] == col)
 			return i;
 	}
 
 	pr_warn("Requested column not found, selecting lowest column no: 2\n");
 	return 0;
 }
+EXPORT_SYMBOL(sdw_find_col_index);
 
-static int sdw_find_row_index(int row)
+int sdw_find_row_index(int row)
 {
 	int i;
 
 	for (i = 0; i < SDW_FRAME_ROWS; i++) {
-		if (rows[i] == row)
+		if (sdw_rows[i] == row)
 			return i;
 	}
 
 	pr_warn("Requested row not found, selecting lowest row no: 48\n");
 	return 0;
 }
+EXPORT_SYMBOL(sdw_find_row_index);
 
 static int _sdw_program_slave_port_params(struct sdw_bus *bus,
 					  struct sdw_slave *slave,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
