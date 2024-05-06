Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE15D8BC9FF
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2024 10:50:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1024D209;
	Mon,  6 May 2024 10:50:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1024D209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714985430;
	bh=enOnhfQCgQ2RbMQ1kTNuTC4OOeXUIY658Bnehe2M/Xo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GQl/Hn0khMTiMOLzAiPyhjNDTonz7jmeEcxe6yW4qbbXHSvT24vIOvOjk0DVC/EZj
	 sjA8h1AbkCAEngld86Ybw9qf1E/IJuMMR8WFdZPr/gAEWsEtl5TckEPPxxN052zjUB
	 NnvJR2pFTvqVy4gQfkKjQigPLjv3CaiBuAUroGtg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA98AF80588; Mon,  6 May 2024 10:49:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FD85F8057E;
	Mon,  6 May 2024 10:49:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDE37F8049C; Mon,  6 May 2024 10:49:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 040E9F8003A
	for <alsa-devel@alsa-project.org>; Mon,  6 May 2024 10:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 040E9F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FlOZ1MVx
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-36c7004daecso12228565ab.0
        for <alsa-devel@alsa-project.org>;
 Mon, 06 May 2024 01:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714985382; x=1715590182;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+P/KjeibrFZWEkv6+L8YPxuHh9mJNgbeY/rfKylmy8=;
        b=FlOZ1MVxabRC7VYXQTPE/wTTRqsA+I2xNintV/pzRDTCAZY+D7BcDf2Mr9n9E1dVql
         SgbYyV+DsorPO1kjmX/M5P3dtlJOWetYRDXHoDzMWcHskjJfNYk3kCYA63t8PY0K9OFR
         XUKkeh8lVQ5b8E75j8LcUo2F3fdBwNFi0Dr+03RuUeZJBxVjPEkv+A1Dsml00r9KvGOk
         DDvoZnnzBWL4ClwXxpRNVws+rhcyFR0YuLeftx+7BYPT5OyB2eXelQDC0nLf6BqVywwz
         fTIdJoUUTSxH+gkQ4z/srhYWSC6VD5ZaywK6c6rpHqT3H226tClz2jLq0X8JUtPKeUq1
         Bf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714985382; x=1715590182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+P/KjeibrFZWEkv6+L8YPxuHh9mJNgbeY/rfKylmy8=;
        b=Qm+Ez6QOSJaTy/a1r8BTIhbG9mfoIh8XkMVZNPqjEZdc/+qVHDyfUHa6B/OSsn5i1u
         3YuBQw46udU0+88pVr1QV1rRm82OWZodN4lV5Yu3WcbM3fQ8/EGI719cg7vfcggaeWBS
         vszKNQDswQHPX/yizmnyXP+Y9kAbVZ0cLdqcwQIRuvboBl0y6aLmKyG5pi39sxZ6tgho
         sN1MUpatvIPxORsYpw5N1RrDX8vxgqWvSeY1W3gn0vt/4aNlzgL2nrVFIZ16tPp0FP2s
         itjeepEQc/Hf0uukzO2s+qHkBD1PNnb3/OPEG798+LmTEyR2lbRwrW4Gx+Zh0gUvW0eC
         RaNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxGDvsilJZqQNH1Cru3dVAiub/No6E4/rN3G4wXaoPWwpYFwVrbA6e60sxPB4ppiJ2+Q6U3Irf+p4TH2zwgIN5jGdhDA4xH/L+nvU=
X-Gm-Message-State: AOJu0YzdwrEjC+3TbLZ3bFz7lUIbs5mPfm+XrqNMbhaXu/m05pYsahx0
	D1od1ytmP7l4BQaT/30tDykbSNc9CbfFo/I50euxe5waAG3eZuHckY3w63Qd+wklNbJmzO3xvRs
	TwvZPh7pivC4MyHuzvPm5zUPHpFQ=
X-Google-Smtp-Source: 
 AGHT+IGeec60Vp1v6lhrn7gTHN4m70j+7lgJkd7vr44lhHOV5xgWp2a2fsbD89DvpBkVDZJvLlaoq3wNcAZT4wuEZSs=
X-Received: by 2002:a05:6e02:1c0d:b0:36b:aae:613 with SMTP id
 l13-20020a056e021c0d00b0036b0aae0613mr10103474ilh.10.1714985382163; Mon, 06
 May 2024 01:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
 <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
 <20240430172752.20ffcd56@sal.lan> <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
 <87sez0k661.wl-tiwai@suse.de> <20240502095956.0a8c5b26@sal.lan>
 <20240502102643.4ee7f6c2@sal.lan> <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
 <20240503094225.47fe4836@sal.lan>
In-Reply-To: <20240503094225.47fe4836@sal.lan>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 6 May 2024 16:49:31 +0800
Message-ID: 
 <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
	hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
	m.szyprowski@samsung.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 4R7VPE3ATBOPFAOLI3GGFI4SGHSLOWX2
X-Message-ID-Hash: 4R7VPE3ATBOPFAOLI3GGFI4SGHSLOWX2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4R7VPE3ATBOPFAOLI3GGFI4SGHSLOWX2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 3, 2024 at 4:42=E2=80=AFPM Mauro Carvalho Chehab <mchehab@kerne=
l.org> wrote:
>
> Em Fri, 3 May 2024 10:47:19 +0900
> Mark Brown <broonie@kernel.org> escreveu:
>
> > On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrote:
> > > Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> >
> > > > There are still time control associated with it, as audio and video
> > > > needs to be in sync. This is done by controlling the buffers size
> > > > and could be fine-tuned by checking when the buffer transfer is don=
e.
> >
> > ...
> >
> > > Just complementing: on media, we do this per video buffer (or
> > > per half video buffer). A typical use case on cameras is to have
> > > buffers transferred 30 times per second, if the video was streamed
> > > at 30 frames per second.
> >
> > IIRC some big use case for this hardware was transcoding so there was a
> > desire to just go at whatever rate the hardware could support as there
> > is no interactive user consuming the output as it is generated.
>
> Indeed, codecs could be used to just do transcoding, but I would
> expect it to be a border use case. See, as the chipsets implementing
> codecs are typically the ones used on mobiles, I would expect that
> the major use cases to be to watch audio and video and to participate
> on audio/video conferences.
>
> Going further, the codec API may end supporting not only transcoding
> (which is something that CPU can usually handle without too much
> processing) but also audio processing that may require more
> complex algorithms - even deep learning ones - like background noise
> removal, echo detection/removal, volume auto-gain, audio enhancement
> and such.
>
> On other words, the typical use cases will either have input
> or output being a physical hardware (microphone or speaker).
>

All, thanks for spending time to discuss, it seems we go back to
the start point of this topic again.

Our main request is that there is a hardware sample rate converter
on the chip, so users can use it in user space as a component like
software sample rate converter. It mostly may run as a gstreamer plugin.
so it is a memory to memory component.

I didn't find such API in ALSA for such purpose, the best option for this
in the kernel is the V4L2 memory to memory framework I found.
As Hans said it is well designed for memory to memory.

And I think audio is one of 'media'.  As I can see that part of Radio
function is in ALSA, part of Radio function is in V4L2. part of HDMI
function is in DRM, part of HDMI function is in ALSA...
So using V4L2 for audio is not new from this point of view.

Even now I still think V4L2 is the best option, but it looks like there
are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
a duplication of code (bigger duplication that just add audio support
in V4L2 I think).

Best regards
Shengjiu Wang.

> > > I would assume that, on an audio/video stream, the audio data
> > > transfer will be programmed to also happen on a regular interval.
> >
> > With audio the API is very much "wake userspace every Xms".
