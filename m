Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D11245D97D
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 12:45:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24541188A;
	Thu, 25 Nov 2021 12:44:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24541188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637840708;
	bh=K2M1yqKZUgblfcjM8LaaXU2ul6oa5aOnD8zPjtr9PoM=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L2InJ2l+jTqBdTVxGGT50st7SDaTxf4q/ikvh4ekRfb0NV/LnY2ow0eZRAddMmHWW
	 JtB9uL6skSLMsDQELWoXhat11jUkmLwReR5Vvh1X8kUMKLZI4v0ullVZS7xA2WU0Zh
	 endVq021zea9AmlVVd2r3dITxGuQQlQrDpZhJOcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93B26F804AB;
	Thu, 25 Nov 2021 12:43:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 115B9F8049E; Thu, 25 Nov 2021 12:43:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59134F80087
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 12:43:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59134F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ds59G03w"
Received: by mail-lf1-x136.google.com with SMTP id u3so15631233lfl.2
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 03:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bDXVYx5X81obSGfTLlaLT+GQEL0WeJIjOW6vbyLiEIY=;
 b=Ds59G03w1Vnbc4r3C/ctDco8l7MllxzeTm8/WKHZSxDwIzMP5jW1DiqINzqP3vD494
 +FkfeLnUOZqaEVrvi3hEDDSWw5X9AnACaklqj+SAAGPaD655qnmtAI3Xq51MgC6Let37
 oQ2w48Rdc8hakZcrTRmulpW7v7gHPl5KytSsU/AMiZi1m9I0bEuGuSam9qKjmQ8YWCAK
 vnuzkguNtGnHektjNtmblraZoMwFkA9Ep1uCl1SYYpoxJaMwBTNQlt54HENkmBSFvN28
 Hz6TiGOSfE1AYILSBQhQ4WICaXMmdNeALgAFZBx+gWTGdgkMrhqbhBebDiiGYDx3Y14J
 G1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bDXVYx5X81obSGfTLlaLT+GQEL0WeJIjOW6vbyLiEIY=;
 b=UoB4Hk13ounpo97oqAtLuS2E5rT0ROsS6I+tdPXL7PzEO9l+SVaq2MJox8yl0A0pGT
 jduLl7mlXymWULo+ljeRADjIAmvg/EltTIyBuXgl/zbWVVQG/+sJAWlKspIxCBCz5lHe
 IXXKV9dpaQI8UZeG6PzY5+esj1oQEvc4e8KYqUL6/Z4OZFHsXu8+7+zMNFIFWoeXJSqp
 oRPB54d7wLKMbtV8d3BeAytZKW1foIumxSbwA9eiK2huv3V15Z76lYdlcZJZSDBswUwv
 0FE+G1knvBYCc3Nko3vg+6+IlXInXDeuUaUzHv+gP465DBLdnsx8IWfBpneNleOmm2Xa
 pQ3A==
X-Gm-Message-State: AOAM530V1/xrS6ceCeqH8xItoRV2s8vn6XSNwTkzw0tUhO7GwVBvi5KP
 1N09tBe/V7qmxo5IyzWewuw=
X-Google-Smtp-Source: ABdhPJyG2BdjoNmTWcafcsMypZIAKd/rFtxtTYdkkGEr8bnVW9y8tdzQ7/Un1LStjvFQVYlQwjMe5g==
X-Received: by 2002:a05:6512:2246:: with SMTP id
 i6mr24042132lfu.24.1637840609979; 
 Thu, 25 Nov 2021 03:43:29 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id v2sm216571ljg.46.2021.11.25.03.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 03:43:29 -0800 (PST)
Subject: Re: [PATCH v1 17/20] ARM: tegra: Add S/PDIF node to Tegra20
 device-tree
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
References: <20211124220057.15763-1-digetx@gmail.com>
 <20211124220057.15763-18-digetx@gmail.com>
Message-ID: <98072c48-31ca-aec1-b3a5-3d75d6892e9a@gmail.com>
Date: Thu, 25 Nov 2021 14:43:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211124220057.15763-18-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
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

25.11.2021 01:00, Dmitry Osipenko пишет:
> Add S/PDIF node to Tegra20 device-tree. It's needed for enabling HDMI
> audio support.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra20.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> index 63c2c2f8c0ce..799da7dc929b 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -197,6 +197,7 @@ hdmi@54280000 {
>  			reset-names = "hdmi";
>  			power-domains = <&pd_core>;
>  			operating-points-v2 = <&hdmi_dvfs_opp_table>;
> +			#sound-dai-cells = <0>;
>  			status = "disabled";
>  		};
>  
> @@ -396,6 +397,23 @@ tegra_ac97: ac97@70002000 {
>  		status = "disabled";
>  	};
>  
> +	tegra_spdif: spdif@70002400 {
> +		compatible = "nvidia,tegra20-spdif";
> +		reg = <0x70002400 0x200>;
> +		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&tegra_car TEGRA20_CLK_SPDIF_OUT>,
> +			 <&tegra_car TEGRA20_CLK_SPDIF_IN>;
> +		clock-names = "spdif_out", "spdif_in";
> +		resets = <&tegra_car 10>;
> +		dmas = <&apbdma 3>, <&apbdma 3>;
> +		dma-names = "rx", "tx";
> +		#sound-dai-cells = <0>;
> +		status = "disabled";
> +
> +		assigned-clocks = <&tegra_car TEGRA20_CLK_SPDIF_OUT>;
> +		assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_A_OUT0>;
> +	};
> +
>  	tegra_i2s1: i2s@70002800 {
>  		compatible = "nvidia,tegra20-i2s";
>  		reg = <0x70002800 0x200>;
> 

@Thierry, this patch is made on top of [1].

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=271954
