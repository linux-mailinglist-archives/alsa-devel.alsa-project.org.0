Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8575778D260
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Aug 2023 05:12:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 078D51FC;
	Wed, 30 Aug 2023 05:12:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 078D51FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693365178;
	bh=6B2VI/zg6XRVG73d72pM0EmLD4G4Ff1HMcyuxDb3wRk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c8EYL2I0RWBhRDJZV4g1WtZHrzpaqsGvrJ2HL2Gv5Xgh0BQtz1nRtjpsSoKMF/PeB
	 JWHMGbeG/8K4J0s+FMksYPnQdYGBrty3RLCzidXg3SSVTbsaYL5pupNHmUOISF9Jop
	 OfDN2uLZ4Uow6mgmIeDj9ENxmoeXccIv6AzHbYKU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F20BF800D1; Wed, 30 Aug 2023 05:12:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72A5EF800F5;
	Wed, 30 Aug 2023 05:12:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13249F80155; Wed, 30 Aug 2023 05:11:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC735F800D1
	for <alsa-devel@alsa-project.org>; Wed, 30 Aug 2023 05:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC735F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=QQgVyV0o
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-44d45391e84so2303299137.3
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 20:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693365082; x=1693969882;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/zpOgLvIkPFvPcaR4xxmX73FKY11ocg9236FvpZH8M=;
        b=QQgVyV0ovPJ+ksItzy24eO/UsVOGEPKyocjkJw3GxZXjD46ErGuMXsqHkToxzjZJms
         UFPsPfIOEMNRiU3w6vgOTqYb+ok+S04ek5ITpPHY/a7RFvA+G0MgVGKIcLw0Ruqqe7kZ
         dtSbYUvDLc98JV4J5RpqF6dpDh3CSmX5esvQd09w3axnnlK9k5Z51Ihk2GShD2A3ICS6
         ePHd/qed/SWRsbxYRcQWe1X49Rlnp9Zss7Wv5DSgzDBoxbPnZKnaEcKbEexHyj5iNjjc
         4RO6Cb+bhdvWeshb3quOZTkpMisiDUz+TlBsdqJFQ1b8LEhTSkxINTVeu2ObzyT1G4VK
         IdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693365082; x=1693969882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/zpOgLvIkPFvPcaR4xxmX73FKY11ocg9236FvpZH8M=;
        b=I9HrPupqG5mnZyn9oYAiy1AcFOoPTDXlJtRgSmfSfkfI7+/G0XmTS0/n8/+aOBnk9X
         N4371eZXLtuE7FzZN1Mh6+nFKMSpc5ZEix53T0Tecf3APMVExc4M/P0KkbM7s2x4cTq+
         MhTaXOX2f36IaOlVhWEo6X27rL4R71z09qOzVCyambA86dztoGBRFgARWVA2yHaNinq9
         nYhnBXAKx2tMvIjqTnPOpxK20LZP1fumFS1CGIakN5ySUdKsquRBjMTD7rwCwLxDriP+
         cSi9ImCXZt1+SgP8r7zGjE2gfX9upTydttYvfKWFJnZzc00Dq3cnX6dVywjiP7OJI7pr
         CCDQ==
X-Gm-Message-State: AOJu0Yzo5obUgN4NJM0PP6VeMp2vck8tmtqjkuF7/mPQag/H6vgBeroQ
	Ked9l+/wm6/GKOLzaEmxn56NffI9mYZzTw52oj8=
X-Google-Smtp-Source: 
 AGHT+IFcKHvGWkCwrHeUph6QKacvUFGeoVK+QuP9OlsWGA4RbslTUal2tr2ZR3/eQCQuMJw2exL8eO3QY5zcc/iGMW8=
X-Received: by 2002:a05:6102:3ce:b0:44e:dd43:38e1 with SMTP id
 n14-20020a05610203ce00b0044edd4338e1mr1018093vsq.1.1693365081966; Tue, 29 Aug
 2023 20:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
 <87il9xu1ro.wl-tiwai@suse.de>
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
 <87il9xoddo.wl-tiwai@suse.de>
 <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
 <844ef9b6-d5e2-46a9-b7a5-7ee86a2e449c@sirena.org.uk>
 <CAA+D8AOnsx+7t3MrWm42waxtetL07nbKURLsh1hBx39LUDm+Zg@mail.gmail.com>
 <CAA+D8AMriHO60SD2OqQSDMmi7wm=0MkoW6faR5nyve-j2Q5AEQ@mail.gmail.com>
 <CAA+D8AN34-NVrgksRAG014PuHGUssTm0p-KR-HYGe+Pt8Yejxg@mail.gmail.com>
 <87wmxk8jaq.wl-tiwai@suse.de> <ZOe74PO4S6bj/QlV@finisterre.sirena.org.uk>
 <CAA+D8AM_pqbjQaE59n6Qm5gypLb8zPAwOpJR+_ZEG89-q3B8pg@mail.gmail.com>
 <8735076xdn.wl-tiwai@suse.de>
 <bc12f76e-a2ac-2818-f136-b31f6fa49310@xs4all.nl>
In-Reply-To: <bc12f76e-a2ac-2818-f136-b31f6fa49310@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 30 Aug 2023 11:11:10 +0800
Message-ID: 
 <CAA+D8AMdvnBnaNyZ6jPpn9g=zwRa4Ht+mi=aU0o02zw_W-fEag@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VLENN77UF5OX2WVVBRAFHUZQUTIJZM57
X-Message-ID-Hash: VLENN77UF5OX2WVVBRAFHUZQUTIJZM57
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLENN77UF5OX2WVVBRAFHUZQUTIJZM57/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 25, 2023 at 10:15=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> =
wrote:
>
> On 25/08/2023 15:54, Takashi Iwai wrote:
> > On Fri, 25 Aug 2023 05:46:43 +0200,
> > Shengjiu Wang wrote:
> >>
> >> On Fri, Aug 25, 2023 at 4:21=E2=80=AFAM Mark Brown <broonie@kernel.org=
> wrote:
> >>>
> >>> On Thu, Aug 24, 2023 at 07:03:09PM +0200, Takashi Iwai wrote:
> >>>> Shengjiu Wang wrote:
> >>>
> >>>>> But there are several issues:
> >>>>> 1. Need to create sound cards.  ASRC module support multi instances=
, then
> >>>>> need to create multi sound cards for each instance.
> >>>
> >>>> Hm, why can't it be multiple PCM instances instead?
> >>>
> >>> I'm having a hard time following this one too.
> >>>
> >>>>> 2. The ASRC is an entirety but with DPCM we need to separate input =
port and
> >>>>> output port to playback substream and capture stream. Synchronous b=
etween
> >>>>> playback substream and capture substream is a problem.
> >>>>> How to start them and stop them at the same time.
> >>>
> >>>> This could be done by enforcing the full duplex and linking the both
> >>>> PCM streams, I suppose.
> >>>
> >>>>> So shall we make the decision that we can go to the V4L2 solution?
> >>>
> >>>> Honestly speaking, I don't mind much whether it's implemented in V2L=
4
> >>>> or not -- at least for the kernel part, we can reorganize / refactor
> >>>> things internally.  But, the biggest remaining question to me is
> >>>> whether this user-space interface is the most suitable one.  Is it
> >>>> well defined, usable and maintained for the audio applications?  Or
> >>>> is it meant to be a stop-gap for a specific use case?
> >>>
> >>> I'm having a really hard time summoning much enthusiasm for using v4l
> >>> here, it feels like this is heading down the same bodge route as DPCM
> >>> but directly as ABI so even harder to fix properly.  That said all th=
e
> >>> ALSA APIs are really intended to be used in real time and this sounds
> >>> like a non real time application?  I don't fully understand what the
> >>> actual use case is here.
> >>
> >> Thanks for your reply.
> >>
> >> This asrc memory to memory (memory ->asrc->memory) case is a non
> >> real time use case.
> >>
> >> User fills the input buffer to the asrc module,  after conversion, the=
n asrc
> >> sends back the output buffer to user. So it is not a traditional ALSA =
playback
> >> and capture case. I think it is not good to create sound card for it, =
 it is
> >> not a sound card actually.
> >>
> >> It is a specific use case,  there is no reference in current kernel.
> >> v4l2 memory to memory is the closed implementation,  v4l2 current
> >> support video, image, radio, tuner, touch devices, so it is not
> >> complicated to add support for this specific audio case.
> >>
> >> Maybe you can go through these patches first.  Because we
> >> had implemented the "memory -> asrc ->i2s device-> codec"
> >> use case in ALSA.  Now the "memory->asrc->memory" needs
> >> to reuse the code in asrc driver, so the first 3 patches is for refini=
ng
> >> the code to make it can be shared by the "memory->asrc->memory"
> >> driver.
> >>
> >> The main change is in the v4l2 side, A /dev/vl42-audio will be created=
,
> >> user applications only use the ioctl of v4l2 framework.
> >
> > Ah, now I'm slowly understanding.  So, what you want is to have an
> > interface to perform the batch conversion of a data stream from an
> > input to an output?  And ALSA PCM interface doesn't fit fully for that
> > purpose because the data handling is batched and it's not like a
> > normal PCM streaming?
> >
> > Basically the whole M2M arguments are rather subtle.  Those are
> > implementation details that can be resolved in several different ways
> > in the kernel side.  But the design of the operation is the crucial
> > point.
> >
> > Maybe we can consider implementing a similar feature in ALSA API, too.
> > But it's too far-stretched for now.
> >
> > So, if v4l2 interface provides the requested feature (the batched
> > audio stream conversion), it's OK to ride on it.
>
> The V4L2 M2M interface is simple: you open a video device and then you ca=
n
> pass data to the hardware, it processes it and you get the processed data=
 back.
>
> The hardware just processes the data as fast as it can. Each time you ope=
n
> the video device a new instance is created, and each instance can pass jo=
bs
> to the hardware.
>
> Currently it is used for video scalers, deinterlacers, colorspace convert=
ers and
> codecs, but in the end it is just data in, data out with some job schedul=
ing (fifo)
> towards the hardware. So supporting audio using the same core m2m framewo=
rk wouldn't
> be a big deal. We'd probably make a /dev/v4l-audio device for that.
>
> It doesn't come for free: it is a new API, so besides adding support for =
it, it
> also needs to be documented, we would need compliance tests, and very lik=
ely I
> would want a new virtual driver for this (vim2m.c would be a good templat=
e).
>

Thanks all.

I will try to pass the compliance test.  Should the virtual driver be added=
 now?

Best regards
Wang Shengiu
