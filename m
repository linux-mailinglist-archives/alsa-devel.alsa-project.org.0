Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C44F95F9E4E
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 14:05:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E55B2969;
	Mon, 10 Oct 2022 14:04:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E55B2969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665403515;
	bh=4YdFMjhM1DtFAFfOtuD42QSIi2KGcULvygjiUYi2suk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cv9xxTCry07bQHW/pdBTiChNyH86N+i1FeeSiIacw2+MfMjZc5K0oZ/vu2xYgkIOV
	 1PKMofB8uEHKACIjKmF/bYzX8H3v16lfj9+f9TnEzZGWlLUopHILOQTZVa4SUB3TYB
	 Qhz76xZixgGG4ObTblYEPvc2PvmgrHX8N3YMJeBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADFF3F8053B;
	Mon, 10 Oct 2022 14:03:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6AE5F804FF; Mon, 10 Oct 2022 14:03:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6261EF800B8
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 14:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6261EF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="N5s4AAt8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665403432; x=1696939432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4YdFMjhM1DtFAFfOtuD42QSIi2KGcULvygjiUYi2suk=;
 b=N5s4AAt8cems6+DLyI9piHmT/C7P39AsAmrZRTqhpgyo/Eo1Wzgi/sJO
 gm/6dRhHLaSpOlkTx0Cg6iAUoH3AP6zn8wFpDWyouBz84RXg+a6MLaJLC
 2nokix/gq9MVEuHtaXq96t3zduEzc/C3kq9tUr+lwCde+VQebgdTtBQH/
 leZWHWRtJJnJRu6Ovh+VGi7ni61BrnaWgi5VCH/dnBRE6pHgLqYz/48Yc
 Z/oURYYhvGVmUFhTH0JWMFP98cs2c2QCl2AmfwajrhoKKJT4cNRJ4Ok6y
 8dQnohfI9PqCibXNQexBQ2Nmdzl3kvmK0++Zk2l9so8BVutUwK2Ew0+Wj w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="368346065"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="368346065"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 05:03:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="871078860"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="871078860"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 10 Oct 2022 05:03:48 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 01/15] ASoC: Intel: avs: Fix DMA mask assignment
Date: Mon, 10 Oct 2022 14:19:41 +0200
Message-Id: <20221010121955.718168-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010121955.718168-1-cezary.rojewski@intel.com>
References: <20221010121955.718168-1-cezary.rojewski@intel.com>
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

Spelling error leads to incorrect behavior when setting up DMA mask.

Fixes: a5bbbde2b81e ("ASoC: Intel: avs: Use helper function to set up DMA")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index c50c20fd681a..58db13374166 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -440,7 +440,7 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	if (bus->mlcap)
 		snd_hdac_ext_bus_get_ml_capabilities(bus);
 
-	if (!dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
+	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
 		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	dma_set_max_seg_size(dev, UINT_MAX);
 
-- 
2.25.1

