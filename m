Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE07D57969F
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 11:46:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A3B716C7;
	Tue, 19 Jul 2022 11:46:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A3B716C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658224018;
	bh=aSL8BRo4cdC/pBgweqcCBfth/QZMYTmt0+jrmy/QnQ0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sk4woKja8rHmu0IDOviZvINcwO3Zvd5Tr7maNTlB7FeuziYxttal4x0hATBgOcPbp
	 quqKpEtAN41o9HtSTioWT+U4ArOHCSqcm0I/fSZqvBGyGNqZJLifN79pDRJ98YeaFN
	 qOKzuqjhV3nMkh70t727Mef1FCfYWcIsB4VAzFgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE112F80564;
	Tue, 19 Jul 2022 11:44:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAB89F80224; Tue, 19 Jul 2022 11:44:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B08EF80224
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 11:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B08EF80224
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9BEF0200C16;
 Tue, 19 Jul 2022 11:44:19 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 54E22200BFE;
 Tue, 19 Jul 2022 11:44:19 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 9F8971802204;
 Tue, 19 Jul 2022 17:44:17 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH -next 0/5] ASoC: fsl: Fix sparse warning
Date: Tue, 19 Jul 2022 17:27:39 +0800
Message-Id: <1658222864-25378-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

Fix sparse warning

Shengjiu Wang (5):
  ASoC: fsl_sai: Don't use plain integer as NULL pointer
  ASoC: fsl_asrc: force cast the asrc_format type
  ASoC: fsl-asoc-card: force cast the asrc_format type
  ASoC: fsl_easrc: use snd_pcm_format_t type for sample_format
  ASoC: imx-card: use snd_pcm_format_t type for asrc_format

 sound/soc/fsl/fsl-asoc-card.c | 2 +-
 sound/soc/fsl/fsl_asrc.c      | 4 ++--
 sound/soc/fsl/fsl_easrc.c     | 7 ++++---
 sound/soc/fsl/fsl_easrc.h     | 2 +-
 sound/soc/fsl/fsl_sai.c       | 2 +-
 sound/soc/fsl/imx-card.c      | 7 ++++---
 6 files changed, 13 insertions(+), 11 deletions(-)

-- 
2.34.1

