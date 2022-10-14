Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5C55FEA9B
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Oct 2022 10:33:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F6772026;
	Fri, 14 Oct 2022 10:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F6772026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665736405;
	bh=jhvAYR7Ae2UWAALpO2QAkzAFAuq/JwYDsaXP3cH/SN0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pv80NrYpc2CpeIhjrlhDlTbnLgVVtVSVPyDEYK1ZcZJY5VMY2IZvCmqoqZqDLZsVj
	 8zV5csHiQfzxTrj/OwoccXGxfhRZpLV9HFkgdTnntuN58eGuHFmcaYbO3DEVYDqern
	 zFJH7tT2eofMVWpKOosnNX44eHu0Hf7cCiB3UGSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09663F80240;
	Fri, 14 Oct 2022 10:32:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A43CF80115; Fri, 14 Oct 2022 10:32:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from kiwi.benhosting.org (kiwi.benhosting.org [109.230.227.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 625E6F80115
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 10:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 625E6F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=benjaminmarty.ch header.i=@benjaminmarty.ch
 header.b="Jax9e6HB"; 
 dkim=pass (2048-bit key) header.d=benjaminmarty.ch header.i=@benjaminmarty.ch
 header.b="Jax9e6HB"
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by kiwi.benhosting.org (Postfix) with ESMTPSA id 1EBFDABD6F4
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 10:32:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=benjaminmarty.ch;
 s=2021; t=1665736342;
 bh=jhvAYR7Ae2UWAALpO2QAkzAFAuq/JwYDsaXP3cH/SN0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Jax9e6HB6W8C2X6yIWQ+8d5gLX++0JLg5pHX/CpdjRZbA9GSEDbz6QmSRxTXK888x
 ggjttI72BHnZ2v3zL48KUBVYr1CgJbDRidNZITU53B0MtmfdDrLw89DnI3UYjxYmK5
 5TuBjpObnx0mSRay62t6PVJdSJFbZltAuCl/SANVtJ2fTP8uUczQvLSKE/CHZtliHU
 u8QvF2XWmvrq5ok+ybjJt30CJzJSJsPodRGk5fdBTY0y9mwKNaPyKHz5I9MIwAsWmp
 fuCJzxlv9wzJHZtXJq4FXQfU6bxIO/hp2q/lnmqAfV1Wl+sNtA+VzWN6Ko58joXlfn
 Ifv8iL2GHy4GA==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=benjaminmarty.ch;
 s=2021; t=1665736342;
 bh=jhvAYR7Ae2UWAALpO2QAkzAFAuq/JwYDsaXP3cH/SN0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Jax9e6HB6W8C2X6yIWQ+8d5gLX++0JLg5pHX/CpdjRZbA9GSEDbz6QmSRxTXK888x
 ggjttI72BHnZ2v3zL48KUBVYr1CgJbDRidNZITU53B0MtmfdDrLw89DnI3UYjxYmK5
 5TuBjpObnx0mSRay62t6PVJdSJFbZltAuCl/SANVtJ2fTP8uUczQvLSKE/CHZtliHU
 u8QvF2XWmvrq5ok+ybjJt30CJzJSJsPodRGk5fdBTY0y9mwKNaPyKHz5I9MIwAsWmp
 fuCJzxlv9wzJHZtXJq4FXQfU6bxIO/hp2q/lnmqAfV1Wl+sNtA+VzWN6Ko58joXlfn
 Ifv8iL2GHy4GA==
Received: by mail-pj1-f54.google.com with SMTP id pq16so4319945pjb.2
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 01:32:22 -0700 (PDT)
X-Gm-Message-State: ACrzQf3xsjfH/r4Xi+mVFaWuTeICDk3RHVjZzmMH/3acqwrqN8yJ419h
 nlM4akTZF+sxZiMS7Cdo2sxkd3bxyBWe+OLzXHE=
X-Google-Smtp-Source: AMsMyM63Fb2vGaV3fGyRYAf39BysCWWnicVxnCjthPc7XfLoyfF59hFGh1vcbq6Ptu03ODRGCRv8KPtY420/B/8OWEo=
X-Received: by 2002:a17:902:ce87:b0:181:e55d:2d4 with SMTP id
 f7-20020a170902ce8700b00181e55d02d4mr4291921plg.13.1665736340198; Fri, 14 Oct
 2022 01:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220922134458.3421695-1-info@benjaminmarty.ch>
 <6fb90595-26f5-a779-7366-fa4fb9e86935@nuvoton.com>
In-Reply-To: <6fb90595-26f5-a779-7366-fa4fb9e86935@nuvoton.com>
From: Benjamin Marty <info@benjaminmarty.ch>
Date: Fri, 14 Oct 2022 10:32:03 +0200
X-Gmail-Original-Message-ID: <CABSdY3+YjLi5jBxMHRSi-KyYuRwZYRGMBNUScDP7UNfak8Oxbw@mail.gmail.com>
Message-ID: <CABSdY3+YjLi5jBxMHRSi-KyYuRwZYRGMBNUScDP7UNfak8Oxbw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: nau8822: add spk boost and spk btl options
To: AS50 CTLin0 <ctlin0@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: wtli@nuvoton.com, alsa-devel@alsa-project.org, kchsu0@nuvoton.com
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

Am Fr., 14. Okt. 2022 um 10:28 Uhr schrieb AS50 CTLin0 <ctlin0@nuvoton.com>=
:
>
> On 2022/9/22 =E4=B8=8B=E5=8D=88 09:44, Benjamin Marty wrote:
> > These two options are required to use the Speaker output on this codec
> > to its full potential, when wiring up the Speaker in an BTL configurati=
on.
> >
> > The Speaker Boost flag is explained in the Datasheet on page 80.
> > The Speaker BTL flag is explained in the Datasheet on page 78.
> >
> > Signed-off-by: Benjamin Marty <info@benjaminmarty.ch>
> > ---
> >   sound/soc/codecs/nau8822.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
> > index 1aef281a9972..812b8254f9a0 100644
> > --- a/sound/soc/codecs/nau8822.c
> > +++ b/sound/soc/codecs/nau8822.c
> > @@ -379,6 +379,12 @@ static const struct snd_kcontrol_new nau8822_snd_c=
ontrols[] =3D {
> >               NAU8822_REG_DAC_CONTROL, 5, 1, 0),
> >       SOC_SINGLE("ADC 128x Oversampling Switch",
> >               NAU8822_REG_ADC_CONTROL, 5, 1, 0),
> > +
> > +     SOC_SINGLE("Speaker Gain Boost Control",
> > +             NAU8822_REG_OUTPUT_CONTROL, 2, 1, 0),
> > +
> > +     SOC_SINGLE("Speaker BTL Configuration",
> > +             NAU8822_REG_RIGHT_SPEAKER_CONTROL, 4, 1, 0),
> >   };
> >
> >   /* LMAIN and RMAIN Mixer */
>
> Looks good to me, thanks.
> But please add the right maintainer Mark Brown <broonie@kernel.org> for
> patch review.
>
> Acked-by: David Lin <CTLIN0@nuvoton.com>
>
> ________________________________
> ________________________________
>  The privileged confidential information contained in this email is inten=
ded for use only by the addressees as indicated by the original sender of t=
his email. If you are not the addressee indicated in this email or are not =
responsible for delivery of the email to such a person, please kindly reply=
 to the sender indicating this fact and delete all copies of it from your c=
omputer and network server immediately. Your cooperation is highly apprecia=
ted. It is advised that any unauthorized use of confidential information of=
 Nuvoton is strictly prohibited; and any information in this email irreleva=
nt to the official business of Nuvoton shall be deemed as neither given nor=
 endorsed by Nuvoton.
>

Thanks, how can I add someone on this existing Patch? Or should I just
resubmit the Patch?
