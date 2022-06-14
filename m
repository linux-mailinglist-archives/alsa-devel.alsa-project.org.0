Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2818354AE15
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 12:17:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFA4817A3;
	Tue, 14 Jun 2022 12:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFA4817A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655201824;
	bh=i/+BQyf/tq05M2c7CaIty9IB0VPDS00xVHoG6wYMBZY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uJGrBgMdTSzVIE0uJKPUfxOcFU/JcvCRdu8HLE7TzkuKyEwONn96hNQryt9pbHqFM
	 Qtob4v59vMWDWQXVbpAhIKasmd37JUZNl0Joujyg/BU/XsynFMWnKAqEyqMe8uvSuB
	 7RD3BCpMFRWDqHbCI/aW6FbjI8p266dSG/PU3A/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23200F80165;
	Tue, 14 Jun 2022 12:16:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA365F80139; Tue, 14 Jun 2022 12:15:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 117D1F800E1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 12:15:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 117D1F800E1
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1o13aP-0006TV-Ao; Tue, 14 Jun 2022 12:15:49 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1o13aM-000T4k-QL; Tue, 14 Jun 2022 12:15:48 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1o13aN-006Xoq-Hm; Tue, 14 Jun 2022 12:15:47 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_asrc_dma: fully initialize structs
Date: Tue, 14 Jun 2022 12:15:46 +0200
Message-Id: <20220614101546.1559434-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, kernel@pengutronix.de,
 Xiubo Li <Xiubo.Lee@gmail.com>
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

The driver uses two statically ininitialized struct dma_slave_config,
but only one of them is initialized to zero. Initialize config_be to
zero as well to make sure that no fields are filled with random values.
Let the compiler do this instead of explicitly calling memset() which
makes it easier to read.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/fsl/fsl_asrc_dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 5038faf035cba..fec56dbb64e60 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -138,7 +138,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	struct dma_chan *tmp_chan = NULL, *be_chan = NULL;
 	struct snd_soc_component *component_be = NULL;
 	struct fsl_asrc *asrc = pair->asrc;
-	struct dma_slave_config config_fe, config_be;
+	struct dma_slave_config config_fe = {}, config_be = {};
 	enum asrc_pair_index index = pair->index;
 	struct device *dev = component->dev;
 	struct device_node *of_dma_node;
@@ -181,7 +181,6 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	memset(&config_fe, 0, sizeof(config_fe));
 	ret = snd_dmaengine_pcm_prepare_slave_config(substream, params, &config_fe);
 	if (ret) {
 		dev_err(dev, "failed to prepare DMA config for Front-End\n");
-- 
2.30.2

