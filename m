Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9799ECB2A
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:28:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AA722971;
	Wed, 11 Dec 2024 12:28:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AA722971
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916530;
	bh=OTYVPrJXZsCibJypCZf8QK2KZMdsmtd9T0kWyznh0q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QB3JoSiL07Hd0zV8y4AVZwHu6htaSM4DNLkWK15Jm9Q+yx22gNVsCqCsuD9T+nwNH
	 Ew4HCunhyBR1Cp8i/3/xDM4OEM/PMNloK3Gp4JEF+AkcLrlVt0WjMwRr3qJwK9ue9j
	 OPQDsWdHW3T79x4Un2SwOaWWPlENPxrr7NWKHxdY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE6B0F80676; Wed, 11 Dec 2024 12:27:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D548DF8064F;
	Wed, 11 Dec 2024 12:27:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9ADE7F80518; Tue, 10 Dec 2024 18:11:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED599F8016C
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED599F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=NkLF3wmJ
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5d122cf8e52so9170535a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850613; x=1734455413;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4VjqX7iwW/vu6N1WvzJJpy4sCnLnXPgQs452O7qiog=;
        b=NkLF3wmJqyIT4c5MJ85QsPRVY7B4sIOs6yQk9H9x+QkBo4EqDpwiIZRnZSy6Ez0tcC
         GpM1LyrzIVquBQlFMTiQPpvRtOgHLhHqZUAi0wM8zZ7YRv/edA1aD7ANqwrYzOKGDIBw
         dJvLW6H5lq32Jg/ksHIKW4veFsLY/Oo8oOXySBNzsKSeVwKb27DFOrlzNZnUQI9Z3tfJ
         lnOllRgI5dZ/XzrvueuhS34uKI7KakjBN3S41HVVhQoON6gaNu+etCbZAZ8vn631FaTv
         7RKJDYnpxvjujnKFR8/JdyTOXwoo4mTUTKWfrWsqBq4JuQ9zC/08+YnbEm5rop5cAHBD
         gAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850613; x=1734455413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4VjqX7iwW/vu6N1WvzJJpy4sCnLnXPgQs452O7qiog=;
        b=HFnCDo5+Ng7tr4x8HTEdoQirAZhVtsJ5zusv61mNsSkXIweMkdBYO92EHQFq2cmtw8
         510k/9mqtru7/vQ9+hrOWSDTLkJutcr98oxGP59r+VtrgWiusady25DzR0ygLNi1Tfx6
         d9mWOWfOxsIELFzLBqC0nZBLM6mvtIJntiJfa3EVQvWDDOyHy+Ks4xScbcD/Rdz4N0WH
         OeaJQ+lGU1a4CqG5bwwehov67yjF4Ym6ufReZWe9Wo3unKVVjG9vKvFtRvuz5aQVp9po
         OX+SiwK80YQ1Xr4Rp/F7ExgPuImzhTxhCimZAadOPcW1wN5hLr9IjMzu+zddgh3OFry3
         30QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtpLXDduENOhe8v9oOlBeEL/ij64ZaccQ/q7qCQqG5iLvDyDlpakiWQQPyLp3E3AK3Hw7MjQ6paqhU@alsa-project.org
X-Gm-Message-State: AOJu0YzxsR+ouZhWAh/RdSMAExiJjWCCSDXbMaiGyd//nYDFoFXdw63l
	GPp2IpfVs+OD5gQp/5mkp96ppvHcLY/QVnTRMkvnaNhEVSP+7Pvj3E7oG8WxUYg=
X-Gm-Gg: ASbGnct7IVAWBp8tEL2O7QIk6TuJ4cCu+o0nRZQ8CHDSqayJi8eyXhavRTi4ZRPSftE
	g9wl5N+9d5CYJeojndM3gP3NHPAhJfwbirSB1x+BpGHf199MT9ZRsNUcLFg3a17uS14NuTcKDMC
	uNGZ8AAF2SN+W1pw/y+rm51cHRW+kHruY1cUxWsg2HG1CgpFrmjGvhSJQ4UR6YvhxJlGDw0h/43
	b5MseFqzBvV9iw7wO06MkAH6Bxr6zE+R4mJVNrRc+niTz3QTbtv9AC8Bx3oRO3jGIrjQYBmmDWG
	FSUwWD53
X-Google-Smtp-Source: 
 AGHT+IF1pww2qqLE9zMCq4Z4/K+bkG+iAYWr1I2S2Beewnfd6QMcuan64k6kobi5emQ4TB2NMs4iTA==
X-Received: by 2002:a05:6402:13d4:b0:5d3:ba97:527e with SMTP id
 4fb4d7f45d1cf-5d4185fea2fmr5584908a12.25.1733850612616;
        Tue, 10 Dec 2024 09:10:12 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:11 -0800 (PST)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 03/24] clk: versaclock3: Add support for the 5L35023
 variant
Date: Tue, 10 Dec 2024 19:09:32 +0200
Message-Id: <20241210170953.2936724-4-claudiu.beznea.uj@bp.renesas.com>
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
Message-ID-Hash: ANAFNCWBOHXWGZPL24OWWHGXTDS6LJ2I
X-Message-ID-Hash: ANAFNCWBOHXWGZPL24OWWHGXTDS6LJ2I
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:07 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ANAFNCWBOHXWGZPL24OWWHGXTDS6LJ2I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add support for the 5L35023 variant of the Versa 3 clock generator.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- collected tags

Changes in v2:
- none

 drivers/clk/clk-versaclock3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 1398d16df5d0..9fe27dace111 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -1133,8 +1133,14 @@ static const struct vc3_hw_cfg vc3_5p = {
 	.se2_clk_sel_msk = BIT(6),
 };
 
+static const struct vc3_hw_cfg vc3_5l = {
+	.pll2_vco = { .min = 30000000UL, .max = 130000000UL },
+	.se2_clk_sel_msk = BIT(0),
+};
+
 static const struct of_device_id dev_ids[] = {
 	{ .compatible = "renesas,5p35023", .data = &vc3_5p },
+	{ .compatible = "renesas,5l35023", .data = &vc3_5l },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dev_ids);
-- 
2.39.2

