Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0340B136A3
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 02:36:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96C181882;
	Sat,  4 May 2019 02:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96C181882
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556930214;
	bh=BsukzlkqExUgRoO/CE7fRiGn5kbNts4ac4YJADeGlYI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d/qp1zbLv0JkZZIbDmbXm2CqHf4LJvV/LuxSZKjusLwzg5sgN/UyaPirAUvcLUYTn
	 8kUG8SRSwKBWOeHIHNx9D4MBfi6wRkWsYBiimLk2vMvCm3+ux+9MrE00yHAaPIbUJf
	 uN7+uLx/8mgcSkOQ40hl6G9TcS0M5+64tiDQMS+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D143CF8974A;
	Sat,  4 May 2019 02:30:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66D15F8075A; Sat,  4 May 2019 02:29:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70777F89700
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 02:29:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70777F89700
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2019 17:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,427,1549958400"; d="scan'208";a="170430483"
Received: from jlwhitty-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.28.45])
 by fmsmga001.fm.intel.com with ESMTP; 03 May 2019 17:29:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  3 May 2019 19:29:26 -0500
Message-Id: <20190504002926.28815-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504002926.28815-1-pierre-louis.bossart@linux.intel.com>
References: <20190504002926.28815-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH 8/8] soundwire: rename/clarify MIPI DisCo
	properties
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

The existing definitions are ambiguous and possibly misleading.

For DP0, 'flow-control' is only relevant for the BRA protocol and
should not be confused with async modes explicitly not supported for
DP0, add prefix to follow MIPI DisCo definition

The use of 'device_interrupts' is also questionable. The MIPI
SoundWire spec defines Slave-, DP0- and DPN-level
implementation-defined interrupts. Using the 'device' prefix in the
last two cases is misleading, not only is the term 'device' overloaded
but these properties are only valid at the DP0 and DPn levels. Rename
to follow the MIPI definitions, no need to be creative here.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c        |  2 +-
 drivers/soundwire/mipi_disco.c |  6 +++---
 drivers/soundwire/stream.c     |  6 +++---
 include/linux/soundwire/sdw.h  | 13 +++++++------
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 96e42df8f458..fe745830a261 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -648,7 +648,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
 		return 0;
 
 	/* Enable DP0 interrupts */
-	val = prop->dp0_prop->device_interrupts;
+	val = prop->dp0_prop->imp_def_interrupts;
 	val |= SDW_DP0_INT_PORT_READY | SDW_DP0_INT_BRA_FAILURE;
 
 	ret = sdw_update(slave, SDW_DP0_INTMASK, val, val);
diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index 7db816691393..a065cba8c2c5 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -150,13 +150,13 @@ int sdw_slave_read_dp0(struct sdw_slave *slave,
 				dp0->words, dp0->num_words);
 	}
 
-	dp0->flow_controlled = fwnode_property_read_bool(port,
+	dp0->BRA_flow_controlled = fwnode_property_read_bool(port,
 				"mipi-sdw-bra-flow-controlled");
 
 	dp0->simple_ch_prep_sm = fwnode_property_read_bool(port,
 				"mipi-sdw-simplified-channel-prepare-sm");
 
-	dp0->device_interrupts = fwnode_property_read_bool(port,
+	dp0->imp_def_interrupts = fwnode_property_read_bool(port,
 				"mipi-sdw-imp-def-dp0-interrupts-supported");
 
 	return 0;
@@ -226,7 +226,7 @@ int sdw_slave_read_dpn(struct sdw_slave *slave,
 
 		fwnode_property_read_u32(node,
 				"mipi-sdw-imp-def-dpn-interrupts-supported",
-				&dpn[i].device_interrupts);
+				&dpn[i].imp_def_interrupts);
 
 		fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
 					 &dpn[i].min_ch);
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 89edc897b8eb..ce9cb7fa4724 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -439,7 +439,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 
 	prep_ch.bank = bus->params.next_bank;
 
-	if (dpn_prop->device_interrupts || !dpn_prop->simple_ch_prep_sm)
+	if (dpn_prop->imp_def_interrupts || !dpn_prop->simple_ch_prep_sm)
 		intr = true;
 
 	/*
@@ -449,7 +449,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 	 */
 	if (prep && intr) {
 		ret = sdw_configure_dpn_intr(s_rt->slave, p_rt->num, prep,
-					     dpn_prop->device_interrupts);
+					     dpn_prop->imp_def_interrupts);
 		if (ret < 0)
 			return ret;
 	}
@@ -493,7 +493,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 	/* Disable interrupt after Port de-prepare */
 	if (!prep && intr)
 		ret = sdw_configure_dpn_intr(s_rt->slave, p_rt->num, prep,
-					     dpn_prop->device_interrupts);
+					     dpn_prop->imp_def_interrupts);
 
 	return ret;
 }
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 89c51838b7ec..3b231472464a 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -206,10 +206,11 @@ enum sdw_clk_stop_mode {
  * (inclusive)
  * @num_words: number of wordlengths supported
  * @words: wordlengths supported
- * @flow_controlled: Slave implementation results in an OK_NotReady
+ * @BRA_flow_controlled: Slave implementation results in an OK_NotReady
  * response
  * @simple_ch_prep_sm: If channel prepare sequence is required
- * @device_interrupts: If implementation-defined interrupts are supported
+ * @imp_def_interrupts: If set, each bit corresponds to support for
+ * implementation-defined interrupts
  *
  * The wordlengths are specified by Spec as max, min AND number of
  * discrete values, implementation can define based on the wordlengths they
@@ -220,9 +221,9 @@ struct sdw_dp0_prop {
 	u32 min_word;
 	u32 num_words;
 	u32 *words;
-	bool flow_controlled;
+	bool BRA_flow_controlled;
 	bool simple_ch_prep_sm;
-	bool device_interrupts;
+	bool imp_def_interrupts;
 };
 
 /**
@@ -272,7 +273,7 @@ struct sdw_dpn_audio_mode {
  * @simple_ch_prep_sm: If the port supports simplified channel prepare state
  * machine
  * @ch_prep_timeout: Port-specific timeout value, in milliseconds
- * @device_interrupts: If set, each bit corresponds to support for
+ * @imp_def_interrupts: If set, each bit corresponds to support for
  * implementation-defined interrupts
  * @max_ch: Maximum channels supported
  * @min_ch: Minimum channels supported
@@ -297,7 +298,7 @@ struct sdw_dpn_prop {
 	u32 max_grouping;
 	bool simple_ch_prep_sm;
 	u32 ch_prep_timeout;
-	u32 device_interrupts;
+	u32 imp_def_interrupts;
 	u32 max_ch;
 	u32 min_ch;
 	u32 num_ch;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
