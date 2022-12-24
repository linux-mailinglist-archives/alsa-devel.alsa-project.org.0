Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAECA655A59
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Dec 2022 15:41:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E831B742;
	Sat, 24 Dec 2022 15:40:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E831B742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671892891;
	bh=kHtva9GAa7yQ+IY4fwwzkUZaLIYPWlYIIuqJJlfldG8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Q9kuRidqbmUvD4UHC6Ur8yzAwXpmRknbpqYJMvo7fKENIl4YD+iv3RhazLM/1UhcB
	 E/+mNgC6vJPfO75oIkZ9b3SjdLBC1GETWBvh0ayx3Dm9m8bnjOdy8NbordyJWEw4q0
	 6o6RNtd2VQQA/6XVd8T1xgSCA86/blGzal4cZ7+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9C8BF80249;
	Sat, 24 Dec 2022 15:40:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CD38F80423; Sat, 24 Dec 2022 15:40:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C254F80249
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 15:40:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C254F80249
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lVPZBYKa
Received: by mail-lf1-x131.google.com with SMTP id f34so10541414lfv.10
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 06:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ot4y1v/6kGhsB43W5lYaREV5k7vVErtV06ABJyLGw3E=;
 b=lVPZBYKatl1jb0EDXy5sPKMfxCQjGR5rk4JhOUSJyAz+lMGw4vYWdFEpyNJPHdmDIP
 8O1LsSJfpkpESOKMJSn4QGDA27Z4xjagR/HbiiqiEqbldN32b+MgohZ9xgBMljvelWwr
 JbII+QbxL+LDlg0gKaJWKcamYq4uWM/+/37t0TyVMHGUD1ltucEQtQ3yTxvsLZ4blpZL
 gAYUP16Hitp5U/T88SzM0DcjbyvR2UrQkJeTMWFfZZaer+FQAaaWFWCz5CPeeIbAbA7n
 w6YhlMpND98RphOBPx9UoaCgWEUq77yf6zBcjEi33aJh3jzxBnian8Ga4R724+RZM6D3
 bgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ot4y1v/6kGhsB43W5lYaREV5k7vVErtV06ABJyLGw3E=;
 b=z0Wx6kgffVy3t6+OpWhZnd4XmCDaOns4OEUsoRI0YqVcrupBKwgCvk03uO+TSVCcCY
 VQyeW3IBHaFlMeBtVlEHqUnOuwg9AVHduzVzkOIWL37LQuJb3wwmPGXGPfg1nSjMkVzv
 AondMemXbmA0K5V8JXto3bR+H8Il9lf4+xm8RxqRTKfTDouw3WLfp3nOqD/tdygmmKCr
 laUFDs/6HeMOl5fS5OpxNGC+FsLtu4B103xEqB03hVniLSiCRKzQae71FxB82R0MXarh
 8320G/cdwbtw9Hm52ofK9CkviTJIUBDGO073jNA6Tottj85SsW9+ig8SsS+/onSWxLEd
 Pqng==
X-Gm-Message-State: AFqh2krWNjkFpPDe2pgk18c4L2jBEcjCaUJPD+jP9hAnfffzvC8mBYhJ
 OHwRlCuv0gDH64s5X+ZRS8wtIo774pAuBBn/
X-Google-Smtp-Source: AMrXdXvJGiHSbaP745Kpqugib5NXtxgXQBl1bFHWh9CyQRBuB7Fir6p3+hlgpoKSVVVVR+ygW956OQ==
X-Received: by 2002:a05:6512:168d:b0:4ca:fd5f:ce82 with SMTP id
 bu13-20020a056512168d00b004cafd5fce82mr530060lfb.49.1671892825195; 
 Sat, 24 Dec 2022 06:40:25 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac244b2000000b004cb018ad4dfsm15286lfm.135.2022.12.24.06.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 06:40:24 -0800 (PST)
Message-ID: <838e7657-817c-e5bd-5a45-d852560c7fe1@linaro.org>
Date: Sat, 24 Dec 2022 15:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: lpass-va: add npl clock for new
 VA macro
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20221118071849.25506-1-srinivas.kandagatla@linaro.org>
 <20221118071849.25506-2-srinivas.kandagatla@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118071849.25506-2-srinivas.kandagatla@linaro.org>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 18/11/2022 08:18, Srinivas Kandagatla wrote:
> LPASS VA Macro now has soundwire master to deal with access to
> analog mic in low power island use cases. This also means that VA macro
> now needs to get hold of the npl clock too. Add clock bindings required
> for this.
> 
> As part of adding this bindings, also update bindings to be able to
> specific and associate the clock names specific to the SoC.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-va-macro.yaml   | 63 ++++++++++++++++---
>  1 file changed, 55 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> index c36caf90b837..288a1d5ad585 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> @@ -27,16 +27,12 @@ properties:
>      const: 0
>  
>    clocks:
> -    maxItems: 3
> +    minItems: 1
> +    maxItems: 4
>  
>    clock-names:
> -    oneOf:
> -      - items:   #for ADSP based platforms
> -          - const: mclk
> -          - const: core
> -          - const: dcodec
> -      - items:   #for ADSP bypass based platforms
> -          - const: mclk
> +    minItems: 1
> +    maxItems: 4
>  
>    clock-output-names:
>      maxItems: 1
> @@ -60,6 +56,57 @@ required:
>    - compatible
>    - reg
>    - "#sound-dai-cells"
> +  - clock-names
> +  - clocks
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sc7280-lpass-va-macro
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          items:
> +            - const: mclk
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8250-lpass-va-macro
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: mclk
> +            - const: core

There was no follow up on this patch and I just hit the warning here, so
let me bring this back - that's not correct name. DTS and drivers use macro.

Best regards,
Krzysztof

