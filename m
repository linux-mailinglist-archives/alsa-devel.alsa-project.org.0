Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9A268788F
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 10:16:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F73874C;
	Thu,  2 Feb 2023 10:16:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F73874C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675329410;
	bh=sJqxgV51pQB9DJ1OIAROWMSPK1rXpMcTy1VRmCfj+9M=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rocL/Z4/1Oelu+fP3wCxs5/VyKzwJGcRMMyWn+qJ1EJaKqpstECwiZjFFvZSPDE/g
	 vRpjYtJz9YN++LArBS5Pb1wZxEQoRy0N5CLoeL+E/kUZYgUxhoa8DMy3Yo/5ItVb2e
	 og9c3yZIesAOVaBwkt0J27a2k06e2Z27aFTqATa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1BE5F804DF;
	Thu,  2 Feb 2023 10:15:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A23CEF804C2; Thu,  2 Feb 2023 10:15:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16290F80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 10:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16290F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GcCHg1yC
Received: by mail-wr1-x42c.google.com with SMTP id d14so1039338wrr.9
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 01:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RC/waujmzDR6aaO1i7Us/eAJ3rIYO70QGCYk2/l27l4=;
 b=GcCHg1yC0pMmEeKvVNrj2xH0zliRUfXnUm7/tZud3ZC30eDF3n8BSFtKoP5KuS1Qg5
 ZLxdgocNnGLz+3UviJzDAqpIEWObD4Ku1HUxIE/uv+FxJzBHT343NpCygZFVyvmxHT1c
 M7IBtmc36Coou7oAFCVrq4FobzyVbZvpegt3PLLqal1YxLXGYfI8r3CaE6D0qBm+DbHE
 /zR+C4QGww9Fg9GKAH9vTQDLz6RCW1xVawbLvPd9K+nYkkJUyd29ESha8aa5jOMr1PHJ
 73Vs9t3WpywdW7NgaP9O5QcgZ/K2x04KZhZ3UF89rA2Pxw6bcyqupsQTn5MzSXI8fuRX
 J6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RC/waujmzDR6aaO1i7Us/eAJ3rIYO70QGCYk2/l27l4=;
 b=0u2HSkVUozzh9EQZkdwxVi5GNIRMB2lPIDzPqsEu+jIM8Bo60S3+8Ieb9qchiYvYxY
 16Wui2v2Wpz30iBcc6OLcKE1OLxiqMi2UGKDF1mhuTnskLtRhL50d00vo2/mORSqKqRB
 81RNksB8I2ac4mbMTU/cqCnfDAiBgcf3iElW6LPSHNcUIoOZ0t79nMZ0DxShAfE8xrH+
 a94iMCfDBsvN5r0VQZeDpmhnx8wTuoHRGBZe1WdSt9RaSyzMXjYYtrmQvJhGE+7kuvpN
 mXn/8EbaCgQVVGa8+pU4eaqSZXfc/WkdEU2GB7nLkhrsiKmIt/UtLCQCOGEz2ADFYgKS
 dCfg==
X-Gm-Message-State: AO0yUKXVQ1N7vcHi5LtNtHIv+j9eRbNrzoHxVR/oAXwIHSCTWAuG85Ua
 m/xMNitkMMF4cRnblpyAldDO2Cx4iwWAXFj2
X-Google-Smtp-Source: AK7set+HjM7/u7nGSanVRFA3UE2vWW8KqzZsfA7RaoTdtFUbko0OLTyEmitcnfANKME1fUsKzxDBCA==
X-Received: by 2002:a5d:6d4b:0:b0:2bf:f44b:7a28 with SMTP id
 k11-20020a5d6d4b000000b002bff44b7a28mr4861946wri.29.1675329342542; 
 Thu, 02 Feb 2023 01:15:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a5d640e000000b002bfb5bda59asm19403954wru.25.2023.02.02.01.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 01:15:42 -0800 (PST)
Message-ID: <ac140660-0df0-8b43-3585-17511a280830@linaro.org>
Date: Thu, 2 Feb 2023 10:15:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] Fixed the schema binding according to test
Content-Language: en-US
To: Kiseok Jo <kiseok.jo@irondevice.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230202090715.18384-1-kiseok.jo@irondevice.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202090715.18384-1-kiseok.jo@irondevice.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Thank you for your patch. There is something to discuss/improve.

On 02/02/2023 10:07, Kiseok Jo wrote:
> Modified according to the writing-schema.rst file and tested.

Use imperative, not past tense (Fixed->Fix, Modified->Modify).

> 
> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching). Therefore it should be:
"ASoC: dt-bindings: irondevice,sma1303: Rework binding and add missing
properties"



> ---
>  .../bindings/sound/irondevice,sma1303.yaml    | 46 +++++++++++++++++--
>  1 file changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
> index 162c52606635..35d9a046ef75 100644
> --- a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
> +++ b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
> @@ -10,22 +10,62 @@ maintainers:
>    - Kiseok Jo <kiseok.jo@irondevice.com>
>  
>  description:
> -  SMA1303 digital class-D audio amplifier with an integrated boost converter.
> +  SMA1303 digital class-D audio amplifier
> +  with an integrated boost converter.
>  
>  allOf:
> -  - $ref: name-prefix.yaml#
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - irondevice,sma1303
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +  i2c-retry:
> +    description: number of retries for I2C regmap.

Why do you need this? Why this fits the purpose of DT (or IOW why this
differs between boards)?

> +    maximum: 49
> +    default: 3
> +
> +  tdm-slot-rx:
> +    description: set the tdm rx start slot.

Aren't you now re-writing dai-tdm-slot-rx-mask property? Same for tx below.


> +    maximum: 7
> +    default: 0
> +
> +  tdm-slot-tx:
> +    description: set the tdm tx start slot.
> +    maximum: 7
> +    default: 0
> +
> +  sys-clk-id:
> +    description: select the using system clock.

What does it mean? Why do you need such property instead of clocks?

> +    default: 3
>  
>  required:
>    - compatible
>    - reg
> +  - '#sound-dai-cells'
>  

Best regards,
Krzysztof

