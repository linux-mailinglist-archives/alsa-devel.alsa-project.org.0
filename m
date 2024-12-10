Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C429ECB29
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:28:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD51C2356;
	Wed, 11 Dec 2024 12:28:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD51C2356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916512;
	bh=28M0DwDkMWfh/cCYd77FlED8MgZgXdkVNsI9ruq8oCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QDVqQIE8qPU93lXF9UR7+x3eLQ6HO4L7AtKATTsbb+GCCxzU3m58JQ/P6pqb9THgF
	 oX3G6d4aIg8MQvlRq7NBo+eFReZFnP+LbGbIeVFPZUOG/7wM+NdUQWN6w4vEKWfaVk
	 kU8AZKpRJoLsjfFT1jJ0YMhjQydho3uYoMs8mqP8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2AC6F80631; Wed, 11 Dec 2024 12:27:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58A9DF80632;
	Wed, 11 Dec 2024 12:27:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47C2FF805AB; Tue, 10 Dec 2024 18:11:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E762F800E9
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E762F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=Pcq1iHfv
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5d3d143376dso5626696a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850609; x=1734455409;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehtFOxPVmrl0HXvdtrtv9cXQJbKgItgUhCJ0+pIiLcI=;
        b=Pcq1iHfv8XpFIT7uoN4qS/zGi327csrFJh/e6ipGofw5ndXi9re3o8m2POg2A0jbGM
         kg9LhArnov2sCiqdJWmihpJYVG6w5MqX1io64xdVAwmQWfemEFgFZLcV7zqJA3sQckBQ
         OWh8zEfkDvuOdiGkntugRuUljQGn8lYfORtYoGpYLNElnOwwoFMWfUBD7r9IAbCWHnB8
         /VauLrTjhf2BtuqbYLozakSpNulT1OvLJttZVQweU/lihLLeZKHtElGzmRJzxjjbiZKf
         pn3ZU72d2SkWXGNbvsJbEGLVBR7ygyPZOzbjeC+zO405gKRtByrCAVBa3irEyQmmTzb9
         6ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850609; x=1734455409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehtFOxPVmrl0HXvdtrtv9cXQJbKgItgUhCJ0+pIiLcI=;
        b=bjcdyGBp8Pxau1FvXKOhBVdrUHvPwDhhF//dm+mc10Fr6JaQTA0IZCbq7CYAx4nbaz
         G1HEZ6ROdVQY2PngfeP/Nk+gYmt7nVaXDhA/D9N1/rGzXfREoo1k55rnybST2SIXCM1l
         7ljJ6ktSMzYD6UP9seXg3kr3UWDY96PHtufJeJZmK73BcWBQWtGjDlF9Ec2Aa9+J92A9
         QL2GM+FwKDu+Ij06SI0Y0i/HaF1/3Gbr40vhl3VfW7dqD9temBuPKYWT4Dsykx0NpoBb
         wgg3UxMQkctZRufJvzBS1C9HgstuDzYKfOStsDZQD5mCNAueULa+9gB/siYC7PSRgI8C
         Tgow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXaN2RaikoGer1UGV/lnRgqINj8yyCdb6yW4tNMyjnHzNaG6JbHVT4iPYPGSYkIb+rRAFX/p2GFH0B@alsa-project.org
X-Gm-Message-State: AOJu0Yx1xFEHkY+3ieIXHk2rjYEmjm0XuC6Wrbp3Wt0jqlB1jpW4U8Nn
	57H9/A5TTtPzfgaY7QuqHZPav9vHGCFarIIKPXECYqBxC83TX0fG7xbJNk1Xf9Q=
X-Gm-Gg: ASbGnctuKGpZ8WygVk6C4kPhlQka9UaUFzKLPbPXlUixWRvXaGk7CuZkP8nyBd6ft/h
	eBNtwegQKh/9jfcgJFS7QX1lwzLXj1fxbAEw9bLnwvTxizzmqcUYEvXZH9eOtEGS6ZEmezRaFxt
	bmQYq8XVs9e6nkera4blcb2Di+ZKSXBxngTOFvphtfFIvJvKMPHrk+QeWFpxiXOawCJIZAi1/eN
	rO2IIXIQrzag6fC5MIz1rd7CCZqyzK9d3g8Kx2l+HyR6qkNWXP+ci1Ot5R+71WVZpZrUO5LHLHP
	MDpkm9lC
X-Google-Smtp-Source: 
 AGHT+IFmnNKXXAN067E1UbwhBJfMpK5O10AWTX9+hlwh80SSPAEOWU+7C2pI3MGNxXbuHtb4mGyh4w==
X-Received: by 2002:a05:6402:1ed6:b0:5d1:3da:e6c with SMTP id
 4fb4d7f45d1cf-5d41853e70cmr5928380a12.10.1733850609561;
        Tue, 10 Dec 2024 09:10:09 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:09 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 02/24] dt-bindings: clock: versaclock3: Document 5L35023
 Versa3 clock generator
Date: Tue, 10 Dec 2024 19:09:31 +0200
Message-Id: <20241210170953.2936724-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: claudiu.beznea@tuxon.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: T7RNLITIGBTJH6PAKU5RADW75VFZT4Z5
X-Message-ID-Hash: T7RNLITIGBTJH6PAKU5RADW75VFZT4Z5
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:07 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T7RNLITIGBTJH6PAKU5RADW75VFZT4Z5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There are some differences b/w 5L35023 and 5P35023 Versa3 clock
generator variants but the same driver could be used with minimal
adjustments. The identified differences are PLL2 Fvco, the clock sel
bit for SE2 clock and different default values for some registers.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- collected tags

Changes in v2:
- collected tags

 Documentation/devicetree/bindings/clock/renesas,5p35023.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
index 42b6f80613f3..162d38035188 100644
--- a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
@@ -31,6 +31,7 @@ description: |
 properties:
   compatible:
     enum:
+      - renesas,5l35023
       - renesas,5p35023
 
   reg:
-- 
2.39.2

