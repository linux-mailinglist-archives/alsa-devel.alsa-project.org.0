Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 977F4380EC3
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 19:22:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 212BF17A1;
	Fri, 14 May 2021 19:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 212BF17A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621012962;
	bh=MgIMsx29DBnO7IWne7qKD9C8AUHu87MJYtuuLaufqVQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PIznNgu8gvIuAuvi8HPoHuE8Pxe05Scrfu7hw0GcH2kpQ8JRy+tfJDkkh8/cKTp8s
	 HHyC96TxgPem5wLdDxs99s5vBXc8pwtlK6MSFVV0yy4D24GlkLg2cWFl1K2K0dlmV3
	 4fBwwuIZceq8OBTZ5LlT2Rsbi/fxzsqd6jVwZcYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18592F804AC;
	Fri, 14 May 2021 19:20:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFCE7F8049C; Fri, 14 May 2021 19:20:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3FF5F80272
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 19:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3FF5F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PCVqlSCo"
Received: by mail-oi1-x229.google.com with SMTP id z3so156033oib.5
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 10:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CtIozg4TyPmaxagSKodE8olnLW3eEIEko3jxzjbTr90=;
 b=PCVqlSCodPkrGPKgZ1w9KKVkYDhYVW9vrpCZ3xmhVRVmc+9HaSbcCyoCGHszbA0gQm
 PNGLQzkLI9eG667gQmIuHUh22ltAR+V8EgMTvZ6zlDNHAwTpHXL7x2LeiR2+0mSeAyqN
 +zP3jH2Mj9Wu+GMBrecWVgXZe1Ay6k96Q0AQsIQj1dCKTQ+NUWCCz0b6dchdrQLajBNF
 gnsRBkX3yU9MKyyDG7IzMdq1D+fR4jRqE7fOhyd952Cfq0nraZ4A6duqgVLy1HKVz/ZM
 MqkNdq2Ab/ntfn+ad0s68tUHjyNNpObWrFk8W/pCuZx9sKzm5ElAaC99/apKdjYex4DS
 BANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtIozg4TyPmaxagSKodE8olnLW3eEIEko3jxzjbTr90=;
 b=EQwl+tD1I/HCXDxkcLXDEZKF2gFAaOYXs/QeR4lfbF4qHrKNoU+5GleoBC8v3Nu3f+
 Vq+nBBhIZuuP8Hnhxw50ef2ghC3+D3FUDW7Q3fXA67i72n7q/Lg08zRXAt9uEqqtkwCX
 UUwMBnA0bA/pJ0QcARNojjoMffsJ+K0H1wr4KXmymkHUW0W6/eiTscxkcMEBPSlnrADj
 UcYPq0lZ5lhT44dp0g6nojX7fd5R+S2sYFmoHp5hjLBFI8oHwdelbh6zYQhICypV1MWa
 xhvuSagEhHYrrEd9zRjrtt6wEfEx9r8Ii4nQrWP6EH8iTJ4dNY7sT8EcS0OZcZN/KXSq
 1Vkg==
X-Gm-Message-State: AOAM5300ogFJIVRwcOmNOEHXtHCOVQNeDJ2xrmXepee+YhS4iYDtarf8
 FT/2NlWRf1+0KPGASWCp5wMLG57hoUE=
X-Google-Smtp-Source: ABdhPJytITL4P1navsjFM7xpsEj20HyjcE+F1Bt+xFcaQ52PEKrTicRXH2w1VUfyo+tTxCOEXkArBw==
X-Received: by 2002:aca:c714:: with SMTP id x20mr34029513oif.85.1621012801169; 
 Fri, 14 May 2021 10:20:01 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id x14sm1302547oic.3.2021.05.14.10.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 10:20:00 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v10 4/4] arm64: dts: rockchip: add rk817 codec to Odroid Go
Date: Fri, 14 May 2021 12:19:40 -0500
Message-Id: <20210514171940.20831-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514171940.20831-1-macroalpha82@gmail.com>
References: <20210514171940.20831-1-macroalpha82@gmail.com>
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

