Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4615579FC9
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 15:37:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAB4A1635;
	Tue, 19 Jul 2022 15:36:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAB4A1635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658237820;
	bh=aCtI/Id5updVlsOBUNhg0yT00gkRb7J9VdhHe3pYbwQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X3AaI6E4TwWsIhBipwC+ckGF5XRe4vYwM07tpEh/nbFA+ZLminFVkV5aZTekl6Xzm
	 HPKAVHChuaH9NcJD+DMnVjrrX1w6pM52OTLa415FArpiieahp5tsRIiXIN0MZu2Jxf
	 bFyXTNOLv0MurycjbaYNl0dHTrrQ3MThAUmZppjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C81FF80224;
	Tue, 19 Jul 2022 15:35:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 134C9F801EC; Tue, 19 Jul 2022 15:35:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F23AF80118
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 15:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F23AF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Fuq436nZ"
Received: by mail-lj1-x22e.google.com with SMTP id r14so2645401ljp.2
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 06:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EYhNiV6rjAGveB6cgLaFxeAyijGwg5dPmG8gWNP28+Q=;
 b=Fuq436nZlp7dZAoFB3v943h3EJy4gkCFmW+Rs+eAk+c1ryPOUgP6YHKDmnmv2i/ekW
 UmRlgWZigwd5giVcpV7eMeWMaR1EXwJN9LMm2JxpP7SP6X0qQxwT5sdChZzkwJcf4/U8
 ICppFLw5ZYu7B7+922qgn5i2CwTLyrivcKy7uwUdpXeO6SJ7SJqQlcxr1HLFljhZVHLa
 u/I3CiGNBCEy0pSEsy7gpwTRk1Qg0//ywOtwLW8LpPd+nLotOzkBDvmzVrl0Crw5+ocg
 MF8+sNCqu6o8QbEISnNxk/WMBWKXNLbV23sI/D89zLqyL8OX/H+bzxyWc1V5ctB5wMW+
 c7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EYhNiV6rjAGveB6cgLaFxeAyijGwg5dPmG8gWNP28+Q=;
 b=lJVWz2D3BbpfrIfOpKsWKHvtAMxJ01fH2WzYHhqBo1JRhAB/omTZ/oU1PsruGrV3oC
 RNAKTacf6H58YA7TNt4nCZC7dqmGW8SIprzer3wtL2q8VdYk+JhGJqivyB/7ZPolgQ8N
 +z+HXIoC1grj8okV+KkHf0dssKP0LBuU4pBM47AWQjZnHR6uTCtdbivMqA/kJTTl2P9D
 FR7QbKxcjex0ymkcWONhpZZHuEXTFJPCcq9bT8ZQ1gOY0VeXrRrfldOwMXB9p7UclnDX
 uYqXvIXN9AK5SvNphXSPu/iprOhEIc1cv9uPDpuNp2Li65Nd19LkKUOI94IU0Vedo8Qk
 rpig==
X-Gm-Message-State: AJIora+hP/fKfaV5++DuaCjYikVYoJBdchFDwUs+wiAvxfnE4CYtHuBj
 y0bPKWCrmBfaNOEL4uWhASdfOjyVrdVLCzmQCW8=
X-Google-Smtp-Source: AGRyM1vmXYrnAUoLeBfjgLhOeD/rlORVWUN4WB6Qb74COXtswRcn1mUJowJ338W41KearXy+WM031Zyg46JbD2NF9h0=
X-Received: by 2002:a2e:9941:0:b0:247:dce8:b0ec with SMTP id
 r1-20020a2e9941000000b00247dce8b0ecmr15228738ljj.404.1658237746962; Tue, 19
 Jul 2022 06:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <1658222864-25378-1-git-send-email-shengjiu.wang@nxp.com>
 <1658222864-25378-3-git-send-email-shengjiu.wang@nxp.com>
 <f2609401c8834e8bbe926200bfc87971@AcuMS.aculab.com>
 <YtaEpf6Cd7KH7wH4@sirena.org.uk>
 <20cfcc8e59a74166846cff028cd2c4e8@AcuMS.aculab.com>
 <CAA+D8AO6P2AcOJ+E97Y1=P72Qa1wjtMGMneWnsP+VcdnCzzYuw@mail.gmail.com>
 <c9231becb2cd4e2999ec631f9d2171c3@AcuMS.aculab.com>
In-Reply-To: <c9231becb2cd4e2999ec631f9d2171c3@AcuMS.aculab.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 19 Jul 2022 21:35:34 +0800
Message-ID: <CAA+D8AMTrp3KXpDEtyJbqgbA8feYCvEcWc4CMYY8zYSMgrvW6w@mail.gmail.com>
Subject: Re: [PATCH -next 2/5] ASoC: fsl_asrc: force cast the asrc_format type
To: David Laight <David.Laight@aculab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Tue, Jul 19, 2022 at 8:39 PM David Laight <David.Laight@aculab.com>
wrote:

> grrr... top-posting because outluck is really stupid :-(
>
>
>
> The definition seems to be:
>
> typedef int __bitwise
> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/__bitwise>
> snd_pcm_format_t
> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/snd_pcm_format_t>;
>
> #define SNDRV_PCM_FORMAT_S8
> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/SNDRV_PCM_FORMAT_S8>
> ((__force <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/__force>
> snd_pcm_format_t
> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/snd_pcm_format_t>) 0)
>
> #define SNDRV_PCM_FORMAT_U8
> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/SNDRV_PCM_FORMAT_U8>
> ((__force <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/__force>
> snd_pcm_format_t
> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/snd_pcm_format_t>) 1)
>
> #define SNDRV_PCM_FORMAT_S16_LE
> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/SNDRV_PCM_FORMAT_S16_=
LE>
> ((__force <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/__force>
> snd_pcm_format_t
> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/snd_pcm_format_t>) 2)
>
> ...
>
> (goes away and looks up __bitwIse)
>
>
>
> I think I=E2=80=99d add:
>
> #define snd_pcm_format(val) ((__force snd_pcm_format_t)(val))
>

Where is this definition? Which header file?
Thanks.

Best regards
Wang Shengjiu

> and use that to remove most of the casts.
>
But the ones where you have (u32 *)&xxx are only valid because u32 and int
> are the same size.
>
> That does sort of happen to be true, but someone might look at all the
> values and
>
> decide that u8 is big enough.
>
> After which the code will still compile, but the data areas get corrupted=
.
>
> So you really need to use a u32 =E2=80=98temp=E2=80=99 variable.
>
>
>
> It would all be slightly less problematic if the =E2=80=98force=E2=80=99 =
casts could be
> sparse only
>
> (ie not seen by the compiler) =E2=80=93 so the compiler would do the type=
 checking.
>
>
>
>                 David
>
>
>
> *From:* Shengjiu Wang <shengjiu.wang@gmail.com>
> *Sent:* 19 July 2022 12:07
> *To:* David Laight <David.Laight@ACULAB.COM>
> *Cc:* Mark Brown <broonie@kernel.org>; Shengjiu Wang <
> shengjiu.wang@nxp.com>; Xiubo.Lee@gmail.com; festevam@gmail.com;
> nicoleotsuka@gmail.com; lgirdwood@gmail.com; perex@perex.cz;
> tiwai@suse.com; alsa-devel@alsa-project.org; linuxppc-dev@lists.ozlabs.or=
g;
> linux-kernel@vger.kernel.org
> *Subject:* Re: [PATCH -next 2/5] ASoC: fsl_asrc: force cast the
> asrc_format type
>
>
>
>
>
>
>
> On Tue, Jul 19, 2022 at 6:34 PM David Laight <David.Laight@aculab.com>
> wrote:
>
> From: Mark Brown
> > Sent: 19 July 2022 11:17
> >
> > On Tue, Jul 19, 2022 at 10:01:54AM +0000, David Laight wrote:
> > > From: Shengjiu Wang
> >
> > > > - ret =3D of_property_read_u32(np, "fsl,asrc-format",
> &asrc->asrc_format);
> > > > + ret =3D of_property_read_u32(np, "fsl,asrc-format", (u32
> *)&asrc->asrc_format);
> >
> > > Ugg, you really shouldn't need to do that.
> > > It means that something is badly wrong somewhere.
> > > Casting pointers to integer types is just asking for a bug.
> >
> > That's casting one pointer type to another pointer type.
>
> It is casting the address of some type to a 'u32 *'.
> This will then be dereferenced by the called function.
> So the original type better be 32 bits.
>
> I'm also guessing that sparse was complaining about endianness?
> It isn't at all clear that these casts actually fix it.
>
> The sparse is complaining about the snd_pcm_format_t cast to u32/int type=
.
>
>
>
> The code in include/sound/pcm.h also does such __force cast.
>
> #define _SNDRV_PCM_FMTBIT(fmt)          (1ULL << (__force
> int)SNDRV_PCM_FORMAT_##fmt)
>
>
>
> The change I have made does not cause an issue.
>
>
>
> Best regards
>
> Wang shengjiu
>
>
>
> (Mark: You'll be glad to hear that the office aircon is
> broken again - two weeks lead time on the spare part.)
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1
> 1PT, UK
> Registration No: 1397386 (Wales)
>
>
>
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1
> 1PT, UK
> Registration No: 1397386 (Wales)
>
> P *Please consider the environment and don't print this e-mail unless you
> really need to*
>
