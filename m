Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0F990C348
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 07:55:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 881CDA4A;
	Tue, 18 Jun 2024 07:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 881CDA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718690157;
	bh=9Uv//PIDIhNFrEud7zayoVo2Y2+fPu69lRG3uydiDVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gdnSdapzvewKJBPKC0iL0jCQpBwaPYd428MqHxik1Nnoq7VDSW1YoND4l0l3Ny5Yq
	 lhjpAQ8CWMpDHXJJs0Lr0XhoIReuqvAe2LcM16gVyesm2/oUG98KHC2A/J913xqPrz
	 edVXPCy1e2OBGCoSNYmPO3oo1f3259l2WHARHYQU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEA85F805C9; Tue, 18 Jun 2024 07:55:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03196F805C3;
	Tue, 18 Jun 2024 07:55:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4940DF80448; Fri, 14 Jun 2024 18:35:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38EF7F800ED
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 18:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38EF7F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=KtQnlHj9
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57a4d7ba501so2966283a12.2
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Jun 2024 09:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718382952;
 x=1718987752; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1mZ6Xg3BCF5HN9VBGCY2svS6vlfsx+tF7JIqIcFeQo=;
        b=KtQnlHj9Lbi2vlwM4WpCvybB8q50Cj7H4QY9ggzgtz9ywTsVGQR5KAMfFyrCE+rCT5
         2hPyChemmDhoPCISy/mYr611dk9LKxiXrH2RAMwU6uzrv6g0Z9k6YXdJKN/CzaxQz8EQ
         aYWYEunqwg6HXm2pc/CC2nOSh9GaZlbCjeUB3GAX6SQ4Et8Xk8hgZabG5+w8IQRQeYly
         eRkl5huvnkqcF+mLZjLmvDJk2YdDuBRcxcE5MrA1tzT+ugzM8nvuBUGACOh83SY8GCHj
         lYHSveJcWfMoLxIEB1dst1rrasAsthhWXFRJ9wu6n6ai6r0fV2du2JoLTKV1O0NvC+Rm
         fxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382952; x=1718987752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1mZ6Xg3BCF5HN9VBGCY2svS6vlfsx+tF7JIqIcFeQo=;
        b=kzzIRNe2o0haLiR0la6Qckf3EwPMixHbQYdRoH9RdJcsI8abyeDFUbAbkzWyGqeoaW
         zdPiC7cwDQYIxz00+fEiFtEMP3shDJZN8OGezLwFz4Z53xPOeFkHgh7cqn6v80a0QpUD
         lhmINhcA710q+ZGD0u2m+9FTYyYRjEU46b/YZD0nQ8eMUvAebOZ6pmrv3ZINHopOl4rr
         MnUXQEWrlYpvfcSePcT67iMwONTEpaMeSBtIDV6ahi7WxSCdw2l9lFdDf8du8y08bUBK
         50sw/u+JyDxSnuEoWanwmMkclM3nbCeFDrbChvH2VeJbi3+WNL5g5kRXmz8aWMZUB8j0
         qs+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhe/PxEO5PYYIJ2sMtq6ZmfBeOZbqMNR4sERJesN3hYnuhxZOfq7FbFmUTTtFzWtFD8ZW2vTceyTK/UggsbdbMnnfer8XrBZjkl8M=
X-Gm-Message-State: AOJu0YynR6eiypkLgOAwCGU20u+xFG/oBZYXA4u+B7N86nETlsPWFkca
	TiyDvoD3wIsRXhaZIje7JB+1lxSG6ewqxB4rZNvd6MeYFCa7s5pko/p5Wx5OYlY=
X-Google-Smtp-Source: 
 AGHT+IFU7jz24QjE0aD7m2kTzDTqVT4xFAQAa5WztkGdzqrtdSmWclJ5lx57DK5AVkuZNzL75iIn+Q==
X-Received: by 2002:aa7:d298:0:b0:57c:c3db:2a5c with SMTP id
 4fb4d7f45d1cf-57cc3db2c52mr1787153a12.10.1718382952002;
        Fri, 14 Jun 2024 09:35:52 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm2462893a12.22.2024.06.14.09.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:35:51 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: 
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Russell King <linux@armlinux.org.uk>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/4] ARM: dts: lpc32xx: Add missing properties for the i2s
 interfaces
Date: Fri, 14 Jun 2024 18:34:50 +0200
Message-Id: <20240614163500.386747-3-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: U7B2MKUWEPWWFTSODCOT7EU6YST4X6SF
X-Message-ID-Hash: U7B2MKUWEPWWFTSODCOT7EU6YST4X6SF
X-Mailman-Approved-At: Tue, 18 Jun 2024 05:28:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7B2MKUWEPWWFTSODCOT7EU6YST4X6SF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The 'dma-vc-names' correspond to virtual pl08x dma channels declared in
the 'phy3250.c' platform file.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v3:
- Split previous commit for separate subsystems
- Add properties to match dt binding

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 974410918f35..bbd2b8b6963c 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -221,6 +221,10 @@ spi2: spi@20090000 {
 			i2s0: i2s@20094000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x20094000 0x1000>;
+				interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk LPC32XX_CLK_I2S0>;
+				dma-vc-names = "i2s0-tx", "i2s0-rx";
+				#sound-dai-cells = <0>;
 				status = "disabled";
 			};
 
@@ -237,6 +241,10 @@ sd: sd@20098000 {
 			i2s1: i2s@2009c000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x2009c000 0x1000>;
+				interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk LPC32XX_CLK_I2S1>;
+				dma-vc-names = "i2s1-tx", "i2s1-rx";
+				#sound-dai-cells = <0>;
 				status = "disabled";
 			};
 
-- 
2.25.1

