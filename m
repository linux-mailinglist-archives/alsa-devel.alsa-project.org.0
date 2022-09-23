Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA9B5E7667
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 11:05:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE7F274C;
	Fri, 23 Sep 2022 11:04:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE7F274C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663923906;
	bh=5QqeZoz44PnYLLtDUg+3AKrXGM3cdZPFMzxf7Jg37cs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=giHCw3ug0Te0uiNuamQblb8GwnDyhtJqDUklQy0ruajOPXfoJfD+7D9Z1fxJg/wkQ
	 jpm/oLmEiEwXxtlD45XsDi2oKP8c76S9gYW5CYonNJQG4qz01pk65uMBlDb/HrfkpZ
	 aqpJGDi571bNYqNMDKYt2a/sxocRD2G8Xuw1FS1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BC80F80431;
	Fri, 23 Sep 2022 11:04:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B57A4F80269; Fri, 23 Sep 2022 11:04:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71CC9F801EC
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 11:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71CC9F801EC
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MYmLW0jkCz1P6rt;
 Fri, 23 Sep 2022 16:59:47 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 17:03:55 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <shengjiu.wang@gmail.com>, <Xiubo.Lee@gmail.com>, <festevam@gmail.com>,
 <nicoleotsuka@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <perex@perex.cz>, <tiwai@suse.com>, <shawnguo@kernel.org>,
 <s.hauer@pengutronix.de>, <kernel@pengutronix.de>, <linux-imx@nxp.com>,
 <cuigaosheng1@huawei.com>
Subject: [PATCH] ASoC: fsl: Remove unused inline function
 imx_pcm_dma_params_init_data()
Date: Fri, 23 Sep 2022 17:03:55 +0800
Message-ID: <20220923090355.507648-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
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

The imx_pcm_dma_params_init_data() are no longer used since
commit c31da0b196f9 ("ASoC: imx-ssi: Remove unused driver"),
and the function is used to initialize some members of
"struct imx_dma_data", it's more readable to assign the value
directly, imx_pcm_dma_params_init_data is useless, so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 sound/soc/fsl/imx-pcm.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm.h b/sound/soc/fsl/imx-pcm.h
index 06b25f4b26b6..ac5f57c3cc55 100644
--- a/sound/soc/fsl/imx-pcm.h
+++ b/sound/soc/fsl/imx-pcm.h
@@ -18,15 +18,6 @@
 
 #define IMX_DEFAULT_DMABUF_SIZE	(64 * 1024)
 
-static inline void
-imx_pcm_dma_params_init_data(struct imx_dma_data *dma_data,
-	int dma, enum sdma_peripheral_type peripheral_type)
-{
-	dma_data->dma_request = dma;
-	dma_data->priority = DMA_PRIO_HIGH;
-	dma_data->peripheral_type = peripheral_type;
-}
-
 struct imx_pcm_fiq_params {
 	int irq;
 	void __iomem *base;
-- 
2.25.1

