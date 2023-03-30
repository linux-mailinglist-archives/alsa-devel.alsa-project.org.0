Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF94F6CFD31
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 09:44:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2D701EB;
	Thu, 30 Mar 2023 09:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2D701EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680162255;
	bh=bXQ9UO4qD+363g4fhaZgrxjihsvkrsAJAuMmk0koU9Y=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V/jvAIc+Sa6IhoRUwoESBz+2oZwAu7XpfhL5tD+2LPvLYwkraGaZcb26OJJJrTk1b
	 Sbxro1m6hIb+yClUbQRHKPUDOI13CmsgV0BB/IlsG7Yyt2h8cVWtMg9L67pHxwWsQH
	 V/iwes2VQv70Xsz6b75K0QFrmcCrLw973HZGCJnM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 299E9F80249;
	Thu, 30 Mar 2023 09:43:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85925F80272; Thu, 30 Mar 2023 09:43:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A02FCF80114
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 09:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A02FCF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VFgq8bbj
Received: by mail-lf1-x135.google.com with SMTP id y15so23369705lfa.7
        for <alsa-devel@alsa-project.org>;
 Thu, 30 Mar 2023 00:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680162191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4zuZ7AJ+urGiuWJ6O4WJPaOH0rhv1jf2+srORpX4K/Y=;
        b=VFgq8bbjUfROWOqUvRrcNQlzsT4ilwA91/7+wugNbVngG3akeaii4iHP53uBR9EcLb
         Hh56rV0B0S9udnu6ZDFMczEtvJXVwy0onkcaLV5VbrsiDczd+riGAa8hTNBIPANFl92X
         3KzX4vKfh+vEAbz7AfUKCOkajNPVmK9Hr/VxMWHu+SqKYhEzfTlNxDFYUzvScP54achN
         IXaGIQvolcSN1bSUu7gesQ1e4W5+12gSoKlzJFBqLYPgtQ1xsUh16R8S2P1s/PIpgdCs
         LXmljO/YjAyEbuJd3r5mLoku2RelpvshyDOkadbLy24PUTfm4fslCCv4E82JyiZiaYC/
         dMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680162191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4zuZ7AJ+urGiuWJ6O4WJPaOH0rhv1jf2+srORpX4K/Y=;
        b=zmLkW7kO+ODmBdg0BIIwRabzju0KamtnTuUXlXvclV/GWjNe0XkpY/Jv4CYhT+FfV8
         FrVnbkt14DzS+9jxUwa1pIaOhmIY1eMhOB+CvVwwtq1p51iFK5aSJIaOMw6TKBNFjVs9
         JfxJ7AnUM6l6TOtj2aj6Uu2h9QpHt3kxQG8+efHNg2jjvU7yPQdypaDdCaIOxzrdxhkQ
         OnKCt1GpYrgnGRNcwXNgF+1sJtvLGY307zBlQyqS1odTsVADwmypcpfEesp58X6vBKrg
         M/To6SSX74EhIuKPJkkR5gUVbJhDwrZtVoRvhUktwcmtGLOQUvKkQgnrXQkTwPqm8WGZ
         uzcQ==
X-Gm-Message-State: AAQBX9cGt74ybBzMOc4NKL9kNJcTxV0xO87ratM8ACIJkT1nHu7SbG3X
	PnxpozmLITaIauOVqyePu15xqA==
X-Google-Smtp-Source: 
 AKy350ZsAuQmcXRHoK+KQymYwvc+9+fujqTKeBRI50gKJ8CU7idfpzKcaaZoWyt6UOY23zghCl9J5g==
X-Received: by 2002:a19:ad44:0:b0:4db:38ba:ca61 with SMTP id
 s4-20020a19ad44000000b004db38baca61mr6228770lfd.53.1680162191597;
        Thu, 30 Mar 2023 00:43:11 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id
 f16-20020ac25330000000b004e844eeb555sm5801328lfh.214.2023.03.30.00.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 00:43:11 -0700 (PDT)
Message-ID: <d455a90a-7e63-2254-75cb-70cb26ae7483@linaro.org>
Date: Thu, 30 Mar 2023 09:43:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: add tdm node and sound card
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20230329153320.31390-1-walker.chen@starfivetech.com>
 <20230329153320.31390-4-walker.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230329153320.31390-4-walker.chen@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: C2JFSJQBY5YM2DDWT6KNIAH37YTCVWBJ
X-Message-ID-Hash: C2JFSJQBY5YM2DDWT6KNIAH37YTCVWBJ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C2JFSJQBY5YM2DDWT6KNIAH37YTCVWBJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/03/2023 17:33, Walker Chen wrote:
> Add the tdm controller node and sound card for the StarFive JH7110 SoC.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 87 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 34 ++++++++
>  2 files changed, 121 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 1155b97b593d..35137c2edf5d 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -62,6 +62,10 @@
>  	clock-frequency = <297000000>;
>  };
>  
> +&wm8960_mclk {
> +	clock-frequency = <24576000>;
> +};
> +
>  &i2srx_bclk_ext {
>  	clock-frequency = <12288000>;
>  };
> @@ -102,6 +106,14 @@
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c0_pins>;
>  	status = "okay";
> +
> +	wm8960: codec@1a {
> +		compatible = "wlf,wm8960";
> +		reg = <0x1a>;
> +		#sound-dai-cells = <0>;
> +
> +		wlf,shared-lrclk;
> +	};
>  };
>  
>  &i2c2 {
> @@ -214,6 +226,40 @@
>  			slew-rate = <0>;
>  		};
>  	};
> +
> +	tdm0_pins: tdm0-pins {
> +		tdm0-pins-tx {
> +			pinmux = <GPIOMUX(44, GPOUT_SYS_TDM_TXD,
> +					      GPOEN_ENABLE,
> +					      GPI_NONE)>;
> +			bias-pull-up;
> +			drive-strength = <2>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		tdm0-pins-rx {
> +			pinmux = <GPIOMUX(61, GPOUT_HIGH,
> +					      GPOEN_DISABLE,
> +					      GPI_SYS_TDM_RXD)>;
> +			input-enable;
> +		};
> +
> +		tdm0-pins-sync {
> +			pinmux = <GPIOMUX(63, GPOUT_HIGH,
> +					      GPOEN_DISABLE,
> +					      GPI_SYS_TDM_SYNC)>;
> +			input-enable;
> +		};
> +
> +		tdm0-pins-pcmclk {
> +			pinmux = <GPIOMUX(38, GPOUT_HIGH,
> +					      GPOEN_DISABLE,
> +					      GPI_SYS_TDM_CLK)>;
> +			input-enable;
> +		};
> +	};
>  };
>  
>  &uart0 {
> @@ -221,3 +267,44 @@
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";
>  };
> +
> +&tdm {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&tdm0_pins>;
> +	status = "okay";
> +};
> +
> +&sound0 {
> +	simple-audio-card,dai-link@0 {
> +		reg = <0>;
> +		status = "okay";

Why? Drop.

> +		format = "dsp_a";
> +		bitclock-master = <&dailink_master>;
> +		frame-master = <&dailink_master>;
> +
> +		widgets =

Drop line break.

> +				"Microphone", "Mic Jack",
> +				"Line", "Line In",
> +				"Line", "Line Out",
> +				"Speaker", "Speaker",
> +				"Headphone", "Headphone Jack";
> +		routing =

Drop unnecessary line break.

> +				"Headphone Jack", "HP_L",
> +				"Headphone Jack", "HP_R",
> +				"Speaker", "SPK_LP",
> +				"Speaker", "SPK_LN",
> +				"LINPUT1", "Mic Jack",
> +				"LINPUT3", "Mic Jack",
> +				"RINPUT1", "Mic Jack",
> +				"RINPUT2", "Mic Jack";
> +		cpu {
> +			sound-dai = <&tdm>;
> +		};
> +
> +		dailink_master:codec {

Missing space after label:.

> +			sound-dai = <&wm8960>;
> +			clocks = <&wm8960_mclk>;
> +			clock-names = "mclk";
> +		};
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index b503b6137743..a89158d1d7a6 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -210,6 +210,12 @@
>  		#clock-cells = <0>;
>  	};
>  
> +	wm8960_mclk: wm8960_mclk {

No underscores in node names. Use consistent naming - do you see here
any nodes named "mclk"?

Anyway this is some fake clock. Real clock should come out from wm8960.

> +		compatible = "fixed-clock";
> +		clock-output-names = "wm8960_mclk";
> +		#clock-cells = <0>;
> +	};
> +
>  	i2srx_bclk_ext: i2srx-bclk-ext-clock {
>  		compatible = "fixed-clock";
>  		clock-output-names = "i2srx_bclk_ext";
> @@ -375,6 +381,27 @@
>  			status = "disabled";
>  		};
>  
> +		tdm: tdm@10090000 {
> +			compatible = "starfive,jh7110-tdm";
> +			reg = <0x0 0x10090000 0x0 0x1000>;
> +			clocks = <&syscrg JH7110_SYSCLK_TDM_AHB>,
> +				 <&syscrg JH7110_SYSCLK_TDM_APB>,
> +				 <&syscrg JH7110_SYSCLK_TDM_INTERNAL>,
> +				 <&syscrg JH7110_SYSCLK_TDM_TDM>,
> +				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
> +				 <&tdm_ext>;
> +			clock-names = "tdm_ahb", "tdm_apb",
> +				      "tdm_internal", "tdm",
> +				      "mclk_inner", "tdm_ext";
> +			resets = <&syscrg JH7110_SYSRST_TDM_AHB>,
> +				 <&syscrg JH7110_SYSRST_TDM_APB>,
> +				 <&syscrg JH7110_SYSRST_TDM_CORE>;
> +			dmas = <&dma 20>, <&dma 21>;
> +			dma-names = "rx","tx";
> +			#sound-dai-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		stgcrg: clock-controller@10230000 {
>  			compatible = "starfive,jh7110-stgcrg";
>  			reg = <0x0 0x10230000 0x0 0x10000>;
> @@ -601,5 +628,12 @@
>  			#reset-cells = <1>;
>  			power-domains = <&pwrc JH7110_PD_VOUT>;
>  		};
> +
> +		sound0: snd-card0 {

1. Why card0?
2. Where is this node located? In MMIO bus? Run some basic checks on
your DTS before submitting upstream.
dtbs_check
dtbs W=1

3. Why this is even in the DTSI? This really looks wrong.

> +			compatible = "simple-audio-card";
> +			simple-audio-card,name = "Starfive-TDM-Sound-Card";
> +			#address-cells = <1>;
> +			#size-cells = <0>;

Best regards,
Krzysztof

