Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B31C7002B
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:50:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45D3817B8;
	Mon, 22 Jul 2019 14:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45D3817B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563799841;
	bh=Gzy6FEFThUzn6q8raFqGJb8h9OlPJGiA064ShEIoCDw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TNSs1nIFUm/quL/jP/p1rs2kWRNR4x68I31wlNVgdxcleqs73Na2kF5k+W3G0RaDJ
	 ixSR6Yvx4mLPy4tFpIn9BHNoBEY/VpT3mChKVAqX91hJ+08eO3cAzknRoXJAoxqzNa
	 kWQc4icyxCAXccLh2ek3a8arsB0IVXDTMNFOtFXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4B55F8048D;
	Mon, 22 Jul 2019 14:48:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1DB4F803D6; Mon, 22 Jul 2019 14:48:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 874A4F800F5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 874A4F800F5
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5E3222002C0;
 Mon, 22 Jul 2019 14:48:48 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 50147200094;
 Mon, 22 Jul 2019 14:48:48 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 97615205DB;
 Mon, 22 Jul 2019 14:48:47 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Date: Mon, 22 Jul 2019 15:48:23 +0300
Message-Id: <20190722124833.28757-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 viorel.suman@nxp.com, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com, angus@akkea.ca,
 tiwai@suse.com, nicoleotsuka@gmail.com, linux-imx@nxp.com,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 l.stach@pengutronix.de
Subject: [alsa-devel] [PATCH 00/10] Add support for new SAI IP version
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

So far SAI IPs integrated with imx6 only supported one data line.
Starting with imx7 and imx8 SAI integration support up to 8 data
lines and multiple ways of combining the fifos for each data line.

New SAI IP version introduces two new registers (Version and Parmeter
registers) which are placed at the beginning of register address space.
For this reason we need to fix the register's address.

Patches 1 and 2 from Lucas enhance per SOC handling of SAI properties.
Patches 3,4,5,6,7,8 allow SAI driver to read active data lines and
fifo combine mode from DT.
Patch 9 fixes new SAI register address space.
Patch 10 enable SAI for imx7ulp and imx8mq.

This patch introduces 
Daniel Baluta (8):
  ASoC: fsl_sai: Add registers definition for multiple datalines
  ASoC: fsl_sai: Update Tx/Rx channel enable mask
  ASoC: fsl_sai: Add support to enable multiple data lines
  ASoC: dt-bindings: Document dl_mask property
  ASoC: fsl_sai: Add support for FIFO combine mode
  ASoC: dt-bindings: Document fcomb_mode property
  ASoC: fsl_sai: Add support for SAI new version
  ASoC: fsl_sai: Add support for imx7ulp/imx8mq

Lucas Stach (2):
  ASoC: fsl_sai: add of_match data
  ASoC: fsl_sai: derive TX FIFO watermark from FIFO depth

 .../devicetree/bindings/sound/fsl-sai.txt     |   9 +
 sound/soc/fsl/fsl_sai.c                       | 393 +++++++++++++-----
 sound/soc/fsl/fsl_sai.h                       |  98 +++--
 3 files changed, 361 insertions(+), 139 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
