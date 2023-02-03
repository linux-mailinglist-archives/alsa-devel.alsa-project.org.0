Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF853689177
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 09:02:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C01AB820;
	Fri,  3 Feb 2023 09:01:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C01AB820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675411344;
	bh=ZCA2HK9w6/szHSvm5ea7cysXn8iUHOQ8TdAUr36YB1M=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OXuOjVviesRZzp7mChZZwAxgsPWi4nNENwj0x482OMQJV0XRwoBASVFoMKSLm4oEM
	 PTyEV3jXLejeRAPRqTul1pjK6t+EoCFoNkpw2DO7luyoDax7pYdUDp8t4RaxKJrxES
	 W3ddxxf1AoV6pMy4TVSSfMxxafO+fek/69WFUY98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 971B6F80022;
	Fri,  3 Feb 2023 09:01:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA20BF8032B; Fri,  3 Feb 2023 09:01:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F9BCF800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 09:01:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F9BCF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=guxpr1oT
Received: by mail-wr1-x42e.google.com with SMTP id m14so3839409wrg.13
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 00:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7m8f9EyCur2NoecBf9EPSiUVhxuV7BmfZLxYwGH5PkE=;
 b=guxpr1oTjCCk//LD7tIEzHxIsGt3+k3YvQpKzhFw13be5VyuYmjdsNPg+igN6mJTZP
 zGlnrReMLxiB3J+1drmNswO3Qb49rGsbvCfnMzZqu0Ie+/XV4N5FbfwjID+ijTM7hPHP
 GIbxK9BhQLfytmAUWdUM+/gNq+GnZ0OsuywF/SbMQKsr93PH1fIC+vt7Y2Lmueu9gUaM
 poRSdxMhbnhui64JU/44IJi4GKxbOtspEAv28RD9NbSMDAp4owHo0nUf+D1xZWZBM8Ok
 gNoOyCoDx9XR7rm687E88E+/uuJISQKkIsyCZtTsNxy7lYuBjzsPX/YK70zuCjgz49r4
 tpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7m8f9EyCur2NoecBf9EPSiUVhxuV7BmfZLxYwGH5PkE=;
 b=ESDepEHozjxCf3NtlWo0Y1jICs2NSHD1JsqDDgIb8rT9Qp66K/BEDG4WWaIuzJirtT
 O978AEA5DMwF+RtMKuKCceLFbs+QW7T2lX/L16vR38BUbQDgqwgkrJJUSQcXjonLVTMN
 JEWydNrWwmuLowTPWSUjVypEUfEEH7Tn8gAYSUcuHdsFhyeqkrCqk0dDApVsiCYohkJh
 fyEQX8fYiWLmcXm/AsYfdTzYiZXP/6n7o1G9yV+sSThtoQW//NgO/SacnaEAuEsam3WJ
 buoWdrYk+fD+EkIO7LKrh4jwIExKfT5OdPM3d6jS/moGjPcvznZmXMcniDiMWulhEJHm
 bFNA==
X-Gm-Message-State: AO0yUKVLB0v8+pTNpithW2ZG81s5Ot5vLbV+M+xdbWauC4BQ4frBZh/U
 ZwWFmAGlrbw/CWSAlvMRaI6hgQ==
X-Google-Smtp-Source: AK7set9OdHSazUeReB4su41/k86JE+27eq8f+sbDll2GVZYYoVPbsF3D45zzdlnihWnmoVcfG3+U3w==
X-Received: by 2002:a05:6000:144f:b0:2bf:95d6:4789 with SMTP id
 v15-20020a056000144f00b002bf95d64789mr3757520wrx.2.1675411272156; 
 Fri, 03 Feb 2023 00:01:12 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 q6-20020adfab06000000b002bfcc940014sm1393485wrc.82.2023.02.03.00.01.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 00:01:11 -0800 (PST)
Message-ID: <512edf50-a74d-815d-1278-39fdeb1c2d35@linaro.org>
Date: Fri, 3 Feb 2023 09:01:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/9] ASoC: dt-bindings: meson: convert axg pdm to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-6-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202183653.486216-6-jbrunet@baylibre.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 02/02/2023 19:36, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic axg PDM device to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-pdm.txt        | 29 -------
>  .../bindings/sound/amlogic,axg-pdm.yaml       | 86 +++++++++++++++++++
>  2 files changed, 86 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
> deleted file mode 100644
> index 716878107a24..000000000000
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -* Amlogic Audio PDM input
> -
> -Required properties:
> -- compatible: 'amlogic,axg-pdm' or
> -	      'amlogic,g12a-pdm' or
> -	      'amlogic,sm1-pdm'
> -- reg: physical base address of the controller and length of memory
> -       mapped region.
> -- clocks: list of clock phandle, one for each entry clock-names.
> -- clock-names: should contain the following:
> -  * "pclk"   : peripheral clock.
> -  * "dclk"   : pdm digital clock
> -  * "sysclk" : dsp system clock
> -- #sound-dai-cells: must be 0.
> -
> -Optional property:
> -- resets: phandle to the dedicated reset line of the pdm input.
> -
> -Example of PDM on the A113 SoC:
> -
> -pdm: audio-controller@ff632000 {
> -	compatible = "amlogic,axg-pdm";
> -	reg = <0x0 0xff632000 0x0 0x34>;
> -	#sound-dai-cells = <0>;
> -	clocks = <&clkc_audio AUD_CLKID_PDM>,
> -		 <&clkc_audio AUD_CLKID_PDM_DCLK>,
> -		 <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
> -	clock-names = "pclk", "dclk", "sysclk";
> -};
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
> new file mode 100644
> index 000000000000..d3da2f8ba7b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,axg-pdm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Audio AXG PDM input
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller@.*"

Drop

> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,g12a-pdm
> +              - amlogic,sm1-pdm
> +          - const:
> +              amlogic,axg-pdm

One line.

Please use the same coding style as we have in other bindings or
example-schema.

> +      - items:

Drop items

> +          - const:
> +              amlogic,axg-pdm

Keep in one line.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock
> +      - description: PDM digital clock
> +      - description: DSP system clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: dclk
> +      - const: sysclk
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"
> +  - clocks
> +  - clock-names
> +
> +if:

Keep in allOf here (need to move ref from top to here)

> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - amlogic,g12a-pdm
> +          - amlogic,sm1-pdm
> +then:
> +  properties:
> +    resets:
> +      items:
> +        - description: Dedicated device reset line

Define properties in top level properties.

> +
> +  required:
> +    - resets
> +
> +unevaluatedProperties: false


Best regards,
Krzysztof

