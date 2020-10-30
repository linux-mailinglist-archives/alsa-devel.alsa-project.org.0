Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC56D2A0612
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 14:00:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A3A0165D;
	Fri, 30 Oct 2020 13:59:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A3A0165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604062802;
	bh=PD8IIz3xmHes+6xizscwPFxY6dVUIKHCcvv7yodn2cY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H3cp0a/2mVlpvK10gvzNCoXrrUuhDi3PiTxSe6xPEzLl/dwa4PLdtmjrz8ld+wl9R
	 oZie6MbB+9uCiwFfStUDBfoeLrZhLjtJfUVJoVOh9Z4CRBRaE98Po0Jp7UpVxn2EBa
	 P4oOo5PlGa4ci0qxKGfINz2s1YwRPZOA3NV6ejr8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2CDCF80249;
	Fri, 30 Oct 2020 13:58:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E555DF80212; Fri, 30 Oct 2020 13:58:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75D96F800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 13:58:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75D96F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HBlLv1td"
Received: by mail-io1-xd43.google.com with SMTP id r9so7368257ioo.7
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 05:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DEjwCz6RYcTNQfWnCWPDSlK+EiMHXu1I2qKUPcY2Sh4=;
 b=HBlLv1td8ZGbbQpa0MJPMXQx1wDSoEh19ueH+HpLQn7HCeunMObf8TyVowEs6h3R1m
 iO4vu+D+ag+gypjHMSJ/h5TbRu/++9EMN4/xsfsDdMPaUZtE4oFglwtgR08CcW2G2AdX
 UmlQm9AfRndgv1zsgN3sTlb+QByMJzLQycWwoPdDgQWPlOLC+3cw/yAxHS9xGEcsfk25
 oL5Gr2GsEfDIMPaQ/3v0cjoZYemL+EIxWgI9EmA1QEc1Kc55bB7q7X6z5rvkgrdV8Wln
 YUSHz2U73sjUjSPC7fP0Cum01fYXKZPtnwqJrgS23oaIaaD/6+9OjVGgGaguXxagZ3Lq
 1xAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DEjwCz6RYcTNQfWnCWPDSlK+EiMHXu1I2qKUPcY2Sh4=;
 b=LLoW836qjnp/suJOwDlhwgxCo6a61sMY00kCmlouEBMf0cgoLMXPrp0h3/9kPF8ZKN
 RcGfoRvPFcjudOkv6Cw2Lfm7Dk6PiVSmcOnSW2rPEdBT/cJXznp/X+j9AkSIIRbkUF35
 T5KtAiv59fYF77PyWZ/vtzOnQugrw4L+wZi1QwMfXc4UmFCgnltrB0jHuiOUmzuPmDUE
 N8oz+TPWOaBIlYUZm6C66xz5LmnJHmiQx3Qy5o/K79In4EzJOrzuk1cdYo4ggdKPyDDz
 zVUTpBk7KUxe3q5i23K2ygU92RZhi7tlMgwnl+Ta0F8sHWEwmCiMaMw/66ExTy3UxoXB
 gGUA==
X-Gm-Message-State: AOAM531eBXYea2/0vnqVDLZEMh7oBxLIcKVPK6vWZmT1YGhlYDga5Bqd
 d5kABqLvmAKMmd/RPQCAk4iHi3ycksfnRI9gn3o=
X-Google-Smtp-Source: ABdhPJzgAY6KtKOPC6tfzKmvA8QQMoxhHFJsZyDBWBxynYs54LG5exJnFVce2ePcyXh7zbs+RcwK2Q1VsHbq+C9CSvQ=
X-Received: by 2002:a05:6638:1351:: with SMTP id
 u17mr1911170jad.120.1604062698162; 
 Fri, 30 Oct 2020 05:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201027183149.145165-1-peron.clem@gmail.com>
 <20201027183149.145165-2-peron.clem@gmail.com>
 <01e34ad3-c695-c6eb-95dd-76c2cda77c6f@linux.intel.com>
 <CAJiuCcdX7jc-VMWYfPPL3qu9RcUU7VMdjshyPH_xLA0yVXftUw@mail.gmail.com>
 <3f0c46e2-24a4-b6ee-1ea2-9de5344cfb9d@sholland.org>
In-Reply-To: <3f0c46e2-24a4-b6ee-1ea2-9de5344cfb9d@sholland.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 30 Oct 2020 13:58:07 +0100
Message-ID: <CAJiuCceqhGjzJV+=KQkzswpiG2QRb3NhVHqmrXHBi50wNZBFXw@mail.gmail.com>
Subject: Re: [PATCH v9 01/14] ASoC: sun4i-i2s: Change set_chan_cfg() params
To: Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
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

Hi Samuel

On Fri, 30 Oct 2020 at 02:20, Samuel Holland <samuel@sholland.org> wrote:
>
> On 10/27/20 4:43 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi Pierre-Louis,
> >
> > On Tue, 27 Oct 2020 at 19:59, Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> wrote:
> >>
> >>
> >>> @@ -452,11 +454,11 @@ static int sun8i_i2s_set_chan_cfg(const struct =
sun4i_i2s *i2s,
> >>>       case SND_SOC_DAIFMT_DSP_B:
> >>>       case SND_SOC_DAIFMT_LEFT_J:
> >>>       case SND_SOC_DAIFMT_RIGHT_J:
> >>> -             lrck_period =3D params_physical_width(params) * slots;
> >>> +             lrck_period =3D slot_width * slots;
> >>>               break;
> >>>
> >>>       case SND_SOC_DAIFMT_I2S:
> >>> -             lrck_period =3D params_physical_width(params);
> >>> +             lrck_period =3D slot_width;
> >>>               break;
> >>
> >> Aren't I2S, LEFT_J and RIGHT_J pretty much the same in terms of lrclk
> >> rate/period? the only thing that can change is the polarity, no?
> >>
> >> Not sure why it's handled differently here?
> >
> > I just had a look at the User Manual for H3 and H6 and I didn't find
> > any reason why LEFT_J and RIGHT_J should be computed in a different
> > way as I2S.
>
> Yes, and the manual explicitly groups LEFT_J and RIGHT_J with I2S when
> describing this field:
>
>    PCM Mode: Number of BCLKs within (Left + Right) channel width.
>    I2S/Left-Justified/Right-Justified Mode: Number of BCLKs within each
> individual channel width(Left or Right)
>
> So I agree that the code is wrong here.

Thanks, I will send a fix in the v10.

Regards,
Clement

>
> Regards,
> Samuel
>
> > Also the commit introducing this doesn't mention it.
> > 7ae7834ec446 ("ASoC: sun4i-i2s: Add support for DSP formats")
> >
> > I can't test it with my board but if nobody complains about it, I will
> > introduce a fix for this in the next version and change this also for
> > H6.
> >
> > Thanks for your review,
> > Clement
> >
>
