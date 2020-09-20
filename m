Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B07271700
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:17:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFEE31698;
	Sun, 20 Sep 2020 20:16:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFEE31698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600625834;
	bh=YkAZHIqttnR+8m+uZlRMYJVNyrEfuMy5SJ3/4qbG9ok=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YH3ga+5jt53bvkrcoUqKKoD2PyR8ZtoGlmUjIig9OwS3Q2/viRIZx6cyXcsqedxtd
	 W8w3ML6KxtNUBSe1cogFSZYewUHi3isUV3fumneMf2ixO4cTTPyvHhnBbcEUrllCM4
	 5G6vcg4rwkc/dGmT1ofEJdMss3yUlpOE1G19lbzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E7E4F80339;
	Sun, 20 Sep 2020 20:08:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4D6BF802F7; Sun, 20 Sep 2020 20:08:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D59D1F802E2
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:08:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D59D1F802E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="I1O2Oz5v"
Received: by mail-wm1-x341.google.com with SMTP id w2so9968598wmi.1
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 11:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SUVIxl5BYolVip4ZPyodUNNPga8sBfd676yD0NuAt4Y=;
 b=I1O2Oz5vJ5hmtMequ/rmJD9dirDkFPgLdWTPNvMmsquGFxkPmoTk8I211PP7GODFCv
 LQiRgIZKOpRnOIAXHInA9B7LPMOYhbG5KUFYFZoYx+pA904iithKgcYUY3+R8s+Ai4Ku
 DWhFx9NEGKdRw4z3JygFvPSRW9Sy29b03sf/VRwbkFF2aZhbAtNHPGThtv0Fb0DLFUwJ
 4ZhKT1WmfPZA17mdu2PDVbhkp6gbE7paKmLX7d/PS2jA7ydvV8VdQgU0B24X2efNEU3B
 DsjMHV3h9XVPbEgV0UmWeHYLrrUn+hGepoKa/vitylfLkVPE2LI/kIfDORLDuyAMXpza
 Q3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SUVIxl5BYolVip4ZPyodUNNPga8sBfd676yD0NuAt4Y=;
 b=Hz8fU59OgSXxxyGfBfGh4Z3p4VQ1pfcdryRDKhCbS5GSI5KpiRGqFRbPQ0tep+VyQI
 W9br+CAhfpqVVquaxVXHnEWMMzgZ9dRSJ0s6iPOqjcMsJy958oVrFVivaenSVq5tSFCM
 LKEbd2wCrS1bwb/izyt4m8s/P8nndx+XGfoPkqV+dFVwTRFitx+9Il0np8nHnR/6MiHm
 zw8isol2jEzWsu3sQv56lweu9kjZb+oG+pFm7p6BVaDJWGL3fmVZqF+TyddbbU/949w1
 cL13tgaupbtGALU8oj31H2S/zzoRLydYtwJdvpgzbgHOoGwtwNQ9ccxetPWRosOhbEaA
 hguA==
X-Gm-Message-State: AOAM532JT7SgrWHqYuxP29LoWHz787OMNfocAfbjcXTOF81L60g5rbs4
 zIHwaTISY8ArHHStZ7fv4hk=
X-Google-Smtp-Source: ABdhPJwujdcabqh3m3yBLIvG1kcB7Nia28nCy0y1YHr4Ak0EWDYkczw2aBUWc8DKtkiuy7WRmkyh+A==
X-Received: by 2002:a1c:b386:: with SMTP id c128mr25736377wmf.82.1600625303592; 
 Sun, 20 Sep 2020 11:08:23 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id 18sm15142782wmj.28.2020.09.20.11.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 11:08:22 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 11/19] arm64: dts: allwinner: a64: Add DAI node for HDMI
Date: Sun, 20 Sep 2020 20:07:50 +0200
Message-Id: <20200920180758.592217-12-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200920180758.592217-1-peron.clem@gmail.com>
References: <20200920180758.592217-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
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

From: Marcus Cooper <codekipper@gmail.com>

Add the new DAI block for I2S2 which is used for HDMI audio.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index dc238814013c..51cc30e84e26 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -846,6 +846,20 @@ i2s1: i2s@1c22400 {
 			status = "disabled";
 		};
 
+		i2s2: i2s@1c22800 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun50i-a64-i2s",
+				     "allwinner,sun8i-h3-i2s";
+			reg = <0x01c22800 0x400>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2S2>, <&ccu CLK_I2S2>;
+			clock-names = "apb", "mod";
+			resets = <&ccu RST_BUS_I2S2>;
+			dma-names = "rx", "tx";
+			dmas = <&dma 27>, <&dma 27>;
+			status = "disabled";
+		};
+
 		dai: dai@1c22c00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-a64-codec-i2s";
-- 
2.25.1

