Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 244454EEF11
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 16:14:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8206D1A75;
	Fri,  1 Apr 2022 16:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8206D1A75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648822451;
	bh=X8UgXB91Px92K0MMpZtdQl1SO3RPwq8W96GE7LzzPA4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P0ZgBZErCIuhfrAB+dsTjFGq+gpRGel3dY76A7mf+YkYHt0cxOkDZKQYbO6Ro6kQw
	 xKjmXNEW+QOTKSnrfb2/9YS5/OHqMiMIVh1ccFFXL+K89iWsLzouSx3clKrgfvOVxZ
	 FDt3Bf3zNCgKdFCqGUvgx+MYkkVfkxhI958DbwFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E743FF8032D;
	Fri,  1 Apr 2022 16:13:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39464F80279; Fri,  1 Apr 2022 16:13:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 737B3F80100
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 16:12:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 737B3F80100
Received: by mail-oi1-f177.google.com with SMTP id 12so2896874oix.12
 for <alsa-devel@alsa-project.org>; Fri, 01 Apr 2022 07:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jow2eA+MI6HdTKLrJxjfgwwcafk9Rc4cTIw/I0CdChY=;
 b=EpMhH9z0M/A6QxixU8YWcpenvsW87uagKjCCXghpcMU4smQHkDSm59hEfKIVy3DriC
 DPNyBVU1rhhcLLwDRCzB+KiUOooUlHFdCY3Ob+WLSEqsvohCtTo5ubW+ce4czPKno0H+
 p5sbXK0q3IJVd1Llu08JMeU0nKa/eWbFR9qM33UjMgq9iTLyzDhIrOPljw50g7VXH9o1
 kd1RjoempzAdqBgZyvlSyi0+Wqhx/kRS1BzOVdtMIdpkye/nryDNbpOTE8fPb8/zmxRQ
 KlvQbxSclffTY9heR3h4XV9nKV8JTaKbukzXwzRzMx8Q3N6XYfFIE9Y9zRi30JiiR4Jx
 CAog==
X-Gm-Message-State: AOAM532SqUUAJa/yNvU+ReRx/HN8+GZTCJLqXY8K4FCGLxfZnIwtUZ6X
 Owrb5YscI6Ox2p2F1inrlg==
X-Google-Smtp-Source: ABdhPJwOZ6ZR8VxrolMyYpaGXgl8mDv6WoiaUUXqkNSXOh4+MeSeNSLAbSpT7zsDvb7yXs+2T2nw9A==
X-Received: by 2002:aca:e004:0:b0:2da:850a:966d with SMTP id
 x4-20020acae004000000b002da850a966dmr4748771oig.61.1648822368657; 
 Fri, 01 Apr 2022 07:12:48 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.googlemail.com with ESMTPSA id
 n128-20020a4a4086000000b0032118eda64bsm1029758ooa.38.2022.04.01.07.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:12:48 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: Fix 'enum' lists with duplicate entries
Date: Fri,  1 Apr 2022 09:12:47 -0500
Message-Id: <20220401141247.2993925-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-pm@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Sebastian Reichel <sre@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, - <patches@opensource.cirrus.com>,
 linux-media@vger.kernel.org
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

There's no reason to list the same value twice in an 'enum'. Fix all the
occurrences in the tree. A meta-schema change will catch future ones.

Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: - <patches@opensource.cirrus.com>
Cc: linux-media@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
There's also one other occurrence in snps,dwmac.yaml I didn't fix as 
there's a patch[1] for it which prompted this patch.

Rob

[1] https://lore.kernel.org/r/20220401030847epcms1p8cf7a8e1d8cd7d325dacf30f78da36328@epcms1p8

 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml        |  1 -
 Documentation/devicetree/bindings/bus/ti-sysc.yaml    |  1 -
 .../bindings/media/mediatek,vcodec-encoder.yaml       |  1 -
 .../devicetree/bindings/pinctrl/cirrus,madera.yaml    | 11 +++++------
 .../devicetree/bindings/power/supply/bq2415x.yaml     |  1 -
 5 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index 0afec83cc723..564ae6aaccf7 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -13,7 +13,6 @@ maintainers:
 properties:
   compatible:
     enum:
-      - nvidia,tegra20-pmc
       - nvidia,tegra20-pmc
       - nvidia,tegra30-pmc
       - nvidia,tegra114-pmc
diff --git a/Documentation/devicetree/bindings/bus/ti-sysc.yaml b/Documentation/devicetree/bindings/bus/ti-sysc.yaml
index bd40213302da..fced4082b047 100644
--- a/Documentation/devicetree/bindings/bus/ti-sysc.yaml
+++ b/Documentation/devicetree/bindings/bus/ti-sysc.yaml
@@ -34,7 +34,6 @@ properties:
     oneOf:
       - items:
           - enum:
-              - ti,sysc-omap2
               - ti,sysc-omap2
               - ti,sysc-omap4
               - ti,sysc-omap4-simple
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index e7b65a91c92c..df7df06c378f 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -106,7 +106,6 @@ allOf:
           enum:
             - mediatek,mt8173-vcodec-enc
             - mediatek,mt8192-vcodec-enc
-            - mediatek,mt8173-vcodec-enc
 
     then:
       properties:
diff --git a/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml b/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
index 8a90d8273767..6bd42e43cdab 100644
--- a/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
@@ -48,13 +48,12 @@ properties:
               Name of one pin group to configure.
             enum: [ aif1, aif2, aif3, aif4, mif1, mif2, mif3, pdmspk1,
                     pdmspk2, dmic4, dmic5, dmic6, gpio1, gpio2, gpio3,
-                    gpio4, gpio5, gpio6, gpio7, gpio7, gpio8, gpio9,
+                    gpio4, gpio5, gpio6, gpio7, gpio8, gpio9,
                     gpio10, gpio11, gpio12, gpio13, gpio14, gpio15,
-                    gpio16, gpio17, gpio17, gpio18, gpio19, gpio20,
-                    gpio21, gpio22, gpio23, gpio24, gpio25, gpio26,
-                    gpio27, gpio27, gpio28, gpio29, gpio30, gpio31,
-                    gpio32, gpio33, gpio34, gpio35, gpio36, gpio37,
-                    gpio37, gpio38, gpio39 ]
+                    gpio16, gpio17, gpio18, gpio19, gpio20, gpio21,
+                    gpio22, gpio23, gpio24, gpio25, gpio26, gpio27,
+                    gpio28, gpio29, gpio30, gpio31, gpio32, gpio33,
+                    gpio34, gpio35, gpio36, gpio37, gpio38, gpio39 ]
 
           function:
             description:
diff --git a/Documentation/devicetree/bindings/power/supply/bq2415x.yaml b/Documentation/devicetree/bindings/power/supply/bq2415x.yaml
index f8461f06e6f4..118cf484cc69 100644
--- a/Documentation/devicetree/bindings/power/supply/bq2415x.yaml
+++ b/Documentation/devicetree/bindings/power/supply/bq2415x.yaml
@@ -16,7 +16,6 @@ allOf:
 properties:
   compatible:
     enum:
-      - ti,bq24150
       - ti,bq24150
       - ti,bq24150a
       - ti,bq24151
-- 
2.32.0

