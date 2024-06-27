Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 710C691DF5E
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:33:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED3322BF3;
	Mon,  1 Jul 2024 14:33:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED3322BF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837222;
	bh=8swFldKlKLstLXY6Asg2tgwwu4NDMzYCnaw9E3FvaAg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZckxOkh0AJIxBFWf20kkLl7aOBltLRFvayvcakOJfHyPf61pOGjQEjxfBHGXx8i6z
	 2lv63BvDS0YLrhZ/ePD+wmGFIatokDiHd3/kY0JRJWqawSh+GSt8EgdeyQMekZFIFk
	 Ixhxixlq+eQeJh+YjQ78u8opE7siIPtD5Yc0mdwk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 723A4F80796; Mon,  1 Jul 2024 14:23:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7846BF8999C;
	Mon,  1 Jul 2024 14:23:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD1DCF80423; Thu, 27 Jun 2024 17:02:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52FC2F800ED
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 17:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52FC2F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=orbgiQf6
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a72585032f1so618987566b.3
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 08:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500558;
 x=1720105358; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9ppopi9ppNssy3Y6kMvZbEvjKhcjUNqGrL0dAUL4ao=;
        b=orbgiQf6msqKayD8XibmZNaE0nxHApjHcuj0Fy0nrF8mN21Liv+SVSUXLUdqexsabk
         d8Q9nf/WSp3WLHWrJZ1cC1/3iCy4YGQalznYZ2lTkzniefjEHjCwT1vB9q+vd6QbJ2E3
         Vmttp/+ABv4SeTCqszfFnuCipdHo/W87jMClDdwquP55G53cfJsBvZVWwcU0gEsJBgEq
         qs8oziJ358AGEOR7F5vIUPLFzY7B/H0tSnuGjChBnKPZSTOjayjhivoTzXxYRaJqTIGw
         FNsFkqUFigwB+rzhq6tGQTATzST1pTKviO0eVAvVP4jPZnrV8ed6jM4O9NN4r3iG3nl+
         81CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500558; x=1720105358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9ppopi9ppNssy3Y6kMvZbEvjKhcjUNqGrL0dAUL4ao=;
        b=JLwR5ifM9bMSSyFFrp0VneoKWMvK/a641OZmhpx4XF9qP1P6yEpMOlKBnWteASvps4
         fqGzgZqBY+zy+/1GNXU68oI5mnl3Gz+TfmnL/+cbSTWOJUqlYZz9+/5JLJKyo5wpbY6Y
         LzMFQjmmeGC6S070Kjd5ldvTKdwvIvIiqk11v+yY+coP5VYqpbstX5T7K1fqJt7hvStd
         CAM3H2OYeBqJ61D4h3IZz5d6KpDF6d6lhR2X47IPmAq//TSgA8u5JJdMeTO1G3QapckK
         WmKlCjWOsC3awgM2mBFeOo47p3MAj0+oW/lzQAE0klu1qEi6VnfY0F3vnBKR3usIbe0G
         u27Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo8MlEbtZcW85aeutB4BKAT+fwqIHzWra2fniv1JpcWGjBSQGLRbrfLR5U08gIzBo7PtF2CqyAsow0rl//OdcVNOlsyuOW8rHi7hU=
X-Gm-Message-State: AOJu0YzNRLHG4e7u0C8+E65HZmbSxCX5K8nxXuLeUe73OFDbcKWF1inA
	6/ncULhYfuBglmiVjQ3K/FTD37fcxGAX2Azad9n/1V8K4YxF54QfcbjVnNsIcEE=
X-Google-Smtp-Source: 
 AGHT+IHNxN4PmRPFk0RxdcCHSntPRfVHwfmOqM6zTS7G+/s/UPca4WGfngbQvLyYCR5O6HreQqUr+w==
X-Received: by 2002:a17:907:6a0e:b0:a72:8296:ca42 with SMTP id
 a640c23a62f3a-a728296d1cfmr421637966b.49.1719500557261;
        Thu, 27 Jun 2024 08:02:37 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:02:36 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yangtao Li <frank.li@vivo.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Li Zetao <lizetao1@huawei.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Corentin Labbe <clabbe@baylibre.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [Patch v5 04/12] ARM: dts: lpc32xx: Use simple-mfd for clock control
 block
Date: Thu, 27 Jun 2024 17:00:22 +0200
Message-Id: <20240627150046.258795-5-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NJPM7ULIL3AOYAXKEIOL47XKMVJCRW2P
X-Message-ID-Hash: NJPM7ULIL3AOYAXKEIOL47XKMVJCRW2P
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJPM7ULIL3AOYAXKEIOL47XKMVJCRW2P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The clock control block shares registers with other Soc components

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v5:
- This patch is new in v5
- Split previous patch for lpc32xx.dtsi in to 3 patches

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 974410918f35..8bf88d141e5b 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -312,18 +312,17 @@ fab {
 			compatible = "simple-bus";
 			ranges = <0x20000000 0x20000000 0x30000000>;
 
-			/* System Control Block */
-			scb {
-				compatible = "simple-bus";
-				ranges = <0x0 0x40004000 0x00001000>;
+			syscon@40004000 {
+				compatible = "nxp,lpc3220-creg", "syscon", "simple-mfd";
+				reg = <0x40004000 0x114>;
 				#address-cells = <1>;
 				#size-cells = <1>;
+				ranges = <0 0x40004000 0x114>;
 
 				clk: clock-controller@0 {
 					compatible = "nxp,lpc3220-clk";
 					reg = <0x00 0x114>;
 					#clock-cells = <1>;
-
 					clocks = <&xtal_32k>, <&xtal>;
 					clock-names = "xtal_32k", "xtal";
 				};
-- 
2.25.1

