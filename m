Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CCD3C7CF4
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 05:27:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8229516C3;
	Wed, 14 Jul 2021 05:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8229516C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626233270;
	bh=cLsrI/FiETZ+tIpDu5sxKqRWi3LcXwHGCYravsIWzQU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gJ71ClURUwq70p8qkeE2eM6BT4ZEnQ6t/2tN2+BslNAIKAwEekdfkspadJJHulO/s
	 eHu9+CIl1vRqg3QWIFuHWwEZyBMBFnVlsB+MUEame2/xNX4p7gqAARDkL0jENFtEKz
	 toMMUnGVV7TbNp/uJg+L494/9PUNS//zGuCf6zOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23C58F80526;
	Wed, 14 Jul 2021 05:23:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA548F804FD; Wed, 14 Jul 2021 05:22:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD66AF804FA
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 05:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD66AF804FA
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="232086472"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="232086472"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:22:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="459818221"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:22:48 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 10/10] soundwire: cadence: override PDI configurations to
 create loopback
Date: Wed, 14 Jul 2021 11:22:09 +0800
Message-Id: <20210714032209.11284-11-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
References: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

When we set a source PDI, the target PDI parameters will be overridden
by the source register values. The loopback streams can be
independently enabled on each link.

While the loopback source and target can be configured before any
stream is active on each link, the loopback stream should only be
prepared/triggered when the playback stream is prepared. Otherwise all
registers might be programmed to their reset values and the loopback
will not succeed. The SoundWire bus driver currently does not allow
two streams to be triggered at the same time, so the playback will
have to be started first, and later the loopback.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 130 +++++++++++++++++++++--------
 1 file changed, 95 insertions(+), 35 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 3e740fcebdfe..c7372519452b 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1329,20 +1329,37 @@ static int cdns_port_params(struct sdw_bus *bus,
 			    struct sdw_port_params *p_params, unsigned int bank)
 {
 	struct sdw_cdns *cdns = bus_to_cdns(bus);
-	int dpn_config = 0, dpn_config_off;
+	int dpn_config_off_source;
+	int dpn_config_off_target;
+	int target_num = p_params->num;
+	int source_num = p_params->num;
+	bool override = false;
+	int dpn_config;
 
-	if (bank)
-		dpn_config_off = CDNS_DPN_B1_CONFIG(p_params->num);
-	else
-		dpn_config_off = CDNS_DPN_B0_CONFIG(p_params->num);
+	if (target_num == cdns->pdi_loopback_target &&
+	    cdns->pdi_loopback_source != -1) {
+		source_num = cdns->pdi_loopback_source;
+		override = true;
+	}
 
-	dpn_config = cdns_readl(cdns, dpn_config_off);
+	if (bank) {
+		dpn_config_off_source = CDNS_DPN_B1_CONFIG(source_num);
+		dpn_config_off_target = CDNS_DPN_B1_CONFIG(target_num);
+	} else {
+		dpn_config_off_source = CDNS_DPN_B0_CONFIG(source_num);
+		dpn_config_off_target = CDNS_DPN_B0_CONFIG(target_num);
+	}
 
-	u32p_replace_bits(&dpn_config, (p_params->bps - 1), CDNS_DPN_CONFIG_WL);
-	u32p_replace_bits(&dpn_config, p_params->flow_mode, CDNS_DPN_CONFIG_PORT_FLOW);
-	u32p_replace_bits(&dpn_config, p_params->data_mode, CDNS_DPN_CONFIG_PORT_DAT);
+	dpn_config = cdns_readl(cdns, dpn_config_off_source);
 
-	cdns_writel(cdns, dpn_config_off, dpn_config);
+	/* use port params if there is no loopback, otherwise use source as is */
+	if (!override) {
+		u32p_replace_bits(&dpn_config, p_params->bps - 1, CDNS_DPN_CONFIG_WL);
+		u32p_replace_bits(&dpn_config, p_params->flow_mode, CDNS_DPN_CONFIG_PORT_FLOW);
+		u32p_replace_bits(&dpn_config, p_params->data_mode, CDNS_DPN_CONFIG_PORT_DAT);
+	}
+
+	cdns_writel(cdns, dpn_config_off_target, dpn_config);
 
 	return 0;
 }
@@ -1352,11 +1369,27 @@ static int cdns_transport_params(struct sdw_bus *bus,
 				 enum sdw_reg_bank bank)
 {
 	struct sdw_cdns *cdns = bus_to_cdns(bus);
-	int dpn_offsetctrl = 0, dpn_offsetctrl_off;
-	int dpn_config = 0, dpn_config_off;
-	int dpn_hctrl = 0, dpn_hctrl_off;
-	int num = t_params->port_num;
-	int dpn_samplectrl_off;
+	int dpn_config;
+	int dpn_config_off_source;
+	int dpn_config_off_target;
+	int dpn_hctrl;
+	int dpn_hctrl_off_source;
+	int dpn_hctrl_off_target;
+	int dpn_offsetctrl;
+	int dpn_offsetctrl_off_source;
+	int dpn_offsetctrl_off_target;
+	int dpn_samplectrl;
+	int dpn_samplectrl_off_source;
+	int dpn_samplectrl_off_target;
+	int source_num = t_params->port_num;
+	int target_num = t_params->port_num;
+	bool override = false;
+
+	if (target_num == cdns->pdi_loopback_target &&
+	    cdns->pdi_loopback_source != -1) {
+		source_num = cdns->pdi_loopback_source;
+		override = true;
+	}
 
 	/*
 	 * Note: Only full data port is supported on the Master side for
@@ -1364,32 +1397,59 @@ static int cdns_transport_params(struct sdw_bus *bus,
 	 */
 
 	if (bank) {
-		dpn_config_off = CDNS_DPN_B1_CONFIG(num);
-		dpn_samplectrl_off = CDNS_DPN_B1_SAMPLE_CTRL(num);
-		dpn_hctrl_off = CDNS_DPN_B1_HCTRL(num);
-		dpn_offsetctrl_off = CDNS_DPN_B1_OFFSET_CTRL(num);
+		dpn_config_off_source = CDNS_DPN_B1_CONFIG(source_num);
+		dpn_hctrl_off_source = CDNS_DPN_B1_HCTRL(source_num);
+		dpn_offsetctrl_off_source = CDNS_DPN_B1_OFFSET_CTRL(source_num);
+		dpn_samplectrl_off_source = CDNS_DPN_B1_SAMPLE_CTRL(source_num);
+
+		dpn_config_off_target = CDNS_DPN_B1_CONFIG(target_num);
+		dpn_hctrl_off_target = CDNS_DPN_B1_HCTRL(target_num);
+		dpn_offsetctrl_off_target = CDNS_DPN_B1_OFFSET_CTRL(target_num);
+		dpn_samplectrl_off_target = CDNS_DPN_B1_SAMPLE_CTRL(target_num);
+
 	} else {
-		dpn_config_off = CDNS_DPN_B0_CONFIG(num);
-		dpn_samplectrl_off = CDNS_DPN_B0_SAMPLE_CTRL(num);
-		dpn_hctrl_off = CDNS_DPN_B0_HCTRL(num);
-		dpn_offsetctrl_off = CDNS_DPN_B0_OFFSET_CTRL(num);
+		dpn_config_off_source = CDNS_DPN_B0_CONFIG(source_num);
+		dpn_hctrl_off_source = CDNS_DPN_B0_HCTRL(source_num);
+		dpn_offsetctrl_off_source = CDNS_DPN_B0_OFFSET_CTRL(source_num);
+		dpn_samplectrl_off_source = CDNS_DPN_B0_SAMPLE_CTRL(source_num);
+
+		dpn_config_off_target = CDNS_DPN_B0_CONFIG(target_num);
+		dpn_hctrl_off_target = CDNS_DPN_B0_HCTRL(target_num);
+		dpn_offsetctrl_off_target = CDNS_DPN_B0_OFFSET_CTRL(target_num);
+		dpn_samplectrl_off_target = CDNS_DPN_B0_SAMPLE_CTRL(target_num);
 	}
 
-	dpn_config = cdns_readl(cdns, dpn_config_off);
-	u32p_replace_bits(&dpn_config, t_params->blk_grp_ctrl, CDNS_DPN_CONFIG_BGC);
-	u32p_replace_bits(&dpn_config, t_params->blk_pkg_mode, CDNS_DPN_CONFIG_BPM);
-	cdns_writel(cdns, dpn_config_off, dpn_config);
+	dpn_config = cdns_readl(cdns, dpn_config_off_source);
+	if (!override) {
+		u32p_replace_bits(&dpn_config, t_params->blk_grp_ctrl, CDNS_DPN_CONFIG_BGC);
+		u32p_replace_bits(&dpn_config, t_params->blk_pkg_mode, CDNS_DPN_CONFIG_BPM);
+	}
+	cdns_writel(cdns, dpn_config_off_target, dpn_config);
 
-	u32p_replace_bits(&dpn_offsetctrl, t_params->offset1, CDNS_DPN_OFFSET_CTRL_1);
-	u32p_replace_bits(&dpn_offsetctrl, t_params->offset2, CDNS_DPN_OFFSET_CTRL_2);
-	cdns_writel(cdns, dpn_offsetctrl_off,  dpn_offsetctrl);
+	if (!override) {
+		dpn_offsetctrl = 0;
+		u32p_replace_bits(&dpn_offsetctrl, t_params->offset1, CDNS_DPN_OFFSET_CTRL_1);
+		u32p_replace_bits(&dpn_offsetctrl, t_params->offset2, CDNS_DPN_OFFSET_CTRL_2);
+	} else {
+		dpn_offsetctrl = cdns_readl(cdns, dpn_offsetctrl_off_source);
+	}
+	cdns_writel(cdns, dpn_offsetctrl_off_target,  dpn_offsetctrl);
 
-	u32p_replace_bits(&dpn_hctrl, t_params->hstart, CDNS_DPN_HCTRL_HSTART);
-	u32p_replace_bits(&dpn_hctrl, t_params->hstop, CDNS_DPN_HCTRL_HSTOP);
-	u32p_replace_bits(&dpn_hctrl, t_params->lane_ctrl, CDNS_DPN_HCTRL_LCTRL);
+	if (!override) {
+		dpn_hctrl = 0;
+		u32p_replace_bits(&dpn_hctrl, t_params->hstart, CDNS_DPN_HCTRL_HSTART);
+		u32p_replace_bits(&dpn_hctrl, t_params->hstop, CDNS_DPN_HCTRL_HSTOP);
+		u32p_replace_bits(&dpn_hctrl, t_params->lane_ctrl, CDNS_DPN_HCTRL_LCTRL);
+	} else {
+		dpn_hctrl = cdns_readl(cdns, dpn_hctrl_off_source);
+	}
+	cdns_writel(cdns, dpn_hctrl_off_target, dpn_hctrl);
 
-	cdns_writel(cdns, dpn_hctrl_off, dpn_hctrl);
-	cdns_writel(cdns, dpn_samplectrl_off, (t_params->sample_interval - 1));
+	if (!override)
+		dpn_samplectrl = t_params->sample_interval - 1;
+	else
+		dpn_samplectrl = cdns_readl(cdns, dpn_samplectrl_off_source);
+	cdns_writel(cdns, dpn_samplectrl_off_target, dpn_samplectrl);
 
 	return 0;
 }
-- 
2.17.1

