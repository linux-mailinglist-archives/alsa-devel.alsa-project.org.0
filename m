Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4738D56A20B
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 14:33:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBCF21657;
	Thu,  7 Jul 2022 14:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBCF21657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657197221;
	bh=lXvpWcDjkZVCDIYvO9U+SgSDw9/2CcD+i1vW3uk7mQQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DbAwl4laqblTevK8bLjCGBx9oH6ih2GPQFI3LX/E+n5QPR+LPmUC4OoEFziQdLq8T
	 lWDqW4wjaIQL93Z/VIAsg28piApMUiHNCbGn+WcKbhV7YQHpnYzjX5Z7/pVNSEE3SA
	 u2gMkMxzh4h5GFkZNy5k0XXo0yS00/AVLnKJZ50Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D536F8053C;
	Thu,  7 Jul 2022 14:32:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C196FF8053D; Thu,  7 Jul 2022 14:32:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0058F80137
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 14:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0058F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JYJEpd1d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657197118; x=1688733118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lXvpWcDjkZVCDIYvO9U+SgSDw9/2CcD+i1vW3uk7mQQ=;
 b=JYJEpd1dblfpV68hnq38Jit6iFhkVngCTvABsRGTvLwfQKl8S2+w1/Eo
 14XFds6McNH7nzyZcgSJqZ2ERRe+Sj2xzK07nlLfRys5OSGf3TjHVKA1j
 emHR5IvQYsAWt8Avu+oO3wjRNPGpTwB5xMWnEMVaf6hz8icpgvXGT74lA
 MWvKAh4Dzafto+F77GQPBiXlCA/b0EtV5m6mt9mK/p+DuzEAxBStgYLTy
 SsmVGXYQPqM2ji85hnCiqxDr2flAbbB4kWnkfk6VEO1zkQHHoW037fMKc
 m4AiaTaByxiN1NnjPsG4zEIagm2YRCxpwW3NOq7mOsqaw72DLztJUrjCi A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272805888"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="272805888"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 05:31:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="593720559"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga002.jf.intel.com with ESMTP; 07 Jul 2022 05:31:50 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 02/12] ASoC: Intel: avs: Assign I2S gateway when parsing
 topology
Date: Thu,  7 Jul 2022 14:41:43 +0200
Message-Id: <20220707124153.1858249-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707124153.1858249-1-cezary.rojewski@intel.com>
References: <20220707124153.1858249-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

For formatted port - ssp%d - descriptions to have an effect, copier
module templates need to be updated with specified port value. This
value is later propagated to the firmware when module instances are
being instantiated.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/topology.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 6a06fe387d13..8a9f9fc48938 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -808,6 +808,30 @@ static const struct avs_tplg_token_parser pin_format_parsers[] = {
 	},
 };
 
+static void
+assign_copier_gtw_instance(struct snd_soc_component *comp, struct avs_tplg_modcfg_ext *cfg)
+{
+	struct snd_soc_acpi_mach *mach;
+
+	if (!guid_equal(&cfg->type, &AVS_COPIER_MOD_UUID))
+		return;
+
+	/* Only I2S boards assign port instance in ->i2s_link_mask. */
+	switch (cfg->copier.dma_type) {
+	case AVS_DMA_I2S_LINK_OUTPUT:
+	case AVS_DMA_I2S_LINK_INPUT:
+		break;
+	default:
+		return;
+	}
+
+	mach = dev_get_platdata(comp->card->dev);
+
+	/* Automatic assignment only when board describes single SSP. */
+	if (hweight_long(mach->mach_params.i2s_link_mask) == 1 && !cfg->copier.vindex.i2s.instance)
+		cfg->copier.vindex.i2s.instance = __ffs(mach->mach_params.i2s_link_mask);
+}
+
 static int avs_tplg_parse_modcfg_ext(struct snd_soc_component *comp,
 				     struct avs_tplg_modcfg_ext *cfg,
 				     struct snd_soc_tplg_vendor_array *tuples,
@@ -827,6 +851,9 @@ static int avs_tplg_parse_modcfg_ext(struct snd_soc_component *comp,
 	if (ret)
 		return ret;
 
+	/* Update copier gateway based on board's i2s_link_mask. */
+	assign_copier_gtw_instance(comp, cfg);
+
 	block_size -= esize;
 	/* Parse trailing in/out pin formats if any. */
 	if (block_size) {
-- 
2.25.1

