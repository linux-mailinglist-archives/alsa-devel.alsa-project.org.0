Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FEA599CAE
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 15:14:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B4AF16B6;
	Fri, 19 Aug 2022 15:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B4AF16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660914846;
	bh=M5sJA+4wOyq6PshJuGGO5iDCSD2KdeA4+WwfIJzHf4A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oPc5D3q+o6IX61rj4YZ73KqJOJi/Zvd+5ESeVx1GIkB5xkeHXL7Uic1vOQOMN7iAL
	 y6cpLb83FCXJjWe90M5ykWT2xf6PEd7jHvOse3RpRYLReGeGgMVaUAH9JjVzKQ2lT9
	 r7cTFq+8Ztje7ftwQlKXAOvHnfNWF5w9aG+b/zyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A207F801F7;
	Fri, 19 Aug 2022 15:13:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 719E1F800B5; Fri, 19 Aug 2022 15:13:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48EF9F800B5
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 15:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48EF9F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Mm+XwoLh"
Received: by mail-lf1-x12c.google.com with SMTP id z25so6106022lfr.2
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 06:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=1+BR4rDQN1hkhfT6kogWluPYgnRMjeAFXBEVDjlIhyY=;
 b=Mm+XwoLhbjB1cUquH2nI6XAsgf46x6z5xxfd/c+vvysAgHSw4MKjDKPGH8Le0gKS2o
 E/mWThe9V6JEJrV6o3wW2VE5On3tZIxDhJbCyprkN5gMm/Qr61nLrG0uoOkuf2Ec7wWb
 VobSFgaN449vit9p5Xoo3E9qLUgOV9ZsjdX/L82dR4XhfsOmYCop69ZyK6p7q8jKW2f9
 Cv8NutBtvaDQWaRA553UHNkfGavuESsZWgkj3pOeNfeK/OjzDlUXDuHf1Ddin+fePMrZ
 Divj6CFTaGgWhdC4bRTjxIBZW91wfbXgttfP69q5GGFfpBZNqoeBpjM6GaReWXIfDaoa
 L12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=1+BR4rDQN1hkhfT6kogWluPYgnRMjeAFXBEVDjlIhyY=;
 b=RouWgGN03xxsCVvZxr1fKBoEnjkfQo+kj5ExRzF9ONuKTjx5jt7IWSjX+HcT9qo7GA
 NqJ6/T7eBYXyBxB3QX9HSAIjSDwnHy5GjUGEY/rhn6sHyllgfkBmSKtAaxGt6VO5yov2
 hiPvEm91+EnxaOov3Jfa+64mYpnCEVwOrhdCbjCqdWDMd+CI3y9+fcPFS5QQlrKB6EGQ
 LhqO6XcTe49K7p2ffKZtef1ol7tqb0GjRox52EG/LelGEnExA0GJnypy7tFbIPHnbrLb
 25TMgVSKC+7RvVQoBRFtRGh3H9fDQg3SMXl429ZOu6k/sQrs6HmSIY0FhyKKeUjE2qCc
 v6/g==
X-Gm-Message-State: ACgBeo0IxZ7XKeEX3RVidy1nLE89y1fSP1ChzemaoKlYINHqH+DQxLgU
 EZIq0VOvCpq74zWoAe1gZ2sxvQ==
X-Google-Smtp-Source: AA6agR7Jl+hYFxUbkuB2Ukvk+i6QTFpmW4GiQyzt6DOiMyZCjAWZly+NaiGCSEV5xqMzEGUFKAlTAQ==
X-Received: by 2002:a05:6512:281f:b0:48b:824:9741 with SMTP id
 cf31-20020a056512281f00b0048b08249741mr2615778lfb.135.1660914775898; 
 Fri, 19 Aug 2022 06:12:55 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5?
 (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi.
 [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
 by smtp.gmail.com with ESMTPSA id
 be24-20020a05651c171800b0025dfe45c031sm613986ljb.27.2022.08.19.06.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 06:12:55 -0700 (PDT)
Message-ID: <38094e2d-c75c-920b-4b4d-aa377971f615@linaro.org>
Date: Fri, 19 Aug 2022 16:12:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/4] arm64: dts: apple: t8103: Add MCA and its support
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220819125430.4920-1-povik+lin@cutebit.org>
 <20220819125430.4920-3-povik+lin@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819125430.4920-3-povik+lin@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 asahi@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 19/08/2022 15:54, Martin Povišer wrote:
> Add the MCA I2S transceiver node and its supporting NCO, ADMAC nodes.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> ---
>  arch/arm64/boot/dts/apple/t8103.dtsi | 70 ++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 51a63b29d404..2dc3125aca5b 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -532,6 +532,76 @@ port02: pci@2,0 {
>  						<0 0 0 4 &port02 0 0 0 3>;
>  			};
>  		};
> +
> +		dart_sio: iommu@235004000 {
> +			compatible = "apple,t8103-dart", "apple,dart";
> +			reg = <0x2 0x35004000 0x0 0x4000>;
> +			interrupt-parent = <&aic>;
> +			interrupts = <AIC_IRQ 635 IRQ_TYPE_LEVEL_HIGH>;
> +			#iommu-cells = <1>;
> +			power-domains = <&ps_sio_cpu>;
> +		};
> +
> +		nco_clkref: clock-ref {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <900000000>;
> +			clock-output-names = "nco_ref";
> +		};

Reference clocks are usually physically outside of SoC (e.g. on the
board), so:
1. Not part of "soc" node.
2. It should be defined by board. At least clock-frequency should be there.

> +
> +		nco: nco@23b044000 {
> +			compatible = "apple,t8103-nco", "apple,nco";
> +			reg = <0x2 0x3b044000 0x0 0x14000>;
> +			clocks = <&nco_clkref>;
> +			#clock-cells = <1>;
> +		};
> +
> +		admac: dma-controller@238200000 {
> +			compatible = "apple,t8103-admac", "apple,admac";
> +			reg = <0x2 0x38200000 0x0 0x34000>;
> +			dma-channels = <24>;
> +			interrupts-extended = <0>,
> +					      <&aic AIC_IRQ 626 IRQ_TYPE_LEVEL_HIGH>,
> +					      <0>,
> +					      <0>;
> +			#dma-cells = <1>;
> +			iommus = <&dart_sio 2>;
> +			power-domains = <&ps_sio_adma>;
> +		};
> +
> +		mca: mca@38400000 {

Here node name is as well wrong.

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation



Best regards,
Krzysztof
