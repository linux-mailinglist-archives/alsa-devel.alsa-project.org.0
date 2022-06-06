Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B81C53F159
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 23:04:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28FD51B61;
	Mon,  6 Jun 2022 23:03:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28FD51B61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654549479;
	bh=CY7PozmVy/h1LKiCN7+xLvp9Df96A2R2qpbefLM10is=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=URpGixwyRZ0JMu0TX68Ndi+wUQxi65AETvo0F2AMRjMDWhryQ6oq7H9M0MDuznrDm
	 BIzOfU5qNpnOAi4ULFo5YiNhFH+gld+gLPKhpLhaIGt4pllAm6O7hHsvcR9mZh1BEV
	 63kK8B/BSu9ujV0jXGVpuY/ppAuQhf1gLF9L1tw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4615F80538;
	Mon,  6 Jun 2022 23:02:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76D7BF80529; Mon,  6 Jun 2022 23:02:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 844E1F801D8
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 23:02:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 844E1F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="geJDln9j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654549357; x=1686085357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CY7PozmVy/h1LKiCN7+xLvp9Df96A2R2qpbefLM10is=;
 b=geJDln9jWjO0uwkbg5MyjAUoytNKMjymJlNwSxIs22Ap3Zn/41GDrQHk
 RnOMCf1cvGXYtkEIHNmCp3Rfmx6YXJgFMg501t/slAHMXXLtkaMxQSd+/
 lzlNQnXSmuv5N2Hpnz7fcp2lt/BWnFnrOA64MQbESiFODl3OyCX3D568V
 D37idi0sxMiN+bckJR7LqGZHSIuBsE8Rr1CM9FX4V9K5AyWIRe8QDQJlo
 MWQ2y+5x2yCPSWUkbl83zP7vKhamLtZvuQ3K1s0gkKWflRw95rrcO6Mfm
 iWwv6RwI0GADLX3hUzvmDUoaQ8TyJbBtP7SGlVuFg6ujJWabPlCFx2CZg Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="275467623"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="275467623"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 14:02:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="608914454"
Received: from yantem-mobl9.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.24.154])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 14:02:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ASoC: SOF: mediatek: Add shared_size for mediatek common
 chip information
Date: Mon,  6 Jun 2022 16:02:10 -0500
Message-Id: <20220606210212.146626-4-pierre-louis.bossart@linux.intel.com>
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

Add shared_size for mediatek common chip information which is used for
audio and trace dma.

Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: YC Hung <yc.hung@mediatek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/mediatek/adsp_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/mediatek/adsp_helper.h b/sound/soc/sof/mediatek/adsp_helper.h
index 4ab998756bbc0..d41e904e6614e 100644
--- a/sound/soc/sof/mediatek/adsp_helper.h
+++ b/sound/soc/sof/mediatek/adsp_helper.h
@@ -20,6 +20,7 @@ struct mtk_adsp_chip_info {
 	u32 sramsize;
 	u32 dramsize;
 	u32 cfgregsize;
+	u32 shared_size;
 	void __iomem *va_sram; /* corresponding to pa_sram */
 	void __iomem *va_dram; /* corresponding to pa_dram */
 	void __iomem *va_cfgreg;
-- 
2.34.1

