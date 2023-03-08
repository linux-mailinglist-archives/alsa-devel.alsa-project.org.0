Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ADC6B05BB
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 12:21:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42E7C17DA;
	Wed,  8 Mar 2023 12:20:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42E7C17DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678274493;
	bh=NCEqXDFJcikhMnkj7wYVdEEyXyxLWZT+pyJoo6Y5K24=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nOw1zfxI0QxLMQFfQT74kvILJElxOSByEYuMf9xUMDmPean5Juusz57JtHr9/4zWJ
	 NZO9ZRbtbclDxbCtitY0EVzFLo/dR6HOkbz1xYOZI7ITjNi1VxQJXb5YZ8JbumHuQf
	 6InKuPiSJqDGjubPz0j6axkD5C+VF0RvUhUoKRUs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F916F804B1;
	Wed,  8 Mar 2023 12:19:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5414FF80520; Wed,  8 Mar 2023 08:35:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9944F80236
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 08:35:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9944F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=H5ySkeSB
Received: by mail-ed1-x52f.google.com with SMTP id ay14so58315268edb.11
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Mar 2023 23:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678260926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sw6Zqne2z7YifJ5cyYa9t+wWI0sG16wXBTs6NvHN/Wk=;
        b=H5ySkeSBojKDLn9ziiQj/VN4R2TuGi3ptHrTGL5+4i5PLSHGhULRP4wKjh2za4ih0y
         f4ul79eEQClRwZ4ZnKbVfwJUnpet0B35mxxMelxp6jDpC+F4dGVRnRVk5keB25zkY/TJ
         DUnZM2M/Wa2cCVSY7KugZ4vC8fjO0wgOM6qWfcdkSuwqvw9FI/VP50LK5Bt0nTsDmCxm
         MqJmGjbOOg9OWnn4l4Vkq4K2ubOnb+Jv2KjkiHhX1UE38IH5XF0QQppUFdvIZI1zAd+I
         d1+CKSOIrsozHV55AVae1y4wcT7iN0iLucKtsptcPlfd7+Zxc1ULkF/DuceLxJHQR7td
         2UwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678260926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sw6Zqne2z7YifJ5cyYa9t+wWI0sG16wXBTs6NvHN/Wk=;
        b=HeYK2KEZnz9bc6UXcmB+LxsbKu0SP2MDK635CSWg9/7556Z44dksRp9hopB9wCEmwp
         kp35qeiyGeSaJWg8o8AarerqrySDSYHycVRcdrRuzCuQrCYRXxEs/uD6R/rpkt0r/9jL
         mh2lv89ePO/Rq25ARSUDsBOcDBhbwz3vsg+hITIAyXkMABTawKH2AaPZB2KEpDkzYPGx
         eQHl2K9J/fkNWVM9QpSi/3LVHHzSrd/8SbqvA5XuUTkvAyr2mqAaWZ2RwvxW1KCjinUV
         SeMcFJ4f09raQ8SbCLumeUjL5sVpJXDUv6vYG7eUsLdCeaTXqN+KIWVMEnDdAXE/cwvh
         0Crg==
X-Gm-Message-State: AO0yUKU13BlUcv7Am92CNO58XY4JxJEqUORhLlgD48crmbYP7KTA5aX7
	uLG2h0UYgoIoX5Pqc+AHCFM=
X-Google-Smtp-Source: 
 AK7set8pPSSbDp1FRM8zW0XDN2Qq8wKkVkZoYOk4mWKDRu3FvSALDJN6E4fhJ33O8slvQmGDeYGYxQ==
X-Received: by 2002:a17:906:b007:b0:8aa:c038:974c with SMTP id
 v7-20020a170906b00700b008aac038974cmr16145441ejy.54.1678260926392;
        Tue, 07 Mar 2023 23:35:26 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id
 h15-20020a1709062dcf00b008dffda52d71sm7051880eji.124.2023.03.07.23.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 23:35:26 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 3/8] ARM: tegra: transformers: update sound nodes
Date: Wed,  8 Mar 2023 09:34:57 +0200
Message-Id: <20230308073502.5421-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308073502.5421-1-clamor95@gmail.com>
References: <20230308073502.5421-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: V5GET4ZD3YZQYZ3J5AZMPY3JEXUXCPMO
X-Message-ID-Hash: V5GET4ZD3YZQYZ3J5AZMPY3JEXUXCPMO
X-Mailman-Approved-At: Wed, 08 Mar 2023 11:19:40 +0000
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V5GET4ZD3YZQYZ3J5AZMPY3JEXUXCPMO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

- fix headset detection in common device tree;
- diverge control and detect elements for mic;
- use GPIO mic detection on wm8903 devices;

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/tegra20-asus-tf101.dts               | 7 ++++---
 arch/arm/boot/dts/tegra30-asus-tf300t.dts              | 5 ++---
 arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi | 9 +++++----
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-asus-tf101.dts b/arch/arm/boot/dts/tegra20-asus-tf101.dts
index c39ddb462ad0..4ed50b8300b1 100644
--- a/arch/arm/boot/dts/tegra20-asus-tf101.dts
+++ b/arch/arm/boot/dts/tegra20-asus-tf101.dts
@@ -1179,15 +1179,16 @@ sound {
 			"Int Spk", "RON",
 			"Int Spk", "LOP",
 			"Int Spk", "LON",
-			"Mic Jack", "MICBIAS",
-			"IN1L", "Mic Jack";
+			"IN1L", "Int Mic",
+			"IN2L", "Headset Mic";
 
 		nvidia,i2s-controller = <&tegra_i2s1>;
 		nvidia,audio-codec = <&wm8903>;
 
 		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
 		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
-		nvidia,headset;
+		nvidia,mic-det-gpios = <&gpio TEGRA_GPIO(X, 1) GPIO_ACTIVE_LOW>;
+		nvidia,coupled-mic-hp-det;
 
 		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
 			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
diff --git a/arch/arm/boot/dts/tegra30-asus-tf300t.dts b/arch/arm/boot/dts/tegra30-asus-tf300t.dts
index f47434871a5c..78f78cca337a 100644
--- a/arch/arm/boot/dts/tegra30-asus-tf300t.dts
+++ b/arch/arm/boot/dts/tegra30-asus-tf300t.dts
@@ -1011,13 +1011,12 @@ sound {
 			"Int Spk", "RON",
 			"Int Spk", "LOP",
 			"Int Spk", "LON",
-			"IN1L", "Mic Jack",
-			"IN2L", "Mic Jack",
+			"IN1L", "Headset Mic",
+			"IN2L", "Headset Mic",
 			"DMICDAT", "Int Mic";
 
 		nvidia,audio-codec = <&wm8903>;
 		nvidia,spkr-en-gpios = <&wm8903 2 GPIO_ACTIVE_HIGH>;
-		nvidia,headset;
 	};
 };
 
diff --git a/arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi b/arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi
index 08ea9cb32d0e..42dae0f4759e 100644
--- a/arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi
@@ -550,7 +550,7 @@ spi1_mosi_px4 {
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
 
-			spi2_cs1_n_pw2 {
+			hp_detect {
 				nvidia,pins = "spi2_cs1_n_pw2";
 				nvidia,function = "spi2";
 				nvidia,pull = <TEGRA_PIN_PULL_UP>;
@@ -558,10 +558,10 @@ spi2_cs1_n_pw2 {
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
 
-			spi2_sck_px2 {
+			mic_detect {
 				nvidia,pins = "spi2_sck_px2";
 				nvidia,function = "spi2";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
@@ -1674,7 +1674,8 @@ sound {
 		nvidia,i2s-controller = <&tegra_i2s1>;
 
 		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
-		nvidia,hp-mute-gpios = <&gpio TEGRA_GPIO(X, 2) GPIO_ACTIVE_LOW>;
+		nvidia,mic-det-gpios = <&gpio TEGRA_GPIO(X, 2) GPIO_ACTIVE_LOW>;
+		nvidia,coupled-mic-hp-det;
 
 		clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
 			 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
-- 
2.37.2

