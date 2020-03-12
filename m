Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3CF1837A0
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 18:32:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C76FE172F;
	Thu, 12 Mar 2020 18:31:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C76FE172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584034354;
	bh=oPBEH1UuTE5mhosr860CYrNrZPhGotiaK2icJxvvAV0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DNgCV+daLofnxqqijpetIWm8qSViZiqXND/N263DhQyxh7rh+UKcfIar3HvOfgwtL
	 HxivLDVuFEmcXr7xQcGZKW5NFL9wNUFH7IilNy+pziBacQLRGbY2814YYtlohG81ex
	 lH/6a30yzvpl0EoEfGMLWQaItGXYr0jjC2aX5L8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F57AF801D9;
	Thu, 12 Mar 2020 18:30:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00732F800BE; Thu, 12 Mar 2020 18:30:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FF05F8013E
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 18:30:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FF05F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="g6RAegYu"
Received: by mail-wr1-x443.google.com with SMTP id 6so8559700wre.4
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 10:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=x3OsNYo4WOFc4e3N45xENkSPMvXkKhjC6Ed5es5ifqc=;
 b=g6RAegYueXWuES+iYPK9Gx7ix10quTgc1ud5mKsYb3JnooppxE0lL1gjlhqcSCzaQj
 J/HpKmkgG1HkW6I6eDyzTS7nsc0xqLs9o0Ew4C14V6N+HogqAbYe4OtujhizuUqlpZR5
 rulWdJPyPze13u9HQ9NENF7fALTj1bdbjZDh92TloU9d78F3K8M1khhOakADPAZEffjL
 WquoKWFqAFPYlEHDxJp2bOoe38p89iKuifCU82U5+NdiB3jpZFc6lwfRNiWw8pAi3q0v
 LpnjMSR7EfUQfh8nsNXo+Xg/U2LR+yOVrAVKlQWtk0IuJWsUkKXk8w+1EXbtNOcTURHT
 hCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=x3OsNYo4WOFc4e3N45xENkSPMvXkKhjC6Ed5es5ifqc=;
 b=bPLaf9SbyK+xjy/MH1labZ5edMnk0GoPeJiKe2apWzsC3XOLWI5nyfx3Urdn4jo9wU
 2POyLnOOC9KMn0tqMJz5rw1HFYuzy8aGOLIWs9+qj6Nya2cf6smqp7OFXlgksR+x+9jn
 lgw31wFAPWeZGnGjschvwXNcsjFy/PgEWEvaflK5m1KitsjlP3DvC9NcNDaemgkE0B7w
 wwXTZjfVlD5M7s5c0MuKsbX3RxKZqM8SmVvChZDNJv9mQXIk8H4l3BZ/I9jRTNSVUM9K
 /8Ggzk9WXylZwj6qXdn2ZyBr1xzctxUYDv863VI+RL9wOFXdpGNylTjPt485N9EI5JYJ
 0bjQ==
X-Gm-Message-State: ANhLgQ2gJ9aTxgDfyugh1g3QBOwRWA/eLxhMxa4ax8J/GssSOOiPNobM
 z8Cu9Omn+CU32+KmvQalnrY=
X-Google-Smtp-Source: ADFU+vuaSKw7SYbH880phKppaz4MtvoEjwN3be8Iip/jpwF5n3XHQkpzzWFily55uljws4EM4ziA8A==
X-Received: by 2002:a5d:6908:: with SMTP id t8mr12459365wru.92.1584034246665; 
 Thu, 12 Mar 2020 10:30:46 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id x24sm13170222wmc.36.2020.03.12.10.30.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 10:30:46 -0700 (PDT)
From: Johan Jonker <jbx6244@gmail.com>
To: lgirdwood@gmail.com
Subject: [PATCH v1 2/2] dt-bindings: sound: rockchip-spdif: add
 #sound-dai-cells property
Date: Thu, 12 Mar 2020 18:30:37 +0100
Message-Id: <20200312173037.21477-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200312173037.21477-1-jbx6244@gmail.com>
References: <20200312173037.21477-1-jbx6244@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, heiko@sntech.de,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-rockchip@lists.infradead.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

'#sound-dai-cells' is required to properly interpret
the list of DAI specified in the 'sound-dai' property,
so add them to 'rockchip-spdif.yaml'

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
index 45c6eea30..39aa0b4f7 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -59,6 +59,9 @@ properties:
       The phandle of the syscon node for the GRF register.
       Required property on RK3288.
 
+  "#sound-dai-cells":
+    const: 0
+
 required:
   - compatible
   - reg
@@ -67,6 +70,7 @@ required:
   - clock-names
   - dmas
   - dma-names
+  - "#sound-dai-cells"
 
 if:
   properties:
@@ -93,4 +97,5 @@ examples:
       clock-names = "mclk", "hclk";
       dmas = <&dmac1_s 8>;
       dma-names = "tx";
+      #sound-dai-cells = <0>;
     };
-- 
2.11.0

