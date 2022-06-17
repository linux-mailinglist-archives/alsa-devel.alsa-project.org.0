Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC28054FE7C
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 22:47:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FF511EF6;
	Fri, 17 Jun 2022 22:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FF511EF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655498878;
	bh=TQiIgCKLuC256bxvH2syv5jjB9OeKvNN9su4b4GkcAk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CCSP7sfqfvjPBdT1oz45+MwDu46AE/5YLiCDzxH8oIpgSJSfBH9kUCC1TbT8g8hh+
	 KkE0j91XRjqQBxdp4Q4spFHJCXsGn2f6Xwa48LbgfQOrroc+qFhIYjnII7kzjtMFe2
	 594qythuo4k7RYL51ltE4SB5yn/I1To14J+DTo3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93BF6F80528;
	Fri, 17 Jun 2022 22:46:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DC45F80527; Fri, 17 Jun 2022 22:46:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE6C4F800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 22:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE6C4F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="lSFDDXp8"
Received: by mail-pg1-x52c.google.com with SMTP id 193so2139072pgc.2
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 13:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GXaclX1FL0h8CGb7nidVOvl5KYslHnP1qP5vHuFEg/o=;
 b=lSFDDXp8fJxd3k1/NPPifUGgBLPdaE22CTJKPLAyp43SGjKFomXAGiePTZ42BlIrJh
 odqD9O7PRMXQHJrgctB/Y5S4MWjuJgaJD8WmZ8sebu3eFFWTXjdDxTbzEMVwKQUMkU4q
 U6exfnONG79nydNKJedyEQ72Xcs+9MEgrbF4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GXaclX1FL0h8CGb7nidVOvl5KYslHnP1qP5vHuFEg/o=;
 b=Veymkfyh2ivRzPoQgni53FLvfZzTRDYK/j82o8bYbOBulDg2v4ZXCAI/MkVfPRbf9e
 hfwl9StMpgNEoXChnVW7oAaBM0sJnj4NwCiP+m8HBUXMNGDCWsWEUSOfZSXh/fWci5+F
 PaX2/GZywww2BthEFIwzJxxcvE5qS/sAKHJNY/Cmm4HvBK6fJj6NSiNuIpQCs3mXkABJ
 AeTnEqrLelqDXhGtxonXGUmq6P31XuSJxylqo3qKHEUhBXDPMNKddO470nxV5LGLPUab
 UIo6d7F7fqkHLEmCDtSQ8a6oyHYThg8yrghIXPeoA4vis9+SuN/+8al4iqnRcikjOSM7
 +k0w==
X-Gm-Message-State: AJIora+kQbYrGTatiQAWxRig7z6ik/1Jrqvm/twSS5fToZ3RG12CPl/N
 lCPTZMrJJqlPX8zXMfZeKSwncw==
X-Google-Smtp-Source: AGRyM1tK3U/ZG9n4Mvxa/4Mm4J4wxTavnLkXJYks8NkYt9StAA0o/gzzGm6jYf7ZHj2JUirJCeCBHg==
X-Received: by 2002:a05:6a00:b8c:b0:51c:2d3d:4595 with SMTP id
 g12-20020a056a000b8c00b0051c2d3d4595mr11829256pfj.80.1655498809321; 
 Fri, 17 Jun 2022 13:46:49 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6844:cedc:a28c:44b2])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a17090a428700b001e2f383110bsm5904549pjg.11.2022.06.17.13.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 13:46:48 -0700 (PDT)
Date: Fri, 17 Jun 2022 13:46:46 -0700
From: Brian Norris <briannorris@chromium.org>
To: Judy Hsiao <judyhsiao@chromium.org>
Subject: Re: [PATCH v3 1/3] ASoC: rockchip: i2s: switch BCLK to GPIO
Message-ID: <YqzoNqd3Mpv3r2tS@google.com>
References: <20220616155836.3401420-1-judyhsiao@chromium.org>
 <20220617044251.4029697-1-judyhsiao@chromium.org>
 <20220617044251.4029697-2-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617044251.4029697-2-judyhsiao@chromium.org>
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

On Fri, Jun 17, 2022 at 04:42:49AM +0000, Judy Hsiao wrote:
> We discovered that the state of BCLK on, LRCLK off and SD_MODE on
> may cause the speaker melting issue. Removing LRCLK while BCLK
> is present can cause unexpected output behavior including a large
> DC output voltage as described in the Max98357a datasheet.
> 
> In order to:
>   1. prevent BCLK from turning on by other component.
>   2. keep BCLK and LRCLK being present at the same time
> 
> This patch switches BCLK to GPIO func before LRCLK output, and
> configures BCLK func back during LRCLK is output.
> 
> Without this fix, BCLK is turned on 11 ms earlier than LRCK by the
> da7219.
> With this fix, BCLK is turned on only 0.4 ms earlier than LRCK by
> the rockchip codec.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
>  sound/soc/rockchip/rockchip_i2s.c | 167 ++++++++++++++++++++++--------
>  1 file changed, 121 insertions(+), 46 deletions(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
> index 47a3971a9ce1..5e3cb06377a1 100644
> --- a/sound/soc/rockchip/rockchip_i2s.c
> +++ b/sound/soc/rockchip/rockchip_i2s.c

> @@ -92,39 +122,46 @@ static inline struct rk_i2s_dev *to_info(struct snd_soc_dai *dai)
>  	return snd_soc_dai_get_drvdata(dai);
>  }
>  
> -static void rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
> +static int rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
>  {
>  	unsigned int val = 0;
>  	int retry = 10;
> -
> +	int ret = 0;
> +
>  	spin_lock(&i2s->lock);
>  	if (on) {
> -		regmap_update_bits(i2s->regmap, I2S_DMACR,
> -				   I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_ENABLE);
> -
> -		regmap_update_bits(i2s->regmap, I2S_XFER,
> -				   I2S_XFER_TXS_START | I2S_XFER_RXS_START,
> -				   I2S_XFER_TXS_START | I2S_XFER_RXS_START);
> -
> +		ret = regmap_update_bits(i2s->regmap, I2S_DMACR,
> +			I2S_DMACR_TDE_ENABLE, I2S_DMACR_TDE_ENABLE);
> +		if (ret < 0)
> +			goto end;
> +		ret = regmap_update_bits(i2s->regmap, I2S_XFER,
> +			I2S_XFER_TXS_START | I2S_XFER_RXS_START,
> +			I2S_XFER_TXS_START | I2S_XFER_RXS_START);

This still isn't how I'd expect the indentation to look, but I think I
will stop complaining about whitespace. Maybe you can either use
'clang-format' (sparingly), or else see what Mark thinks.

> +		if (ret < 0)
> +			goto end;
>  		i2s->tx_start = true;
>  	} else {
>  		i2s->tx_start = false;
>  
...

>  static void rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)

I didn't think I needed to call this out, because you already got build
bots complaining about this, but...
...did you even compile-test this? You should be making this function
return 'int', not 'void', because you're adding return values below.

>  {
>  	unsigned int val = 0;
>  	int retry = 10;
> +	int ret = 0;
>  
...
> +end:
>  	spin_unlock(&i2s->lock);
> +	if (ret < 0)
> +		dev_err(i2s->dev, "lrclk update failed\n");
> +
> +	return ret;

^^ here.

>  }
>  
>  static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,

Aside from those, I think this looks OK to the best of my
(not-very-familiar with sounds/soc/) ability:

Reviewed-by: Brian Norris <briannorris@chromium.org>
