Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B21F25C099
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 13:51:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3722F173D;
	Thu,  3 Sep 2020 13:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3722F173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599133873;
	bh=pN7svKRZad4Efkyh+79sk+bPRg2djJJPmkJUymr+IqY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d8QoiaXFsQxg3CT5Am47aXJuLYAViYnomcKT5s5/aej5Hc/Qv56+5X6S45aAMGmYI
	 pibh4Gza7c9BtaUONet5igBZhGI5K1vasjWYcd9jQSq+ru2fyv5oNO+VvSPNZO6A95
	 BgsQPYC10hR8g5xDG+5iX7yN26hkNH4WvjeRS1IA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7757F802FB;
	Thu,  3 Sep 2020 13:45:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07158F8031A; Thu,  3 Sep 2020 13:45:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CABFBF802FB
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 13:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CABFBF802FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TZBpx1zK"
Received: from localhost.localdomain (unknown [122.171.179.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB33420709;
 Thu,  3 Sep 2020 11:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599133540;
 bh=pN7svKRZad4Efkyh+79sk+bPRg2djJJPmkJUymr+IqY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TZBpx1zKK9mc9s+KSNvyiEj89NxQo5RUsalf7HGRgm/znVc8Ma5ZVgxgaE/koh/X8
 cxfWo8q9w7c25K87tTBQNgM/O/9JBOyuABIHP73pMXm2rp9swfl45jE+UeRaRfdI1j
 WSKBwewC2+oMPvwaoQCsBFj12Jh/PiEwF1YHCQZg=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 7/9] soundwire: intel: use FIELD_{GET|PREP}
Date: Thu,  3 Sep 2020 17:15:02 +0530
Message-Id: <20200903114504.1202143-8-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200903114504.1202143-1-vkoul@kernel.org>
References: <20200903114504.1202143-1-vkoul@kernel.org>
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

use FIELD_{GET|PREP} in intel driver to get/set field values instead of
open coding masks and shift operations.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/intel.c | 52 ++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 34 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 710f5eba936b..8a958b6cc0fe 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -329,8 +329,7 @@ static int intel_link_power_up(struct sdw_intel *sdw)
 
 		/* set SyncPRD period */
 		sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
-		sync_reg |= (syncprd <<
-			     SDW_REG_SHIFT(SDW_SHIM_SYNC_SYNCPRD));
+		sync_reg |= FIELD_PREP(SDW_SHIM_SYNC_SYNCPRD, syncprd);
 
 		/* Set SyncCPU bit */
 		sync_reg |= SDW_SHIM_SYNC_SYNCCPU;
@@ -340,10 +339,8 @@ static int intel_link_power_up(struct sdw_intel *sdw)
 		link_control = intel_readl(shim, SDW_SHIM_LCTL);
 
 		/* only power-up enabled links */
-		spa_mask = sdw->link_res->link_mask <<
-			SDW_REG_SHIFT(SDW_SHIM_LCTL_SPA_MASK);
-		cpa_mask = sdw->link_res->link_mask <<
-			SDW_REG_SHIFT(SDW_SHIM_LCTL_CPA_MASK);
+		spa_mask = FIELD_PREP(SDW_SHIM_LCTL_SPA_MASK, sdw->link_res->link_mask);
+		cpa_mask = FIELD_PREP(SDW_SHIM_LCTL_CPA_MASK, sdw->link_res->link_mask);
 
 		link_control |=  spa_mask;
 
@@ -451,7 +448,7 @@ static int intel_shim_init(struct sdw_intel *sdw, bool clock_stop)
 
 	intel_shim_glue_to_master_ip(sdw);
 
-	act |= 0x1 << SDW_REG_SHIFT(SDW_SHIM_CTMCTL_DOAIS);
+	act |= FIELD_PREP(SDW_SHIM_CTMCTL_DOAIS, 0x1);
 	act |= SDW_SHIM_CTMCTL_DACTQE;
 	act |= SDW_SHIM_CTMCTL_DODS;
 	intel_writew(shim, SDW_SHIM_CTMCTL(link_id), act);
@@ -514,10 +511,8 @@ static int intel_link_power_down(struct sdw_intel *sdw)
 		link_control = intel_readl(shim, SDW_SHIM_LCTL);
 
 		/* only power-down enabled links */
-		spa_mask = (~sdw->link_res->link_mask) <<
-			SDW_REG_SHIFT(SDW_SHIM_LCTL_SPA_MASK);
-		cpa_mask = sdw->link_res->link_mask <<
-			SDW_REG_SHIFT(SDW_SHIM_LCTL_CPA_MASK);
+		spa_mask = FIELD_PREP(SDW_SHIM_LCTL_SPA_MASK, ~sdw->link_res->link_mask);
+		cpa_mask = FIELD_PREP(SDW_SHIM_LCTL_CPA_MASK, sdw->link_res->link_mask);
 
 		link_control &=  spa_mask;
 
@@ -604,12 +599,9 @@ static void intel_pdi_init(struct sdw_intel *sdw,
 	/* PCM Stream Capability */
 	pcm_cap = intel_readw(shim, SDW_SHIM_PCMSCAP(link_id));
 
-	config->pcm_bd = (pcm_cap & SDW_SHIM_PCMSCAP_BSS) >>
-					SDW_REG_SHIFT(SDW_SHIM_PCMSCAP_BSS);
-	config->pcm_in = (pcm_cap & SDW_SHIM_PCMSCAP_ISS) >>
-					SDW_REG_SHIFT(SDW_SHIM_PCMSCAP_ISS);
-	config->pcm_out = (pcm_cap & SDW_SHIM_PCMSCAP_OSS) >>
-					SDW_REG_SHIFT(SDW_SHIM_PCMSCAP_OSS);
+	config->pcm_bd = FIELD_GET(SDW_SHIM_PCMSCAP_BSS, pcm_cap);
+	config->pcm_in = FIELD_GET(SDW_SHIM_PCMSCAP_ISS, pcm_cap);
+	config->pcm_out = FIELD_GET(SDW_SHIM_PCMSCAP_OSS, pcm_cap);
 
 	dev_dbg(sdw->cdns.dev, "PCM cap bd:%d in:%d out:%d\n",
 		config->pcm_bd, config->pcm_in, config->pcm_out);
@@ -617,12 +609,9 @@ static void intel_pdi_init(struct sdw_intel *sdw,
 	/* PDM Stream Capability */
 	pdm_cap = intel_readw(shim, SDW_SHIM_PDMSCAP(link_id));
 
-	config->pdm_bd = (pdm_cap & SDW_SHIM_PDMSCAP_BSS) >>
-					SDW_REG_SHIFT(SDW_SHIM_PDMSCAP_BSS);
-	config->pdm_in = (pdm_cap & SDW_SHIM_PDMSCAP_ISS) >>
-					SDW_REG_SHIFT(SDW_SHIM_PDMSCAP_ISS);
-	config->pdm_out = (pdm_cap & SDW_SHIM_PDMSCAP_OSS) >>
-					SDW_REG_SHIFT(SDW_SHIM_PDMSCAP_OSS);
+	config->pdm_bd = FIELD_GET(SDW_SHIM_PDMSCAP_BSS, pdm_cap);
+	config->pdm_in = FIELD_GET(SDW_SHIM_PDMSCAP_ISS, pdm_cap);
+	config->pdm_out = FIELD_GET(SDW_SHIM_PDMSCAP_OSS, pdm_cap);
 
 	dev_dbg(sdw->cdns.dev, "PDM cap bd:%d in:%d out:%d\n",
 		config->pdm_bd, config->pdm_in, config->pdm_out);
@@ -649,8 +638,7 @@ intel_pdi_get_ch_cap(struct sdw_intel *sdw, unsigned int pdi_num, bool pcm)
 
 	} else {
 		count = intel_readw(shim, SDW_SHIM_PDMSCAP(link_id));
-		count = ((count & SDW_SHIM_PDMSCAP_CPSS) >>
-					SDW_REG_SHIFT(SDW_SHIM_PDMSCAP_CPSS));
+		count = FIELD_GET(SDW_SHIM_PDMSCAP_CPSS, count);
 	}
 
 	/* zero based values for channel count in register */
@@ -724,10 +712,9 @@ intel_pdi_shim_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
 	else
 		pdi_conf &= ~(SDW_SHIM_PCMSYCM_DIR);
 
-	pdi_conf |= (pdi->intel_alh_id <<
-			SDW_REG_SHIFT(SDW_SHIM_PCMSYCM_STREAM));
-	pdi_conf |= (pdi->l_ch_num << SDW_REG_SHIFT(SDW_SHIM_PCMSYCM_LCHN));
-	pdi_conf |= (pdi->h_ch_num << SDW_REG_SHIFT(SDW_SHIM_PCMSYCM_HCHN));
+	pdi_conf |= FIELD_PREP(SDW_SHIM_PCMSYCM_STREAM, pdi->intel_alh_id);
+	pdi_conf |= FIELD_PREP(SDW_SHIM_PCMSYCM_LCHN, pdi->l_ch_num);
+	pdi_conf |= FIELD_PREP(SDW_SHIM_PCMSYCM_HCHN, pdi->h_ch_num);
 
 	intel_writew(shim, SDW_SHIM_PCMSYCHM(link_id, pdi->num), pdi_conf);
 }
@@ -747,11 +734,8 @@ intel_pdi_alh_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
 	/* Program Stream config ALH register */
 	conf = intel_readl(alh, SDW_ALH_STRMZCFG(pdi->intel_alh_id));
 
-	conf |= (SDW_ALH_STRMZCFG_DMAT_VAL <<
-			SDW_REG_SHIFT(SDW_ALH_STRMZCFG_DMAT));
-
-	conf |= ((pdi->ch_count - 1) <<
-			SDW_REG_SHIFT(SDW_ALH_STRMZCFG_CHN));
+	conf |= FIELD_PREP(SDW_ALH_STRMZCFG_DMAT, SDW_ALH_STRMZCFG_DMAT_VAL);
+	conf |= FIELD_PREP(SDW_ALH_STRMZCFG_CHN, pdi->ch_count - 1);
 
 	intel_writel(alh, SDW_ALH_STRMZCFG(pdi->intel_alh_id), conf);
 }
-- 
2.26.2

