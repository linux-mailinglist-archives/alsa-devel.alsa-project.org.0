Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA4229CB72
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 22:45:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4814316C1;
	Tue, 27 Oct 2020 22:44:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4814316C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603835120;
	bh=8eXC2Dhq7JJFv61fP53TKU8wGCak6cp5qOYfEukpl7U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TW38snwNX+83nwRRfATaAhXEc9a6pE6uNDqc92nb463YftWJIO3VwCAJMYCdqtK94
	 qfIZD56gtkOkoFtSc0XaZlfMQcafQH27kQ5OpBFdTcrlzCOVZYZJyujHWwF7lzj2Z7
	 AvKQexu5sL+mAdV9iazu80SXe/SmFlj3GA6MuZ4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A12E4F80086;
	Tue, 27 Oct 2020 22:43:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7676F8020D; Tue, 27 Oct 2020 22:43:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76F35F80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 22:43:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76F35F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="e78D+C4Y"
Received: by mail-io1-xd43.google.com with SMTP id h21so3191260iob.10
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 14:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M4DMtRusIBSeOgDXKaZMtL3aNFUYRHrBj1yi1ElNljs=;
 b=e78D+C4YPOWMj2c9KFCPYCIg3bvAvcyQqVd3q0U9IzxX7aqpzFtPrfQOFokVNN1PNX
 XVrypVrbod4hLwzuZGhyHb/+PDmB3ar1be3vzd1WBJfTgQniWRrX8wn39wKbAhJQpN0A
 oWejHK6i+TG4BlPd+/oJEn1latxU4lUUd8Xv2e2G6Pa7x6z2WF7U8Ot8KajYAwiqxmb5
 42vF/PLb6KUXH7JMRLIW1AeHyRBEqLvvmqbnLwPR3AkCXIvwbCLdl6AHUllzTiBbHgup
 lsgxRaktKlyNrDii/jNalYObBXJQKkUeLo44XP3oS1+49RWV5Hlj51ZCHgtr7+Iz9cNW
 85wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M4DMtRusIBSeOgDXKaZMtL3aNFUYRHrBj1yi1ElNljs=;
 b=p4ZKn2lTdZnCcq/0dSLpeRY8CFuikQbXgkeOoB/fbVq2NnrONjvTQxeuV57BnRbbBI
 kiCAHWmNEwysebPm1WCmL+EgCiHKHz9x1Ae0xNi0F1Tiu/kdqozsgcVmL2bnoajgKgzv
 QX3quvZ6FZ2cv+xbcY9tdcvjYesm3KVxhqjjouBSepSwhiN/UKojcBP8+aU9lAI0krQo
 jEKNXoK2J0aDTFEB3xaG3qBln5YtwbzKey4784w0l74ZNK3fD1MxxoIBbseHoEULXPkx
 HNsiLH/uA692UiDfcqLtUnEJmOExEkC32QGEsTmZqnIZAORSxG2dYhnJKnZrZRbrnPxk
 fDPQ==
X-Gm-Message-State: AOAM5337U9H+yRPr8MCRivbP9LPpwPQ1Ivk6gfACjIZmR/uME8i5YR09
 eioGNGGJj+Hg5qD2/lmncOv9EVRCxzys7L+0R1Q=
X-Google-Smtp-Source: ABdhPJx80PPcZMpfUlBGECvO/rasjkvCl7waBT4W4GSuQJBtLI91Ef08UVD8zq/hY18wjm/GR+zGD6+MmyoxhgDmCBw=
X-Received: by 2002:a6b:8b95:: with SMTP id n143mr3933217iod.36.1603835014568; 
 Tue, 27 Oct 2020 14:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201027183149.145165-1-peron.clem@gmail.com>
 <20201027183149.145165-2-peron.clem@gmail.com>
 <01e34ad3-c695-c6eb-95dd-76c2cda77c6f@linux.intel.com>
In-Reply-To: <01e34ad3-c695-c6eb-95dd-76c2cda77c6f@linux.intel.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 27 Oct 2020 22:43:23 +0100
Message-ID: <CAJiuCcdX7jc-VMWYfPPL3qu9RcUU7VMdjshyPH_xLA0yVXftUw@mail.gmail.com>
Subject: Re: [PATCH v9 01/14] ASoC: sun4i-i2s: Change set_chan_cfg() params
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Samuel Holland <samuel@sholland.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

Hi Pierre-Louis,

On Tue, 27 Oct 2020 at 19:59, Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> > @@ -452,11 +454,11 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> >       case SND_SOC_DAIFMT_DSP_B:
> >       case SND_SOC_DAIFMT_LEFT_J:
> >       case SND_SOC_DAIFMT_RIGHT_J:
> > -             lrck_period = params_physical_width(params) * slots;
> > +             lrck_period = slot_width * slots;
> >               break;
> >
> >       case SND_SOC_DAIFMT_I2S:
> > -             lrck_period = params_physical_width(params);
> > +             lrck_period = slot_width;
> >               break;
>
> Aren't I2S, LEFT_J and RIGHT_J pretty much the same in terms of lrclk
> rate/period? the only thing that can change is the polarity, no?
>
> Not sure why it's handled differently here?

I just had a look at the User Manual for H3 and H6 and I didn't find
any reason why LEFT_J and RIGHT_J should be computed in a different
way as I2S.

Also the commit introducing this doesn't mention it.
7ae7834ec446 ("ASoC: sun4i-i2s: Add support for DSP formats")

I can't test it with my board but if nobody complains about it, I will
introduce a fix for this in the next version and change this also for
H6.

Thanks for your review,
Clement
