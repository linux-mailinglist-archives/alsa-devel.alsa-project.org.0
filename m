Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D20255517
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 09:27:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48DC9183D;
	Fri, 28 Aug 2020 09:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48DC9183D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598599628;
	bh=7/3JhVfK33nP/ATnI919BgJ8ad4DZtO8RGbenFmML1Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fEndeR5dyQ1etre0Pv3frU2a9rTGnVNtN+Yip74yi3ykr0juC5T8iGluuhanqw/3F
	 Bs4wAgH2Xajlj6xoW14AglT8pLCumNKjnbNLevtD3QF+ieYgofAO9km/ECTI34CEq4
	 dcHVWBkAAJiUzSN/PZoqzhqFzY+QC22CAolFAhGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A7A2F802F7;
	Fri, 28 Aug 2020 09:22:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BE33F802E0; Fri, 28 Aug 2020 09:21:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A723F80264
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 09:21:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A723F80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ztl6dDTF"
Received: from localhost.localdomain (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A858320E65;
 Fri, 28 Aug 2020 07:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598599294;
 bh=7/3JhVfK33nP/ATnI919BgJ8ad4DZtO8RGbenFmML1Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ztl6dDTFtB8z3ktyi5uDA4FUoBuzJ8wqYFVRhT193WCPwsadSPRsnlVJN5I82ZQwd
 xcM7JwXJVq9TbYog9KOBh2RLUeQYKxwbCx8Rt1ICY54Jm5PteHFCbLrxQSQuQ3zfNK
 fz9+iiDNCZ8RbXJ/d3IFzNZzgl8svUqLSq1trlNc=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/9] soundwire: intel: use FIELD_{GET|PREP}
Date: Fri, 28 Aug 2020 12:50:59 +0530
Message-Id: <20200828072101.3781956-8-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200828072101.3781956-1-vkoul@kernel.org>
References: <20200828072101.3781956-1-vkoul@kernel.org>
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
 drivers/soundwire/intel.c | 40 ++++++++++++++-------------------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index ebca8ced59ec..8b3de114f3b3 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -324,8 +324,7 @@ static int intel_link_power_up(struct sdw_intel *sdw)
 
 		/* set SyncPRD period */
 		sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
-		sync_reg |= (syncprd <<
-			     SDW_REG_SHIFT(SDW_SHIM_SYNC_SYNCPRD));
+		sync_reg |= FIELD_PREP(SDW_SHIM_SYNC_SYNCPRD, syncprd);
 
 		/* Set SyncCPU bit */
 		sync_reg |= SDW_SHIM_SYNC_SYNCCPU;
@@ -443,7 +442,7 @@ static int intel_shim_init(struct sdw_intel *sdw, bool clock_stop)
 
 	intel_shim_glue_to_master_ip(sdw);
 
-	act |= 0x1 << SDW_REG_SHIFT(SDW_SHIM_CTMCTL_DOAIS);
+	act |= FIELD_PREP(SDW_SHIM_CTMCTL_DOAIS, 0x1);
 	act |= SDW_SHIM_CTMCTL_DACTQE;
 	act |= SDW_SHIM_CTMCTL_DODS;
 	intel_writew(shim, SDW_SHIM_CTMCTL(link_id), act);
@@ -568,12 +567,9 @@ static void intel_pdi_init(struct sdw_intel *sdw,
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
@@ -581,12 +577,9 @@ static void intel_pdi_init(struct sdw_intel *sdw,
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
@@ -613,8 +606,7 @@ intel_pdi_get_ch_cap(struct sdw_intel *sdw, unsigned int pdi_num, bool pcm)
 
 	} else {
 		count = intel_readw(shim, SDW_SHIM_PDMSCAP(link_id));
-		count = ((count & SDW_SHIM_PDMSCAP_CPSS) >>
-					SDW_REG_SHIFT(SDW_SHIM_PDMSCAP_CPSS));
+		count = FIELD_GET(SDW_SHIM_PDMSCAP_CPSS, count);
 	}
 
 	/* zero based values for channel count in register */
@@ -688,10 +680,9 @@ intel_pdi_shim_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
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
@@ -711,11 +702,8 @@ intel_pdi_alh_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
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

