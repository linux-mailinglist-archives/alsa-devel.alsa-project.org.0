Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E7266B1D9
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Jan 2023 16:07:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDFC4522B;
	Sun, 15 Jan 2023 16:06:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDFC4522B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673795262;
	bh=eRgNOFUXNGW8V2TuzgzTa13lyiotT5iD7a9NpjDZQ9s=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Tw/TK2WHSneQvkN8d6DJ2tlfoe10pzlu7s5EPcuFgdfChwcsgIXBl4nWEBB1vx696
	 DokB2TnHpUVKEPMNxk+AmByGjHjW2YTTVwvIuGVGVjU5UeSc66xQiVW+oZt+c3pD0q
	 4fDUgkRTyOSffbtNMdoT1Dd+7vz5LzpG4CxyBTK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99521F801EB;
	Sun, 15 Jan 2023 16:06:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E134DF804DE; Sun, 15 Jan 2023 16:06:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AFFBF801EB
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 16:06:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AFFBF801EB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Gxs+wgA/
Received: by mail-ej1-x632.google.com with SMTP id mp20so16093256ejc.7
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 07:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6mV2i5/nB+6SQc3dRdfPMP5cMJSxy5rQiGnmFtQCfgQ=;
 b=Gxs+wgA/dB9MSMphhEcVZMGRdxcy+UPE25FznZluA2FOhVqJ8U4Eo6zqWEi5g8q+A6
 T2YCrsRaw2aw287emFzJt2/ALkOUorBkXUkLb7nQcm3aMpYdWdY34Y4e9tzVftHi5pB/
 QUiyVIb7EhiDGlRUBHdxbLoXoux/oAaLuWbDE8nUnxECJO1s2AgEyv89Zw85RCoGuqky
 1c006IJMXIKKrHw8onTaVEqeCArUieCwzFrrPxeH/Ev52mY+GtzWhHq6Jh5u7Jm63qbQ
 BtuEzdm7hMKrDoNu9eA8iDVemEFbPuV1wjrMIIAv1Yngxj7XKL/ZayYJEs7BRku/+Al0
 C56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6mV2i5/nB+6SQc3dRdfPMP5cMJSxy5rQiGnmFtQCfgQ=;
 b=h3pDNdfPGyZnds1lbWhaQCGVRQC52SgFfURFvQKp2tm2VNGNxqtahWgFe8D68H4LWM
 SaAlU9tKjIdCESLDvhVsxAFn1HihPxgh7ZBfJRdaQQIQELOWkRWrohR5NFCJUJIPdzee
 kKbu61bGZ2nxygRvwiGbDsWhbswA82cJym1rnVlIFndMsbw2Q6Di4fFOkc2Arpl9Enik
 h+MnL7czjVDrmhmw/134TQu0vhbrqCAi9IXydajLPUz28ZJy4M9E3BllxzK0P006BTlR
 jbAGlGybrvKLYhJb8Ed9PLvFcXh6vS6VQsqVAXtCvdLKeTzMAopbLp3FZ3+ZaN5zrzp/
 CMNA==
X-Gm-Message-State: AFqh2kryrJ0C+ZCRSPyvLUYkj1dKizJQpKccbfsop+nHCD+w3zhiDqYG
 ZlIQ9pxRRpeIQC38JpV/I9nDcw==
X-Google-Smtp-Source: AMrXdXtoJE1Ir5Xn52Iji4CbQo6oLweEklRVp9bvVaH0Nk2PtWen++DWHI0yZaagkGlYpbUC+Ijg7A==
X-Received: by 2002:a17:906:b108:b0:843:a9fe:f115 with SMTP id
 u8-20020a170906b10800b00843a9fef115mr79416292ejy.32.1673795197836; 
 Sun, 15 Jan 2023 07:06:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 kz14-20020a17090777ce00b007c17b3a4163sm10914026ejc.15.2023.01.15.07.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jan 2023 07:06:37 -0800 (PST)
Message-ID: <a4982e06-a6a4-a8c9-3b24-24f798c61f73@linaro.org>
Date: Sun, 15 Jan 2023 16:06:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 4/5] arm64: dts: fsd: Add codec node for Tesla FSD
Content-Language: en-US
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 s.nawrocki@samsung.com, perex@perex.cz, tiwai@suse.com,
 pankaj.dubey@samsung.com, alim.akhtar@samsung.com, rcsekar@samsung.com,
 aswani.reddy@samsung.com
References: <20230113121749.4657-1-p.rajanbabu@samsung.com>
 <CGME20230113121830epcas5p4cc336a48f4597ba84ab1352774242f75@epcas5p4.samsung.com>
 <20230113121749.4657-5-p.rajanbabu@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113121749.4657-5-p.rajanbabu@samsung.com>
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
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13/01/2023 13:17, Padmanabhan Rajanbabu wrote:
> Add device tree node support for codec on Tesla FSD platform.
> 
> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd-evb.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> index cf5f2ce4d2a7..2f211a1ad50d 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -10,6 +10,7 @@
>  
>  /dts-v1/;
>  #include "fsd.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>  
>  / {
>  	model = "Tesla Full Self-Driving (FSD) Evaluation board";
> @@ -34,6 +35,17 @@
>  	clock-frequency = <24000000>;
>  };
>  
> +&hsi2c_5 {
> +	status = "okay";
> +
> +	tlv320aic3x: codec@18 {
> +		compatible = "ti,tlv320aic3104";
> +		reg = <0x18>;
> +		#sound-dai-cells = <0>;
> +		reset-gpios = <&gpg1 6 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +

Why there is i2s here? What was the base of this patch?


Best regards,
Krzysztof

