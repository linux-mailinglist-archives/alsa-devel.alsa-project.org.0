Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B7E887C24
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Mar 2024 10:47:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3239B1518;
	Sun, 24 Mar 2024 10:47:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3239B1518
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711273640;
	bh=zE1l5i3GYqT9+OTq30G/9cW0V+10eNMvs5g0u//D3+w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gK7i1YjALL2zIYFokJHiucJBjBXA3tNWHZLCRZzQwqBlcF9dPutabBSNj4Z9Y6Wn0
	 1uSHSvOi+r21webfohsfMBnTNKE2sgzxmLZngSx0WaV7NvQl+/4pk3C5ZfUQROGZqH
	 J0vTwcRYvae+33rycnn9WUAHe8dmV6M52dUlus+0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D55B2F805AD; Sun, 24 Mar 2024 10:46:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DFC6F805D3;
	Sun, 24 Mar 2024 10:46:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16C1FF804E7; Thu, 21 Mar 2024 15:58:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 985BCF8025F
	for <alsa-devel@alsa-project.org>; Thu, 21 Mar 2024 15:57:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 985BCF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LbxtVy3O
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56890b533aaso1264358a12.3
        for <alsa-devel@alsa-project.org>;
 Thu, 21 Mar 2024 07:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711033077; x=1711637877;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGnp9paSrZv1dQoKAyRCnIkFZlRhhX7Zz0E1MQGq9XA=;
        b=LbxtVy3O8HBCfD0Ma0exoQ4787+V7S/hUGHjQvJw9alEzafJ2yNYk5hdM7zRudAM8e
         X8e4fGfYobNiZht5MGsWGtJO7Lkg2/jdUOa+tTRR42526djmDMMnl/2ykqeslhzBzgEi
         PFFJ6AfRwtXkvWa0jIJbEjBIQBvW0wVpWbo3nDpwa2RaWDNBjvhQgwYUX8DqQ3NcbdVM
         UmdYLu8vNEeYWvn22qn56OVxOXZzO2Wfe4c3h+JG5k1v9H6sSIX6InhmtGdW+XXYA0Rr
         pbFGhaPyhWhTU5g9sYjvtLDEPa0PIVXnBMoVJUjEjAfkGmd+hHlRAYMe+O0tihC0cAm4
         CP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711033077; x=1711637877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGnp9paSrZv1dQoKAyRCnIkFZlRhhX7Zz0E1MQGq9XA=;
        b=ZJRkK8mCVY8UtNFGSGpsjIQwmehDtDPksgsUpoNo16txYTGbhXZ2sr8nvK6YIcnK6R
         hn2w0xpzPtjtQ5O4n28J/gIQsX4K6aRj3DU4EUrkkVMVv8Yv55ZJmdSp23SZWv43j2tQ
         686RgjyD4H9qCA1UHo1nWK91zu+VU6rMiCaEd8hWY1UL4uCN0D2a7W/eme1AUdle8lRO
         o3iJw81NiTGg7AvvG+3KQi9qJIfK6iVUGE2DdhnRtHrH5QQmL2EC0gKxqxhZQ0ZbHxG0
         I2xT7L/ROEWwBt0SlPwHu9Bpkzf9VJl11LpX5xT862XgLNMSeQjYr62muQWw6KKOoa/A
         mgww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlok/2eoz6PLsq6sYfM8hmBA6pXtNJJDHg0KHVOvLab2ZGkJPBh/jV5xNWUWapQ1A4uy6IM+NKi8p64ZR1J5Ej80tonCsbEu8xWCw=
X-Gm-Message-State: AOJu0YzOR4Vu/gUjCgzft+FWOLh7j4UT2RrlvLUjMw0ANvgd69srIf1g
	zhQHJnOM8oryJl5SBAW8fEdP9CV9d4wfZ3aI+ClMMfVpc2lbP1p6
X-Google-Smtp-Source: 
 AGHT+IECpA6Q9nFP+AP+PI/SMSHoVZrz38ZSpkIRxMqHluLT5vxT7+lZAhznzGRXkNhgm74eRFVu+A==
X-Received: by 2002:a05:6402:2483:b0:568:d7fe:a857 with SMTP id
 q3-20020a056402248300b00568d7fea857mr7078184eda.11.1711033076440;
        Thu, 21 Mar 2024 07:57:56 -0700 (PDT)
Received: from coco.lan ([95.90.155.68])
        by smtp.gmail.com with ESMTPSA id
 cb4-20020a0564020b6400b005663b0d7243sm8187572edb.83.2024.03.21.07.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 07:57:56 -0700 (PDT)
Date: Thu, 21 Mar 2024 15:57:54 +0100
From: Mauro Carvalho Chehab <maurochehab@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
Subject: Re: [GIT PULL FOR v6.10] Add imx-asrc m2m audio rate control driver
Message-ID: <20240321155754.66681c24@coco.lan>
In-Reply-To: <369cc35b-9625-4512-bb7a-7d5ccfe28e5c@xs4all.nl>
References: <369cc35b-9625-4512-bb7a-7d5ccfe28e5c@xs4all.nl>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: maurochehab@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KH7IMIPNANTPBUVPSXX7SFAFIUKFXZTO
X-Message-ID-Hash: KH7IMIPNANTPBUVPSXX7SFAFIUKFXZTO
X-Mailman-Approved-At: Sun, 24 Mar 2024 09:45:39 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KH7IMIPNANTPBUVPSXX7SFAFIUKFXZTO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Em Tue, 19 Mar 2024 16:15:35 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> Hi Mauro,
>=20
> This adds support for the imx-asrc m2m audio rate control driver. Most of=
 these
> patches add support for the new v4l-audioX device nodes and related types,
> and adding support for fixed point control types.
>=20
> The ASoC patches have been acked by Mark Brown.
>=20
> It also adds a vim2m-audio test driver so we can test the v4l-audio infra=
structure.
>=20
> Since V4L2 is fourcc-based all the way, directly using snd_pcm_format_t v=
alues
> is not an option: fourcc's are expected to be printable characters, and i=
t is
> pretty much certain that there are applications that show it like that to=
 the
> end-user. The utilities in v4l-utils certainly do, and it is in fact a
> perfectly reasonable thing to do. So instead we map the snd_pcm_format_t =
value
> to a fourcc with v4l2_audfmt_to_fourcc and map it back with v4l2_fourcc_t=
o_audfmt.

I still think that this can cause maintenance burden to sync up changes
from fourcc to snd_pcm_format_t for no good reason, as any apps that will
be working with this will require changes anyway to support the new
devnodes and ioctls.

With regards to printable fourcc values, it doesn't seem the best for audio.
I mean, for V4L2, when we had fourcc introduced, the formats were:

	RGB3
	BGR3
	YUYV
	...

so, just printing them as ASCII would make sense, but those days were
gone a very long time ago, as now we have fourccs like:

	pBCC

Which you can't really know what it means, except by looking on its
definition:

	#define V4L2_PIX_FMT_SBGGR12P v4l2_fourcc('p', 'B', 'C', 'C')

For audio, even today's proposal makes no sense to be printed as
ASCII. See, it is a lot clearer if userspace would print:

	"PCM A-LAW"	# for ITU-T G711 A-law 8-bit encoding
	"PCM =CE=BC-LAW"	# for ITU-T G711 =CE=BC-law 8-bit encoding
	"PCM S8"	# for low-quality s8 encoding
	...
	"PCM S32_LE"
	...

than any obfuscated fourccs:

	"AUAL"		# currently missing at V4L2 proposal patch
	"AUML"		# currently missing at V4L2 proposal patch
	"AU00"
	...
	"AU10"
	...

Besides that, there were never any warranty that fourccs are printable
at the media subsystem. I might be wrong but I guess we even used some
unprintable ones in the past.


So, the argument that new apps that will support audio will need to
receive a fourcc instead of snd_pcm_format_t sounds bogus to me.

Also, the current proposal misses lots of already-existing codes at
snd_pcm_format_t.


>=20
> This PR is using v15 of the patch series:
>=20
> https://patchwork.linuxtv.org/project/linux-media/list/?series=3D12460
>=20
> And the corresponding v4l-utils patch series is here:
>=20
> https://patchwork.linuxtv.org/user/todo/linux-media/?series=3D12074
>=20
> Regards,
>=20
> 	Hans
>=20
> The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acab=
db:
>=20
>   media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-audio
>=20
> for you to fetch changes up to af06c8792653c42d1f126505ec9180255091d94e:
>=20
>   media: vim2m-audio: add virtual driver for audio memory to memory (2024=
-03-19 15:55:38 +0100)
>=20
> ----------------------------------------------------------------
> Tag branch
>=20
> ----------------------------------------------------------------
> Hans Verkuil (1):
>       media: v4l2-ctrls: add support for fraction_bits
>=20
> Shengjiu Wang (15):
>       ASoC: fsl_asrc: define functions for memory to memory usage
>       ASoC: fsl_easrc: define functions for memory to memory usage
>       ASoC: fsl_asrc: move fsl_asrc_common.h to include/sound
>       ASoC: fsl_asrc: register m2m platform device
>       ASoC: fsl_easrc: register m2m platform device
>       media: uapi: Add V4L2_CAP_AUDIO_M2M capability flag
>       media: v4l2: Add audio capture and output support
>       media: uapi: Define audio sample format fourcc type
>       media: uapi: Add V4L2_CTRL_CLASS_M2M_AUDIO
>       media: uapi: Add audio rate controls support
>       media: uapi: Declare interface types for Audio
>       media: uapi: Add an entity type for audio resampler
>       media: vivid: add fixed point test controls
>       media: imx-asrc: Add memory to memory driver
>       media: vim2m-audio: add virtual driver for audio memory to memory
>=20
>  Documentation/userspace-api/media/mediactl/media-types.rst    |   11 +
>  Documentation/userspace-api/media/v4l/buffer.rst              |    6 +
>  Documentation/userspace-api/media/v4l/common.rst              |    1 +
>  Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst   |   71 +++
>  Documentation/userspace-api/media/v4l/devices.rst             |    1 +
>  Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst |   59 +++
>  Documentation/userspace-api/media/v4l/pixfmt-audio.rst        |  100 ++++
>  Documentation/userspace-api/media/v4l/pixfmt.rst              |    1 +
>  Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst     |    2 +
>  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst  |    4 +
>  Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst        |    4 +
>  Documentation/userspace-api/media/v4l/vidioc-querycap.rst     |    3 +
>  Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst    |   11 +-
>  Documentation/userspace-api/media/videodev2.h.rst.exceptions  |    3 +
>  MAINTAINERS                                                   |   17 +
>  drivers/media/common/videobuf2/videobuf2-v4l2.c               |    4 +
>  drivers/media/platform/nxp/Kconfig                            |   13 +
>  drivers/media/platform/nxp/Makefile                           |    1 +
>  drivers/media/platform/nxp/imx-asrc.c                         | 1256 +++=
++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/media/test-drivers/Kconfig                            |   10 +
>  drivers/media/test-drivers/Makefile                           |    1 +
>  drivers/media/test-drivers/vim2m-audio.c                      |  793 +++=
+++++++++++++++++++++++++++++
>  drivers/media/test-drivers/vivid/vivid-core.h                 |    2 +
>  drivers/media/test-drivers/vivid/vivid-ctrls.c                |   26 ++
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c                 |    9 +
>  drivers/media/v4l2-core/v4l2-ctrls-api.c                      |    1 +
>  drivers/media/v4l2-core/v4l2-ctrls-core.c                     |   93 +++-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                     |   10 +
>  drivers/media/v4l2-core/v4l2-dev.c                            |   21 +
>  drivers/media/v4l2-core/v4l2-ioctl.c                          |   66 +++
>  drivers/media/v4l2-core/v4l2-mem2mem.c                        |   13 +-
>  include/media/v4l2-ctrls.h                                    |   13 +-
>  include/media/v4l2-dev.h                                      |    2 +
>  include/media/v4l2-ioctl.h                                    |   34 ++
>  {sound/soc/fsl =3D> include/sound}/fsl_asrc_common.h            |   60 +=
++
>  include/uapi/linux/media.h                                    |    2 +
>  include/uapi/linux/v4l2-controls.h                            |    9 +
>  include/uapi/linux/videodev2.h                                |   50 +-
>  sound/soc/fsl/fsl_asrc.c                                      |  144 +++=
+++
>  sound/soc/fsl/fsl_asrc.h                                      |    4 +-
>  sound/soc/fsl/fsl_asrc_dma.c                                  |    2 +-
>  sound/soc/fsl/fsl_easrc.c                                     |  233 +++=
+++++++
>  sound/soc/fsl/fsl_easrc.h                                     |    6 +-
>  43 files changed, 3145 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem2m=
em.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-audio=
-m2m.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.rst
>  create mode 100644 drivers/media/platform/nxp/imx-asrc.c
>  create mode 100644 drivers/media/test-drivers/vim2m-audio.c
>  rename {sound/soc/fsl =3D> include/sound}/fsl_asrc_common.h (60%)
>=20

