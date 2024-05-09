Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3818C0D98
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 11:37:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DC42E65;
	Thu,  9 May 2024 11:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DC42E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715247465;
	bh=cy7CWmqg8JaRX86mPUU3bC3ulyypV5pK2pkW2V9kha8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eFXM8yRtbQ4lSJ8XR3T4DgFAlwsWCrIQY2sjEsps1lOcmjP8M2QJPP1pUaRydK1BL
	 2uk6/29gN3PHUebzCy4DlCNojOtmvhuSfzHEbDQo9sAcVF7zFMfMlzpMA5OQt9GNOq
	 P7nCob64LX2kTQoUCL6OYwXW7WKcCx2zVmkvuWKc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC4B0F8057B; Thu,  9 May 2024 11:37:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F668F8057A;
	Thu,  9 May 2024 11:37:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D0C0F8049C; Thu,  9 May 2024 11:37:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47253F8024C
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 11:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47253F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EtXDRFmH
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-36c947ff642so2955925ab.2
        for <alsa-devel@alsa-project.org>;
 Thu, 09 May 2024 02:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715247409; x=1715852209;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icJF1CnJVBJloJSGMiGDeLLdcHlpsMMYY04rY+Lcxgw=;
        b=EtXDRFmHJZ/yYrQ9liSPGeaOg+/UfAGhijUzM5HGqoXtiV4zwZW4evbtOYwtLrlA/5
         ZzcW91oJxtnuuOiZs6Bpjk+Qf4o0NVe3165coyCQVqZMuNxWc/rs6m7HuGyEDEE42O7o
         FKS8wZcRn/wRpd1m+YkENGVeuK1tre3+v72uujujlMT7+iL1n4WgxuryHIK7mVWYOxg5
         J/p3gljeh0+kl8CrWnIcXJcE7pTHGAlZN3L5NoIifDc3eua5VpSSHBDti+uKWyLl7z9E
         9OBBtE7ccaBWKGDRa+5bAkmEikcZ5s8nKpeE2mPm/b9yR0nWBrJYa5mSNAkxYWSLAEGP
         WVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715247409; x=1715852209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icJF1CnJVBJloJSGMiGDeLLdcHlpsMMYY04rY+Lcxgw=;
        b=vVhBECcpOHsiZRMHIhDevIT5jMF39SbPypW/pApuTihYkvvUz7N6ICQHC+x/mA14JX
         /3lJEYwJmBd+l59acffAdQDZkXpQ04EEe2S6W5qKXym4w5CImm2AgRhWbV4h/3vJF7Gx
         rsh8GIQn/jeMGi4/rqd4QAulvRd0H60AFLPpCqcPYi7h/nr/wXNz3nuF5vvPuoUwmVqp
         ziEkKYts2d7dgcGhJeaUzYWx5Oj25MCdm0glyC8oe9KZEWFCW1A/MafoMvlEPBZ6tLeb
         t1ADe/wfDl+Yle+SO8I9NR6TJCbKlmloIWnLIZAlr8kNt4ceLEXPVSh8u/MRnfOXcf5K
         JYkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC/GQgpaTlb4ycGbk+rz5EMPzjVMwJ+n1xUFiV+0fawCUljtbAb2wk0Pjcx45g0WiVnAAd8RtnDHXOVHtt3/JuhB4QVxJygORy2a0=
X-Gm-Message-State: AOJu0Yxwt7cfkb5IFLTRkrdHbOx/bufE4sDb/I2D+HEbba1zSivd1sla
	dpQGb+3gwpdMsEp+6DVIxHvEA5N79yxxMbgvwm/nuqqv5/RNYOohEGEzcLRL3sQUvEAbUzbPi/v
	iNwBJZpye8JsY0mMzErnflWQ8Ydc=
X-Google-Smtp-Source: 
 AGHT+IHMQfSBHy/1AVL9IbmZYx6H7dVJ/ppx2qIzgSdZP+YkzczNvUqE8dIc975+bA41fUNr1I7kZKh8WGTA7uTz8Mg=
X-Received: by 2002:a05:6e02:168a:b0:36a:3c07:9caf with SMTP id
 e9e14a558f8ab-36caed59232mr53903665ab.30.1715247409368; Thu, 09 May 2024
 02:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
 <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
 <20240430172752.20ffcd56@sal.lan> <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
 <87sez0k661.wl-tiwai@suse.de> <20240502095956.0a8c5b26@sal.lan>
 <20240502102643.4ee7f6c2@sal.lan> <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
 <20240503094225.47fe4836@sal.lan>
 <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
 <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
In-Reply-To: <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 9 May 2024 17:36:38 +0800
Message-ID: 
 <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
	sakari.ailus@iki.fi, tfiga@chromium.org, m.szyprowski@samsung.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: RI5T55Y2QST6DVA2TXTZYLAYDV54XBAF
X-Message-ID-Hash: RI5T55Y2QST6DVA2TXTZYLAYDV54XBAF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RI5T55Y2QST6DVA2TXTZYLAYDV54XBAF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 8, 2024 at 4:14=E2=80=AFPM Amadeusz S=C5=82awi=C5=84ski
<amadeuszx.slawinski@linux.intel.com> wrote:
>
> On 5/8/2024 10:00 AM, Hans Verkuil wrote:
> > On 06/05/2024 10:49, Shengjiu Wang wrote:
> >> On Fri, May 3, 2024 at 4:42=E2=80=AFPM Mauro Carvalho Chehab <mchehab@=
kernel.org> wrote:
> >>>
> >>> Em Fri, 3 May 2024 10:47:19 +0900
> >>> Mark Brown <broonie@kernel.org> escreveu:
> >>>
> >>>> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrot=
e:
> >>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> >>>>
> >>>>>> There are still time control associated with it, as audio and vide=
o
> >>>>>> needs to be in sync. This is done by controlling the buffers size
> >>>>>> and could be fine-tuned by checking when the buffer transfer is do=
ne.
> >>>>
> >>>> ...
> >>>>
> >>>>> Just complementing: on media, we do this per video buffer (or
> >>>>> per half video buffer). A typical use case on cameras is to have
> >>>>> buffers transferred 30 times per second, if the video was streamed
> >>>>> at 30 frames per second.
> >>>>
> >>>> IIRC some big use case for this hardware was transcoding so there wa=
s a
> >>>> desire to just go at whatever rate the hardware could support as the=
re
> >>>> is no interactive user consuming the output as it is generated.
> >>>
> >>> Indeed, codecs could be used to just do transcoding, but I would
> >>> expect it to be a border use case. See, as the chipsets implementing
> >>> codecs are typically the ones used on mobiles, I would expect that
> >>> the major use cases to be to watch audio and video and to participate
> >>> on audio/video conferences.
> >>>
> >>> Going further, the codec API may end supporting not only transcoding
> >>> (which is something that CPU can usually handle without too much
> >>> processing) but also audio processing that may require more
> >>> complex algorithms - even deep learning ones - like background noise
> >>> removal, echo detection/removal, volume auto-gain, audio enhancement
> >>> and such.
> >>>
> >>> On other words, the typical use cases will either have input
> >>> or output being a physical hardware (microphone or speaker).
> >>>
> >>
> >> All, thanks for spending time to discuss, it seems we go back to
> >> the start point of this topic again.
> >>
> >> Our main request is that there is a hardware sample rate converter
> >> on the chip, so users can use it in user space as a component like
> >> software sample rate converter. It mostly may run as a gstreamer plugi=
n.
> >> so it is a memory to memory component.
> >>
> >> I didn't find such API in ALSA for such purpose, the best option for t=
his
> >> in the kernel is the V4L2 memory to memory framework I found.
> >> As Hans said it is well designed for memory to memory.
> >>
> >> And I think audio is one of 'media'.  As I can see that part of Radio
> >> function is in ALSA, part of Radio function is in V4L2. part of HDMI
> >> function is in DRM, part of HDMI function is in ALSA...
> >> So using V4L2 for audio is not new from this point of view.
> >>
> >> Even now I still think V4L2 is the best option, but it looks like ther=
e
> >> are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
> >> a duplication of code (bigger duplication that just add audio support
> >> in V4L2 I think).
> >
> > After reading this thread I still believe that the mem2mem framework is
> > a reasonable option, unless someone can come up with a method that is
> > easy to implement in the alsa subsystem. From what I can tell from this
> > discussion no such method exists.
> >
>
> Hi,
>
> my main question would be how is mem2mem use case different from
> loopback exposing playback and capture frontends in user space with DSP
> (or other piece of HW) in the middle?
>
I think loopback has a timing control,  user need to feed data to playback =
at a
fixed time and get data from capture at a fixed time.  Otherwise there
is xrun in
playback and capture.

mem2mem case: there is no such timing control,  user feeds data to it
then it generates output,  if user doesn't feed data, there is no xrun.
but mem2mem is just one of the components in the playback or capture
pipeline, overall there is time control for whole pipeline,

Best regards
Shengjiu Wang

> Amadeusz
>
