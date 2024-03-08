Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F118765AF
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 14:54:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 725DD82B;
	Fri,  8 Mar 2024 14:54:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 725DD82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709906053;
	bh=/ZP9jA6vaRjOq1dSEUgFASgBmKrqhHag7fxdY45/I/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JF/CPdOOOngwmPUDgj0BKByjBKiyX3G/pzDhItHqmXYczsR0hoKHoX9ka305ciGya
	 70Vp+z0C1pOAim8dJxnpY/9OlJQ3eoRhB5pYQmr/N6M9a9r6cx7NxsY9k+nL5dKHnr
	 cJ8+ZVoXoxJoxs76GLEzdnvUpFxJrm77uWyc0e98=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3BCBF80589; Fri,  8 Mar 2024 14:53:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D52F6F8059F;
	Fri,  8 Mar 2024 14:53:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D256DF8024E; Fri,  8 Mar 2024 14:53:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAE79F80093
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 14:53:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAE79F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=miDMmh50
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3657c437835so1617175ab.2
        for <alsa-devel@alsa-project.org>;
 Fri, 08 Mar 2024 05:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709905991; x=1710510791;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=on6viS3E8aUEUEG+G9BNQW0L35UK1hOcnR15aTgtBok=;
        b=miDMmh50OfOnFnHulGpfe8nJN3nOjmkkOx4Any3TMvLUhY59hO78GYjkSi+asLPVE6
         H5rACcCl6Bgt9DBblvj5o7IkW0vb/pf8qWx1XueAhjnAsI8OywtTE9KSOiIHmJLUxleE
         Konz4f+nB/sjt0xEVty5l4NR3q/7XNI+Q2HEOnIYkmOolWn5SczjUCP6FdJsF9EuKCsK
         poZmWCJl95wrs0HnSIxPAsZLOMdNgDv6FumANoUkb0HIaAial1tdWTfUBZikeaeiJpHS
         yY3sNOQYO45m4Qgs26AEIIcpr8G62zI1TUCIwgYto19og3Bzx9tJ/Zc6a1WKz6w6wHX+
         G8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709905991; x=1710510791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=on6viS3E8aUEUEG+G9BNQW0L35UK1hOcnR15aTgtBok=;
        b=i0Nrw5jwXPd9+1FJkgaqHNElvx+YUVt0ZV9tM4iJ4M7xRhL8xwlWos3nKwDCQ00CBX
         QnK2MowjKF1Ts/szZM9EIMAQvPY7HxX6Hze4Q++4y0qF02RVwUzP41Njm5jvOmvPjRmf
         lA02CODMfL3+k6oCCBxcPEQXkrT4C/kUiuIQsyasCGPrffdXviUdM7CXit3fG1Ap6rCv
         qHBFP1L1ll/urArtO8pUmH5muspMwcKILBIFts2loQKUNdVg/MmvIRW/spGjNnisEBA1
         nZNkovcbAbYcMfVwnKGGIlvZYbRQ3Zxoc+1Bmhu+mz8eLIr5fAb20pYMWLNQUSYOaW8V
         5rPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1xLS58NLHhCKrakIriRIVk84She1Gasw7kP0FPOUrJ1hDBe5wC+OWUj7X1otHUlIEoLNSvbwnvcolUyA+D0ci2vZxCQUatzo75Bk=
X-Gm-Message-State: AOJu0Yw9NdrogVPCGSmLz+xxk0cUIxF8EssCbgDbiCasNm0OQdZtj3h2
	UNnUScYH39SrPcLDYfFQPzJhii2QyNGzstYqdV5Kcn2Fn/AXdMpxtUKz1zyFmG+M/QkjOuL/YnO
	OosX+6/7yKWpm4VUxchXh6fR+Cms=
X-Google-Smtp-Source: 
 AGHT+IG2q864TT4kQWIktboJpadP1dLOOpXUf0ZnJPgDxvDnNUbExksEWMT7qmXGCwvGsHhXqinfs6mXvRNWiRZcicM=
X-Received: by 2002:a05:6e02:20c3:b0:363:e3d1:2bc8 with SMTP id
 3-20020a056e0220c300b00363e3d12bc8mr23631457ilq.6.1709905990594; Fri, 08 Mar
 2024 05:53:10 -0800 (PST)
MIME-Version: 1.0
References: <1708936109-11587-1-git-send-email-shengjiu.wang@nxp.com>
 <1708936109-11587-10-git-send-email-shengjiu.wang@nxp.com>
 <df05261f-2f0e-490f-883b-72ad8a02d11b@xs4all.nl>
 <CAA+D8AMJOCfp6WdqYqy7KSj=mX9o_D5U-aF6Wn=3cOnhWg7VDg@mail.gmail.com>
 <56368a0d-6ada-4ab6-8389-b4bd20d6efc4@xs4all.nl>
In-Reply-To: <56368a0d-6ada-4ab6-8389-b4bd20d6efc4@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 8 Mar 2024 21:52:59 +0800
Message-ID: 
 <CAA+D8AOXKJP1r-+j0QiH82x3MQ+Y1y2c1h04n=jmJncPogn7Vg@mail.gmail.com>
Subject: Re: [PATCH v13 09/16] media: uapi: Define audio sample format fourcc
 type
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
Message-ID-Hash: 6D2LD2GV7Y2KQ4R36FHU2HPMGWKZ3OLR
X-Message-ID-Hash: 6D2LD2GV7Y2KQ4R36FHU2HPMGWKZ3OLR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6D2LD2GV7Y2KQ4R36FHU2HPMGWKZ3OLR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 8, 2024 at 8:06=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
>
> On 08/03/2024 12:52 pm, Shengjiu Wang wrote:
> > On Fri, Mar 8, 2024 at 3:34=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl=
> wrote:
> >>
> >> Hi Shengjiu,
> >>
> >> After thinking it over I think this patch can be improved:
> >>
> >> On 26/02/2024 9:28 am, Shengjiu Wang wrote:
> >>> The audio sample format definition is from alsa,
> >>> the header file is include/uapi/sound/asound.h, but
> >>> don't include this header file directly, because in
> >>> user space, there is another copy in alsa-lib.
> >>> There will be conflict in userspace for include
> >>> videodev2.h & asound.h and asoundlib.h
> >>>
> >>> Here still use the fourcc format.
> >>>
> >>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>> ---
> >>>  .../userspace-api/media/v4l/pixfmt-audio.rst  | 87 +++++++++++++++++=
++
> >>>  .../userspace-api/media/v4l/pixfmt.rst        |  1 +
> >>>  drivers/media/v4l2-core/v4l2-ioctl.c          | 13 +++
> >>>  include/uapi/linux/videodev2.h                | 23 +++++
> >>>  4 files changed, 124 insertions(+)
> >>>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audi=
o.rst
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-audio.rst b=
/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> >>> new file mode 100644
> >>> index 000000000000..04b4a7fbd8f4
> >>> --- /dev/null
> >>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> >>> @@ -0,0 +1,87 @@
> >>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> >>> +
> >>> +.. _pixfmt-audio:
> >>> +
> >>> +*************
> >>> +Audio Formats
> >>> +*************
> >>> +
> >>> +These formats are used for :ref:`audiomem2mem` interface only.
> >>
> >> Here you should also document that all these fourccs start with 'AU' a=
nd are
> >> reserved for mappings of the snd_pcm_format_t type.
> >>
> >> Also document the v4l2_fourcc_to_audfmt define and the v4l2_audfmt_to_=
fourcc
> >> define (see also below).
> >
> > How about below description?
> > '
> > All these fourccs starting with 'AU' are reserved for mappings
>
> All these fourccs -> All FourCCs
>
> > of the snd_pcm_format_t type.
> >
> > The v4l2_audfmt_to_fourcc() is defined to convert snd_pcm_format_t
>
> convert -> convert the
>
> > type to fourcc. The first character is 'A', the second character
>
> fourcc -> a FourCC
>
> > is 'U', the third character is ten's digit of snd_pcm_format_t,
> > the fourth character is unit's digit of snd_pcm_format_t.
>
> "is 'U', and the remaining two characters is the snd_pcm_format_t
> value in ASCII. Example: SNDRV_PCM_FORMAT_S16_LE (with value 2)
> maps to 'AU02' and SNDRV_PCM_FORMAT_S24_3LE (with value 32) maps
> to 'AU32'."
>
> >
> > The v4l2_fourcc_to_audfmt() is defined to convert these fourccs to
>
> fourccs -> FourCCs
>
> > snd_pcm_format_t type.
>
> BTW, given the way snd_pcm_format_t is defined I am fairly certain
> some casts are needed for the v4l2_audfmt_to_fourcc define.
>
> Regards,
>
>         Hans
>
> > '
> > Best regards
> > Shengjiu Wang
> >>
> >>> +
> >>> +.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{10.3cm}|
> >>> +
> >>> +.. cssclass:: longtable
> >>> +
> >>> +.. flat-table:: Audio Format
> >>> +    :header-rows:  1
> >>> +    :stub-columns: 0
> >>> +    :widths:       3 1 4
> >>> +
> >>> +    * - Identifier
> >>> +      - Code
> >>> +      - Details
> >>> +    * .. _V4L2-AUDIO-FMT-S8:
> >>> +
> >>> +      - ``V4L2_AUDIO_FMT_S8``
> >>> +      - 'S8'
> >>> +      - Corresponds to SNDRV_PCM_FORMAT_S8 in ALSA
> >>> +    * .. _V4L2-AUDIO-FMT-S16-LE:
> >>> +
> >>> +      - ``V4L2_AUDIO_FMT_S16_LE``
> >>> +      - 'S16_LE'
> >>> +      - Corresponds to SNDRV_PCM_FORMAT_S16_LE in ALSA
> >>> +    * .. _V4L2-AUDIO-FMT-U16-LE:
> >>> +
> >>> +      - ``V4L2_AUDIO_FMT_U16_LE``
> >>> +      - 'U16_LE'
> >>> +      - Corresponds to SNDRV_PCM_FORMAT_U16_LE in ALSA
> >>> +    * .. _V4L2-AUDIO-FMT-S24-LE:
> >>> +
> >>> +      - ``V4L2_AUDIO_FMT_S24_LE``
> >>> +      - 'S24_LE'
> >>> +      - Corresponds to SNDRV_PCM_FORMAT_S24_LE in ALSA
> >>> +    * .. _V4L2-AUDIO-FMT-U24-LE:
> >>> +
> >>> +      - ``V4L2_AUDIO_FMT_U24_LE``
> >>> +      - 'U24_LE'
> >>> +      - Corresponds to SNDRV_PCM_FORMAT_U24_LE in ALSA
> >>> +    * .. _V4L2-AUDIO-FMT-S32-LE:
> >>> +
> >>> +      - ``V4L2_AUDIO_FMT_S32_LE``
> >>> +      - 'S32_LE'
> >>> +      - Corresponds to SNDRV_PCM_FORMAT_S32_LE in ALSA
> >>> +    * .. _V4L2-AUDIO-FMT-U32-LE:
> >>> +
> >>> +      - ``V4L2_AUDIO_FMT_U32_LE``
> >>> +      - 'U32_LE'
> >>> +      - Corresponds to SNDRV_PCM_FORMAT_U32_LE in ALSA
> >>> +    * .. _V4L2-AUDIO-FMT-FLOAT-LE:
> >>> +
> >>> +      - ``V4L2_AUDIO_FMT_FLOAT_LE``
> >>> +      - 'FLOAT_LE'
> >>> +      - Corresponds to SNDRV_PCM_FORMAT_FLOAT_LE in ALSA
> >>> +    * .. _V4L2-AUDIO-FMT-IEC958-SUBFRAME-LE:
> >>> +
> >>> +      - ``V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE``
> >>> +      - 'IEC958_SUBFRAME_LE'
> >>> +      - Corresponds to SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE in ALSA
> >>> +    * .. _V4L2-AUDIO-FMT-S24-3LE:
> >>> +
> >>> +      - ``V4L2_AUDIO_FMT_S24_3LE``
> >>> +      - 'S24_3LE'
> >>> +      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
> >>> +    * .. _V4L2-AUDIO-FMT-U24-3LE:
> >>> +
> >>> +      - ``V4L2_AUDIO_FMT_U24_3LE``
> >>> +      - 'U24_3LE'
> >>> +      - Corresponds to SNDRV_PCM_FORMAT_U24_3LE in ALSA
> >>> +    * .. _V4L2-AUDIO-FMT-S20-3LE:
> >>> +
> >>> +      - ``V4L2_AUDIO_FMT_S20_3LE``
> >>> +      - 'S20_3LE'
> >>> +      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
> >>> +    * .. _V4L2-AUDIO-FMT-U20-3LE:
> >>> +
> >>> +      - ``V4L2_AUDIO_FMT_U20_3LE``
> >>> +      - 'U20_3LE'
> >>> +      - Corresponds to SNDRV_PCM_FORMAT_U20_3LE in ALSA
> >>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Docum=
entation/userspace-api/media/v4l/pixfmt.rst
> >>> index 11dab4a90630..2eb6fdd3b43d 100644
> >>> --- a/Documentation/userspace-api/media/v4l/pixfmt.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
> >>> @@ -36,3 +36,4 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
> >>>      colorspaces
> >>>      colorspaces-defs
> >>>      colorspaces-details
> >>> +    pixfmt-audio
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l=
2-core/v4l2-ioctl.c
> >>> index 961abcdf7290..be229c69e991 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> @@ -1471,6 +1471,19 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtde=
sc *fmt)
> >>>       case V4L2_PIX_FMT_Y210:         descr =3D "10-bit YUYV Packed";=
 break;
> >>>       case V4L2_PIX_FMT_Y212:         descr =3D "12-bit YUYV Packed";=
 break;
> >>>       case V4L2_PIX_FMT_Y216:         descr =3D "16-bit YUYV Packed";=
 break;
> >>> +     case V4L2_AUDIO_FMT_S8:         descr =3D "8-bit Signed"; break=
;
> >>> +     case V4L2_AUDIO_FMT_S16_LE:     descr =3D "16-bit Signed LE"; b=
reak;
> >>> +     case V4L2_AUDIO_FMT_U16_LE:             descr =3D "16-bit Unsig=
ned LE"; break;
> >>> +     case V4L2_AUDIO_FMT_S24_LE:             descr =3D "24(32)-bit S=
igned LE"; break;
> >>> +     case V4L2_AUDIO_FMT_U24_LE:             descr =3D "24(32)-bit U=
nsigned LE"; break;
> >>> +     case V4L2_AUDIO_FMT_S32_LE:             descr =3D "32-bit Signe=
d LE"; break;
> >>> +     case V4L2_AUDIO_FMT_U32_LE:             descr =3D "32-bit Unsig=
ned LE"; break;
> >>> +     case V4L2_AUDIO_FMT_FLOAT_LE:           descr =3D "32-bit Float=
 LE"; break;
> >>> +     case V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE: descr =3D "32-bit IEC95=
8 LE"; break;
> >>> +     case V4L2_AUDIO_FMT_S24_3LE:            descr =3D "24(24)-bit S=
igned LE"; break;
> >>> +     case V4L2_AUDIO_FMT_U24_3LE:            descr =3D "24(24)-bit U=
nsigned LE"; break;
> >>> +     case V4L2_AUDIO_FMT_S20_3LE:            descr =3D "20(24)-bit S=
igned LE"; break;
> >>> +     case V4L2_AUDIO_FMT_U20_3LE:            descr =3D "20(24)-bit U=
nsigned LE"; break;
> >>>
> >>>       default:
> >>>               /* Compressed formats */
> >>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vide=
odev2.h
> >>> index 2c03d2dfadbe..673a6235a029 100644
> >>> --- a/include/uapi/linux/videodev2.h
> >>> +++ b/include/uapi/linux/videodev2.h
> >>> @@ -843,6 +843,29 @@ struct v4l2_pix_format {
> >>>  #define V4L2_META_FMT_RK_ISP1_PARAMS v4l2_fourcc('R', 'K', '1', 'P')=
 /* Rockchip ISP1 3A Parameters */
> >>>  #define V4L2_META_FMT_RK_ISP1_STAT_3A        v4l2_fourcc('R', 'K', '=
1', 'S') /* Rockchip ISP1 3A Statistics */
> >>>
> >>> +/*
> >>> + * Audio-data formats
> >>> + * All these audio formats use a fourcc starting with 'AU'
> >>> + * followed by the SNDRV_PCM_FORMAT_ value from asound.h.
> >>
> >> Also document here that fourccs starting with 'AU' are reserved for
> >> the snd_pcm_format_t to fourcc mappings.
> >>
> >> That to avoid that someone adds a 'AUXX' fourcc later.
> >>
> >>> + */
> >>> +#define V4L2_AUDIO_FMT_S8                    v4l2_fourcc('A', 'U', '=
0', '0')
> >>> +#define V4L2_AUDIO_FMT_S16_LE                        v4l2_fourcc('A'=
, 'U', '0', '2')
> >>> +#define V4L2_AUDIO_FMT_U16_LE                        v4l2_fourcc('A'=
, 'U', '0', '4')
> >>> +#define V4L2_AUDIO_FMT_S24_LE                        v4l2_fourcc('A'=
, 'U', '0', '6')
> >>> +#define V4L2_AUDIO_FMT_U24_LE                        v4l2_fourcc('A'=
, 'U', '0', '8')
> >>> +#define V4L2_AUDIO_FMT_S32_LE                        v4l2_fourcc('A'=
, 'U', '1', '0')
> >>> +#define V4L2_AUDIO_FMT_U32_LE                        v4l2_fourcc('A'=
, 'U', '1', '2')
> >>> +#define V4L2_AUDIO_FMT_FLOAT_LE                      v4l2_fourcc('A'=
, 'U', '1', '4')
> >>> +#define V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE    v4l2_fourcc('A', 'U', '=
1', '8')
> >>> +#define V4L2_AUDIO_FMT_S24_3LE                       v4l2_fourcc('A'=
, 'U', '3', '2')
> >>> +#define V4L2_AUDIO_FMT_U24_3LE                       v4l2_fourcc('A'=
, 'U', '3', '4')
> >>> +#define V4L2_AUDIO_FMT_S20_3LE                       v4l2_fourcc('A'=
, 'U', '3', '6')
> >>> +#define V4L2_AUDIO_FMT_U20_3LE                       v4l2_fourcc('A'=
, 'U', '3', '8')
> >>> +
> >>> +#define v4l2_fourcc_to_audfmt(fourcc)        \
> >>> +     (__force snd_pcm_format_t)(((((fourcc) >> 16) & 0xff) - '0') * =
10  \
> >>> +                                + ((((fourcc) >> 24) & 0xff) - '0'))
> >>> +
> >>
> >> As I suggested in an earlier reply, add this:
> >>
> >> #define v4l2_audfmt_to_fourcc(audfmt) \
> >>         v4l2_fourcc('A', 'U', '0' + (audfmt) / 10, '0' + (audfmt) % 10=
)
> >>
> >> Even though it is not used in the drivers, since this is a public head=
er used
> >> by drivers and applications, it makes sense to provide the reverse map=
ping as well.
> >>
> >> Please test it in actual code to make sure there are no compilation wa=
rnings.

I test this definition, the compiler doesn't report warning.

best regards
Shengjiu Wang

> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>  /* priv field value to indicates that subsequent fields are valid. *=
/
> >>>  #define V4L2_PIX_FMT_PRIV_MAGIC              0xfeedcafe
> >>>
> >>
>
