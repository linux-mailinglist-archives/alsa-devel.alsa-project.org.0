Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 431EE4F7A5E
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 10:51:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C52C217A3;
	Thu,  7 Apr 2022 10:50:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C52C217A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649321488;
	bh=y//iCs8apNfn9JzyLf4AAfG0PL8HYlrJBCkBvMyj2S0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JCg12Jn7QqnS7pMm0zCC8HQuU5ue1N5HP3DnZOxeovjy49lyL2oPbH8PeoxeR2ykm
	 FdJ6cdT0kujPRiVoiCuZQ+VeHFHnRLZXAJwWR7yl/kURcOXhwH432MRFkhC9L5H3gN
	 5aG2rHQSa0lKV6I0wi8K0OpwqYEG6ZbWoBe1rR4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E9B2F80529;
	Thu,  7 Apr 2022 10:49:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39187F80527; Thu,  7 Apr 2022 10:49:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B69E9F8024C
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 10:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B69E9F8024C
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncNpp-0003cs-Sj; Thu, 07 Apr 2022 10:49:45 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncNpp-001Zqg-PS; Thu, 07 Apr 2022 10:49:44 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncNpm-000w3y-Gb; Thu, 07 Apr 2022 10:49:42 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 00/21] ASoC: fsl_micfil: Driver updates
Date: Thu,  7 Apr 2022 10:49:15 +0200
Message-Id: <20220407084936.223075-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
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

This series has a bunch of cleanups for the FSL MICFIL driver. There is
not much chance for regressions in this series as the driver currently
can't work at all. The MICFIL needs multififo support in the i.MX SDMA
engine which is added with this series, see 11/20.

The multififo support is selected in the dma phandle arguments in the
device tree, the transfer type must be '25' aka IMX_DMATYPE_MULTI_SAI.
This is set already to 25 in the upstream i.MX8M[NM] dtsi files, but the
SDMA driver silently ignores unsupported values instead of throwing an
error. This is fixed in this series and multififo support is added.

The dmaengine patches have acks from Vinod, so the series is free to
go through the ASoC tree.

Changes since v3:
- Add commit log to "ASoC: fsl_micfil: drop unused variables"
- Fix include name in "ASoC: fsl_micfil: add multi fifo support"
- Drop unnecessary temporary adding of struct fsl_micfil::osr
- Leave default quality setting at 'medium'
- Drop debugging message printed at error level
- collect acks from Shengjiu Wang and Vinod Koul

Changes since v2:
- Add forgotten commit log to dmaengine patches
- Add patch to move include/linux/platform_data/dma-imx.h to include/linux/dma/imx-dma.h
- Use prefix dmaengine: for dma patches

Changes since v1:
- Drop unused variable sw_done_sel
- Evaluate sdmac->direction directly instead of storing value in n_fifos
- add missing include linux/bitfield.h

Sascha Hauer (21):
  ASoC: fsl_micfil: Drop unnecessary register read
  ASoC: fsl_micfil: Drop unused register read
  ASoC: fsl_micfil: drop fsl_micfil_set_mclk_rate()
  ASoC: fsl_micfil: do not define SHIFT/MASK for single bits
  ASoC: fsl_micfil: use GENMASK to define register bit fields
  ASoC: fsl_micfil: use clear/set bits
  ASoC: fsl_micfil: drop error messages from failed register accesses
  ASoC: fsl_micfil: drop unused variables
  dmaengine: imx: Move header to include/dma/
  dmaengine: imx-sdma: error out on unsupported transfer types
  dmaengine: imx-sdma: Add multi fifo support
  ASoC: fsl_micfil: add multi fifo support
  ASoC: fsl_micfil: use define for OSR default value
  ASoC: fsl_micfil: Drop get_pdm_clk()
  ASoC: fsl_micfil: simplify clock setting
  ASoC: fsl_micfil: rework quality setting
  ASoC: fsl_micfil: drop unused include
  ASoC: fsl_micfil: drop only once used defines
  ASoC: fsl_micfil: drop support for undocumented property
  ASoC: fsl_micfil: fold fsl_set_clock_params() into its only user
  ASoC: fsl_micfil: Remove debug message

 drivers/dma/imx-dma.c                         |   2 +-
 drivers/dma/imx-sdma.c                        |  76 +++-
 drivers/mmc/host/mxcmmc.c                     |   2 +-
 drivers/spi/spi-fsl-lpspi.c                   |   2 +-
 drivers/spi/spi-imx.c                         |   2 +-
 drivers/tty/serial/imx.c                      |   2 +-
 drivers/video/fbdev/mx3fb.c                   |   2 +-
 .../dma-imx.h => dma/imx-dma.h}               |  26 +-
 sound/soc/fsl/fsl_asrc.c                      |   2 +-
 sound/soc/fsl/fsl_asrc_dma.c                  |   2 +-
 sound/soc/fsl/fsl_easrc.h                     |   2 +-
 sound/soc/fsl/fsl_micfil.c                    | 369 +++++++-----------
 sound/soc/fsl/fsl_micfil.h                    | 269 +++----------
 sound/soc/fsl/imx-pcm.h                       |   2 +-
 sound/soc/fsl/imx-ssi.h                       |   2 +-
 15 files changed, 297 insertions(+), 465 deletions(-)
 rename include/linux/{platform_data/dma-imx.h => dma/imx-dma.h} (67%)

-- 
2.30.2

