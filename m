Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4572D3793B6
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 18:25:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8F44176C;
	Mon, 10 May 2021 18:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8F44176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620663911;
	bh=+FgbWHIMgFarBe5RdwHiXj2cHVkJEf1MLqSWLVcQ6YE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Taql2J8VJS2dcJPmLbRQPNHzO4VwlLn2wPuQeH0KhQOisKpCKjF6EaXm9/w+gBrDN
	 7lo5gh5GcNtY8Kc34UfS7rZL9GKMU5+IAruK6B4Ea7V1kXEzOhh8/WbXrYEEsKol0g
	 fs6G31dgJbKh7yyZke20g2Pha93i7g1/mjLtLhH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F953F8026B;
	Mon, 10 May 2021 18:23:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97F47F80240; Mon, 10 May 2021 18:23:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84EC2F800B4
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 18:23:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84EC2F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="tho8uH6l"
Received: by mail-wr1-x434.google.com with SMTP id t18so17270929wry.1
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 09:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pAVO1X2g83KFpJr+VRtjEpm1xy0mTpiwbotFKSCDfrM=;
 b=tho8uH6lS0ZKz9TYE1ODbtUPO4F0IC0NoPyVTkDKcmjOx/a77heA+Voc353oVfwv/j
 cNVBQwrUateA8/7ee9rl2Tnp/FvBHcLTIjRf+HtdO9cZVMJnt9yOFAGesDVDCPGKJUaA
 UpfMWkDvv3fIEYKHsdt5HM2ARc0M97lNetHf5cIRr9A3Pgc96RCgq5RZ/BcluSRAj7uY
 ioX9/j4YpAgFh/1FH3RLKMd340B7xDqOqwmfhd+lUsXD3xXr1UNL/Fnl0sdZEJsiCSUp
 uDdjl9q/jGqNwj2UloLIfaSCHuEQ0WZvyJPuBAqEicaj3g7o2Dx42McOY6swZ6QAbMZO
 hVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pAVO1X2g83KFpJr+VRtjEpm1xy0mTpiwbotFKSCDfrM=;
 b=m4RkfQHjikUMmu+APE5fFTiOOknvnx1Br+OaQ6X+DR2V2pV0iRftvYkzbsZg7CdhKv
 h5rR0m+R878P6/l0YPiBj93BBLvtLyItkF8mR5v+Yuu5iqOUPnAmZQAd+HIQkr8umvox
 TMD0e7hd5TMSsYFdMnmn2naWFMDCz/oEpXNgHwBj51qfbfw7gaDVuvM43ZEtC+W8BUBv
 bhzVAUO77kyy36INbxMNHfYEqXmLNgGwwoVTPWnbul+UJT2qfYrp+RvVsfL2zlZHPhsp
 QQpfAq8YnKcDUh3JDzK32aKY/0DEmRr6agZOVNfbBlfpev67YWeGpFnjrwRIQ5cfvGCI
 clUw==
X-Gm-Message-State: AOAM530jOlN297nbHGe4yFr4b07JgQe+qCJ2Iq/+4VaKarqkn4CVfidj
 K9uTjSkz1iZzK48vI2Q5ep5Z/w==
X-Google-Smtp-Source: ABdhPJxgGEJ4wLrGR1leB3+o+J/MnMHhPZjJSNbo1DWxXfho0aqsuWaGKYLAqW8svfbRAxIyws6U5g==
X-Received: by 2002:adf:dcc5:: with SMTP id x5mr32374719wrm.1.1620663811271;
 Mon, 10 May 2021 09:23:31 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id m11sm18604803wmq.33.2021.05.10.09.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 09:23:30 -0700 (PDT)
Date: Mon, 10 May 2021 17:23:29 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH v9 1/4] mfd: Add Rockchip rk817 audio CODEC support
Message-ID: <20210510162329.GD751702@dell>
References: <20210505140854.15929-1-macroalpha82@gmail.com>
 <20210505140854.15929-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210505140854.15929-2-macroalpha82@gmail.com>
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

On Wed, 05 May 2021, Chris Morgan wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add rk817 codec support cell to rk808 mfd driver.
> 
> Tested-by: Maciej Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Nit: These should be chronological.

> ---
> Changes in v9:
>  - Add cover letter.
>  - Remove documentation for interrupt parent per Rob Herring's request.
>  - Remove unused MODULE_DEVICE_TABLE to fix a bug identified by kernel test
>    robot.
> Changes in v8:
>  - Added additional documentation for missing properties of #sound-dai-cells,
>    interrupt-parent, and wakeup-source for mfd documentation.
>  - Corrected order of elements descriptions in device tree documentation.
>  - Changed name of "mic-in-differential" to "rockchip,mic-in-differential".
>  - Changed name of sound card from "rockchip,rk817-codec" to "Analog".
>  - Removed unused resets and reset-names from the i2s1_2ch node.
> Changes in v7:
>  - Removed ifdef around register definitions for MFD.
>  - Replaced codec documentation with updates to MFD documentation.
>  - Reordered elements in example to comply with upstream rules.
>  - Added binding update back for Odroid Go Advance as requested.
>  - Submitting patches from gmail now.
> Changes in v6:
>  - Included additional project maintainers for correct subsystems.
>  - Removed unneeded compatible from DT documentation.
>  - Removed binding update for Odroid Go Advance (will do in seperate series).
> Changes in v5:
>  - Move register definitions from rk817_codec.h to main rk808.h register
>    definitions.
>  - Add volatile register for codec bits.
>  - Add default values for codec bits.
>  - Removed of_compatible from mtd driver (not necessary).
>  - Switched to using parent regmap instead of private regmap for codec.
> Changes in v4:
>  - Created set_pll() call.
>  - Created user visible gain control in mic.
>  - Check for return value of clk_prepare_enable().
>  - Removed duplicate clk_prepare_enable().
>  - Split DT documentation to separate commit.
> Changes in v3:
>  - Use DAPM macros to set audio path.
>  - Updated devicetree binding (as every rk817 has this codec chip).
>  - Changed documentation to yaml format.
>  - Split MFD changes to separate commit.
> Changes in v2:
>  - Fixed audio path registers to solve some bugs.
> 
>  drivers/mfd/rk808.c       | 85 +++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/rk808.h | 81 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 166 insertions(+)
> 
> diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
> index ad923dd4e007..9231209184e0 100644
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
> @@ -163,6 +164,11 @@ static const struct mfd_cell rk817s[] = {
>  		.num_resources = ARRAY_SIZE(rk817_rtc_resources),
>  		.resources = &rk817_rtc_resources[0],
>  	},
> +#ifdef CONFIG_SND_SOC_RK817
> +	{
> +		.name = "rk817-codec",
> +	},
> +#endif

No #ifery please.

Just replace it with a comment.

If no associated driver exists, it just won't match/bind.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
