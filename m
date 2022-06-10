Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D15545C0A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:02:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FE872250;
	Fri, 10 Jun 2022 08:01:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FE872250
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654840959;
	bh=MR0JCiIRMeeslN8c7dQS89qVKgt6g4CApA7OqKVUDQk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hwg9f3vVfVIwkZZN4yuXV77ctspSiHh2SKrZbCuQBMinFzXoSE7cO9LvI2hu0jCf7
	 uwYnNXObl5IMYLuC4HAOhgNNL8wg7rQIjlnElJdOFKnSMyWGyfDF00u+DneGoQK3fq
	 Th6jCYtHFhywRM+K9bbRD8W7zvvCPPqcWqWzWAz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05E33F80520;
	Fri, 10 Jun 2022 08:01:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B346F804D2; Fri, 10 Jun 2022 08:01:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8C8FF804D2
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 08:01:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8C8FF804D2
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 068FA1A0086;
 Fri, 10 Jun 2022 08:01:15 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B26111A004D;
 Fri, 10 Jun 2022 08:01:14 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 473DB1802205;
 Fri, 10 Jun 2022 14:01:13 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: fsl,
 mqs: Add compatible string for i.MX93 platform
Date: Fri, 10 Jun 2022 13:47:21 +0800
Message-Id: <1654840042-7069-1-git-send-email-shengjiu.wang@nxp.com>
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

Add compatible string "fsl,imx93-mqs" for i.MX93 platform

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,mqs.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,mqs.txt b/Documentation/devicetree/bindings/sound/fsl,mqs.txt
index 40353fc30255..d66284b8bef2 100644
--- a/Documentation/devicetree/bindings/sound/fsl,mqs.txt
+++ b/Documentation/devicetree/bindings/sound/fsl,mqs.txt
@@ -2,7 +2,7 @@ fsl,mqs audio CODEC
 
 Required properties:
   - compatible : Must contain one of "fsl,imx6sx-mqs", "fsl,codec-mqs"
-		"fsl,imx8qm-mqs", "fsl,imx8qxp-mqs".
+		"fsl,imx8qm-mqs", "fsl,imx8qxp-mqs", "fsl,imx93-mqs".
   - clocks : A list of phandles + clock-specifiers, one for each entry in
 	     clock-names
   - clock-names : "mclk" - must required.
-- 
2.17.1

