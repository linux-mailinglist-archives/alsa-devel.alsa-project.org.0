Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DC49ECB50
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:34:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 416612C26;
	Wed, 11 Dec 2024 12:34:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 416612C26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916866;
	bh=j3EZQQ+bJ4Pgh8+9W/k4Ypg3jmTVeLSoZtZxACS5Ilw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ex1c89PfOTpkfO3gHgVXCNhjIpYmGcxEzFDqvw5lfgk1JdoFpfLS874S4OU/T2Kgj
	 O6W5xwMO0YP6dIlSJxXJtewyRRIQ126B/9Pa6XN+XSZrIL52OwteLvcdyLCxxDkGKh
	 pPLxYjovtro2KXh4hDphAmZ5ALiBjI7JbYbBGeAA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C71F4F89782; Wed, 11 Dec 2024 12:28:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39829F89781;
	Wed, 11 Dec 2024 12:28:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA403F80482; Tue, 10 Dec 2024 18:12:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13B38F800E9
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:12:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13B38F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=C+dVmBtH
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28a4fccso3468945a12.2
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850660; x=1734455460;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jE6wTwaLZbTxO8+1zmhGoRQFuhziI2yndu2tr5ybLTY=;
        b=C+dVmBtHW+94J9xMzh2SML1kb8WCTMEcdLo1Pb1tNcTWiE72ZtojMc3S/ZQXwHgUEF
         anFHfeU98GsypKVZ75YT+WEkkd3ArKGvC4JfLAu+Hvcpt6gMFVcHXzWUd8vSPGz9ul2Q
         CeTAs0u+J172cyiDJKdZBAV97BMNclIc1OfsjScylFAH/I9nqO3QdxfvmTsA85TS6/HW
         1TXYmkKJRn4nIfJXAEaYbq4Pp6COumSFT/mrWtJCy4EAY9NFCOT27UvKMikJNnCcmcGE
         oqqjG9qbbN5V2gg5yjF+6tsgRPwmYCNBmgg2PtodHwJJkGvAqGRT3+ABXw5GRpQ9kO+q
         vrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850660; x=1734455460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jE6wTwaLZbTxO8+1zmhGoRQFuhziI2yndu2tr5ybLTY=;
        b=ktznIpMVlZJEuqPoC1YZlS+DBXDGyqHhm9hVRF0rOmx1LLtxT7gjaeYPbCMLBSQH5n
         g2UhjVx+uVVRp0d9qkMZ837jXKKxONpxvkYrrA+bSuf8zVFPFPyDWNNhuhQ05INuAa6s
         Dgo6fjf2EqqhQ+PE3SC1JknMJ1z4FvypquNO1XoT+E7JMPOAMxf7vXR5/RJ97xWZMsru
         ei4C+QEzGgh9EPpb+7/uK5qT4Li/xXelHbc7KI7PZotBC/13SHPHfJXtyeQQsvd8hFfv
         mXcBgt136W3CTnxogK/u6AwdpebfFu5mOcgwKesZp+ClvSO8AIVggjB4GisyTC82A9R1
         3F9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrNyPJwRpdvHuzN8ZxH9kP/YDag/mXXzouiil9Rd9krxLgZMbsK0Y5FtOc3ALXkUTZZGuieNDmdlvi@alsa-project.org
X-Gm-Message-State: AOJu0Yycbi9izOsXX1p936tsKFiAAHcr6vh+3HHLkyUduLcHN4GhwCon
	etOCYmn2asd3wxRfidnAoUuGzFFxuJciiVzJtsIvZX2mm/+rrU2M1sJtUp+0G5o=
X-Gm-Gg: ASbGncu27T3e64gx91eJVgjn2ZrvW8PUaYkG2ETqzUSLDg4OGhQQshQl7JcztqRaoAR
	NltDYGQ+tRh2AUOnH6gAqrkV+Uv6B/iETfFDj2hCx54KgdkSPZpl7L58bfEYg3d+PVJJv8AjcX6
	f3EA78XMbzZpH1qAQNOBLLAgpCGVRPFlbQ+q+aH6jKEWPamfszGgBX/wrXEras8035bVHw4N4a4
	RnhCt0R3DjWMdMs7O69ix0IvjeANcs0awrkr2VY08bOmnciy/7I6B1BGVnXBrnSKUu2Ms05iQfP
	+ZtpaI5j
X-Google-Smtp-Source: 
 AGHT+IFlYyo736yb9cxpJS2cGnLCOO0TpZQwWI6UbvDphomE+gSa6jZr1VtWzN9wAD+vqnofdD3cjQ==
X-Received: by 2002:a05:6402:2791:b0:5d0:b925:a8a with SMTP id
 4fb4d7f45d1cf-5d3be6c1598mr19946134a12.16.1733850659570;
        Tue, 10 Dec 2024 09:10:59 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:59 -0800 (PST)
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
Subject: [PATCH v4 23/24] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
Date: Tue, 10 Dec 2024 19:09:52 +0200
Message-Id: <20241210170953.2936724-24-claudiu.beznea.uj@bp.renesas.com>
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
Message-ID-Hash: CQO3R7QFAEMLVRNEHTU7TBL7RQNARHPG
X-Message-ID-Hash: CQO3R7QFAEMLVRNEHTU7TBL7RQNARHPG
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQO3R7QFAEMLVRNEHTU7TBL7RQNARHPG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable SSI3.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags
- dropped status for audio_clk2

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 899d88467d79..1944468a2961 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -64,6 +64,10 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 	};
 };
 
+&audio_clk2 {
+	clock-frequency = <12288000>;
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -105,6 +109,11 @@ power-monitor@44 {
 };
 
 &pinctrl {
+	audio_clock_pins: audio-clock {
+		pins = "AUDIO_CLK1", "AUDIO_CLK2";
+		input-enable;
+	};
+
 	key-1-gpio-hog {
 		gpio-hog;
 		gpios = <RZG2L_GPIO(18, 0) GPIO_ACTIVE_LOW>;
@@ -162,6 +171,13 @@ cd {
 			pinmux = <RZG2L_PORT_PINMUX(0, 2, 1)>; /* SD1_CD */
 		};
 	};
+
+	ssi3_pins: ssi3 {
+		pinmux = <RZG2L_PORT_PINMUX(18, 2, 8)>, /* BCK */
+			 <RZG2L_PORT_PINMUX(18, 3, 8)>, /* RCK */
+			 <RZG2L_PORT_PINMUX(18, 4, 8)>, /* TXD */
+			 <RZG2L_PORT_PINMUX(18, 5, 8)>; /* RXD */
+	};
 };
 
 &scif0 {
@@ -182,3 +198,12 @@ &sdhi1 {
 	max-frequency = <125000000>;
 	status = "okay";
 };
+
+&ssi3 {
+	clocks = <&cpg CPG_MOD R9A08G045_SSI3_PCLK2>,
+		 <&cpg CPG_MOD R9A08G045_SSI3_PCLK_SFR>,
+		 <&versa3 2>, <&audio_clk2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&ssi3_pins>, <&audio_clock_pins>;
+	status = "okay";
+};
-- 
2.39.2

