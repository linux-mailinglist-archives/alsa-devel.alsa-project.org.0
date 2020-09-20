Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2399E271706
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:19:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEF0C1685;
	Sun, 20 Sep 2020 20:18:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEF0C1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600625962;
	bh=FtDtCsCG+I5mkYHTFGcWwPmUiqOJd/722cScSNcK4tM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JrFmWv3S9e46S3ehV6HamaL2dfMxlxI6pixJNhDByjimAgeiA67OI41KFcsqTuxuo
	 EGpN/xZvzG23VM05N4bHrjcebPSh0fnq2lvPCVBts59lniGGBthOY7vUrlhsJhcZXD
	 fKoFKvLgoBVq6gEe+AZEAJIc+7yc8sCQki5ISauQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AE0DF80361;
	Sun, 20 Sep 2020 20:09:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A1EEF80322; Sun, 20 Sep 2020 20:08:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B028F80234
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:08:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B028F80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Zu2ABOn6"
Received: by mail-wm1-x344.google.com with SMTP id k18so10328622wmj.5
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 11:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rtKn0+o2ojoOITB0B8/ryvpv4K4vTdQg90PI/damrA4=;
 b=Zu2ABOn6ojEuxd2rsNQ4pw2PGOeYwVMTqlDqwgJMkNacmiIemvC7puK70NMNwZ0HBy
 9evI1CfGg/14kN3yGetKM/XXfhu56PAonM/V0dOdhxBzQ3P0kyBsNtALHwWV3WvVNG59
 PoRu9ybaJ6ER+ZhbVoVicmu97p3psxbZ0GMxjKAW8SufCH9UqMKc0xWSKCdDVlf+Tt5P
 NOrn+QlxlP2FzxcjN1txq+dBx1YYKYkG+N9U9tDqwpTt3Ck5ukBR871TXOB/7q6GuqVJ
 r+8m4uDhRcHN8npDNfaW3tUHG0Kj/2zZu9Tn0+fUw3W17vmPZW8do0OBmRWXXiSHMNRX
 V+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtKn0+o2ojoOITB0B8/ryvpv4K4vTdQg90PI/damrA4=;
 b=CocjKRdNCNEtFMccZOw0CCiHiCFvSvjjRCEEupk5ILIfnZ2QSiLJGtg6D/UfsfiejQ
 WMwQKD22tXXlY40hB2PkbYA3gWAyU6ThNjUFgCwy6cEFAdkHXwGSq8ejNgrEJO5PfdUm
 NeI0GBivAhXQeRVZBEO8S3naKXDHkQmH31jdQix/3sqjImaaSiVTLw5kdxhCfQpc/ztO
 cgt7uGRgswPLCVYAzo7dJQQ02OdCEa7PJLQnLHrqGTFDzmCaM6pOtFvXM1bsEo/w1EQN
 FTbrWDWSzktulg8KEv8Yjmunc/60MCZFzp8opd6sPrQBYX43AoaiDeAO1ihZQ1uNQeSc
 Cx0A==
X-Gm-Message-State: AOAM532oK+zBoKiLVEOT9Coz2W+6LHQecMivTWie7ob73ISd4B++18/2
 uBLM0TqAwTTq43/pwNdjfK+zf4GuBIVlq2Wh
X-Google-Smtp-Source: ABdhPJxcWofN+u6eoYjQGzo8bp4uLOAGpdgJZ2j6m8IVnWiCimUtyHJT8p9v6RyvFh6BVJDTU2l+xA==
X-Received: by 2002:a1c:7418:: with SMTP id p24mr26268957wmc.123.1600625312686; 
 Sun, 20 Sep 2020 11:08:32 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id 18sm15142782wmj.28.2020.09.20.11.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 11:08:32 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 17/19] ARM: dts: sun8i-h3: Enable HDMI audio on Orange Pi
 PC/One
Date: Sun, 20 Sep 2020 20:07:56 +0200
Message-Id: <20200920180758.592217-18-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200920180758.592217-1-peron.clem@gmail.com>
References: <20200920180758.592217-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, alsa-devel@alsa-project.org,
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

From: Ondrej Jirman <megous@megous.com>

The board has HDMI output, enable audio on it.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts | 8 ++++++++
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts  | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
index 4759ba3f2986..a5b45655fcf6 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
@@ -146,6 +146,14 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2s2 {
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
 	bus-width = <4>;
diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
index 5aff8ecc66cb..ebb12a6f3a9f 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
@@ -146,6 +146,14 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2s2 {
+	status = "okay";
+};
+
 &ir {
 	pinctrl-names = "default";
 	pinctrl-0 = <&r_ir_rx_pin>;
-- 
2.25.1

