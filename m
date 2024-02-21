Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE3F85D544
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 11:13:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50DF7846;
	Wed, 21 Feb 2024 11:12:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50DF7846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708510379;
	bh=VdwD3m6NWXC/1HXAPru75QbF/kFD+gQGSknB2LVxzwo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Iadg/ewtiW26M4QMbWj3UzbS/ZeLanZL8eUCsSBEBJeYjWvnoZsW/pNcPu2Rkvtqv
	 Ry5iiIe8xpDpO72OrSab1sonUOBq78TFj1w8Ok4z/Rba2aLL9l/jhJ+z1JAQX8GcMG
	 BhzioHATBFdWMEA7QQAyUdY6CbNBJFWbNLTBMdW0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 879CCF805AD; Wed, 21 Feb 2024 11:12:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC99CF804CC;
	Wed, 21 Feb 2024 11:12:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2A8BF80496; Wed, 21 Feb 2024 11:12:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74220F80104
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 11:11:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74220F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M21GbEFm
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-364f794f237so27560065ab.1
        for <alsa-devel@alsa-project.org>;
 Wed, 21 Feb 2024 02:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708510314; x=1709115114;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZKbp4usF7ZooMwkbNPV/awlOsKnx7RNduGOVFzVFPI=;
        b=M21GbEFmZ8D+RwEWtgXsp6If6TMiJA8Cn1Zqi9QQ6iAiwetR0HasHzcDHvhywP/n2K
         nmFcPpi+YBZ8QGwUR9uZEH4NgZJUeSO15zwCIpE0Ga1DhgRwDxpNQBOyviOeXBtvypbG
         A0vY93fDWwf9zd6M4sPEiAsJZ39CMvsFqwqrj2gl4diNoTDvuOkpF5nJtnjdmSkMib/j
         eLplG98yzc5m3Mp9+8xJCvb8YTMaDngO4x/OBb5s9ds40a42g8CmJdayES+FQJIg6Iws
         y6WD7kHGsGwrsuR+gX9MqgrXhooVMmPX8GD0Q9uD3AyxD1DHEfOypyfKNOTGd/gSjoCm
         brTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708510314; x=1709115114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZKbp4usF7ZooMwkbNPV/awlOsKnx7RNduGOVFzVFPI=;
        b=Uybi52lzUpaFwjc06FsBRtL9Jg/5tuoZM/cQCCU86Q2p91AiF8gA0khynyvuXUahmO
         404q/Qt8YJFKVK82qy6bC/ovM/pCrRQqar0w6PhTSpjaZnFi/etnHvK1qMBa8zeVFZx8
         XFZ0Xz1Y0+xH9Zbvq3tC9tj6bus4b5p8KEk/ClgpfNt62WJOhyBMwPCCDkNvGYbW+UYe
         XegpQGaG/NffWPCzQXJgGF24ENct/F1Xgs/A4t/7hG5Lv7bmPPtlq8g1ToDbIBbFkJe5
         wifZzfDNVvtd8tx9EP/1f8mpDWL5GEBvMLACA3ldZctfux09MqsYmcIRA2B75CfGSV2D
         sXXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV/stLWfjBjgSPWGHfb3hacQGds4aeiHD+HubOT66umK8h+I22hU5jN/oc2TPg9PZ2FritPhJpE6dpcCHgurtrpU9mkLEoUnGsPpk=
X-Gm-Message-State: AOJu0YzXFC4hcdpkU9WfGG+QnjYLpsFNlNs+5yb/wZsOLtPvMEUFlyyJ
	zktUeoPZpMWHR6J2zd0d085PWDDelJNwecCjVsOjzxn9r2BahF7LmR1i2Rhqwbvc8Oj+Q7DZ9Kq
	4RQKkDVDNZ5+WlyvAq2JjwA09+Ps=
X-Google-Smtp-Source: 
 AGHT+IHwP0YGlKphHtm67xpwTbsPvnykS5moEGEGjG8wLiOUfX/6e8WVQL0nA7L2tX6O8Xl8WZ/vKMFsIJfBgPoCVzU=
X-Received: by 2002:a05:6e02:1143:b0:364:fffe:44c4 with SMTP id
 o3-20020a056e02114300b00364fffe44c4mr15812470ill.7.1708510313179; Wed, 21 Feb
 2024 02:11:53 -0800 (PST)
MIME-Version: 1.0
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
 <1705581128-4604-8-git-send-email-shengjiu.wang@nxp.com>
 <20240217104212.32f07e3a@coco.lan>
 <CAAFQd5CY731HRhFHpmwzGxAZ-BFV_pT7NNGwNGy4ZOA=qz8ntg@mail.gmail.com>
In-Reply-To: 
 <CAAFQd5CY731HRhFHpmwzGxAZ-BFV_pT7NNGwNGy4ZOA=qz8ntg@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 21 Feb 2024 18:11:42 +0800
Message-ID: 
 <CAA+D8AOKNK37urZfVsuzaTv8PYP-ggTORQEVSpNO0pbaereyLg@mail.gmail.com>
Subject: Re: [PATCH v12 07/15] media: v4l2: Add audio capture and output
 support
To: Tomasz Figa <tfiga@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
	sakari.ailus@iki.fi, m.szyprowski@samsung.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ZPXK2QC5YYOVRGKEUPXGIK3EZGMJI4LL
X-Message-ID-Hash: ZPXK2QC5YYOVRGKEUPXGIK3EZGMJI4LL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPXK2QC5YYOVRGKEUPXGIK3EZGMJI4LL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 21, 2024 at 12:30=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> w=
rote:
>
> On Sat, Feb 17, 2024 at 6:42=E2=80=AFPM Mauro Carvalho Chehab
> <mchehab@kernel.org> wrote:
> >
> > Em Thu, 18 Jan 2024 20:32:00 +0800
> > Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:
> >
> > > Audio signal processing has the requirement for memory to
> > > memory similar as Video.
> > >
> > > This patch is to add this support in v4l2 framework, defined
> > > new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> > > V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> > > for audio case usage.
> > >
> > > The created audio device is named "/dev/v4l-audioX".
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  .../userspace-api/media/v4l/buffer.rst        |  6 ++
> > >  .../media/v4l/dev-audio-mem2mem.rst           | 71 +++++++++++++++++=
++
> > >  .../userspace-api/media/v4l/devices.rst       |  1 +
> > >  .../media/v4l/vidioc-enum-fmt.rst             |  2 +
> > >  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |  4 ++
> > >  .../media/videodev2.h.rst.exceptions          |  2 +
> > >  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
> > >  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  9 +++
> > >  drivers/media/v4l2-core/v4l2-dev.c            | 17 +++++
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          | 53 ++++++++++++++
> > >  include/media/v4l2-dev.h                      |  2 +
> > >  include/media/v4l2-ioctl.h                    | 34 +++++++++
> > >  include/uapi/linux/videodev2.h                | 17 +++++
> > >  13 files changed, 222 insertions(+)
> > >  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-m=
em2mem.rst
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Docum=
entation/userspace-api/media/v4l/buffer.rst
> > > index 52bbee81c080..a3754ca6f0d6 100644
> > > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > > @@ -438,6 +438,12 @@ enum v4l2_buf_type
> > >      * - ``V4L2_BUF_TYPE_META_OUTPUT``
> > >        - 14
> >
> > >        - Buffer for metadata output, see :ref:`metadata`.
> > > +    * - ``V4L2_BUF_TYPE_AUDIO_CAPTURE``
> > > +      - 15
> > > +      - Buffer for audio capture, see :ref:`audio`.
> > > +    * - ``V4L2_BUF_TYPE_AUDIO_OUTPUT``
> > > +      - 16
> >
> > Hmm... alsa APi define input/output as:
> >         enum {
> >                 SNDRV_PCM_STREAM_PLAYBACK =3D 0,
> >                 SNDRV_PCM_STREAM_CAPTURE,
> >                 SNDRV_PCM_STREAM_LAST =3D SNDRV_PCM_STREAM_CAPTURE,
> >         };
> >
> >
> > I would use a namespace as close as possible to the
> > ALSA API. Also, we're not talking about V4L2, but, instead
> > audio. so, not sure if I like the prefix to start with
> > V4L2_. Maybe ALSA_?
> >
> > So, a better namespace would be:
> >
> >         ${prefix}_BUF_TYPE_PCM_STREAM_PLAYBACK
> > and
> >         ${prefix}_BUF_TYPE_PCM_STREAM_CAPTURE
> >
>
> The API is still V4L2, and all the other non-video buf types also use
> the V4L2_ prefix, so perhaps that's good here as well?
>
> Whether AUDIO or PCM_STREAM makes more sense goes outside of my
> expertise. Subjectively, a PCM stream sounds more specific than an
> audio stream. Do those buf types also support non-PCM audio streams?

Currently I use it for PCM,  but I think it can also be used for non-PCM.
So use the below name?
V4L2_BUF_TYPE_AUDIO_CAPTURE
V4L2_BUF_TYPE_AUDIO_PLAYBACK

>
> > > +      - Buffer for audio output, see :ref:`audio`.
> > >
> > >
> > >  .. _buffer-flags:
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.=
rst b/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
> > > new file mode 100644
> > > index 000000000000..68faecfe3a02
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
> > > @@ -0,0 +1,71 @@
> > > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > > +
> > > +.. _audiomem2mem:
> > > +
> > > +********************************
> > > +Audio Memory-To-Memory Interface
> > > +********************************
> > > +
> > > +An audio memory-to-memory device can compress, decompress, transform=
, or
> > > +otherwise convert audio data from one format into another format, in=
 memory.
> > > +Such memory-to-memory devices set the ``V4L2_CAP_AUDIO_M2M`` capabil=
ity.
> > > +Examples of memory-to-memory devices are audio codecs, audio preproc=
essing,
> > > +audio postprocessing.
> > > +
> > > +A memory-to-memory audio node supports both output (sending audio fr=
ames from
> > > +memory to the hardware) and capture (receiving the processed audio f=
rames
> > > +from the hardware into memory) stream I/O. An application will have =
to
> > > +setup the stream I/O for both sides and finally call
> > > +:ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>` for both capture and output=
 to
> > > +start the hardware.
> > > +
> > > +Memory-to-memory devices function as a shared resource: you can
> > > +open the audio node multiple times, each application setting up thei=
r
> > > +own properties that are local to the file handle, and each can use
> > > +it independently from the others. The driver will arbitrate access t=
o
> > > +the hardware and reprogram it whenever another file handler gets acc=
ess.
> > > +
> > > +Audio memory-to-memory devices are accessed through character device
> > > +special files named ``/dev/v4l-audio``
> > > +
> > > +Querying Capabilities
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Device nodes supporting the audio memory-to-memory interface set the
> > > +``V4L2_CAP_AUDIO_M2M`` flag in the ``device_caps`` field of the
> > > +:c:type:`v4l2_capability` structure returned by the :c:func:`VIDIOC_=
QUERYCAP`
> > > +ioctl.
> > > +
> > > +Data Format Negotiation
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > +
> > > +The audio device uses the :ref:`format` ioctls to select the capture=
 format.
> > > +The audio buffer content format is bound to that selected format. In=
 addition
> > > +to the basic :ref:`format` ioctls, the :c:func:`VIDIOC_ENUM_FMT` ioc=
tl must be
> > > +supported as well.
> > > +
> > > +To use the :ref:`format` ioctls applications set the ``type`` field =
of the
> > > +:c:type:`v4l2_format` structure to ``V4L2_BUF_TYPE_AUDIO_CAPTURE`` o=
r to
> > > +``V4L2_BUF_TYPE_AUDIO_OUTPUT``. Both drivers and applications must s=
et the
> > > +remainder of the :c:type:`v4l2_format` structure to 0.
> > > +
> > > +.. c:type:: v4l2_audio_format
> > > +
> > > +.. tabularcolumns:: |p{1.4cm}|p{2.4cm}|p{13.5cm}|
> > > +
> > > +.. flat-table:: struct v4l2_audio_format
> > > +    :header-rows:  0
> > > +    :stub-columns: 0
> > > +    :widths:       1 1 2
> > > +
> > > +    * - __u32
> > > +      - ``pixelformat``
> > > +      - The sample format, set by the application. see :ref:`pixfmt-=
audio`
> >
> > pixelformat doesn't make any sense for audio: there are no pixels on a
> > PCM stream. Please use call it, instead: `snd_pcm_format`, making it ma=
tch
> > the values for snd_pcm_format_t.
> >
>
> +1
>
> FWIW v4l2_meta_format uses the name "dataformat".
>
> Actually, I just realized that the C code actually uses the name
> "audioformat". Tbh., after reading the kerneldoc comment, my
> subjective preference would be on "sample_format", since that's
> exactly what it is.
>
Ok, I will change it to sampleformat.

Best Regards
Shengjiu Wang

> > Yet, I would keep defining it as u32 (or u64?) instead of using a
> > typedef int field there (snd_pcm_format_t), as the size of integer
> > is different on 32 and 64 bit kernels.
>
> +1
>
> Best regards,
> Tomasz
