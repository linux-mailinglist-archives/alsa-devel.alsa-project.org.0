Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB1B56A214
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 14:35:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D2081633;
	Thu,  7 Jul 2022 14:34:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D2081633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657197309;
	bh=eYWgRGi6e/Ub6oh43K9nix22n8tIvk0eb5TlZU/18qA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GzXbGN7cCz6KFTIeTmPSQE+oMXkQ66jxtE9buLBl+Vj5+71iWDC1tplfQy4rzp3kf
	 U9Yvfldx+6UazmZAnvR+t4zg8gNx9SK1sEjhgNEdnNrZHvRKzz0M75yMNj8QqzLOO9
	 Me/tTAWoM4xxAN7IHCnF2U70dT8eYQmpzBx9WJac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC25DF80578;
	Thu,  7 Jul 2022 14:32:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D9C5F80566; Thu,  7 Jul 2022 14:32:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 821D5F8053A
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 14:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 821D5F8053A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="n4lbGY1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657197129; x=1688733129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eYWgRGi6e/Ub6oh43K9nix22n8tIvk0eb5TlZU/18qA=;
 b=n4lbGY1LrLn47Hx9o6MX7dJo3a54I8UK38nuwk7S1MAB3+5zIneuKAWW
 XSGBNU4wSs2jBs7TWBI34jGcUfYe2RaykTrGT4g8jh9tFNCIlErCfg1Dc
 6dRB3hKUtQofvSnry7NlA8ydch5c+903qZIcfzeof3mjXLbeYhu0AHI0t
 hy6htaw65Puxyvmuaob57PNu9LvzCTTrkZrrUYTkcQaIWO0syzSih9Eii
 rOlDgmhFY7sP8XomRViPFjk/yQ2Cs28M0BijkXM79+UrL57nM+SIm+vRo
 iwVU4HQlxKijM8CMwa+WGd3jWEX31n4iXgRwpuMjTyXuR2ns2GIoK+nIi Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272805949"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="272805949"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 05:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="593720678"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga002.jf.intel.com with ESMTP; 07 Jul 2022 05:32:06 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 10/12] ASoC: Intel: avs: Replace hardcodes with
 SD_CTL_STREAM_RESET
Date: Thu,  7 Jul 2022 14:41:51 +0200
Message-Id: <20220707124153.1858249-11-cezary.rojewski@intel.com>
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

Improve readability of CLDMA reset operation by making use of
already defined SD_CTL_STREAM_RESET.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/cldma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/avs/cldma.c b/sound/soc/intel/avs/cldma.c
index d100c6ba4d8a..d7a9390b5e48 100644
--- a/sound/soc/intel/avs/cldma.c
+++ b/sound/soc/intel/avs/cldma.c
@@ -176,17 +176,17 @@ int hda_cldma_reset(struct hda_cldma *cl)
 		return ret;
 	}
 
-	snd_hdac_stream_updateb(cl, SD_CTL, 1, 1);
-	ret = snd_hdac_stream_readb_poll(cl, SD_CTL, reg, (reg & 1), AVS_CL_OP_INTERVAL_US,
-					 AVS_CL_OP_TIMEOUT_US);
+	snd_hdac_stream_updateb(cl, SD_CTL, SD_CTL_STREAM_RESET, SD_CTL_STREAM_RESET);
+	ret = snd_hdac_stream_readb_poll(cl, SD_CTL, reg, (reg & SD_CTL_STREAM_RESET),
+					 AVS_CL_OP_INTERVAL_US, AVS_CL_OP_TIMEOUT_US);
 	if (ret < 0) {
 		dev_err(cl->dev, "cldma set SRST failed: %d\n", ret);
 		return ret;
 	}
 
-	snd_hdac_stream_updateb(cl, SD_CTL, 1, 0);
-	ret = snd_hdac_stream_readb_poll(cl, SD_CTL, reg, !(reg & 1), AVS_CL_OP_INTERVAL_US,
-					 AVS_CL_OP_TIMEOUT_US);
+	snd_hdac_stream_updateb(cl, SD_CTL, SD_CTL_STREAM_RESET, 0);
+	ret = snd_hdac_stream_readb_poll(cl, SD_CTL, reg, !(reg & SD_CTL_STREAM_RESET),
+					 AVS_CL_OP_INTERVAL_US, AVS_CL_OP_TIMEOUT_US);
 	if (ret < 0) {
 		dev_err(cl->dev, "cldma unset SRST failed: %d\n", ret);
 		return ret;
-- 
2.25.1

