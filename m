Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C686BAD7
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 12:58:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5749B168F;
	Wed, 17 Jul 2019 12:57:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5749B168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563361110;
	bh=SsWHIL3gRtTR/KsYiC/JAhLOnWeUUuqg0iSD05jyozY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cFUvuUchOvZT9zkPNjhatjwRF8+u56AbIufDVMr151b23+taHpdz5IXlvCPMgOptj
	 BUwy4bldfrNJOIEMPjhJdaGDModNS2oqXzR4dB6Dx79cUGJTCJ+Xu1Im4RruLH4jsm
	 m2DGMw6MUc7rBFGhJUOyFjFq/3lKUSdZnjWWhUqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 749F5F80368;
	Wed, 17 Jul 2019 12:56:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DF7BF80369; Wed, 17 Jul 2019 12:56:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AC27F8015B
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 12:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AC27F8015B
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hnhbx-0000LT-K4; Wed, 17 Jul 2019 12:56:37 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Wed, 17 Jul 2019 12:56:32 +0200
Message-Id: <20190717105635.18514-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, Angus Ainslie <angus@akkea.ca>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [alsa-devel] [PATCH 0/3] i.MX8M support for FSL SAI
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,

those are the changes that are absolutely needed to support the i.MX8M
SAI block. The most noticable difference is the moved register layout,
due to the hardware guys adding two version registers at the start of
the register map and considerable bigger FIFO sizes.

Downstream has a lot more changes to support new features, but those
3 patches at least allows me to play back audio on i.MX8M based
systems.

Regards,
Lucas

Lucas Stach (3):
  ASoC: fsl_sai: add of_match data
  ASoC: fsl_sai: derive TX FIFO watermark from FIFO depth
  ASoC: fsl_sai: add i.MX8M support

 .../devicetree/bindings/sound/fsl-sai.txt     |  2 +-
 sound/soc/fsl/fsl_sai.c                       | 45 +++++++++++++++----
 sound/soc/fsl/fsl_sai.h                       |  8 +++-
 3 files changed, 44 insertions(+), 11 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
