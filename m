Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0215A4934BD
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 07:00:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8053E3385;
	Wed, 19 Jan 2022 07:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8053E3385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642572057;
	bh=nQAmdo16Vq58Zy7cZD8RCems/wC3KORTogxczHUYSQw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uuZNJ0Nl8QAWOAOA0LLRev2Latai6ERp/h0DXId6dABGzsu+SkIdcpwHKt5enoZ9h
	 JfkUH8J7R1nde5l1dJy1B7WSEiJ0+OB+zgrFpjD8aYYmDQ9WiNCBAE5MlW3ZN+j0e8
	 UvbByOz/fro+UrLH/KYiHyD2wIbpokMPDEfmTPG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03DA1F80162;
	Wed, 19 Jan 2022 06:59:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B5C2F801F7; Wed, 19 Jan 2022 06:59:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CCF8F80128
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 06:59:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CCF8F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="O3rjR1xw"
Received: by mail-lf1-x130.google.com with SMTP id x22so4818057lfd.10
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 21:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1tKYVg7wJMJMNFKIyw+d3Kv62PM5IDYj6Uiog3M1guQ=;
 b=O3rjR1xwJ5RJa/8Pr4j+o/xz2ODymM24FgRvDAyyXVz801NpNIj40tnMPXagEzzIdN
 YgApJ9Se2RtCuzQIBr9UoxOYieOUmAITh7Ff2mH+sSXNnt/MyPTQm0hxbsds1OhLg9Lx
 iGrVXc3V0OyRFdbBmsPvPpedratR1otyTGqBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1tKYVg7wJMJMNFKIyw+d3Kv62PM5IDYj6Uiog3M1guQ=;
 b=WCuBRUvn8j8MTRtcR3glb2GneIV+dDCHv0gdACr0BaXK2R3e+oKn4XWo3mVniB2fTA
 gBQ7o5jyJHoOpHwO/doadT9Gdy3iTBc1mpK4AXVBgHSiIKEXKBeZSSXytQjhLH4mGpJB
 hRmjmxIs/xAxbulMOqQAUkzH8UqOPN/hcWUSa6Y4g7skHfPUxeDqkbbR0Xc1tQvGe4yI
 9GfribRTksim8XenM1CVmXabHGwhwxV7JOmaSMCw2CfdCxRly8UsNxa8d3+Nk6SGWdP7
 AewNGE8DUEkUt0hXZ/pjYim8ZH4YWzr2CGnv7OqNcWhr+rWUG7Yq94KhESGKG3JcPGle
 op/Q==
X-Gm-Message-State: AOAM530dJMF9NFlKZ/Ds3tQwhePWjgwszreCvBqM3506ZvQBD65wuAs7
 r96iwPvekWN1gHua4SWEJj9Da7Z14FvsXKbXd9LLLA==
X-Google-Smtp-Source: ABdhPJxmDuwkFJziW4xvLsZmdp9HyrtsLl84OWqtBxpyS7OeNwc36CaaRT+rymCOgrfcQNTO0R57Np83PfJ/v382SjQ=
X-Received: by 2002:a05:6512:1320:: with SMTP id
 x32mr25449431lfu.597.1642571980606; 
 Tue, 18 Jan 2022 21:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20220114230209.4091727-1-briannorris@chromium.org>
 <20220114150129.v2.3.I3c79b1466c14b02980071221e5b99283cd26ec77@changeid>
 <CAGXv+5HC00YU6ARtGDahxWLqivvUCowh7wDq5H5OzoGO9htB+g@mail.gmail.com>
 <YecgcwXrQNzCesMN@google.com>
In-Reply-To: <YecgcwXrQNzCesMN@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Jan 2022 13:59:29 +0800
Message-ID: <CAGXv+5HANAorgJhSupH96V_n01VzvO5mY6LXf=bzzMi3ek089w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: rk3399_gru_sound: Wire up DP jack detection
To: Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Jan 19, 2022 at 4:18 AM Brian Norris <briannorris@chromium.org> wrote:
>
> Hi Chen-Yu,
>
> On Mon, Jan 17, 2022 at 05:01:52PM +0800, Chen-Yu Tsai wrote:
> > On Sat, Jan 15, 2022 at 7:03 AM Brian Norris <briannorris@chromium.org> wrote:
> > >
> > > Now that the cdn-dp driver supports plug-change callbacks, let's wire it
> > > up.
> > >
> > > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > > ---
> > >
> > > (no changes since v1)
> > >
> > >  sound/soc/rockchip/rk3399_gru_sound.c | 20 ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
> > > index e2d52d8d0ff9..eeef3ed70037 100644
> > > --- a/sound/soc/rockchip/rk3399_gru_sound.c
> > > +++ b/sound/soc/rockchip/rk3399_gru_sound.c
> > > @@ -164,6 +164,25 @@ static int rockchip_sound_da7219_hw_params(struct snd_pcm_substream *substream,
> > >         return 0;
> > >  }
> > >
> > > +static struct snd_soc_jack cdn_dp_card_jack;
> > > +
> > > +static int rockchip_sound_cdndp_init(struct snd_soc_pcm_runtime *rtd)
> > > +{
> > > +       struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
> >
> > Using snd_soc_card_get_codec_dai() might be a better choice throughout this
> > driver. While it will work for the cdn_dp case, because it is the first DAI
> > in |rockchip_dais[]|, all the invocations for the other codecs are likely
> > returning the wrong DAI.
>
> I'll admit, I'm not very familiar with the ASoC object model, so you may
> well be correct that there's something fishy in here. But I did trace
> through the objects involved here, and we *are* getting the correct DAI
> for both this case and the DA7219 case (preexisting code).

Neither am I, so ...

> It looks like we actually have a new runtime for each of our static
> dai_links:
>
> devm_snd_soc_register_card()
>   ...
>   for_each_card_prelinks()
>     snd_soc_add_pcm_runtime()
>
> So I think this is valid to keep as-is.

I missed this bit. As you say, things are good.

> > For this particular patch it works either way, so
> >
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Thanks for looking!

And thanks for double checking!
