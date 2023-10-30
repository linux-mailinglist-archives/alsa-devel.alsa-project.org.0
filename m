Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D987DB1E2
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 02:57:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74F311E4;
	Mon, 30 Oct 2023 02:56:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74F311E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698631066;
	bh=k/R7e9J8BS2nE/IRwdoC5mRH9YUNbtrIBrUbCb1d5rc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ry2UgP0A6/2gnptvtdlImgsQeVtJGW4gn455BK2nhIxW4EmwVYi1J8rFWWOXb/kPd
	 JPay5vqGCY4/4WE+JhRthVx6rekRsF9MTSqJQ5916K8b2464X7r1XytPxkYmFWFQSE
	 4Y7ybmmjwxEb6BMm5jemhY2nx9jEgbOidNi6fouI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA55FF80558; Mon, 30 Oct 2023 02:56:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B34DF80166;
	Mon, 30 Oct 2023 02:56:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B792FF8016D; Mon, 30 Oct 2023 02:56:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC7D9F800FA
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 02:56:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC7D9F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UY4ohv7E
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-28023eadc70so916430a91.2
        for <alsa-devel@alsa-project.org>;
 Sun, 29 Oct 2023 18:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698630994; x=1699235794;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXRLwnyvcfy6jE/MUWoW/Yby9B0gy2TfIvcPthNvb0k=;
        b=UY4ohv7EpIixUCcUT5Z+6tpzMsD8dk/hi6GZqITy+E1SizYkoaDGw1lg4Qy+iXh2Q0
         KfI4fnvzTlKy9His1rj+17ZwQ/qjwVE8ll9kla/7rRqiGgXkz2s//1g4TzeDeoBlhTU6
         T3tmgZMf3Vj+GRvxcQenL43ltuXYyuBeq7AL+gwr/Vu2vNbC0F+F4GYXJJsCxr7XSvBJ
         xCjuvND1y70UaR0RJoOLegHZiSZwZGJlpDtYyDquvtQ8BISgsxNTqhwMZ/D3tynOrRUa
         zf7eCsmud5ly03dtHcm29DNAiNqMvw9xBuhP0nlxJ4ilNWgO8Ss2cKNtUkTo8F0ifz0i
         W5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698630994; x=1699235794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sXRLwnyvcfy6jE/MUWoW/Yby9B0gy2TfIvcPthNvb0k=;
        b=rDbDVY5YV4VSCiDBP+ZZX+kDVAtTZYp6JJVBKTVh0fqdZpJGxwrvUPM3bXoA6Y2WAO
         yuZbuzvDZ5sIY0Y5mRDMAlE71W1cz4uT2FO7nNNW/GQ2o/MWMHqQl05ifBgGum4JLVKF
         W8n3Gkh9EOy/bMU+HB0c251ua6Fpr2X2c6eebHO3QJhZNB1rXqcw/G16s+q4i8avKn4t
         NQT2fdn2xkqA3zn5ZkLcuYbCAeAdc9F9x1owPurI8gmWg2rz0FgMV12blozaQ9DOS2oJ
         gmEnGU8oOHjf1UPndTlbHkIGjw0k2WTI5Mz/lipjG0F9YlXAnQeFpA7KSOiFzrfvMltt
         zi/Q==
X-Gm-Message-State: AOJu0YyvuGF0lO4VCZ/BClvGVaYKNP8LWpEIH9Yca2DQ7nSGQPjl7qs6
	9JPBGxdM2rBFrkjC4Pdb8NSGFDsjxGtQ1gIFbI8=
X-Google-Smtp-Source: 
 AGHT+IGAB1+4aLMMfdrAGAJeVPLx3vXyPUzK5aU43XjGbCGprf4okqXxvQKJ4QuTuO9/Vq869iPZgyjlym6LTFzzngQ=
X-Received: by 2002:a17:90a:357:b0:27d:5964:4eec with SMTP id
 23-20020a17090a035700b0027d59644eecmr5885791pjf.1.1698630993867; Sun, 29 Oct
 2023 18:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <1698402948-10618-1-git-send-email-shengjiu.wang@nxp.com>
 <c1cfa3e0-6e5d-4e1d-b6e0-4d1045196a11@xs4all.nl>
In-Reply-To: <c1cfa3e0-6e5d-4e1d-b6e0-4d1045196a11@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 30 Oct 2023 09:56:22 +0800
Message-ID: 
 <CAA+D8AOCujL-eD2-chqHAW7UN7UmLrO6CWRd7d6wTCPP8=VyfA@mail.gmail.com>
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
Message-ID-Hash: D3KGZFAMA22AF4BCQ2BAAY2C26ZFNYK4
X-Message-ID-Hash: D3KGZFAMA22AF4BCQ2BAAY2C26ZFNYK4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D3KGZFAMA22AF4BCQ2BAAY2C26ZFNYK4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Oct 27, 2023 at 7:18=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> Hi Shengjiu,
>
> Is there a reason why this series is still marked RFC?
>
> Just wondering about that.

In the very beginning I started this series with RFC, So
I still use RFC now...

Best regards
Wang shengjiu
>
> Regards,
>
>         Hans
>
> On 27/10/2023 12:35, Shengjiu Wang wrote:
> > Audio signal processing also has the requirement for memory to
> > memory similar as Video.
> >
> > This asrc memory to memory (memory ->asrc->memory) case is a non
> > real time use case.
> >
> > User fills the input buffer to the asrc module, after conversion, then =
asrc
> > sends back the output buffer to user. So it is not a traditional ALSA p=
layback
> > and capture case.
> >
> > It is a specific use case,  there is no reference in current kernel.
> > v4l2 memory to memory is the closed implementation,  v4l2 current
> > support video, image, radio, tuner, touch devices, so it is not
> > complicated to add support for this specific audio case.
> >
> > Because we had implemented the "memory -> asrc ->i2s device-> codec"
> > use case in ALSA.  Now the "memory->asrc->memory" needs
> > to reuse the code in asrc driver, so the first 3 patches is for refinin=
g
> > the code to make it can be shared by the "memory->asrc->memory"
> > driver.
> >
> > The main change is in the v4l2 side, A /dev/vl4-audioX will be created,
> > user applications only use the ioctl of v4l2 framework.
> >
> > Other change is to add memory to memory support for two kinds of i.MX A=
SRC
> > module.
> >
> > changes in v8:
> > - refine V4L2_CAP_AUDIO_M2M to be 0x00000008
> > - update doc for FIXED_POINT
> > - address comments for imx-asrc
> >
> > changes in v7:
> > - add acked-by from Mark
> > - separate commit for fixed point, m2m audio class, audio rate controls
> > - use INTEGER_MENU for rate,  FIXED_POINT for rate offset
> > - remove used fmts
> > - address other comments for Hans
> >
> > changes in v6:
> > - use m2m_prepare/m2m_unprepare/m2m_start/m2m_stop to replace
> >   m2m_start_part_one/m2m_stop_part_one, m2m_start_part_two/m2m_stop_par=
t_two.
> > - change V4L2_CTRL_TYPE_ASRC_RATE to V4L2_CTRL_TYPE_FIXED_POINT
> > - fix warning by kernel test rebot
> > - remove some unused format V4L2_AUDIO_FMT_XX
> > - Get SNDRV_PCM_FORMAT from V4L2_AUDIO_FMT in driver.
> > - rename audm2m to viaudm2m.
> >
> > changes in v5:
> > - remove V4L2_AUDIO_FMT_LPCM
> > - define audio pixel format like V4L2_AUDIO_FMT_S8...
> > - remove rate and format in struct v4l2_audio_format.
> > - Add V4L2_CID_ASRC_SOURCE_RATE and V4L2_CID_ASRC_DEST_RATE controls
> > - updata document accordingly.
> >
> > changes in v4:
> > - update document style
> > - separate V4L2_AUDIO_FMT_LPCM and V4L2_CAP_AUDIO_M2M in separate commi=
t
> >
> > changes in v3:
> > - Modify documents for adding audio m2m support
> > - Add audio virtual m2m driver
> > - Defined V4L2_AUDIO_FMT_LPCM format type for audio.
> > - Defined V4L2_CAP_AUDIO_M2M capability type for audio m2m case.
> > - with modification in v4l-utils, pass v4l2-compliance test.
> >
> > changes in v2:
> > - decouple the implementation in v4l2 and ALSA
> > - implement the memory to memory driver as a platfrom driver
> >   and move it to driver/media
> > - move fsl_asrc_common.h to include/sound folder
> >
> > Shengjiu Wang (13):
> >   ASoC: fsl_asrc: define functions for memory to memory usage
> >   ASoC: fsl_easrc: define functions for memory to memory usage
> >   ASoC: fsl_asrc: move fsl_asrc_common.h to include/sound
> >   ASoC: fsl_asrc: register m2m platform device
> >   ASoC: fsl_easrc: register m2m platform device
> >   media: uapi: Add V4L2_CAP_AUDIO_M2M capability flag
> >   media: v4l2: Add audio capture and output support
> >   media: uapi: Define audio sample format fourcc type
> >   media: uapi: Add V4L2_CTRL_CLASS_M2M_AUDIO
> >   media: uapi: Add V4L2_CTRL_TYPE_FIXED_POINT
> >   media: uapi: Add audio rate controls support
> >   media: imx-asrc: Add memory to memory driver
> >   media: vim2m_audio: add virtual driver for audio memory to memory
> >
> >  .../userspace-api/media/v4l/buffer.rst        |    6 +
> >  .../userspace-api/media/v4l/common.rst        |    1 +
> >  .../media/v4l/dev-audio-mem2mem.rst           |   71 +
> >  .../userspace-api/media/v4l/devices.rst       |    1 +
> >  .../media/v4l/ext-ctrls-audio-m2m.rst         |   41 +
> >  .../userspace-api/media/v4l/pixfmt-audio.rst  |   87 ++
> >  .../userspace-api/media/v4l/pixfmt.rst        |    1 +
> >  .../media/v4l/vidioc-enum-fmt.rst             |    2 +
> >  .../media/v4l/vidioc-g-ext-ctrls.rst          |   17 +-
> >  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |    4 +
> >  .../media/v4l/vidioc-querycap.rst             |    3 +
> >  .../media/v4l/vidioc-queryctrl.rst            |    9 +-
> >  .../media/videodev2.h.rst.exceptions          |    4 +
> >  .../media/common/videobuf2/videobuf2-v4l2.c   |    4 +
> >  drivers/media/platform/nxp/Kconfig            |   12 +
> >  drivers/media/platform/nxp/Makefile           |    1 +
> >  drivers/media/platform/nxp/imx-asrc.c         | 1186 +++++++++++++++++
> >  drivers/media/test-drivers/Kconfig            |    9 +
> >  drivers/media/test-drivers/Makefile           |    1 +
> >  drivers/media/test-drivers/vim2m_audio.c      |  680 ++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-api.c      |    5 +-
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c     |    2 +
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   16 +
> >  drivers/media/v4l2-core/v4l2-dev.c            |   17 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   66 +
> >  include/media/v4l2-dev.h                      |    2 +
> >  include/media/v4l2-ioctl.h                    |   34 +
> >  .../fsl =3D> include/sound}/fsl_asrc_common.h   |   60 +
> >  include/uapi/linux/v4l2-controls.h            |    9 +
> >  include/uapi/linux/videodev2.h                |   42 +
> >  sound/soc/fsl/fsl_asrc.c                      |  144 ++
> >  sound/soc/fsl/fsl_asrc.h                      |    4 +-
> >  sound/soc/fsl/fsl_asrc_dma.c                  |    2 +-
> >  sound/soc/fsl/fsl_easrc.c                     |  233 ++++
> >  sound/soc/fsl/fsl_easrc.h                     |    6 +-
> >  35 files changed, 2771 insertions(+), 11 deletions(-)
> >  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem=
2mem.rst
> >  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-aud=
io-m2m.rst
> >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.=
rst
> >  create mode 100644 drivers/media/platform/nxp/imx-asrc.c
> >  create mode 100644 drivers/media/test-drivers/vim2m_audio.c
> >  rename {sound/soc/fsl =3D> include/sound}/fsl_asrc_common.h (60%)
> >
>
