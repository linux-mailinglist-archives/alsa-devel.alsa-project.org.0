Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E09C54EB67
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 22:41:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E60B1AFC;
	Thu, 16 Jun 2022 22:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E60B1AFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655412069;
	bh=kCD6CW8vme3mBB6gk6CgtHdSzpT9K1JuzDD2Ojds4y4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oC5glTAIAXfebn1EKRKiSvzi8pAcO2u8cfvakUDkLjO8Bf5+MIKQz0wr5OBE5ecxk
	 TTq3fsaF41cEvlnPGXOILPpDlZsOHz2mT9EjQ1+OMnTM7eo4sgy0KtH+d2jYvvV9fQ
	 R8TkzpFT2YhbSgYtNyt40mvQE6mBjIuIvfNIKXpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BA5FF804E0;
	Thu, 16 Jun 2022 22:40:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2A78F804D0; Thu, 16 Jun 2022 22:40:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61AD5F80310
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 22:40:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61AD5F80310
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="OSvwT9JL"
Received: by mail-pg1-x52d.google.com with SMTP id l4so2234101pgh.13
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 13:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JtBNgW1ARnpZB6Usfv9UpMfEN0Bux+WIpRpd7bK6hxQ=;
 b=OSvwT9JLcNTz2PhtzapCz8T4/EZ5bjSd/8SuAYqCmqs9XM+JGPsYPVpZ0Hs6+4PIuA
 a7bYZtU1CVgpeFZFwwMIZ7jZvcgSn8+4wedjyZZRF7y72wvf/W5QFky8iHWAP9FShTxx
 w/B5oRXmdgzFfKAcEI9wfz/+TXI16XsDH5fnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JtBNgW1ARnpZB6Usfv9UpMfEN0Bux+WIpRpd7bK6hxQ=;
 b=RgCG4pt1uqYwr8/7AP5ZXrLTVk8L6s/tN2twc242RLdHR/As7+J8iB2af5NQx1fDak
 LxY5sohiiyqB2R86pUmw42solVxlUU+VgXdIvfwRFtvlw4C1UtgxZ5071rr9ERMltAFu
 xVt4cbGEW/Bdbq0hAFokC1XfDxXBern3eRgdUq8mgdtPpGX6XIhE+RhEfDsu3Uymc8Td
 fVFP1s0dZDCLEuoYX4s+SXFflzzUJ34Hs1eLswjiOWhXBpRXHENkcRcRu4igxFAsj8A9
 QTLo0jjyxPKfm8++tV6wxonKYLxQ85rap2HRPhocCso3T4X02bTu9wEy/8gl58Nx5ccZ
 W/qQ==
X-Gm-Message-State: AJIora+weKoURKMOzPOZ/uBBHOT/k4RBNMHrtySDn8oQjLt0RhcERB7K
 JkdM4IHd2LeaTNPhKcqqHLGKrQ==
X-Google-Smtp-Source: AGRyM1t4XwzbfHdrXzUb66ogKwmRbMD2im+YephNe2bZ85fDvw0CEazfFrh+x12rE1Kl9iAlqYEZ5w==
X-Received: by 2002:a05:6a00:26cf:b0:4f6:fc52:7b6a with SMTP id
 p15-20020a056a0026cf00b004f6fc527b6amr6529975pfw.39.1655412001211; 
 Thu, 16 Jun 2022 13:40:01 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4709:a407:1ca6:24ea])
 by smtp.gmail.com with ESMTPSA id
 jc15-20020a17090325cf00b00168dadc7354sm2064393plb.78.2022.06.16.13.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 13:40:00 -0700 (PDT)
Date: Thu, 16 Jun 2022 13:39:58 -0700
From: Brian Norris <briannorris@chromium.org>
To: Judy Hsiao <judyhsiao@chromium.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: rk3399: i2s: switch BCLK to GPIO
Message-ID: <YquVHsUoSbKfd2CS@google.com>
References: <20220616155836.3401420-1-judyhsiao@chromium.org>
 <20220616155836.3401420-3-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616155836.3401420-3-judyhsiao@chromium.org>
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
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

Hi,

On Thu, Jun 16, 2022 at 03:58:35PM +0000, Judy Hsiao wrote:
> We discoverd that the state of BCLK on, LRCLK off and SD_MODE on
> may cause the speaker melting issue. Removing LRCLK while BCLK
> is present can cause unexpected output behavior including a large
> DC output voltage as described in the Max98357a datasheet.
> 
> In order to:
>   1. prevent BCLK from turning on by other component.
>   2. keep BCLK and LRCLK being present at the same time
> 
> This patch adjusts the device tree to allow BCLK to switch
> to GPIO func before LRCLK output, and switch back during
> LRCLK is output.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>


> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -1662,9 +1662,10 @@ i2s0: i2s@ff880000 {
>  		dma-names = "tx", "rx";
>  		clock-names = "i2s_clk", "i2s_hclk";
>  		clocks = <&cru SCLK_I2S0_8CH>, <&cru HCLK_I2S0_8CH>;
> -		pinctrl-names = "default";
> +		pinctrl-names = "bclk_on", "bclk_off";
>  		pinctrl-0 = <&i2s0_8ch_bus>;
>  		power-domains = <&power RK3399_PD_SDIOAUDIO>;
> +		pinctrl-1 = <&i2s0_8ch_bus_bclk_off>;

It seems like 'pinctrl-1' may make sense after pinctrl-0, not here.
Perhaps you're interacting with my RFC PATCH that removes this
'power-domains' property?

https://lore.kernel.org/linux-rockchip/20220613183556.RFC.1.I9ca71105e505f024d53b7e0ba4462230813ebb8d@changeid/

But that most likely isn't landing upstream as-is.

Otherwise, this patch looks good to me:

Reviewed-by: Brian Norris <briannorris@chromium.org>

>  		#sound-dai-cells = <0>;
>  		status = "disabled";
>  	};
