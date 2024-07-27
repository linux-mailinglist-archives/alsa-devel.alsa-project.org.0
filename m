Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E703F93E153
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jul 2024 00:22:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3941EE64;
	Sun, 28 Jul 2024 00:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3941EE64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722118944;
	bh=5lFK4MT8kHjxmIDSWsaDwLNDfSAtd1FNjuD5F+3Vnk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X8y/whAy2Fz0TubUNEgQPwfnDWcCXE5PiIFlwZtA3yazQDcqRfwR07JhbHu/k3/gc
	 FYpp4GL3BJtA2C8h7Vj7D8+uG5WB1vgdgs2TcQ/KKrsFXjSd7LnxV9B+qirAcO0mz7
	 FSrS2fw3ybQgYbKGq1jofFIoBWctSIbURUqWbWd4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E13C5F80579; Sun, 28 Jul 2024 00:21:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2367DF80448;
	Sun, 28 Jul 2024 00:21:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DE13F802DB; Sun, 28 Jul 2024 00:18:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86048F8007E
	for <alsa-devel@alsa-project.org>; Sun, 28 Jul 2024 00:18:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86048F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Ctg3a1if
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52f025bc147so3240980e87.3
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jul 2024 15:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722118699; x=1722723499;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SRPFdqDNMT5cVtgo5Uruy9LQl2dnULjagrFjzTadsmA=;
        b=Ctg3a1ifyZNKGyQmDOS+TPX2rAkY0zNNBgUTHT3ugDuvVJ9MV608EfJbRPhqNG7ZXn
         k4sc6r/zl/ElvG90EvcDdd307km2t9ZQY+4QgzncfR/rh3nwL+RtHKES5HXIkurPTTxr
         bzSEHbHAxcVjjNu0pkp97yZ3aV8EfYp219PAhkkTTKHB12xfJm7y+LIlfvgyelm4/sfC
         kaICvNZNTHSt/Aen/R50P9d+LBQEZdv5jok/I4Hz5GkuApAVX4a3jebXKppZ4ZpRoGn7
         QU+27e+409eT9QOP0N9tvESMI7RcKawKBwI5jveA6BeYtNdlTBiykxPG8GXSzrKrl9vu
         IX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722118699; x=1722723499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRPFdqDNMT5cVtgo5Uruy9LQl2dnULjagrFjzTadsmA=;
        b=fbIH6OO58RgeucQ7Bfk3xgiJfXRJjBcK2Tww3PkPrRnNyx/uA8W3rQn/pUlBDBlPg2
         eDyvaOEJ+/9fdpdL2w5LQgR1aVL4JSK0NtZMKELg09cDbLwOwOzMWcDGireKq0RBItCM
         KpTp+atFBxuOL1xpPykvzMdKi9lNyXt+rrA6hyrpHc2sqBV10od0ZISzV4vkO8XebH2u
         3eXIMRJy5toiAhmLnomt0o/5aRMVeyQlZ6xR+toysfvc2MINPglSVa5e7/8mRL39d2d5
         YzgzGtZYYCkg6wVxu30Cp7WiNjGAxnfehkSnN50vmW+Dm91C65ypA+4VtvodMF04CoFo
         9Nxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4YKz6S48iFZWIwJ4KznwZFJpG4XAy+CgTiWbNMakZ6skQ686hMMcsi4qhM3uTMakktQAzbAzQISgZC6n/oHWYlSY+m29Sj09lgHs=
X-Gm-Message-State: AOJu0YxiKqqyqsFWq7cc7D7JiHwH0kg5JZuR8tfifyRAepVhntx+K0WZ
	Jc2Su9rD0zIGJygQ4zIc6pke1a/Ve4xMMGXlnJUU136ObrHA0xlQzrtlSsN0ysQ=
X-Google-Smtp-Source: 
 AGHT+IFUBQ6q8OXXKFdSK1WefD+EdS1b4NdGUG2Kdoz2aBuzpXsjNTWAKu80JFuplft0bFTX/L8E5A==
X-Received: by 2002:a05:6512:606:b0:52d:582e:410f with SMTP id
 2adb3069b0e04-5309b2c3061mr1949742e87.46.1722118698555;
        Sat, 27 Jul 2024 15:18:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c196e7sm872644e87.190.2024.07.27.15.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 15:18:18 -0700 (PDT)
Date: Sun, 28 Jul 2024 01:18:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 3/4] ASoC: dt-bindings: apq8016-sbc: Add
 msm8953/msm8976-qdsp6-sndcard
Message-ID: <ctww7q6kmkvke7acubxupsfvi3cmvn3i4h7s7pb6pmzw5hl4ry@w35exuha32k7>
References: <20240727182031.35069-1-a39.skl@gmail.com>
 <20240727182031.35069-4-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727182031.35069-4-a39.skl@gmail.com>
Message-ID-Hash: 4G6V73JEYKJ6SQDKW2WIYVPCUEVCDDZE
X-Message-ID-Hash: 4G6V73JEYKJ6SQDKW2WIYVPCUEVCDDZE
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4G6V73JEYKJ6SQDKW2WIYVPCUEVCDDZE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Jul 27, 2024 at 08:20:26PM GMT, Adam Skladowski wrote:
> Document MSM8953/MSM8976 QDSP6 cards.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  .../sound/qcom,apq8016-sbc-sndcard.yaml       | 51 ++++++++++++++++---
>  1 file changed, 45 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
> index 6ad451549036..1706ce334d2f 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
> @@ -15,16 +15,16 @@ properties:
>      enum:
>        - qcom,apq8016-sbc-sndcard
>        - qcom,msm8916-qdsp6-sndcard
> +      - qcom,msm8953-qdsp6-sndcard
> +      - qcom,msm8976-qdsp6-sndcard
>  
>    reg:
> -    items:
> -      - description: Microphone I/O mux register address
> -      - description: Speaker I/O mux register address
> +    minItems: 2
> +    maxItems: 3
>  
>    reg-names:
> -    items:
> -      - const: mic-iomux
> -      - const: spkr-iomux
> +    minItems: 2
> +    maxItems: 3
>  
>    audio-routing:
>      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> @@ -106,6 +106,45 @@ required:
>    - reg-names
>    - model
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,apq8016-sbc-sndcard
> +              - qcom,msm8916-qdsp6-sndcard
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: Microphone I/O mux register address
> +            - description: Speaker I/O mux register address
> +        reg-names:
> +          items:
> +            - const: mic-iomux
> +            - const: spkr-iomux
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,msm8953-qdsp6-sndcard
> +              - qcom,msm8976-qdsp6-sndcard
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: Microphone I/O mux register address
> +            - description: Speaker I/O mux register address
> +            - description: Quinary Mi2S I/O mux register address
> +        reg-names:
> +          items:
> +            - const: mic-iomux
> +            - const: spkr-iomux
> +            - const: quin-iomux

As msm8953 / msm8976 just add one new region it might be better to
move the lists back to top-level definitions (still having mix/maxItems
next to it) and then in the conditional branches just specify maxItems:2
for apq8016/msm8916 and maxItems:3 for msm8953/msm8976.

This way it becomes:

  reg:
    items:
      - description: Microphone I/O mux register address
      - description: Speaker I/O mux register address
    minItems: 2
    maxItems: 3

  # same for reg-names

[....]

  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,apq8016-sbc-sndcard
              - qcom,msm8916-qdsp6-sndcard
    then:
      properties:
        reg:
          maxItems: 2
        reg-names:
          maxItems: 2
    else:
      properties:
        reg:
          maxItems: 3
        reg-names:
          maxItems: 3


> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
