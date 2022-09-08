Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7663E5B1BF7
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 13:55:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED64C16FE;
	Thu,  8 Sep 2022 13:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED64C16FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662638119;
	bh=kxaw0qKbbAdaST2Qvs/MCXFcl8zd8GFz+cvOwYneCL0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rRAoeOsAZyZao9stJxkmsQTDzi0AV9CR9LCQNXHHd2Uc6Uhr9kHtHokmZlJ6URz5D
	 tagBqUkM8jvexaS8zrwa3GW5Op8d5iClk0dO48qQlTuAdPHnzkk+uAtDNLBc6MdYGI
	 ubet0WWJKri68uX3MHOhNKWxBEkWjv43shQr4GjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DD8AF803DC;
	Thu,  8 Sep 2022 13:54:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BCF8F803DC; Thu,  8 Sep 2022 13:54:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 217CBF803DC
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 13:54:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 217CBF803DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rpOWzDfs"
Received: by mail-lf1-x133.google.com with SMTP id k10so12695201lfm.4
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 04:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=VQGJlHRUp9nhyc0mzEwq4F9INwDBtUr5VdutZE2f0C0=;
 b=rpOWzDfsWc/FX3v+6r9PYQh7U5C1YOoTSXb4txAsmoBQGG3ORBVLbBqvRIDdYVpFPY
 t115kYTzdwfuixU/4HZIsr5zkGaN68n2B0DoEP1z5MM9pKZKuP4NIJmNfhvCw9X+Sc7z
 PDI+/+OhZucTNjh6kzCSGVKicS0be6JqB0iMm7ALH8KKSZW5sPfSMOGznKBiHBSxvk5C
 xjJIC9J3jw9cWTaHgS2O8bbAROKO7fYmZXCLPSEsElj7SMMte8pY6XU5UH8zD4dRe3RY
 XCCKmdAtnSxG6PpMuZP/D8DVBoMYxRPkik02ETeOtYTfbhKn8J+ebinCesIW28MgpZEf
 xW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=VQGJlHRUp9nhyc0mzEwq4F9INwDBtUr5VdutZE2f0C0=;
 b=Xlok8GjquxnWDvDMd9bN9THUKG0xhqDP5VjolTfPtEDUx5wcr0Rf5ujMrzosCNP8f2
 meiKNK4hwMtSswHAvJEChwF3ywsDUyoc6O0fUQHOyMtW4OXhV8OAs9oLZCIbRuURGDLv
 VRe3ZY5QmXyBASklRzt1Ndxw3/liYHAbzQbfw0nq1kkYSUQnqavUvOoan1GIXLhdg2r9
 N9pKEE4QM3XJLJULKahR/HJ4S0K0wxR/CJcffCRy3gxnJJ0WLPp/RBtgBepm07a9Mbqw
 JQ31tYY4YdtY8a+MmXkp7jOpm96Z68vUnPg+qz9FA9Sedp3XgYtqWwkkoJ2MGgxJ3Q7V
 H2gQ==
X-Gm-Message-State: ACgBeo1qSZTDbT8gO2DkEFFdTDZxeiVAV0oVmqKBLKBzFIbswFdv/FAf
 YBqIUaue0mZyv5yZDfmBAWB3DQ==
X-Google-Smtp-Source: AA6agR55o8YlOLOcDDvDdE3Ln5Z6r6dux+o/bKmvUpIRktp1YWOKL8JyrdpmTvZvgjal7Wn8hbwa3Q==
X-Received: by 2002:a05:6512:1581:b0:492:8c61:5bef with SMTP id
 bp1-20020a056512158100b004928c615befmr2732713lfb.518.1662638040100; 
 Thu, 08 Sep 2022 04:54:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 u9-20020a056512094900b0048b143c09c2sm3001480lft.259.2022.09.08.04.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 04:53:59 -0700 (PDT)
Message-ID: <c9adeeeb-8edd-f912-1aab-b19508187eef@linaro.org>
Date: Thu, 8 Sep 2022 13:53:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 4/8] arm64: dts: rockchip: add the internal audio codec
Content-Language: en-US
To: luca.ceresoli@bootlin.com, alsa-devel@alsa-project.org,
 linux-rockchip@lists.infradead.org
References: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
 <20220907142124.2532620-5-luca.ceresoli@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907142124.2532620-5-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Johan Jonker <jbx6244@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

On 07/09/2022 16:21, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> The RK3308 has a built-in audio codec that connects internally to i2s_8ch_2
> or i2s_8ch_3.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3308.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
> index 093b70563b23..221cde49dc98 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
> @@ -808,6 +808,20 @@ cru: clock-controller@ff500000 {
>  		assigned-clock-rates = <32768>;
>  	};
>  
> +	acodec: acodec@ff560000 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof
