Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC4B9ECB47
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:33:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF01121B6;
	Wed, 11 Dec 2024 12:33:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF01121B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916800;
	bh=jlwgcsx3LUvZUCXYVhjc8Lyua4wYz+90XYYggB1WV0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=erXTZsnJa3EatuNKQZkiT3OITZDMgBkqdw0riOpZLgCTJe0mYkaCXdPf7Obubmnzt
	 Po2L+PxLL4G98nIMh/7nYTczUSm4jyC3ynv1a8BoxEq+bMnn493ODxNKf9FvWa6ESX
	 2f4cocSLgaIAWTpehE3KyNhGmy69uSfQkdPR6c4Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAC0AF89713; Wed, 11 Dec 2024 12:28:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64504F8970E;
	Wed, 11 Dec 2024 12:28:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5F35F80448; Tue, 10 Dec 2024 18:11:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D037F805AA
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D037F805AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=Y7dXt704
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5d122cf8e52so9171512a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850650; x=1734455450;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMj/2kdBQwniGBjdZnm5DjNL0YdrCH1deyApmD3I+y8=;
        b=Y7dXt704h/TmgS37+s7c9NyGXARrnxaGfpaWOsGF+WLOjXZxcXk8/NsHDfzWHDl+uk
         mT/vrGRRIhg2Im+erYuYs9S4Uz/S2OmM7jNykDMh9wY+yU+ixjNqCeKtj2XUSPWSDUKT
         5m/sqhWm33fmw/dVJoaaDQqmWGTl/szATad9n7o+bHvwZ9HNKvrBEgNkx2j3rODBG8cU
         /FDK7wiuCfwCv/1L6PMAJeLazL2oJCbqFoUdwKETLmGuclW1vGv7KRPf6525iE8Y/O3t
         vvkNNYhihnUO+Dx+uJzXcky3rw+4CK3dRT6uJ0RHo3jFr9Z4vOtO3Mt7Pho94Yoz/5q8
         Ekhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850650; x=1734455450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMj/2kdBQwniGBjdZnm5DjNL0YdrCH1deyApmD3I+y8=;
        b=EZU9P8KJzaAL4l4t5rovKGoxitMKGzh8qXDQ452s5f34BRDTOZAX+mld29U/EQuwvj
         2dHnDVJS/OPyYHDsNVit7c7Hm5s7Px7jGE+x/Sm360KsESpM5dsEGL0+G09aJ2Ideyi/
         4HftsACCPR//Y4oLXL0B+s+dheNRqGQzGYPuANCgwz4YX430ZizBwjnWCP1C2u31fgMl
         aHsyupn1RWaJUgPWsbkXtL0uDmEJjTE7634LhpF36mW6PfRQ/F0ml3oFqMIWzjwkSgDy
         H2BTaEVCliSvVbFus9Vlf7MfCY4zb7B0NnDyYp+VF31cMhikzjk3idXt4BvwBYMytTVE
         2sZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzCxY3Yf06MlnIwQPaBrk12OWxA0Lsq4Bl6wOo3RWk5fzFpTmXxeDyT810ZFM6zuhhNwUEb8ini6si@alsa-project.org
X-Gm-Message-State: AOJu0Yynmh4qL0xa+OXMvdKQsiKnoHlUabrNvGFgELCrktG4DrHgFO6L
	l3S0jxGb2OhMt2VfBtsKZJhswsixNvUXmQjvOmE5MnjSqWtmcDgMBuZr6X+JrvU=
X-Gm-Gg: ASbGncv02qwg7kQbjRGzmLPIo+NWbO7t7vHIpI0FJAfSD6JhVAOwOuHkPtqEYESEbJZ
	Y5QjQJfH+pqXuDaZHQn8epVtGpEkNGygPKBgEMqDaTkB+3WWd7tEFr57D6hqe43/wl1U4FDkd3i
	6eLaecrzVZzM0sycYGRyk2uJML4+PGowi66NtBDZrRCZLPtuDJsYXxeufPSolbgp7lQ343exSfn
	gFKUMaPdIpS02csUc+MLVy2QwK2rF3DGUR9MTQNlLnxbka3g1d2V0m/X6Mn6+V7BbbTSErkdkkF
	5U4z4rKk
X-Google-Smtp-Source: 
 AGHT+IFXUw5ybDLD5qa89ZofGoIXkdy91MQ4lgB9QjSQ6ZzxsKHCx4/ijSbtTty6jRiH6OvTPqEZrg==
X-Received: by 2002:a05:6402:2691:b0:5d0:8f1c:8b94 with SMTP id
 4fb4d7f45d1cf-5d418534c20mr6265042a12.13.1733850649565;
        Tue, 10 Dec 2024 09:10:49 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:48 -0800 (PST)
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
Subject: [PATCH v4 19/24] ASoC: dt-bindings: renesas,rz-ssi: Document the
 Renesas RZ/G3S SoC
Date: Tue, 10 Dec 2024 19:09:48 +0200
Message-Id: <20241210170953.2936724-20-claudiu.beznea.uj@bp.renesas.com>
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
Message-ID-Hash: 52HUYQHWXOEJQEYELVIKKYMCUECFYP6C
X-Message-ID-Hash: 52HUYQHWXOEJQEYELVIKKYMCUECFYP6C
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/52HUYQHWXOEJQEYELVIKKYMCUECFYP6C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The SSI IP variant present on the Renesas RZ/G3S SoC is similar to the
one found on the Renesas RZ/G2{UL, L, LC} SoCs. Add documentation for
it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index 5b42eec864f8..e4cdbf2202b9 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -19,6 +19,7 @@ properties:
           - renesas,r9a07g043-ssi  # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-ssi  # RZ/G2{L,LC}
           - renesas,r9a07g054-ssi  # RZ/V2L
+          - renesas,r9a08g045-ssi  # RZ/G3S
       - const: renesas,rz-ssi
 
   reg:
-- 
2.39.2

