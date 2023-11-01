Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5DD7DE01E
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Nov 2023 12:07:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1966209;
	Wed,  1 Nov 2023 12:06:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1966209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698836845;
	bh=smB0Ngs7w0McXUanYYpB8OFe26jUX4SC7cUnuGbM5OM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PPInyKG3ZxmIvwVneQZ/1VsCP3mbwJ2aD8yY+7e2QKruiGC/g/OH0Jl8A7XzdyTrd
	 pEHf+DFdHeHiXeJt7VhCf74geDDsWQr2PXeN/TxRhI7eM+cAcEBn1luKsdVGopagUa
	 bPIjbwItxb0VoenTRoQbH1pDg2rNhBHfOnwqdeXk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85BD9F80290; Wed,  1 Nov 2023 12:06:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB70BF8016D;
	Wed,  1 Nov 2023 12:06:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 514FBF8020D; Wed,  1 Nov 2023 12:06:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B81D5F80152
	for <alsa-devel@alsa-project.org>; Wed,  1 Nov 2023 12:06:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B81D5F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LrcfkAL5
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-28010522882so4136508a91.0
        for <alsa-devel@alsa-project.org>;
 Wed, 01 Nov 2023 04:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698836768; x=1699441568;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dArM6zmYx3FOnkvGIUE8xI49PNFQdgtFB0ocOl6ka7Y=;
        b=LrcfkAL5fbpRwH88t3S0ZBS47zuJaUzTGipz46js2TT/2fttcUxiXX9h5dea9vUBWk
         h1OarKClsqjBhm24NnQW3OdjNLg6sdXxG6Db4slOMdLHlfGTZg3FsGwBTtkxBDYEEFNz
         h9e1W/gGdpyxR8M4QLkqB7nkkNR2YMYUYySbb5sQTCzzwOdQkV/OOBBGN0il5iaNEpKg
         NRZ0o/l5sI/wEXUZqlY91E+LtEc1FakfgHe9B5xWG97mPTb2Vgu4WTQcgPndzWh5kZmb
         ZC6rSlqIFiE5b+kHdjMHbelkx6VRw7zkNVpzLw5zZfuuOcUapr8AHQYQ0ilH1cwpforF
         6oTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698836768; x=1699441568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dArM6zmYx3FOnkvGIUE8xI49PNFQdgtFB0ocOl6ka7Y=;
        b=fpar4dXC6N6iXh+xamFPUVx8UECOg+uPM38+wXtI2nH2M9KZGC9qxl9WUGkGQ7HI0j
         uJcflu6EwEPn9By2w9ayyGcw/CEXtsafw5Gqk7yT7rvmWdJZubByBmPCd/3SvNkRutNw
         44wtUSFPHD6JnOulxLxcXvGqdBRZy2kpYwZYXRQ5nP6RDrhxYHGXLWLqK8GoqDts4Q6X
         bYjpl6/smVCRDZfaa//Rfs9gOy243rxcmvfG9JMxEqPF1eV6ocFPlkp08nv/E3vPB2CB
         1j4vrjfpoWQSWFFW2G2o/v9nURyU6v/0h35crnsETcPmGh0HjHyrgZrsYrmvhymx9fIF
         1jJQ==
X-Gm-Message-State: AOJu0YzQtWyo6wYl9+KsvlfuUBDyZmyz0ypdtzs7l+HFQbTqM0Dg9sbX
	vDTYRqiQxbBNFOepvnNTU7FN2VA4Q0EDZg8v/Ro=
X-Google-Smtp-Source: 
 AGHT+IFa4/88Y8aoZg93TUyc6RlxW2Rv1MZsuL3fqtLE2emZD4ASH4FWrbqSA5szVDQReIiLDE0r8zE7vFwfkGAJK+4=
X-Received: by 2002:a17:90a:134c:b0:280:35ce:5e0f with SMTP id
 y12-20020a17090a134c00b0028035ce5e0fmr7734215pjf.11.1698836767703; Wed, 01
 Nov 2023 04:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <1698402948-10618-1-git-send-email-shengjiu.wang@nxp.com>
 <c1cfa3e0-6e5d-4e1d-b6e0-4d1045196a11@xs4all.nl>
 <CAA+D8AOCujL-eD2-chqHAW7UN7UmLrO6CWRd7d6wTCPP8=VyfA@mail.gmail.com>
In-Reply-To: 
 <CAA+D8AOCujL-eD2-chqHAW7UN7UmLrO6CWRd7d6wTCPP8=VyfA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 1 Nov 2023 19:05:56 +0800
Message-ID: 
 <CAA+D8AOHk1pqoESetVerywkJMPX8A57m5kMXTk5GVETstE6fCg@mail.gmail.com>
Subject: Re: [RFC PATCH v8 00/13] Add audio support in v4l2 framework
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: Z6DW32I4HZRNPPNZKZCDUR5GCHLD3CSE
X-Message-ID-Hash: Z6DW32I4HZRNPPNZKZCDUR5GCHLD3CSE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z6DW32I4HZRNPPNZKZCDUR5GCHLD3CSE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 30, 2023 at 9:56=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gmail.=
com> wrote:
>
> On Fri, Oct 27, 2023 at 7:18=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl>=
 wrote:
> >
> > Hi Shengjiu,
> >
> > Is there a reason why this series is still marked RFC?
> >
> > Just wondering about that.
>
> In the very beginning I started this series with RFC, So
> I still use RFC now...
>

Should I resend patches which remove the 'RFC'?

Best regards
Wang shengjiu

> >
> > Regards,
> >
> >         Hans
> >
> > On 27/10/2023 12:35, Shengjiu Wang wrote:
> > > Audio signal processing also has the requirement for memory to
> > > memory similar as Video.
> > >
> > > This asrc memory to memory (memory ->asrc->memory) case is a non
> > > real time use case.
> > >
> > > User fills the input buffer to the asrc module, after conversion, the=
n asrc
> > > sends back the output buffer to user. So it is not a traditional ALSA=
 playback
> > > and capture case.
> > >
> > > It is a specific use case,  there is no reference in current kernel.
> > > v4l2 memory to memory is the closed implementation,  v4l2 current
> > > support video, image, radio, tuner, touch devices, so it is not
> > > complicated to add support for this specific audio case.
> > >
> > > Because we had implemented the "memory -> asrc ->i2s device-> codec"
> > > use case in ALSA.  Now the "memory->asrc->memory" needs
> > > to reuse the code in asrc driver, so the first 3 patches is for refin=
ing
> > > the code to make it can be shared by the "memory->asrc->memory"
> > > driver.
> > >
> > > The main change is in the v4l2 side, A /dev/vl4-audioX will be create=
d,
> > > user applications only use the ioctl of v4l2 framework.
> > >
> > > Other change is to add memory to memory support for two kinds of i.MX=
 ASRC
> > > module.
> > >
> > > changes in v8:
> > > - refine V4L2_CAP_AUDIO_M2M to be 0x00000008
> > > - update doc for FIXED_POINT
> > > - address comments for imx-asrc
> > >
> > > changes in v7:
> > > - add acked-by from Mark
> > > - separate commit for fixed point, m2m audio class, audio rate contro=
ls
> > > - use INTEGER_MENU for rate,  FIXED_POINT for rate offset
> > > - remove used fmts
> > > - address other comments for Hans
> > >
> > > changes in v6:
> > > - use m2m_prepare/m2m_unprepare/m2m_start/m2m_stop to replace
> > >   m2m_start_part_one/m2m_stop_part_one, m2m_start_part_two/m2m_stop_p=
art_two.
> > > - change V4L2_CTRL_TYPE_ASRC_RATE to V4L2_CTRL_TYPE_FIXED_POINT
> > > - fix warning by kernel test rebot
> > > - remove some unused format V4L2_AUDIO_FMT_XX
> > > - Get SNDRV_PCM_FORMAT from V4L2_AUDIO_FMT in driver.
> > > - rename audm2m to viaudm2m.
> > >
> > > changes in v5:
> > > - remove V4L2_AUDIO_FMT_LPCM
> > > - define audio pixel format like V4L2_AUDIO_FMT_S8...
> > > - remove rate and format in struct v4l2_audio_format.
> > > - Add V4L2_CID_ASRC_SOURCE_RATE and V4L2_CID_ASRC_DEST_RATE controls
> > > - updata document accordingly.
> > >
> > > changes in v4:
> > > - update document style
> > > - separate V4L2_AUDIO_FMT_LPCM and V4L2_CAP_AUDIO_M2M in separate com=
mit
> > >
> > > changes in v3:
> > > - Modify documents for adding audio m2m support
> > > - Add audio virtual m2m driver
> > > - Defined V4L2_AUDIO_FMT_LPCM format type for audio.
> > > - Defined V4L2_CAP_AUDIO_M2M capability type for audio m2m case.
> > > - with modification in v4l-utils, pass v4l2-compliance test.
> > >
> > > changes in v2:
> > > - decouple the implementation in v4l2 and ALSA
> > > - implement the memory to memory driver as a platfrom driver
> > >   and move it to driver/media
> > > - move fsl_asrc_common.h to include/sound folder
> > >
> > > Shengjiu Wang (13):
> > >   ASoC: fsl_asrc: define functions for memory to memory usage
> > >   ASoC: fsl_easrc: define functions for memory to memory usage
> > >   ASoC: fsl_asrc: move fsl_asrc_common.h to include/sound
> > >   ASoC: fsl_asrc: register m2m platform device
> > >   ASoC: fsl_easrc: register m2m platform device
> > >   media: uapi: Add V4L2_CAP_AUDIO_M2M capability flag
> > >   media: v4l2: Add audio capture and output support
> > >   media: uapi: Define audio sample format fourcc type
> > >   media: uapi: Add V4L2_CTRL_CLASS_M2M_AUDIO
> > >   media: uapi: Add V4L2_CTRL_TYPE_FIXED_POINT
> > >   media: uapi: Add audio rate controls support
> > >   media: imx-asrc: Add memory to memory driver
> > >   media: vim2m_audio: add virtual driver for audio memory to memory
> > >
> > >  .../userspace-api/media/v4l/buffer.rst        |    6 +
> > >  .../userspace-api/media/v4l/common.rst        |    1 +
> > >  .../media/v4l/dev-audio-mem2mem.rst           |   71 +
> > >  .../userspace-api/media/v4l/devices.rst       |    1 +
> > >  .../media/v4l/ext-ctrls-audio-m2m.rst         |   41 +
> > >  .../userspace-api/media/v4l/pixfmt-audio.rst  |   87 ++
> > >  .../userspace-api/media/v4l/pixfmt.rst        |    1 +
> > >  .../media/v4l/vidioc-enum-fmt.rst             |    2 +
> > >  .../media/v4l/vidioc-g-ext-ctrls.rst          |   17 +-
> > >  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |    4 +
> > >  .../media/v4l/vidioc-querycap.rst             |    3 +
> > >  .../media/v4l/vidioc-queryctrl.rst            |    9 +-
> > >  .../media/videodev2.h.rst.exceptions          |    4 +
> > >  .../media/common/videobuf2/videobuf2-v4l2.c   |    4 +
> > >  drivers/media/platform/nxp/Kconfig            |   12 +
> > >  drivers/media/platform/nxp/Makefile           |    1 +
> > >  drivers/media/platform/nxp/imx-asrc.c         | 1186 +++++++++++++++=
++
> > >  drivers/media/test-drivers/Kconfig            |    9 +
> > >  drivers/media/test-drivers/Makefile           |    1 +
> > >  drivers/media/test-drivers/vim2m_audio.c      |  680 ++++++++++
> > >  drivers/media/v4l2-core/v4l2-ctrls-api.c      |    5 +-
> > >  drivers/media/v4l2-core/v4l2-ctrls-core.c     |    2 +
> > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   16 +
> > >  drivers/media/v4l2-core/v4l2-dev.c            |   17 +
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          |   66 +
> > >  include/media/v4l2-dev.h                      |    2 +
> > >  include/media/v4l2-ioctl.h                    |   34 +
> > >  .../fsl =3D> include/sound}/fsl_asrc_common.h   |   60 +
> > >  include/uapi/linux/v4l2-controls.h            |    9 +
> > >  include/uapi/linux/videodev2.h                |   42 +
> > >  sound/soc/fsl/fsl_asrc.c                      |  144 ++
> > >  sound/soc/fsl/fsl_asrc.h                      |    4 +-
> > >  sound/soc/fsl/fsl_asrc_dma.c                  |    2 +-
> > >  sound/soc/fsl/fsl_easrc.c                     |  233 ++++
> > >  sound/soc/fsl/fsl_easrc.h                     |    6 +-
> > >  35 files changed, 2771 insertions(+), 11 deletions(-)
> > >  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-m=
em2mem.rst
> > >  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-a=
udio-m2m.rst
> > >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audi=
o.rst
> > >  create mode 100644 drivers/media/platform/nxp/imx-asrc.c
> > >  create mode 100644 drivers/media/test-drivers/vim2m_audio.c
> > >  rename {sound/soc/fsl =3D> include/sound}/fsl_asrc_common.h (60%)
> > >
> >
