Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E11210A93
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 18:06:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 226D116F3;
	Wed,  1 May 2019 18:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 226D116F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556726808;
	bh=U0DVsZQEa06PmkOcC94x09XKhyGFEjaWTheHrneqhmU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=USEJUeK1ZhEkCpIoQtfG5MbhT3qbRyZiWcEbtv7Ryu2euS58BR/x8+Jwvlt3DEmX6
	 ogaQ5XnKU14qx+R/kdQk0hvHKDyEYfk8qUfv4yrytb88+4CqSPxHkHHcavL4Tli0WE
	 scJhVChmJo4C+txyuxwpgVUTwh6VlqfTV2+TJIJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0A49F89753;
	Wed,  1 May 2019 17:58:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9E38F89740; Wed,  1 May 2019 17:58:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 218CCF89728
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 17:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 218CCF89728
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 08:58:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,418,1549958400"; d="scan'208";a="296115714"
Received: from modiarvi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.211])
 by orsmga004.jf.intel.com with ESMTP; 01 May 2019 08:58:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  1 May 2019 10:57:33 -0500
Message-Id: <20190501155745.21806-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH v4 10/22] soundwire: mipi_disco: fix alignment
	issues
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

Use Linux style. In some cases parenthesis alignment is modified to
keep the code readable.

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/mipi_disco.c | 112 ++++++++++++++++++---------------
 1 file changed, 62 insertions(+), 50 deletions(-)

diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index fdeba0c3b589..95efa82dc73b 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -35,11 +35,12 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 	int nval, i;
 
 	device_property_read_u32(bus->dev,
-			"mipi-sdw-sw-interface-revision", &prop->revision);
+				 "mipi-sdw-sw-interface-revision",
+				 &prop->revision);
 
 	/* Find master handle */
 	snprintf(name, sizeof(name),
-			"mipi-sdw-master-%d-subproperties", bus->link_id);
+		 "mipi-sdw-master-%d-subproperties", bus->link_id);
 
 	link = device_get_named_child_node(bus->dev, name);
 	if (!link) {
@@ -56,7 +57,8 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 		prop->clk_stop_mode |= SDW_CLK_STOP_MODE1;
 
 	fwnode_property_read_u32(link,
-			"mipi-sdw-max-clock-frequency", &prop->max_freq);
+				 "mipi-sdw-max-clock-frequency",
+				 &prop->max_freq);
 
 	nval = fwnode_property_read_u32_array(link,
 			"mipi-sdw-clock-frequencies-supported", NULL, 0);
@@ -64,7 +66,7 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 
 		prop->num_freq = nval;
 		prop->freq = devm_kcalloc(bus->dev, prop->num_freq,
-				sizeof(*prop->freq), GFP_KERNEL);
+					  sizeof(*prop->freq), GFP_KERNEL);
 		if (!prop->freq)
 			return -ENOMEM;
 
@@ -91,44 +93,47 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 
 		prop->num_clk_gears = nval;
 		prop->clk_gears = devm_kcalloc(bus->dev, prop->num_clk_gears,
-				sizeof(*prop->clk_gears), GFP_KERNEL);
+					       sizeof(*prop->clk_gears),
+					       GFP_KERNEL);
 		if (!prop->clk_gears)
 			return -ENOMEM;
 
 		fwnode_property_read_u32_array(link,
-				"mipi-sdw-supported-clock-gears",
-				prop->clk_gears, prop->num_clk_gears);
+					       "mipi-sdw-supported-clock-gears",
+					       prop->clk_gears,
+					       prop->num_clk_gears);
 	}
 
 	fwnode_property_read_u32(link, "mipi-sdw-default-frame-rate",
-			&prop->default_frame_rate);
+				 &prop->default_frame_rate);
 
 	fwnode_property_read_u32(link, "mipi-sdw-default-frame-row-size",
-			&prop->default_row);
+				 &prop->default_row);
 
 	fwnode_property_read_u32(link, "mipi-sdw-default-frame-col-size",
-			&prop->default_col);
+				 &prop->default_col);
 
 	prop->dynamic_frame =  fwnode_property_read_bool(link,
 			"mipi-sdw-dynamic-frame-shape");
 
 	fwnode_property_read_u32(link, "mipi-sdw-command-error-threshold",
-			&prop->err_threshold);
+				 &prop->err_threshold);
 
 	return 0;
 }
 EXPORT_SYMBOL(sdw_master_read_prop);
 
 static int sdw_slave_read_dp0(struct sdw_slave *slave,
-		struct fwnode_handle *port, struct sdw_dp0_prop *dp0)
+			      struct fwnode_handle *port,
+			      struct sdw_dp0_prop *dp0)
 {
 	int nval;
 
 	fwnode_property_read_u32(port, "mipi-sdw-port-max-wordlength",
-			&dp0->max_word);
+				 &dp0->max_word);
 
 	fwnode_property_read_u32(port, "mipi-sdw-port-min-wordlength",
-			&dp0->min_word);
+				 &dp0->min_word);
 
 	nval = fwnode_property_read_u32_array(port,
 			"mipi-sdw-port-wordlength-configs", NULL, 0);
@@ -136,8 +141,8 @@ static int sdw_slave_read_dp0(struct sdw_slave *slave,
 
 		dp0->num_words = nval;
 		dp0->words = devm_kcalloc(&slave->dev,
-				dp0->num_words, sizeof(*dp0->words),
-				GFP_KERNEL);
+					  dp0->num_words, sizeof(*dp0->words),
+					  GFP_KERNEL);
 		if (!dp0->words)
 			return -ENOMEM;
 
@@ -146,20 +151,21 @@ static int sdw_slave_read_dp0(struct sdw_slave *slave,
 				dp0->words, dp0->num_words);
 	}
 
-	dp0->flow_controlled = fwnode_property_read_bool(
-			port, "mipi-sdw-bra-flow-controlled");
+	dp0->flow_controlled = fwnode_property_read_bool(port,
+				"mipi-sdw-bra-flow-controlled");
 
-	dp0->simple_ch_prep_sm = fwnode_property_read_bool(
-			port, "mipi-sdw-simplified-channel-prepare-sm");
+	dp0->simple_ch_prep_sm = fwnode_property_read_bool(port,
+				"mipi-sdw-simplified-channel-prepare-sm");
 
-	dp0->device_interrupts = fwnode_property_read_bool(
-			port, "mipi-sdw-imp-def-dp0-interrupts-supported");
+	dp0->device_interrupts = fwnode_property_read_bool(port,
+				"mipi-sdw-imp-def-dp0-interrupts-supported");
 
 	return 0;
 }
 
 static int sdw_slave_read_dpn(struct sdw_slave *slave,
-		struct sdw_dpn_prop *dpn, int count, int ports, char *type)
+			      struct sdw_dpn_prop *dpn, int count, int ports,
+			      char *type)
 {
 	struct fwnode_handle *node;
 	u32 bit, i = 0;
@@ -173,7 +179,7 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 
 	for_each_set_bit(bit, &addr, 32) {
 		snprintf(name, sizeof(name),
-			"mipi-sdw-dp-%d-%s-subproperties", bit, type);
+			 "mipi-sdw-dp-%d-%s-subproperties", bit, type);
 
 		dpn[i].num = bit;
 
@@ -184,9 +190,9 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 		}
 
 		fwnode_property_read_u32(node, "mipi-sdw-port-max-wordlength",
-					&dpn[i].max_word);
+					 &dpn[i].max_word);
 		fwnode_property_read_u32(node, "mipi-sdw-port-min-wordlength",
-					&dpn[i].min_word);
+					 &dpn[i].min_word);
 
 		nval = fwnode_property_read_u32_array(node,
 				"mipi-sdw-port-wordlength-configs", NULL, 0);
@@ -194,8 +200,9 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 
 			dpn[i].num_words = nval;
 			dpn[i].words = devm_kcalloc(&slave->dev,
-					dpn[i].num_words,
-					sizeof(*dpn[i].words), GFP_KERNEL);
+						    dpn[i].num_words,
+						    sizeof(*dpn[i].words),
+						    GFP_KERNEL);
 			if (!dpn[i].words)
 				return -ENOMEM;
 
@@ -205,28 +212,28 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 		}
 
 		fwnode_property_read_u32(node, "mipi-sdw-data-port-type",
-				&dpn[i].type);
+					 &dpn[i].type);
 
 		fwnode_property_read_u32(node,
-				"mipi-sdw-max-grouping-supported",
-				&dpn[i].max_grouping);
+					 "mipi-sdw-max-grouping-supported",
+					 &dpn[i].max_grouping);
 
 		dpn[i].simple_ch_prep_sm = fwnode_property_read_bool(node,
 				"mipi-sdw-simplified-channelprepare-sm");
 
 		fwnode_property_read_u32(node,
-				"mipi-sdw-port-channelprepare-timeout",
-				&dpn[i].ch_prep_timeout);
+					 "mipi-sdw-port-channelprepare-timeout",
+					 &dpn[i].ch_prep_timeout);
 
 		fwnode_property_read_u32(node,
 				"mipi-sdw-imp-def-dpn-interrupts-supported",
 				&dpn[i].device_interrupts);
 
 		fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
-				&dpn[i].min_ch);
+					 &dpn[i].min_ch);
 
 		fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
-				&dpn[i].max_ch);
+					 &dpn[i].max_ch);
 
 		nval = fwnode_property_read_u32_array(node,
 				"mipi-sdw-channel-number-list", NULL, 0);
@@ -234,7 +241,8 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 
 			dpn[i].num_ch = nval;
 			dpn[i].ch = devm_kcalloc(&slave->dev, dpn[i].num_ch,
-					sizeof(*dpn[i].ch), GFP_KERNEL);
+						 sizeof(*dpn[i].ch),
+						 GFP_KERNEL);
 			if (!dpn[i].ch)
 				return -ENOMEM;
 
@@ -265,13 +273,13 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 				"mipi-sdw-modes-supported", &dpn[i].modes);
 
 		fwnode_property_read_u32(node, "mipi-sdw-max-async-buffer",
-				&dpn[i].max_async_buffer);
+					 &dpn[i].max_async_buffer);
 
 		dpn[i].block_pack_mode = fwnode_property_read_bool(node,
 				"mipi-sdw-block-packing-mode");
 
 		fwnode_property_read_u32(node, "mipi-sdw-port-encoding-type",
-				&dpn[i].port_encoding);
+					 &dpn[i].port_encoding);
 
 		/* TODO: Read audio mode */
 
@@ -293,7 +301,7 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
 	int num_of_ports, nval, i, dp0 = 0;
 
 	device_property_read_u32(dev, "mipi-sdw-sw-interface-revision",
-				&prop->mipi_revision);
+				 &prop->mipi_revision);
 
 	prop->wake_capable = device_property_read_bool(dev,
 				"mipi-sdw-wake-up-unavailable");
@@ -311,10 +319,10 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
 			"mipi-sdw-simplified-clockstopprepare-sm-supported");
 
 	device_property_read_u32(dev, "mipi-sdw-clockstopprepare-timeout",
-			&prop->clk_stop_timeout);
+				 &prop->clk_stop_timeout);
 
 	device_property_read_u32(dev, "mipi-sdw-slave-channelprepare-timeout",
-			&prop->ch_prep_timeout);
+				 &prop->ch_prep_timeout);
 
 	device_property_read_u32(dev,
 			"mipi-sdw-clockstopprepare-hard-reset-behavior",
@@ -333,13 +341,13 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
 			"mipi-sdw-port15-read-behavior", &prop->p15_behave);
 
 	device_property_read_u32(dev, "mipi-sdw-master-count",
-				&prop->master_count);
+				 &prop->master_count);
 
 	device_property_read_u32(dev, "mipi-sdw-source-port-list",
-				&prop->source_ports);
+				 &prop->source_ports);
 
 	device_property_read_u32(dev, "mipi-sdw-sink-port-list",
-				&prop->sink_ports);
+				 &prop->sink_ports);
 
 	/* Read dp0 properties */
 	port = device_get_named_child_node(dev, "mipi-sdw-dp-0-subproperties");
@@ -348,7 +356,8 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
 	} else {
 
 		prop->dp0_prop = devm_kzalloc(&slave->dev,
-				sizeof(*prop->dp0_prop), GFP_KERNEL);
+					      sizeof(*prop->dp0_prop),
+					      GFP_KERNEL);
 		if (!prop->dp0_prop)
 			return -ENOMEM;
 
@@ -364,23 +373,25 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
 	/* Allocate memory for set bits in port lists */
 	nval = hweight32(prop->source_ports);
 	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
-				sizeof(*prop->src_dpn_prop), GFP_KERNEL);
+					  sizeof(*prop->src_dpn_prop),
+					  GFP_KERNEL);
 	if (!prop->src_dpn_prop)
 		return -ENOMEM;
 
 	/* Read dpn properties for source port(s) */
 	sdw_slave_read_dpn(slave, prop->src_dpn_prop, nval,
-			prop->source_ports, "source");
+			   prop->source_ports, "source");
 
 	nval = hweight32(prop->sink_ports);
 	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
-				sizeof(*prop->sink_dpn_prop), GFP_KERNEL);
+					   sizeof(*prop->sink_dpn_prop),
+					   GFP_KERNEL);
 	if (!prop->sink_dpn_prop)
 		return -ENOMEM;
 
 	/* Read dpn properties for sink port(s) */
 	sdw_slave_read_dpn(slave, prop->sink_dpn_prop, nval,
-			prop->sink_ports, "sink");
+			   prop->sink_ports, "sink");
 
 	/* some ports are bidirectional so check total ports by ORing */
 	nval = prop->source_ports | prop->sink_ports;
@@ -388,7 +399,8 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
 
 	/* Allocate port_ready based on num_of_ports */
 	slave->port_ready = devm_kcalloc(&slave->dev, num_of_ports,
-				sizeof(*slave->port_ready), GFP_KERNEL);
+					 sizeof(*slave->port_ready),
+					 GFP_KERNEL);
 	if (!slave->port_ready)
 		return -ENOMEM;
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
