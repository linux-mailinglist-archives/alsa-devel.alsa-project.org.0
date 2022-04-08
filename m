Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4424F9433
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 13:35:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DCC81AA8;
	Fri,  8 Apr 2022 13:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DCC81AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649417734;
	bh=n50UQDqxKU/pVJiB0SDV1m4QMPRZA1uJoK3UF16V0Z8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nLp8p6xM23ecmIm5NKpyaLppv4rTdpwaAP4KX/jiGRGfxcT99b6OthfVl2SOmJYyY
	 ob+TEDMfz6HKZC8b3I1j2e+d/6lh3cvvis5Ibb8HHRXU15VClxImje21wGPW2ZHq2Y
	 chK915uh2RukpE34LCJJBPDNhFV7I82v9fGi2UJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FB87F805AE;
	Fri,  8 Apr 2022 13:30:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF990F80552; Fri,  8 Apr 2022 13:30:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81CFCF8051C
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 13:29:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81CFCF8051C
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo9-0004xt-N1; Fri, 08 Apr 2022 13:29:41 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo9-001n7A-2K; Fri, 08 Apr 2022 13:29:39 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo3-005ZBF-0L; Fri, 08 Apr 2022 13:29:35 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 12/21] ASoC: fsl_micfil: add multi fifo support
Date: Fri,  8 Apr 2022 13:29:19 +0200
Message-Id: <20220408112928.1326755-13-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408112928.1326755-1-s.hauer@pengutronix.de>
References: <20220408112928.1326755-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 dmaengine@vger.kernel.org, Shengjiu Wang <shengjiu.wang@gmail.com>
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

The micfil hardware provides the microphone data on multiple successive
FIFO registers, one register per stereo pair. Also to work properly the
SDMA_DONE0_CONFIG_DONE_SEL bit in the SDMA engines SDMA_DONE0_CONFIG
register must be set. This patch provides the necessary information to
the SDMA engine driver.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
---

Notes:
    Changes since v3:
    - Fix include name
    
    Changes since v2:
    - Add forgotten commit message

 sound/soc/fsl/fsl_micfil.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 4656a18a03e45..56df916ad55f2 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -16,6 +16,7 @@
 #include <linux/regmap.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
+#include <linux/dma/imx-dma.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
@@ -35,6 +36,7 @@ struct fsl_micfil {
 	struct clk *busclk;
 	struct clk *mclk;
 	struct snd_dmaengine_dai_dma_data dma_params_rx;
+	struct sdma_peripheral_config sdmacfg;
 	unsigned int dataline;
 	char name[32];
 	int irq[MICFIL_IRQ_LINES];
@@ -324,6 +326,10 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+	micfil->dma_params_rx.peripheral_config = &micfil->sdmacfg;
+	micfil->dma_params_rx.peripheral_size = sizeof(micfil->sdmacfg);
+	micfil->sdmacfg.n_fifos_src = channels;
+	micfil->sdmacfg.sw_done = true;
 	micfil->dma_params_rx.maxburst = channels * MICFIL_DMA_MAXBURST_RX;
 
 	return 0;
-- 
2.30.2

