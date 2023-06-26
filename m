Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4497173E38C
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 17:38:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87D4984B;
	Mon, 26 Jun 2023 17:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87D4984B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687793916;
	bh=aN5m2zsPAFx9tTyQHlKnEzCdoouvYVunkPmyp6lumFg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bKbu58ok89+rLORKM2wH8YhjljS4qsEVIbmLfpbhPqEtOJSODpPSRfq9YIZMB/dKU
	 5shS+pUITsf4U5KDETqX49WPkvIERN/edxfbbblfQhRCPOkwUQBBl+8/XtFNJmGUn5
	 cslA+5zJ/2EpX3o9OQrYOI8m6evK5+/3/5XEf3sI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A74EF80093; Mon, 26 Jun 2023 17:37:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA855F80212;
	Mon, 26 Jun 2023 17:37:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24B33F80246; Mon, 26 Jun 2023 17:37:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8CD9F80093
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 17:37:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8CD9F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZEN2E34g
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fb7acaa7a5so993077e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 26 Jun 2023 08:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687793858; x=1690385858;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fKkRNwsx7OGC3htuJ6t0WseieN66ntYIb/oJ43FaioA=;
        b=ZEN2E34gix3aICYfeshAMb+/jjQoPlHL1kcE+BnBdWbhW8yG1Hc7rBJ7WOpX8yeNpf
         29u20Me+Mn9NKpGGTav87InA/JqZTZGCAH+efEmdB/FctQs/KwY9OGoD8uPVW3WlaEeA
         0FRyVSikgjIJK2yN318Q2ARbt55FsjaBhMGJEJIeRG/LKLWeN+MdwVRUmKl1Zt1lJNg+
         hTE2joZ9gHZr+bW63O4fWxMpSYiRqz+nkWyxDGc8ALWVnWK0qU7DljlonGMT7iHd+Sst
         +RJckniERxbN4R0G6I8b1z/0gildcKdDUqQxXuY6ZhMNhI1zhTZJTkMuoX7gHtnDsS4+
         gcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687793858; x=1690385858;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fKkRNwsx7OGC3htuJ6t0WseieN66ntYIb/oJ43FaioA=;
        b=agchTawg9NoitE5cUDUNZ10F1LT0VjghD6/zaGsfH9g4sSeKvOXt6FmJuq+ah3B5Ga
         cIcaIA0o1VnQkcAlyMg6JbUE5+kpWlfYrhsav2cKIyQpjnBe+5Caykvn9M77PPJgywBP
         k5OJgue0LSfe2v1R6nWnBUhguV6yvNGDMSvUS7Sjfkli2bgtJdhJ38q1W+nyroVnW/p1
         GZjiiLaRkAAYZ4caUq6+wmiRltHZHhFpYCPj1KMeoE81UpXLYC1AGKQyeJu+giuS+Z83
         y137B06oGi3jPnlfc8E6GEeyvey7881Z6Kdoz0AA0Nx+bYlnidR40rPTe/P0YF10UDAo
         lBqQ==
X-Gm-Message-State: AC+VfDyH1gAUbFQfwo3m709yuemfXq3i5bFA2oCMPk2jAfWalOtA/E4d
	1QZkc2huPffup49//QmJk27qTg==
X-Google-Smtp-Source: 
 ACHHUZ6jMYjdJZ1HoyYgAU6kz2QdE7jTIOjWgnOMeoRoMCekZ5ZDXQ2IpPk81NPGk7My2L/36+mmzg==
X-Received: by 2002:a05:6512:3290:b0:4f7:5f9e:fc59 with SMTP id
 p16-20020a056512329000b004f75f9efc59mr16963278lfe.39.1687793857818;
        Mon, 26 Jun 2023 08:37:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c220700b003fa999cefc0sm2350762wml.36.2023.06.26.08.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 08:37:37 -0700 (PDT)
Message-ID: <2a0154ec-7949-f1b1-760f-3ba64d2cff3f@linaro.org>
Date: Mon, 26 Jun 2023 17:37:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 5/5] riscv: dts: starfive: Add JH7110 PWM-DAC support
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230626110909.38718-1-hal.feng@starfivetech.com>
 <20230626110909.38718-6-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230626110909.38718-6-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZSL7X3HNKIUGUJ5ZRHK2GQPMMDBZTVFF
X-Message-ID-Hash: ZSL7X3HNKIUGUJ5ZRHK2GQPMMDBZTVFF
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSL7X3HNKIUGUJ5ZRHK2GQPMMDBZTVFF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26/06/2023 13:09, Hal Feng wrote:
> Add PWM-DAC support for StarFive JH7110 SoC.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 50 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 13 +++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 19b5954ee72d..5ca66a65e722 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -36,6 +36,34 @@ gpio-restart {
>  		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
>  		priority = <224>;
>  	};
> +
> +	pwmdac_dit: pwmdac-dit {
> +		compatible = "starfive,jh7110-pwmdac-dit";
> +		#sound-dai-cells = <0>;
> +	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "StarFive-PWMDAC-Sound-Card";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		simple-audio-card,dai-link@0 {
> +			reg = <0>;
> +			format = "left_j";
> +			bitclock-master = <&sndcpu0>;
> +			frame-master = <&sndcpu0>;
> +			status = "okay";

Drop

> +
> +			sndcpu0: cpu {
> +				sound-dai = <&pwmdac>;
> +			};
> +
> +			codec {
> +				sound-dai = <&pwmdac_dit>;

You said it is a transmitter, not a codec...


Best regards,
Krzysztof

