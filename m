Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5963D85A3FA
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Feb 2024 13:57:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9710E94;
	Mon, 19 Feb 2024 13:57:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9710E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708347442;
	bh=ccbHakWFMPqKyo56fEKpc8aAf3Wb4VQoRZfLVnlY020=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sdYQu28aMtaa+Co/LzOi9c0MPa//35+vK4iJwTZCB9FHGWvLUEgL1cn1egM7guh29
	 ShK2V48NVOn8WoRcpfRwjlGW66j5bdMHT5AzzZIEcH7GXyxcqzU/aPF082U7NLAsZz
	 MjzIWMEf7BR5E940pVd+Udrg0CebqECwe0hH60NY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77240F805A0; Mon, 19 Feb 2024 13:56:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1C5BF805A8;
	Mon, 19 Feb 2024 13:56:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F23D0F80496; Mon, 19 Feb 2024 13:56:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 422DDF800EE
	for <alsa-devel@alsa-project.org>; Mon, 19 Feb 2024 13:56:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 422DDF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IaC62Hw3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C28B7CE0159;
	Mon, 19 Feb 2024 12:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94AC8C433C7;
	Mon, 19 Feb 2024 12:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708347385;
	bh=ccbHakWFMPqKyo56fEKpc8aAf3Wb4VQoRZfLVnlY020=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IaC62Hw3yjK1/flPQhxsuk0O4OdKFtG83Nn2lk244OGiDCxR6rKWUuaIKZ7/t7BGf
	 jcZ4sk87QdlBUQyW+B0eTFWUJqh7KWkUxhHmL6ecneCUylAn7cjjSKL2XBdbdy3RLl
	 luWHN2toOrZvmPvGb5Q9qjdgM64Vw50ntuXtUpwPGQpqFW5I/Bbvjedgt+/lYXvXns
	 llJFV31k0n50KPsX8E49DfrCARvcDerNAopvgQZ3uvWHBBwI9WKL6UtN5XLZU83/kQ
	 40kwgeSzuu9EeBatmrJQUzesPW9bepQxFLwCM9L5vwIJEvs1iln+7drGvgDeAF6M/j
	 h6OP4j6RmhfZA==
Date: Mon, 19 Feb 2024 13:56:18 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
 sakari.ailus@iki.fi, tfiga@chromium.org, m.szyprowski@samsung.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v12 08/15] media: uapi: Define audio sample format
 fourcc type
Message-ID: <20240219135618.5c557e66@coco.lan>
In-Reply-To: 
 <CAA+D8APD+zL0xYkf6FxPNfM3Y3O8+PhT7WEXO7XCLAmBjoMmUA@mail.gmail.com>
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
	<1705581128-4604-9-git-send-email-shengjiu.wang@nxp.com>
	<20240217101926.3f1d2452@coco.lan>
	<CAA+D8APD+zL0xYkf6FxPNfM3Y3O8+PhT7WEXO7XCLAmBjoMmUA@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: MSOSO7F4CL4WP7R5IYJE46C6JZVQGBL2
X-Message-ID-Hash: MSOSO7F4CL4WP7R5IYJE46C6JZVQGBL2
X-MailFrom: mchehab@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MSOSO7F4CL4WP7R5IYJE46C6JZVQGBL2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Em Mon, 19 Feb 2024 12:05:02 +0800
Shengjiu Wang <shengjiu.wang@gmail.com> escreveu:

> Hi Mauro
>=20
> On Sat, Feb 17, 2024 at 5:19=E2=80=AFPM Mauro Carvalho Chehab
> <mchehab@kernel.org> wrote:
> >
> > Em Thu, 18 Jan 2024 20:32:01 +0800
> > Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:
> > =20
> > > The audio sample format definition is from alsa,
> > > the header file is include/uapi/sound/asound.h, but
> > > don't include this header file directly, because in
> > > user space, there is another copy in alsa-lib.
> > > There will be conflict in userspace for include
> > > videodev2.h & asound.h and asoundlib.h
> > >
> > > Here still use the fourcc format.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  .../userspace-api/media/v4l/pixfmt-audio.rst  | 87 +++++++++++++++++=
++
> > >  .../userspace-api/media/v4l/pixfmt.rst        |  1 +
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          | 13 +++
> > >  include/uapi/linux/videodev2.h                | 23 +++++
> > >  4 files changed, 124 insertions(+)
> > >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audi=
o.rst
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-audio.rst b=
/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> > > new file mode 100644
> > > index 000000000000..04b4a7fbd8f4
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> > > @@ -0,0 +1,87 @@
> > > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > > +
> > > +.. _pixfmt-audio:
> > > +
> > > +*************
> > > +Audio Formats
> > > +*************
> > > +
> > > +These formats are used for :ref:`audiomem2mem` interface only.
> > > +
> > > +.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{10.3cm}|
> > > +
> > > +.. cssclass:: longtable
> > > +
> > > +.. flat-table:: Audio Format
> > > +    :header-rows:  1
> > > +    :stub-columns: 0
> > > +    :widths:       3 1 4
> > > +
> > > +    * - Identifier
> > > +      - Code
> > > +      - Details
> > > +    * .. _V4L2-AUDIO-FMT-S8:
> > > +
> > > +      - ``V4L2_AUDIO_FMT_S8``
> > > +      - 'S8'
> > > +      - Corresponds to SNDRV_PCM_FORMAT_S8 in ALSA
> > > +    * .. _V4L2-AUDIO-FMT-S16-LE: =20
> >
> > Hmm... why can't we just use SNDRV_*_FORMAT_*? Those are already part of
> > an uAPI header. No need to add any abstraction here and/or redefine
> > what is there already at include/uapi/sound/asound.h.
> > =20
> Actually I try to avoid including the include/uapi/sound/asound.h.
> Because in user space, there is another copy in alsa-lib (asoundlib.h).
> There will be conflict in userspace when including videodev2.h and
> asoundlib.h.

Well, alsasoundlib.h seems to be using the same definitions:
	https://github.com/michaelwu/alsa-lib/blob/master/include/pcm.h

So, I can't see what would be the actual issue, as both userspace library
and ALSA internal headers use the same magic numbers.

You can still do things like:

	#ifdef __KERNEL__
	#  include <sound/asound.h>
	#else
	#  include <asoundlib.h>
	#endif

To avoid such kind of conflicts, if you need to have it included on
some header file. Yet, I can't see why you would need that.

IMO, at uAPI headers, you just need to declare the uAPI audiofmt field
to be either __u32 or __u64, pointing it to where this value comes from
(on both userspace and Kernelspace. E. g.:

/**
 * struct v4l2_audio_format - audio data format definition
 * @audioformat:
 *	an integer number matching the fields inside
 *	enum snd_pcm_format_t (e. g. `SNDRV_PCM_FORMAT_*`), as defined
 *	in include/uapi/sound/asound.h and
 *      https://www.alsa-project.org/alsa-doc/alsa-lib/group___p_c_m.html#g=
aa14b7f26877a812acbb39811364177f8.
 * @channels:		channel numbers
 * @buffersize:		maximum size in bytes required for data
 */
struct v4l2_audio_format {
	__u32				audioformat;
	__u32				channels;
	__u32				buffersize;
} __attribute__ ((packed));

Then, at documentation you just need to point to where the
possible values for SNDRV_PCM_FORMAT_ are defined. No need to
document them one by one.

With such definition, you'll only need to include sound/asound.h
within the kAPI scope.

>=20
> And in the V4l framework, the fourcc type is commonly used in other
> cases (video, radio, touch, meta....), to avoid changing common code
> a lot, so I think using fourcc definition for audio may be simpler.

Those are real video streams (or a video-related streams, in the case
of metadata) where fourcc is widely used. There, it makes sense.
However, ALSA format definitions are already being used for a long time.
There's no sense on trying to reinvent it - or having an abstract layer
to convert from/to fourcc <=3D=3D> enum snd_pcm_format_t. Just use what is
there already.

Thanks,
Mauro
