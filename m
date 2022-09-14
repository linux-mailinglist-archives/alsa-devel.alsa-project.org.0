Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0609E5B7DED
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 02:45:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B80D17E8;
	Wed, 14 Sep 2022 02:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B80D17E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663116350;
	bh=NQGLMVxgIwAob8cSZjuzreY4ksDuKijALHzW8anBaSM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h0GQZgT3dDPgpsi/o0jh113bxu6wB79mazXXsupSwvzWvyjbzmRJJy3hib5tYjklw
	 X+NW3xo3tzhPl2g8YdzTZUoVElhRjrVZ49IX2CrX8586Jk6QmJeUWQQH7kE5g0HvJu
	 2jcMXK9N5xg6bsS31tQQ/Tp38+HBymB8ZJGzffl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62531F8025D;
	Wed, 14 Sep 2022 02:44:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93BEEF80224; Wed, 14 Sep 2022 02:44:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FSL_HELO_FAKE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BD96F8008E
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 02:44:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BD96F8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="QaZWAqqj"
Received: by mail-pg1-x534.google.com with SMTP id s206so12881995pgs.3
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 17:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=JXX2yS5w/1K++xKOiGHpDn/FwBROGsdDBxX7sv52/PA=;
 b=QaZWAqqjlNSnM9eoLwGlfdcvS5Nm3ykDJiGkepiKjoJDuzOmgk+LeqWTuJlwQ2hnrN
 8RdxOL9ObiMEmA6sPW8bi2Iq/ETi05CQIn5QvWwuchqlHThXGXJWIPupmIWIdEzmbqqI
 FV9XsXAZ5+surbB9bBKoTYDFfdxjtW8Rx1wpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=JXX2yS5w/1K++xKOiGHpDn/FwBROGsdDBxX7sv52/PA=;
 b=o3XefjzlncJQn2iPQys9pIZUQc6lTQIC1ytqeQZObTNGl7693Zqkp2HvSphdBsQxLd
 6j4jcpyz4hQATbx8OmJC/VcI68Y1vkINSPCVgO2BVgLDIofTIhGU8OOu+wM7G8VRHcHY
 M1Cg08KOOIipL/ZVw3xsfYYRzyW1g8J+ObIoFGw2LQnXsV+0FrmGqTMazptSWTZ7apxY
 dKRUBqtwtWWPDo5QYelYDliOWZ4wciiig446kkiCyHkRea/8gc+JaZ5rcA1mG9MS64uW
 OFziekv+DujqkD/GPUCd2Nti3nXCnaykDJ5GuThS2TZhQ4dj6r3ZIoZm3SgcQllbqlJq
 y9/w==
X-Gm-Message-State: ACgBeo1RsuwjlT7scVXHtpmFTBOe1mQx3N8U9jUyTr2t7ixLBwAMKFcc
 z+3SL3rnG9uA5B0cCUlLFdPggg==
X-Google-Smtp-Source: AA6agR6ajxSwu4MvfAwZmD5yw6opa0TwZ5rTZVuxPSBg77ll7+TMZQhGr2Z2ZdDujviVh4x3iCUFeg==
X-Received: by 2002:a63:698a:0:b0:41c:8dfa:e622 with SMTP id
 e132-20020a63698a000000b0041c8dfae622mr29387714pgc.465.1663116275332; 
 Tue, 13 Sep 2022 17:44:35 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c6e2:a019:5c54:fb4c])
 by smtp.gmail.com with ESMTPSA id
 21-20020a621515000000b0053e5ebafd5csm8462402pfv.189.2022.09.13.17.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 17:44:34 -0700 (PDT)
Date: Tue, 13 Sep 2022 17:44:32 -0700
From: Brian Norris <briannorris@chromium.org>
To: Judy Hsiao <judyhsiao@chromium.org>
Subject: Re: [PATCH v1] ASoC: rockchip: i2s: use regmap_read_poll_timeout to
 poll I2S_CLR
Message-ID: <YyEj8FC9YtnCScWW@google.com>
References: <20220908151142.1479810-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908151142.1479810-1-judyhsiao@chromium.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org
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

Hi Judy,

On Thu, Sep 08, 2022 at 03:11:42PM +0000, Judy Hsiao wrote:
> Use regmap_read_poll_timeout to poll I2S_CLR.
> It also fixes the 'rockchip-i2s ff070000.i2s; fail to clear' and
> return -EBUSY when the read of I2S_CLR exceeds the retry limit.
> 
> Fixes: 0ff9f8b9f592 ("ASoC: rockchip: i2s: Fix error code when fail
> to read I2S_CLR")
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>

Thanks for the patch!

> ---
>  sound/soc/rockchip/rockchip_i2s.c | 39 +++++++++++++------------------
>  1 file changed, 16 insertions(+), 23 deletions(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
> index f5f3540a9e18..02905eec615e 100644
> --- a/sound/soc/rockchip/rockchip_i2s.c
> +++ b/sound/soc/rockchip/rockchip_i2s.c
> @@ -163,18 +163,14 @@ static int rockchip_snd_txctrl(struct rk_i2s_dev *i2s, int on)
>  						 I2S_CLR_TXC | I2S_CLR_RXC);
>  			if (ret < 0)
>  				goto end;
> -			regmap_read(i2s->regmap, I2S_CLR, &val);
> -
> -			/* Should wait for clear operation to finish */
> -			while (val) {
> -				regmap_read(i2s->regmap, I2S_CLR, &val);
> -				retry--;

I think you're leaving |retry| as a "set but unused" variable now.
Presumably some compile-testing bots will eventually complain at you
about that.

> -				if (!retry) {
> -					dev_warn(i2s->dev, "fail to clear\n");
> -					ret = -EBUSY;
> -					break;
> -				}
> -			}
> +			ret = regmap_read_poll_timeout(i2s->regmap,
> +						       I2S_CLR,
> +						       val,
> +						       val != 0,
> +						       20,
> +						       200);
> +			if (ret < 0)
> +				dev_warn(i2s->dev, "fail to clear\n");

Now would be a good time to print the return code, I think:

				dev_warn(i2s->dev, "fail to clear: %d\n", ret);

>  		}
>  	}
>  end:
> @@ -226,17 +222,14 @@ static int rockchip_snd_rxctrl(struct rk_i2s_dev *i2s, int on)
>  						 I2S_CLR_TXC | I2S_CLR_RXC);
>  			if (ret < 0)
>  				goto end;
> -			regmap_read(i2s->regmap, I2S_CLR, &val);
> -			/* Should wait for clear operation to finish */
> -			while (val) {
> -				regmap_read(i2s->regmap, I2S_CLR, &val);
> -				retry--;
> -				if (!retry) {

Same.

> -					dev_warn(i2s->dev, "fail to clear\n");
> -					ret = -EBUSY;
> -					break;
> -				}
> -			}
> +			ret = regmap_read_poll_timeout(i2s->regmap,
> +						       I2S_CLR,
> +						       val,
> +						       val != 0,
> +						       20,
> +						       200);
> +			if (ret < 0)
> +				dev_warn(i2s->dev, "fail to clear\n");

Same.

>  		}
>  	}
>  end:

Otherwise, this is definitely a good change, since we have no timing
guarantee on the existing retry loop, which will surely make it flaky.
So, with those fixups:

Reviewed-by: Brian Norris <briannorris@chromium.org>
