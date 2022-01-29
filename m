Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D16C4A2F64
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 13:25:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B04311773;
	Sat, 29 Jan 2022 13:24:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B04311773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643459147;
	bh=9veOrnylV7/CQ2c3bmflGf77LZJCulezMAwwlg2+Yac=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=atFl6I/SCBASjmwDI47jpHl9u54UVuDtpI/EkWsRTsdlPgKczHtBxR41O0uvYYPVT
	 3Set2N8usEy25lkoPc6nOo7vJWxv6XmQdhBTEFBcqE0gkSqD4rG2KN7a5uduqjTjGA
	 TAX+olcXgyxgmMDCARR4uDZCSrvg2PYqlC1XJg04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F552F8025B;
	Sat, 29 Jan 2022 13:24:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D374EF8023A; Sat, 29 Jan 2022 13:24:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAFA8F8014B
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 13:24:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAFA8F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="upfxwh5g"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C231E3FE09
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 12:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643459042;
 bh=Xin2bUCV5GBX+4IaAK+yFj1wjm1SLWxA3e09mShlOR4=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=upfxwh5gSrgAt6Iow7u6hc274z6e9RAsI0wWWfj3AZ3D2/5xyxVKl8qjuUBxGhnVX
 NYzCZ0q9hftiCmT1cY2zPUM3fWoyDsFvy2TGvjszqyr8zaM6ru8cN/PHrBOpPp5y6S
 8eiY7WqYCJGr3bsQrYKdxqX72WSj07CXUDGJsrn9eoQRpe//wSVDNwk3u6u54JewvT
 LQgLSXV+2S+no9rDT18Vlq+WkvtArUfavwl3U5K4K8z8Q4DXpT+0skvNcmIzxC9wNT
 hO2yi4bG74+E34IIM41tJUBF9/ycK4HY/1y4C+mHHjb6xjvIpXEUHOcclYysSAFx2j
 3jv5qxnqMwroQ==
Received: by mail-wm1-f71.google.com with SMTP id
 f7-20020a1cc907000000b0034b63f314ccso4217690wmb.6
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 04:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xin2bUCV5GBX+4IaAK+yFj1wjm1SLWxA3e09mShlOR4=;
 b=pKvVrhaZ8+ripOGbLqsedFW/ZFWlDCtpqWw1A7Y2lUcKRzrFKxom+MHWzsiKNckWb9
 9SHA/DD9QLzthDWlvmxqAAshBGzKd4lqV7qJhCkncdDNGkWvtOldzpVJNH6RjxrcldaT
 yIcXeqwqjp4PD8nz7P7CZ+ogUh+LefOqtgyOdS7/UpERQu6u9XwJQmR7lSNIMqxv70Ng
 LaUxVMS+HpVlW3DFvXfpAZeQdpxi63SJPO96DFHV/x3jQpsngvHfA1WW2FTO+V6VPwF6
 JtColLQpw2q/WR4gBoNDlOsziQq8BeH1EJAVQB3gD6cZh8ai6p/158JALoVvaA+UNE3f
 zD8g==
X-Gm-Message-State: AOAM5326bjlOkeX3V/3NqA8pe1i0Kf/CiH8G4pleY+gijjKeZgTqYPAW
 +t/q/s5XfCUEwwa8w07kZRyW48wAYZchasr5K49+LcWt9PzEaaVwwFFStbIbWW4Sj0TyrgDY+dX
 72qmQP59kXDJJ4j68AVDrKLMsOxgy7atUAlOlXTfe
X-Received: by 2002:a05:600c:20a:: with SMTP id
 10mr20148993wmi.19.1643459040703; 
 Sat, 29 Jan 2022 04:24:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzX2X5P3axlQ5WI/mG6GqvwXYyv9cpxowJ11N6MeS+DE60iDMwN+meIUmiOJBb6d5n8wE5K5A==
X-Received: by 2002:a05:600c:20a:: with SMTP id
 10mr20148982wmi.19.1643459040514; 
 Sat, 29 Jan 2022 04:24:00 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id z13sm7901534wrm.90.2022.01.29.04.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 04:23:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] ASoC: dt-bindings: samsung,
 aries-wm8994: require sound-dai property
Date: Sat, 29 Jan 2022 13:23:52 +0100
Message-Id: <20220129122357.45545-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220129122357.45545-1-krzysztof.kozlowski@canonical.com>
References: <20220129122357.45545-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The cpu and codec nodes must provide sound-dai property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/sound/samsung,aries-wm8994.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
index 4ffa275b3c49..97f83eeaf091 100644
--- a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
@@ -30,6 +30,8 @@ properties:
         description: |
           phandles to the I2S controller and bluetooth codec,
           in that order
+    required:
+      - sound-dai
 
   codec:
     type: object
@@ -37,6 +39,8 @@ properties:
       sound-dai:
         maxItems: 1
         description: phandle to the WM8994 CODEC
+    required:
+      - sound-dai
 
   samsung,audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-- 
2.32.0

