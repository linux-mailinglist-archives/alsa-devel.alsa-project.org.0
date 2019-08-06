Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 706FE828F5
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 03:00:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BB141696;
	Tue,  6 Aug 2019 02:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BB141696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565053241;
	bh=Ko4naHXyNUFKnYY0UbpFTo6qdoRKNSB+ESSSKzY0RPI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IqsbIE7cwe/bX/8XKf2JsQ0lDIowMxzYGy6J1THK7J91TWoy/FUiiaTC9jB/lEdqj
	 62zZUphmQaOgCqiHrg1dVIZWEKzg0jJ6WqlkFMph1OaYXEdeI6R4mO0Y8AbenjwQ3t
	 /3m25TRuemifuPy1A1WYjGmdsu5aMqdSQm6ryNts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D9FDF80611;
	Tue,  6 Aug 2019 02:55:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DAA4F8059F; Tue,  6 Aug 2019 02:55:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBB6BF8059F
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 02:55:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBB6BF8059F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 17:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="198153140"
Received: from sahluwal-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.202.215])
 by fmsmga004.fm.intel.com with ESMTP; 05 Aug 2019 17:55:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  5 Aug 2019 19:55:10 -0500
Message-Id: <20190806005522.22642-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
References: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, Blauciak@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Slawomir <slawomir.blauciak@intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH 05/17] soundwire: export helpers to find row
	and column values
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

These changes simplify bandwidth allocation algorithms as well as the
Cadence parts which all need to convert from frame shape to indices
used by the standard. These helpers are used in the following patch.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.h    |  7 +++++--
 drivers/soundwire/stream.c | 14 ++++++++------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 648436a995a3..89e74adf96fa 100644
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
