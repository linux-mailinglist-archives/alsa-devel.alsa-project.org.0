Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE0647712E
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 12:57:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E6961DE5;
	Thu, 16 Dec 2021 12:56:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E6961DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639655839;
	bh=YtnmP6+HKJ2lDHhBkQ45AXl3aMknl9BzQG4vhz+CIHw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=onTRi5CNii4jJ1TNqMLwRvD/4IYmiBjfK4+/pgocetbCdKVJtRZKms3rPtLtuQcu8
	 cqYIjkTtI8urqJUpGvMUSNoGJOIZUXVWkoPZRBru2rW1Yrj9SoRtUDjNoeiwh5dAIm
	 qYFFqz+55KNhaJax2Fa2GZ9CUhpR0eJmrap19C7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECB56F8016E;
	Thu, 16 Dec 2021 12:56:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EE73F8016E; Thu, 16 Dec 2021 12:56:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38B35F800B0
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 12:56:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38B35F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="amjmxq2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639655767; x=1671191767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YtnmP6+HKJ2lDHhBkQ45AXl3aMknl9BzQG4vhz+CIHw=;
 b=amjmxq2aWnF/ZtF9BXB7GcsZfO6NjZqwKrPMpSLTbpubHc5qz+WFiUeg
 Du9od6zy+HAQePtOGm2HYerldRWckc/SgM6AC365H24vOkHXd/KT4xnEf
 O1jLjknkITB0TYFintQ+k7t/MsWC1ZGasc78dpauToVE46sGa0shTv8j+
 J6prdp6DzskOtFxvohxqs7F/GruoOaXjVOH66clBfEbItXQd8QYJivI0+
 cBhAdiYKB8NRQopIxwUp+PKlLDacRIsnnch69McJEwCG9gidGGsyvyxdi
 FVPdOSzx50Tes/68TpQP6fx8mrhtfQyqK5hptlzmOig5wYMMETNes5CJR A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239692037"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="239692037"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 03:56:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="506248419"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 16 Dec 2021 03:55:59 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ASoC: Intel: catpt: Test dmaengine_submit() result before
 moving on
Date: Thu, 16 Dec 2021 12:57:39 +0100
Message-Id: <20211216115743.2130622-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216115743.2130622-1-cezary.rojewski@intel.com>
References: <20211216115743.2130622-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kevin Tian <kevin.tian@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 Dave Jiang <dave.jiang@intel.com>, tiwai@suse.com
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

After calling dmaengine_submit(), the submitted transfer descriptor
belongs to the DMA engine. Pointer to that descriptor may no longer be
valid after the call and should be tested before awaiting transfer
completion.

Reported-by: Kevin Tian <kevin.tian@intel.com>
Suggested-by: Dave Jiang <dave.jiang@intel.com>
Fixes: 4fac9b31d0b9 ("ASoC: Intel: Add catpt base members")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/dsp.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
index 9c5fd18f2600..346bec000306 100644
--- a/sound/soc/intel/catpt/dsp.c
+++ b/sound/soc/intel/catpt/dsp.c
@@ -65,6 +65,7 @@ static int catpt_dma_memcpy(struct catpt_dev *cdev, struct dma_chan *chan,
 {
 	struct dma_async_tx_descriptor *desc;
 	enum dma_status status;
+	int ret;
 
 	desc = dmaengine_prep_dma_memcpy(chan, dst_addr, src_addr, size,
 					 DMA_CTRL_ACK);
@@ -77,13 +78,22 @@ static int catpt_dma_memcpy(struct catpt_dev *cdev, struct dma_chan *chan,
 	catpt_updatel_shim(cdev, HMDC,
 			   CATPT_HMDC_HDDA(CATPT_DMA_DEVID, chan->chan_id),
 			   CATPT_HMDC_HDDA(CATPT_DMA_DEVID, chan->chan_id));
-	dmaengine_submit(desc);
+
+	ret = dma_submit_error(dmaengine_submit(desc));
+	if (ret) {
+		dev_err(cdev->dev, "submit tx failed: %d\n", ret);
+		goto clear_hdda;
+	}
+
 	status = dma_wait_for_async_tx(desc);
+	ret = (status == DMA_COMPLETE) ? 0 : -EPROTO;
+
+clear_hdda:
 	/* regardless of status, disable access to HOST memory in demand mode */
 	catpt_updatel_shim(cdev, HMDC,
 			   CATPT_HMDC_HDDA(CATPT_DMA_DEVID, chan->chan_id), 0);
 
-	return (status == DMA_COMPLETE) ? 0 : -EPROTO;
+	return ret;
 }
 
 int catpt_dma_memcpy_todsp(struct catpt_dev *cdev, struct dma_chan *chan,
-- 
2.25.1

