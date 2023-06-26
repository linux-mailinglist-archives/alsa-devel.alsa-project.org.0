Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DACE73E371
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 17:35:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB6537F8;
	Mon, 26 Jun 2023 17:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB6537F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687793706;
	bh=O0ZKgRHxWNhGTRw6SnVkPj26D7v9pIG0WksxFjbVek4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JiSpHOtStV1J+kTWL7WeuOR+2cPlUSJOwLYvFwEVghkwJ0nJidynLhjM0BAF+7C0h
	 m2tPsrynWy2CF9MBHIaROqJj7vMahPLlorsLf+6iTyCD1TEBEGZq4NwIc/sY2NwNj7
	 vqIKj2uBWR3g2CMBZ/Tl8O7YnUe36Gt1TuGo6yM0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72B58F8053B; Mon, 26 Jun 2023 17:34:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30270F80431;
	Mon, 26 Jun 2023 17:34:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7709F80093; Mon, 26 Jun 2023 17:34:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10FEEF80093
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 17:34:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10FEEF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FU977iSC
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fb41682472so2081775e87.2
        for <alsa-devel@alsa-project.org>;
 Mon, 26 Jun 2023 08:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687793640; x=1690385640;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ya1oHLhK49gH69AdTB5fxakgV4R1n474hp6YX3YudTQ=;
        b=FU977iSCGRyiI5lsFP8aGlOyB7y+B3rjbyHZvA5XqDSDOYFhQiuLWqlqxWu2HvLAKE
         ghINrrtM6m85L1qa1RI7MU7ym7CASmcJNM3F7EGQ+6APgNLr6g5BvGaXzOz3eU5MK5C7
         +j9DENN1SRhQw86lq0dGNToWRNsglX69G0pIk/NjjQrSV1pXtkUcn5+WpZtcpIN/gVCZ
         tNv/W8D5J+cjnoXYjV5am6ZCN5HqjVNQ2u80dzglRQcTPBj8FLFXkMjdz3a0jeXlXasj
         QqCbadPYTEGKETZzdVa2vWrUylxveetltTrnOENcNxeDbbyeAij0Bu1WwtTMXTlrHXik
         cubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687793640; x=1690385640;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ya1oHLhK49gH69AdTB5fxakgV4R1n474hp6YX3YudTQ=;
        b=gxbSSO2F3YXY90DMHzqW5LX3TPNsHDrKhfHVIyJZALgiGwUJyGhVUsaGjFfFLy+r4R
         io3iux7vuslQDPXuBNJaILbGvkpCB04evYqdPe/cv2lBvP6BgI4urYEPnKG4lsrp1u7O
         HZaXVr+8FP3ZllrYDz2m3aZAlsMsQvjterSWJGI1zXCxUV7oLaPZXV0SkIV/F1kvW7oI
         gwgiR5tT1U3+pO7gm4sP+7ENPwjL7c5nPlJSdtT8B+jJm2Xo8hsdfh4Ghvyym2rx9OZo
         966IGb6xaBWX+UCwmVqV424c4GP6yZxXskwrcnpS9nTKLtMLJ0WC+kv/PLZXeWnilBiV
         ZXrA==
X-Gm-Message-State: AC+VfDztEFjSplZenKdZSV/j5hsZqlNmUhc++R/flgnbmJgdxlNYZ3tC
	O3YXx8EkLKXGOCyDBFKM9wUwBg==
X-Google-Smtp-Source: 
 ACHHUZ4E0kOOnagiFcXwOV4l3ulb3LBPffWv8GdF6WdTtE8cphcbzNVQAT2Yl97D2BwtkrQNkCuX6A==
X-Received: by 2002:a19:7718:0:b0:4f8:6e6e:3f42 with SMTP id
 s24-20020a197718000000b004f86e6e3f42mr14189892lfc.14.1687793640007;
        Mon, 26 Jun 2023 08:34:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 z20-20020a7bc7d4000000b003f90067880esm10977810wmk.47.2023.06.26.08.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 08:33:59 -0700 (PDT)
Message-ID: <4c421206-39a2-d98e-f75d-f5d269e881ff@linaro.org>
Date: Mon, 26 Jun 2023 17:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 2/5] ASoC: codecs: Add StarFive JH7110 dummy PWM-DAC
 transmitter driver
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
 <20230626110909.38718-3-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230626110909.38718-3-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5MUVRPNXV6FFAQSABKVKF42WJKBMOZ5Z
X-Message-ID-Hash: 5MUVRPNXV6FFAQSABKVKF42WJKBMOZ5Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5MUVRPNXV6FFAQSABKVKF42WJKBMOZ5Z/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26/06/2023 13:09, Hal Feng wrote:
> Add a dummy transmitter driver for StarFive JH7110 PWM-DAC module.
> StarFive JH7110 PWM-DAC controller uses this driver.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  sound/soc/codecs/Kconfig                     |  4 ++
>  sound/soc/codecs/Makefile                    |  2 +
>  sound/soc/codecs/jh7110_pwmdac_transmitter.c | 74 ++++++++++++++++++++
>  3 files changed, 80 insertions(+)
>  create mode 100644 sound/soc/codecs/jh7110_pwmdac_transmitter.c
> 

...

> +
> +static struct platform_driver pwmdac_dit_driver = {
> +	.probe		= pwmdac_dit_probe,
> +	.driver		= {
> +		.name	= DRV_NAME,
> +		.of_match_table = of_match_ptr(pwmdac_dit_dt_ids),
> +	},
> +};
> +
> +module_platform_driver(pwmdac_dit_driver);
> +
> +MODULE_DESCRIPTION("StarFive JH7110 dummy PWM-DAC transmitter driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" DRV_NAME);

Drop. You don't need it. If you need it, it means you miss proper ID table.


Best regards,
Krzysztof

