Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E318190D92
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 13:33:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA1DD839;
	Tue, 24 Mar 2020 13:32:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA1DD839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585053187;
	bh=VZPEW+INZuo80zGqUU5LogKB9iPrEOG2qN8L40Whyq0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WCEm4g7CwWcEqZuRqZAKU8D1+KhIBQYxu3ONhM+K4m05fKjveNY71RRXj5CxWaxES
	 w2MbwSdZvFCX2xCs0/yS/+qFW1gbrKQxSHMAAYEXeUY4TjKSnST2rDNBE17bv60KiQ
	 F3UYEo/Cv/UhWq+5NYtWxfQv810ygwyGP0D565TU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D288DF801F8;
	Tue, 24 Mar 2020 13:32:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2298F80227; Tue, 24 Mar 2020 13:32:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2833FF80095
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 13:32:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2833FF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TN2CwCxN"
Received: by mail-wr1-x444.google.com with SMTP id 65so4495501wrl.1
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=atHO2cCzgOMkDYaDPQrtakvRe3Ydex6Qe9QJS9pzzX8=;
 b=TN2CwCxNWlYG1JfPYWRaeZ2r0cqpdUtqKj4DxRAJ+Vcp+KYsdavUdDfv5MMVdDam89
 QsN80wkxMFNnZKozAPaRWDyiNjGIWm6PhzoTyQ4IluC4yb2kXCp4GlMM3MOTkPGhRcrv
 jg55wqIdWr9IpkIsMIrKYD+pUyQIECB7tWUNtG/DY/Dyoux6kqUgoyMCatfdDPKftdod
 nUyk7yIZBGb/ZZIWWVo/QXHt0YLbh+mpnA6XO0f8vHvVvsyg5SWsO0z8oGQ5LyzPwZ0u
 tdtoZFiZgqZKL+s+SDNNFuHRKgGDu2/NE51KiSKcxi2rG1z1IfTz14bey+GX8KqPdW8U
 tvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=atHO2cCzgOMkDYaDPQrtakvRe3Ydex6Qe9QJS9pzzX8=;
 b=crFJIfdwD/LvYRa6Ty/pdwoqXM8yOlBsVwosoSM7GiqiMhGRp0NFgNbUgAq8CfWnsh
 B2CqWIZKpfYT+WsVE5mhc/877DyUjyZCzEsH5razOuIT6FRoKIWqSFnI4cjOoTR+rt1+
 lj2Cm88+9jC+5IfhCP+Ihzw9Oz5NEfk3kYB6FNL2ctIxfAlWWaotVTuNhu+CY2iOIBfX
 ZuIcMJxf7S/27fHAqLFN86F86mwU1BoeYJU/jIaNX0JjJdYoSTvJJ3d7tlK9i/PILomQ
 jDqonxALsiak5HJTkTQDs7hCWe+YXuTCe8VbAMsTNTLwKeAn8jAUs3/+oRuWSFISdqza
 5B0Q==
X-Gm-Message-State: ANhLgQ1VZMBjbpL/Cd8UwtahM8BEoaFrp48t1cKAwGIkbttdiNPWne6G
 BEMg2b2m35zTfPrxafSYKpWlSpH6
X-Google-Smtp-Source: ADFU+vvwc7ZZX4Hf0V7jwJm1hdyW8wN+2s2AUbaBpJXWj10D0kLU62MU+6Z0rzHvlOwAe0jPxp+BMw==
X-Received: by 2002:adf:f688:: with SMTP id v8mr36392951wrp.344.1585053123707; 
 Tue, 24 Mar 2020 05:32:03 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id k185sm4215029wmb.7.2020.03.24.05.32.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Mar 2020 05:32:03 -0700 (PDT)
From: Johan Jonker <jbx6244@gmail.com>
To: lgirdwood@gmail.com
Subject: [PATCH v2 2/3] dt-bindings: sound: rockchip-spdif: add
 #sound-dai-cells property
Date: Tue, 24 Mar 2020 13:31:54 +0100
Message-Id: <20200324123155.11858-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200324123155.11858-1-jbx6244@gmail.com>
References: <20200324123155.11858-1-jbx6244@gmail.com>
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
index d1c72c8a5..0546fd4cc 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -57,6 +57,9 @@ properties:
       The phandle of the syscon node for the GRF register.
       Required property on RK3288.
 
+  "#sound-dai-cells":
+    const: 0
+
 required:
   - compatible
   - reg
@@ -65,6 +68,7 @@ required:
   - clock-names
   - dmas
   - dma-names
+  - "#sound-dai-cells"
 
 if:
   properties:
@@ -91,4 +95,5 @@ examples:
       clock-names = "mclk", "hclk";
       dmas = <&dmac1_s 8>;
       dma-names = "tx";
+      #sound-dai-cells = <0>;
     };
-- 
2.11.0

