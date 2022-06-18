Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C73455213F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:37:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2814A2901;
	Mon, 20 Jun 2022 17:36:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2814A2901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655739462;
	bh=k/lRa8XTNrnrcSBxrKngX1ghLIEFySQ4wrer/gxuxiQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D7cs/XB0qtfBdAMz4dGux4PjHhOFPOBaeF0ZYkRSFmZ73nYxeOeE6jUtPGcmZVaak
	 2gVTq/KJMiuVShWjMs9GnxEtPSaJKgHzBzVdwyxgBY7CsJKajT2v+snk9BxbL07+0L
	 tdsHJFgjffs1tlHNow6M5SajT/9HSRWokwmL1SRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10B91F89626;
	Mon, 20 Jun 2022 17:08:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46593F80533; Sat, 18 Jun 2022 14:32:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95B5DF800C7
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 14:32:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95B5DF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie
 header.b="NLP+j4Vv"
Received: by mail-wr1-x42a.google.com with SMTP id g4so8781944wrh.11
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wA+ekkpjde0Zx9cXanks0YsUmdtDvWig/ia7r5xRwsg=;
 b=NLP+j4VvWO4pMdDxz+jP2qakHnxjIhWDW5IcIZ6iTjVuR6PvXGlfRvScvAs6fv4LGC
 tVHzVYgFUHCv1IRJ4Ht4KdNVLD+jSSS5h4H+avCrhP5W5KXZfsniSNzQaIy0Vmjf7cJe
 1JtCXoeodTgNGx3zxBouJNSTU+BRjTFYSAg0N4jBQrfeC5wyTPkZscKwWYLFzG+dbNUH
 VQDUJvWUJkk/fS8UHWuapx2oX/lVLREXGX91trMzLN+PvRD1VA55gaBikAJhJXd6EtNJ
 TXtuW3AI8LcIC7NdxtxNMfIR5WAfMQnhkZScOGuGAVa6FafYwFTfgLXwxWgUJlRmcjG8
 FuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wA+ekkpjde0Zx9cXanks0YsUmdtDvWig/ia7r5xRwsg=;
 b=Xew3Wh6vQFGHUXkZqkQfWI02hLtkv8HQAid3ZWQBHRAVHwf2NBM5NPxi3LKnxA1CoS
 2dxFv0c+Vl3NzuLmpYaZGCx1SXM78LR0/5jXY2Ztc+AZ/Gj6UntFCgX2zO5xo+p7ca2F
 +Y//c3qKfjS410dc8GBml4M9FhTuq9ks5XsEh7IhePQycCrDW2R2rFXRCx/wb/8XuCyU
 cFabk63MZw44GcxSQJgpGh1r35u/aJaPT2l4+9YduKXj0+vkeu2SpsAs99zzTRomanNR
 bNLUYnhUxb6wQZrNBe24ahoGlyCHaLKM7RiNN2mgH1CYTqNQ0nyGsQTgW7FfsiFM4Lhi
 MAjQ==
X-Gm-Message-State: AJIora9luTfnvOb2RrbSlXrJwE+2GhNXbrG28zC0HKdUCWawgYjUeyAd
 vzyM7dsoMq6rUlfprLjFQIshvg==
X-Google-Smtp-Source: AGRyM1uabX5izdogY/5f2icOXRBDHwfiqcRqU22eeMbzZR7yfphBy2Stjoi6dvehhY38C8EymhY+dA==
X-Received: by 2002:adf:ef52:0:b0:21b:81e8:5d0b with SMTP id
 c18-20020adfef52000000b0021b81e85d0bmr6154762wrp.502.1655555522853; 
 Sat, 18 Jun 2022 05:32:02 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:32:02 -0700 (PDT)
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
Subject: [PATCH 02/14] dt-bindings: display: panel: allow ilitek,
 ili9341 in isolation
Date: Sat, 18 Jun 2022 13:30:24 +0100
Message-Id: <20220618123035.563070-3-mail@conchuod.ie>
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

The dt-binding for the ilitek,ili9341 does not allow it to be used as a
compatible in isolation. This generates a warning for the Canaan kd233
devicetree:
arch/riscv/boot/dts/canaan/canaan_kd233.dtb: panel@0: compatible:0: 'ilitek,ili9341' is not one of ['st,sf-tc240t-9370-t']
        From schema: Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
arch/riscv/boot/dts/canaan/canaan_kd233.dtb: panel@0: compatible: ['ilitek,ili9341'] is too short
        From schema: Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
Allow ilitek,ili9341 to be selected in isolation.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/display/panel/ilitek,ili9341.yaml     | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
index 94ca92878434..c402bedaa37a 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -19,12 +19,14 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          # ili9341 240*320 Color on stm32f429-disco board
-          - st,sf-tc240t-9370-t
-          - adafruit,yx240qv29
-      - const: ilitek,ili9341
+    oneOf:
+      - items:
+          - const: ilitek,ili9341
+      - items:
+          - enum:
+              - st,sf-tc240t-9370-t
+              - adafruit,yx240qv29
+          - const: ilitek,ili9341
 
   reg: true
 
-- 
2.36.1

