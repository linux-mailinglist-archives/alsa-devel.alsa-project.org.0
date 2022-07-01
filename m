Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 503A656309B
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 11:48:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE8E716C0;
	Fri,  1 Jul 2022 11:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE8E716C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656668911;
	bh=E3GxID44ACfrRmydY0xS59U+1UHVvI8Fcwwn+rcSwFU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UGGFB9Bhu9zZT8eDs7FQZAHwS+d7yZez1HAS22QiDlQ3weu4lw5SP7TF9nA61LtCW
	 TvWEeXPrvoJX58vfqdaCU8qgWc4EZOJmvmN7tj4K4Idf+RDz7s8NVT73FY+N8XnIoi
	 mfXj05OC0cGX3URT8KAuZG9QW5TVGTr+5gX5Cfbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A1B1F80107;
	Fri,  1 Jul 2022 11:47:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73E50F80155; Fri,  1 Jul 2022 11:47:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32BB7F8014E
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 11:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32BB7F8014E
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2AB88201398;
 Fri,  1 Jul 2022 11:47:26 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E74C620138B;
 Fri,  1 Jul 2022 11:47:25 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 3D995181D0CA;
 Fri,  1 Jul 2022 17:47:24 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/6] Add support of two Audio PLL source
Date: Fri,  1 Jul 2022 17:32:35 +0800
Message-Id: <1656667961-1799-1-git-send-email-shengjiu.wang@nxp.com>
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

i.MX8MQ/MN/MM/MP platforms typically have 2 AUDIO PLLs being
configured to handle 8kHz and 11kHz series audio rates.

The patches implement the functionality to select at runtime
the appropriate AUDIO PLL for root clock, if there is no
two PLL registered, then no action taken.

change in v2:
- simply the logic for calling reparent function

Shengjiu Wang (6):
  ASoC: fsl_utils: Add function to handle PLL clock source
  ASoC: fsl_spdif: Add support for PLL switch at runtime.
  ASoC: fsl_micfil: Add support for PLL switch at runtime
  ASoC: fsl_sai: Add support for PLL switch at runtime
  ASoC: dt-bindings: fsl_spdif: Add two PLL clock source
  ASoC: dt-bindings: fsl-sai: Add two PLL clock source

 .../devicetree/bindings/sound/fsl,spdif.yaml  |  4 ++
 .../devicetree/bindings/sound/fsl-sai.txt     |  3 +
 sound/soc/fsl/Kconfig                         |  3 +
 sound/soc/fsl/fsl_micfil.c                    | 31 +++++++++
 sound/soc/fsl/fsl_sai.c                       | 38 ++++++++++
 sound/soc/fsl/fsl_sai.h                       |  2 +
 sound/soc/fsl/fsl_spdif.c                     | 48 +++++++++++--
 sound/soc/fsl/fsl_utils.c                     | 69 +++++++++++++++++++
 sound/soc/fsl/fsl_utils.h                     |  7 ++
 9 files changed, 200 insertions(+), 5 deletions(-)

-- 
2.17.1

