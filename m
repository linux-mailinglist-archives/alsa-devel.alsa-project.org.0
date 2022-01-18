Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E0B492F24
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 21:19:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8DD22D4E;
	Tue, 18 Jan 2022 21:18:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8DD22D4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642537159;
	bh=s3ka3H0uD+7oVkDF6I9N02EzkbrxVdN44ln2B48OtEE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cVXhrHzA+XH8EQcIxGn9hImlNlMjhgbWGYzSRL6OuOtheJvAiWDwGqmgqci9eHAvj
	 CUqiDTi32LPkcXXj6n1RU74MG4bbes5a9k+cSOvWYIfiLIO6sH49cO8oybdMtinyvV
	 rOYIV33Tq8OKZvbA94zZkFN4xlLq4IJey4WAKfF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 686B8F80240;
	Tue, 18 Jan 2022 21:18:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B6E4F800CE; Tue, 18 Jan 2022 21:18:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FSL_HELO_FAKE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E067F800CE
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 21:18:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E067F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="inhbbrVy"
Received: by mail-pj1-x102c.google.com with SMTP id
 d12-20020a17090a628c00b001b4f47e2f51so687617pjj.3
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 12:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fTJy6r2petxIyCqlCeqcI3j0J1mr0+L2iTxm9kuz7Xs=;
 b=inhbbrVy+Fl/lXwKK3g5gU174TWO3UbXPm6+kPhfHgNNQVApLzBtbDcGk4Xgom17AB
 i3YZWJdLTgR31k1+RKgfidYdZUqNPiFDDZAGoFHkdyc4Ob67KE7sURHRukbTSubzASSf
 maDQWVxRz4iuaY3PO0xLJR+1EQcEZT+I8Q6AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fTJy6r2petxIyCqlCeqcI3j0J1mr0+L2iTxm9kuz7Xs=;
 b=bQ9nQPP++9zHM9ivQxQUggRp95Edb4hFT7A2C5CTCgZhvvUlWF4f0zVmPycgwPJQlB
 jCnfLy4RfeDId1M/GiFJxTV2EcHwIoUk+xrg1VLrwH3NKZ5GeNflKwsIplMVDpmjhBGm
 77XTJOp+MVuMtxvm/KlEAcBM5ej0IHRKKoHNaUsXHrv1FHcMyUa2QJuLgKOehCd6wlgW
 83UBndj1yMHCI17P2Hy5bZJzq/Q+rlWPwDX02YDsoeAQNakR7a81OEOl/pruR2KXNXYW
 IWeaqGW2Ku7NDRBuLiMTscF7usUgjdT/LFCDWT0RvBFMlbQ5RnyuVxnWm51KqjE+E1Yj
 OUpA==
X-Gm-Message-State: AOAM531t98ktt5/aot5pR//Qst2Snr9W5TEZ5u+ecbhQAZ0bibOkbaep
 ZxIQu2+zCw5ohiMgHugM4WnCRw==
X-Google-Smtp-Source: ABdhPJxiIurI5FHOTYvsCLYSQboCxGuQP/VrNeICLl1afrsd2ymXtXw5svEXZBZPdy/+GQJ6NoXhPA==
X-Received: by 2002:a17:90b:4b8a:: with SMTP id
 lr10mr278353pjb.58.1642537079558; 
 Tue, 18 Jan 2022 12:17:59 -0800 (PST)
Received: from google.com ([2620:15c:202:201:e4bb:67e6:f0b5:1b92])
 by smtp.gmail.com with ESMTPSA id ha11sm1170099pjb.3.2022.01.18.12.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 12:17:58 -0800 (PST)
Date: Tue, 18 Jan 2022 12:17:55 -0800
From: Brian Norris <briannorris@chromium.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2 3/3] ASoC: rk3399_gru_sound: Wire up DP jack detection
Message-ID: <YecgcwXrQNzCesMN@google.com>
References: <20220114230209.4091727-1-briannorris@chromium.org>
 <20220114150129.v2.3.I3c79b1466c14b02980071221e5b99283cd26ec77@changeid>
 <CAGXv+5HC00YU6ARtGDahxWLqivvUCowh7wDq5H5OzoGO9htB+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGXv+5HC00YU6ARtGDahxWLqivvUCowh7wDq5H5OzoGO9htB+g@mail.gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Lin Huang <hl@rock-chips.com>
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

Hi Chen-Yu,

On Mon, Jan 17, 2022 at 05:01:52PM +0800, Chen-Yu Tsai wrote:
> On Sat, Jan 15, 2022 at 7:03 AM Brian Norris <briannorris@chromium.org> wrote:
> >
> > Now that the cdn-dp driver supports plug-change callbacks, let's wire it
> > up.
> >
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >  sound/soc/rockchip/rk3399_gru_sound.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
> > index e2d52d8d0ff9..eeef3ed70037 100644
> > --- a/sound/soc/rockchip/rk3399_gru_sound.c
> > +++ b/sound/soc/rockchip/rk3399_gru_sound.c
> > @@ -164,6 +164,25 @@ static int rockchip_sound_da7219_hw_params(struct snd_pcm_substream *substream,
> >         return 0;
> >  }
> >
> > +static struct snd_soc_jack cdn_dp_card_jack;
> > +
> > +static int rockchip_sound_cdndp_init(struct snd_soc_pcm_runtime *rtd)
> > +{
> > +       struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
> 
> Using snd_soc_card_get_codec_dai() might be a better choice throughout this
> driver. While it will work for the cdn_dp case, because it is the first DAI
> in |rockchip_dais[]|, all the invocations for the other codecs are likely
> returning the wrong DAI.

I'll admit, I'm not very familiar with the ASoC object model, so you may
well be correct that there's something fishy in here. But I did trace
through the objects involved here, and we *are* getting the correct DAI
for both this case and the DA7219 case (preexisting code).

It looks like we actually have a new runtime for each of our static
dai_links:

devm_snd_soc_register_card()
  ...
  for_each_card_prelinks()
    snd_soc_add_pcm_runtime()

So I think this is valid to keep as-is.

> For this particular patch it works either way, so
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks for looking!

Brian
