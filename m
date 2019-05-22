Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D45D926EE7
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 21:53:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 678471607;
	Wed, 22 May 2019 21:52:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 678471607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558554816;
	bh=szP9kZ0SFVit7or+I24TEg8VcXn0O/1NhoBazGciZ9M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D6mKK8i4c8VT2arRn5QtpzoT97tSahzwJTOtOhmtnLD7HIKyKtsEAhb543pIUbsSF
	 2PRbTJs91aEwWlBYk3ZnzYyyt7ib2eoqQv8aI9vDTK6xmvCAuxTw8XE0O7Hbap4Twq
	 jyDD9P2Vm0BSltwepL/Y5LNT/3ouAzC/f6bBNtjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A9D8F89741;
	Wed, 22 May 2019 21:48:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06750F8972F; Wed, 22 May 2019 21:48:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FC91F89625
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 21:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FC91F89625
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 12:47:55 -0700
X-ExtLoop1: 1
Received: from cjpowell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.154.39])
 by fmsmga008.fm.intel.com with ESMTP; 22 May 2019 12:47:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 22 May 2019 14:47:22 -0500
Message-Id: <20190522194732.25704-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522194732.25704-1-pierre-louis.bossart@linux.intel.com>
References: <20190522194732.25704-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH v2 06/15] soundwire: rename 'freq' fields
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

Rename all fields with 'freq' as 'clk_freq' to follow the MIPI
specification and avoid confusion between bus clock and audio clocks.

No functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c        |  4 ++--
 drivers/soundwire/intel.c      | 11 ++++++-----
 drivers/soundwire/mipi_disco.c | 23 ++++++++++++-----------
 drivers/soundwire/stream.c     |  2 +-
 include/linux/soundwire/sdw.h  | 12 ++++++------
 5 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index aac35fc3cf22..96e42df8f458 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -87,7 +87,7 @@ int sdw_add_bus_master(struct sdw_bus *bus)
 
 	/*
 	 * Initialize clock values based on Master properties. The max
-	 * frequency is read from max_freq property. Current assumption
+	 * frequency is read from max_clk_freq property. Current assumption
 	 * is that the bus will start at highest clock frequency when
 	 * powered on.
 	 *
@@ -95,7 +95,7 @@ int sdw_add_bus_master(struct sdw_bus *bus)
 	 * to start with bank 0 (Table 40 of Spec)
 	 */
 	prop = &bus->prop;
-	bus->params.max_dr_freq = prop->max_freq * SDW_DOUBLE_RATE_FACTOR;
+	bus->params.max_dr_freq = prop->max_clk_freq * SDW_DOUBLE_RATE_FACTOR;
 	bus->params.curr_dr_freq = bus->params.max_dr_freq;
 	bus->params.curr_bank = SDW_BANK0;
 	bus->params.next_bank = SDW_BANK1;
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 31336b0271b0..4ac141730b13 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -796,13 +796,14 @@ static int intel_prop_read(struct sdw_bus *bus)
 	sdw_master_read_prop(bus);
 
 	/* BIOS is not giving some values correctly. So, lets override them */
-	bus->prop.num_freq = 1;
-	bus->prop.freq = devm_kcalloc(bus->dev, bus->prop.num_freq,
-				      sizeof(*bus->prop.freq), GFP_KERNEL);
-	if (!bus->prop.freq)
+	bus->prop.num_clk_freq = 1;
+	bus->prop.clk_freq = devm_kcalloc(bus->dev, bus->prop.num_clk_freq,
+					  sizeof(*bus->prop.clk_freq),
+					  GFP_KERNEL);
+	if (!bus->prop.clk_freq)
 		return -ENOMEM;
 
-	bus->prop.freq[0] = bus->prop.max_freq;
+	bus->prop.clk_freq[0] = bus->prop.max_clk_freq;
 	bus->prop.err_threshold = 5;
 
 	return 0;
diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index 6df68584c963..b1770af43fa8 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -58,31 +58,32 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 
 	fwnode_property_read_u32(link,
 				 "mipi-sdw-max-clock-frequency",
-				 &prop->max_freq);
+				 &prop->max_clk_freq);
 
 	nval = fwnode_property_read_u32_array(link,
 			"mipi-sdw-clock-frequencies-supported", NULL, 0);
 	if (nval > 0) {
-		prop->num_freq = nval;
-		prop->freq = devm_kcalloc(bus->dev, prop->num_freq,
-					  sizeof(*prop->freq), GFP_KERNEL);
-		if (!prop->freq)
+		prop->num_clk_freq = nval;
+		prop->clk_freq = devm_kcalloc(bus->dev, prop->num_clk_freq,
+					      sizeof(*prop->clk_freq),
+					      GFP_KERNEL);
+		if (!prop->clk_freq)
 			return -ENOMEM;
 
 		fwnode_property_read_u32_array(link,
 				"mipi-sdw-clock-frequencies-supported",
-				prop->freq, prop->num_freq);
+				prop->clk_freq, prop->num_clk_freq);
 	}
 
 	/*
 	 * Check the frequencies supported. If FW doesn't provide max
 	 * freq, then populate here by checking values.
 	 */
-	if (!prop->max_freq && prop->freq) {
-		prop->max_freq = prop->freq[0];
-		for (i = 1; i < prop->num_freq; i++) {
-			if (prop->freq[i] > prop->max_freq)
-				prop->max_freq = prop->freq[i];
+	if (!prop->max_clk_freq && prop->clk_freq) {
+		prop->max_clk_freq = prop->clk_freq[0];
+		for (i = 1; i < prop->num_clk_freq; i++) {
+			if (prop->clk_freq[i] > prop->max_clk_freq)
+				prop->max_clk_freq = prop->clk_freq[i];
 		}
 	}
 
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index d01060dbee96..89edc897b8eb 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1474,7 +1474,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
 		memcpy(&params, &bus->params, sizeof(params));
 
 		/* TODO: Support Asynchronous mode */
-		if ((prop->max_freq % stream->params.rate) != 0) {
+		if ((prop->max_clk_freq % stream->params.rate) != 0) {
 			dev_err(bus->dev, "Async mode not supported\n");
 			return -EINVAL;
 		}
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 14376d8458c3..c6ded0d7a9f2 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -365,11 +365,11 @@ struct sdw_slave_prop {
  * struct sdw_master_prop - Master properties
  * @revision: MIPI spec version of the implementation
  * @clk_stop_mode: Bitmap for Clock Stop modes supported
- * @max_freq: Maximum Bus clock frequency, in Hz
+ * @max_clk_freq: Maximum Bus clock frequency, in Hz
  * @num_clk_gears: Number of clock gears supported
  * @clk_gears: Clock gears supported
- * @num_freq: Number of clock frequencies supported, in Hz
- * @freq: Clock frequencies supported, in Hz
+ * @num_clk_freq: Number of clock frequencies supported, in Hz
+ * @clk_freq: Clock frequencies supported, in Hz
  * @default_frame_rate: Controller default Frame rate, in Hz
  * @default_row: Number of rows
  * @default_col: Number of columns
@@ -380,11 +380,11 @@ struct sdw_slave_prop {
 struct sdw_master_prop {
 	u32 revision;
 	enum sdw_clk_stop_mode clk_stop_mode;
-	u32 max_freq;
+	u32 max_clk_freq;
 	u32 num_clk_gears;
 	u32 *clk_gears;
-	u32 num_freq;
-	u32 *freq;
+	u32 num_clk_freq;
+	u32 *clk_freq;
 	u32 default_frame_rate;
 	u32 default_row;
 	u32 default_col;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
