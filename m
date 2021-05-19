Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B029E389196
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 16:41:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 351B4167C;
	Wed, 19 May 2021 16:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 351B4167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621435268;
	bh=eeEmaauUIzMeU3r4Gc7OkOEsE/9uottpKMaHudZoi00=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aYf3rL+6OP0UYerOiFTAw4WVnDc9//Op6gMsraWywxWZ3Bu7yQxZyTleqhRO9jNu0
	 UIUIYK6Y/HYEznTbSxvhF5x7d8S9PaAr7D0pudKPJHdsh902dMYsyflyegimFtHbsw
	 RvzRvALo2PyKJIkRcVvL+pKUfIVgD4pQw2nRDImM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94F8CF8016E;
	Wed, 19 May 2021 16:39:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FF40F8016E; Wed, 19 May 2021 16:39:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 558E8F80127
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 16:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 558E8F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="BSofIsce"
Received: by mail-wr1-x433.google.com with SMTP id i17so14267056wrq.11
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 07:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=brguJP1TRfkhoTJgsl8Q1B6FJtdnvT+9aum6CCLmyKI=;
 b=BSofIscenrll+wtAbZVziWi2CjNiD3KGjR7g8Y/cQgbk2KYNrwhXwX0fAOCqcTAUcR
 1m6u35SMvrNsMiN4T4z3PyLe+kwJGHZgg1tpLr6ALjsBgAA1vc8eUIuVTu8y1AdvdWYN
 gjz5NHThtBnnt5pEUVwRZsnWCSR/6tyn95Mjs3JJnqGSpLAWglu6647iOGUXaz8X8X3D
 nQ1UDPp0RYP0wc07+vAOqVa9EK3fA84cSEY5woWkFI2dGakoIxGY/RZKuDHhvTjJcxEy
 OXPKrxh5bmj+3g4Su69PFC1/RHpKc3Syjz87pR2K2UdtrshnNgIBvjGtNLRlOqq4Tz4m
 RGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=brguJP1TRfkhoTJgsl8Q1B6FJtdnvT+9aum6CCLmyKI=;
 b=cjjPBZHel1hkvLG0zSZhnrJ+k6SGKvYftNteeRDf4LURTzoRC6Q2TFGgQpdSe5jc33
 mmGVKMoGvfu/deauLR+ibP6FQyI8gQ7CfrtlyRAwmj4JP6qIuNcCM1Fb0NNnYpTsqo7F
 fYp1PGBkzRRifc1cJ+lr+ax/poUWMaCn4CfScSCiQAellqbFQau278YYe1oKKOt5V3Gk
 Jzx+Txf5y+3EG0muEMduIbHYh8lTlUm3/P1020T5SblcOBRbGgv9tSdHOJ2hSX2r1Mpp
 V1knBOrx4694Wwmhepu28FrcIrLxnFC+095FgM1gbWYhuQ7aVjiCFAtHSM8Us2fDPfRi
 IvFQ==
X-Gm-Message-State: AOAM5317a0tzdjoETsT2aROoawI2X7W5VOYtAn0+vTRoIo89MRAiFO1t
 Nmpz4uSLIJZDnflGnEz0WomFng==
X-Google-Smtp-Source: ABdhPJz09XPcH5af8DhPokNsIK+NhdlGR/EmcisNcRXKH1/9rm4wA0gp+EyQCV9V7mZI2l2AMaDP2Q==
X-Received: by 2002:a05:6000:104a:: with SMTP id
 c10mr15035593wrx.45.1621435170708; 
 Wed, 19 May 2021 07:39:30 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id c15sm25760443wro.21.2021.05.19.07.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:39:30 -0700 (PDT)
Date: Wed, 19 May 2021 15:39:28 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH v11 1/4] mfd: Add Rockchip rk817 audio CODEC support
Message-ID: <20210519143928.GG2415519@dell>
References: <20210515025749.11291-1-macroalpha82@gmail.com>
 <20210515025749.11291-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210515025749.11291-2-macroalpha82@gmail.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, lgirdwood@gmail.com, linux-rockchip@lists.infradead.org,
 broonie@kernel.org, Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 maccraft123mc@gmail.com
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

On Fri, 14 May 2021, Chris Morgan wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add rk817 codec support cell to rk808 mfd driver.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Tested-by: Maciej Matuszczyk <maccraft123mc@gmail.com>
> ---
>  drivers/mfd/rk808.c       | 83 +++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/rk808.h | 81 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 164 insertions(+)
> 
> diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
> index ad923dd4e007..b94f805719a6 100644
> --- a/drivers/mfd/rk808.c
> +++ b/drivers/mfd/rk808.c
> @@ -65,6 +65,7 @@ static bool rk817_is_volatile_reg(struct device *dev, unsigned int reg)
>  	switch (reg) {
>  	case RK817_SECONDS_REG ... RK817_WEEKS_REG:
>  	case RK817_RTC_STATUS_REG:
> +	case RK817_CODEC_DTOP_LPT_SRST:
>  	case RK817_INT_STS_REG0:
>  	case RK817_INT_STS_REG1:
>  	case RK817_INT_STS_REG2:
> @@ -163,6 +164,9 @@ static const struct mfd_cell rk817s[] = {
>  		.num_resources = ARRAY_SIZE(rk817_rtc_resources),
>  		.resources = &rk817_rtc_resources[0],
>  	},
> +	{
> +		.name = "rk817-codec",
> +	},

This should be on a single line please.

Once fixed, please apply my:

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
