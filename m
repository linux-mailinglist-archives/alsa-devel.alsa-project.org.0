Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AF453F15C
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 23:04:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 123DF1B47;
	Mon,  6 Jun 2022 23:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 123DF1B47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654549498;
	bh=ht0GKyhGrNLqNvHA5jhQk4OKNpMZNsYyGdBb45ZisKQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mXpCezgE62HDWaZJ5nybnXnAfHS/BcCitL3MCjhoWEN8Kg4YMNdAxXB2C2EIaJYc3
	 3A5Ua+AsS+qryY1rOyFsYHobUCEXesEsK/wun0PsZjsG2F2WARLnIH0vb+cL9IRAAN
	 Ob1mf9FYlqhOPkxTlzEMAasGiiHieCD9LqJ7ZuuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E1F9F8053A;
	Mon,  6 Jun 2022 23:02:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71765F8053A; Mon,  6 Jun 2022 23:02:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFD62F8047C
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 23:02:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFD62F8047C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="L6soJ8lg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654549359; x=1686085359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ht0GKyhGrNLqNvHA5jhQk4OKNpMZNsYyGdBb45ZisKQ=;
 b=L6soJ8lgyOSXunVadbGP5vsHISZPaMRFiUwUKa/T7e5QUBxcQy8SpOiU
 6aA9u/gC/8SobcxumXJkLoWBOkulZ2IyQVztdZcsd54yDKFYeIVIKTIBE
 ba9PMhjq0zUoBLqQNQ5MBvU99KOFhqUzVNYrfug6loUwj4FQUC1AZl9oQ
 EWiecJLVUeqA3Y+jvCMkIO+69hJUsmfZoK+w9WHFOdmc6bTlMEcM+Xdxi
 ZiSQxTJtLXX28LU7NXARNfDp3rAycmkf3MW8B22A8+Ek6QCZNUzeLtbDI
 tHXPOXkmDBgv1RtoCcPFGq6Jl/TdHp0Et7069qatVO+OUv3/kWDWfF+Wt w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="275467624"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="275467624"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 14:02:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="608914455"
Received: from yantem-mobl9.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.24.154])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 14:02:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] ASoC: SOF: mediatek: mt8195 modify dram type as non-cache
Date: Mon,  6 Jun 2022 16:02:11 -0500
Message-Id: <20220606210212.146626-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606210212.146626-1-pierre-louis.bossart@linux.intel.com>
References: <20220606210212.146626-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 YC Hung <yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>
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

From: YC Hung <yc.hung@mediatek.com>

Modify dram as non-cache memory type to avoid wrong access between
host and dsp side and get the size of shared dma from device tree.

Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: YC Hung <yc.hung@mediatek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 37 +++++++++++++++-----------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 30111ab23bf5e..64d1b5a4e31b1 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -145,6 +145,14 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 
 	dev_dbg(dev, "DMA %pR\n", &res);
 
+	adsp->pa_shared_dram = (phys_addr_t)res.start;
+	adsp->shared_size = resource_size(&res);
+	if (adsp->pa_shared_dram & DRAM_REMAP_MASK) {
+		dev_err(dev, "adsp shared dma memory(%#x) is not 4K-aligned\n",
+			(u32)adsp->pa_shared_dram);
+		return -EINVAL;
+	}
+
 	ret = of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
@@ -273,23 +281,18 @@ static int adsp_shared_base_ioremap(struct platform_device *pdev, void *data)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_adsp_chip_info *adsp = data;
-	u32 shared_size;
 
 	/* remap shared-dram base to be non-cachable */
-	shared_size = TOTAL_SIZE_SHARED_DRAM_FROM_TAIL;
-	adsp->pa_shared_dram = adsp->pa_dram + adsp->dramsize - shared_size;
-	if (adsp->va_dram) {
-		adsp->shared_dram = adsp->va_dram + DSP_DRAM_SIZE - shared_size;
-	} else {
-		adsp->shared_dram = devm_ioremap(dev, adsp->pa_shared_dram,
-						 shared_size);
-		if (!adsp->shared_dram) {
-			dev_err(dev, "ioremap failed for shared DRAM\n");
-			return -ENOMEM;
-		}
+	adsp->shared_dram = devm_ioremap(dev, adsp->pa_shared_dram,
+					 adsp->shared_size);
+	if (!adsp->shared_dram) {
+		dev_err(dev, "failed to ioremap base %pa size %#x\n",
+			adsp->shared_dram, adsp->shared_size);
+		return -ENOMEM;
 	}
+
 	dev_dbg(dev, "shared-dram vbase=%p, phy addr :%pa,  size=%#x\n",
-		adsp->shared_dram, &adsp->pa_shared_dram, shared_size);
+		adsp->shared_dram, &adsp->pa_shared_dram, adsp->shared_size);
 
 	return 0;
 }
@@ -361,9 +364,11 @@ static int mt8195_dsp_probe(struct snd_sof_dev *sdev)
 		goto err_adsp_sram_power_off;
 	}
 
-	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev,
-							  priv->adsp->pa_dram,
-							  priv->adsp->dramsize);
+	priv->adsp->va_sram = sdev->bar[SOF_FW_BLK_TYPE_IRAM];
+
+	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap(sdev->dev,
+						       priv->adsp->pa_dram,
+						       priv->adsp->dramsize);
 	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
 		dev_err(sdev->dev, "failed to ioremap base %pa size %#x\n",
 			&priv->adsp->pa_dram, priv->adsp->dramsize);
-- 
2.34.1

