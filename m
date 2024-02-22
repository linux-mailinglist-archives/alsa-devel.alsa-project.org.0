Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ED185F041
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 04:56:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81514825;
	Thu, 22 Feb 2024 04:56:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81514825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708574182;
	bh=J3j8PZZdp5i0Gd+0rx6IZWHUtQPKYoQur7jAPifN9go=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NoiLkr49tJ5CppL6nxwahCTaVeo1zgISHEwg+NErQf7AFtwV+gvwZVY487QSj0CVC
	 OQV5vzl3/xIMUw1b72LgiPkau8TLct91bGDlckeVQ6CmGPVfFPmOEhQtxCFp1LvuAZ
	 nzIrHuL5dJ0GN3chhQltcDsAHHSmggkd548VGauY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CC31F805B2; Thu, 22 Feb 2024 04:55:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4868F8056F;
	Thu, 22 Feb 2024 04:55:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07973F80496; Thu, 22 Feb 2024 04:51:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E33FF800EE
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 04:50:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E33FF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ADr4kWb5
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7baa8097064so474610139f.3
        for <alsa-devel@alsa-project.org>;
 Wed, 21 Feb 2024 19:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708573855; x=1709178655;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/Q0YGTOKcdouf/IIlA2xOaiZYdgb6GG89hveRTd/5g=;
        b=ADr4kWb5KjM+m7P57QmcBDfQnq1DTSF2LKxCrsrp3e/DQJ/udsMxR3afEx40CI7Y3u
         0gaWNjpUt/T89PbM+o1MaB43qWTt9VomDjY5qRbYEp7CQjiCZysOGdx+d/gpZEy4Yulv
         SNs7pyAgkn2cqlt78RcrwSBORVqrHN3pNi2FBjMMgWv/JDqCZR/XnPQxcksEp4v6F1lk
         YwYn5FExai1uKI89VDoRTI+gY3HYDy4q6Ofbf1R8Dnvq8729ZAmbV4N3IPCZFS9UP69Q
         k0TMyXn5fufqSgE5O7HwvoQXNPSHkTCG5/pu/B14hws4Ame9F+6crgjfQP6U5hMV8gHC
         F2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708573855; x=1709178655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/Q0YGTOKcdouf/IIlA2xOaiZYdgb6GG89hveRTd/5g=;
        b=CoaqHhdckfKyQt8A/cmAW2hoXjW+X9oXAIKTgDwOSvFvmiqGxRkiZg3Zf+ktlTiajy
         bugiqoPdGd8ooAAm/TmcABfjGt9VSYSdr4QJMgFBYlBRfoQryviQS1QQYvquIfuZo/fE
         LxGT4zLjONfPr7ov8O2wiwbozpx3EZaeUUtFWy3sKU6nHyekZN8amxoCxPlKxz3hm5gs
         LSMzWPKUnoubf5KeJEiuw1NLGSA+4wKb8/l5vlMyW2FL4bdgkI3H/UaV3ySQTto5kevl
         UAR4zZA3s56sJR/dV0uDSt+3T9bjqWsRH5uF6KEm1FyUmqvXCwKJg0k0DK6T+fMG/Dwy
         KCAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyIkg7ElT90JAwg4oHH/M56Kfq/Gnkbx0YNZb92U2EubATs+lzotAnRM109r4z+tppFB0ncB9f/5ywy5MoBY6bung8mBkQWqZN8rM=
X-Gm-Message-State: AOJu0Yy9X0Y+3mU6hzdZvfn6LkU4FnZvIxs+l/Qj8mFqOqlpCU+L7+CA
	DLedwMT6lZDfgxM6TMpuw/cn4DWyl33kSG371vjHUoPnFsFNesGONFpNXP2FHGqNFSZTHZ+xjfc
	x6NUoK+gpOTX518anQHKJHk0X2qE=
X-Google-Smtp-Source: 
 AGHT+IGObMpA8I/bjIFzhd2/BOrRWHNb8S+mrmq/qw5er4vLZtC3xDXgfTc2XDOuXSracqAay+Hkeu1DOzd3Ewhetl0=
X-Received: by 2002:a05:6e02:1d95:b0:365:1305:fac5 with SMTP id
 h21-20020a056e021d9500b003651305fac5mr19489792ila.0.1708573854696; Wed, 21
 Feb 2024 19:50:54 -0800 (PST)
MIME-Version: 1.0
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
 <1705581128-4604-9-git-send-email-shengjiu.wang@nxp.com>
 <20240217101926.3f1d2452@coco.lan>
 <CAA+D8APD+zL0xYkf6FxPNfM3Y3O8+PhT7WEXO7XCLAmBjoMmUA@mail.gmail.com>
 <20240219135618.5c557e66@coco.lan>
 <e98a23c6-a35d-422b-be8a-1179392215c1@xs4all.nl>
In-Reply-To: <e98a23c6-a35d-422b-be8a-1179392215c1@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 22 Feb 2024 11:50:43 +0800
Message-ID: 
 <CAA+D8AN1KEjmb7f5dzMn1EV=UB5QqA4q__y2mTOW8-CH_7gchQ@mail.gmail.com>
Subject: Re: [PATCH v12 08/15] media: uapi: Define audio sample format fourcc
 type
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
	tfiga@chromium.org, m.szyprowski@samsung.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HK6TVHREBEYZJLCOQD7K43IF4JJOWVLO
X-Message-ID-Hash: HK6TVHREBEYZJLCOQD7K43IF4JJOWVLO
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 21, 2024 at 7:10=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 19/02/2024 13:56, Mauro Carvalho Chehab wrote:
> > Em Mon, 19 Feb 2024 12:05:02 +0800
> > Shengjiu Wang <shengjiu.wang@gmail.com> escreveu:
> >
> >> Hi Mauro
> >>
> >> On Sat, Feb 17, 2024 at 5:19=E2=80=AFPM Mauro Carvalho Chehab
> >> <mchehab@kernel.org> wrote:
> >>>
> >>> Em Thu, 18 Jan 2024 20:32:01 +0800
> >>> Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:
> >>>
> >>>> The audio sample format definition is from alsa,
> >>>> the header file is include/uapi/sound/asound.h, but
> >>>> don't include this header file directly, because in
> >>>> user space, there is another copy in alsa-lib.
> >>>> There will be conflict in userspace for include
> >>>> videodev2.h & asound.h and asoundlib.h
> >>>>
> >>>> Here still use the fourcc format.
> >>>>
> >>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>> ---
> >>>>  .../userspace-api/media/v4l/pixfmt-audio.rst  | 87 ++++++++++++++++=
+++
> >>>>  .../userspace-api/media/v4l/pixfmt.rst        |  1 +
> >>>>  drivers/media/v4l2-core/v4l2-ioctl.c          | 13 +++
> >>>>  include/uapi/linux/videodev2.h                | 23 +++++
> >>>>  4 files changed, 124 insertions(+)
> >>>>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-aud=
io.rst
> >>>>
> >>>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-audio.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> >>>> new file mode 100644
> >>>> index 000000000000..04b4a7fbd8f4
> >>>> --- /dev/null
> >>>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> >>>> @@ -0,0 +1,87 @@
> >>>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> >>>> +
> >>>> +.. _pixfmt-audio:
> >>>> +
> >>>> +*************
> >>>> +Audio Formats
> >>>> +*************
> >>>> +
> >>>> +These formats are used for :ref:`audiomem2mem` interface only.
> >>>> +
> >>>> +.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{10.3cm}|
> >>>> +
> >>>> +.. cssclass:: longtable
> >>>> +
> >>>> +.. flat-table:: Audio Format
> >>>> +    :header-rows:  1
> >>>> +    :stub-columns: 0
> >>>> +    :widths:       3 1 4
> >>>> +
> >>>> +    * - Identifier
> >>>> +      - Code
> >>>> +      - Details
> >>>> +    * .. _V4L2-AUDIO-FMT-S8:
> >>>> +
> >>>> +      - ``V4L2_AUDIO_FMT_S8``
> >>>> +      - 'S8'
> >>>> +      - Corresponds to SNDRV_PCM_FORMAT_S8 in ALSA
> >>>> +    * .. _V4L2-AUDIO-FMT-S16-LE:
> >>>
> >>> Hmm... why can't we just use SNDRV_*_FORMAT_*? Those are already part=
 of
> >>> an uAPI header. No need to add any abstraction here and/or redefine
> >>> what is there already at include/uapi/sound/asound.h.
> >>>
> >> Actually I try to avoid including the include/uapi/sound/asound.h.
> >> Because in user space, there is another copy in alsa-lib (asoundlib.h)=
.
> >> There will be conflict in userspace when including videodev2.h and
> >> asoundlib.h.
> >
> > Well, alsasoundlib.h seems to be using the same definitions:
> >       https://github.com/michaelwu/alsa-lib/blob/master/include/pcm.h
> >
> > So, I can't see what would be the actual issue, as both userspace libra=
ry
> > and ALSA internal headers use the same magic numbers.
> >
> > You can still do things like:
> >
> >       #ifdef __KERNEL__
> >       #  include <sound/asound.h>
> >       #else
> >       #  include <asoundlib.h>
> >       #endif
> >
> > To avoid such kind of conflicts, if you need to have it included on
> > some header file. Yet, I can't see why you would need that.
> >
> > IMO, at uAPI headers, you just need to declare the uAPI audiofmt field
> > to be either __u32 or __u64, pointing it to where this value comes from
> > (on both userspace and Kernelspace. E. g.:
> >
> > /**
> >  * struct v4l2_audio_format - audio data format definition
> >  * @audioformat:
> >  *    an integer number matching the fields inside
> >  *    enum snd_pcm_format_t (e. g. `SNDRV_PCM_FORMAT_*`), as defined
> >  *    in include/uapi/sound/asound.h and
> >  *      https://www.alsa-project.org/alsa-doc/alsa-lib/group___p_c_m.ht=
ml#gaa14b7f26877a812acbb39811364177f8.
> >  * @channels:         channel numbers
> >  * @buffersize:               maximum size in bytes required for data
> >  */
> > struct v4l2_audio_format {
> >       __u32                           audioformat;
> >       __u32                           channels;
> >       __u32                           buffersize;
> > } __attribute__ ((packed));
> >
> > Then, at documentation you just need to point to where the
> > possible values for SNDRV_PCM_FORMAT_ are defined. No need to
> > document them one by one.
> >
> > With such definition, you'll only need to include sound/asound.h
> > within the kAPI scope.
> >
> >>
> >> And in the V4l framework, the fourcc type is commonly used in other
> >> cases (video, radio, touch, meta....), to avoid changing common code
> >> a lot, so I think using fourcc definition for audio may be simpler.
> >
> > Those are real video streams (or a video-related streams, in the case
> > of metadata) where fourcc is widely used. There, it makes sense.
> > However, ALSA format definitions are already being used for a long time=
.
> > There's no sense on trying to reinvent it - or having an abstract layer
> > to convert from/to fourcc <=3D=3D> enum snd_pcm_format_t. Just use what=
 is
> > there already.
>
> The problem is that within V4L2 we use fourcc consistently to describe a
> format, including in VIDIOC_ENUM_FMT. And the expectation is that the fou=
rcc
> can be printed to a human readable string (there is even a printk format =
for
> that these days).
>
> But the pcm values are all small integers (and can even be 0!), and
> printing the fourcc will give garbage. It doesn't work well at all
> with the V4L2 API. But by having a straightforward conversion between the
> pcm identifier and a fourcc it was really easy to deal with this.
>
> There might even be applications today that call VIDIOC_ENUM_FMT to see
> what is supported and fail if it is not a proper fourcc is returned.
>
> It will certainly report nonsense in v4l_print_fmtdesc() (v4l2-ioctl.c).
>
> One of the early versions of this patch series did precisely what you req=
uest,
> but it just doesn't work well within the V4L2 uAPI.
>

Thanks all.

So can I reach the conclusion below?
1. Keep using the fourcc definition for v4l2_audio_format.audioformat.
2. Keep the name V4L2_BUF_TYPE_AUDIO_CAPTURE and
    V4L2_BUF_TYPE_AUDIO_OUTPUT.
3. Fix Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
    to change 'pixelformat' to 'audioformat'.
4. Update Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
    to add more description for clock drift.

Best Regards
Shengjiu Wang

> Regards,
>
>         Hans
>
> >
> > Thanks,
> > Mauro
>
