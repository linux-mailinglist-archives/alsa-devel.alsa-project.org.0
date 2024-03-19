Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B505E87F568
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Mar 2024 03:26:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3595022AE;
	Tue, 19 Mar 2024 03:25:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3595022AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710815162;
	bh=FC6+/aI7BBUs6BF1uhfaUOKbhxkDFustrqUVR7+Fhf8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pce3b0Ais1yj22jGrT8soJQqOKEJ+scvq0zUKDTYFLxcUR2UZO5Tt8K1trNXqZqTz
	 n3darSE5HdJwIgbdwwtLeJbfgH4gVoG/e52rgPJC6KovFAFi7CV4limYiFfWP1LkAz
	 Z4jKOvc36/1Mkwf3A4p/UBevRWAtR1J7Ar6OJ+ZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2651BF805A8; Tue, 19 Mar 2024 03:25:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50B8FF805AD;
	Tue, 19 Mar 2024 03:25:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5E95F804E7; Tue, 19 Mar 2024 03:25:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0B8BF80088
	for <alsa-devel@alsa-project.org>; Tue, 19 Mar 2024 03:25:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0B8BF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NiwL0z26
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7cc77e74b5cso64526239f.2
        for <alsa-devel@alsa-project.org>;
 Mon, 18 Mar 2024 19:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710815101; x=1711419901;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jXxbFRn7aUJ8vbwC+W7tuBl2ook1tIt1JLVdpl6uzA=;
        b=NiwL0z26TSH05NTDXBPqXjyDJ7E/78rZoeaQtFRuPLfTHeJJLMRj74lqMvVw1t7oMP
         4ZFojfCrsxrAoQJz0w3V6ztUaWuYzuFPUmgYkY9qAXF6LW/YLqtdxNl+xmpdievN6AIi
         khQmn45oe8dWFhsL9w52u+4y2PAjavIoa3vQqSXnF6c/8N3eZawLkVoozDnVWD0Uzq9E
         UKDn89mozYqcbiYyie4eokfK4L9g+KGYM5CbIBta9RvzY/J2oJFi6wDQhwiXgYakXH+r
         xuory2AcJx0bg5V9/uyExudwub25YO/t5VnV6uxm5g+ZxrwDLh9oXjqSrkJoxaP4gYOc
         xXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710815101; x=1711419901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jXxbFRn7aUJ8vbwC+W7tuBl2ook1tIt1JLVdpl6uzA=;
        b=WLLbS+pw9GBBqx3WNFoKAMa1qqFmpirMXmhI6puJD31/104dyNSEdHZ4+FO+l6EUzT
         T/cgl9yFlmCuuogUBdRZnjwwMAU1x8yXtuNsfABsQbPzVsI9b/MhvMk8pK6NaGjNiOkV
         GGUeze4T8/uafKrcmFiqChz23JhzPpH5ntz+r0TWzwu2g2svYxc9EwYwCCm+wiGVHQFR
         LfqsDR3qGqZPuJ3PWUNOUPXogOybhgkCd3tuEnJWwEDG0oSzcPF3XWKYItIalHYK9S9u
         S3TmBY8owUFlTPiMcfhiqOB4Q1D+fDFS0sROviBSslTaJ3sRmKSXr+nzZ+TktKn0OhjC
         VLqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6qG+vc12z5TqnMnGAX3B6c5UapLSbnZL7HnsB/wnlF0VPNXPEFjzLBHBC9NGFeZ5JV+Va7iOgvlmli7Mc/SIrgqbBsgE3Vodtczo=
X-Gm-Message-State: AOJu0YwAisJK3goFoB8mMf0pCnopKJPS4D7Y4y42+QIj409dvY6w5SuF
	l6W7u07LCBftQeTOkfTnE/ryMp1XcMBFUdgcE6k02/uefxQaSZR7Lva96dbFz9cT/dF6I77/nnx
	APE6RHf1LpQsBGGxV1MyVUvmXRaY=
X-Google-Smtp-Source: 
 AGHT+IGnWR3B9g/WoAwOtaoEM89k4iilEqv+3OCoq6B4OwhrLulsTXLE02G/egyZDtycYkHZLV95uXfPr1KhQx7ol+4=
X-Received: by 2002:a05:6e02:1142:b0:366:a289:2fc6 with SMTP id
 o2-20020a056e02114200b00366a2892fc6mr10994035ill.7.1710815100818; Mon, 18 Mar
 2024 19:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <1710150841-26991-1-git-send-email-shengjiu.wang@nxp.com>
 <399da377-c2b6-4226-9108-8a1e776b6f3b@xs4all.nl>
In-Reply-To: <399da377-c2b6-4226-9108-8a1e776b6f3b@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 19 Mar 2024 10:24:49 +0800
Message-ID: 
 <CAA+D8APgFvATshUJCNxCynJsYr_6=A+V=xf5qFpimd4i4g1ygg@mail.gmail.com>
Subject: Re: [PATCH v14 00/16] Add audio support in v4l2 framework
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
Message-ID-Hash: 6VERM4RI3G6DBB7AYNH3GMS4BTPPBMJZ
X-Message-ID-Hash: 6VERM4RI3G6DBB7AYNH3GMS4BTPPBMJZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6VERM4RI3G6DBB7AYNH3GMS4BTPPBMJZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Mar 18, 2024 at 11:56=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> =
wrote:
>
> Hi Shengjiu,
>
> I was about to prepare a pull request for this when I realized that
> entries for the new drivers need to be added to the MAINTAINERS file.
>
> Can you post patches 'v14 17/16' and 'v14/18/16' adding entries for each
> new driver?

Ok,  How about the change below?

VIRTUAL MEM2MEM DRIVER FOR AUDIO
M:      Hans Verkuil <hverkuil@xs4all.nl>
M:      Shengjiu Wang <shengjiu.wang@gmail.com>
L:      linux-media@vger.kernel.org
S:      Maintained
W:      https://linuxtv.org
T:      git git://linuxtv.org/media_tree.git
F:      drivers/media/test-drivers/vim2m-audio.c

NXP ASRC V4L2 MEM2MEM DRIVERS
M:      Shengjiu Wang <shengjiu.wang@gmail.com>
L:      linux-media@vger.kernel.org
S:      Maintained
W:      https://linuxtv.org
T:      git git://linuxtv.org/media_tree.git
F:      drivers/media/platform/nxp/imx-asrc.c

best regards
wang shengjiu

>
> Thank you,
>
>         Hans
>
> On 11/03/2024 10:53 am, Shengjiu Wang wrote:
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
> > changes in v14:
> > - document the reservation of 'AUXX' fourcc format.
> > - add v4l2_audfmt_to_fourcc() definition.
> >
> > changes in v13
> > - change 'pixelformat' to 'audioformat' in dev-audio-mem2mem.rst
> > - add more description for clock drift in ext-ctrls-audio-m2m.rst
> > - Add "media: v4l2-ctrls: add support for fraction_bits" from Hans
> >   to avoid build issue for kernel test robot
> >
> > changes in v12
> > - minor changes according to comments
> > - drop min_buffers_needed =3D 1 and V4L2_CTRL_FLAG_UPDATE flag
> > - drop bus_info
> >
> > changes in v11
> > - add add-fixed-point-test-controls in vivid.
> > - add v4l2_ctrl_fp_compose() helper function for min and max
> >
> > changes in v10
> > - remove FIXED_POINT type
> > - change code base on media: v4l2-ctrls: add support for fraction_bits
> > - fix issue reported by kernel test robot
> > - remove module_alias
> >
> > changes in v9:
> > - add MEDIA_ENT_F_PROC_AUDIO_RESAMPLER.
> > - add MEDIA_INTF_T_V4L_AUDIO
> > - add media controller support
> > - refine the vim2m-audio to support 8k<->16k conversion.
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
> > Hans Verkuil (1):
> >   media: v4l2-ctrls: add support for fraction_bits
> >
> > Shengjiu Wang (15):
> >   ASoC: fsl_asrc: define functions for memory to memory usage
> >   ASoC: fsl_easrc: define functions for memory to memory usage
> >   ASoC: fsl_asrc: move fsl_asrc_common.h to include/sound
> >   ASoC: fsl_asrc: register m2m platform device
> >   ASoC: fsl_easrc: register m2m platform device
> >   media: uapi: Add V4L2_CAP_AUDIO_M2M capability flag
> >   media: v4l2: Add audio capture and output support
> >   media: uapi: Define audio sample format fourcc type
> >   media: uapi: Add V4L2_CTRL_CLASS_M2M_AUDIO
> >   media: uapi: Add audio rate controls support
> >   media: uapi: Declare interface types for Audio
> >   media: uapi: Add an entity type for audio resampler
> >   media: vivid: add fixed point test controls
> >   media: imx-asrc: Add memory to memory driver
> >   media: vim2m-audio: add virtual driver for audio memory to memory
> >
> >  .../media/mediactl/media-types.rst            |   11 +
> >  .../userspace-api/media/v4l/buffer.rst        |    6 +
> >  .../userspace-api/media/v4l/common.rst        |    1 +
> >  .../media/v4l/dev-audio-mem2mem.rst           |   71 +
> >  .../userspace-api/media/v4l/devices.rst       |    1 +
> >  .../media/v4l/ext-ctrls-audio-m2m.rst         |   59 +
> >  .../userspace-api/media/v4l/pixfmt-audio.rst  |  100 ++
> >  .../userspace-api/media/v4l/pixfmt.rst        |    1 +
> >  .../media/v4l/vidioc-enum-fmt.rst             |    2 +
> >  .../media/v4l/vidioc-g-ext-ctrls.rst          |    4 +
> >  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |    4 +
> >  .../media/v4l/vidioc-querycap.rst             |    3 +
> >  .../media/v4l/vidioc-queryctrl.rst            |   11 +-
> >  .../media/videodev2.h.rst.exceptions          |    3 +
> >  .../media/common/videobuf2/videobuf2-v4l2.c   |    4 +
> >  drivers/media/platform/nxp/Kconfig            |   13 +
> >  drivers/media/platform/nxp/Makefile           |    1 +
> >  drivers/media/platform/nxp/imx-asrc.c         | 1256 +++++++++++++++++
> >  drivers/media/test-drivers/Kconfig            |   10 +
> >  drivers/media/test-drivers/Makefile           |    1 +
> >  drivers/media/test-drivers/vim2m-audio.c      |  793 +++++++++++
> >  drivers/media/test-drivers/vivid/vivid-core.h |    2 +
> >  .../media/test-drivers/vivid/vivid-ctrls.c    |   26 +
> >  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |    9 +
> >  drivers/media/v4l2-core/v4l2-ctrls-api.c      |    1 +
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c     |   93 +-
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   10 +
> >  drivers/media/v4l2-core/v4l2-dev.c            |   21 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   66 +
> >  drivers/media/v4l2-core/v4l2-mem2mem.c        |   13 +-
> >  include/media/v4l2-ctrls.h                    |   13 +-
> >  include/media/v4l2-dev.h                      |    2 +
> >  include/media/v4l2-ioctl.h                    |   34 +
> >  .../fsl =3D> include/sound}/fsl_asrc_common.h   |   60 +
> >  include/uapi/linux/media.h                    |    2 +
> >  include/uapi/linux/v4l2-controls.h            |    9 +
> >  include/uapi/linux/videodev2.h                |   50 +-
> >  sound/soc/fsl/fsl_asrc.c                      |  144 ++
> >  sound/soc/fsl/fsl_asrc.h                      |    4 +-
> >  sound/soc/fsl/fsl_asrc_dma.c                  |    2 +-
> >  sound/soc/fsl/fsl_easrc.c                     |  233 +++
> >  sound/soc/fsl/fsl_easrc.h                     |    6 +-
> >  42 files changed, 3128 insertions(+), 27 deletions(-)
> >  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem=
2mem.rst
> >  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-aud=
io-m2m.rst
> >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.=
rst
> >  create mode 100644 drivers/media/platform/nxp/imx-asrc.c
> >  create mode 100644 drivers/media/test-drivers/vim2m-audio.c
> >  rename {sound/soc/fsl =3D> include/sound}/fsl_asrc_common.h (60%)
> >
>
