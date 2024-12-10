Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B919ECB32
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:30:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79ADA21B6;
	Wed, 11 Dec 2024 12:29:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79ADA21B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916595;
	bh=RalPxCPilUWbjYvZHpa4B7ebOphri7Uk5DSwxD2axvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R//U7oYJ3k7XK/Blkt6iVP5vHQl+HTqBk+KUnZnYJA4IEifw0LX72d6K48nguelDs
	 G79MitcFdNaDYeLFz5r0s/8fYps5T4MG9Ng9w7qd5WJkqdTm7e6MTT+aWCE7aYIys1
	 YRwKiFM+Qkrfjcb0ZcOocTt7GfNyf5xNUoDEo1js=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49E49F806F0; Wed, 11 Dec 2024 12:27:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2DA8F806EF;
	Wed, 11 Dec 2024 12:27:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6E9BF80533; Tue, 10 Dec 2024 18:11:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 434D7F80448
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 434D7F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=ml4E1BkT
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f367f97so8533285a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850622; x=1734455422;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quo1xBiWZKYYPo7MUB0R0AMbPr7YypV5dW0W8isrnRE=;
        b=ml4E1BkT+us3SOIkpTGeCZYXWQcIIjjUK/w72afdfADgVi9f51ckGQxK+Ako6tJri3
         vma4JBahS1nSSrwZ0ehrZER0CIaDLP5vqnEKsH96wUOeFsjK/04ahkS9Renc7vmmy/A9
         kwXHIg/hWpqzLC/NpYurKpLvXpcvJx/KuwVEBFI685Jx7ifokRVo726S+lT/Ey2cVvd4
         YV8sRQ96GqPBpMn1rnpXM5CX0ACyDhIotjkXDqKFU8JiAKWzJH1oKS6w7p5t9cTJZNju
         i9uzpXyUWGv4Roz1GnTmaDU9PW7HzsP6kmEk5k6HNQPEZ0oMUTss+wQ4fI0v77on94Qi
         wgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850622; x=1734455422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quo1xBiWZKYYPo7MUB0R0AMbPr7YypV5dW0W8isrnRE=;
        b=Mm2m+Ghvrq/As75qFXv+cu+2i3N8Dwe1vlzPRrFpNUJMBRTd6ebfm+v8FW4oochu1G
         FCx7VZQ1aEPbJYYvnS9QfZDk8+71ueYX3oxsRPdPvoa11HfwDpVOc/Aqx3gKodxsowB3
         cem0SkIQNHLN8PCHPuavIxKyDFwLQokXk68ARdZO6Xrxf6Jieb36mMGN/Yx5hqVPOjHf
         izXlOJPUkqjhacrpJxiHriMqCWTx/9P7JPet71bmAUD2JNx4yne3h4hPPk0ew1dLEIpe
         DMGpvuO6Ec+OlF5jm2RwnMLd/HBQb8IOxPjaf774zQLIbv09tARX2HVnrvbysykNOrB9
         /y1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCV5mwjnZ+fkDMzxQQ5F5ouV13Te8xLyDzU4hSHt0y5QHV++ZyL+YiqPP3JbRHaLygSvo0WR3Iihi9@alsa-project.org
X-Gm-Message-State: AOJu0YxX7dHQC2O3nOmkPTl4m9k4eVNuEB5kMS/qBHzZDr8MrkWFp5KK
	l70RZ3Cq2aWH/R6dsGLV7q35lXHjPJ2Qy0pngLDHDSkMUvkgrkknFdhltsfs3NA=
X-Gm-Gg: ASbGnctOfXlx/IdiDf/0bIJdLLfd15X/TMQ+gx5pebcRU8WxYrzdvw29sAt3AcFi5bo
	6zr1bAoamAgoE4x4oLRVty9oZ0g0SX8fL1bcdmR+ad1gPVATu/ouiKqq3IYs7MxRajOYPcRokx5
	eBbdMe9mICLIh6TEFkB3w193owmURU/F+LYuYLMY8xcM18cimz/1BrICFKbeQQuvmeWih8A+vpK
	E4MvdgPylf5F/V29T3oMlWZpyV0J6QsZuBZSvUF5t+7TqbFCQjjwJ/f/qO0GAgnTT6lYyySwOG/
	5x4PdJt4
X-Google-Smtp-Source: 
 AGHT+IEVq5G+gawrHiPzQYVclV2UevSYSlAdxNYl7RmLq5d6hxx+eXzeCUIVNOyKC/W4oWQ1f5HO/Q==
X-Received: by 2002:a05:6402:1cc1:b0:5d0:ee52:353e with SMTP id
 4fb4d7f45d1cf-5d41862ed58mr5867285a12.29.1733850622148;
        Tue, 10 Dec 2024 09:10:22 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:20 -0800 (PST)
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
Subject: [PATCH v4 07/24] ASoC: renesas: rz-ssi: Remove pdev member of struct
 rz_ssi_priv
Date: Tue, 10 Dec 2024 19:09:36 +0200
Message-Id: <20241210170953.2936724-8-claudiu.beznea.uj@bp.renesas.com>
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
Message-ID-Hash: B6U4JQETKHKZ5ZSQ44WWTX27FJK4AMNO
X-Message-ID-Hash: B6U4JQETKHKZ5ZSQ44WWTX27FJK4AMNO
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:09 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B6U4JQETKHKZ5ZSQ44WWTX27FJK4AMNO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Remove the pdev member of struct rz_ssi_priv as it is not used.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 35929160a8a5..b24c323ee05f 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -99,7 +99,6 @@ struct rz_ssi_stream {
 
 struct rz_ssi_priv {
 	void __iomem *base;
-	struct platform_device *pdev;
 	struct reset_control *rstc;
 	struct device *dev;
 	struct clk *sfr_clk;
@@ -1043,7 +1042,6 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	if (!ssi)
 		return -ENOMEM;
 
-	ssi->pdev = pdev;
 	ssi->dev = &pdev->dev;
 	ssi->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(ssi->base))
-- 
2.39.2

