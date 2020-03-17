Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40740188AFF
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 17:47:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D906218C3;
	Tue, 17 Mar 2020 17:46:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D906218C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584463633;
	bh=6pDkbMiQIPyRjpGEQZyGsE+4vOzLaGmLdtl72GGyRjo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qsagqs+8kNx5qf/6Ufv3cPc0P0vptgr8KHAISDkD8dU4KQw+wWkqKErwTadDLe37/
	 Oy4+17LzjxpVjsUhD7emI2xdTy1Vstmc0Sjm8LsQfipxi8yh1WmxyPVmLKjLit1Q2a
	 J5KpYhYWl2oL80OiRX3jD3lR6imWQLMWVnT/rXrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0EF9F80328;
	Tue, 17 Mar 2020 17:38:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25613F8028E; Tue, 17 Mar 2020 17:36:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA3AAF80232
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 17:34:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA3AAF80232
IronPort-SDR: 85b2cDqmseXJDDn29AUWGBl9G5JS0WS8f8POOcpiVz4/nYMZpR63EkF1TZAYI1NrB/Dfb73NWg
 bkNi9dKNLARA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 09:34:31 -0700
IronPort-SDR: GMYUhhcSFaKUMB6JRJ8wEZsqidKjsquIrDcaJt3x0tlPRQKP9sZBncfxvNFAZrHKu5nL829aIp
 qFNz1p7f38gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,565,1574150400"; d="scan'208";a="244533223"
Received: from aavila-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.36.39])
 by orsmga003.jf.intel.com with ESMTP; 17 Mar 2020 09:34:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 10/17] soundwire: cadence: make SSP interval programmable
Date: Tue, 17 Mar 2020 11:33:22 -0500
Message-Id: <20200317163329.25501-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317163329.25501-1-pierre-louis.bossart@linux.intel.com>
References: <20200317163329.25501-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

In multi-master mode, the IP will only accept SSP intervals with
integer relationships between the frame rate and the gsync frequency.

E.g for a 48kHz frame rate and 4 kHz gsync signal, the SSP interval
can only be 1, 2, 3, 4, 6, 12.

To simplify we only allow one SSP per gsync interval.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 7 ++++---
 drivers/soundwire/cadence_master.h | 3 +++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index fb697ff665f5..773341568d7e 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -183,7 +183,6 @@ MODULE_PARM_DESC(cdns_mcp_int_mask, "Cadence MCP IntMask");
 #define CDNS_PDI_CONFIG_PORT			GENMASK(4, 0)
 
 /* Driver defaults */
-#define CDNS_DEFAULT_SSP_INTERVAL		0x18
 #define CDNS_TX_TIMEOUT				2000
 
 #define CDNS_SCP_RX_FIFOLEVEL			0x2
@@ -1048,6 +1047,7 @@ static void cdns_init_clock_ctrl(struct sdw_cdns *cdns)
 	struct sdw_bus *bus = &cdns->bus;
 	struct sdw_master_prop *prop = &bus->prop;
 	u32 val;
+	u32 ssp_interval;
 	int divider;
 
 	/* Set clock divider */
@@ -1067,8 +1067,9 @@ static void cdns_init_clock_ctrl(struct sdw_cdns *cdns)
 	cdns_writel(cdns, CDNS_MCP_FRAME_SHAPE_INIT, val);
 
 	/* Set SSP interval to default value */
-	cdns_writel(cdns, CDNS_MCP_SSP_CTRL0, CDNS_DEFAULT_SSP_INTERVAL);
-	cdns_writel(cdns, CDNS_MCP_SSP_CTRL1, CDNS_DEFAULT_SSP_INTERVAL);
+	ssp_interval = prop->default_frame_rate / SDW_CADENCE_GSYNC_HZ;
+	cdns_writel(cdns, CDNS_MCP_SSP_CTRL0, ssp_interval);
+	cdns_writel(cdns, CDNS_MCP_SSP_CTRL1, ssp_interval);
 }
 
 /**
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index e8fa5c7e09f4..b410656f8194 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -5,6 +5,9 @@
 #ifndef __SDW_CADENCE_H
 #define __SDW_CADENCE_H
 
+#define SDW_CADENCE_GSYNC_KHZ		4 /* 4 kHz */
+#define SDW_CADENCE_GSYNC_HZ		(SDW_CADENCE_GSYNC_KHZ * 1000)
+
 /**
  * struct sdw_cdns_pdi: PDI (Physical Data Interface) instance
  *
-- 
2.20.1

