Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E24F5630B8
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 11:50:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EC7316F6;
	Fri,  1 Jul 2022 11:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EC7316F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656669014;
	bh=5/zEUg8fZP8bbMGnegvfvrcgTqTwvceCkZ/nfQrJSFw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lZSsln/puTEITRj7/1jzqcZImAUFIGiVSFC7KygncUPo8hxUQr1Vk5f79HXArSWrc
	 Ksvh+ueB07bNh0iiKNHSnlwELRwQW5Kh5VMknFkl8LddkDziqd0AZC3ZlPw+hOiKGh
	 bHSj8nzgwr1uQL6L9hdrPfEfUeX5bPmuTy2zpQ4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EB95F80553;
	Fri,  1 Jul 2022 11:47:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C14DFF8052E; Fri,  1 Jul 2022 11:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D05D3F80256
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 11:47:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D05D3F80256
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 20FF020138B;
 Fri,  1 Jul 2022 11:47:32 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DE3FE20137C;
 Fri,  1 Jul 2022 11:47:31 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 359E61820F57;
 Fri,  1 Jul 2022 17:47:30 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 5/6] ASoC: dt-bindings: fsl_spdif: Add two PLL clock source
Date: Fri,  1 Jul 2022 17:32:40 +0800
Message-Id: <1656667961-1799-6-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1656667961-1799-1-git-send-email-shengjiu.wang@nxp.com>
References: <1656667961-1799-1-git-send-email-shengjiu.wang@nxp.com>
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

Add two PLL clock source, they are the parent clocks of root clock
one is for 8kHz series rates, another one is for 11kHz series rates.
They are optional clocks, if there are such clocks, then driver
can switch between them for supporting more accurate rates.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,spdif.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,spdif.yaml b/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
index f226ec13167a..1d64e8337aa4 100644
--- a/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
@@ -58,6 +58,8 @@ properties:
           slave of the Shared Peripheral Bus and when two or more bus masters
           (CPU, DMA or DSP) try to access it. This property is optional depending
           on the SoC design.
+      - description: PLL clock source for 8kHz series rate, optional.
+      - description: PLL clock source for 11khz series rate, optional.
     minItems: 9
 
   clock-names:
@@ -72,6 +74,8 @@ properties:
       - const: rxtx6
       - const: rxtx7
       - const: spba
+      - const: pll8k
+      - const: pll11k
     minItems: 9
 
   big-endian:
-- 
2.17.1

