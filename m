Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C77F88C0E07
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 12:13:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65C64E82;
	Thu,  9 May 2024 12:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65C64E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715249595;
	bh=UAeR5ZjiFr/EvIX6LWiLIWkIVSAHBYDxqVhnGR8afWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fKb1CSFX3Hpr2PbubAUGUJV7rdjTrHnzjokYiSS2wtIr/0Gv4PMwSp/iX2l5ZmUpu
	 vgb5hzOsbPXaSunYr4+4IpBjECdtKhVeT9Yh78l7zIYBVz9Emt0hcYyoLCcpL8DdY9
	 OwurZu+dfZOSSdmATOW63jvds9HuT39S37VHjQU8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77F50F805AA; Thu,  9 May 2024 12:12:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1B6EF8057C;
	Thu,  9 May 2024 12:12:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEDAEF80423; Thu,  9 May 2024 12:12:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 284C7F800E2
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 12:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 284C7F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ewWhXxqT
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-36c826d6edeso3181175ab.0
        for <alsa-devel@alsa-project.org>;
 Thu, 09 May 2024 03:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715249551; x=1715854351;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeeOhJExMaeOPonFZLuLoibUPLJlD+uSiqsEeJXK218=;
        b=ewWhXxqTruZUy7gi9jmrWkmMim9VtxkAnP1z0i2YluqPGwoaxCEVy4nPc9ikQcNQfb
         zvIfIgLa0OLGUNFe//1c6shwaMWl2Zm4rCcKliXNs1S6YJCITqFW17+QJANvLTQ1afyT
         cTJByBICKGUWr0xrSLkbg7CEgGJ/WoFIvIz/5ZRrSiTipA+fJDB4SFhBhrcFJGin+Z/D
         gCx252PUgss7GyaGovjUq/v0qqM2ihwEbNQ1Q2fzvmxmWLBq3ob7WPaFY0pfYaF76uVs
         nheMn153oI5EistcRz4ghiC2zVEAsKLf9c1mzGuqNTgbkhZ0xCQgwP7kckfnc2tLjUOv
         98Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715249551; x=1715854351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qeeOhJExMaeOPonFZLuLoibUPLJlD+uSiqsEeJXK218=;
        b=ixo64ruTGOEzteWbRfVgJzavcezXSra+xWCVzy81GXvzUzUFQlVbLrCaoGsHSgIKHM
         V0eNDKKxLzuhRFVVi9PIOGnGIbT1q1r7LfbTKqYh/lrbkeehckBKmIps/NSraNJCasF/
         hlxnGk81Vx4vcRvsMpy6C9Tv9LCJDtnDOS+c8FOiGlljHR7q8pJtibe1g8gaZH0x/1YZ
         m2taAFd4vk7P9wDXbOwPsCVOIkmJ4ZUV0yuVei2N7WRDEUdpaiiwLdgZRTdsh0P153WD
         DdKKDv38IluM+ygJa0uGWjB4A6CacVemYw94Np2F2roACJ6B7eu2eZDnwkcpfYlNB+4f
         JbGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGxMyOe+sHdla1FaXpziOFaw5RBcYyn5jUzDdzqzp4aPtdZUesAyq8jLmupa0M744PUIVkkj5yMdU925fiiQBZh0cB7sQVhFMSgKk=
X-Gm-Message-State: AOJu0Yw6rtUxUvN+/LaaTHGRul41tNkCHUmPfK1yClZPH4U/Dw0HAFDC
	brrwL2JEg5r3fX6MpfVUbxky3zcj2BrJ8WASXiaUXnSuTnH9LTpiUpYrHCx6b50zLo1UIzpJQjx
	WrZ5Re4ewmX5SLxQ8nKpnChheRPA=
X-Google-Smtp-Source: 
 AGHT+IGACDILZuY3fjYmxVHjuj9EsLsw9yHssyl7QKQF1yUC0YZknYZxgh3CbiS3+eqeZ0s8vnluIDetD2EkdkJwwd8=
X-Received: by 2002:a92:cd8b:0:b0:36c:4b01:3063 with SMTP id
 e9e14a558f8ab-36caed04a13mr56384385ab.15.1715249550653; Thu, 09 May 2024
 03:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
 <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
 <20240430172752.20ffcd56@sal.lan> <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
 <87sez0k661.wl-tiwai@suse.de> <20240502095956.0a8c5b26@sal.lan>
 <20240502102643.4ee7f6c2@sal.lan> <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
 <20240503094225.47fe4836@sal.lan>
 <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
 <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
 <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
 <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
In-Reply-To: <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 9 May 2024 18:12:19 +0800
Message-ID: 
 <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
	sakari.ailus@iki.fi, tfiga@chromium.org, m.szyprowski@samsung.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 62UFU6UW57Y7P72HRNO4WONICAHEHFHT
X-Message-ID-Hash: 62UFU6UW57Y7P72HRNO4WONICAHEHFHT
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/62UFU6UW57Y7P72HRNO4WONICAHEHFHT/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 9, 2024 at 5:50=E2=80=AFPM Amadeusz S=C5=82awi=C5=84ski
<amadeuszx.slawinski@linux.intel.com> wrote:
>
> On 5/9/2024 11:36 AM, Shengjiu Wang wrote:
> > On Wed, May 8, 2024 at 4:14=E2=80=AFPM Amadeusz S=C5=82awi=C5=84ski
> > <amadeuszx.slawinski@linux.intel.com> wrote:
> >>
> >> On 5/8/2024 10:00 AM, Hans Verkuil wrote:
> >>> On 06/05/2024 10:49, Shengjiu Wang wrote:
> >>>> On Fri, May 3, 2024 at 4:42=E2=80=AFPM Mauro Carvalho Chehab <mcheha=
b@kernel.org> wrote:
> >>>>>
> >>>>> Em Fri, 3 May 2024 10:47:19 +0900
> >>>>> Mark Brown <broonie@kernel.org> escreveu:
> >>>>>
> >>>>>> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wr=
ote:
> >>>>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> >>>>>>
> >>>>>>>> There are still time control associated with it, as audio and vi=
deo
> >>>>>>>> needs to be in sync. This is done by controlling the buffers siz=
e
> >>>>>>>> and could be fine-tuned by checking when the buffer transfer is =
done.
> >>>>>>
> >>>>>> ...
> >>>>>>
> >>>>>>> Just complementing: on media, we do this per video buffer (or
> >>>>>>> per half video buffer). A typical use case on cameras is to have
> >>>>>>> buffers transferred 30 times per second, if the video was streame=
d
> >>>>>>> at 30 frames per second.
> >>>>>>
> >>>>>> IIRC some big use case for this hardware was transcoding so there =
was a
> >>>>>> desire to just go at whatever rate the hardware could support as t=
here
> >>>>>> is no interactive user consuming the output as it is generated.
> >>>>>
> >>>>> Indeed, codecs could be used to just do transcoding, but I would
> >>>>> expect it to be a border use case. See, as the chipsets implementin=
g
> >>>>> codecs are typically the ones used on mobiles, I would expect that
> >>>>> the major use cases to be to watch audio and video and to participa=
te
> >>>>> on audio/video conferences.
> >>>>>
> >>>>> Going further, the codec API may end supporting not only transcodin=
g
> >>>>> (which is something that CPU can usually handle without too much
> >>>>> processing) but also audio processing that may require more
> >>>>> complex algorithms - even deep learning ones - like background nois=
e
> >>>>> removal, echo detection/removal, volume auto-gain, audio enhancemen=
t
> >>>>> and such.
> >>>>>
> >>>>> On other words, the typical use cases will either have input
> >>>>> or output being a physical hardware (microphone or speaker).
> >>>>>
> >>>>
> >>>> All, thanks for spending time to discuss, it seems we go back to
> >>>> the start point of this topic again.
> >>>>
> >>>> Our main request is that there is a hardware sample rate converter
> >>>> on the chip, so users can use it in user space as a component like
> >>>> software sample rate converter. It mostly may run as a gstreamer plu=
gin.
> >>>> so it is a memory to memory component.
> >>>>
> >>>> I didn't find such API in ALSA for such purpose, the best option for=
 this
> >>>> in the kernel is the V4L2 memory to memory framework I found.
> >>>> As Hans said it is well designed for memory to memory.
> >>>>
> >>>> And I think audio is one of 'media'.  As I can see that part of Radi=
o
> >>>> function is in ALSA, part of Radio function is in V4L2. part of HDMI
> >>>> function is in DRM, part of HDMI function is in ALSA...
> >>>> So using V4L2 for audio is not new from this point of view.
> >>>>
> >>>> Even now I still think V4L2 is the best option, but it looks like th=
ere
> >>>> are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
> >>>> a duplication of code (bigger duplication that just add audio suppor=
t
> >>>> in V4L2 I think).
> >>>
> >>> After reading this thread I still believe that the mem2mem framework =
is
> >>> a reasonable option, unless someone can come up with a method that is
> >>> easy to implement in the alsa subsystem. From what I can tell from th=
is
> >>> discussion no such method exists.
> >>>
> >>
> >> Hi,
> >>
> >> my main question would be how is mem2mem use case different from
> >> loopback exposing playback and capture frontends in user space with DS=
P
> >> (or other piece of HW) in the middle?
> >>
> > I think loopback has a timing control,  user need to feed data to playb=
ack at a
> > fixed time and get data from capture at a fixed time.  Otherwise there
> > is xrun in
> > playback and capture.
> >
> > mem2mem case: there is no such timing control,  user feeds data to it
> > then it generates output,  if user doesn't feed data, there is no xrun.
> > but mem2mem is just one of the components in the playback or capture
> > pipeline, overall there is time control for whole pipeline,
> >
>
> Have you looked at compress streams? If I remember correctly they are
> not tied to time due to the fact that they can pass data in arbitrary
> formats?
>
> From:
> https://docs.kernel.org/sound/designs/compress-offload.html
>
> "No notion of underrun/overrun. Since the bytes written are compressed
> in nature and data written/read doesn=E2=80=99t translate directly to ren=
dered
> output in time, this does not deal with underrun/overrun and maybe dealt
> in user-library"

I checked the compress stream. mem2mem case is different with
compress-offload case

compress-offload case is a full pipeline,  the user sends a compress
stream to it, then DSP decodes it and renders it to the speaker in real
time.

mem2mem is just like the decoder in the compress pipeline. which is
one of the components in the pipeline.

best regards
shengjiu wang
>
> Amadeusz
