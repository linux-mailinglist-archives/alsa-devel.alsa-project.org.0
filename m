Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F015275BE6
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 02:08:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 826761FAC;
	Fri, 26 Jul 2019 02:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 826761FAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564099710;
	bh=ubjM3T+Xe3KrY+hQh70736kNR4XNYzYdhDiXtnepLkg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hMxnjATW4ow9OT9AFmUO0JNi3bkt8M2k938As3qJV7wwuTLaFdRaXCU6yLfj5HE4w
	 CPlDoxwHGgPJh7VSwDhPO3PbQ/WOMjcw1qjepe87YZ4rf1pve8e73HomZYxWbMkW6v
	 sRBtgIRIedN3uTHss0w0nVhY002Wmp90M5VqNqsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EA23F80CBE;
	Fri, 26 Jul 2019 01:42:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F146F8087C; Fri, 26 Jul 2019 01:42:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39ED9F8085B
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 01:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39ED9F8085B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 16:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,308,1559545200"; d="scan'208";a="369874864"
Received: from amrutaku-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.230.75])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2019 16:41:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 25 Jul 2019 18:40:30 -0500
Message-Id: <20190725234032.21152-39-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [RFC PATCH 38/40] soundwire: cadence_master: make
	clock stop exit configurable on init
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

The use of clock stop is not a requirement, the IP can e.g. be
completely power gated and not detect any wakes while in s2idle/deep
sleep.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 15 ++++++++-------
 drivers/soundwire/cadence_master.h |  2 +-
 drivers/soundwire/intel.c          |  2 +-
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 53278aa2436f..4ab6f70d7705 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1010,7 +1010,7 @@ static u32 cdns_set_default_frame_shape(int n_rows, int n_cols)
  * sdw_cdns_init() - Cadence initialization
  * @cdns: Cadence instance
  */
-int sdw_cdns_init(struct sdw_cdns *cdns)
+int sdw_cdns_init(struct sdw_cdns *cdns, bool clock_stop_exit)
 {
 	struct sdw_bus *bus = &cdns->bus;
 	struct sdw_master_prop *prop = &bus->prop;
@@ -1018,12 +1018,13 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
 	int divider;
 	int ret;
 
-	/* Exit clock stop */
-	ret = cdns_clear_bit(cdns, CDNS_MCP_CONTROL,
-			     CDNS_MCP_CONTROL_CLK_STOP_CLR);
-	if (ret < 0) {
-		dev_err(cdns->dev, "Couldn't exit from clock stop\n");
-		return ret;
+	if (clock_stop_exit) {
+		ret = cdns_clear_bit(cdns, CDNS_MCP_CONTROL,
+				     CDNS_MCP_CONTROL_CLK_STOP_CLR);
+		if (ret < 0) {
+			dev_err(cdns->dev, "Couldn't exit from clock stop\n");
+			return ret;
+		}
 	}
 
 	/* Set clock divider */
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 1a0ba36dd78f..091b771b570d 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -158,7 +158,7 @@ extern struct sdw_master_ops sdw_cdns_master_ops;
 irqreturn_t sdw_cdns_irq(int irq, void *dev_id);
 irqreturn_t sdw_cdns_thread(int irq, void *dev_id);
 
-int sdw_cdns_init(struct sdw_cdns *cdns);
+int sdw_cdns_init(struct sdw_cdns *cdns, bool clock_stop_exit);
 int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
 		      struct sdw_cdns_stream_config config);
 int sdw_cdns_exit_reset(struct sdw_cdns *cdns);
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 1192d5775484..db7bf2912767 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1043,7 +1043,7 @@ static int intel_init(struct sdw_intel *sdw)
 	intel_link_power_up(sdw);
 	intel_shim_init(sdw);
 
-	return sdw_cdns_init(&sdw->cdns);
+	return sdw_cdns_init(&sdw->cdns, false);
 }
 
 /*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
