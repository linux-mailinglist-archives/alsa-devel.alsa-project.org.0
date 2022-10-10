Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D42BD5F9DFA
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 13:53:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4071128EE;
	Mon, 10 Oct 2022 13:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4071128EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665402785;
	bh=4YdFMjhM1DtFAFfOtuD42QSIi2KGcULvygjiUYi2suk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XZ01L420OTR6ZG8vR0zdTTBEKk4vDA0iMv8c8KQL2PjvO7i1LAHSa0/ZgR5HJt9xL
	 MTyynxIYnZWhTmVW6TvzAi7xyGvObm0jLcHJYijVhFS6XYec87MaUF2s7Wu0jmEugO
	 9TXI0ZvUlI2yoGmutma7+zI0CsEYQosiy+P5CTpU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E4D6F80543;
	Mon, 10 Oct 2022 13:51:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 798FEF80155; Mon, 10 Oct 2022 13:51:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9B36F80155
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 13:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9B36F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FFim7i2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665402701; x=1696938701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4YdFMjhM1DtFAFfOtuD42QSIi2KGcULvygjiUYi2suk=;
 b=FFim7i2lFUiljPC+hetTFfmLHpKtrfbwDeGcNaIffuxfJWMmOMvK+t8H
 uHSh/fwHGkLX/1E5sHHtOedkLnbezdgqodxOdEof9Nhtncf6h/RZwEqQx
 UpaMZpXQCQCwX3OqcvDy196tPuewLfZPLPrC4iPYK7FN92MKN7RollbQj
 MPLduhNczrKTmiFI73o77bFeW0lNuQdj+SfKKjAWUdDYVma5ZZGrp+Ix2
 tDqL9C/Y6oW9vhWANqwVFd2Io20DZ7zY3cBdQBvsvedAWKW7MWzrri2+t
 E+EM/ngFxhvXalkCz4/hHcSuo3x2S1I9AC0jvG1lZSJQRoGHx0Oow6WIo g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="390513204"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="390513204"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 04:51:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="954889035"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="954889035"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 10 Oct 2022 04:51:36 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 01/15] ASoC: Intel: avs: Fix DMA mask assignment
Date: Mon, 10 Oct 2022 14:07:35 +0200
Message-Id: <20221010120749.716499-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010120749.716499-1-cezary.rojewski@intel.com>
References: <20221010120749.716499-1-cezary.rojewski@intel.com>
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

