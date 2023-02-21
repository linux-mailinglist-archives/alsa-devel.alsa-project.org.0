Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7177769E7B1
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 19:40:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 751F9EB6;
	Tue, 21 Feb 2023 19:39:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 751F9EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677004818;
	bh=kuRU1eOF3bgVGSQXfM4YtrxSHQ/HVckKu2gKwSWP8f8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lakyl9/Wyj3puUYQFmOUy+SMnKCgy4ehj5F6/AaZJwQmf16RvIR4KX+nVtKy8eKcA
	 oIsD9rVsNz2e1dDymomFqgrh92b5USvKUle89tdFtS5vdos2JEBzjc2fJCAEId+Q0C
	 D0uaoakrhP1Nic59zCetTMSRLIxlhV0LIvNuhdT8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 681E7F80588;
	Tue, 21 Feb 2023 19:37:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24E1EF8047C; Tue, 21 Feb 2023 19:32:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F97CF800BA
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 19:32:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F97CF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NWW0looc
Received: by mail-ed1-x532.google.com with SMTP id cq23so20731382edb.1
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Feb 2023 10:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQSmh32OKE33I5420mu9+Fe2dybwDMzPyqZp98Es5A0=;
        b=NWW0loock5oBID3QFLzVq8K9EpVNYl+ZYmsU652aRgHtxBKeNfj8DPn7GmSYs/ttfZ
         sewS3t7yAWMaLsrLFpM20K9bzEbiga0bMCN6Q1YEmbwN0DCnD4VYXFRhq0Bf22glKT3j
         9ehzd27SMlkUawFEBbW1dlxeCo9EH52YqwvgwEjhMURX18dliuMncwqZStFByf6z9OA7
         6aUSJy1Kfwi2nwHPIG21i5UQo4g2uyHqY012/k1DuJVB57C2RAMteAafi9GTxvY8YmgD
         cMuLN9PWNsYrvyaNfhFkaE/89jEpoSXltkVWUB0ugYGreMFxCMpS62PuwvebAs3GujFe
         +8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQSmh32OKE33I5420mu9+Fe2dybwDMzPyqZp98Es5A0=;
        b=MOKvoJfJZwB/A1RpytfGVl7ojpllULYVxt3IIDGmpurR2HCEMw+EKxSDKBXtQh1aQK
         HXcypHb8QrRtnbBmTYSO1LHJM/IoSyNeI/251XjUOwr+u3jHfKbXhPlFB+rjcwFAu6PO
         Wctm7ssGcXL8Qvh510KesNplNrO0FlTG9DjWUwvBPnPS2Utz/aSWrD9I5Daa7B5U1qb2
         /C814X8lgiYBztUp+8oW55ZFj+5z6VjTyujEXrZNLGDNvVPJQX9G403SdiZ8ZgGkoyMB
         mH9odx+5tx3vbiKEU97rwnOKHc5teFcvQxLQKFeyjl6I7QCjXF+R0GZgeaeEaXw0Nimx
         zwiA==
X-Gm-Message-State: AO0yUKW2V5tzckqxSOi2M1HMxnA+EW2BTt9qRXKqWIZSV+54lWZi0LPt
	jwxxILKagneqJkFAhMX9WMc=
X-Google-Smtp-Source: 
 AK7set+fSmOPE7HCxYwmGeNARvkMtewnxLHluxAnobePLwdWIIZgbTWFuCdB66FrKtK6B5zRmhBjXg==
X-Received: by 2002:a05:6402:516e:b0:474:a583:2e1a with SMTP id
 d14-20020a056402516e00b00474a5832e1amr5711519ede.12.1677004355491;
        Tue, 21 Feb 2023 10:32:35 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a50c3c3000000b004af5aa16fcasm169102edf.66.2023.02.21.10.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:32:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 10/10] ARM: tegra: transformers: bind FM34NE DSP on
 supported devices
Date: Tue, 21 Feb 2023 20:32:11 +0200
Message-Id: <20230221183211.21964-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230221183211.21964-1-clamor95@gmail.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JU5NCZDQEQ2TLENL2CSKQT5C5HHYIG7V
X-Message-ID-Hash: JU5NCZDQEQ2TLENL2CSKQT5C5HHYIG7V
X-Mailman-Approved-At: Tue, 21 Feb 2023 18:36:36 +0000
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JU5NCZDQEQ2TLENL2CSKQT5C5HHYIG7V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

FM34NE is mandatory for correct sound work on ASUS Transformers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/tegra20-asus-tf101.dts      | 14 +++++++++
 arch/arm/boot/dts/tegra30-asus-tf201.dts      | 29 +++++++++++++++++++
 arch/arm/boot/dts/tegra30-asus-tf300t.dts     | 29 +++++++++++++++++++
 arch/arm/boot/dts/tegra30-asus-tf300tg.dts    | 19 ++++++++++++
 arch/arm/boot/dts/tegra30-asus-tf700t.dts     | 19 ++++++++++++
 .../arm/boot/dts/tegra30-pegatron-chagall.dts | 27 +++++++++++++++++
 6 files changed, 137 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-asus-tf101.dts b/arch/arm/boot/dts/tegra20-asus-tf101.dts
index 8d0613567e82..8a51a4c53014 100644
--- a/arch/arm/boot/dts/tegra20-asus-tf101.dts
+++ b/arch/arm/boot/dts/tegra20-asus-tf101.dts
@@ -493,6 +493,20 @@ i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
+		/* Fortemedia FM34NE voice processor */
+		dsp@60 {
+			compatible = "asus,tf101-dsp", "fortemedia,fm34";
+			reg = <0x60>;
+
+			bypass-gpios = <&gpio TEGRA_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_LOW>;
+
+			vdd-supply = <&vdd_1v8_sys>;
+
+			clocks = <&tegra_car TEGRA20_CLK_CDEV1>;
+			clock-names = "mclk";
+		};
+
 		/* Aichi AMI306 digital compass */
 		magnetometer@e {
 			compatible = "asahi-kasei,ak8974";
diff --git a/arch/arm/boot/dts/tegra30-asus-tf201.dts b/arch/arm/boot/dts/tegra30-asus-tf201.dts
index 47865deeb88a..e214fc23609e 100644
--- a/arch/arm/boot/dts/tegra30-asus-tf201.dts
+++ b/arch/arm/boot/dts/tegra30-asus-tf201.dts
@@ -60,6 +60,25 @@ bluetooth {
 		};
 	};
 
+	i2c@7000c000 {
+		/* Fortemedia FM34NE voice processor */
+		dsp@60 {
+			compatible = "asus,tf201-dsp", "fortemedia,fm34";
+			reg = <0x60>;
+
+			bypass-gpios = <&gpio TEGRA_GPIO(BB, 6) GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio TEGRA_GPIO(O, 3) GPIO_ACTIVE_LOW>;
+
+			vdd-supply = <&vdd_1v8_dsp>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			clock-names = "mclk";
+
+			assigned-clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_EXTERN1>;
+		};
+	};
+
 	i2c@7000c400 {
 		/* Atmel MXT768E touchscreen */
 		touchscreen@4d {
@@ -606,6 +625,16 @@ haptic-feedback {
 		vcc-supply = <&vdd_3v3_sys>;
 	};
 
+	vdd_1v8_dsp: regulator-dsp {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_dsp";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio TEGRA_GPIO(U, 5) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_1v8_vio>;
+	};
+
 	sound {
 		compatible = "asus,tegra-audio-rt5631-tf201",
 			     "nvidia,tegra-audio-rt5631";
diff --git a/arch/arm/boot/dts/tegra30-asus-tf300t.dts b/arch/arm/boot/dts/tegra30-asus-tf300t.dts
index 78f78cca337a..2dcf0e1f6ca2 100644
--- a/arch/arm/boot/dts/tegra30-asus-tf300t.dts
+++ b/arch/arm/boot/dts/tegra30-asus-tf300t.dts
@@ -68,6 +68,25 @@ bluetooth {
 		};
 	};
 
+	i2c@7000c000 {
+		/* Fortemedia FM34NE voice processor */
+		dsp@60 {
+			compatible = "asus,tf300t-dsp", "fortemedia,fm34";
+			reg = <0x60>;
+
+			bypass-gpios = <&gpio TEGRA_GPIO(BB, 6) GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio TEGRA_GPIO(O, 3) GPIO_ACTIVE_LOW>;
+
+			vdd-supply = <&vdd_1v8_dsp>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			clock-names = "mclk";
+
+			assigned-clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_EXTERN1>;
+		};
+	};
+
 	i2c@7000c400 {
 		/* Elantech EKTH1036 touchscreen */
 		touchscreen@10 {
@@ -999,6 +1018,16 @@ display-panel {
 		compatible = "innolux,g101ice-l01";
 	};
 
+	vdd_1v8_dsp: regulator-dsp {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_dsp";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio TEGRA_GPIO(P, 3) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_1v8_vio>;
+	};
+
 	sound {
 		compatible = "asus,tegra-audio-wm8903-tf300t",
 			     "nvidia,tegra-audio-wm8903";
diff --git a/arch/arm/boot/dts/tegra30-asus-tf300tg.dts b/arch/arm/boot/dts/tegra30-asus-tf300tg.dts
index 82c51e177a70..7f23021611a4 100644
--- a/arch/arm/boot/dts/tegra30-asus-tf300tg.dts
+++ b/arch/arm/boot/dts/tegra30-asus-tf300tg.dts
@@ -164,6 +164,25 @@ bluetooth {
 		};
 	};
 
+	i2c@7000c000 {
+		/* Fortemedia FM34NE voice processor */
+		dsp@60 {
+			compatible = "asus,tf300t-dsp", "fortemedia,fm34";
+			reg = <0x60>;
+
+			bypass-gpios = <&gpio TEGRA_GPIO(BB, 6) GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio TEGRA_GPIO(O, 3) GPIO_ACTIVE_LOW>;
+
+			vdd-supply = <&vdd_1v8_vio>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			clock-names = "mclk";
+
+			assigned-clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_EXTERN1>;
+		};
+	};
+
 	i2c@7000c400 {
 		/* Elantech EKTH1036 touchscreen */
 		touchscreen@10 {
diff --git a/arch/arm/boot/dts/tegra30-asus-tf700t.dts b/arch/arm/boot/dts/tegra30-asus-tf700t.dts
index 766225ebdeab..bbb33119780e 100644
--- a/arch/arm/boot/dts/tegra30-asus-tf700t.dts
+++ b/arch/arm/boot/dts/tegra30-asus-tf700t.dts
@@ -85,6 +85,25 @@ bluetooth {
 		};
 	};
 
+	i2c@7000c000 {
+		/* Fortemedia FM34NE voice processor */
+		dsp@60 {
+			compatible = "asus,tf700t-dsp", "fortemedia,fm34";
+			reg = <0x60>;
+
+			bypass-gpios = <&gpio TEGRA_GPIO(BB, 6) GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio TEGRA_GPIO(O, 3) GPIO_ACTIVE_LOW>;
+
+			vdd-supply = <&vdd_1v8_vio>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			clock-names = "mclk";
+
+			assigned-clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_EXTERN1>;
+		};
+	};
+
 	i2c@7000c400 {
 		/* Elantech ELAN-3024-7053 or 5184N FPC-1 REV: 2/3 touchscreen */
 		touchscreen@10 {
diff --git a/arch/arm/boot/dts/tegra30-pegatron-chagall.dts b/arch/arm/boot/dts/tegra30-pegatron-chagall.dts
index 6e24b095713b..007ba3f3e95e 100644
--- a/arch/arm/boot/dts/tegra30-pegatron-chagall.dts
+++ b/arch/arm/boot/dts/tegra30-pegatron-chagall.dts
@@ -1145,6 +1145,23 @@ lcd_ddc: i2c@7000c000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
+		/* Fortemedia FM34NE voice processor */
+		dsp@60 {
+			compatible = "pegatron,chagall-dsp", "fortemedia,fm34";
+			reg = <0x60>;
+
+			bypass-gpios = <&gpio TEGRA_GPIO(N, 3) GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio TEGRA_GPIO(N, 0) GPIO_ACTIVE_LOW>;
+
+			vdd-supply = <&vdd_1v8_dsp>;
+
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			clock-names = "mclk";
+
+			assigned-clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			assigned-clock-parents = <&tegra_car TEGRA30_CLK_EXTERN1>;
+		};
+
 		/* Wolfson Microelectronics WM8903 audio codec */
 		wm8903: audio-codec@1a {
 			compatible = "wlf,wm8903";
@@ -1500,6 +1517,16 @@ vdd_vbus_usb3: regulator-usb3 {
 		vin-supply = <&vdd_5v0_sys>;
 	};
 
+	vdd_1v8_dsp: regulator-dsp {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_1v8_dsp";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio TEGRA_GPIO(N, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vdd_1v8_vio>;
+	};
+
 	pmc@7000e400 {
 		status = "okay";
 		nvidia,invert-interrupt;
-- 
2.37.2

