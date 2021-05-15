Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E88F1381558
	for <lists+alsa-devel@lfdr.de>; Sat, 15 May 2021 05:00:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77E69172E;
	Sat, 15 May 2021 04:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77E69172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621047647;
	bh=MgIMsx29DBnO7IWne7qKD9C8AUHu87MJYtuuLaufqVQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DCNNtcSoAWo7PgILARet3phIT5cCoORo0aYpPqmsL99WDaAPSDDyxm0zVLIj4INFp
	 54LewIiY8Ea6Tcy8vHAVNXusSAArFbgA/xv+7ret9OJyGqRuiD3elQvYpWiC1y2QFV
	 qnRWiLeYad1XPL8IDcXQZOGZm4TXAwrtQBxe7IwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5576F80431;
	Sat, 15 May 2021 04:58:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71884F80156; Sat, 15 May 2021 04:58:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22E54F801D5
 for <alsa-devel@alsa-project.org>; Sat, 15 May 2021 04:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22E54F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LMPCfR+8"
Received: by mail-ot1-x335.google.com with SMTP id
 q7-20020a9d57870000b02902a5c2bd8c17so956762oth.5
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 19:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CtIozg4TyPmaxagSKodE8olnLW3eEIEko3jxzjbTr90=;
 b=LMPCfR+8vlIYDHGPtCemLZfNaO75T6pi9kuBjKzYz9/Xy1EMjLGW+q7ONW7GLR5Dwt
 dTNHtAR+4zry/8hAZI1adYOGYeIMRoDTycarr3fsxilyOdFLwIwWE0sl8l20VjKQXoB9
 v1uwMwjJqATjOzJUIfEzf7uEcuULIOXrcRHnJFPl9IOZkuoFr/Va6SDjm6rkEE+Ynxme
 XCu1uUWAhcEyNtTMv5/zG8rLCQ0z9pg8oY/jli0q4wa/b3bEdd3+ycX0xuuzqOqNrnHj
 zx24uI9Jtc44xABdIlTmemZ64Zyj/6FvBLZUanYzp1yu4T5UDDskm84DXVG+Am5i/81q
 U45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtIozg4TyPmaxagSKodE8olnLW3eEIEko3jxzjbTr90=;
 b=kJhHHFOP4GRmAeSy0M6XyorBkn/5PJz3iMg2y+DN/geJ7k3zop1Iq/AyduP0yzSCwu
 m9IN5FFii/JvPybdU+DAeV5rEa9qXspgUWaMJOh7aF201CyyR2N4702I72SEozD9mGMT
 QP8524/Ij+HTRMJLMrrIXWjDSNYzNp1K+cUyYkKzctGoKxgWy+yfVZ8YY+AVMT36eo+G
 DHzaPNFLWHnuPLgbPB78QTHO9mbaDV6FZX8a1pkbaRLrUaRf5HZ1uxbozf9TV/T8l2Yf
 Q6hOd2VO9La2HHxA4CaV5waqsasPj0GmlNnTMo+VVDxIj/C/o/vms9zvfwtSNy6GTm+z
 Pzbg==
X-Gm-Message-State: AOAM5320918W34tsYjtIysiHblDa/UdKrTzOh0vHi1Fmu/KkII7WWa71
 LiYpT4drqUM8olS3e3lAKn/AfCPzOcU=
X-Google-Smtp-Source: ABdhPJz4Q9lKotO5l15FOiBWW+C1bGEq8I+Y+fOKMyYpCmFGTP5rozeA4IuWpRbjUsZnBP+eenvFTw==
X-Received: by 2002:a9d:7a92:: with SMTP id l18mr30032392otn.355.1621047481943; 
 Fri, 14 May 2021 19:58:01 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id j16sm1689444otn.55.2021.05.14.19.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 19:58:01 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v11 4/4] arm64: dts: rockchip: add rk817 codec to Odroid Go
Date: Fri, 14 May 2021 21:57:49 -0500
Message-Id: <20210515025749.11291-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210515025749.11291-1-macroalpha82@gmail.com>
References: <20210515025749.11291-1-macroalpha82@gmail.com>
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

