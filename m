Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D683754F265
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 10:00:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D0DE1B0B;
	Fri, 17 Jun 2022 09:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D0DE1B0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655452821;
	bh=z/Glu1iUac/syCab7z/hDaTohPEXEnw9Gd+Af6EXNyU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mVSCxlI7y/Wmj9vmJDOKPqBUdcgEuxh6mTTinNBwqakBCaBJhveHyY3U9QtEfXS5Z
	 Fbzh1DUyKmWHQ78ndoLqTSH1tF0iWjxLdr1aU3E9HRXaVGM4/LsPwzyscSNVYNvIjS
	 OC0bme0WLn98aqXcAeS7MKB33zE5qEJI5FxxfMVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9828AF8028B;
	Fri, 17 Jun 2022 09:59:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D6C3F8019D; Fri, 17 Jun 2022 09:59:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB103F800D3
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 09:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB103F800D3
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B77E1201FAA;
 Fri, 17 Jun 2022 09:59:15 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6E2B2201FAC;
 Fri, 17 Jun 2022 09:59:15 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 7FDD61820F45;
 Fri, 17 Jun 2022 15:59:13 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/7] Add PDM/DSD/dataline configuration support
Date: Fri, 17 Jun 2022 15:44:30 +0800
Message-Id: <1655451877-16382-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

Support PDM format and DSD format.
Add new dts property to configure dataline. The SAI has multiple
successive FIFO registers, but in some use
case the required dataline/FIFOs are not successive.

Changes in v2:
- refine the commit subject of patch 5/7

Shengjiu Wang (7):
  ASoC: fsl_sai: Add PDM daifmt support
  ASoC: fsl_sai: Add DSD bit format support
  ASoC: fsl_sai: Add support for more sample rates
  ASoc: fsl_sai: Add pinctrl operation for PDM and DSD
  ASoC: fsl_sai: Make res a member of struct fsl_sai
  ASoC: dt-bindings: fsl-sai: Add new property to configure dataline
  ASoC: fsl_sai: Configure dataline/FIFO information from dts property

 .../devicetree/bindings/sound/fsl-sai.txt     |   8 +
 sound/soc/fsl/fsl_sai.c                       | 260 ++++++++++++++++--
 sound/soc/fsl/fsl_sai.h                       |  26 +-
 3 files changed, 272 insertions(+), 22 deletions(-)

-- 
2.17.1

