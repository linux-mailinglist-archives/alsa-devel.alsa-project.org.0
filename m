Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 755EC38981B
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 22:40:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F08521679;
	Wed, 19 May 2021 22:39:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F08521679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621456831;
	bh=MgIMsx29DBnO7IWne7qKD9C8AUHu87MJYtuuLaufqVQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e3Idg3jSvX7FHCwDHpgR3I1TdHxkXRugbA+LKJ7S9obyjBkNl13cG/JaE2oL0yJ5T
	 hU0eVyys+NOpxYYum7fAzS1ppwvliTh1ufFkGJwPkxwTWiEZOe6v76rmkm/8gAAcFz
	 0Z5Gihd6X0mR4rMBrIOcz6VJJcP0exLut5YsW2gw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62622F804A9;
	Wed, 19 May 2021 22:38:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 866D2F80425; Wed, 19 May 2021 22:38:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70322F8025D
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 22:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70322F8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AmHfXcnp"
Received: by mail-ot1-x32c.google.com with SMTP id
 g7-20020a9d12870000b0290328b1342b73so5093992otg.9
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 13:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CtIozg4TyPmaxagSKodE8olnLW3eEIEko3jxzjbTr90=;
 b=AmHfXcnp1nO4RnOBhOGb34amB7BP00FVaE/uDsHk47L24i3u2FAHIBLSX7vthr1R79
 /zAmGb90klzTJeZepfKBjI6nQFMRKMT5xeDZsfKOEKPOmIgBM4Uhnb/2VUyMnrvvNMsu
 vib5P/C8mAZF2JXd/IzRqep+kz7RFICkqMl8PpXmYBowCzaRvoCdGfEHjq5p61eXPPwN
 LwyirQZPt1DBfhCyvvK+FAw55EqIQOj5d/bLMmbasIdhnsUQ2agryjiIoZoDCemTOJiF
 Q/NjEEviStbjT7mI3UtdYHNfZDbFqQEm0Ocj9Vs2x3NTSg7Sn3IGAbLyEXTtSlAJYVsG
 WKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtIozg4TyPmaxagSKodE8olnLW3eEIEko3jxzjbTr90=;
 b=WSR2+mNC/DI1A/wrFsFMBgxf9Z2mVP4Q1kzw06JUgadVp+TXQ/zkp27tpphWHHUWRx
 +NxHmkOyoZzphDkQnmOGzusy0fg5+LyzK41R9vl76FpbkbB+ftVMUGhHStINdAfW7X0z
 JSU2DLqUdYRaiOWGAb4KYiTdJltrx1+GyiQsq5vuTBIb1h6ZLQx4r7lqBlh3XM7gi/Lq
 Svb88KxDWfBT0TUhuh+KIP2VFyl2mQ/0r4dLK7EdSlaefe9D4WqcxRGyI2RnV4N2xbR4
 4UWGGahrzXkBgz/JZMu05O46mQLhTYj4QVVidSTtjc4sjJL0/05/32XjuRueUJ4+CfU+
 Dpcw==
X-Gm-Message-State: AOAM533Q2TggY2Nrc+rYtApU+XF6sIjz5GKSCG/E6q1dEwELZ8nrgcIM
 vs4Fi7J47M94NC21SNnf1Gim5GObQOY=
X-Google-Smtp-Source: ABdhPJyXXVFDbFRtx4H3uxFZNb1bgErAVsSW/mByBfulGM4AyoCMK2WWgSPI48yeZUGI2NU793iawg==
X-Received: by 2002:a9d:7049:: with SMTP id x9mr1152728otj.20.1621456687933;
 Wed, 19 May 2021 13:38:07 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id w6sm189223otj.5.2021.05.19.13.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 13:38:07 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v12 4/4] arm64: dts: rockchip: add rk817 codec to Odroid Go
Date: Wed, 19 May 2021 15:37:54 -0500
Message-Id: <20210519203754.27184-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519203754.27184-1-macroalpha82@gmail.com>
References: <20210519203754.27184-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, heiko@sntech.de,
 devicetree@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, broonie@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 lee.jones@linaro.org, maccraft123mc@gmail.com
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

From: Chris Morgan <macromorgan@hotmail.com>

Add the new rk817 codec driver to the Odroid Go Advance.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Tested-by: Maciej Matuszczyk <maccraft123mc@gmail.com>
---
 .../boot/dts/rockchip/rk3326-odroid-go2.dts   | 36 +++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
index 49c97f76df77..e8c2b5a817a7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
@@ -165,6 +165,31 @@ blue_led: led-0 {
 		};
 	};
 
+	rk817-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "Analog";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,widgets =
+			"Microphone", "Mic Jack",
+			"Headphone", "Headphones",
+			"Speaker", "Speaker";
+		simple-audio-card,routing =
+			"MICL", "Mic Jack",
+			"Headphones", "HPOL",
+			"Headphones", "HPOR",
+			"Speaker", "SPKO";
+		simple-audio-card,hp-det-gpio = <&gpio2 RK_PC6 GPIO_ACTIVE_HIGH>;
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s1_2ch>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&rk817>;
+		};
+	};
+
 	vccsys: vccsys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v8_sys";
@@ -269,11 +294,14 @@ rk817: pmic@20 {
 		reg = <0x20>;
 		interrupt-parent = <&gpio0>;
 		interrupts = <RK_PB2 IRQ_TYPE_LEVEL_LOW>;
+		clock-output-names = "rk808-clkout1", "xin32k";
+		clock-names = "mclk";
+		clocks = <&cru SCLK_I2S1_OUT>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pmic_int>;
+		pinctrl-0 = <&pmic_int>, <&i2s1_2ch_mclk>;
 		wakeup-source;
 		#clock-cells = <1>;
-		clock-output-names = "rk808-clkout1", "xin32k";
+		#sound-dai-cells = <0>;
 
 		vcc1-supply = <&vccsys>;
 		vcc2-supply = <&vccsys>;
@@ -432,6 +460,10 @@ regulator-state-mem {
 				};
 			};
 		};
+
+		rk817_codec: codec {
+			rockchip,mic-in-differential;
+		};
 	};
 };
 
-- 
2.25.1

