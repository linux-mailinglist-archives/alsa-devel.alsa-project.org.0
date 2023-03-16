Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8019A6BC66E
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 08:00:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92EEC1151;
	Thu, 16 Mar 2023 07:59:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92EEC1151
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678950043;
	bh=VTEUN5TlsF5BNPN1SSwMgrms8CPEi/57uayzgBPJIMY=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FuKvAqoKVQvdYM/pYu7X76E2QtqQ5lJIUyHkEIq0CyFLYK1jFHKLP0e0IO3BMd/tu
	 QVnPelqJcnfhwEyllbFi7jPrlQhmVmHrOuGszJCDFJfjX+fTKhoso6HR1OJlm0hoE1
	 FVJIuQoia5eCl59hb2vl8lMM2s4VT0gU4BRzZ3tk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A13AF8016C;
	Thu, 16 Mar 2023 07:59:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B269F80423; Thu, 16 Mar 2023 07:59:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75213F8016C
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 07:59:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75213F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WKjcew4l
Received: by mail-ed1-x52e.google.com with SMTP id w9so3669097edc.3
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Mar 2023 23:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678949947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgDKGokQR+4JPSgN0QqCTweCwRsx4eTE4MHO9hOb9T0=;
        b=WKjcew4l/h348OTCKt6zEsmhdyILWxegry52zwbTUXK5+ORd93qwQJYlaWWBcYu0nF
         H+xPjC1V3S64zgWDnfPWvxaQUA8pXwZz+Ugu253yLvKXWbw6zcXBbFEKpm8oUlkfJcez
         qO1wVd5iPhyw9I3FrEfhFr9jrgG9vrjK8D3NjCMrvjjN57ok0Kuj39CzaPVXwR5XhcXF
         WEz+DRS4WZ5XA4QfGTsI9ctDUPRhbcO+a8ec25xVp6BeQq0xVzUVJzZG3W5qa2QFFmVM
         x6c72mP0BIuyVDCpOjzZdfdXk+G56D1J59tSFObLmfchCM/GU11Clr7QGYm3dRRX0c4M
         agXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678949947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VgDKGokQR+4JPSgN0QqCTweCwRsx4eTE4MHO9hOb9T0=;
        b=uoeOYtTPHLQggxXYeDp+B/nMT9NJkTrZRrI7B/tc/moshpjmxTxG+1uF5y3JT4UVE0
         +EQeG88Z36wUleYCdk1VbhI9PLsWm0iYEGwqJnDUBGtPUGw5nDWyLrtLWpv2hJsU9aZG
         iTlJE2t8DO1hdvZOt5G7jRLvO9sAD+llhHM+/3n1/Hfx+9R1VGyHf5XCqqmRK0JGdfho
         h419+tz8M2aJYiFLFmDNwVejQjNUPrv0+QYTgEDQENpTosW4beH6DCz2qUH+sSILX89V
         Z+dWH5w3FhI/uAZiwJmSi/g6ailrvlGa9CbrMNAttuLH1Bozuoj69p73YrdCUT9SEgB2
         hoBg==
X-Gm-Message-State: AO0yUKVV0yLupjWOyjXg5KtQyO+18qaFujA/JD6QVgqfQQoGI0dOxKvQ
	ZcR/BFlDPfhfhXuuaFL5C36FXjLDhQ7BF827n4M=
X-Google-Smtp-Source: 
 AK7set/hRGu/gvEAQOZy55e95HFYusYBm+MYWsGO+1P/oimOY18G0R+Vs517oYPB5xrG+vDfgyyAyuLM0FDlExZIfig=
X-Received: by 2002:a17:906:1dcc:b0:8b2:23fb:dfd8 with SMTP id
 v12-20020a1709061dcc00b008b223fbdfd8mr4667764ejh.12.1678949947098; Wed, 15
 Mar 2023 23:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230314153409.1805280-1-daniel.baluta@oss.nxp.com>
 <6d9d09aa-d83e-e811-1d43-34780ea05d4d@linux.intel.com>
 <CAEnQRZAj-FW-fCWsyupUDAH4Z2kTf0RL1acivyDHszMuU-75pg@mail.gmail.com>
 <5e26ef3e-1319-25cd-f7d5-245eaea66769@linux.intel.com>
In-Reply-To: <5e26ef3e-1319-25cd-f7d5-245eaea66769@linux.intel.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 16 Mar 2023 08:58:55 +0200
Message-ID: 
 <CAEnQRZCtmXdFqrsUEaDMG49=ZreFE2oBowjP1M4pywrQP4PA2A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: soc-compress: Inherit atomicity from DAI link for
 Compress FE
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 2KZCUGC5KVDRAYSFI3NM4DZDMO77GHBP
X-Message-ID-Hash: 2KZCUGC5KVDRAYSFI3NM4DZDMO77GHBP
X-MailFrom: daniel.baluta@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 linux-kernel@vger.kernel.org, paul.olaru@nxp.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2KZCUGC5KVDRAYSFI3NM4DZDMO77GHBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 14, 2023 at 6:52=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 3/14/23 11:37, Daniel Baluta wrote:
> > On Tue, Mar 14, 2023 at 6:14=E2=80=AFPM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> wrote:
> >>
> >>
> >>
> >> On 3/14/23 10:34, Daniel Baluta wrote:
> >>> From: Daniel Baluta <daniel.baluta@nxp.com>
> >>>
> >>> After commit bbf7d3b1c4f40 ("ASoC: soc-pcm: align BE 'atomicity' with
> >>> that of the FE") BE and FE atomicity must match.
> >>>
> >>> In the case of Compress PCM there is a mismatch in atomicity between =
FE
> >>> and BE and we get errors like this:
> >>>
> >>> [   36.434566]  sai1-wm8960-hifi: dpcm_be_connect: FE is atomic but B=
E
> >>> is nonatomic, invalid configuration
> >>
> >> Not clear on the 'FE is atomic' in the case of a compressed stream,
> >> which has to be handled with some sort of IPC, i.e. be nonatomic.
> >>
> >
> > 'FE is atomic' in this message is printed because this is the default v=
alue
> > of nonatomic field when PCM struct associated for a Compress PCM
> > struct is allocated.
> >
> > No one changes 'nonatomic' field for Compress FE until my current patch=
.
> >
> >> Also not sure why the FE is not set as nonatomic by the SOF parts?
> >> If it's needed for PCM, why wouldn't it be needed for compressed data?
> >
> > FE is not touched for SOF parts. Only BE is set to nonatomic by SOF.
>
> Where do you see the BE being changed by SOF?
>
> >
> > See: sound/soc/topology.c
> >
> > =C2=BB       /* Set nonatomic property for FE dai links as their trigge=
r
> > action involves IPC's */
> > =C2=BB       if (!link->no_pcm) {
> > =C2=BB       =C2=BB       link->nonatomic =3D true;
> > =C2=BB       =C2=BB       return 0;
> > =C2=BB       }
>
> that's a FE property, not BE.

You are right.

>
> > FE for PCM is modified by sound/soc/soc-pcm.c
> >
> > int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
> > =C2=BB       pcm->nonatomic =3D rtd->dai_link->nonatomic;
> >
> > So, I guess people assumed that is enough to use RTD dai link to set
> > pcm->noatomic field
> > and didn't look at it in SOF.
>
> Ah yes, now I see your point now. You still had a logical inversion
> above but you're correct here.
>
> > When FE for Compress PCM is created, we don't use soc_new_pcm but inste=
ad
> > we use snd_pcm_new_internal which doesn't inherit the nonatomic field
> > of the rtd->dai_link
> > as Normal PCM does inside soc_pcm_new.
> >
> > So, my patch makes sure we inherit the nonatomic field from
> > rtd->dai_link also for Compress PCM
> > similar with what already happens for Normal PCM.
> >
> > tl;dr: when creating a Normal PCM pcm->nonatomic is inherited from RTD
> > DAI link. when creating a
> > Compress PCM pcm->nonatomic field is not set. This patch makes sure
> > that for Compres PCM
> > we also inherit nonatomic from RTD DAI link.
>
> That makes sense. It's quite likely that the compress PCM should be
> nonatomic by default, not sure how it can work otherwise.

To sum up:

- we need to merge current patch  because Compress PCM needs to
inherit the atomicity from FE DAI

Because SOF FE DAI links are made to be nonatomic:

sound/soc/sof/topology.c
=C2=BB       /* Set nonatomic property for FE dai links as their trigger
action involves IPC's */
=C2=BB       if (!link->no_pcm) {
=C2=BB       =C2=BB       link->nonatomic =3D true;
=C2=BB       =C2=BB       return 0;
=C2=BB       }

and with my patch:

sound/soc/soc-compress.c

+               /* inherit atomicity from DAI link */
+               be_pcm->nonatomic =3D rtd->dai_link->nonatomic;
+
                rtd->pcm =3D be_pcm;

... then Compres PCM will be nonatomic.

Side note: I think be_pcm from the patch above should be called fe_pcm
instead. But that's a story for another patch.

thanks,
Daniel.
