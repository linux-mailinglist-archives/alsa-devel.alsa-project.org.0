Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0A5809579
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:36:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B526A4C;
	Thu,  7 Dec 2023 23:36:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B526A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988572;
	bh=xZp9rAu7CFtQr/d0cAfzz06dHGZubVUeDnRzZs0edgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tvXFLGKj5EStgGyrCdLWKcSJ7iUQlpzvMSvPud3HNL+ZX+2Skm2odUQWSyr9AuOUv
	 Gwgq1CM2tSMTq0OMjFQ/JuM0KXpQCofmSyECvSVLdYVIj6rYAmL9jG7HbynlfKB6l/
	 QvQS55vmIjC+eUNrHzggnUkXNwljP8a/JaNLFC7o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC8C6F8060B; Thu,  7 Dec 2023 23:35:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24916F805FC;
	Thu,  7 Dec 2023 23:35:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5C28F805EB; Thu,  7 Dec 2023 23:35:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49D3FF8028D
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49D3FF8028D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=arcF/gjT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988218; x=1733524218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xZp9rAu7CFtQr/d0cAfzz06dHGZubVUeDnRzZs0edgk=;
  b=arcF/gjTJ28Y1swShL5yDcQGfUApi6orGME6g533oyh+4/L2T338iD8m
   8ibBslTkyBd3PEMkuxKPtpe1a9JVAGjvUFPTiXllc9jIodOWjrCv5Ekci
   tAexvz2O50dNpYdrR/ktBtK7oSrUqAALwIri761D6NcDwSAziZYVAdhp7
   D7nrOn8lsw7b+MIeTp3mlR3V7ht57D/Tk4UZ9aHRMeTIKG2vII1O4FpG9
   3av3l8gpJMCJxsmzUfYs78piL3u9C3Z52eMMu9OdhgkQIja4PDEThbv9M
   mtUPkuC3CoFw1dCAbe5u6rcD56ytn+ExENvuAkenHrCvwBNAj/ilie2KW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516628"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="480516628"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307479"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="895307479"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:13 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 06/16] soundwire: stream: reuse existing code for BPT
 stream
Date: Thu,  7 Dec 2023 16:29:34 -0600
Message-Id: <20231207222944.663893-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UQYYCEM3KGABDECKDCQDTKCVCSBC4CRB
X-Message-ID-Hash: UQYYCEM3KGABDECKDCQDTKCVCSBC4CRB
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQYYCEM3KGABDECKDCQDTKCVCSBC4CRB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DP0 (Data Port 0) is very similar to regular data ports, with minor
tweaks we can reuse the same code.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/stream.c | 94 +++++++++++++++++++++++++++-----------
 1 file changed, 68 insertions(+), 26 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 16ee58d4b7a2..f9762610f051 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -87,6 +87,10 @@ static int _sdw_program_slave_port_params(struct sdw_bus *bus,
 		return ret;
 	}
 
+	/* DP0 does not implement BlockCtrl3 */
+	if (!t_params->port_num)
+		goto skip_block_ctrl3;
+
 	/* Program DPN_BlockCtrl3 register */
 	ret = sdw_write_no_pm(slave, addr2, t_params->blk_pkg_mode);
 	if (ret < 0) {
@@ -94,6 +98,7 @@ static int _sdw_program_slave_port_params(struct sdw_bus *bus,
 		return ret;
 	}
 
+skip_block_ctrl3:
 	/*
 	 * Data ports are FULL, SIMPLE and REDUCED. This function handles
 	 * FULL and REDUCED only and beyond this point only FULL is
@@ -130,18 +135,29 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
 	struct sdw_port_params *p_params = &p_rt->port_params;
 	struct sdw_slave_prop *slave_prop = &s_rt->slave->prop;
 	u32 addr1, addr2, addr3, addr4, addr5, addr6;
-	struct sdw_dpn_prop *dpn_prop;
+	enum sdw_dpn_type port_type;
+	bool read_only_wordlength;
 	int ret;
 	u8 wbuf;
 
 	if (s_rt->slave->is_mockup_device)
 		return 0;
 
-	dpn_prop = sdw_get_slave_dpn_prop(s_rt->slave,
-					  s_rt->direction,
-					  t_params->port_num);
-	if (!dpn_prop)
-		return -EINVAL;
+	if (t_params->port_num) {
+		struct sdw_dpn_prop *dpn_prop;
+
+		dpn_prop = sdw_get_slave_dpn_prop(s_rt->slave,
+						  s_rt->direction,
+						  t_params->port_num);
+		if (!dpn_prop)
+			return -EINVAL;
+
+		read_only_wordlength = dpn_prop->read_only_wordlength;
+		port_type = dpn_prop->type;
+	} else {
+		read_only_wordlength = false;
+		port_type = SDW_DPN_FULL;
+	}
 
 	addr1 = SDW_DPN_PORTCTRL(t_params->port_num);
 	addr2 = SDW_DPN_BLOCKCTRL1(t_params->port_num);
@@ -171,7 +187,7 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
 		return ret;
 	}
 
-	if (!dpn_prop->read_only_wordlength) {
+	if (!read_only_wordlength) {
 		/* Program DPN_BlockCtrl1 register */
 		ret = sdw_write_no_pm(s_rt->slave, addr2, (p_params->bps - 1));
 		if (ret < 0) {
@@ -223,9 +239,9 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
 		}
 	}
 
-	if (dpn_prop->type != SDW_DPN_SIMPLE) {
+	if (port_type != SDW_DPN_SIMPLE) {
 		ret = _sdw_program_slave_port_params(bus, s_rt->slave,
-						     t_params, dpn_prop->type);
+						     t_params, port_type);
 		if (ret < 0)
 			dev_err(&s_rt->slave->dev,
 				"Transport reg write failed for port: %d\n",
@@ -432,6 +448,9 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 	struct completion *port_ready;
 	struct sdw_dpn_prop *dpn_prop;
 	struct sdw_prepare_ch prep_ch;
+	u32 imp_def_interrupts;
+	bool simple_ch_prep_sm;
+	u32 ch_prep_timeout;
 	bool intr = false;
 	int ret = 0, val;
 	u32 addr;
@@ -439,20 +458,31 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 	prep_ch.num = p_rt->num;
 	prep_ch.ch_mask = p_rt->ch_mask;
 
-	dpn_prop = sdw_get_slave_dpn_prop(s_rt->slave,
-					  s_rt->direction,
-					  prep_ch.num);
-	if (!dpn_prop) {
-		dev_err(bus->dev,
-			"Slave Port:%d properties not found\n", prep_ch.num);
-		return -EINVAL;
+	if (p_rt->num) {
+		dpn_prop = sdw_get_slave_dpn_prop(s_rt->slave,
+						  s_rt->direction,
+						  prep_ch.num);
+		if (!dpn_prop) {
+			dev_err(bus->dev,
+				"Slave Port:%d properties not found\n", prep_ch.num);
+			return -EINVAL;
+		}
+
+		imp_def_interrupts = dpn_prop->imp_def_interrupts;
+		simple_ch_prep_sm = dpn_prop->simple_ch_prep_sm;
+	} else {
+		struct sdw_dp0_prop *dp0_prop = s_rt->slave->prop.dp0_prop;
+
+		imp_def_interrupts = dp0_prop->imp_def_interrupts;
+		simple_ch_prep_sm =  dp0_prop->simple_ch_prep_sm;
+		ch_prep_timeout = dp0_prop->ch_prep_timeout;
 	}
 
 	prep_ch.prepare = prep;
 
 	prep_ch.bank = bus->params.next_bank;
 
-	if (dpn_prop->imp_def_interrupts || !dpn_prop->simple_ch_prep_sm ||
+	if (imp_def_interrupts || !simple_ch_prep_sm ||
 	    bus->params.s_data_mode != SDW_PORT_DATA_MODE_NORMAL)
 		intr = true;
 
@@ -463,7 +493,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 	 */
 	if (prep && intr) {
 		ret = sdw_configure_dpn_intr(s_rt->slave, p_rt->num, prep,
-					     dpn_prop->imp_def_interrupts);
+					     imp_def_interrupts);
 		if (ret < 0)
 			return ret;
 	}
@@ -472,7 +502,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 	sdw_do_port_prep(s_rt, prep_ch, prep ? SDW_OPS_PORT_PRE_PREP : SDW_OPS_PORT_PRE_DEPREP);
 
 	/* Prepare Slave port implementing CP_SM */
-	if (!dpn_prop->simple_ch_prep_sm) {
+	if (!simple_ch_prep_sm) {
 		addr = SDW_DPN_PREPARECTRL(p_rt->num);
 
 		if (prep)
@@ -489,7 +519,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 		/* Wait for completion on port ready */
 		port_ready = &s_rt->slave->port_ready[prep_ch.num];
 		wait_for_completion_timeout(port_ready,
-			msecs_to_jiffies(dpn_prop->ch_prep_timeout));
+			msecs_to_jiffies(ch_prep_timeout));
 
 		val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
 		if ((val < 0) || (val & p_rt->ch_mask)) {
@@ -506,7 +536,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 	/* Disable interrupt after Port de-prepare */
 	if (!prep && intr)
 		ret = sdw_configure_dpn_intr(s_rt->slave, p_rt->num, prep,
-					     dpn_prop->imp_def_interrupts);
+					     imp_def_interrupts);
 
 	return ret;
 }
@@ -970,7 +1000,8 @@ static int sdw_slave_port_is_valid_range(struct device *dev, int num)
 
 static int sdw_slave_port_config(struct sdw_slave *slave,
 				 struct sdw_slave_runtime *s_rt,
-				 const struct sdw_port_config *port_config)
+				 const struct sdw_port_config *port_config,
+				 bool is_bpt_stream)
 {
 	struct sdw_port_runtime *p_rt;
 	int ret;
@@ -982,9 +1013,14 @@ static int sdw_slave_port_config(struct sdw_slave *slave,
 		 * TODO: Check valid port range as defined by DisCo/
 		 * slave
 		 */
-		ret = sdw_slave_port_is_valid_range(&slave->dev, port_config[i].num);
-		if (ret < 0)
-			return ret;
+		if (!is_bpt_stream) {
+			ret = sdw_slave_port_is_valid_range(&slave->dev, port_config[i].num);
+			if (ret < 0)
+				return ret;
+		} else {
+			if (port_config[i].num)
+				return -EINVAL;
+		}
 
 		ret = sdw_port_config(p_rt, port_config, i);
 		if (ret < 0)
@@ -1293,6 +1329,11 @@ struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
 	u8 num_ports;
 	int i;
 
+	if (!port_num) {
+		dev_err(&slave->dev, "%s: port_num is zero\n", __func__);
+		return NULL;
+	}
+
 	if (direction == SDW_DATA_DIR_TX) {
 		num_ports = hweight32(slave->prop.source_ports);
 		dpn_prop = slave->prop.src_dpn_prop;
@@ -2056,7 +2097,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	if (ret)
 		goto unlock;
 
-	ret = sdw_slave_port_config(slave, s_rt, port_config);
+	ret = sdw_slave_port_config(slave, s_rt, port_config,
+				    stream->type == SDW_STREAM_BPT ? true : false);
 	if (ret)
 		goto unlock;
 
-- 
2.39.2

