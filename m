Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6739A610E9B
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 12:35:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B325827FC;
	Fri, 28 Oct 2022 12:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B325827FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666953352;
	bh=cp1ySFQ9b/kESTiD4ZqENiQzCNBGsyLOszG23ysuIrg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I/nnSyUrKT5keNeF4KlLXmXivyB51H0h74H3J/BRfG4JpxchIsexnNWqnmyWmAcce
	 YqKt2cOtE2agtIzj/aRPbnk5q8zs6QxJXY5rkarbC0+yvWpIAKVLUmJSxMb2ZZkXby
	 SyB04WFkY6cetbSKVE/fCEy5S/rKCgZ4FwgQYJT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1DD6F80553;
	Fri, 28 Oct 2022 12:34:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E55B7F80095; Fri, 28 Oct 2022 12:34:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B8C6F80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 12:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B8C6F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nW7fKiq0"
Received: by mail-wr1-x42c.google.com with SMTP id bk15so6001925wrb.13
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 03:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iza2TaCkyzr/G3RQNexbZUSAsDCgwwO2VTwP3e6lVI8=;
 b=nW7fKiq0XchkjTwPif5/83pUEVQb8//GqUC5uhhUirUS6EJZuSMdXSHs6nLBgLTQaH
 RP+PV2sgBThhpc6tpxzcCKQDMB1ZWkJZWE7Yty8YssrnqRAcnAN8HMP7xGycQLjNhCVf
 Ii7EpJkfEE6yRF+jRooqGofJQ5AtBTSTL2Jg4RuipYp313d7aOp+Urtv0Wzzc5sNgVXn
 RZ+aF+vagSFcIDQEoGudviHGjkMTRfdxhJebL6KGym/eube2RhT+KuCqWlNO5rvm9q8S
 8ZA7lvHm3ny9+M75y0T++kY9JeGTEh7Pbtoy/f390PL2DHxJTLL4owiGBWD9UjIeOSJ2
 ryVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iza2TaCkyzr/G3RQNexbZUSAsDCgwwO2VTwP3e6lVI8=;
 b=vbbYNClDTbysLAbtBWUX8kqNc++lQta/KVGDmh5+pIOoUpGSyTZHTVp9JQ8SnEd6yK
 /U2Xls3tSxwNmA+TXkqRU0qVZhh+J1jAWQrI1KaO8+YES2UoSJEz/DuZ05iSkvp+gPsA
 4q8Zlx1FkKjTN4BNv/jwZwyBqM68fFHWM5+74+koLknrbjyBIJos5VipiFhumMNn0nzz
 MhnTGcqBsqNqieBsLVDN6IcI7+SiVJOfQyEuo0fjSVHyA2DPFpGz05vRj06hmrIcwCnJ
 1a1Xw31Orytd/bNGSvlW2PWCFsoko0FxXkGtXTQF2uoFboPr9qol8r4wkm+gbe29Bpvn
 RMJg==
X-Gm-Message-State: ACrzQf2ywi8YbScCFaQwmhT9JDUfUOEFCkj0Jq0q5jaSmwjyAEjO5CFL
 12eosD37N+QpSUeKgqvwnq8=
X-Google-Smtp-Source: AMsMyM425b/N+g0Scv97lzZADj+stoYPE2Y6WXtnG+yIdY7m3olUmFU1QKZn1pPXOVtl9M455zj45w==
X-Received: by 2002:a05:6000:144f:b0:231:2053:ef7c with SMTP id
 v15-20020a056000144f00b002312053ef7cmr34870075wrx.179.1666953266605; 
 Fri, 28 Oct 2022 03:34:26 -0700 (PDT)
Received: from localhost (94.197.40.204.threembb.co.uk. [94.197.40.204])
 by smtp.gmail.com with ESMTPSA id
 e8-20020adffd08000000b0022e653f5abbsm3300645wrr.69.2022.10.28.03.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 03:34:26 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 tsbogend@alpha.franken.de, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v1 1/3] dt-bindings: ingenic,
 aic: Remove unnecessary clocks from schema
Date: Fri, 28 Oct 2022 11:34:16 +0100
Message-Id: <20221028103418.17578-2-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221028103418.17578-1-aidanmacdonald.0x0@gmail.com>
References: <20221028103418.17578-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
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

The AIC needs only the first two clocks: "aic" is a gate that's used
for gating the I2S controller when it's suspended, and "i2s" is the
system clock, from which the bit and frame clocks are derived. Both
clocks are therefore reasonably part of the AIC and should be passed
to the OS.

But the "ext" and "pll half" clocks are a little more questionable.
It appears these bindings were introduced when the schema was first
converted to YAML, but weren't present in the original .txt binding.
They are intended to be the possible parent clocks of "i2s".

The JZ4770 actually has three parents for its "i2s" clock, named
"ext", "pll0", and "pll1" in the Linux driver. The JZ4780 has two
parents but it doesn't have a "pll half" clock, instead it has an
"i2s_pll" clock which behaves much differently to the actual
"pll half" clock found on the JZ4740 & JZ4760. And there are other
Ingenic SoCs that share the JZ4780's clock layout, eg, the X1000.

Therefore, the bindings aren't really adequate for the JZ4770 and
a bit misleading for the JZ4780. Either we should fix the bindings,
or remove them entirely.

This patch opts to remove the bindings. There is a good case to be
made that "ext" and "pll half" don't belong here because they aren't
directly used by the AIC. They are only used to set the parent of
the "i2s" clock; they have no other effect on the AIC.

A good way to think of it is in terms of how the AIC constrains
clocks. The AIC can only generate the bit & frame clocks from the
system clock in certain ratios. Setting the sample rate effectively
constrains the frame clock, which, because of the clock dividers
controlled by the AIC, translates to constraints on the "i2s" clock.
Nothing in the AIC imposes a direct constraint on the parents of
the "i2s" clock, and the AIC does not need to enable or disable
the parents directly, so in principle the AIC doesn't need to be
aware of the parent clocks at all.

The choice of parent clock is still important, but the AIC doesn't
have enough information to apply such constraints itself. The sound
card does have that information because it knows how the AIC is
connected to other components. We need to use other DT mechanisms
to communicate those constraints at the sound card level, instead
of passing the clocks through to the AIC, and inventing ad-hoc ways
to plumb the constraints around behind the scenes.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 .../devicetree/bindings/sound/ingenic,aic.yaml         | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
index d607325f2f15..c4f9b3c2bde5 100644
--- a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
+++ b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
@@ -37,15 +37,11 @@ properties:
     items:
       - description: AIC clock
       - description: I2S clock
-      - description: EXT clock
-      - description: PLL/2 clock
 
   clock-names:
     items:
       - const: aic
       - const: i2s
-      - const: ext
-      - const: pll half
 
   dmas:
     items:
@@ -82,10 +78,8 @@ examples:
       interrupts = <18>;
 
       clocks = <&cgu JZ4740_CLK_AIC>,
-               <&cgu JZ4740_CLK_I2S>,
-               <&cgu JZ4740_CLK_EXT>,
-               <&cgu JZ4740_CLK_PLL_HALF>;
-      clock-names = "aic", "i2s", "ext", "pll half";
+               <&cgu JZ4740_CLK_I2S>;
+      clock-names = "aic", "i2s";
 
       dmas = <&dmac 25 0xffffffff>, <&dmac 24 0xffffffff>;
       dma-names = "rx", "tx";
-- 
2.38.1

