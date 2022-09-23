Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B065E787B
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 12:35:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA717F3;
	Fri, 23 Sep 2022 12:34:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA717F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663929349;
	bh=M/7pelPFN94GP6tZlr+SV0aFBcBT8r+mvJbmmtHSvO8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fV5dbwdGEQDmBlj+s8mtOhape/umaj/64fTyHBVO49T6AO9FFTAORmtWb6mYtwOY2
	 El60LpT3CsyLplGeqGph6QQ8XPc+nV8PorMpaCZyBpjtmkyOfYu1jK6XMIjr4PTRng
	 n2pfUqYN9+uorcM2j4cpgrd+MLvd+4lX6bC7w+Kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BDFAF80431;
	Fri, 23 Sep 2022 12:34:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBC7DF80269; Fri, 23 Sep 2022 12:34:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D07B4F80124
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 12:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D07B4F80124
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B12451B7BF5;
 Fri, 23 Sep 2022 12:34:44 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6605C1A0F3B;
 Fri, 23 Sep 2022 12:34:44 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 978121820F5A;
 Fri, 23 Sep 2022 18:34:42 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [RESEND PATCH] ASoC: fsl_asrc_dma: fully initialize structs
Date: Fri, 23 Sep 2022 18:15:47 +0800
Message-Id: <1663928147-10106-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
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

From: Sascha Hauer <s.hauer@pengutronix.de>

The driver uses two statically ininitialized struct dma_slave_config,
but only one of them is initialized to zero. Initialize config_be to
zero as well to make sure that no fields are filled with random values.
Let the compiler do this instead of explicitly calling memset() which
makes it easier to read.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc_dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 12ddf2320f2d..3b81a465814a 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -139,7 +139,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	struct dma_chan *tmp_chan = NULL, *be_chan = NULL;
 	struct snd_soc_component *component_be = NULL;
 	struct fsl_asrc *asrc = pair->asrc;
-	struct dma_slave_config config_fe, config_be;
+	struct dma_slave_config config_fe = {}, config_be = {};
 	struct sdma_peripheral_config audio_config;
 	enum asrc_pair_index index = pair->index;
 	struct device *dev = component->dev;
@@ -183,7 +183,6 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	memset(&config_fe, 0, sizeof(config_fe));
 	ret = snd_dmaengine_pcm_prepare_slave_config(substream, params, &config_fe);
 	if (ret) {
 		dev_err(dev, "failed to prepare DMA config for Front-End\n");
-- 
2.34.1

