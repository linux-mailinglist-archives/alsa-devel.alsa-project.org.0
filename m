Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 165639ECB31
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:29:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E875622A4;
	Wed, 11 Dec 2024 12:29:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E875622A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916579;
	bh=hgummav4gWlxydCCaiYlSrENU1T64Eunf3Cfp6+7rSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kb5RqiGwnTrGTuJRnP1Q90km9O+sx1YgnPpkBf8Qy5bcaqs4x/uUqkLZZGYRZ3eBD
	 +a31m2lSbysWLDMA+Xj2A5EE+v14UbGbqJyzs900AvNTYvl0JRMcQ6GZR1PNqZGjaw
	 z8+AssqP5u/6ryFX6QtiMaos2PkVBOGqevijjO6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED516F806CB; Wed, 11 Dec 2024 12:27:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7993F806C7;
	Wed, 11 Dec 2024 12:27:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA827F805AA; Tue, 10 Dec 2024 18:11:20 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 71CB6F80448
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71CB6F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=J2x0AhRZ
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5cec9609303so6813637a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850619; x=1734455419;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFuKmapnbE9+QOXBiNESOVZ7AOkqywZ/u7IM8EV36Uw=;
        b=J2x0AhRZBG7BKVZum1W/mMaul2Vilx6cKwDjIW7/DWNGeZlL8DPyUXh1JYYeMRzt08
         YjF+qi5oERKIXSvRMyaXYb2Y8Rh+nq1yZ7qCsDARYm2jRRp4uHPJubpihM5xpJjEpT13
         tcHGD0+udMW7h0YV/NhO2sjNNaE5uQfGAgplkg7OPV9qBpr+44boDbax7+R7vln5m0K5
         XrcQREeFmA3yAeMrwMpO6S8CXMh1UmYzjb9F/jI3301qbYKdja1+YvX/oIiq5GFPuYmn
         4MFsNAaGmuxDGyp9RqAUXlLmUvx+bKymA170zlrA0DNtnfF2EEo+9XBy5MDFwjXE5Ftc
         dQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850619; x=1734455419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFuKmapnbE9+QOXBiNESOVZ7AOkqywZ/u7IM8EV36Uw=;
        b=Rc75IVUoTjq6Bh5HL5kRdsc8LMA6G/BkHBnUsIi9GzVqC+0rDsiANly3K2uATEgRPe
         4QZbNDIfd1JQUHofWwCedWwDOXRd86c5ZUB/83RLa5oPzZlrGyptTGHCB7IWtQmdon4r
         QMcCe2OsGltmS1n6RFMrTvamAtq7K/Gu+gOyczPKiiFyohbi8hgBYeCQplvsCns6qlU7
         xZN8mWxJCtTskZcUB9+h1Te67PPkNQdxuHtvPtaZrkZG/O524DP2+UyA/pldIZRDqhlT
         O4FMOA9S8J7+A0ylxUTNZxTiI4yRP2eIGH9JTN4a+PKlxmsZXTvvg0BMF16LFwIdYz60
         JRoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLwywJqVijEwZ3kP6YzGimzGH+Bf/mgYbk+ygaA32O4euL/2Ye+9bKNIX9KBSrFETBQEgPr/0ciR9R@alsa-project.org
X-Gm-Message-State: AOJu0YxQGQI32YjezTWY2n6HKgwwixZprYYXJ4/oH8dLtEj80aT0VZH6
	HRF3NKEk8bP00c29tC/fXO4nUkf1PJAIZwECCEm9qBuuSTMvDKbtNlhDAyX5+tc=
X-Gm-Gg: ASbGnctlL0hJdiGXVS+ERWiTGI0QtmnXxzVvtaDKVliA/TYPM1h5zcOyHuSyD/7R63/
	s5jE2Nn1QhIzBQdBJ3gHIta4dZur07Cu1uyqbtjTn2jcWXfZo6TSzNmE0EO48bpkY4oe3ks4jJp
	mD0gtaVARYmKrxjeLKaWUYKDRUkwsoqTTjGuo9hkLrFbKvck7C+7q/UGqkFtcpUiRkncy2kjph+
	at2jn3zGK7XITczWwx0Hr1nZcuiWUJ0n+NlTxMzBND+Scyijn3EqIpuiPeAu1A9OjGQtf95i1ux
	u7NmaFIz
X-Google-Smtp-Source: 
 AGHT+IGIek6OPyyjZZjrXkuvdN81VR6DHl8mzdwNbzCCYx8cbaECzDZswIN2k+lpO7iWi6HMxuv6jA==
X-Received: by 2002:a05:6402:360f:b0:5d3:bab1:513f with SMTP id
 4fb4d7f45d1cf-5d3be6c4046mr19223495a12.18.1733850618930;
        Tue, 10 Dec 2024 09:10:18 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:18 -0800 (PST)
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
Subject: [PATCH v4 06/24] ASoC: renesas: rz-ssi: Fix typo on SSI_RATES macro
 comment
Date: Tue, 10 Dec 2024 19:09:35 +0200
Message-Id: <20241210170953.2936724-7-claudiu.beznea.uj@bp.renesas.com>
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
Message-ID-Hash: TOXT3ORKJT6O55IGDRBAJTWOJDYYD7QC
X-Message-ID-Hash: TOXT3ORKJT6O55IGDRBAJTWOJDYYD7QC
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:08 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TOXT3ORKJT6O55IGDRBAJTWOJDYYD7QC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The SSI_RATES macro covers 8KHz-48KHz audio frequencies. Update macro
comment to reflect it.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 178c915331e9..35929160a8a5 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -71,7 +71,7 @@
 #define PREALLOC_BUFFER		(SZ_32K)
 #define PREALLOC_BUFFER_MAX	(SZ_32K)
 
-#define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-44.1kHz */
+#define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-48kHz */
 #define SSI_FMTS		SNDRV_PCM_FMTBIT_S16_LE
 #define SSI_CHAN_MIN		2
 #define SSI_CHAN_MAX		2
-- 
2.39.2

