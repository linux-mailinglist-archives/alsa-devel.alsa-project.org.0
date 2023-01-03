Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E34765BEBC
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 12:14:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 879B3D669;
	Tue,  3 Jan 2023 12:13:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 879B3D669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672744465;
	bh=lEbdPmqpgfDvfbTEvdAKdfQWATwDiebxcsBy3oDLjnA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=H/QfUX/SFEBvHD/yypzH23MuRH+hAyFK22gb/Wqs/mQHYnTvvB1a8abqFfMoHg/DF
	 mm455QfjufJOzQHDkpjNvM3ATIgpV6mDWR0eGz5Ne9vF14R/A8XlfAg63iTqDmwPHK
	 nnTkbq/oLTRLoMbeG/jO8HBqYE6D9nRak5QK/hFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0917EF8003C;
	Tue,  3 Jan 2023 12:13:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56F94F800C0; Tue,  3 Jan 2023 12:13:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 068EDF800C0
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 12:13:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 068EDF800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=P2s5tnD5
Received: by mail-lj1-x235.google.com with SMTP id x37so24561817ljq.1
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 03:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/TWpQiqg2iNv0O2diyiU4mfauguHMd4IysTnhIm0+fM=;
 b=P2s5tnD5MmHi+uSv4kHuF4d8IwY9IgQ+14JhDu+4u3ZxKe97MH/MG6IY8eE/t+dl7m
 b9BWNzeVLkwLYxXe/GZoRxyz2QKbT+dgj3HZyL/HxyYllp1Se9uXmJp8Q7FRJDdPUr+m
 45kWneEaoQoYg3BK5tWcHhHJSIFYnIKb0nB7llMmj/QNCTUzRe0pFMRqhZCoYKWl6YbS
 65dMNkbEioNXPZ+66yQWA8HX5EU6hlozJvDfS/2MlQUjqAu8IMUmMq0IYbpzygECyMBy
 e9+XT4fWylQly35GWrFj9PggXTGHEwgukIZgWnk+EEXvYYiFWix3h71ThCsrv6eVxmfn
 SgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/TWpQiqg2iNv0O2diyiU4mfauguHMd4IysTnhIm0+fM=;
 b=LLpiKtF3G50rI2lceEzhNN3aZCjLbW8laDimA47RRPEKy9phS6eEHKkcPe+vilzb+j
 Eejl0ULlmYLJ7xKuhab12BD+Prbr4yC2fN1yBGXmhyhUr61BxheqKrw0ORoIs+JR+F62
 kl4uxxDmgCzaMnZSVVQG1htWRpcph+XkeppFnLKTr3c1eBKkq9C9thCT8PuoDerbWF0r
 DuaRG0uvulZPG0yeNKZ1Vh8d/lbPTlJ/MSmf0MKZEvIbWHv3yZZTFcBlmOtuJ0Cwo6o+
 Om92Id1O8u7uuQW6yVGWoJ3dkArjgphwAkT6cyGzr6nXlHaa2BsV4oyrRonwSDZS26qV
 VrJQ==
X-Gm-Message-State: AFqh2kr2v7SAYmAnxcSIb0Ilkl2zTTnRZQynbKQ5cyHa4qR8ZYQAM1Nb
 jLedcaUBbOT7ZE9xYY/hXu9rJw==
X-Google-Smtp-Source: AMrXdXsq4eIbXobzEJN/aR14hPh8zbDa75iWKce21g7fG2vNVHzWb4UfMEZpdHsU9qRvjyGv1U9L0A==
X-Received: by 2002:a2e:a583:0:b0:27f:cf81:cbc with SMTP id
 m3-20020a2ea583000000b0027fcf810cbcmr6992503ljp.24.1672744397870; 
 Tue, 03 Jan 2023 03:13:17 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a05651c10aa00b0027fe262a75csm970094ljn.81.2023.01.03.03.13.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 03:13:17 -0800 (PST)
Message-ID: <2c6950c9-3489-c2d4-2ca8-cb723195f75b@linaro.org>
Date: Tue, 3 Jan 2023 12:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/5] arm64: dts: fsd: Add sound card node for Tesla FSD
Content-Language: en-US
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 s.nawrocki@samsung.com, perex@perex.cz, tiwai@suse.com,
 pankaj.dubey@samsung.com, alim.akhtar@samsung.com, rcsekar@samsung.com,
 aswani.reddy@samsung.com
References: <20230103045613.100309-1-p.rajanbabu@samsung.com>
 <CGME20230103045706epcas5p14f2f951d162899234c7f5f7a0998ab6b@epcas5p1.samsung.com>
 <20230103045613.100309-6-p.rajanbabu@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103045613.100309-6-p.rajanbabu@samsung.com>
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
> Add device tree node support for sound card on Tesla FSD board
> 
> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd-evb.dts | 37 +++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> index e2fd49774f15..ce726bddfb50 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -29,6 +29,43 @@
>  		device_type = "memory";
>  		reg = <0x0 0x80000000 0x2 0x00000000>;
>  	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		simple-audio-card,name = "FSD Audio Card";
> +		simple-audio-card,widgets =
> +			"Line", "Line Out",

I don't think you need to break the line after '='.

> +			"Line", "Line In";
> +		simple-audio-card,routing =
> +			"Line Out", "LLOUT",
> +			"Line Out", "RLOUT",
> +			"MIC2L", "Line In",
> +			"MIC2R", "Line In";
> +
> +		status = "okay";

Why?

> +
> +		simple-audio-card,dai-link@0 {
> +			reg = <0>;
> +			format = "i2s";
> +			bitclock-master = <&tlv320aic3x>;
> +			frame-master = <&tlv320aic3x>;
> +
> +			cpu0 {

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

> +				sound-dai = <&i2s_0 0>;
> +			};
> +			cpu1 {
> +				sound-dai = <&i2s_0 1>;
> +			};
> +			codec {
> +				sound-dai = <&tlv320aic3x>;
> +				system-clock-frequency = <33000000>;
> +			};

Best regards,
Krzysztof

