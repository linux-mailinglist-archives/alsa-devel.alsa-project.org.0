Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E9126C3D0
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 16:41:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FFD61676;
	Wed, 16 Sep 2020 16:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FFD61676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600267310;
	bh=tP6tI1C7I4Xn1y1Y9iigj5U10BZiaUfkubG3jxYyy6A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gaMB8qAadeYABg9ezBq1EdhKV66Ulu3jf27Tj0SlVdYoNBzEmYiIfNaMYBNEXq6Hc
	 iH/+krOpVi7/4//YhSK8aEs8sVJd1DY8HJ0jYHH0X8TJeVvePMj7AtRYiSxnTHd9PX
	 yCJO/rq9bdNrhOVIe09slWwDtPB4dIyTmo4lmuF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D3F8F8020B;
	Wed, 16 Sep 2020 16:39:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28AA9F801F7; Wed, 16 Sep 2020 16:39:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3778AF8015C
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 16:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3778AF8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wLdSgKP9"
Received: from localhost.localdomain (unknown [122.172.186.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7701E221EF;
 Wed, 16 Sep 2020 14:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600267159;
 bh=tP6tI1C7I4Xn1y1Y9iigj5U10BZiaUfkubG3jxYyy6A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wLdSgKP99WBdjQ3atwNyyt85e6qdR2IGfyfc4OdnFEQo5RGw++kEcFlHUhiwb7/NL
 B1brkjyTqs59NGLLKO1N0nImSoU4avaGomK9o1thuiuE1neglBktVzqtIs/v7tI53u
 wUj5pLIuasSe5e2v2aZUIjJTO4UTcbTnIwSkvJCM=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] soundwire: intel: use u32_replace_bits
Date: Wed, 16 Sep 2020 20:09:00 +0530
Message-Id: <20200916143900.1199431-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916143900.1199431-1-vkoul@kernel.org>
References: <20200916143900.1199431-1-vkoul@kernel.org>
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

Use u32_replace_bits() instead.

Fixes: 3b4979cabd4b ("soundwire: intel: use FIELD_{GET|PREP}")
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/intel.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index e047910d73f5..233cf9891c61 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -329,7 +329,7 @@ static int intel_link_power_up(struct sdw_intel *sdw)
 
 		/* set SyncPRD period */
 		sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
-		sync_reg |= FIELD_PREP(SDW_SHIM_SYNC_SYNCPRD, syncprd);
+		sync_reg = u32_replace_bits(sync_reg, syncprd, SDW_SHIM_SYNC_SYNCPRD);
 
 		/* Set SyncCPU bit */
 		sync_reg |= SDW_SHIM_SYNC_SYNCCPU;
@@ -448,7 +448,7 @@ static int intel_shim_init(struct sdw_intel *sdw, bool clock_stop)
 
 	intel_shim_glue_to_master_ip(sdw);
 
-	act |= FIELD_PREP(SDW_SHIM_CTMCTL_DOAIS, 0x1);
+	act = u32_replace_bits(act, 0x1, SDW_SHIM_CTMCTL_DOAIS);
 	act |= SDW_SHIM_CTMCTL_DACTQE;
 	act |= SDW_SHIM_CTMCTL_DODS;
 	intel_writew(shim, SDW_SHIM_CTMCTL(link_id), act);
@@ -712,9 +712,9 @@ intel_pdi_shim_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
 	else
 		pdi_conf &= ~(SDW_SHIM_PCMSYCM_DIR);
 
-	pdi_conf |= FIELD_PREP(SDW_SHIM_PCMSYCM_STREAM, pdi->intel_alh_id);
-	pdi_conf |= FIELD_PREP(SDW_SHIM_PCMSYCM_LCHN, pdi->l_ch_num);
-	pdi_conf |= FIELD_PREP(SDW_SHIM_PCMSYCM_HCHN, pdi->h_ch_num);
+	pdi_conf = u32_replace_bits(pdi_conf, pdi->intel_alh_id, SDW_SHIM_PCMSYCM_STREAM);
+	pdi_conf = u32_replace_bits(pdi_conf, pdi->l_ch_num, SDW_SHIM_PCMSYCM_LCHN);
+	pdi_conf = u32_replace_bits(pdi_conf, pdi->h_ch_num, SDW_SHIM_PCMSYCM_HCHN);
 
 	intel_writew(shim, SDW_SHIM_PCMSYCHM(link_id, pdi->num), pdi_conf);
 }
@@ -734,8 +734,8 @@ intel_pdi_alh_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
 	/* Program Stream config ALH register */
 	conf = intel_readl(alh, SDW_ALH_STRMZCFG(pdi->intel_alh_id));
 
-	conf |= FIELD_PREP(SDW_ALH_STRMZCFG_DMAT, SDW_ALH_STRMZCFG_DMAT_VAL);
-	conf |= FIELD_PREP(SDW_ALH_STRMZCFG_CHN, pdi->ch_count - 1);
+	conf = u32_replace_bits(conf, SDW_ALH_STRMZCFG_DMAT_VAL, SDW_ALH_STRMZCFG_DMAT);
+	conf = u32_replace_bits(conf, pdi->ch_count - 1, SDW_ALH_STRMZCFG_CHN);
 
 	intel_writel(alh, SDW_ALH_STRMZCFG(pdi->intel_alh_id), conf);
 }
-- 
2.26.2

