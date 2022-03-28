Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FA34E8BF8
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 04:13:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDF551664;
	Mon, 28 Mar 2022 04:13:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDF551664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648433632;
	bh=iZjhAdUGxgzrQgSAjpa9nlRTRCWTFI/rAdKhQdUdecY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P+sBzWPBoRCCC44MJVmcLtr/C6xtuYuFYGs0OV78xCNUdmaRZmAca4xEVutzk7KOc
	 LR99+RXIvDS6C9vVz84rHNV3O2ltZurzVWSudM2Lgo2MVCYEaF432btAJpnDrvZT93
	 tMUjUN1sd0xnjKR5dqFy/S3KszWSHIC77Cm5wGOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D5D3F804CF;
	Mon, 28 Mar 2022 04:12:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12D64F80271; Mon, 28 Mar 2022 04:12:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58B51F800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 04:12:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58B51F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="at4e3yxg"
Received: by mail-pg1-x544.google.com with SMTP id t13so9871007pgn.8
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 19:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=785BQAgQ/fmXmnK7LN9iPs9KhRHeXeAbtde080rNxiU=;
 b=at4e3yxgx2xDwFHe6ilij5ANvI+EBic1G+1lp3r9Qs2kHPOKb4f/C4U6fyF5mFaH6n
 2ad+n3zjlC9dS+OkzGDJc2Ou0f5vs5uvKK/ExojsgVvf6kpTZGSm0u14n8TEPdEAIL2r
 7mgCXT5dIQfSGQuumy05SWABdMOBhZG/rjt463qSXXWjDccUIU3oBpvEKu9kmthxUUhw
 ByOI5yaMeBwa/C4oKIs5KExpEE580tEh+Ax2EHfEEHQlXm7Vx/E2zKPi57GeFv1oQ5vE
 C39TJqvyYvN43dtgIRHBkaG2/IGw70bj6soTSd/dGk1S2rLjIm8tnjVey14Yel1cRecE
 mvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=785BQAgQ/fmXmnK7LN9iPs9KhRHeXeAbtde080rNxiU=;
 b=R72xg2fn1udAMCMqpcC1Fdm4WDanWFkzOIpFb611ulbiKSyd3VaP3a5SdM0/Nug9sZ
 WCICSUzSMCAe5x4ZCyszNr92nQ5sGlTAPbZFjAr1GSA8Aho4f29sZSLCthqux/KRZSsO
 dZgXQ1d1ThLFoBfwZP9Apk1D/rtjhN06jNWvO+PQ7pQsA0dEUI+vzjCJkczCYyQmpr5z
 RToqBx9wPFmTr+wHnt0B6WCrCRs10ZYpLwic8E/4Pxmfqwmy5Q0jMGIc0dU0QwSgi8gk
 Uc8jOhg4/R/K0oNGhyNK/34Dd3WYBJyI69iZu3t0fvLWv4JLqhositVUy/1jh88HjZXP
 wH0Q==
X-Gm-Message-State: AOAM531ITLw3tSOvayuwDpAKcPq0kSx+cgvgk0pFvdk8LcsS9yGdMHJs
 lQ0/R/FcQ6fGm5r2/4seHd0=
X-Google-Smtp-Source: ABdhPJz3Fmr4nLVOv9MmVn4Rx1d3jkYMkLMxoem6hmY+OZtwNuwPfgPq+/fccaY2ZxV7h8v2raIksA==
X-Received: by 2002:a63:5311:0:b0:373:9fdb:ce03 with SMTP id
 h17-20020a635311000000b003739fdbce03mr8679354pgb.518.1648433533205; 
 Sun, 27 Mar 2022 19:12:13 -0700 (PDT)
Received: from localhost.localdomain ([211.212.143.131])
 by smtp.gmail.com with ESMTPSA id
 c63-20020a624e42000000b004fa9ee41b7bsm13322058pfb.217.2022.03.27.19.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 19:12:13 -0700 (PDT)
From: Steve Lee <steve.lee.analog@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ryans.lee@maximintegrated.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [V3 2/2] ASoC: dt-bindings: max98390: add reset gpio bindings
Date: Mon, 28 Mar 2022 11:11:39 +0900
Message-Id: <20220328021139.8700-2-steve.lee.analog@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220328021139.8700-1-steve.lee.analog@gmail.com>
References: <20220328021139.8700-1-steve.lee.analog@gmail.com>
Cc: Steve Lee <steve.lee.analog@gmail.com>, krzk@kernel.org, nuno.sa@analog.com
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

This adds support for the reset gpio binding.

Signed-off-by: Steve Lee <steve.lee.analog@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/maxim,max98390.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/maxim,max98390.yaml b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
index fea9a1b6619a..deaa6886c42f 100644
--- a/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
+++ b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
@@ -29,6 +29,9 @@ properties:
     minimum: 1
     maximum: 8388607
 
+  reset-gpios:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -37,6 +40,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     i2c {
       #address-cells = <1>;
       #size-cells = <0>;
@@ -45,5 +49,6 @@ examples:
         reg = <0x38>;
         maxim,temperature_calib = <1024>;
         maxim,r0_calib = <100232>;
+        reset-gpios = <&gpio 9 GPIO_ACTIVE_LOW>;
       };
     };
-- 
2.17.1

