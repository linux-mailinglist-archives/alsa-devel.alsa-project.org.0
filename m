Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 983D648712B
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 04:21:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25D911917;
	Fri,  7 Jan 2022 04:20:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25D911917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641525660;
	bh=gCw1+YLype4pAwiMwd0KurlXs6QRNARrS1G25zm+oUM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qFI4uXTP4mj8LoJ0wfzF+bOY53MfV4xARcgsjvYcgb0klcPy4YujV74dXCYcuwTcP
	 ML4Ad9ucns8CuXCgPUNSYt3x247lWYPRKvi3NN548I6bGSuAtGRdRDRhe7wjwbdccS
	 XQQMB6pQy9Puc6sgwKoIwOk3D82AA9NIXX5nHTOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90E75F8007E;
	Fri,  7 Jan 2022 04:19:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F22C3F80249; Fri,  7 Jan 2022 04:19:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35A9DF80082
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 04:19:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35A9DF80082
Received: by mail-oi1-f176.google.com with SMTP id q186so1095981oih.8
 for <alsa-devel@alsa-project.org>; Thu, 06 Jan 2022 19:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N/+02Uu7Xsp1Sp9baEddjo+2GjQCq8pPfkwGXAATyL4=;
 b=EM7pLeZSq6ldENosO/jWDo+oa5Y0NBSfsi65e7AlX1Okj45BjivXc4EzyxV190ofs2
 RrmkVPa0DI9ebgmk5rOorTQp+TZfC1jz+0ju/I6UQIoiSJ0OlsHd76N01aLijy2GfQhb
 jhYI3fSOuBLDnPND/sD3t5R3NrnJy+DoR0q/zzYaa8j1Z3yUUXJlHsUqrnvmXguQHCPS
 tx1l7JQq+7DLp9aD1sy8xnjuf6mOgzH2JlGOuMNCj8fonYbxqhDmUjzf/qKaKY7GmWku
 s4/FmTAZtsWBFDD4Pj+3Mce3oE9xpn9P46mexP1E6sU7RuJOTimqOYcSjaEET5tVZVUd
 otZw==
X-Gm-Message-State: AOAM532Mehkb/HpZP54suW0Lefc+HDiXCBIIM9Yqb6YYB0huOWCxgZzp
 L0HnHALxLJQ9QVbkkd1QIg==
X-Google-Smtp-Source: ABdhPJxFwsoov8BM23F84ePRF4MesulXZT7/QFwJgwS4jJCHX9pjJTcfT92RcdErUYh2DLqb705wyg==
X-Received: by 2002:a05:6808:f11:: with SMTP id
 m17mr4241451oiw.36.1641525585657; 
 Thu, 06 Jan 2022 19:19:45 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id q13sm555020otf.76.2022.01.06.19.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 19:19:45 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lee Jones <lee.jones@linaro.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michal Simek <michal.simek@xilinx.com>, Suman Anna <s-anna@ti.com>,
 - <patches@opensource.cirrus.com>, John Crispin <john@phrozen.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Kumar Gogada <bharat.kumar.gogada@xilinx.com>
Subject: [PATCH] dt-bindings: Drop required 'interrupt-parent'
Date: Thu,  6 Jan 2022 21:19:04 -0600
Message-Id: <20220107031905.2406176-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

'interrupt-parent' is never required as it can be in a parent node or a
parent node itself can be an interrupt provider. Where exactly it lives is
outside the scope of a binding schema.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/gpio/toshiba,gpio-visconti.yaml  | 1 -
 .../devicetree/bindings/mailbox/ti,omap-mailbox.yaml     | 9 ---------
 Documentation/devicetree/bindings/mfd/cirrus,madera.yaml | 1 -
 .../devicetree/bindings/net/lantiq,etop-xway.yaml        | 1 -
 .../devicetree/bindings/net/lantiq,xrx200-net.yaml       | 1 -
 .../devicetree/bindings/pci/sifive,fu740-pcie.yaml       | 1 -
 .../devicetree/bindings/pci/xilinx-versal-cpm.yaml       | 1 -
 7 files changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
index 9ad470e01953..b085450b527f 100644
--- a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
+++ b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
@@ -43,7 +43,6 @@ required:
   - gpio-controller
   - interrupt-controller
   - "#interrupt-cells"
-  - interrupt-parent
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
index e864d798168d..d433e496ec6e 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
@@ -175,15 +175,6 @@ required:
   - ti,mbox-num-fifos
 
 allOf:
-  - if:
-      properties:
-        compatible:
-          enum:
-            - ti,am654-mailbox
-    then:
-      required:
-        - interrupt-parent
-
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml b/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
index 499c62c04daa..5dce62a7eff2 100644
--- a/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
+++ b/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
@@ -221,7 +221,6 @@ required:
   - '#gpio-cells'
   - interrupt-controller
   - '#interrupt-cells'
-  - interrupt-parent
   - interrupts
   - AVDD-supply
   - DBVDD1-supply
diff --git a/Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml b/Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml
index 437502c5ca96..3ce9f9a16baf 100644
--- a/Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml
+++ b/Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml
@@ -46,7 +46,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupt-parent
   - interrupts
   - interrupt-names
   - lantiq,tx-burst-length
diff --git a/Documentation/devicetree/bindings/net/lantiq,xrx200-net.yaml b/Documentation/devicetree/bindings/net/lantiq,xrx200-net.yaml
index 7bc074a42369..5bc1a21ca579 100644
--- a/Documentation/devicetree/bindings/net/lantiq,xrx200-net.yaml
+++ b/Documentation/devicetree/bindings/net/lantiq,xrx200-net.yaml
@@ -38,7 +38,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupt-parent
   - interrupts
   - interrupt-names
   - "#address-cells"
diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
index 2b9d1d6fc661..72c78f4ec269 100644
--- a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
@@ -61,7 +61,6 @@ required:
   - num-lanes
   - interrupts
   - interrupt-names
-  - interrupt-parent
   - interrupt-map-mask
   - interrupt-map
   - clock-names
diff --git a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
index a2bbc0eb7220..32f4641085bc 100644
--- a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
+++ b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
@@ -55,7 +55,6 @@ required:
   - reg-names
   - "#interrupt-cells"
   - interrupts
-  - interrupt-parent
   - interrupt-map
   - interrupt-map-mask
   - bus-range
-- 
2.32.0

