Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2745531F18D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 22:08:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B95E61657;
	Thu, 18 Feb 2021 22:07:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B95E61657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613682502;
	bh=a9BIhslLbKVsM27RU/RxVpkG9hE/fSb19Fblw8jL7ow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BwO3CfhLX9dXZTXRf7oDE5xz0qxEmPCl1WTqSWsasS2wRlUJxrs6mKq2wuF5/97WM
	 emLISZXnMAMEOiTodLH+y2I3aeUeuIyWh6oJLXI/aEIf+6ynTKkqQwbgNcfuvqrkiM
	 QDnpYnwlPJ6GyHvWjg/cKm+xk0vSenyvqV5lcAGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 065E3F8016E;
	Thu, 18 Feb 2021 22:06:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B62D2F8015A; Thu, 18 Feb 2021 22:06:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91C51F800D0
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 22:06:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91C51F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="qp1qtuFG"
Received: by mail-qv1-xf2b.google.com with SMTP id k8so1208501qvm.6
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 13:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9OywSrlNkx8UxZTiDK8fVh1aTqswbbDy4JaPde32iVE=;
 b=qp1qtuFG4xmubP4IH7pbE1p+Pe2jwmZr9yGS2QlSlBHM6X6uWVnFwnfHaPVCf+692y
 2Bm4LCRQSSkvbk2tWI3ehKmu046IsvHA9KvkH1Rl+WuG761IGlQ+aKn/X0YYiYGHYX+b
 1roSKhB/m11D5RNaphgBecd+eQSr0d815IRcgFCnRQ06ksbhdpvcynVvANuC8pZ0XP/M
 EEhAhQD2ZM7KVtWu/Ab3x+0kLr2aCTyom4NJXXgLE2KLc6G2dFCftNYjt0nclNOuK5DU
 2RMdxPVsGyr9LryyquHYAwQUDIMqFHJ7qkLDGSt99M5FCKA2PsSIsT5HdzoUOCJ3ZeX5
 VwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9OywSrlNkx8UxZTiDK8fVh1aTqswbbDy4JaPde32iVE=;
 b=qnpztJQPTYxLpBlUF3hUxPnUeL4MoY/Kvq+h2chP2Egyxs6WO5W4mLAJ6YV2rPyBER
 U/Y8+GH2qm0MpeyNrAg7vELAQvddfeWSAu1+4s7TwnYBF5mA8mFZUENYFbXyMJYQc9aq
 OaD2lA0rgWcjeMAYBLcoQeIp35UAd7+o0QlohtKNN24dcJLeVC12foFKw54K/9Fryuuk
 LuR5nCJ9LIjhpSrieh+Tlkb16iEPcdllXLpnCdFyDT42/g5nsoGQD9F9R1UWdnosjoWn
 EmbANUojzZK8pUe12Dc+pbnNp1nsSfpTBSXzeQO5qLrHNrSSMYEWOVk6h2UACkagT8+h
 AtAA==
X-Gm-Message-State: AOAM530aY18ywl8g0VIvObhOwTc2pA5TYXwj4+DNoJh+pAYZFSBNVq/3
 m2ZRHgjCsmCpWE0iLiW0j5RVvpNDOpnnQ0uWCCOlug==
X-Google-Smtp-Source: ABdhPJyeu4jlIX3+Qf/AGlvvhFmTi3JG5Rp3J98piajs7QVN8pugsVkCtYe3VIZJteddO5x9qo9/ECJqtACfhKQQ++M=
X-Received: by 2002:a05:6214:b2c:: with SMTP id
 w12mr3250242qvj.41.1613682398758; 
 Thu, 18 Feb 2021 13:06:38 -0800 (PST)
MIME-Version: 1.0
References: <20210217214914.700751-1-cujomalainey@chromium.org>
 <5b90530b77744937b87bbbd35901e320@realtek.com> <s5hr1ld22a9.wl-tiwai@suse.de>
In-Reply-To: <s5hr1ld22a9.wl-tiwai@suse.de>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 18 Feb 2021 13:06:27 -0800
Message-ID: <CAOReqxibmAQNQe8PuHkUSW5Kb2L986X9DDqia-aN=ZrS8VJysA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt5682: remove jack detect delay
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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

Thanks Takashi and Shuming


On Thu, Feb 18, 2021 at 12:44 AM Takashi Iwai <tiwai@suse.de> wrote:

> On Thu, 18 Feb 2021 09:38:53 +0100,
> Shuming [=E8=8C=83=E6=9B=B8=E9=8A=98] <shumingf@realtek.com> wrote:
> >
> > > There is a 250ms delay on the jack detect interrupt currently, this
> delay is
> > > observable to users who are using inline controls. It can also mask
> multiple
> > > presses which is a negative experience.
> > >
> > > Cc: Bard liao <yung-chuan.liao@linux.intel.com>
> > > Cc: Shuming Fan <shumingf@realtek.com>
> > >
> > > Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> > > ---
> > >  sound/soc/codecs/rt5682-i2c.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/sound/soc/codecs/rt5682-i2c.c
> b/sound/soc/codecs/rt5682-i2c.c
> > > index 93c1603b42f1..b15c3e7d1f59 100644
> > > --- a/sound/soc/codecs/rt5682-i2c.c
> > > +++ b/sound/soc/codecs/rt5682-i2c.c
> > > @@ -78,7 +78,7 @@ static irqreturn_t rt5682_irq(int irq, void *data)
> > >     struct rt5682_priv *rt5682 =3D data;
> > >
> > >     mod_delayed_work(system_power_efficient_wq,
> > > -           &rt5682->jack_detect_work, msecs_to_jiffies(250));
> > > +           &rt5682->jack_detect_work, 0);
> >
> > How about using the device property to adjust the delay time?
> > I think it should keep the workqueue to do the jack/button detection
> because the jack type detection will take some times to do.
>

I am trying to understand the purpose of this delay currently, won't
the press already be registered since we have an interrupt? Or does it need
to stabilize? The reason is 250ms is well within human perception or even
double tap time, which results in users possibly double tapping buttons but
only seeing one press come through.


>
> One might check twice (or more) if it's not certain, too.  That is,
> check the jack immediately, and if the jack state really changed,
> report it so.  OTOH, if the jack state doesn't change from the old
> state, it can retry after some delay.
>

I feel like this logic would cause more problems with fast presses unless
the window was restricted down to sub 50ms.


>
>
> thanks,
>
> Takashi
>
