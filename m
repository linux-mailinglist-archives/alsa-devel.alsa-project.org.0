Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF8791B8DD
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 09:48:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1CB12356;
	Fri, 28 Jun 2024 09:48:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1CB12356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719560917;
	bh=X1XDg4CWqLekR5BIvTtoObyb6G/m6s5Hzu4qSPrR74o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cppsfYAohZGcXqEWRW02dzmRJbaR7ucqfNCvNGAjE4tGk1B1yL0tcS8KnggDQ+4//
	 r+KT0WxPholTKizAU2rOqsTcVnri9PvN74Cmd+caC+x8co1cZ7pA5fj3ApwBBY+YjJ
	 rYpUybKNku5DD/VzKQa5DdT6ZeWtIj0AGbFjL+KA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85DBEF80603; Fri, 28 Jun 2024 09:47:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F67EF805FD;
	Fri, 28 Jun 2024 09:47:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BAB0F80495; Fri, 28 Jun 2024 09:47:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55724F80154
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 09:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55724F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=n+jooK8h
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52cdcd26d61so302468e87.2
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 00:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719560830; x=1720165630;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nc4Qf7GLtkVCveBTGX7EpUl9LATF5aggezB8l/JLORQ=;
        b=n+jooK8h78wKd9dThli8g9+AkiWtyCD1EuUAogXPaSPssS0Z7JoqSE20w/aq8w4+Ia
         QK8NsHdNLir7d4vBSN4fWVDmgSX6aGXBa7BpzQvcDN/7d3kHd7cEDbR0JWtEgVF/Uz7k
         L4/MeQY8czcVOBFNm8ap3rIHKy/9eYxC+WKh5+Avu155QayaNYhkw+b9E9cTRwzIZQhY
         nmyB8yG86nhSliUkvM0kEsREshc/emFxEg1E1g481FEVbExI2tzDpEVNG/OsSc1pxBTV
         c0iZwToehNx/e5ALYielBRplUjc7MpLfZ22QbMiRENg2DgsmeVr5y8obhVjtMvHD3R8e
         SryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719560830; x=1720165630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nc4Qf7GLtkVCveBTGX7EpUl9LATF5aggezB8l/JLORQ=;
        b=lGQv28YmGup5G6CpBofRk5ykOzRgA6YWHAFS9+b/lnO84Eb+8EHgN8L999yVTEkmG3
         eDSKb8vCaI2Fxqe9xzxU2bAK72oe8SqDQwVONuITFK9LbI4a0l6hQ2GFWln/hhv2jLzi
         eSR/xFjFNiw54y9v3zgoXe4ycHAquozaAjgdxxaIcImI+dQTCnrtkQAWZLVnr7+QvfhW
         JDdaTl/vIubmolZjwqNMcNkBwLUmf9eixxemZyt/UIc3IaGW0nZkc4au42V8sxcL4kte
         sXPOwB0BmelvxtdqgTz7ckiDG7WABCk5YrnBdadV4tBviyOsVkDRJ9jyNfI21/SRgF4v
         aehQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWktiEbZg70pPp+2aw1ekSsDuD3cn2vV5M8ZxlMTNRiu57DAKUEt4Yu0WCUcmgifws2stwXD4axk3X9O9h5ZC+GVlhrJfHDFnUZqT8=
X-Gm-Message-State: AOJu0YwxhDf6Ko+eE0udcXMMorsKydxU1oIQzuQFOBHTwBxFk1YiLoP5
	6+mYdpgLpS+UV9wRCmRuNhEloYt6Bmq5k9WDmxOvxf8T1UZJjczeNl/xZzjDfVo=
X-Google-Smtp-Source: 
 AGHT+IEDr3s7URgwk4byM1UEJod82amd+japUT2kSdheEtNmdtI5YyE+4VmV/k4KdQ5AmSQUb0CC7w==
X-Received: by 2002:a05:6512:6c7:b0:52e:6d6e:577e with SMTP id
 2adb3069b0e04-52e6d6e5833mr4844105e87.2.1719560830271;
        Fri, 28 Jun 2024 00:47:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab278edsm193556e87.173.2024.06.28.00.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 00:47:09 -0700 (PDT)
Date: Fri, 28 Jun 2024 10:47:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, perex@perex.cz, tiwai@suse.com,
 linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, elder@linaro.org,
	krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: qrb4210-rb2: add HDMI audio
 playback support
Message-ID: <tqjjrkpdrqjobg5fp5jml5pj23ollc4yolln46lb533kwsgncf@tfzaxwydqhht>
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
 <20240628010715.438471-8-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628010715.438471-8-alexey.klimov@linaro.org>
Message-ID-Hash: ZJFRBRWYPYQ7OPDC4PNTYG45LSISFK5I
X-Message-ID-Hash: ZJFRBRWYPYQ7OPDC4PNTYG45LSISFK5I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJFRBRWYPYQ7OPDC4PNTYG45LSISFK5I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jun 28, 2024 at 02:07:15AM GMT, Alexey Klimov wrote:
> Add sound node, dsp-related pieces and LPASS pinctrl to enable
> HDMI audio support on Qualcomm QRB4210 RB2 board. That is the
> only sound output supported for now.

I see that you have also added the MultiMedia DAIs, which don't seem to
be used with this patch.

> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 73 ++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> +&sound {
> +	compatible = "qcom,qrb4210-rb2-sndcard";
> +	pinctrl-0 = <&lpi_i2s2_active>;
> +	pinctrl-names = "default";
> +	model = "Qualcomm-RB2-WSA8815-Speakers-DMIC0";
> +	audio-routing = "MM_DL1",  "MultiMedia1 Playback",
> +			"MM_DL2",  "MultiMedia2 Playback";
> +
> +	mm1-dai-link {
> +		link-name = "MultiMedia1";
> +		cpu {
> +			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +		};
> +	};
> +
> +	mm2-dai-link {
> +		link-name = "MultiMedia2";
> +		cpu {
> +			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
> +		};
> +	};
> +
> +	mm3-dai-link {
> +		link-name = "MultiMedia3";
> +		cpu {
> +			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
> +		};
> +	};
> +
> +	hdmi-dai-link {
> +		link-name = "HDMI Playback";
> +		cpu {
> +			sound-dai = <&q6afedai SECONDARY_MI2S_RX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&lt9611_codec 0>;
> +		};
> +	};
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges = <43 2>, <49 1>, <54 1>,
>  			       <56 3>, <61 2>, <64 1>,
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
