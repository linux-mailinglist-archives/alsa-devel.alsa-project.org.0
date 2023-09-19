Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 816587A5FAF
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:33:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAB72DEB;
	Tue, 19 Sep 2023 12:33:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAB72DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695119635;
	bh=AQEygjwWobu9aADRjQd30Uw9Bg5AtfVlvwFFGEKqZ7Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=clTWVAjRIz5D9MptpOpKf+ss3EB9ZWyctZ+rS0ffJ9URzwMdfiAmGZhE2HE+6Q4U4
	 K2/MF5DsGrfkjrQEcafk5ICiyfDYUCRnaGlYVwbfeVS/Zn44sYiCa6KskASqeKZsAF
	 haoPiloUNfK+5dEg83wLopoYH/nGhEqsCsEZdI+0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A611F805BA; Tue, 19 Sep 2023 12:31:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9069F80552;
	Tue, 19 Sep 2023 12:31:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FC37F805B5; Tue, 19 Sep 2023 12:31:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27BE3F8055A
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27BE3F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cDlYlbqa
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-68fe2470d81so5065716b3a.1
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Sep 2023 03:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695119480; x=1695724280;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poXRhJkAK9WV5aSXIh3udSLaQthmauT46bnS65tSwgw=;
        b=cDlYlbqaXURZUY+Uc+wKEmoI0RfYkW6GP39QdkYjPUi7bt0nzIza3XxGKFI/YN8O4f
         Pg8+VDeXeSWmauxgLHd7aRbJFSlxSiBlKmWYxdR7cA/Y8PeGWPWkYofQ2RyHKawzZpg5
         qsGx3svnIMUdxCzz6z2h4WauAM1DAYCDmGO4qqjtyBK/8j4cjXYh+JFSLyLN4sUekU/Z
         Ep5Qpi//s3PFE3ORp3RJ4er9yWv16i3Kw15drsxgxADIjccCjDpELKg7GfyBFF2WON88
         KZdGWbN7oNuNFuKjPH27YavNrgYRT9r0uszbWDcZzUqNJosiSxxzh4N+3Jg+YxXibfoB
         KGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695119480; x=1695724280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=poXRhJkAK9WV5aSXIh3udSLaQthmauT46bnS65tSwgw=;
        b=Dtl3u4cvB8b6FAfOi8ceGFbqJHZAWqb4EVhe7GVTESAq7UTTbwLAAygXKW4MeqY5zL
         sBj+SXksqrVMOflPHHqcWpFb9EuqNEijR+vgVzWRnaM2jMF2fX43fMHZ49GJkxk+/L2d
         Z6G2XPe7QnHB+T7Xoqd35aBSFR76PcmLOqgNKp21CMCYsM2hj1YnxCEl0dRvBpMInyOW
         ppTrabOPr23JxFzaYS+7+bDAkdeJUCbnD/lyJACP5NvjRxxaNxdu9rj+1xUYRUk9MpfP
         53/hQeGhTCJ/MRX2n+xfsrXqto/96Nfp6bGlM795VJt0YgXngeXIYDi2E5DWtJJs460H
         DnsA==
X-Gm-Message-State: AOJu0YxAG0IwCJsPr4t4n2OXx6tdCSwzI8NN4Wv3BHHZMi9fHJIFSswJ
	xqevsSUUf/xjGPAiIKHNfBEUMefBKcy7+uZJSvY=
X-Google-Smtp-Source: 
 AGHT+IF2IrXOt2RYELwf5x84VPabpFw4QGMztiaMU7bExwDdHhtZrXyi6RfYOP2G3QKtRk4KmBIA4VwK+hfHlEDEo9c=
X-Received: by 2002:a05:6a00:1516:b0:68f:c6f8:1451 with SMTP id
 q22-20020a056a00151600b0068fc6f81451mr14271558pfu.16.1695119480225; Tue, 19
 Sep 2023 03:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <1694670845-17070-1-git-send-email-shengjiu.wang@nxp.com>
 <1694670845-17070-7-git-send-email-shengjiu.wang@nxp.com>
 <ZQLdxMaqFYUukt4J@valkosipuli.retiisi.eu>
In-Reply-To: <ZQLdxMaqFYUukt4J@valkosipuli.retiisi.eu>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 19 Sep 2023 18:31:09 +0800
Message-ID: 
 <CAA+D8AMB1zxSs_RgeoeUKxzWsNuEb0xANUZ0KxLX9UsQR8D=9Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/9] media: v4l2: Add audio capture and output
 support
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
 tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: IANL5LU36QX47KBVRFVNWSKJ35H2CW7Q
X-Message-ID-Hash: IANL5LU36QX47KBVRFVNWSKJ35H2CW7Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IANL5LU36QX47KBVRFVNWSKJ35H2CW7Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 14, 2023 at 6:17=E2=80=AFPM Sakari Ailus <sakari.ailus@iki.fi> =
wrote:
>
> Hi Shenjiu,
>
> Thanks for the update.
>
> On Thu, Sep 14, 2023 at 01:54:02PM +0800, Shengjiu Wang wrote:
> > Audio signal processing has the requirement for memory to
> > memory similar as Video.
> >
> > This patch is to add this support in v4l2 framework, defined
> > new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> > V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> > for audio case usage.
> >
> > Defined V4L2_AUDIO_FMT_LPCM format type for audio.
>
> This would be nicer as a separate patch. Also see the related comments
> below.

OK,  will separate it.

>
> >
> > Defined V4L2_CAP_AUDIO_M2M capability type for audio memory
> > to memory case.
> >
> > The created audio device is named "/dev/v4l-audioX".
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../userspace-api/media/v4l/audio-formats.rst | 15 +++++
> >  .../userspace-api/media/v4l/buffer.rst        |  6 ++
> >  .../userspace-api/media/v4l/dev-audio.rst     | 63 +++++++++++++++++++
> >  .../userspace-api/media/v4l/devices.rst       |  1 +
> >  .../media/v4l/pixfmt-aud-lpcm.rst             | 31 +++++++++
> >  .../userspace-api/media/v4l/pixfmt.rst        |  1 +
> >  .../media/v4l/vidioc-enum-fmt.rst             |  2 +
> >  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |  4 ++
> >  .../media/v4l/vidioc-querycap.rst             |  3 +
> >  .../media/videodev2.h.rst.exceptions          |  2 +
> >  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
> >  drivers/media/v4l2-core/v4l2-dev.c            | 17 +++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          | 53 ++++++++++++++++
> >  include/media/v4l2-dev.h                      |  2 +
> >  include/media/v4l2-ioctl.h                    | 34 ++++++++++
> >  include/uapi/linux/videodev2.h                | 25 ++++++++
> >  16 files changed, 263 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/audio-formats=
.rst
> >  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio.rst
> >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-aud-lp=
cm.rst
> >
> > diff --git a/Documentation/userspace-api/media/v4l/audio-formats.rst b/=
Documentation/userspace-api/media/v4l/audio-formats.rst
> > new file mode 100644
> > index 000000000000..bc52712d20d3
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/audio-formats.rst
> > @@ -0,0 +1,15 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _audio-formats:
> > +
> > +*************
> > +Audio Formats
> > +*************
> > +
> > +These formats are used for :ref:`audio` interface only.
> > +
> > +
> > +.. toctree::
> > +    :maxdepth: 1
> > +
> > +    pixfmt-aud-lpcm
> > diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documen=
tation/userspace-api/media/v4l/buffer.rst
> > index 04dec3e570ed..80cf2cb20dfe 100644
> > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > @@ -438,6 +438,12 @@ enum v4l2_buf_type
> >      * - ``V4L2_BUF_TYPE_META_OUTPUT``
> >        - 14
> >        - Buffer for metadata output, see :ref:`metadata`.
> > +    * - ``V4L2_BUF_TYPE_AUDIO_CAPTURE``
> > +      - 15
> > +      - Buffer for audio capture, see :ref:`audio`.
> > +    * - ``V4L2_BUF_TYPE_AUDIO_OUTPUT``
> > +      - 16
> > +      - Buffer for audio output, see :ref:`audio`.
> >
> >
> >  .. _buffer-flags:
> > diff --git a/Documentation/userspace-api/media/v4l/dev-audio.rst b/Docu=
mentation/userspace-api/media/v4l/dev-audio.rst
> > new file mode 100644
> > index 000000000000..f9bcf0c7b056
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/dev-audio.rst
> > @@ -0,0 +1,63 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _audiodev:
> > +
> > +******************
> > +audio Interface
>
> Capital "A"?

OK,  will modify it.

>
> > +******************
>
> Too many asterisks (same a few lines above, too).

ok, will update it.

>
> > +
> > +The audio interface is implemented on audio device nodes. The audio de=
vice
> > +which uses application software for modulation or demodulation. This
> > +interface is intended for controlling and data streaming of such devic=
es
> > +
> > +Audio devices are accessed through character device special files name=
d
> > +``/dev/v4l-audio``
> > +
> > +Querying Capabilities
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Device nodes supporting the audio capture and output interface set the
> > +``V4L2_CAP_AUDIO_M2M`` flag in the ``device_caps`` field of the
> > +:c:type:`v4l2_capability` structure returned by the :c:func:`VIDIOC_QU=
ERYCAP`
> > +ioctl.
> > +
> > +At least one of the read/write or streaming I/O methods must be suppor=
ted.
> > +
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
> > +      - ``rate``
> > +      - The sample rate, set by the application. The range is [5512, 7=
68000].
> > +    * - __u32
> > +      - ``format``
> > +      - The sample format, set by the application. format is defined a=
s
> > +        SNDRV_PCM_FORMAT_S8, SNDRV_PCM_FORMAT_U8, ...,
> > +    * - __u32
> > +      - ``channels``
> > +      - The channel number, set by the application. channel number ran=
ge is
> > +        [1, 32].
> > +    * - __u32
> > +      - ``buffersize``
> > +      - Maximum buffer size in bytes required for data. The value is s=
et by the
> > +        driver.
> > diff --git a/Documentation/userspace-api/media/v4l/devices.rst b/Docume=
ntation/userspace-api/media/v4l/devices.rst
> > index 8bfbad65a9d4..8261f3468489 100644
> > --- a/Documentation/userspace-api/media/v4l/devices.rst
> > +++ b/Documentation/userspace-api/media/v4l/devices.rst
> > @@ -24,3 +24,4 @@ Interfaces
> >      dev-event
> >      dev-subdev
> >      dev-meta
> > +    dev-audio
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst
> > new file mode 100644
> > index 000000000000..f9ebe2a05f69
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst
> > @@ -0,0 +1,31 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _v4l2-aud-fmt-lpcm:
> > +
> > +*************************
> > +V4L2_AUDIO_FMT_LPCM ('LPCM')
> > +*************************
> > +
> > +Linear Pulse-Code Modulation (LPCM)
> > +
> > +
> > +Description
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +This describes audio format used by the audio memory to memory driver.
> > +
> > +It contains the following fields:
> > +
> > +.. flat-table::
> > +    :widths: 1 4
> > +    :header-rows:  1
> > +    :stub-columns: 0
> > +
> > +    * - Field
> > +      - Description
> > +    * - u32 samplerate;
> > +      - which is the number of times per second that samples are taken=
.
> > +    * - u32 sampleformat;
> > +      - which determines the number of possible digital values that ca=
n be used to represent each sample
>
> 80 characters (or less) per line, please.

Ok, will change it.

>
> Which values could this field have and what do they signify?

The values are SNDRV_PCM_FORMAT_S8, SNDRV_PCM_FORMAT_U8...
which are the PCM format, defined in ALSA.

>
> > +    * - u32 channels;
> > +      - channel number for each sample.
>
> I suppose the rest of the buffer would be samples? This should be
> documented. I think there are also different ways the data could be
> arrangeed and this needs to be documented, too.

All data in the buffer are the samples,  the 'samplerate', 'sampleformat'
'channels'  I list here is try to describe the samples.
I was confused how to write this document, so I list the characters.

Best regards
Wang Shengjiu
