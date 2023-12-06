Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F16806C28
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 11:37:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6F2E850;
	Wed,  6 Dec 2023 11:37:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6F2E850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701859044;
	bh=429S8cawIRg7cuR7wk5PrXRtrq4k6zJlDdgwHP5UlSs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LgrzEMmmbSX0VzHTS4AjzR1fPy5MoBp6GQXPRhGxgU6qpGRC3n2mVdV2MZZeAg38n
	 BwYThw8r5GD86/g8UBnDGeISWfHV9UQfBXvTS0ejUWLCM9At11zrEumheHBgRyTmCO
	 VYOMMBlKRZyEg8zym7fvtex8oTNvaJt2u9heEe7w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B099DF800F5; Wed,  6 Dec 2023 11:36:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2B9AF80571;
	Wed,  6 Dec 2023 11:36:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB099F8024E; Wed,  6 Dec 2023 11:36:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FE78F800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 11:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FE78F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M+UcJ6jq
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-58d4968c362so4223078eaf.0
        for <alsa-devel@alsa-project.org>;
 Wed, 06 Dec 2023 02:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701858987; x=1702463787;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSHguhdYXTBvbS9uaUvEUspYNKYDJXD8tRJJNaYtm/4=;
        b=M+UcJ6jqzvqEYKoMhBfeuG7uZALN5+hHvhrBM5plDmkU1Oh7gvePJxYACTsLkhJEGE
         TDLUXprhPpg/8vjnzzj+jiNj58v9cHQZrMWDq1CnkapF+UNdXipbhtKq8jPvCT4V211g
         2V5uaafJSlyy3uKWYVWxLMVTYBoNLxtnOS2ESDMK2Op3U+F7jBZYdfIX9aM/JKMKGNvN
         nwLWC4chtxQP97/qjYSurrY7PfMdLPtFgYlTdr1U2is2QPtjjNs4ad/K2TsfregK9dv1
         wBN0xtormbYlMgPQkNm9narJe2uyNfpPEyndOO5Pp8x9hC3O97w9KqloWyDAbOCJfxAw
         0PWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701858987; x=1702463787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSHguhdYXTBvbS9uaUvEUspYNKYDJXD8tRJJNaYtm/4=;
        b=nDC8dJEgKu3rbNi3C3qFwSUOwqIcDMRRTN7cpnTZwRYC0JFFJ1YFQ6NrZ17iLcbRzv
         VgD9Sp/Df9D96Aobgf9c9DmTWqyZ9///SuNqeD2beDB5zQaR1pWpndRnkNNZYWgNa7Z6
         xLfO5gLFiDmE31vN915Ct3R/LiwlHxxUl/kNSJfv5Ivjivd/w4fCKRHnPwfZurVsXiRo
         Wcszt9GFPFs8MT7SqU8pPax6YY49PHNEtZziVS7gZkpuVHTPjbnYXXYqTTkmvY0AQjye
         M29hc/kR+oZzryPkaBiqOIGJbBrAGOkGk1TsndJJiA0+owLVOy512KynwFOfEA0L/L2e
         yOpA==
X-Gm-Message-State: AOJu0Yyd/GWjO1qdRjWTEVeCba/kkiXvtC/Or5ym8ttWZmymcOMD2cjg
	S2UMZBD3ifiZHfd3rHXDBUickPYFtQIz/TtHl4E=
X-Google-Smtp-Source: 
 AGHT+IEOZ+MLiRmb/S6EqV/xSpTjmcXgIZjhtYgimuOsEADFi9rhPAoRfej2QsU8ydHLGgNRSK30svnwV1AzhgNSH5s=
X-Received: by 2002:a05:6358:3399:b0:16e:29a9:f5af with SMTP id
 i25-20020a056358339900b0016e29a9f5afmr960782rwd.27.1701858986997; Wed, 06 Dec
 2023 02:36:26 -0800 (PST)
MIME-Version: 1.0
References: <1700637838-6743-1-git-send-email-shengjiu.wang@nxp.com>
 <a318e512-393c-477d-b1db-72c75855b962@xs4all.nl>
In-Reply-To: <a318e512-393c-477d-b1db-72c75855b962@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 6 Dec 2023 18:36:15 +0800
Message-ID: 
 <CAA+D8APy4aUDgPBM0+BVmUWtHvP5g75vSMZTTzxTUASjBhY_AA@mail.gmail.com>
Subject: Re: [PATCH v11 00/15] Add audio support in v4l2 framework
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
Message-ID-Hash: B5GRNAF3TTDPK4FROA42RFMFV4R5KTHI
X-Message-ID-Hash: B5GRNAF3TTDPK4FROA42RFMFV4R5KTHI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B5GRNAF3TTDPK4FROA42RFMFV4R5KTHI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Dec 6, 2023 at 4:09=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
>
> Hi Shengjiu,
>
> On 22/11/2023 08:23, Shengjiu Wang wrote:
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
>
> I just wanted to let you know that this will have to be postponed until v=
6.8.
> I need more time to work on the v4l-utils changes, esp. for the fraction =
bits
> feature, and realistically that is not going to happen before my Christma=
s
> vacation starts.

No problem. Have a good vacation!
Thanks.

Best Regards
Shengjiu Wang
>
> Apologies for the delay.
>
>
> Regards,
>
>         Hans
>
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
> >  .../media/v4l/ext-ctrls-audio-m2m.rst         |   41 +
> >  .../userspace-api/media/v4l/pixfmt-audio.rst  |   87 ++
> >  .../userspace-api/media/v4l/pixfmt.rst        |    1 +
> >  .../media/v4l/vidioc-enum-fmt.rst             |    2 +
> >  .../media/v4l/vidioc-g-ext-ctrls.rst          |    4 +
> >  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |    4 +
> >  .../media/v4l/vidioc-querycap.rst             |    3 +
> >  .../media/videodev2.h.rst.exceptions          |    3 +
> >  .../media/common/videobuf2/videobuf2-v4l2.c   |    4 +
> >  drivers/media/platform/nxp/Kconfig            |   13 +
> >  drivers/media/platform/nxp/Makefile           |    1 +
> >  drivers/media/platform/nxp/imx-asrc.c         | 1264 +++++++++++++++++
> >  drivers/media/test-drivers/Kconfig            |   11 +
> >  drivers/media/test-drivers/Makefile           |    1 +
> >  drivers/media/test-drivers/vim2m-audio.c      |  799 +++++++++++
> >  drivers/media/test-drivers/vivid/vivid-core.h |    2 +
> >  .../media/test-drivers/vivid/vivid-ctrls.c    |   26 +
> >  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |    9 +
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   10 +
> >  drivers/media/v4l2-core/v4l2-dev.c            |   21 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   66 +
> >  drivers/media/v4l2-core/v4l2-mem2mem.c        |   13 +-
> >  include/media/v4l2-ctrls.h                    |    3 +
> >  include/media/v4l2-dev.h                      |    2 +
> >  include/media/v4l2-ioctl.h                    |   34 +
> >  .../fsl =3D> include/sound}/fsl_asrc_common.h   |   60 +
> >  include/uapi/linux/media.h                    |    2 +
> >  include/uapi/linux/v4l2-controls.h            |    9 +
> >  include/uapi/linux/videodev2.h                |   41 +
> >  sound/soc/fsl/fsl_asrc.c                      |  144 ++
> >  sound/soc/fsl/fsl_asrc.h                      |    4 +-
> >  sound/soc/fsl/fsl_asrc_dma.c                  |    2 +-
> >  sound/soc/fsl/fsl_easrc.c                     |  233 +++
> >  sound/soc/fsl/fsl_easrc.h                     |    6 +-
> >  39 files changed, 3008 insertions(+), 7 deletions(-)
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
