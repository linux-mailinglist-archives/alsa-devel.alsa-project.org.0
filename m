Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0609ECB51
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:34:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84A362C36;
	Wed, 11 Dec 2024 12:34:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84A362C36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916886;
	bh=hJDCv1TyaQlo/L0tvA82G+IiLtzZURDjCsIXt6YWZzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iE3RCg/uNlRb2YUoB13jL41LAAfUi4Ai+rQk9XGd6A2wc6oAvJ7+23wGk5cihRKty
	 ix6+IuvWpR+0iEE/HQP7cj+XHVE/7J7PBn4bbPdNm5wbsBpeGRa2QQdRXmsMqcP4Uy
	 PMp60UYwtJs7I2YnVhB+jlCt47Vp35PH4dBV4RWY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B1F3F897AA; Wed, 11 Dec 2024 12:28:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5E20F897A0;
	Wed, 11 Dec 2024 12:28:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49F4FF80482; Tue, 10 Dec 2024 18:12:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D23EF800E9
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:12:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D23EF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=h/RpVRVo
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5d3cf094768so6587768a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850663; x=1734455463;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwyXnruxyE1MIUM59wwP+urrQ2EdZ5O+ybJnem/vHTM=;
        b=h/RpVRVoDSDVXcydjmGiGuN+W0fkJg0fIYGtdt37Gg9b4yCXTUyvmn5JDwhPCkQ/rw
         ApYVXCuhvg3/d+XESv+nQ76h7+1zAWMcnJRt1kZGNK3mdoT8bT+Fj0OhUmMWbDNpCQEK
         XGk37nyTaKnsG/eEHI4maA1OPseXxe27AZNaW4O45e38sCNNVilWDaZ7pHhp456CumRb
         Vlf+S//DPwFgTxfNG0zVqLms8xgFRDw1sX+//N+G2dUE4IaBzl4qMi6mVhrXm5C76o8K
         FhyNvgBNKMpWyfLFn/OQop0Au7inG0CqViF+iDBGFtJD1ghlIksoUXPHZ6eV4ADy8jnp
         qIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850663; x=1734455463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwyXnruxyE1MIUM59wwP+urrQ2EdZ5O+ybJnem/vHTM=;
        b=Ovyp6VpM2r6vA2tnYs2fqgCIEkHWcX3I7L3jmO1CxFCNU0u+WQeA8CMNxaXB4A17bV
         lowXTmTK7r1k+Y6+xJcf/GWQj9VrdD0xA9rkUDELNje3xKWjqGWe2oIH2M/rwWaEUub6
         /9eWox+HqVzQvVW8NAn7Hm1Et7zlmICN3JYD1RehgOHueEFliqJle4u1Bc3e+fuVh6oh
         yjukh2qTsakEX9txyagIIEKsz2rpSaEK/nA6efpT8CthaeK7XfzBeHbk8wa+ije+MF3q
         15yh95EE+tLTmgbcB+Wv6BLS+6DSFcn0gABA/z8cNNthcJS7oLw9INF43P2+9ZgNm6OF
         KYnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxp41qgsHb6SBR6GOzPKUQHsHywekPOgRodxY1sGU3kOk9A3SQsT/Kvk54tTZfd/mGJvrwCtETKsP9@alsa-project.org
X-Gm-Message-State: AOJu0Yw4v4srqZaqKc9Z+v/7kZ7Nsl2TU5LaWp5V2JfMWhki1GVe6SwZ
	/zFUpFBM3qIizMrU+wITUHcqo0gqx6VVjP07aoKd/nLla1Fnpvbuo1vPP8CgtqI=
X-Gm-Gg: ASbGnctI63cUs2QUd+K2/yyIKAr6Y1NOQakfP0bK1joEGMJxyTPYX6TUsB8i1l8Kafm
	Dz8KcD3HneGuAXitDA88MivjOX1aBmgqNulMDUyyTgnqlLhpmDPeN4oyH8GPH34I7zXaPLqmDm1
	hXCvKrZZyp54xKiK8MFp66U3uOjSE/uk1y1dLRNjHEELl0o/YfvEgyy7T/5rlAlwYkSzNQE3rXJ
	Nk88KXzWQv598+d9I/mbTesbEORSHXAyYfJqdQDXyMB1oBrq9Gwtg7kstgc2J/znfKEHOI44sKi
	CQi9w7X/
X-Google-Smtp-Source: 
 AGHT+IGQNruuJ2fmbhGEBR6v4EYtbwtUlKzpp82KdDiJC4wYZhl0SU6OosybB2Txg3S5RjOBSBjG+g==
X-Received: by 2002:a05:6402:3490:b0:5d0:d5af:d417 with SMTP id
 4fb4d7f45d1cf-5d418502c64mr5890914a12.1.1733850662767;
        Tue, 10 Dec 2024 09:11:02 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:11:01 -0800 (PST)
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
Subject: [PATCH v4 24/24] arm64: dts: renesas: rzg3s-smarc: Add sound card
Date: Tue, 10 Dec 2024 19:09:53 +0200
Message-Id: <20241210170953.2936724-25-claudiu.beznea.uj@bp.renesas.com>
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
Message-ID-Hash: PN6FP4ZANWT5R3JQ42N5AJLPTI7JXSJW
X-Message-ID-Hash: PN6FP4ZANWT5R3JQ42N5AJLPTI7JXSJW
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PN6FP4ZANWT5R3JQ42N5AJLPTI7JXSJW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add sound card with SSI3 as CPU DAI and DA7212 as codec DAI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 1944468a2961..5329f3461990 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -44,6 +44,23 @@ key-3 {
 		};
 	};
 
+	snd_rzg3s: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&cpu_dai>;
+		simple-audio-card,frame-master = <&cpu_dai>;
+		simple-audio-card,mclk-fs = <256>;
+
+		cpu_dai: simple-audio-card,cpu {
+			sound-dai = <&ssi3>;
+		};
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&da7212>;
+			clocks = <&versa3 1>;
+		};
+	};
+
 	vcc_sdhi1: regulator-vcc-sdhi1 {
 		compatible = "regulator-fixed";
 		regulator-name = "SDHI1 Vcc";
-- 
2.39.2

