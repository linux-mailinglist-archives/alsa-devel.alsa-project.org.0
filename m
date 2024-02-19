Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D969A859B3E
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Feb 2024 05:07:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F625A4D;
	Mon, 19 Feb 2024 05:07:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F625A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708315662;
	bh=2m4ZJrrRoCw9vxAi916ZAJJ3u7pdL0JcwCVq3lUK7kQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aLSOzldjpLDYMuYqfDiq2ziB/14t5ws4v9RPR7ONp9Jkz+063gExSJdhT3Bzl49ik
	 /4+yeYXff1vvBn2we/C9xQmQzr3TCH/TE2kQRWSSvpwU2GfoqexgH68aWvCdXBRihK
	 uWVF4K/zqQOLY0RaNJ/JUGYgwriJqrdVgbz7fccc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0733DF805AA; Mon, 19 Feb 2024 05:06:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2398F8047D;
	Mon, 19 Feb 2024 05:06:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1E90F8019B; Mon, 19 Feb 2024 05:05:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06983F804B0
	for <alsa-devel@alsa-project.org>; Mon, 19 Feb 2024 05:05:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06983F804B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bj77agvL
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3651d6dea15so3734085ab.1
        for <alsa-devel@alsa-project.org>;
 Sun, 18 Feb 2024 20:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708315514; x=1708920314;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nna+GUj9CQ2WZrxvQX42Zjl9ya+Rgw72c7b/L2nye4Y=;
        b=bj77agvLJg9eE2sPUyIuQkkIm4Wvr4HsNjzZOBN3wSDJiGdqIdRBuMXhGT5n91gdFc
         vy9sUo2qVTAcoHfE97QghFt3NMNrqC10+gOmCpwDrctqfbvZugWDGTqaoduBdGwGaaUO
         d4Zb6/aMRf3/u3IXkWe7vLmg+QVuT18I+iFVs33N03xDvRNmgkxM28O1Md3dYnFDj7xF
         uWomEJajGPX5BsROZiqt2775w/9l2AjeTx8Lal6x6YszvaMhNOBjPCnPVxjHY0WZOel6
         BlWdy+ad578IKH8NCEBfGfIk1PtfNMUas63WaYOeOO54/46jv2aE2jThuB89uX9U5+K7
         hPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708315514; x=1708920314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nna+GUj9CQ2WZrxvQX42Zjl9ya+Rgw72c7b/L2nye4Y=;
        b=Yxn3FpzEYV7b4CPVITdj06osRYDxf3m1SWXzBF35Bl/51oXzCcoHe1W+/nM/OWFCTI
         JfWRBG38OjhxSNXdPuK9mW5b+bClbSZjiECEJ/nIAVSWNL4YaNRMghlDYkymdF3/b0XJ
         HDPvjD2TbCqO8xPEiGDYOsSUAJ5zScj8ST0EopzxubZhgJ8/AUMAFcypssXDPOB24/pC
         mWEO72V+OKqCHdaX8NVseajQjBDdyeUBa1MNbmwWDc88LxqovWaEcSi0j6xFDIgymK9f
         NkgHQKIWeW469ory0xr31liobrgQU0877ZQpB+S11LqZaXGf4fNa0Y8WKM5upkn9jQUb
         2lxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTXUloDbcwjO5CzLVwKpoMXdMi7iiHJZ/+uIeOol4jaoLlkLCdGXJk4GpOXkyKQrjOI0Szz8qFMuN57jR+zwm4VP3GjZqe++y6F/4=
X-Gm-Message-State: AOJu0YwM0tgw6XI8cOgTADyXGi9rRuZ44tvxLT9rgFKQhclFQ7hUs+WR
	rNc7RCBycixf6yZauCelWYlrPy6fahH1mD0JIVdUVPJwkd1M4EXHRWN2l9ywSIqdr1LcxveWgsX
	T9D60dOiyQwfa/FQci/aAPhoEml0=
X-Google-Smtp-Source: 
 AGHT+IFQWSfphwrdCpDlSHfIm999z2WafX/W5AQCf8lo0hMoTfctrWBIvXyD3UbQ4B6TlRI0mbwQoS6T/QusE/aP/ng=
X-Received: by 2002:a05:6e02:1d88:b0:365:6:b56b with SMTP id
 h8-20020a056e021d8800b003650006b56bmr9547570ila.8.1708315513621; Sun, 18 Feb
 2024 20:05:13 -0800 (PST)
MIME-Version: 1.0
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
 <1705581128-4604-9-git-send-email-shengjiu.wang@nxp.com>
 <20240217101926.3f1d2452@coco.lan>
In-Reply-To: <20240217101926.3f1d2452@coco.lan>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 19 Feb 2024 12:05:02 +0800
Message-ID: 
 <CAA+D8APD+zL0xYkf6FxPNfM3Y3O8+PhT7WEXO7XCLAmBjoMmUA@mail.gmail.com>
Subject: Re: [PATCH v12 08/15] media: uapi: Define audio sample format fourcc
 type
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
 sakari.ailus@iki.fi,
	tfiga@chromium.org, m.szyprowski@samsung.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ZS6UEZCVBJDBUWHOGD32KFSDSR5OIYTW
X-Message-ID-Hash: ZS6UEZCVBJDBUWHOGD32KFSDSR5OIYTW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZS6UEZCVBJDBUWHOGD32KFSDSR5OIYTW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mauro

On Sat, Feb 17, 2024 at 5:19=E2=80=AFPM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> Em Thu, 18 Jan 2024 20:32:01 +0800
> Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:
>
> > The audio sample format definition is from alsa,
> > the header file is include/uapi/sound/asound.h, but
> > don't include this header file directly, because in
> > user space, there is another copy in alsa-lib.
> > There will be conflict in userspace for include
> > videodev2.h & asound.h and asoundlib.h
> >
> > Here still use the fourcc format.
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
>
> Hmm... why can't we just use SNDRV_*_FORMAT_*? Those are already part of
> an uAPI header. No need to add any abstraction here and/or redefine
> what is there already at include/uapi/sound/asound.h.
>
Actually I try to avoid including the include/uapi/sound/asound.h.
Because in user space, there is another copy in alsa-lib (asoundlib.h).
There will be conflict in userspace when including videodev2.h and
asoundlib.h.

And in the V4l framework, the fourcc type is commonly used in other
cases (video, radio, touch, meta....), to avoid changing common code
a lot, so I think using fourcc definition for audio may be simpler.

Best regards
Shengjiu Wang
