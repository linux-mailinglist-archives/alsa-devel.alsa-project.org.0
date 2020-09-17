Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 029D726DB0D
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 14:06:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C9031658;
	Thu, 17 Sep 2020 14:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C9031658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600344389;
	bh=35LkgZEuEzyFHGZ0lDP79vzRBZtP2Lt00h+sOd5yb5M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ekAfk+B+KOkCIFmtJ4N8oRz/P5tuBcdmI5aJZGJH427lLuwoorj0YTdgWe32zYP8r
	 mPpqAR2LsLLmWzujt1Q+1HuGNNPPSaDXBRs7prDlKDMEBb7aGU2ocAG+u5cbx9Ddvf
	 oBBzwcY8tvFue8atwa5K4FDtA0VRYg+bUs9rnOIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08105F802F8;
	Thu, 17 Sep 2020 14:02:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0495CF802F7; Thu, 17 Sep 2020 14:02:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92EBFF802E9
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 14:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92EBFF802E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="n5AFKV16"
Received: from localhost.localdomain (unknown [136.185.111.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 306C4208DB;
 Thu, 17 Sep 2020 12:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600344124;
 bh=35LkgZEuEzyFHGZ0lDP79vzRBZtP2Lt00h+sOd5yb5M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n5AFKV163FKfDBG0zcNp4dTgU+bOY7z4mvoSThTfmycQUCaZ1UQx2IRKFANnpFFfh
 /g2OrO2dTRx+wj3KNWnR9KixJCShQrCtQlA+a71xPQBpcLDVKnKkOu23jRWdjreMnq
 sYh+4k0aCzfjpvou0TjTZ38ArtuYN+RLnDa9EsTI=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] soundwire: cadence: use u32p_replace_bits
Date: Thu, 17 Sep 2020 17:31:45 +0530
Message-Id: <20200917120146.1780323-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917120146.1780323-1-vkoul@kernel.org>
References: <20200917120146.1780323-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
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

FIELD_PREP() does not replace the bits so it is not apt in case where we
modify a register.

Use u32p_replace_bits() instead.

Fixes: 3cf25d63b1b9 ("soundwire: cadence: use FIELD_{GET|PREP}")
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/cadence_master.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index f1efe5beead6..19d445ef6764 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1278,9 +1278,9 @@ static int cdns_port_params(struct sdw_bus *bus,
 
 	dpn_config = cdns_readl(cdns, dpn_config_off);
 
-	dpn_config |= FIELD_PREP(CDNS_DPN_CONFIG_WL, (p_params->bps - 1));
-	dpn_config |= FIELD_PREP(CDNS_DPN_CONFIG_PORT_FLOW, p_params->flow_mode);
-	dpn_config |= FIELD_PREP(CDNS_DPN_CONFIG_PORT_DAT, p_params->data_mode);
+	u32p_replace_bits(&dpn_config, (p_params->bps - 1), CDNS_DPN_CONFIG_WL);
+	u32p_replace_bits(&dpn_config, p_params->flow_mode, CDNS_DPN_CONFIG_PORT_FLOW);
+	u32p_replace_bits(&dpn_config, p_params->data_mode, CDNS_DPN_CONFIG_PORT_DAT);
 
 	cdns_writel(cdns, dpn_config_off, dpn_config);
 
@@ -1316,18 +1316,17 @@ static int cdns_transport_params(struct sdw_bus *bus,
 	}
 
 	dpn_config = cdns_readl(cdns, dpn_config_off);
-
-	dpn_config |= FIELD_PREP(CDNS_DPN_CONFIG_BGC, t_params->blk_grp_ctrl);
-	dpn_config |= FIELD_PREP(CDNS_DPN_CONFIG_BPM, t_params->blk_pkg_mode);
+	u32p_replace_bits(&dpn_config, t_params->blk_grp_ctrl, CDNS_DPN_CONFIG_BGC);
+	u32p_replace_bits(&dpn_config, t_params->blk_pkg_mode, CDNS_DPN_CONFIG_BPM);
 	cdns_writel(cdns, dpn_config_off, dpn_config);
 
-	dpn_offsetctrl |= FIELD_PREP(CDNS_DPN_OFFSET_CTRL_1, t_params->offset1);
-	dpn_offsetctrl |= FIELD_PREP(CDNS_DPN_OFFSET_CTRL_2, t_params->offset2);
+	u32p_replace_bits(&dpn_offsetctrl, t_params->offset1, CDNS_DPN_OFFSET_CTRL_1);
+	u32p_replace_bits(&dpn_offsetctrl, t_params->offset2, CDNS_DPN_OFFSET_CTRL_2);
 	cdns_writel(cdns, dpn_offsetctrl_off,  dpn_offsetctrl);
 
-	dpn_hctrl |= FIELD_PREP(CDNS_DPN_HCTRL_HSTART, t_params->hstart);
-	dpn_hctrl |= FIELD_PREP(CDNS_DPN_HCTRL_HSTOP, t_params->hstop);
-	dpn_hctrl |= FIELD_PREP(CDNS_DPN_HCTRL_LCTRL, t_params->lane_ctrl);
+	u32p_replace_bits(&dpn_hctrl, t_params->hstart, CDNS_DPN_HCTRL_HSTART);
+	u32p_replace_bits(&dpn_hctrl, t_params->hstop, CDNS_DPN_HCTRL_HSTOP);
+	u32p_replace_bits(&dpn_hctrl, t_params->lane_ctrl, CDNS_DPN_HCTRL_LCTRL);
 
 	cdns_writel(cdns, dpn_hctrl_off, dpn_hctrl);
 	cdns_writel(cdns, dpn_samplectrl_off, (t_params->sample_interval - 1));
-- 
2.26.2

