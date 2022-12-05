Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 455CB6424CF
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 09:39:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFE421752;
	Mon,  5 Dec 2022 09:38:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFE421752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670229546;
	bh=cghulDz9lzLKc3N6pm9sxANchOK0gH9CRgJeMT3rKrc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MFh18AEUJTklnWm+Op0RcZSxrBy8eYFQlTa85WU9VXxpXmNYzvxJyYarcRIlw3E2m
	 kVZpGUmidcwWjdMDeV20fkOPAZY4gTbRHzXBITeRMiKbflOmTJjUzxX1HEa7+2ZbKw
	 j9Rw28PpJl75tpQUJYZiPnJ7ayiuN7pvaJ7iUPsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02F00F8057F;
	Mon,  5 Dec 2022 09:37:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44C0EF80155; Mon,  5 Dec 2022 09:37:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B031CF80155
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 09:36:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B031CF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cE+lAwDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670229420; x=1701765420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cghulDz9lzLKc3N6pm9sxANchOK0gH9CRgJeMT3rKrc=;
 b=cE+lAwDkVgCqDKnmdUzLBbxxn2/0bbRDq0xxUzYr6Ui2i5rsAWqWGr2g
 BKm8H3EfYewjNm2sLAZt5N/MPbuoZWLzKaBOfB+aj/8bMVCcxCpc00S4s
 TzqB61YiZfyQQqSB6rfB9KtDxoocqY5o0ssaHru5D3yrUtHg4B61Unu+2
 IN8vaq6uen9O5IpezdEjnqfsZg197CVSb6i/RlATY6HsK4VRVYcsUgWQT
 wWx6Snm95Jt5W1rDmatFcxvIv15GTkBEZKpqA8nqJv9Ns02pgbnW2sEcJ
 LUKjFHoPYgKECig6hhRxvOUGGAMj0EXcAD4rlIY8b5R7dzmwAXv4sSzXF A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="343288458"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; d="scan'208";a="343288458"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 00:36:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="647866255"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; d="scan'208";a="647866255"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 05 Dec 2022 00:36:38 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 6/6] ASoC: Intel: Skylake: Use SG allocation for SKL-based
 firmware load
Date: Mon,  5 Dec 2022 09:53:30 +0100
Message-Id: <20221205085330.857665-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205085330.857665-1-cezary.rojewski@intel.com>
References: <20221205085330.857665-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Resign from ->alloc_dma_buf() and use snd_dma_alloc_pages() directly.
For data i.e.: base firmware binary transfer, make use of SG allocation
to better adapt to memory-limited environment. For BDL descriptor, given
its small size this is not required.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-sst-cldma.c | 27 +++++++++++++++----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-sst-cldma.c b/sound/soc/intel/skylake/skl-sst-cldma.c
index b91f7a652a2b..b0204ea00f07 100644
--- a/sound/soc/intel/skylake/skl-sst-cldma.c
+++ b/sound/soc/intel/skylake/skl-sst-cldma.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/mm.h>
 #include <linux/delay.h>
+#include <sound/hda_register.h>
 #include "../common/sst-dsp.h"
 #include "../common/sst-dsp-priv.h"
 
@@ -79,21 +80,25 @@ static void skl_cldma_setup_bdle(struct sst_dsp *ctx,
 		__le32 **bdlp, int size, int with_ioc)
 {
 	__le32 *bdl = *bdlp;
+	int remaining = ctx->cl_dev.bufsize;
+	int offset = 0;
 
 	ctx->cl_dev.frags = 0;
-	while (size > 0) {
-		phys_addr_t addr = virt_to_phys(dmab_data->area +
-				(ctx->cl_dev.frags * ctx->cl_dev.bufsize));
+	while (remaining > 0) {
+		phys_addr_t addr;
+		int chunk;
 
+		addr = snd_sgbuf_get_addr(dmab_data, offset);
 		bdl[0] = cpu_to_le32(lower_32_bits(addr));
 		bdl[1] = cpu_to_le32(upper_32_bits(addr));
+		chunk = snd_sgbuf_get_chunk_size(dmab_data, offset, size);
+		bdl[2] = cpu_to_le32(chunk);
 
-		bdl[2] = cpu_to_le32(ctx->cl_dev.bufsize);
-
-		size -= ctx->cl_dev.bufsize;
-		bdl[3] = (size || !with_ioc) ? 0 : cpu_to_le32(0x01);
+		remaining -= chunk;
+		bdl[3] = (remaining > 0) ? 0 : cpu_to_le32(0x01);
 
 		bdl += 4;
+		offset += chunk;
 		ctx->cl_dev.frags++;
 	}
 }
@@ -338,15 +343,15 @@ int skl_cldma_prepare(struct sst_dsp *ctx)
 	ctx->cl_dev.ops.cl_stop_dma = skl_cldma_stop;
 
 	/* Allocate buffer*/
-	ret = ctx->dsp_ops.alloc_dma_buf(ctx->dev,
-			&ctx->cl_dev.dmab_data, ctx->cl_dev.bufsize);
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_SG, ctx->dev, ctx->cl_dev.bufsize,
+				  &ctx->cl_dev.dmab_data);
 	if (ret < 0) {
 		dev_err(ctx->dev, "Alloc buffer for base fw failed: %x\n", ret);
 		return ret;
 	}
+
 	/* Setup Code loader BDL */
-	ret = ctx->dsp_ops.alloc_dma_buf(ctx->dev,
-			&ctx->cl_dev.dmab_bdl, PAGE_SIZE);
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, ctx->dev, BDL_SIZE, &ctx->cl_dev.dmab_bdl);
 	if (ret < 0) {
 		dev_err(ctx->dev, "Alloc buffer for blde failed: %x\n", ret);
 		ctx->dsp_ops.free_dma_buf(ctx->dev, &ctx->cl_dev.dmab_data);
-- 
2.25.1

