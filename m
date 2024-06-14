Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F12FC90911F
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2024 19:11:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C965DEC;
	Fri, 14 Jun 2024 19:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C965DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718385104;
	bh=DongN2WrMnI/UMIh+GSrnUbKlymeox8e6UvvASxRquM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QxL4XrJMGOfzavbNa1g5/nMlPderMc7o9Rv1rBDQc3ziqx2cxYGveIPTtdu5ZB/H8
	 aNE2dovMQUfhyxj6yYZYb9DGL2hmBCdvB49Szb05cBsKi+cEOp+L67ftWq7wOEc2L3
	 fCJpWFesFvXOZTxB3vXNZ679/rfh+JMD2lv/f4ZE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04FD3F805B3; Fri, 14 Jun 2024 19:11:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96BFEF805AF;
	Fri, 14 Jun 2024 19:11:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C20A0F80448; Fri, 14 Jun 2024 19:11:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 482B3F800E9
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 19:10:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 482B3F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=xf+8F29G
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-36087277246so153071f8f.3
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Jun 2024 10:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718385056;
 x=1718989856; darn=alsa-project.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mf6yUku1WsapVglWNtUv6/O+5axMyNpYzJDqapstpgI=;
        b=xf+8F29G1VoqF1M5H5SrbzsPLuR15Lc+zyzlsDSjk1+xmFP6t0hvXVXxBJizZbMRnx
         neABDNnZaq7u/WC9RoSjvEJkhT+BxJ/3C7GNAiDB7DzX5pXo/kA3UM+YCFLb6lYyaBqd
         3xtr6YdQzzKhpLWjYv5AspYp2FYY2VtJ07UMCYjgYApbGkC+r2BJE77nPNCSY8cWpkc4
         rvuDhSXJdfgdlZt5QHZECasDNcnfDKCfsAGwDA1d66Wy1+RCHzf/urqhVakGDvI3/6M8
         iyirmot/S8y2hrh5bUrptTk5Yo/LvTKknmK/QCsXSIsSk6khI/LceTWFg8dDeVqUgWRP
         0qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718385056; x=1718989856;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mf6yUku1WsapVglWNtUv6/O+5axMyNpYzJDqapstpgI=;
        b=hhL1fjY+FhIwpuYX8E5uR1I/+JYK95cGL1RTxpDVRP42uCOrWD+M6gY49t3DZVvCa4
         Ozk4lA6TYjVoAmX4Q/QHqS7SSHf78cbgLKjTcim38vqtN/2hCZHFOUWCMXXOKWwCA8f5
         h98rjNUNBBB7UaQ4CHPtFMIo2rBVh5ZUx7n+zryIMFsD0ngWDk3toHrF09sFf+FBhTRR
         WMSZ8L/+1qRXixqn1l0u9z7Zdu5dZ4Mp7G5PfHBLMw7C3+69xlMMDsJacsPgRGfiphLT
         yopMQ8tmq0a3O2DLPALANdL3a/RjGeNypfDEAkVVQnX0XLXoprGdSxUDu813MA36Ai4Y
         U0+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf9Anx0+ZGTtIDCnkKgx+ABbQJYcAzjwKBtr/aqy8KK3roiZyAeCirw3xWU9PpTee2T/cnp/HC76HSyCnrWCC8+KRFEFQTlbIK5Qo=
X-Gm-Message-State: AOJu0Yyf6yMDfEcAWi192nI8Y+jCtZb+u8fJtg6p180sEvgOSlF6mjG7
	BoWY6HP8LGynr22Nci3Tc9k+19o3dsgwbw+H3PxqWdMhZpSsL1TT8ljDGIOMD8M=
X-Google-Smtp-Source: 
 AGHT+IFrxIoGCdBaSczBFoKFT3zlG2Ldu6whg4La7ctu0qqi5/8nr/FTGdwS++LqU21fT7BEiFPykw==
X-Received: by 2002:a05:6000:1d99:b0:360:876e:16b6 with SMTP id
 ffacd0b85a97d-360876e1863mr176218f8f.70.1718385055640;
        Fri, 14 Jun 2024 10:10:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5374:7bd2:13de:845])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509348esm4916265f8f.17.2024.06.14.10.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 10:10:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  alsa-devel@alsa-project.org,  linux-sound@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RFC 3/3] arm64: dts: amlogic: add clock and clock-names
 to sound cards
In-Reply-To: 
 <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-3-9f57d9e01834@linaro.org>
	(Neil Armstrong's message of "Fri, 14 Jun 2024 18:24:03 +0200")
References: 
 <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-0-9f57d9e01834@linaro.org>
	<20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-3-9f57d9e01834@linaro.org>
Date: Fri, 14 Jun 2024 19:10:54 +0200
Message-ID: <1j34pfih5t.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: DKVM4RLOJPETVE3THNKYUXIMXIBVRRVA
X-Message-ID-Hash: DKVM4RLOJPETVE3THNKYUXIMXIBVRRVA
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DKVM4RLOJPETVE3THNKYUXIMXIBVRRVA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri 14 Jun 2024 at 18:24, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> Add the missing clocks and clock-names in the sound card nodes
> according the the AXG and GX sound card bindings changes.
>
> It solved the following errors:
> sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
>     from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
> sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
>     from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
> sound: 'anyOf' conditional failed, one must be fixed:
>     'clocks' is a required property
>     '#clock-cells' is a required property
>     from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts                      | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts                   | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts               | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts                   | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts                     | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts                  | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts       | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi                | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts                 | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts               | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts                   | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts          | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi               | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts               | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts              | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts                | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi              | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi                 | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts                  | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts                | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts              | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts                 | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts                     | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts                     | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi                | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts                | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts              | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts        | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts                | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts          | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts     | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts        | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts                | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts               | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts                 | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts                  | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi                  | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi         | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts           | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts                | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts           | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts               | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts                   | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi                   | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts                    | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts              | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts                   | 4 ++++
>  48 files changed, 192 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> index 7ed526f45175..2228ed88b977 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> @@ -268,6 +268,10 @@ sound {
>  				"Speaker1 Right", "SPK1 OUT_D",
>  				"Linein AINL", "Linein",
>  				"Linein AINR", "Linein";
> +		clocks = <&clkc CLKID_HIFI_PLL>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_HIFI_PLL>,

Here the HiFi PLL shows the naming is kind of odd.
As explained in the bindings, I don't think is useful. 

For the record, on AXG the HiFi PLL works well and should be used.

On G12/SM1 there is slight instabily with the HiFi - probably similar to
the one affecting the SYS PLL / DVFS. It can be used with a small hack
but it is safer to use the MPLL2 instead.

>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
> index af211d8f3952..0bd298920191 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
> @@ -176,6 +176,10 @@ sound {
>  				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
>  				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> index 15b9bc280706..b44c0802d47c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> @@ -138,6 +138,10 @@ sound {
>  				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
>  				"TDM_B Playback", "TDMOUT_B OUT";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> index 61cb8135a392..3ddd0e2c4710 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> @@ -201,6 +201,10 @@ sound {
>  				"TODDR_B IN 1", "TDMIN_B OUT",
>  				"TODDR_C IN 1", "TDMIN_B OUT";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> index 0e239939ade6..42ac5dcdb19d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> @@ -238,6 +238,10 @@ sound {
>  				"Lineout", "10U2 OUTL",
>  				"Lineout", "10U2 OUTR";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> index 05c7a1e3f1b7..0ee32d7bceae 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> @@ -158,6 +158,10 @@ sound {
>  				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
>  				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts
> index 13d478f9c891..cdc9d387d9be 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts
> @@ -70,6 +70,10 @@ sound {
>  				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
>  				"TDM_B Playback", "TDMOUT_B OUT";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
> index 003efed529ba..0af7ba8ec896 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
> @@ -79,6 +79,10 @@ sound {
>  				"LINPUT1", "Mic Jack",
>  				"Mic Jack", "MICB";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  					<&clkc CLKID_MPLL0>,
>  					<&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> index 6a346cb86a53..5136b062e19a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> @@ -194,6 +194,10 @@ sound {
>  				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
>  				"TDM_B Playback", "TDMOUT_B OUT";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
> index bb73e10b5e74..8356b881fb31 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
> @@ -48,6 +48,10 @@ sound {
>  				"TDMOUT_A IN 2", "FRDDR_C OUT 1",
>  				"TDM_A Playback", "TDMOUT_A OUT";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
> index 6eeedd54ab91..cc1156a225c1 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
> @@ -49,6 +49,10 @@ sound {
>  				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
>  				"TDM_B Playback", "TDMOUT_B OUT";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
> index 0da386cabe1a..4d1ef4d98391 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
> @@ -37,6 +37,10 @@ sound {
>  				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
>  				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> index eed2a23047ca..c58e551b0e95 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> @@ -234,6 +234,10 @@ sound {
>  				"Internal Speakers", "Speaker Amplifier OUTL",
>  				"Internal Speakers", "Speaker Amplifier OUTR";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index d80dd9a3da31..1f4674bbebda 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -71,6 +71,10 @@ sound {
>  				"Lineout", "U19 OUTL",
>  				"Lineout", "U19 OUTR";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
> index e26f3e3258e1..058453f547b4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
> @@ -39,6 +39,10 @@ sound {
>  				"TODDR_B IN 6", "TDMIN_LB OUT",
>  				"TODDR_C IN 6", "TDMIN_LB OUT";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> index 8445701100d0..bf434fcee31d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> @@ -176,6 +176,10 @@ sound {
>  				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
>  				"TDM_B Playback", "TDMOUT_B OUT";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
> index 6396f190d703..0ad35693ccb3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
> @@ -32,6 +32,10 @@ sound {
>  				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
>  				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
> index efd662a452e8..db76787386ac 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
> @@ -194,6 +194,10 @@ sound {
>  				"AU2 INR", "ACODEC LORN",
>  				"7J4-14 LEFT", "AU2 OUTL",
>  				"7J4-11 RIGHT", "AU2 OUTR";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
> index 08d6b69ba469..4e2cbd9d60f2 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
> @@ -129,6 +129,10 @@ sound {
>  				"AU2 INR", "ACODEC LORN",
>  				"Lineout", "AU2 OUTL",
>  				"Lineout", "AU2 OUTR";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> index f28452b9f00f..01c47d1545b8 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> @@ -45,6 +45,10 @@ button-reset {
>  	sound {
>  		compatible = "amlogic,gx-sound-card";
>  		model = "KII-PRO";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> index 1fd2e56e6b08..a7a2767a42a1 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> @@ -135,6 +135,10 @@ hdmi_connector_in: endpoint {
>  	sound {
>  		compatible = "amlogic,gx-sound-card";
>  		model = "NANOPI-K2";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
> index cca129ce2c58..8c01a43e4e7a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
> @@ -142,6 +142,10 @@ hdmi_connector_in: endpoint {
>  	sound {
>  		compatible = "amlogic,gx-sound-card";
>  		model = "NEXBOX-A95X";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index c37cc6b036cd..6a794f72544d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -177,6 +177,10 @@ hdmi_connector_in: endpoint {
>  	sound {
>  		compatible = "amlogic,gx-sound-card";
>  		model = "ODROID-C2";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
> index 7f94716876d3..3ba3681fe3ba 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
> @@ -68,6 +68,10 @@ button-menu {
>  	sound {
>  		compatible = "amlogic,gx-sound-card";
>  		model = "P200";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
> index 6f81eed83bec..32e1c272052e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
> @@ -17,6 +17,10 @@ / {
>  	sound {
>  		compatible = "amlogic,gx-sound-card";
>  		model = "P201";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> index 255e93a0b36d..cbb847b8d5fe 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> @@ -108,6 +108,10 @@ sdio_pwrseq: sdio-pwrseq {
>  	sound {
>  		compatible = "amlogic,gx-sound-card";
>  		model = "VEGA-S95";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
> index af9ea32a2876..b5b0ced8ecff 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
> @@ -16,6 +16,10 @@ / {
>  	sound {
>  		compatible = "amlogic,gx-sound-card";
>  		model = "WETEK-HUB";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
> index 376760d86766..29749b053e1e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
> @@ -48,6 +48,10 @@ button {
>  	sound {
>  		compatible = "amlogic,gx-sound-card";
>  		model = "WETEK-PLAY2";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
> index 90ef9c17d80b..6aef181ca2ce 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
> @@ -123,6 +123,10 @@ sound {
>  				"Speaker", "9J5-2 RIGHT";
>  		audio-routing = "9J5-3 LEFT", "ACODEC LOLN",
>  				"9J5-2 RIGHT", "ACODEC LORN";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
> index 08a4718219b1..fdc387c9b202 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
> @@ -128,6 +128,10 @@ sound {
>  				"AU2 INR", "ACODEC LORN",
>  				"Lineout", "AU2 OUTL",
>  				"Lineout", "AU2 OUTR";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> index fea65f20523a..065a7fc9d2fc 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> @@ -67,6 +67,10 @@ hdmi_connector_in: endpoint {
>  	sound {
>  		compatible = "amlogic,gx-sound-card";
>  		model = "KHADAS-VIM";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
> index 63b20860067c..2fe5c6686657 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
> @@ -160,6 +160,10 @@ vcc_1v8: regulator-vcc-1v8 {
>  	sound {
>  		compatible = "amlogic,gx-sound-card";
>  		model = "LIBRETECH-CC-V2";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> index 8b26c9661be1..4b40794721fd 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> @@ -142,6 +142,10 @@ sound {
>  				"AU2 INR", "ACODEC LORN",
>  				"Lineout", "AU2 OUTL",
>  				"Lineout", "AU2 OUTR";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
> index 9b4ea6a49398..98c6251142c4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
> @@ -50,6 +50,10 @@ sound {
>  				"AU2 INR", "ACODEC LORN",
>  				"Lineout", "AU2 OUTL",
>  				"Lineout", "AU2 OUTR";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> index 07e7c3bedea0..d97fca396e0e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> @@ -150,6 +150,10 @@ wifi32k: wifi32k {
>  	sound {
>  		compatible = "amlogic,gx-sound-card";
>  		model = "KHADAS-VIM2";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> index ad2dd4ad0a31..71ee228781fe 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> @@ -86,6 +86,10 @@ hdmi_connector_in: endpoint {
>  	sound {
>  		compatible = "amlogic,gx-sound-card";
>  		model = "NEXBOX-A1";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> index d05dde8da5c5..81387968f51d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> @@ -101,6 +101,10 @@ sdio_pwrseq: sdio-pwrseq {
>  	sound {
>  		compatible = "amlogic,gx-sound-card";
>  		model = "RBOX-PRO";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>,
>  				  <&clkc CLKID_MPLL2>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> index e78cc9b577a0..bd4ffc07e456 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> @@ -182,6 +182,10 @@ sound {
>  				"TODDR_B IN 0", "TDMIN_A OUT",
>  				"TODDR_C IN 0", "TDMIN_A OUT";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi b/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
> index 082b72703cdf..746ce70b545b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
> @@ -200,6 +200,10 @@ sound {
>  				 <&tdmin_a>, <&tdmin_b>, <&tdmin_c>,
>  				 <&dioo2133>;
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
> index 9b2eb6e42651..4cca62ddd04a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
> @@ -22,6 +22,10 @@ sound {
>  				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
>  				"TDM_B Playback", "TDMOUT_B OUT";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
> index 6e34fd80ed71..4a2aef4948ff 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
> @@ -22,6 +22,10 @@ sound {
>  				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
>  				"TDM_B Playback", "TDMOUT_B OUT";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
> index 586034316ec3..3203280bffe7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
> @@ -22,6 +22,10 @@ sound {
>  				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
>  				"TDM_B Playback", "TDMOUT_B OUT";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> index f045bf851638..6db7c5ccdbbc 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> @@ -57,6 +57,10 @@ sound {
>  				"Lineout", "ACODEC LOLP",
>  				"Lineout", "ACODEC LORP";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
> index e6e9410d40cb..918ace039da6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
> @@ -22,6 +22,10 @@ sound {
>  				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
>  				"TDM_B Playback", "TDMOUT_B OUT";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> index 951eb8e3f0c0..44d2346482a5 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -174,6 +174,10 @@ sound {
>  				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
>  				"TDM_B Playback", "TDMOUT_B OUT";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> index 3581e14cbf18..19b712e45066 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> @@ -239,6 +239,10 @@ sound {
>  				"TODDR_B IN 1", "TDMIN_B OUT",
>  				"TODDR_C IN 1", "TDMIN_B OUT";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
> index fc9b961133cd..c913af910208 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
> @@ -22,6 +22,10 @@ sound {
>  				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
>  				"TDM_B Playback", "TDMOUT_B OUT";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts
> index 9ea969255b4f..49978855c2d9 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts
> @@ -22,6 +22,10 @@ sound {
>  				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
>  				"TDM_B Playback", "TDMOUT_B OUT";
>  
> +		clocks = <&clkc CLKID_MPLL2>,
> +			 <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>;
> +		clock-names = "mpll0", "mpll1", "mpll2";
>  		assigned-clocks = <&clkc CLKID_MPLL2>,
>  				  <&clkc CLKID_MPLL0>,
>  				  <&clkc CLKID_MPLL1>;

-- 
Jerome
