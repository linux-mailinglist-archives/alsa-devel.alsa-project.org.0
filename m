Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A31B985CF58
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 05:39:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F1D5836;
	Wed, 21 Feb 2024 05:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F1D5836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708490395;
	bh=bWzhYtox2bpUREEb2FwOBY7Yv6HvM9YvDi85zi8WYRE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JPWP83T+Yex87WPvtZ5DdqlfHe+5uRMhXjBYo8B2gtPX35WHT9K7LD7UAZWZZVEu/
	 CfV7s4cEvAN0Ene+FG7EazsNgBvnwAqtNLzKZ66KTurKa7syEG/ij1oWT1WGiemya7
	 snb4tbyZ0BrTME/ZJeCS2QGhm8cnTxFK53DQ+kxw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4A2DF805A9; Wed, 21 Feb 2024 05:39:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B29AF8057A;
	Wed, 21 Feb 2024 05:39:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7527BF8047D; Wed, 21 Feb 2024 05:38:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C55D6F80496
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 05:37:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C55D6F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=mKu/M2U6
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-512cca90f38so1230784e87.2
        for <alsa-devel@alsa-project.org>;
 Tue, 20 Feb 2024 20:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708490275; x=1709095075;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTLF+9/86+3ZrNqwWCAt6rY4IvAqp7zzJB3AKM6ztK4=;
        b=mKu/M2U69bp1gvYVyRqgkAoc17E1GwH80raT1btJ2qMf1Zu7U8nd3xRqWEkU3wLTnI
         /RXPNU7rkP/NZQg1iWBLyjpi0bVGplorhACCY5pbtwYCTSH7TKlsD3Dxca6/KUHhk0en
         ePqP7Q+6MCIGOKNzW93bZRpUxsnMV64Ir2Gd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708490275; x=1709095075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTLF+9/86+3ZrNqwWCAt6rY4IvAqp7zzJB3AKM6ztK4=;
        b=MhBe0Lqogm+sybgiBuyNqvpuBNgTgkqFBiHMwWI2rxcOEDmfe24yLgboiCUxRPb0J+
         R/ANg7Dzowty+3r12ysqpMHWV3kJBvPUqx9eW3vXaMBlUXGmDdvkKUle0b0+RaZZqYdb
         DeS1EJZkH1zdlELsWAaO+zK7LEqVqoJCzZgc/qwRtkSXMePp3av+KNG5W7fWJF31GFFV
         BHbQw1hD1VuyMoOl0pwNEWF44IKJCKT4GqWhXcye+3/5aGa70SOj1bLwpt+6UG0wAnBW
         ETtcPtiZPCgf11VedpQulyRwk5FmKz0G2byBI52utnU1oesQ5IWbAZd/mIwfwbPTobmG
         lfzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlfb71WhTpLSD/LIxrLSWi+Wyns7KHescyRLTWEoNpDydrRtVtDT1QwvU526NYJoNiRNNsJYd8lDj9eneyi5UHw6ygA9XSbEGStsM=
X-Gm-Message-State: AOJu0YxBGAgmx8UhOXvYcfry5lhr0czsc6RO1Ba4VWRUxWVZDrjt8b5c
	IKLaeTGPMAP7tgKppT4yiWCRMHkyTwM5ZlG6qlfJhKTCFRf5uC+/jNC1jjhbTGu//h18X71guKo
	QdmIR
X-Google-Smtp-Source: 
 AGHT+IFDUhGeFO8V9S848334a1pD3ZHLF3YS51gaCGrfmZDt1utkfpBghVe+O4dA54qNxf4HwIH+vg==
X-Received: by 2002:a05:6512:12c7:b0:512:bc14:6b80 with SMTP id
 p7-20020a05651212c700b00512bc146b80mr4942956lfg.25.1708490274676;
        Tue, 20 Feb 2024 20:37:54 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id
 wr15-20020a170907700f00b00a3e8c3fc3ffsm2866214ejb.10.2024.02.20.20.37.54
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 20:37:54 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5643eccad0bso5190486a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 20 Feb 2024 20:37:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWFybVmRYvonpbgP7//O7RKDEaUmStyyOvvQfdjUjMtstk9Ntc6SLn0IlfIewkpiPyLkuu5inRZo9jw+LtSXmpZS+ylUkrbDqVP3PY=
X-Received: by 2002:adf:ef8f:0:b0:33d:2775:1e63 with SMTP id
 d15-20020adfef8f000000b0033d27751e63mr9141684wro.41.1708489847044; Tue, 20
 Feb 2024 20:30:47 -0800 (PST)
MIME-Version: 1.0
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
 <1705581128-4604-8-git-send-email-shengjiu.wang@nxp.com>
 <20240217104212.32f07e3a@coco.lan>
In-Reply-To: <20240217104212.32f07e3a@coco.lan>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 21 Feb 2024 13:30:29 +0900
X-Gmail-Original-Message-ID: 
 <CAAFQd5CY731HRhFHpmwzGxAZ-BFV_pT7NNGwNGy4ZOA=qz8ntg@mail.gmail.com>
Message-ID: 
 <CAAFQd5CY731HRhFHpmwzGxAZ-BFV_pT7NNGwNGy4ZOA=qz8ntg@mail.gmail.com>
Subject: Re: [PATCH v12 07/15] media: v4l2: Add audio capture and output
 support
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
 sakari.ailus@iki.fi,
	m.szyprowski@samsung.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
	festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KO73UI6WMTUW272OQGGJ4ZWZI5ZD2NXT
X-Message-ID-Hash: KO73UI6WMTUW272OQGGJ4ZWZI5ZD2NXT
X-MailFrom: tfiga@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KO73UI6WMTUW272OQGGJ4ZWZI5ZD2NXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Feb 17, 2024 at 6:42=E2=80=AFPM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> Em Thu, 18 Jan 2024 20:32:00 +0800
> Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:
>
> > Audio signal processing has the requirement for memory to
> > memory similar as Video.
> >
> > This patch is to add this support in v4l2 framework, defined
> > new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> > V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> > for audio case usage.
> >
> > The created audio device is named "/dev/v4l-audioX".
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../userspace-api/media/v4l/buffer.rst        |  6 ++
> >  .../media/v4l/dev-audio-mem2mem.rst           | 71 +++++++++++++++++++
> >  .../userspace-api/media/v4l/devices.rst       |  1 +
> >  .../media/v4l/vidioc-enum-fmt.rst             |  2 +
> >  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |  4 ++
> >  .../media/videodev2.h.rst.exceptions          |  2 +
> >  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
> >  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  9 +++
> >  drivers/media/v4l2-core/v4l2-dev.c            | 17 +++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          | 53 ++++++++++++++
> >  include/media/v4l2-dev.h                      |  2 +
> >  include/media/v4l2-ioctl.h                    | 34 +++++++++
> >  include/uapi/linux/videodev2.h                | 17 +++++
> >  13 files changed, 222 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem=
2mem.rst
> >
> > diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documen=
tation/userspace-api/media/v4l/buffer.rst
> > index 52bbee81c080..a3754ca6f0d6 100644
> > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > @@ -438,6 +438,12 @@ enum v4l2_buf_type
> >      * - ``V4L2_BUF_TYPE_META_OUTPUT``
> >        - 14
>
> >        - Buffer for metadata output, see :ref:`metadata`.
> > +    * - ``V4L2_BUF_TYPE_AUDIO_CAPTURE``
> > +      - 15
> > +      - Buffer for audio capture, see :ref:`audio`.
> > +    * - ``V4L2_BUF_TYPE_AUDIO_OUTPUT``
> > +      - 16
>
> Hmm... alsa APi define input/output as:
>         enum {
>                 SNDRV_PCM_STREAM_PLAYBACK =3D 0,
>                 SNDRV_PCM_STREAM_CAPTURE,
>                 SNDRV_PCM_STREAM_LAST =3D SNDRV_PCM_STREAM_CAPTURE,
>         };
>
>
> I would use a namespace as close as possible to the
> ALSA API. Also, we're not talking about V4L2, but, instead
> audio. so, not sure if I like the prefix to start with
> V4L2_. Maybe ALSA_?
>
> So, a better namespace would be:
>
>         ${prefix}_BUF_TYPE_PCM_STREAM_PLAYBACK
> and
>         ${prefix}_BUF_TYPE_PCM_STREAM_CAPTURE
>

The API is still V4L2, and all the other non-video buf types also use
the V4L2_ prefix, so perhaps that's good here as well?

Whether AUDIO or PCM_STREAM makes more sense goes outside of my
expertise. Subjectively, a PCM stream sounds more specific than an
audio stream. Do those buf types also support non-PCM audio streams?

> > +      - Buffer for audio output, see :ref:`audio`.
> >
> >
> >  .. _buffer-flags:
> > diff --git a/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rs=
t b/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
> > new file mode 100644
> > index 000000000000..68faecfe3a02
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
> > @@ -0,0 +1,71 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _audiomem2mem:
> > +
> > +********************************
> > +Audio Memory-To-Memory Interface
> > +********************************
> > +
> > +An audio memory-to-memory device can compress, decompress, transform, =
or
> > +otherwise convert audio data from one format into another format, in m=
emory.
> > +Such memory-to-memory devices set the ``V4L2_CAP_AUDIO_M2M`` capabilit=
y.
> > +Examples of memory-to-memory devices are audio codecs, audio preproces=
sing,
> > +audio postprocessing.
> > +
> > +A memory-to-memory audio node supports both output (sending audio fram=
es from
> > +memory to the hardware) and capture (receiving the processed audio fra=
mes
> > +from the hardware into memory) stream I/O. An application will have to
> > +setup the stream I/O for both sides and finally call
> > +:ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>` for both capture and output t=
o
> > +start the hardware.
> > +
> > +Memory-to-memory devices function as a shared resource: you can
> > +open the audio node multiple times, each application setting up their
> > +own properties that are local to the file handle, and each can use
> > +it independently from the others. The driver will arbitrate access to
> > +the hardware and reprogram it whenever another file handler gets acces=
s.
> > +
> > +Audio memory-to-memory devices are accessed through character device
> > +special files named ``/dev/v4l-audio``
> > +
> > +Querying Capabilities
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Device nodes supporting the audio memory-to-memory interface set the
> > +``V4L2_CAP_AUDIO_M2M`` flag in the ``device_caps`` field of the
> > +:c:type:`v4l2_capability` structure returned by the :c:func:`VIDIOC_QU=
ERYCAP`
> > +ioctl.
> > +
> > +Data Format Negotiation
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The audio device uses the :ref:`format` ioctls to select the capture f=
ormat.
> > +The audio buffer content format is bound to that selected format. In a=
ddition
> > +to the basic :ref:`format` ioctls, the :c:func:`VIDIOC_ENUM_FMT` ioctl=
 must be
> > +supported as well.
> > +
> > +To use the :ref:`format` ioctls applications set the ``type`` field of=
 the
> > +:c:type:`v4l2_format` structure to ``V4L2_BUF_TYPE_AUDIO_CAPTURE`` or =
to
> > +``V4L2_BUF_TYPE_AUDIO_OUTPUT``. Both drivers and applications must set=
 the
> > +remainder of the :c:type:`v4l2_format` structure to 0.
> > +
> > +.. c:type:: v4l2_audio_format
> > +
> > +.. tabularcolumns:: |p{1.4cm}|p{2.4cm}|p{13.5cm}|
> > +
> > +.. flat-table:: struct v4l2_audio_format
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 1 2
> > +
> > +    * - __u32
> > +      - ``pixelformat``
> > +      - The sample format, set by the application. see :ref:`pixfmt-au=
dio`
>
> pixelformat doesn't make any sense for audio: there are no pixels on a
> PCM stream. Please use call it, instead: `snd_pcm_format`, making it matc=
h
> the values for snd_pcm_format_t.
>

+1

FWIW v4l2_meta_format uses the name "dataformat".

Actually, I just realized that the C code actually uses the name
"audioformat". Tbh., after reading the kerneldoc comment, my
subjective preference would be on "sample_format", since that's
exactly what it is.

> Yet, I would keep defining it as u32 (or u64?) instead of using a
> typedef int field there (snd_pcm_format_t), as the size of integer
> is different on 32 and 64 bit kernels.

+1

Best regards,
Tomasz
