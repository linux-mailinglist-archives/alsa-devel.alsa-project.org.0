Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8F98687DB
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 04:45:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7158EB71;
	Tue, 27 Feb 2024 04:45:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7158EB71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709005515;
	bh=lIbmhOiQaUClrvOu6WT/oBvlAm6sh1yj/e8dT0C6lHk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sypcmodI1l0fJwTD/zwWq8zgR9psq/IrfR4jwdnuYH6JZ51OVwLrHEmKnWCHi5do2
	 KJuHAc4j3Tu9gP+TLrtWfhRZ8185Ad+zi/khgbgPE8c6ode7V8Z64f3pwsVvjjXrjw
	 OlbLTgRIl+etJBqleF2iIobx9ZxBlfqdWmTtCmmM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FF95F805A8; Tue, 27 Feb 2024 04:44:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05B3FF8057E;
	Tue, 27 Feb 2024 04:44:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 413C8F801C0; Tue, 27 Feb 2024 04:44:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81579F800F0
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 04:44:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81579F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NL7cUWb7
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7c7701f95b6so90816139f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 26 Feb 2024 19:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709005453; x=1709610253;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0m1IEz/3wkY8c34XuQVjwcaeuH7mfm7kh/jPGQpBjU=;
        b=NL7cUWb7IAYPIBYXF0Zepa/aeTxEcr4Cc36fBAcGFt1PwEZEAGc9EIugF8kGhSNqbH
         aL+wmzNbsFqWZnlIEYIk4m7HY0JEXRn1oZcwihjiQdmeUyp3LN5KoAoh1rK7Z9mXi1lU
         Fmqx5avtHwjNmAaAvbnpVNNpcAZlwG7NLFk1T4SeMbKN6bLwrJOxg9AbsDReywOXhdV2
         s0RrR/2CKoV4sDdBHAR8OgRZQZASywq5RuKvkp/8zMQupJnjGPvepq0/rZNbNmXq3qDq
         x74g35HjSqh9DWE7Tt39DGGG7K+3fLvvBrrNS8LmwqrXJY/DR9nWsGeKQ8aafcckEFP7
         z95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709005453; x=1709610253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0m1IEz/3wkY8c34XuQVjwcaeuH7mfm7kh/jPGQpBjU=;
        b=AMExsE8JHR7jxnzUOjgvKVhSK2RfisLaWLqiBY9TF8So4oo9iU9JHegZL/U7ccWwuy
         d5uWd7T7OYfCBO6SUR0YA3tCGzpjTObnAvixDenzeqhPgWmzTc+0Uq7L6bVcY3gE3y0J
         vylzBwQcokANsOx182ZpwGoTkhDm/VroPnW4dfvwY1lBAbLvRTLolydjDxcpn3TH4ajW
         yaMZB72WajGm2BQ5rWrPMU4aSkE2nEWadKDa72YHjaFMqfJPaCYxuIBacxZXT8DouJhU
         sYFjipMBG3TIAoUx2QStdsQNRla7KDyl9d7gvu3gCk+KzW2/XFFXtEOsCJ6tPCqOGoCp
         /4DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb3mDIWfcGJoWLRMPneuPjjHk4P15oXPeNiPtB1a2f0LMiHR6STgxkR+1hS9SelB9hr2C78ASK3zeGhlITk4tOGzOArcYL5cTUVzo=
X-Gm-Message-State: AOJu0YwLVtHhQlV6Qa0NCQPNuslOd5mxIw9z9pRPGEaJkJTr69Uv2Z+D
	zFwiFxvyKv1JVib8FPesEKasLzWARoAhpsVoNw9ZaP+84d8EHwib4DkqvycmFQYtrN9XppBZhos
	Ly2BwKs8nbL9s8vDel3hjPQs6wzo=
X-Google-Smtp-Source: 
 AGHT+IEcZHNy22KpBlVhUYmj1+eNLatGGwFDoA7ukQLkIRnAm/YaKRZduIECheyzjsRmSfzYRSLtXm0bSZIeozgX+Ds=
X-Received: by 2002:a92:1e03:0:b0:365:1edf:8e2a with SMTP id
 e3-20020a921e03000000b003651edf8e2amr6768951ile.14.1709005452937; Mon, 26 Feb
 2024 19:44:12 -0800 (PST)
MIME-Version: 1.0
References: <1708936109-11587-1-git-send-email-shengjiu.wang@nxp.com>
 <1708936109-11587-10-git-send-email-shengjiu.wang@nxp.com>
 <71c860869caf899a72ebc547608220074c5939b1.camel@ndufresne.ca>
In-Reply-To: <71c860869caf899a72ebc547608220074c5939b1.camel@ndufresne.ca>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 27 Feb 2024 11:44:02 +0800
Message-ID: 
 <CAA+D8AMEMr_PSsfuSByxd0Sxv1zXJoQjEkJEWEpk59kmLGOD1Q@mail.gmail.com>
Subject: Re: [PATCH v13 09/16] media: uapi: Define audio sample format fourcc
 type
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
 sakari.ailus@iki.fi,
	tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HGXLK5UD5NS6HYITULF4WGRLUDMI2XXS
X-Message-ID-Hash: HGXLK5UD5NS6HYITULF4WGRLUDMI2XXS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HGXLK5UD5NS6HYITULF4WGRLUDMI2XXS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Feb 26, 2024 at 9:55=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Le lundi 26 f=C3=A9vrier 2024 =C3=A0 16:28 +0800, Shengjiu Wang a =C3=A9c=
rit :
> > The audio sample format definition is from alsa,
> > the header file is include/uapi/sound/asound.h, but
> > don't include this header file directly, because in
> > user space, there is another copy in alsa-lib.
> > There will be conflict in userspace for include
> > videodev2.h & asound.h and asoundlib.h
> >
> > Here still use the fourcc format.
>
> I'd like to join Mauro's voice that duplicating the audio formats is a ba=
d idea.
> We have the same issues with video formats when you look at V4L2 vs DRM. =
You're
> rationale is that videodev2.h will be ambiguous if it includes asound.h, =
but
> looking at this change, there is no reason why you need to include asound=
.h in
> videodev2.h at all. The format type can be abstracted out with a uint32 i=
n the
> API, and then it would be up to the users to include and use the appropri=
ate
> formats IDs.
>

Resend for the plain text issue

Thanks.

There is another reason mentioned by Hans:

"
The problem is that within V4L2 we use fourcc consistently to describe a
format, including in VIDIOC_ENUM_FMT. And the expectation is that the fourc=
c
can be printed to a human readable string (there is even a printk format fo=
r
that these days).

But the pcm values are all small integers (and can even be 0!), and
printing the fourcc will give garbage. It doesn't work well at all
with the V4L2 API. But by having a straightforward conversion between the
pcm identifier and a fourcc it was really easy to deal with this.

There might even be applications today that call VIDIOC_ENUM_FMT to see
what is supported and fail if it is not a proper fourcc is returned.

It will certainly report nonsense in v4l_print_fmtdesc() (v4l2-ioctl.c).

One of the early versions of this patch series did precisely what you reque=
st,
but it just doesn't work well within the V4L2 uAPI.
"

Best regards
Shengjiu Wang
> Nicolas
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../userspace-api/media/v4l/pixfmt-audio.rst  | 87 +++++++++++++++++++
> >  .../userspace-api/media/v4l/pixfmt.rst        |  1 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          | 13 +++
> >  include/uapi/linux/videodev2.h                | 23 +++++
> >  4 files changed, 124 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.=
rst
> >
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-audio.rst b/D=
ocumentation/userspace-api/media/v4l/pixfmt-audio.rst
> > new file mode 100644
> > index 000000000000..04b4a7fbd8f4
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> > @@ -0,0 +1,87 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _pixfmt-audio:
> > +
> > +*************
> > +Audio Formats
> > +*************
> > +
> > +These formats are used for :ref:`audiomem2mem` interface only.
> > +
> > +.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{10.3cm}|
> > +
> > +.. cssclass:: longtable
> > +
> > +.. flat-table:: Audio Format
> > +    :header-rows:  1
> > +    :stub-columns: 0
> > +    :widths:       3 1 4
> > +
> > +    * - Identifier
> > +      - Code
> > +      - Details
> > +    * .. _V4L2-AUDIO-FMT-S8:
> > +
> > +      - ``V4L2_AUDIO_FMT_S8``
> > +      - 'S8'
> > +      - Corresponds to SNDRV_PCM_FORMAT_S8 in ALSA
> > +    * .. _V4L2-AUDIO-FMT-S16-LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_S16_LE``
> > +      - 'S16_LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_S16_LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-U16-LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_U16_LE``
> > +      - 'U16_LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_U16_LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-S24-LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_S24_LE``
> > +      - 'S24_LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_S24_LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-U24-LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_U24_LE``
> > +      - 'U24_LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_U24_LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-S32-LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_S32_LE``
> > +      - 'S32_LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_S32_LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-U32-LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_U32_LE``
> > +      - 'U32_LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_U32_LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-FLOAT-LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_FLOAT_LE``
> > +      - 'FLOAT_LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_FLOAT_LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-IEC958-SUBFRAME-LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE``
> > +      - 'IEC958_SUBFRAME_LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-S24-3LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_S24_3LE``
> > +      - 'S24_3LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-U24-3LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_U24_3LE``
> > +      - 'U24_3LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_U24_3LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-S20-3LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_S20_3LE``
> > +      - 'S20_3LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
> > +    * .. _V4L2-AUDIO-FMT-U20-3LE:
> > +
> > +      - ``V4L2_AUDIO_FMT_U20_3LE``
> > +      - 'U20_3LE'
> > +      - Corresponds to SNDRV_PCM_FORMAT_U20_3LE in ALSA
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documen=
tation/userspace-api/media/v4l/pixfmt.rst
> > index 11dab4a90630..2eb6fdd3b43d 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
> > @@ -36,3 +36,4 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
> >      colorspaces
> >      colorspaces-defs
> >      colorspaces-details
> > +    pixfmt-audio
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-=
core/v4l2-ioctl.c
> > index 961abcdf7290..be229c69e991 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1471,6 +1471,19 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc=
 *fmt)
> >       case V4L2_PIX_FMT_Y210:         descr =3D "10-bit YUYV Packed"; b=
reak;
> >       case V4L2_PIX_FMT_Y212:         descr =3D "12-bit YUYV Packed"; b=
reak;
> >       case V4L2_PIX_FMT_Y216:         descr =3D "16-bit YUYV Packed"; b=
reak;
> > +     case V4L2_AUDIO_FMT_S8:         descr =3D "8-bit Signed"; break;
> > +     case V4L2_AUDIO_FMT_S16_LE:     descr =3D "16-bit Signed LE"; bre=
ak;
> > +     case V4L2_AUDIO_FMT_U16_LE:             descr =3D "16-bit Unsigne=
d LE"; break;
> > +     case V4L2_AUDIO_FMT_S24_LE:             descr =3D "24(32)-bit Sig=
ned LE"; break;
> > +     case V4L2_AUDIO_FMT_U24_LE:             descr =3D "24(32)-bit Uns=
igned LE"; break;
> > +     case V4L2_AUDIO_FMT_S32_LE:             descr =3D "32-bit Signed =
LE"; break;
> > +     case V4L2_AUDIO_FMT_U32_LE:             descr =3D "32-bit Unsigne=
d LE"; break;
> > +     case V4L2_AUDIO_FMT_FLOAT_LE:           descr =3D "32-bit Float L=
E"; break;
> > +     case V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE: descr =3D "32-bit IEC958 =
LE"; break;
> > +     case V4L2_AUDIO_FMT_S24_3LE:            descr =3D "24(24)-bit Sig=
ned LE"; break;
> > +     case V4L2_AUDIO_FMT_U24_3LE:            descr =3D "24(24)-bit Uns=
igned LE"; break;
> > +     case V4L2_AUDIO_FMT_S20_3LE:            descr =3D "20(24)-bit Sig=
ned LE"; break;
> > +     case V4L2_AUDIO_FMT_U20_3LE:            descr =3D "20(24)-bit Uns=
igned LE"; break;
> >
> >       default:
> >               /* Compressed formats */
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videod=
ev2.h
> > index 2c03d2dfadbe..673a6235a029 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -843,6 +843,29 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_RK_ISP1_PARAMS v4l2_fourcc('R', 'K', '1', 'P') /=
* Rockchip ISP1 3A Parameters */
> >  #define V4L2_META_FMT_RK_ISP1_STAT_3A        v4l2_fourcc('R', 'K', '1'=
, 'S') /* Rockchip ISP1 3A Statistics */
> >
> > +/*
> > + * Audio-data formats
> > + * All these audio formats use a fourcc starting with 'AU'
> > + * followed by the SNDRV_PCM_FORMAT_ value from asound.h.
> > + */
> > +#define V4L2_AUDIO_FMT_S8                    v4l2_fourcc('A', 'U', '0'=
, '0')
> > +#define V4L2_AUDIO_FMT_S16_LE                        v4l2_fourcc('A', =
'U', '0', '2')
> > +#define V4L2_AUDIO_FMT_U16_LE                        v4l2_fourcc('A', =
'U', '0', '4')
> > +#define V4L2_AUDIO_FMT_S24_LE                        v4l2_fourcc('A', =
'U', '0', '6')
> > +#define V4L2_AUDIO_FMT_U24_LE                        v4l2_fourcc('A', =
'U', '0', '8')
> > +#define V4L2_AUDIO_FMT_S32_LE                        v4l2_fourcc('A', =
'U', '1', '0')
> > +#define V4L2_AUDIO_FMT_U32_LE                        v4l2_fourcc('A', =
'U', '1', '2')
> > +#define V4L2_AUDIO_FMT_FLOAT_LE                      v4l2_fourcc('A', =
'U', '1', '4')
> > +#define V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE    v4l2_fourcc('A', 'U', '1'=
, '8')
> > +#define V4L2_AUDIO_FMT_S24_3LE                       v4l2_fourcc('A', =
'U', '3', '2')
> > +#define V4L2_AUDIO_FMT_U24_3LE                       v4l2_fourcc('A', =
'U', '3', '4')
> > +#define V4L2_AUDIO_FMT_S20_3LE                       v4l2_fourcc('A', =
'U', '3', '6')
> > +#define V4L2_AUDIO_FMT_U20_3LE                       v4l2_fourcc('A', =
'U', '3', '8')
> > +
> > +#define v4l2_fourcc_to_audfmt(fourcc)        \
> > +     (__force snd_pcm_format_t)(((((fourcc) >> 16) & 0xff) - '0') * 10=
  \
> > +                                + ((((fourcc) >> 24) & 0xff) - '0'))
> > +
> >  /* priv field value to indicates that subsequent fields are valid. */
> >  #define V4L2_PIX_FMT_PRIV_MAGIC              0xfeedcafe
> >
>
