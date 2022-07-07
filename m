Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CF456A211
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 14:34:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 182CC1693;
	Thu,  7 Jul 2022 14:33:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 182CC1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657197284;
	bh=BxsTst12WEXwPnl/7T3q6lcrSl+SvAf+7/74K9UwBk4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fm7fVjTyemXWo/hODet6c8aX5Eb8ZQX6GjYQ/WpzdgZZ5cuxq1Irk8H3tryQ4Ybr3
	 MeXs3Sw3mP5okw1G+UzNG8LC4fRFGcBCPeMH3eN0bUItpTM+FSFyoDR41w8aC0jR62
	 Yq2tyYrXdE6ubtg8gnSHG/7Gx9pRMKkycLyw5QnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B31B5F8053A;
	Thu,  7 Jul 2022 14:32:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A1F5F80557; Thu,  7 Jul 2022 14:32:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32DA3F8053E
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 14:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32DA3F8053E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OMsQk2nJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657197127; x=1688733127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BxsTst12WEXwPnl/7T3q6lcrSl+SvAf+7/74K9UwBk4=;
 b=OMsQk2nJidAFI/oDwVmxviv5JRBqFeB4OmVexbW6+Mqo/njNhCjLxVfi
 q2gldYqAlDT4EIf1phU4VV17nkI6iFEmhOP2M5+d0oLS+PY7U0JmM1emJ
 i3TALxpXqmMmPbfygMoJDlwAlcZoeIi1cCV8ihpZDNEYSqVmffS2qk3Ph
 Kme9yKUF0NyMHi8+TZq2c0clcAmtfxiEfBapIJMX7D+kLodmjISahBKSU
 DdeujDnr2UHc2uJv2Dnpkxr8/cJwLOg67aWZkUIvq0Zun3BgCcfnKuRIU
 EGAZCe5n7hpmV4K13snWbPXQ2mS4aYvZA/YBOLEjXljYdOFf6PlvSmPwk Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272805933"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="272805933"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 05:32:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="593720657"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga002.jf.intel.com with ESMTP; 07 Jul 2022 05:32:02 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 08/12] ASoC: Intel: avs: Use helper function to set up DMA
Date: Thu,  7 Jul 2022 14:41:49 +0200
Message-Id: <20220707124153.1858249-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707124153.1858249-1-cezary.rojewski@intel.com>
References: <20220707124153.1858249-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

dma_set_mask() and dma_set_coherent_mask() can be performed with one
call to dma_set_mask_and_coherent(), which slightly reduces amount of
code on our side.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 6a35bf45efcb..c50c20fd681a 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -440,12 +440,8 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	if (bus->mlcap)
 		snd_hdac_ext_bus_get_ml_capabilities(bus);
 
-	if (!dma_set_mask(dev, DMA_BIT_MASK(64))) {
-		dma_set_coherent_mask(dev, DMA_BIT_MASK(64));
-	} else {
-		dma_set_mask(dev, DMA_BIT_MASK(32));
-		dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
-	}
+	if (!dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
+		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	dma_set_max_seg_size(dev, UINT_MAX);
 
 	ret = avs_hdac_bus_init_streams(bus);
-- 
2.25.1

