Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D633E8965
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 06:26:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0CAE173B;
	Wed, 11 Aug 2021 06:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0CAE173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628655966;
	bh=i3lJsJ7O/rOe3yf9/t2qEk8XE+JmadOP7XDwXwEbW+w=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SVPLTDJe36jbPIvsNZj1LRzi8UjtyyXiWmJb1/1BXDPS9YfRluLT0J+DEe4z+IdjQ
	 ttScftqgwFpzcy1wnY0fS8ZO4TbwHVMvfKc5KhZrX9DIMMAvfVabwx3i4Rh7s9C21U
	 j0dXhn8jqvyCUzAUUYKRqpBptyE08iDAHWm4NMgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CF14F80148;
	Wed, 11 Aug 2021 06:24:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B590F802D2; Wed, 11 Aug 2021 06:24:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2F80F8016B
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 06:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2F80F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="jxMCTvQX"
Received: by mail-oi1-x22b.google.com with SMTP id bj40so2704254oib.6
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 21:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=4+a6akEpZU2Rl1zSGbSNGtRGCQXtOnzuxporXN9r8kw=;
 b=jxMCTvQXPanclZeeolIVPBZrNb2967Z1Vp2PMXijVJmWvLi/cbZqfziutKJ4IyjCrJ
 nO2uQc0OKlVaO9WhXLQe3GJsSpfEOrev5/i/FeojQKagbej9L6LA1JPam9PX75WCLWcA
 SbbfYEJY5aHpmmLGnMIUfVO+m5ApnGwCwp5dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=4+a6akEpZU2Rl1zSGbSNGtRGCQXtOnzuxporXN9r8kw=;
 b=jbbZU2GmkYnKmLuN9NmKQTnWVD3VLvzw7NDk7KTLygG6DxgaG4/LBxhjwkg3925lTs
 +A9fLY/BiIs0vzQpIheQfxsqDQvsbz5i14wVg7y82iFBUypptOc6YlVYY2Qbg1cOFCJJ
 iaOt49ToIVYydQYEi3jHb7G9Jvg3veHXhKk88ln2k54b8fOF8vX/GZITmmj+JgwYBCBs
 PCORVUqsizAoJjdRGgnFtU88GcA4qpQmssX6EGmUgKvO3if2l6Tu3hIijf1lBsmSFltp
 94wxOHO7gLYqeyibcwQgWWIfATCreE/vwJHU2Ta0GXjWIN6lBGU7CrkDMm63uqL3Rb2N
 pbJw==
X-Gm-Message-State: AOAM532ftOCawNdwbsXTjnjSbI37fMwdAiIvz97Aa2BVn4wnidDjx95/
 VdtkajDH0ua25LNIrsvPzx7XpqIfFYFPCDBhjXgtCg==
X-Google-Smtp-Source: ABdhPJxhuBLsVb23ZNxG/JRW3v8sQ+/Xa1+LNCkfc0G3wJkAgaq2+FaAG51xDk5Ag9SJd5Qlf9jHNaCGwd6V1n67aQc=
X-Received: by 2002:a05:6808:114a:: with SMTP id
 u10mr8782072oiu.19.1628655862338; 
 Tue, 10 Aug 2021 21:24:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 21:24:21 -0700
MIME-Version: 1.0
In-Reply-To: <20210810165850.1.I4a1d9aa5d99e05aeee15c2768db600158d76cab8@changeid>
References: <20210810165850.1.I4a1d9aa5d99e05aeee15c2768db600158d76cab8@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 10 Aug 2021 21:24:21 -0700
Message-ID: <CAE-0n50K+gAa0U9-kswTCdt+UAkxhuJ8BMg-D4sQayP1xqWTyQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt5682: Properly turn off regulators if wrong
 device ID
To: Douglas Anderson <dianders@chromium.org>, Mark Brown <broonie@kernel.org>, 
 Oder Chiou <oder_chiou@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <bardliao@realtek.com>
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

Quoting Douglas Anderson (2021-08-10 16:59:15)
> When I booted up on a board that had a slightly different codec
> stuffed on it, I got this message at bootup:
>
>   rt5682 9-001a: Device with ID register 6749 is not rt5682
>
> That's normal/expected, but what wasn't normal was the splat that I
> got after:
>
>   WARNING: CPU: 7 PID: 176 at drivers/regulator/core.c:2151 _regulator_put+0x150/0x158
>   pc : _regulator_put+0x150/0x158
>   ...
>   Call trace:
>    _regulator_put+0x150/0x158
>    regulator_bulk_free+0x48/0x70
>    devm_regulator_bulk_release+0x20/0x2c
>    release_nodes+0x1cc/0x244
>    devres_release_all+0x44/0x60
>    really_probe+0x17c/0x378
>    ...
>
> This is because the error paths don't turn off the regulator. Let's
> fix that.
>
> Fixes: 0ddce71c21f0 ("ASoC: rt5682: add rt5682 codec driver")
> Fixes: 87b42abae99d ("ASoC: rt5682: Implement remove callback")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>
>  sound/soc/codecs/rt5682-i2c.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
> index 4a56a52adab5..1cc07812b5ac 100644
> --- a/sound/soc/codecs/rt5682-i2c.c
> +++ b/sound/soc/codecs/rt5682-i2c.c
> @@ -117,6 +117,13 @@ static struct snd_soc_dai_driver rt5682_dai[] = {
>         },
>  };
>
> +static void rt5682_i2c_disable_regulators(void *data)
> +{
> +       struct rt5682_priv *rt5682 = data;
> +
> +       regulator_bulk_disable(ARRAY_SIZE(rt5682->supplies), rt5682->supplies);
> +}
> +
>  static int rt5682_i2c_probe(struct i2c_client *i2c,
>                 const struct i2c_device_id *id)
>  {
> @@ -156,6 +163,10 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
>                 dev_err(&i2c->dev, "Failed to request supplies: %d\n", ret);
>                 return ret;
>         }

Nit: Add newline here.

> +       ret = devm_add_action_or_reset(&i2c->dev, rt5682_i2c_disable_regulators,
> +                                      rt5682);
> +       if (ret)
> +               return ret;
>
>         ret = regulator_bulk_enable(ARRAY_SIZE(rt5682->supplies),
>                                     rt5682->supplies);
> @@ -285,7 +296,6 @@ static int rt5682_i2c_remove(struct i2c_client *client)
>         struct rt5682_priv *rt5682 = i2c_get_clientdata(client);
>
>         rt5682_i2c_shutdown(client);
> -       regulator_bulk_disable(ARRAY_SIZE(rt5682->supplies), rt5682->supplies);
>
>         return 0;
>  }
