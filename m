Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53007552133
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:37:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC3F228F2;
	Mon, 20 Jun 2022 17:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC3F228F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655739431;
	bh=etcfk4Kx/QJQzeGDxs7CPWKvjQajBK8rPkt5Yw/KTO8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qjrMpLiqr9Xzlau1eEuqdhlWzegX1WKJbuRa+n0iNcUs5WnLCsZVSydT9Ok3zYrWc
	 xWeVmkO40S60SehpqExO4S50vxLKekT5zikiPlfk6DGQ2cvJ9igdb88XMLJl8sexcp
	 hmoosr6cVesh2laB8s7ZfFq0THLQmQJo/Q2xWZ2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3B72F89619;
	Mon, 20 Jun 2022 17:08:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3118F80534; Sat, 18 Jun 2022 14:32:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30D5EF804A9
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 14:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30D5EF804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie
 header.b="WWI5aigp"
Received: by mail-wr1-x436.google.com with SMTP id c21so8820464wrb.1
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 05:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xc3yLaPJl3fJMhU7mLPNTXUDP5YmMspTrPH6skgYH5k=;
 b=WWI5aigpx63NXABwWobIVtxzeWyDWABcTlqhEd7p5galGx1leb4l0QUX6DRW4V7R2/
 7tCNkKvAuMxDi861SOauKvR8OiOrKRFQWKbf/UOyK4ZoNWlOxvSKeVmw3Pjw/ViKSDBb
 bJGQhxOX2sak4JARX2cUY3oHghGpdM5DQO1bngmpG9k9r1Q9YO+8El+G/rDrBCypfz88
 jYj4Hwbu5WXw7XC7sEypXuV849AqQEAwqdgU0LsiCYfp++8WMxNxdrDQLMOhAiSs1NIp
 AxnI+k8juFNCyik85P9Aotl91uS4CXhVavQDoNI3Z5E9qqRGU5RemiTnsiZNhX6+GfbW
 +y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xc3yLaPJl3fJMhU7mLPNTXUDP5YmMspTrPH6skgYH5k=;
 b=WO6UPXr3hiGgzPQziqJ4ZUFihDGjViPhRtTdbTrknBXtbUyiwpVZxv4OJzY9S2j0rI
 Kz9rpepBWOBr3qud8z/JQB7SKJptFMJaE0NvK13KOlxob+dJZrrf4eJ1o3XuL3jFqX6w
 YB/yhpkUKW7aIbkEUiSFsCQ4Qrd2LHTh9k/byYrogXI63fHf8XGFmw6nqtuqYEereSMK
 Qe8NNIkb9AKbaPmK2S8zQSWntvg61nZbfDVjTFKR4NmCiZUvQi0XVa0LKXeGH1CpJ61G
 RkGzcFt3FAs2foTqG8Y47ho5zbmfA98SYxB8GAM1QVPjwQGDQ6SBZljTZUgenL7OfiKp
 fGsQ==
X-Gm-Message-State: AJIora/D5QddrhvUzs+O194hIBOGK4kwx4+jNXcKOetPUvF3OM6QoWKH
 AzpIVyON8fVkpJ6mXwMXklT/jg==
X-Google-Smtp-Source: AGRyM1vjUOgV8azxYb57OQztWrqMQYhc0lprasxXMnlkIZhmfHP3nu/9sasVI2/ycyhjwJt5Z7ma0Q==
X-Received: by 2002:a05:6000:1789:b0:219:2aa8:7159 with SMTP id
 e9-20020a056000178900b002192aa87159mr13617696wrg.474.1655555529797; 
 Sat, 18 Jun 2022 05:32:09 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:32:09 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update spi-{r,
 t}x-bus-width for dwc-ssi
Date: Sat, 18 Jun 2022 13:30:28 +0100
Message-Id: <20220618123035.563070-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:46 +0200
Cc: linux-riscv@lists.infradead.org, Niklas Cassel <niklas.cassel@wdc.com>,
 alsa-devel@alsa-project.org, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, Heng Sia <jee.heng.sia@intel.com>,
 linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 dmaengine@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Dillon Min <dillon.minfei@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
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

From: Conor Dooley <conor.dooley@microchip.com>

snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
this.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index e25d44c218f2..f2b9e3f062cd 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -135,19 +135,41 @@ properties:
       of the designware controller, and the upper limit is also subject to
       controller configuration.
 
-patternProperties:
-  "^.*@[0-9a-f]+$":
-    type: object
-    properties:
-      reg:
-        minimum: 0
-        maximum: 3
-
-      spi-rx-bus-width:
-        const: 1
-
-      spi-tx-bus-width:
-        const: 1
+if:
+  properties:
+    compatible:
+      contains:
+        const: snps,dwc-ssi-1.01a
+
+then:
+  patternProperties:
+    "^.*@[0-9a-f]+$":
+      type: object
+      properties:
+        reg:
+          minimum: 0
+          maximum: 3
+
+        spi-rx-bus-width:
+          const: 4
+
+        spi-tx-bus-width:
+          const: 4
+
+else:
+  patternProperties:
+    "^.*@[0-9a-f]+$":
+      type: object
+      properties:
+        reg:
+          minimum: 0
+          maximum: 3
+
+        spi-rx-bus-width:
+          const: 1
+
+        spi-tx-bus-width:
+          const: 1
 
 unevaluatedProperties: false
 
-- 
2.36.1

