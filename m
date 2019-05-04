Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BEA136A0
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 02:34:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A543187D;
	Sat,  4 May 2019 02:34:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A543187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556930092;
	bh=rkCqCuMcuJA3WesTmcxcOEliQ5XgtXrZcePXh1g4tyA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a7dCQT6o9ktVZnfPtpmBGhp3IejYVWZ7vvdbmdCty8Dev6cqWM8qviUiwa+kXTo7/
	 AUEHV51zyFF7t92SsdwPOUvV/OGhiQkIhf348OUSKZafaOhJbgqk5t2HB2ENTGfvU+
	 IvCIlnP1kox262a94zy1iO2KiFyNSseAvOGI07NY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B5B4F89735;
	Sat,  4 May 2019 02:30:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D97EFF8075A; Sat,  4 May 2019 02:29:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9445F896B9
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 02:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9445F896B9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2019 17:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,427,1549958400"; d="scan'208";a="170430461"
Received: from jlwhitty-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.28.45])
 by fmsmga001.fm.intel.com with ESMTP; 03 May 2019 17:29:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  3 May 2019 19:29:23 -0500
Message-Id: <20190504002926.28815-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504002926.28815-1-pierre-louis.bossart@linux.intel.com>
References: <20190504002926.28815-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH 5/8] soundwire: add port-related definitions
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Somehow previous header files did not include definition for
sink/source, flow and grouping.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 53 +++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 594c17ed8593..bd05a85d345c 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -41,6 +41,31 @@ struct sdw_slave;
 #define SDW_DAI_ID_RANGE_START		100
 #define SDW_DAI_ID_RANGE_END		200
 
+enum {
+	SDW_PORT_DIRN_SINK = 0,
+	SDW_PORT_DIRN_SOURCE,
+	SDW_PORT_DIRN_MAX,
+};
+
+/*
+ * constants for flow control, ports and transport
+ *
+ * these are bit masks as devices can have multiple capabilities
+ */
+
+/*
+ * flow modes for SDW port. These can be isochronous, tx controlled,
+ * rx controlled or async
+ */
+#define SDW_PORT_FLOW_MODE_ISOCH	0
+#define SDW_PORT_FLOW_MODE_TX_CNTRL	BIT(0)
+#define SDW_PORT_FLOW_MODE_RX_CNTRL	BIT(1)
+#define SDW_PORT_FLOW_MODE_ASYNC	GENMASK(1, 0)
+
+/* sample packaging for block. It can be per port or per channel */
+#define SDW_BLOCK_PACKG_PER_PORT	BIT(0)
+#define SDW_BLOCK_PACKG_PER_CH		BIT(1)
+
 /**
  * enum sdw_slave_status - Slave status
  * @SDW_SLAVE_UNATTACHED: Slave is not attached with the bus.
@@ -76,6 +101,14 @@ enum sdw_command_response {
 	SDW_CMD_FAIL_OTHER = 4,
 };
 
+/* block group count enum */
+enum sdw_dpn_grouping {
+	SDW_BLK_GRP_CNT_1 = 0,
+	SDW_BLK_GRP_CNT_2 = 1,
+	SDW_BLK_GRP_CNT_3 = 2,
+	SDW_BLK_GRP_CNT_4 = 3,
+};
+
 /**
  * enum sdw_stream_type: data stream type
  *
@@ -100,6 +133,26 @@ enum sdw_data_direction {
 	SDW_DATA_DIR_TX = 1,
 };
 
+/**
+ * enum sdw_port_data_mode: Data Port mode
+ *
+ * @SDW_PORT_DATA_MODE_NORMAL: Normal data mode where audio data is received
+ * and transmitted.
+ * @SDW_PORT_DATA_MODE_STATIC_1: Simple test mode which uses static value of
+ * logic 1. The encoding will result in signal transitions at every bitslot
+ * owned by this Port
+ * @SDW_PORT_DATA_MODE_STATIC_0: Simple test mode which uses static value of
+ * logic 0. The encoding will result in no signal transitions
+ * @SDW_PORT_DATA_MODE_PRBS: Test mode which uses a PRBS generator to produce
+ * a pseudo random data pattern that is transferred
+ */
+enum sdw_port_data_mode {
+	SDW_PORT_DATA_MODE_NORMAL = 0,
+	SDW_PORT_DATA_MODE_STATIC_1 = 1,
+	SDW_PORT_DATA_MODE_STATIC_0 = 2,
+	SDW_PORT_DATA_MODE_PRBS = 3,
+};
+
 /*
  * SDW properties, defined in MIPI DisCo spec v1.0
  */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
