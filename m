Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8406A65BEB7
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 12:12:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB51CD63F;
	Tue,  3 Jan 2023 12:11:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB51CD63F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672744328;
	bh=CDIREq7WgF0skPEBnfbW3izBFGbNZsGRSr/Q+5uvCpI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DgRo99myNSNNyrn2/MmKPZBuHEbFi227xBOCNLqRDnj44t1JTrB2fVMRh0I31aCi9
	 RmuK/6CuTRB7NwUJILy29wXEwXAn/UkvguiFzowPXEW1Fzl+25xoYgY5QURFCt75xl
	 ldLc3LQRHCT/mexGlIsUx+WeMFPLPReMtNYqq8hM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAD9BF8003C;
	Tue,  3 Jan 2023 12:11:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0038EF8047B; Tue,  3 Jan 2023 12:11:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21479F800C0
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 12:11:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21479F800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EnOEatK+
Received: by mail-lf1-x12e.google.com with SMTP id j17so35702966lfr.3
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 03:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9D5LFOOL7M248RT3YKkgzKFTBRXhYh2dkwaJ1IaRHxA=;
 b=EnOEatK+DA5jF5hkgO1d9SjyfsSx+JiDXvYMOfqMv+LZMR6PCSVgIVzkVR58uboHuD
 qeDlDmM7YhSAjXKD0MUkL+bsKd0nAjQoXKlLEliz8pFBAu894A9JJjYiW/y4VrnhYdlT
 Rya9NYCDUqRobuLp/HaPfCwfndMc56IcsUPtfQXI0zmqc3/AD+cnQ1uBizkLuNQUFOEb
 xnjtEH8onQteF23DbXjfYq48XFV+OUj5/QKDmNKebwbWMX3qAYAYjk9P8m2c5sSsPCoo
 jsk98/REB0LQ3eeGj2WJhFRdl+vP5GHD//P2d+bCyvIZhsLlujymbK5JPJH7YOhoh7si
 vz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9D5LFOOL7M248RT3YKkgzKFTBRXhYh2dkwaJ1IaRHxA=;
 b=dROdJAQ6NpcMz0CwnmwMIrARZvBh3kEn/jOjep3ymUJ0XePwf9hJbark8o0e/5PRrg
 EEU1RzX4R3AEckXhMyzGfquL9aLycmSjHRNukqqYMqmv4Zh1TS0VWAjYTiK3+CZTTq8C
 dMVMv1+XIDZ008ZwnKJREMUa3fOiCPSjtiV/Qn2ocgHM+RgXKMXX1sYZ4PmtRiuAhSWv
 JBIwiZsfHooC4ve/NM0t1NKLAz6efjkbI/gF1ieTEBEGoLsgky5ehZOQTRUfL3mzRm3D
 Mk2p4Tu1kuqj22m4YpaTTKoHsaUnbAnVbmdTF95MPsDFTkLXT9TqcF9OE3+lS4tF7DmH
 viQQ==
X-Gm-Message-State: AFqh2kruOnHDCg7Euf0VWt+G83p63BTEswmaiNSRpP80b5cbfGfWAlGU
 ZR/KQJJ1nvrTQwVKTmNYqj0JCg==
X-Google-Smtp-Source: AMrXdXuAKQ0YTIV1hBpWs/3wrPMP3yAYJaFJ9eyf/qO07z2O81ePy+C/Oezlg0JBhGYsf5BvJNWYhA==
X-Received: by 2002:ac2:5b41:0:b0:4a4:68b9:66dd with SMTP id
 i1-20020ac25b41000000b004a468b966ddmr12722492lfp.40.1672744262769; 
 Tue, 03 Jan 2023 03:11:02 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a05651234d000b004b57a253deasm4792967lfr.162.2023.01.03.03.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 03:11:02 -0800 (PST)
Message-ID: <b3ec1abe-7fb4-0c12-33b6-9f4e8d03f8b2@linaro.org>
Date: Tue, 3 Jan 2023 12:11:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/5] arm64: dts: fsd: Add codec node for Tesla FSD
Content-Language: en-US
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 s.nawrocki@samsung.com, perex@perex.cz, tiwai@suse.com,
 pankaj.dubey@samsung.com, alim.akhtar@samsung.com, rcsekar@samsung.com,
 aswani.reddy@samsung.com
References: <20230103045613.100309-1-p.rajanbabu@samsung.com>
 <CGME20230103045703epcas5p2344520777efa3c06321732e2784e6c6c@epcas5p2.samsung.com>
 <20230103045613.100309-5-p.rajanbabu@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103045613.100309-5-p.rajanbabu@samsung.com>
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

On 03/01/2023 05:56, Padmanabhan Rajanbabu wrote:
> Add device tree node support for codec on Tesla FSD platform.
> 
> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd-evb.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> index cf5f2ce4d2a7..e2fd49774f15 100644
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
> @@ -34,6 +35,18 @@
>  	clock-frequency = <24000000>;
>  };
>  
> +&hsi2c_5 {
> +	status = "okay";
> +
> +	tlv320aic3x: codec@18 {
> +		#sound-dai-cells = <0>;
> +		compatible = "ti,tlv320aic3104";
> +		reg = <0x18>;

First compatible, then reg, then the rest.

> +		reset-gpios = <&gpg1 6 GPIO_ACTIVE_LOW>;
> +		status = "okay";

It's by default. Why do you need it?

Best regards,
Krzysztof

