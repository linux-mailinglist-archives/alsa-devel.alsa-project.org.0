Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A774B365CEB
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Apr 2021 18:10:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35E1F1692;
	Tue, 20 Apr 2021 18:09:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35E1F1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618935046;
	bh=jnWoJw1kdf/DjxWJniNevj3j2Sub2kxK5/dOra+HYx0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PRbRVED2P3S2AHsOY3iVqIpZM53udvVmhXVkNLy5haUBG2KGWSrKcmdjUHFivX7jM
	 rd9sgzuzozu+ySh+ff562fwgfk8mNSxywMggKVi+Eu72LmJm4yE2jVAHCnK8eOMzJ1
	 p6OQJ/QjDNQ7wUkl8iUJR5YxLuju3+ZJLkO3avE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAAB3F804A9;
	Tue, 20 Apr 2021 18:08:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0182DF8049C; Tue, 20 Apr 2021 18:08:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28BDBF80278
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 18:08:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28BDBF80278
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G7jm/Yam"
Received: by mail-oi1-x22e.google.com with SMTP id d25so1951810oij.5
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 09:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=12xoJC8I/0jBFBQ6uTjCdcTJY4GOeJNX+Bl1LJtzWP8=;
 b=G7jm/Yam0WwdVJCS/CDN+oXqZYSYYvANUNbi9M8uORILKNhtccbkQZWZFKWtYUh5zu
 fmXD4CB0/BQ1fmiNaDsgT/HtN7kekBsqKNfBNW/fwrll71WbOsGTX6Y6+7Et3XjziFWd
 nyVxkMKd6R46UT1KZ1n+/uPTcsrUkswjCAjQ4Jz1N0i4mm+ogzi0kfCQ/Oh4Z8sSc+dk
 IcYypzam4YUViIWFLkJD6YyC4EiL0EpeKVNYRkcxTr7UArkGuwenscO0m8tQ1DOMK4+Y
 FZh9KQXdhbXosPujic/K3gF+TOdXdXiZSGTbDlq5Gf4z9D0TmUS86dllE5azjIfLzdRk
 lDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=12xoJC8I/0jBFBQ6uTjCdcTJY4GOeJNX+Bl1LJtzWP8=;
 b=SZUQ4iGgKSqr4rD5CbVT8TDp1IwLyZ6q6me+OZdmvZ+ajo8L1g3009jJmfxQAmb5pT
 BGfJ8NUOLMRky2+UO7eTq91WMWnWegaok4YHJrOO+/wLamEwr8nU/MhHL+yhwacdml/v
 KlkKp84tDEHg28XyLjTy7BRGAXpsbPFHZRI2njzoJD/17PmQzveRR1nDTJfsIAbK2Xqm
 HIXT/v+M90xkj0yaLKnRA4I7a3nzOnJiihOhowSx8w6i3Xfn+GFBzsZPQBmJnCseblJ1
 w0V/vg7bna//JIKZUkhE88s8+2tdAa6mdmt0kKVKDyKh7KTHHilmDHbBy60t1u4BhVCk
 IuBg==
X-Gm-Message-State: AOAM531BlmWLRpxjEeSRx6uhCmiULkjcazVfOP/iwrddeIVf7mSfeSSx
 gu1OKWJG5mGFV/ZI+OM1Bw7cfL5sghA=
X-Google-Smtp-Source: ABdhPJxnIsUzsLKcT2K+8x1/eiGdYFczArt58MVmcFmfXRNXcC94kQ2ecJEGomo5nvJVw4qw+hWk4w==
X-Received: by 2002:a05:6808:1444:: with SMTP id
 x4mr3736124oiv.142.1618934888333; 
 Tue, 20 Apr 2021 09:08:08 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id y6sm4497057otk.42.2021.04.20.09.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 09:08:07 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [v7 4/4] arm64: dts: rockchip: add rk817 codec to Odroid Go
Date: Tue, 20 Apr 2021 11:07:47 -0500
Message-Id: <20210420160747.22942-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420160747.22942-1-macroalpha82@gmail.com>
References: <20210420160747.22942-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, heiko@sntech.de,
 devicetree@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, broonie@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 lee.jones@linaro.org
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
---
Changes in v7:
 - Removed ifdef around register definitions for MFD.
 - Replaced codec documentation with updates to MFD documentation.
 - Reordered elements in example to comply with upstream rules.
 - Added binding update back for Odroid Go Advance as requested.
 - Submitting patches from gmail now.
Changes in v6:
 - Included additional project maintainers for correct subsystems.
 - Removed unneeded compatible from DT documentation.
 - Removed binding update for Odroid Go Advance (will do in seperate series).
Changes in v5:
 - Move register definitions from rk817_codec.h to main rk808.h register
   definitions.
 - Add volatile register for codec bits.
 - Add default values for codec bits.
 - Removed of_compatible from mtd driver (not necessary).
 - Switched to using parent regmap instead of private regmap for codec.
Changes in v4:
 - Created set_pll() call.
 - Created user visible gain control in mic.
 - Check for return value of clk_prepare_enable().
 - Removed duplicate clk_prepare_enable().
 - Split DT documentation to separate commit.
Changes in v3:
 - Use DAPM macros to set audio path.
 - Updated devicetree binding (as every rk817 has this codec chip).
 - Changed documentation to yaml format.
 - Split MFD changes to separate commit.
Changes in v2:
 - Fixed audio path registers to solve some bugs.

 .../boot/dts/rockchip/rk3326-odroid-go2.dts   | 36 +++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
index 97fb93e1cc00..5356bcf6d99c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
@@ -161,6 +161,29 @@ blue_led: led-0 {
 		};
 	};
 
+	rk817-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "rockchip,rk817-codec";
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
+		simple-audio-card,cpu {
+			sound-dai = <&i2s1_2ch>;
+		};
+		simple-audio-card,codec {
+			sound-dai = <&rk817>;
+		};
+	};
+
 	vccsys: vccsys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v8_sys";
@@ -265,11 +288,14 @@ rk817: pmic@20 {
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
@@ -428,6 +454,10 @@ regulator-state-mem {
 				};
 			};
 		};
+
+		rk817_codec: codec {
+			mic-in-differential;
+		};
 	};
 };
 
@@ -439,6 +469,8 @@ &i2c1 {
 
 /* I2S 1 Channel Used */
 &i2s1_2ch {
+	resets = <&cru SRST_I2S1>, <&cru SRST_I2S1_H>;
+	reset-names = "reset-m", "reset-h";
 	status = "okay";
 };
 
-- 
2.25.1

