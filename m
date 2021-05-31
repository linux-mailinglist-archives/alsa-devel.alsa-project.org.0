Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A8D395560
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 08:22:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 732EE850;
	Mon, 31 May 2021 08:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 732EE850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622442167;
	bh=WnVyR10KMaBJzsklWguwNaG8NAsM1EdqUL9Dt7qoj0Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PY5kRZXz7JUERnqgUufuit2wltjrtvkBzMpJ5adnKReeOzSIXzgHRzK145ACMnEiB
	 SoRvYHMUEEVHbbkmPsNyw20RIbQo+oBqM09j1C+2pFIHtgHi1bCBHgkwpS/7SaQBpT
	 iGgfgjOgHfUQ372GmYPlIpeD3PkhO2FQ7UlSoQ6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE051F80273;
	Mon, 31 May 2021 08:21:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5528CF80253; Mon, 31 May 2021 08:21:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 030C9F80088
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 08:21:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 030C9F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fnx0yLV9"
Received: by mail-ej1-x633.google.com with SMTP id z12so15087365ejw.0
 for <alsa-devel@alsa-project.org>; Sun, 30 May 2021 23:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dykij4/ipSjY/qjU7iLz8hMkaJ9DNR7hfb9RpI8VxG4=;
 b=fnx0yLV9OD0b5ZBPi5I1a5W/VId1w1Kx0smh0Qevrxs49y2JMmOxwt2MKwuVrNQpft
 xiGUEDgzd+e02hGscYEIQcZgHMbacIm3Fo7ImrUn2uvVKskaRW+wdPal8feFpurGFLni
 O0JErMQ0ArxAW+bcvQ3UUBgZ3IYatgAInRR9EQEJ/LO8M9amjHFuCtjBSWxtIwK8ltQe
 /Pn2pije0ELGDTluje+5H09h4sJ3wA5iC9zm0+0eFxUe6CkkrsrQyn0gSyV1K7WBJOn4
 T+ENGW6YDK+aeZnnCVhcKVd+O8UHsyp7z3k0YfD6mWNHaNIaKeQ8oqZqBGtFCo4I2KZR
 wosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dykij4/ipSjY/qjU7iLz8hMkaJ9DNR7hfb9RpI8VxG4=;
 b=rg2pKNyqCn9vne1oWJq7iXJYzE2xu/axW9NX7gTs9KVsSbS9hfS2tZ0igbTm/ILWiR
 r+N7A/Ci9rCjnDyseb0cruaBnia74EZhxyJmk0ZXjjc4iFUhk+lTXg4rWCqu2PxG1S4B
 Qcgf9Sczfg0Y3XFg6Bcq4dJpkaSnch78/u3od7ymlWZMwY/OaGm9q3FydSPqfdiTburC
 YnKhqfzKi3Ln/HX5q57jTdafsz7f6dSqP2fehHm6poNyklj5Ak16C8pmpfmEVmo9uXid
 chCtHYVYtm0qL8dAU1nTILSxovgwWjYWufHhfZ0aDdqdatUFlIFz6GQBwctwExsd/4D4
 EF8w==
X-Gm-Message-State: AOAM533HhnNcPx4Z4bbCEXfTUc4aAz6Azlz67bi3F9UrreSvP/nR45Nk
 gFaGGgsmr6VQdyAe1Py9BaELMw0u6Jr/HHb70VQ=
X-Google-Smtp-Source: ABdhPJwmAVA0RaF6nRoCWPFnO95e/ta5Yhi7K5zJ73CH+QokRG5rVBJ1kqwXBIFk7TJQF7Fe0kod8wP0f3gUwdZSbOs=
X-Received: by 2002:a17:906:148f:: with SMTP id
 x15mr20757423ejc.535.1622442063801; 
 Sun, 30 May 2021 23:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210528131757.2269989-1-mudongliangabcd@gmail.com>
 <20210528133309.GR24442@kadam>
 <CAD-N9QVWcEJjoziA6HVoQiUueVaKqAJS5Et60zvCvuUE7e6=gg@mail.gmail.com>
 <20210528140500.GS24442@kadam>
 <A622EB84-DC4A-47A4-A828-CE6D25DC92EB@gmail.com>
 <CAD-N9QVjhDDJxRnNrDzwt05BNijr1o11nE8xjvq8GrakEJ8EuQ@mail.gmail.com>
 <20210531044022.GU24442@kadam>
In-Reply-To: <20210531044022.GU24442@kadam>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 31 May 2021 14:20:37 +0800
Message-ID: <CAD-N9QWBBP6_Wwi4z3e4yJM-tS54=1=CcvAA+2__Qj8NsTLq9g@mail.gmail.com>
Subject: Re: [PATCH] ALSA: control led: fix memory leak in snd_ctl_led_register
To: Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: syzbot+08a7d8b51ea048a74ffb@syzkaller.appspotmail.com,
 linux-kernel <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com
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

On Mon, May 31, 2021 at 12:40 PM Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
>
> On Mon, May 31, 2021 at 11:03:36AM +0800, Dongliang Mu wrote:
> > On Sat, May 29, 2021 at 5:35 AM =E6=85=95=E5=86=AC=E4=BA=AE <mudonglian=
gabcd@gmail.com> wrote:
> > >
> > >
> > >
> > > > On May 28, 2021, at 10:05 PM, Dan Carpenter <dan.carpenter@oracle.c=
om> wrote:
> > > >
> > > > On Fri, May 28, 2021 at 09:50:49PM +0800, Dongliang Mu wrote:
> > > >>
> > > >> Can you please give some advise on how to fix this WARN issue?
> > > >
> > > > But it feels like it spoils the fun if I write the commit...  Anywa=
y:
> > >
> > > It=E2=80=99s fine. I am still in the learning process. It=E2=80=99s a=
lso good to learn experience by comparing your patch and my patch.
> > >
> > > >
> > > > regards,
> > > > dan carpenter
> > > >
> > > > diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> > > > index 25f57c14f294..dd357abc1b58 100644
> > > > --- a/sound/core/control_led.c
> > > > +++ b/sound/core/control_led.c
> > > > @@ -740,6 +740,7 @@ static int __init snd_ctl_led_init(void)
> > > >                       for (; group > 0; group--) {
> > > >                               led =3D &snd_ctl_leds[group - 1];
> > > >                               device_del(&led->dev);
> > > > +                             device_put(&led->dev);
> > > >                       }
> > > >                       device_del(&snd_ctl_led_dev);
> > > >                       return -ENOMEM;
> > > > @@ -768,6 +769,7 @@ static void __exit snd_ctl_led_exit(void)
> > > >       for (group =3D 0; group < MAX_LED; group++) {
> > > >               led =3D &snd_ctl_leds[group];
> > > >               device_del(&led->dev);
> > > > +             device_put(&led->dev);
> > > >       }
> > > >       device_del(&snd_ctl_led_dev);
> > > >       snd_ctl_led_clean(NULL);
> >
> > Hi Dan,
> >
> > I tried this patch, and it still triggers the memleak.
>
> Did your patch fix the leak?  Because my patch should have been
> equivalent except for it fixes an additional leak in the snd_ctl_led_init=
()
> error path.

The syzbot link is [1]. I have tested my patch in the syzbot dashboard
and my local workspace.

I think the reason why your patch did not work should be
led_card(struct snd_ctl_led_card) is already freed before returning in
snd_ctl_led_sysfs_remove, rather than led(struct snd_ctl_led). See the
implementation of snd_ctl_led_sysfs_remove for some details. Please
correct me if I make any mistakes.

static void snd_ctl_led_sysfs_remove(struct snd_card *card)
{
        unsigned int group;
        struct snd_ctl_led_card *led_card;
        struct snd_ctl_led *led;
        char link_name[32];

        for (group =3D 0; group < MAX_LED; group++) {
                led =3D &snd_ctl_leds[group];
                led_card =3D led->cards[card->number];
                if (!led_card)
                        continue;
                snprintf(link_name, sizeof(link_name), "led-%s", led->name)=
;
                sysfs_remove_link(&card->ctl_dev.kobj, link_name);
                sysfs_remove_link(&led_card->dev.kobj, "card");
                device_del(&led_card->dev);
                put_device(&led_card->dev);
                kfree(led_card);
                led->cards[card->number] =3D NULL;
        }
}

[1] https://syzkaller.appspot.com/bug?id=3D6d9e1e89003c894e7a1855c92dfa558e=
bcb8f218

>
> > My
> > understanding is that the device object is already freed in the
> > snd_ctl_led_sysfs_remove.
> >
>
> "Already freed"?  Is it a memleak or is it a double free???  I probably
> should have read the syzbot email on this...  But you didn't include
> a link to it or a reported-by tag so I don't have a way to look at the
> actual bug.

I listed the reported-by tag and fixes tag in the first email in this
thread. The syzbot link is [1].

Please take a look at my patch testing request.

>
> I did fix a bug, though...  Just not the one from the report I guess.
> Please send a link to the bug report so I can look at that.  ;)

We should talk about different bugs, memory leak for different objects
and different paths.

>
> regards,
> dan carpenter
>
