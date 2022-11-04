Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9A2619C7A
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 17:04:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A01F31673;
	Fri,  4 Nov 2022 17:03:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A01F31673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667577874;
	bh=4wqiqhylKn4XJA8+PSXtRpQlTD9kexzvL4ZPUDwF0x0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SaKURaB1goedZypH7CTycR7xu6uq6/XkdhSNEA2WZYOJEdIFEwarPSXtk7rfeXk12
	 pDc0SQS+m8YqoWpMrmpMToC9Rq5TF3fnMFr3Y33Q+bZHdMjnqzcqC4kI6+UpzdCPPn
	 IDW/mpK1PSk8bHeFqXcz+360EXpFolf4fLS/wqYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D4E5F8049E;
	Fri,  4 Nov 2022 17:03:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E07CDF804E7; Fri,  4 Nov 2022 17:03:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF1EBF80149
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 17:03:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF1EBF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="lRP9Nhis"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BDCAD8523A;
 Fri,  4 Nov 2022 17:03:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1667577808;
 bh=xLYlXk7h+LkLezJ2VuK6I4kDNLPrw8cSeJgG970U+Ps=;
 h=From:To:Cc:Subject:Date:From;
 b=lRP9Nhis4zPZro68wItkVrIfoeqXSl2KQY21mBWCoK6KFweJdROw/R95nYvHsrDQS
 kjrgjQ56HtL8DrXojNjsWlMHqyTLfIJKXq3fkbFl8j28ijDQIdp31Z5y/9zh5Xx70d
 PD9eAyz/fu+u4vt83kPtzfWMkGQ3OHdaNXMdWRNher2xhNtX9lLIvMv6c42N2GqCQw
 Kj5Oftx0jDD+mJI17Wb4wT8YCbZF1A2o1zeBQlM7wxqYxlWffqWxVUsN2uCfZuD7Pu
 GnBB/H1llvdRccmOxlN/2gdp9dObceiOs1uaviIL9cRTpXXLqeDHyFPYhyi79D8Wvc
 H67Bx/DVzxElg==
From: Marek Vasut <marex@denx.de>
To: devicetree@vger.kernel.org
Subject: [PATCH 1/3] ASoC: dt-bindings: fsl-sai: Fix mx6ul and mx7d compatible
 strings
Date: Fri,  4 Nov 2022 17:03:13 +0100
Message-Id: <20221104160315.213836-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, alsa-devel@alsa-project.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>
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

Describe existing used combinations of compatible strings on MX6UL
and MX7D, which are backward compatible with MX6SX. Add the missing
imx7d-sai compatible string which is used on i.MX7 .

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org
To: devicetree@vger.kernel.org
---
 .../devicetree/bindings/sound/fsl,sai.yaml    | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index 11aab891288d2..05bad828cc353 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -18,15 +18,12 @@ description: |
 properties:
   compatible:
     oneOf:
-      - enum:
-          - fsl,vf610-sai
-          - fsl,imx6sx-sai
-          - fsl,imx6ul-sai
-          - fsl,imx7ulp-sai
-          - fsl,imx8mq-sai
-          - fsl,imx8qm-sai
-          - fsl,imx8ulp-sai
-          - fsl,imx93-sai
+      - items:
+          - enum:
+              - fsl,imx6ul-sai
+              - fsl,imx7d-sai
+          - const: fsl,imx6sx-sai
+
       - items:
           - enum:
               - fsl,imx8mm-sai
@@ -34,6 +31,15 @@ properties:
               - fsl,imx8mp-sai
           - const: fsl,imx8mq-sai
 
+      - items:
+          - enum:
+              - fsl,imx6sx-sai
+              - fsl,imx7ulp-sai
+              - fsl,imx8mq-sai
+              - fsl,imx8qm-sai
+              - fsl,imx8ulp-sai
+              - fsl,vf610-sai
+
   reg:
     maxItems: 1
 
-- 
2.35.1

