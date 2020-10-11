Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9E228AA5F
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Oct 2020 22:28:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FFEF167D;
	Sun, 11 Oct 2020 22:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FFEF167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602448111;
	bh=BewnauDF/pdfaMjQKVYly+KokETkb3wOlXv4OXrcmmA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZZNJ4QBlyH3ByNWirOEPoPmkMSgXsgYozlrjL9dWgulQA0SJ24eHgkHDT1WVGgf5V
	 JxWerVVvlhJPwV4G4rAxG6rizc+Ko3ACxz9ml/+fSMzpiSBfy1UK3goG46MY4o7+DI
	 FLA7pXqoREmWEb9rVMX0xktiATrRL6uGo+4PAjs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D621F802F8;
	Sun, 11 Oct 2020 22:23:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40132F802C3; Sun, 11 Oct 2020 22:23:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 110CBF802A2
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 22:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 110CBF802A2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="f3tVxWzu"
Received: by mail-qk1-x743.google.com with SMTP id q63so16070154qkf.3
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 13:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oVJ/FVhCtH2Sw1ZFhzCNscPSk9Fte7d6nvWFGpvDBLs=;
 b=f3tVxWzuTZPM69wGJy32/sd4H9TTipQy1StiEG6HQgLlulOLuyLEVUcmr8ttGqLIYt
 IKGsj7o92pXBr1lHUWODiBZ0fw9P54JZbaB2fpfL3nOohglPuk6UgqUJfT8zUWl1ZgVZ
 0DWWaC/1eZD1zFUZprA7ZXOPpCiLLkpXleeEgnqwxuJrP4U6BU+q/1eUiZb2Z0ulwXN/
 vKxWNPAcCCIr9NJx1zhbvb9DYKhuhTwW5kQSUDlRjNh+Q2b5wvUYyQbdhSnFIJTHGieF
 MpM1XV6VLHyquwy/vmb9k6LuulmBvxUbGkeqYxk2YdLE0qfQaQCwMqdry1vAZ1VPDbFg
 hXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oVJ/FVhCtH2Sw1ZFhzCNscPSk9Fte7d6nvWFGpvDBLs=;
 b=S6hCDxOvYV1ypDchEIGAdnHUUmFcO6wR5Y3pL8dr0m/DnXHJONmPQVkjRgE+5xJlqY
 96RGu0WD3/UyAzESi1aVy0Qy+b4H6IIx5kBh9f6Ag5iNPYltpQOqUw+C99CMvt+7tcdJ
 HAoTKurQwktSA0P567CFYP8Cn/TlHl+vZeNiCJPPcmj8C21qokev0aI1ibNurqhoFN9X
 8cNpEuKgYPemMmxRiiS7wKVmstLkD5I+ddhDnXRT6nHLqMYbgAIqlPR/ZkoAjtawdMOx
 1kyAtNYWrEVjj5Zr3qXCjY40iLi6JTR2VnjarQozzSB8t5CG0BjGs9H9P/9fAfm/fhXC
 D1RA==
X-Gm-Message-State: AOAM533w29Kx1u0MQa6zkOQpV0i/a0eZB11qMCSSFHycDLkK9K4H4R9h
 ggTRUBqSiVR5nHIh3ig8yQ4=
X-Google-Smtp-Source: ABdhPJzHlhqV1xCQ0Op9gkdvmwU8yERM86DpAL4NgRdRLBxtYG5F0hRVc5gwImajV4zjbtoH3PUeCg==
X-Received: by 2002:a37:a2cd:: with SMTP id l196mr6644348qke.201.1602447778306; 
 Sun, 11 Oct 2020 13:22:58 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id c72sm2987778qkg.56.2020.10.11.13.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 13:22:57 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v7 09/14] dt-bindings: ASoC: sun4i-i2s: Add H6 compatible
Date: Sun, 11 Oct 2020 22:22:19 +0200
Message-Id: <20201011202224.47544-10-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201011202224.47544-1-peron.clem@gmail.com>
References: <20201011202224.47544-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
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

From: Jernej Skrabec <jernej.skrabec@siol.net>

H6 I2S is very similar to H3, except that it supports up to 16 channels
and thus few registers have fields on different position.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
index 112ae00d63c1..606ad2d884a8 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -24,6 +24,7 @@ properties:
       - items:
           - const: allwinner,sun50i-a64-i2s
           - const: allwinner,sun8i-h3-i2s
+      - const: allwinner,sun50i-h6-i2s
 
   reg:
     maxItems: 1
@@ -59,6 +60,7 @@ allOf:
               - allwinner,sun8i-a83t-i2s
               - allwinner,sun8i-h3-i2s
               - allwinner,sun50i-a64-codec-i2s
+              - allwinner,sun50i-h6-i2s
 
     then:
       required:
-- 
2.25.1

