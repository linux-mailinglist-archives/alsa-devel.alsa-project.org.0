Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D94ED2120E
	for <lists+alsa-devel@lfdr.de>; Fri, 17 May 2019 04:31:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4967216C9;
	Fri, 17 May 2019 04:30:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4967216C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558060309;
	bh=ejjXQ4YDaLO1ngQFqynGa7de0T0ALQqkOKPKeHTHUKw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sKpvrqUlQLi6dBs+McGStw/3j7ry6wZdXP1XFjJGvxxcMSDb49Jy9UL2fLEvk7gSY
	 pkdHWg8Zs0pf0PrcL+e+fTtKFGQP++uoRf/O9OVLhQK3Hk1xxEZvkhldiLTIMyuMI8
	 XHt2tgr8JYrCApOOGnysDuf5pVnPD557iJplqzw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C11F3F896B8;
	Fri, 17 May 2019 04:30:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0056F8968A; Fri, 17 May 2019 04:29:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16936F806E7
 for <alsa-devel@alsa-project.org>; Fri, 17 May 2019 04:29:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16936F806E7
Received: by mail-ed1-f68.google.com with SMTP id m4so8167354edd.8
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 19:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vd7a6BOY3BmwDuAXW4h7Ge5sD0QEyF7r1GtbJLVFNZ0=;
 b=F00hiJllA2ekycIGN+h4TBp3Di/CA2fXtQ3yYRiDw/StTOOMUS2qPfXKtLPkZE//Bx
 VwXiExVg9zxjmdfmBD/clhwHYV2ugtOM6WaZfc+A9klYXCYzV6EFZnT/FzXFMeIwAHq6
 v33I3l/u3Z4kzaETzFAT8MKKeQTgX0Jt0nGYUU9TaBvsvYx7LqGXxZb7I9oePUoutHXm
 rVWI6AWTfoyaJavjL+nB5c0i7U7HShMjLMQSay0MG9aXVPBKytWZdeMTfHlNMH/juD+z
 8lA/ODmKyNCYwCakQKVRB9hIRyEkig5nqSbrps4Aw7YODPbbGpkWLS08eeM0H8URQtAf
 Npzw==
X-Gm-Message-State: APjAAAVdayCHYRTdvM8Z8rVF0QrzW9uMxDSo5AxGM+Q465XD3BDDSqSu
 nC3ZLKbdqaJz1lxgzFa4WYw0qWxBcGs=
X-Google-Smtp-Source: APXvYqyltedk/vGAKhE0pd+BlSW2+1lijchXhEpecJ3yKBYygb/I520XtO+jg4Gkg4jOlvu4NF1U9w==
X-Received: by 2002:aa7:d711:: with SMTP id t17mr54567994edq.80.1558060194407; 
 Thu, 16 May 2019 19:29:54 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48])
 by smtp.gmail.com with ESMTPSA id s19sm1315188eja.82.2019.05.16.19.29.53
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 19:29:53 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id g12so5099515wro.8
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 19:29:53 -0700 (PDT)
X-Received: by 2002:adf:e8d2:: with SMTP id k18mr25719234wrn.329.1558060193026; 
 Thu, 16 May 2019 19:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <1557925120-31498-1-git-send-email-georgii.staroselskii@emlid.com>
 <20190515135813.5y72f2h526yjkncy@flea> <20190515152749.GA2241@softcrasher>
 <20190516201256.te7ya3n7ugbfmzrw@flea>
In-Reply-To: <20190516201256.te7ya3n7ugbfmzrw@flea>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 17 May 2019 10:29:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v65D23-sXmZPT2t2d0XrZnO2yfUKwgc7z=1VEfVkK+855A@mail.gmail.com>
Message-ID: <CAGb2v65D23-sXmZPT2t2d0XrZnO2yfUKwgc7z=1VEfVkK+855A@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, 
 Georgii Staroselskii <georgii.staroselskii@emlid.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Danny Milosavljevic <dannym@scratchpost.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: sun4i-codec: fix first delay on
	Speaker
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

On Fri, May 17, 2019 at 4:13 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Wed, May 15, 2019 at 06:27:49PM +0300, Georgii Staroselskii wrote:
> > On Wed, May 15, 2019 at 03:58:13PM +0200, Maxime Ripard wrote:
> > > > diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> > > > index 15d08e3..e0099519 100644
> > > > --- a/sound/soc/sunxi/sun4i-codec.c
> > > > +++ b/sound/soc/sunxi/sun4i-codec.c
> > > > @@ -1329,6 +1329,15 @@ static int sun4i_codec_spk_event(struct snd_soc_dapm_widget *w,
> > > >   gpiod_set_value_cansleep(scodec->gpio_pa,
> > > >                            !!SND_SOC_DAPM_EVENT_ON(event));
> > > >
> > > > + if (SND_SOC_DAPM_EVENT_ON(event)) {
> > > > +         /*
> > > > +          * Need a delay to have the amplifier up. 700ms seems the best
> > > > +          * compromise between the time to let the amplifier up and the
> > > > +          * time not to feel this delay while playing a sound.
> > > > +          */
> > > > +         msleep(700);
> > > > + }
> > > > +
> > >
> > > Since this is an external amplifier, I guess they would have different
> > > warm-up time depending on the exact part being used?
> >
> > I guess I might've used Speaker wrong and bumped into an existing
> > issue.  The issue first arose when I needed to connect a speaker and
> > use a mute GPIO pin to toggle it. I bumped into the lag similar to
> > the one that has been fixed in bf14da7. The word "amplifier" here in
> > my comments might be wrong and misleding. Sorry for that. I just
> > measured the latency on the speaker I'm using and it is well under
> > 1ms so this is the Allwinner DAC that is pushing the data with a
> > lag. Or some other thing, I'm not sure.
> >
> > I want to stress again that I might've experienced the issue because
> > I was abusing "Speaker" routing. I basically just needed the analog
> > audio stream and mute GPIO handling done automatically.
>
> Ok. I guess the comment should just be reflecting that then.

Sounds like the board has an external buffer / amplifier for the speaker.
Does it have a headphone jack that bypasses it? Then you could check for
the actual latency.

Also, I think it might be better if we could move to actual audio routing
and have a simple-amplifier instead.

ChenYu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
