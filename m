Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9F56FD805
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 09:18:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BAF3F34;
	Wed, 10 May 2023 09:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BAF3F34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683703120;
	bh=bpIDGga9Z2hQG7KSpn4QZVGBSKDycRUf/qhimUkJl5U=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qef/ifLBAJUIstLqaVFsVoVh5VIQ/qLa8OhgV0MZrh60V4ECuwCxejPwXTPRer3lb
	 iDZOHenrSeMcaaLHAOGokrvKrlQ83Orv+c3tISLnK8rhy2Yl5sUgnLV/Xk7dF44R5L
	 JYlPa2YJqyC+q4wloRjkHb5wq0SREAWutyHH5v2I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45968F80310;
	Wed, 10 May 2023 09:17:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 309BFF8032D; Wed, 10 May 2023 09:17:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C3A9F8014C
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 09:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C3A9F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rWG08sRK
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-969f90d71d4so247232866b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 00:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683703055; x=1686295055;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ph5I/Azzrsi4/WKGlfB9lGgtBibqTjZaRyz8p7rYK8E=;
        b=rWG08sRKhyIFoh1UKmiERXMrYpDMeP7MTtlAs5ukGEfzXzmdp2wbZD2Cpk0HMT97+C
         5IVpthTXG5tfYwkOO6FAI2sM+tOwfNgVvwOpMI2Jt3T8FJhnll7doZiLY6c7nxU97ohD
         Jelp9TLcFVxRW7OoKD7XTaxHr65AAl+5IDkpBpNf2S6++at99UBvGmUw8VAqaVF398M8
         fIVtzvxcpOcvBclZ3nUdzYLXyxR/syGOdEIJVacM2vBTaJTEGiLY2OC8jxR48o0EkDrO
         bWAyJC5FhP56gCXg4xnyEEzhk+FrP8Gj6jxdOLBchy+ZUNodzD1WqCFicIlDZzW5N0Nj
         zG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683703055; x=1686295055;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ph5I/Azzrsi4/WKGlfB9lGgtBibqTjZaRyz8p7rYK8E=;
        b=El9IAOTDjTUfaAfW/8F19hxrG2Hhwi4GsZfqGPofxbv3UpSM0Z1kODZLbU+QSzn/+q
         Q9Tk+QLmEZSQOUb+eUQzem11z/LfI2HSluVBbwEWqAA2unpYcGuRzJI9bedmp/mYqnuw
         VCM7pbZoSgiFWieYVgbPbCAfWjwHVD9jRuByP195RxuzKe4qi0bQ4d7ThsLba8qvKxge
         gKgOOT7dUu8fZsgglBLzqs7L6u+SgkZLPHCdaXqhEYyN43dUXdoVndN8HnECDv7BdSIJ
         5UuOXqjdbGZkY0ApiDfuz0e0yg2zC++c80AwYc2cduorJhnMtUS22jbujiklQsD2owhq
         s8mg==
X-Gm-Message-State: AC+VfDzoYiKASRiodQJyyiDMXAeh9TXWktKtgE8M79PEeZq1dWaIeqVI
	orIsvpAUfeZM+TGQXLCSFdKLWg==
X-Google-Smtp-Source: 
 ACHHUZ6Nki7/wbGSFS7RowfpaGQBE9c7EC822/QfqITsMQ45566bwmhr0Y+B0VftKWLASL9qPV5slw==
X-Received: by 2002:a17:907:97d2:b0:968:1102:1fb7 with SMTP id
 js18-20020a17090797d200b0096811021fb7mr8138496ejc.6.1683703055539;
        Wed, 10 May 2023 00:17:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d?
 ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id
 ze12-20020a170906ef8c00b009659fa6eeddsm2299387ejb.196.2023.05.10.00.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:17:34 -0700 (PDT)
Message-ID: <baf338a7-1e63-4842-32a1-8f63f850bd2d@linaro.org>
Date: Wed, 10 May 2023 09:17:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: dt-bindings: Adjust #sound-dai-cells on TI's
 single-DAI codecs
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230509153412.62847-1-povik+lin@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230509153412.62847-1-povik+lin@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BLXS223TVKDSGL2C2ECOUJWOXZOWRUXD
X-Message-ID-Hash: BLXS223TVKDSGL2C2ECOUJWOXZOWRUXD
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Andrew Davis <afd@ti.com>, Shi Fu <shifu0704@thundersoft.com>,
 Shenghao Ding <shenghao-ding@ti.com>, kevin-lu@ti.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BLXS223TVKDSGL2C2ECOUJWOXZOWRUXD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/05/2023 17:34, Martin Povišer wrote:
> A bunch of TI's codecs have binding schemas which force #sound-dai-cells
> to one despite those codecs only having a single DAI. Allow for bindings
> with zero DAI cells and deprecate the former non-zero value.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> ---
>  Documentation/devicetree/bindings/sound/tas2562.yaml | 6 ++++--
>  Documentation/devicetree/bindings/sound/tas2770.yaml | 6 ++++--
>  Documentation/devicetree/bindings/sound/tas27xx.yaml | 6 ++++--
>  3 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/tas2562.yaml b/Documentation/devicetree/bindings/sound/tas2562.yaml
> index a5bb561bfcfb..31a3024ea789 100644
> --- a/Documentation/devicetree/bindings/sound/tas2562.yaml
> +++ b/Documentation/devicetree/bindings/sound/tas2562.yaml
> @@ -55,7 +55,9 @@ properties:
>      description: TDM TX current sense time slot.
>  
>    '#sound-dai-cells':
> -    const: 1
> +    # The codec has a single DAI, the #sound-dai-cells=<1>; case is left in for backward
> +    # compatibility but is deprecated.
> +    enum: [0, 1]

Does it? I see playback and capture.

Best regards,
Krzysztof

