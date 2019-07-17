Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FF66B7F6
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 10:15:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 068091673;
	Wed, 17 Jul 2019 10:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 068091673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563351352;
	bh=xjlCDzc7dP+WMh2erSMofIdNZvVJt03ajYNhiNV6zd8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UaKNjLt5UfsjPgia9ynhMKC5S9pXFhHVx87R7mTdVtixJbfzzfa8m4+TmO7hSDOdY
	 2r5i5rfOgmcv2x85GnKCH6Qb/dH3XWWJyStbuAPluacinqLir6kT8SXTrCD5hvMtNN
	 weupRTD1XYZ0WgfokASi3o0e+Z94slt4V33lZyIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D300F8036B;
	Wed, 17 Jul 2019 10:14:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4333F8036B; Wed, 17 Jul 2019 10:14:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01FD5F800C2
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 10:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01FD5F800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="G9skQ3aR"
Received: by mail-vs1-xe41.google.com with SMTP id u124so15850056vsu.2
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 01:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mOxb5tg5seSjtQqIorgKM+Di7ixuS6uqfAgdFu5RpzA=;
 b=G9skQ3aRbgwXpozrH+1DO97KndwvPNLHeERqMmQDZWWaONNCADEoaOMvPkA0sFj53o
 phoK8JUmNVcvN1zKr+0kawyF+mSilxU7i4gtAoMto3xyO9TQG5uMPuI/UfH3wukUoDOc
 j6XhR7QyCsO7y931Q57UTyK2rbsj1P5my0hS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mOxb5tg5seSjtQqIorgKM+Di7ixuS6uqfAgdFu5RpzA=;
 b=Mz+e8+L8Z7ltfrH+Sul6SduO7avdh5NNC//inoz08DVcujl+ebqGiy4uGCmb15X7MC
 sQjHEtEjm6BrUwzO2dtJRGfxsNKlwYCNFxGLjt0A5aGufp81taRjt05ex1pRcSEbJADt
 GQR+AZ86rhMNTDM0W0/KgKR6SZ5LWCHWUrejypXS8N8HiZi3VgXDrv/sC6MYDERxEG5a
 jWnNUMCpxaVqLpP42ivXPf8vbvB7aiN+0qNtIQFe/1MfTdC38G2zCEI0WgZUbJQdRuiQ
 BqF/tnpnd61W7WQl9/0q+XfIrlVstnXVk74vYOPBzvCtUKFKNFFjchqRdSf4Vb0TCJJx
 RTAg==
X-Gm-Message-State: APjAAAWXKkWTjJYzAfnzyPKsWf23pEfTjBoT72f4GTcBtwIqDWVm7Ul9
 NW96WKVWpcziGc899HnEq14oGyyTQk0uxd5/dquh+Q==
X-Google-Smtp-Source: APXvYqwumLX15i5KhdhsUxIfW0Chce/ceicYE3QuO3Xntx39jQED40S5LxMsWwDhbGTmvCiWV49cMhif6dAhO+pZRnI=
X-Received: by 2002:a67:eb12:: with SMTP id a18mr1522512vso.119.1563351241789; 
 Wed, 17 Jul 2019 01:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190716115725.66558-1-cychiang@chromium.org>
 <20190716115725.66558-6-cychiang@chromium.org>
 <CA+Px+wXK9gJKZwzsG8BXh1gmoEyscxtMzB_VCrHz-nenBEL9AQ@mail.gmail.com>
In-Reply-To: <CA+Px+wXK9gJKZwzsG8BXh1gmoEyscxtMzB_VCrHz-nenBEL9AQ@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 17 Jul 2019 16:13:35 +0800
Message-ID: <CAFv8NwKJ4SEbN34EyS7wA33z9+bCCM2mzQRUBfDLr9Vg5CP9jQ@mail.gmail.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Douglas Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 tzungbi@chromium.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-rockchip@lists.infradead.org,
 Dylan Reid <dgreid@chromium.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v4 5/5] ASoC: rockchip_max98090: Add HDMI
	jack support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jul 16, 2019 at 10:16 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Tue, Jul 16, 2019 at 7:58 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
> >
> > diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
> > index c82948e383da..c81c4acda917 100644
> > --- a/sound/soc/rockchip/rockchip_max98090.c
> > +++ b/sound/soc/rockchip/rockchip_max98090.c
> > +static struct snd_soc_jack rk_hdmi_jack;
> > +
> > +static int rk_hdmi_init(struct snd_soc_pcm_runtime *runtime)
> > +{
> > +       struct snd_soc_card *card = runtime->card;
> > +       struct snd_soc_component *component = runtime->codec_dai->component;
> > +       int ret;
> > +
> > +       /* enable jack detection */
> > +       ret = snd_soc_card_jack_new(card, "HDMI Jack", SND_JACK_LINEOUT,
> > +                                   &rk_hdmi_jack, NULL, 0);
> > +       if (ret) {
> > +               dev_err(card->dev, "Can't new HDMI Jack %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       return hdmi_codec_set_jack_detect(component, &rk_hdmi_jack);
> > +}
> In the patch, you should select SND_SOC_HDMI_CODEC, because the patch
> uses hdmi_codec_set_jack_detect which depends on hdmi-codec.c.
Thanks! I'll fix in v5.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
