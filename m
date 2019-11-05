Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BA8EF4CD
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 06:24:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 368C8170B;
	Tue,  5 Nov 2019 06:23:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 368C8170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572931456;
	bh=womltMXRB+bgcibC2H1TwMI/J/XYgfvlDr7ENMVOzjU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qXXoglLHiKDhGp89BDAt90EA6KLXaSRLewpHWQJFntPTjCyBkk969STVMHd/LUTeD
	 6NlA20fs1sK+J0pdpi8tdfx8n0xVat/j9by8O1JfbqKSD31Qt7SmRtyMO0iDib6902
	 W+JdaFd1JTqAB5iwGsF/Nbr1yKfqqWmcJAUq4iIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FFB8F8015B;
	Tue,  5 Nov 2019 06:22:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90790F8049B; Tue,  5 Nov 2019 06:22:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F04EF8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 06:22:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F04EF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="FKs8g5VJ"
Received: by mail-io1-xd2d.google.com with SMTP id k1so9390420ioj.6
 for <alsa-devel@alsa-project.org>; Mon, 04 Nov 2019 21:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7vaz3KVrOgDWfb26kvhChTuIhFFYM+DDUpJpJ/GOSGE=;
 b=FKs8g5VJDqoPJSTf1Z4SPS+2iQ2KHxHCTLcIgjLWJNUrgCw0I7BBf/Dmeoz0tVcibI
 J7jFnsmGyB4SDwbQo+OUxUsvUkKYO2iQUXATG4uD0RsVQjbmeP6jBDNYG3ZKU9evyZoz
 PhdverGw5TtjO5O1M4nW1CAxJXboELKD1HNscZJ1lsdsc2TqnWvq47vIn+wa2W2n0JjZ
 gVr5byaY/BXwXvqspTj9oHaHOl92bPB7qlRxs/zb9UU60Xs/3t+P3LVTgwTJ/vkb2amG
 mrYd/I7Gii6W4SW4IiaX04CWvgj9Xg7o50Xv4yCHhp8vJWdXQIsYd4+yfCj1dxoNMVo0
 swig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7vaz3KVrOgDWfb26kvhChTuIhFFYM+DDUpJpJ/GOSGE=;
 b=Kq8gpPTo1Ex+wi/CQ3tycVt2a3sY7cdKtkOJ35wyV3054XXrHOg45SGwSYaHnim1ms
 bSf44vSHHjIB1wQjs0O5SewjT7pnunHV0e52xr/rBoleQ+pBgY40Bx4Wsfjdi6cRpaTQ
 Ip4oxYzxHaY1FvAhHoBC9LWVPSOh6Ukx/r0v9TXQP3tREe7WHg83dzENCd8LLld6ByPZ
 bNkxWXWZS+haoQXakW+bET3fuJ0iYkLu9/qX4ftvlOLiYEJFO9jm7txcA3Tvq5YthWES
 g2hl0g8ej6CRYD9HtpRFTJf+Z0cqPy/ex/7RirtTMB5vOoXfXJrHD2jLPNLci/s2MbWk
 zAYQ==
X-Gm-Message-State: APjAAAW84o9H/mzC7NLl+NUDj28Gdx4I/m2WKcY7xPF1m+rT1oE6k2eT
 iTEgdiqxMtQW4WTcEfOO4JfB7vbihwJAPfbJjiMrQA==
X-Google-Smtp-Source: APXvYqzRcp+MlaMjWfX2LDZ/s1RJDEy8ziisd7JTip4a+ZknR2kXOyT20qhNJFFC+ImNkDd91PG4RCUmT2KjxyvcSts=
X-Received: by 2002:a5e:c308:: with SMTP id a8mr12288116iok.125.1572931342272; 
 Mon, 04 Nov 2019 21:22:22 -0800 (PST)
MIME-Version: 1.0
References: <874kzrdo1x.wl-kuninori.morimoto.gx@renesas.com>
 <87zhhjc9bw.wl-kuninori.morimoto.gx@renesas.com>
 <9aacec2b81bbe51992da63ea33ab653019011371.camel@linux.intel.com>
 <87o8xr2bwc.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o8xr2bwc.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Mon, 4 Nov 2019 21:22:15 -0800
Message-ID: <CAFQqKeWGojALvi9YyzqzmSm=Cyhw+SSMSgOM0A-t4Brvtmv6yA@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 resend 03/18] ASoC: soc-core: tidyup
	soc_init_dai_link()
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

On Mon, Nov 4, 2019 at 8:21 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

>
> Hi Ranjani
>
> Thank you for your review.
>
> > > +static int soc_dai_link_sanity_check(struct snd_soc_card *card,
> > > +                                struct snd_soc_dai_link *link)
> > >  {
> > >     int i;
> > >     struct snd_soc_dai_link_component *codec, *platform;
> > > @@ -1043,11 +1043,15 @@ static int soc_bind_dai_link(struct
> > > snd_soc_card *card,
> > >     struct snd_soc_pcm_runtime *rtd;
> > >     struct snd_soc_dai_link_component *codec, *platform;
> > >     struct snd_soc_component *component;
> > > -   int i;
> > > +   int i, ret;
> > >
> > >     if (dai_link->ignore)
> > >             return 0;
> > >
> > > +   ret = soc_dai_link_sanity_check(card, dai_link);
> > > +   if (ret < 0)
> > > +           return ret;
> > Morimoto-san,
> >
> > Should this be done after checking if soc_is_dai_link_bound() maybe?
>
Morimoto-san,

I thought about this a bit more. With you changes in the series to move
bind_dai_link() to snd_soc_add_dai(), is the check
for soc_is_dai_link_bound() needed at all?

Thanks,
Ranjani

>
> Hmm... maybe
> Thanks. I will fixit in v3
>
> Thank you for your help !!
> Best regards
> ---
> Kuninori Morimoto
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
