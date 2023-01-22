Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CE7676D8F
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Jan 2023 15:17:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6A6241EF;
	Sun, 22 Jan 2023 15:16:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6A6241EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674397042;
	bh=KYsA32FjghfM9CiTBJn9agyiRFALCbugiHn68j9XK9U=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NMbu1PnSZ8OXChV0/MYnk9Ne21P06nhwllrO0rrFIJBCEMGIdSnMX3xX0gL7cJO9W
	 No6TWxsUbxTMbDYOurLGDniMnYh5LjzVWvgwEWotcyoVS5u0GDmgWGmF6M6KVudNUC
	 o8sxCimmsYBWHkqAfz9RKdw9E+iAU3u6iCRg49q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35870F801D5;
	Sun, 22 Jan 2023 15:16:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F8E8F8027D; Sun, 22 Jan 2023 15:16:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D56EF80254
 for <alsa-devel@alsa-project.org>; Sun, 22 Jan 2023 15:16:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D56EF80254
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=a44FoSuX
Received: by mail-wr1-x435.google.com with SMTP id n7so8634524wrx.5
 for <alsa-devel@alsa-project.org>; Sun, 22 Jan 2023 06:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hltLV3ya8ktIesbWW9B+JQxvC7+ys0Pz05F3BDmcVzQ=;
 b=a44FoSuX5jQrA63CqI55Xa498Vxdg/Tyc/vx0ArZx69NHf06EiaeeqYYYTD6nSB3M5
 AoRrEOOoHHuWaZphy/SEaHCfRu3yOY6NM1JGJ10LGJ6AHb5ZwtrtR7GhkW0h+eoU4O/V
 jYTrFyoL/BtKKyInYzziNGBSTg+2ArFNCZCEeHw4zZu83+QbfsdIk3YOCGZT+KtIDjpT
 A/4bKdz3YuaebBoipcG9xgBlmlRBTEVJH3TtJyCimA5zd8fDvYE30QqFXISaqSsRx6Yp
 brpEAryraPeICh5RlyJU5Qo7M2RiaQ0c6hkwTzeBoaMBxesGtxCWmAhqokq1T6F2SROn
 +vhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hltLV3ya8ktIesbWW9B+JQxvC7+ys0Pz05F3BDmcVzQ=;
 b=RvyFcfExyGtNoMxuW2+64V3/D10Xp0sOmxe4yGyueX7Im08A6otMZghyUvBJmW8Kqv
 eto72tOHW1XbkCntCOh1On4bIC51pJRZYoeoa8/p++wrFup6dHquyVotzvb+UnADxEGL
 iGA4/Coly3TMB+u8VUbt58KdjpfZb/C7tfJsOGigcyDPzhg57unScaD20Q3WlRQddVnx
 jBfq/quS7mOM0iiZ5axR6uP3ifrKLBW+iwfB5Sq9Ho2aMRFmr8gpmp7tXYZJ1QREwerF
 KoIti9I6ArZT541ey0YX/BmYDRFaO48+rhrrvc4a6iMYE5bgQKDi+jmD4Ucw507uMJID
 uhWg==
X-Gm-Message-State: AFqh2krv8XO9/2s+WT5HY/4pM+h6ONtAemquvWHfX2PW8qp5GCEo54En
 ri8XvJWbheandOM3JNMmRhowBg==
X-Google-Smtp-Source: AMrXdXtU1a/dtmjJRUOHbLcFPO22+9D4XFjXFgfo5x1g6EzxrL/TMMrC9eQPuZR1P+f2mLUk2uRuug==
X-Received: by 2002:a05:6000:603:b0:2bd:f651:3a67 with SMTP id
 bn3-20020a056000060300b002bdf6513a67mr21144691wrb.64.1674396976540; 
 Sun, 22 Jan 2023 06:16:16 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe843000000b00241bd7a7165sm2549584wrn.82.2023.01.22.06.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 06:16:16 -0800 (PST)
Message-ID: <2d05a943-3510-5ee9-9906-247a6344190a@linaro.org>
Date: Sun, 22 Jan 2023 15:16:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 4/4] ASoC: dt-bindings: ti, ts3a227e.yaml: add jack-type
Content-Language: en-US
To: Astrid Rost <astrid.rost@axis.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Dylan Reid <dgreid@chromium.org>
References: <20230120102555.1523394-1-astrid.rost@axis.com>
 <20230120102555.1523394-5-astrid.rost@axis.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120102555.1523394-5-astrid.rost@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kernel@axis.com,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 20/01/2023 11:25, Astrid Rost wrote:
> Add jack-type: Bitmap value of snd_jack_type to allow combining
> card drivers to create a jack for it.

Subject: drop "yaml". We do not filename extensions to subject prefix.
Nowhere.

> 
> Signed-off-by: Astrid Rost <astrid.rost@axis.com>
> ---
>  Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml b/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
> index 785930658029..1d949b805f98 100644
> --- a/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
> @@ -27,6 +27,14 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  jack-type:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Bitmap value of snd_jack_type to allow combining
> +      card drivers to create a jack for it. Supported is

Why the device would once support (allow) headphone and once not? Device
either always supports them or never...


> +        1 SND_JACK_HEADPHONE
> +        2 SND_JACK_MICROPHONE

minimum and maximum

> +    default: 3
> +
>    ti,micbias:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: Intended MICBIAS voltage (datasheet section 9.6.7).

Best regards,
Krzysztof

