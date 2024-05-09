Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B66EE8C0E54
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 12:44:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6954DEC7;
	Thu,  9 May 2024 12:44:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6954DEC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715251497;
	bh=ALKJ9if8SMqpg8avRAb+V90+7Tr+oiNFq36asciKBCc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=amZ3+HnTF2PKu/ejZPR+wFCroYw7XUEii2eqQeI7kQ/ZFVTrFID5BIHwQSETlABBQ
	 DLl5gW3K+jB8DehPN/jvrFfIXMWq8+pJZQVzWn9crnG/JLnFlW3ZCiOVRZm6PuI7A8
	 XZl1azQ0FdqOYwrgNxTHGOiZ8x2c6fwaljankx84=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60E7FF800E2; Thu,  9 May 2024 12:44:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6898FF805A0;
	Thu,  9 May 2024 12:44:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 466E0F80423; Thu,  9 May 2024 12:44:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 130E2F800E2
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 12:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 130E2F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M8t9Pdxx
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-36c946e9292so3162755ab.2
        for <alsa-devel@alsa-project.org>;
 Thu, 09 May 2024 03:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715251455; x=1715856255;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCRj3t+xdNp1rsUvPmVB9uy83J7LGPcYV6vSNcPVNyA=;
        b=M8t9Pdxx2LT6cTxY1E8a0tYsvGi5GLkZdmyq4D2KyZYbm27pRAroc/zt+YnbKzUWgo
         boU94y6GHjesGektJIn1uMIiKb82k3vit4W5KzExj2VOUBb9RBePAu9qNKEzMrAZ0nIQ
         IEi2SdfW/PNlJhnsadHQPWgTVYee92DIkDtaGggbIhk9yTARdEmA5Ds4v3Xtvr3NokLB
         M7CoBm3/6inPWsVLQiiimE++FNle25NM1LCWiAej4wkUhWOkpJauKhVdXlJ04Oxeov6L
         CAHgKspoCJFnX/Tx3PMEcrShruIQZG/kES+RSaqcDJ3xvKyRqIL00WmJlA2f9aQ20NRM
         pV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715251455; x=1715856255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCRj3t+xdNp1rsUvPmVB9uy83J7LGPcYV6vSNcPVNyA=;
        b=AX2ngwmfuw0G59FngQ5kTKt+3xLLw1vwIkapjMd5LcObTmlJYKRP+4UO6xZQkLXdZg
         SXlut80BHSTXkBt7hNXP4md0HSuwh+PW0JbxWOyFvqH8TytVrmIX6yNKfX+ubmj0fIy/
         prubAeqWrYa4/a8L8uzaJKHj9zTcm6mpGSs8Iq4ey78O2sLTsffIusfd/jj2BhyLuw59
         FCPt4o1JunCS6Mx2BNWVYkQ8r1ciuSNpaZf4qeqE1lPU0Yo5BfM15KRo89tw+fsF0yyk
         FhVdyzQOBhsimrCKI2Rm6q3vd+LNtFGjFbAjygof+PNSErpa9JUtDI2ouc2LvRGukHBt
         mQPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZYScedbkm4RZAg+J+k5WXZVEJpK25IEdo+TT2QTw/0E9Ls68tEOr1ao4hAfZEh1QtEIpzJas4rnJjqM72L4AXxNVz//Py6AOiJVI=
X-Gm-Message-State: AOJu0Yx8ft/R+rp1CPlRr/v38liVyNNf23wf8OBtqb35MExmiqzeovBS
	5P6QggsHm5VIxwTqAOOCQx+tOAWi5VS8xinwVPkTPNvcRPyuvUrW7We171NPoViEK+9UM7j0vdj
	6UAk/p13UjY7/3wbY2dR4u/tM6Vo=
X-Google-Smtp-Source: 
 AGHT+IEi/mVwQ3GL+NyJ0D7UrdEjzf34Nyjn6VriSq2HIBSrDOCD/y/fvG9wSq1Mnww5djhfR6VpTbDKb6eS+PLmC44=
X-Received: by 2002:a05:6e02:1a08:b0:36c:a46:e018 with SMTP id
 e9e14a558f8ab-36caed5abd2mr53372115ab.24.1715251455116; Thu, 09 May 2024
 03:44:15 -0700 (PDT)
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
 <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
 <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
 <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
 <2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com>
In-Reply-To: <2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 9 May 2024 18:44:03 +0800
Message-ID: 
 <CAA+D8AMJKPVR99jzYCR5EsbMa8P95jQrDL=4ayYMuz+Cu1d2mQ@mail.gmail.com>
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
Message-ID-Hash: UWFSU6JNUI4PJQI7T2CXNMW2X7ERHG4F
X-Message-ID-Hash: UWFSU6JNUI4PJQI7T2CXNMW2X7ERHG4F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UWFSU6JNUI4PJQI7T2CXNMW2X7ERHG4F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 9, 2024 at 6:28=E2=80=AFPM Amadeusz S=C5=82awi=C5=84ski
<amadeuszx.slawinski@linux.intel.com> wrote:
>
> On 5/9/2024 12:12 PM, Shengjiu Wang wrote:
> > On Thu, May 9, 2024 at 5:50=E2=80=AFPM Amadeusz S=C5=82awi=C5=84ski
> > <amadeuszx.slawinski@linux.intel.com> wrote:
> >>
> >> On 5/9/2024 11:36 AM, Shengjiu Wang wrote:
> >>> On Wed, May 8, 2024 at 4:14=E2=80=AFPM Amadeusz S=C5=82awi=C5=84ski
> >>> <amadeuszx.slawinski@linux.intel.com> wrote:
> >>>>
> >>>> On 5/8/2024 10:00 AM, Hans Verkuil wrote:
> >>>>> On 06/05/2024 10:49, Shengjiu Wang wrote:
> >>>>>> On Fri, May 3, 2024 at 4:42=E2=80=AFPM Mauro Carvalho Chehab <mche=
hab@kernel.org> wrote:
> >>>>>>>
> >>>>>>> Em Fri, 3 May 2024 10:47:19 +0900
> >>>>>>> Mark Brown <broonie@kernel.org> escreveu:
> >>>>>>>
> >>>>>>>> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab =
wrote:
> >>>>>>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> >>>>>>>>
> >>>>>>>>>> There are still time control associated with it, as audio and =
video
> >>>>>>>>>> needs to be in sync. This is done by controlling the buffers s=
ize
> >>>>>>>>>> and could be fine-tuned by checking when the buffer transfer i=
s done.
> >>>>>>>>
> >>>>>>>> ...
> >>>>>>>>
> >>>>>>>>> Just complementing: on media, we do this per video buffer (or
> >>>>>>>>> per half video buffer). A typical use case on cameras is to hav=
e
> >>>>>>>>> buffers transferred 30 times per second, if the video was strea=
med
> >>>>>>>>> at 30 frames per second.
> >>>>>>>>
> >>>>>>>> IIRC some big use case for this hardware was transcoding so ther=
e was a
> >>>>>>>> desire to just go at whatever rate the hardware could support as=
 there
> >>>>>>>> is no interactive user consuming the output as it is generated.
> >>>>>>>
> >>>>>>> Indeed, codecs could be used to just do transcoding, but I would
> >>>>>>> expect it to be a border use case. See, as the chipsets implement=
ing
> >>>>>>> codecs are typically the ones used on mobiles, I would expect tha=
t
> >>>>>>> the major use cases to be to watch audio and video and to partici=
pate
> >>>>>>> on audio/video conferences.
> >>>>>>>
> >>>>>>> Going further, the codec API may end supporting not only transcod=
ing
> >>>>>>> (which is something that CPU can usually handle without too much
> >>>>>>> processing) but also audio processing that may require more
> >>>>>>> complex algorithms - even deep learning ones - like background no=
ise
> >>>>>>> removal, echo detection/removal, volume auto-gain, audio enhancem=
ent
> >>>>>>> and such.
> >>>>>>>
> >>>>>>> On other words, the typical use cases will either have input
> >>>>>>> or output being a physical hardware (microphone or speaker).
> >>>>>>>
> >>>>>>
> >>>>>> All, thanks for spending time to discuss, it seems we go back to
> >>>>>> the start point of this topic again.
> >>>>>>
> >>>>>> Our main request is that there is a hardware sample rate converter
> >>>>>> on the chip, so users can use it in user space as a component like
> >>>>>> software sample rate converter. It mostly may run as a gstreamer p=
lugin.
> >>>>>> so it is a memory to memory component.
> >>>>>>
> >>>>>> I didn't find such API in ALSA for such purpose, the best option f=
or this
> >>>>>> in the kernel is the V4L2 memory to memory framework I found.
> >>>>>> As Hans said it is well designed for memory to memory.
> >>>>>>
> >>>>>> And I think audio is one of 'media'.  As I can see that part of Ra=
dio
> >>>>>> function is in ALSA, part of Radio function is in V4L2. part of HD=
MI
> >>>>>> function is in DRM, part of HDMI function is in ALSA...
> >>>>>> So using V4L2 for audio is not new from this point of view.
> >>>>>>
> >>>>>> Even now I still think V4L2 is the best option, but it looks like =
there
> >>>>>> are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
> >>>>>> a duplication of code (bigger duplication that just add audio supp=
ort
> >>>>>> in V4L2 I think).
> >>>>>
> >>>>> After reading this thread I still believe that the mem2mem framewor=
k is
> >>>>> a reasonable option, unless someone can come up with a method that =
is
> >>>>> easy to implement in the alsa subsystem. From what I can tell from =
this
> >>>>> discussion no such method exists.
> >>>>>
> >>>>
> >>>> Hi,
> >>>>
> >>>> my main question would be how is mem2mem use case different from
> >>>> loopback exposing playback and capture frontends in user space with =
DSP
> >>>> (or other piece of HW) in the middle?
> >>>>
> >>> I think loopback has a timing control,  user need to feed data to pla=
yback at a
> >>> fixed time and get data from capture at a fixed time.  Otherwise ther=
e
> >>> is xrun in
> >>> playback and capture.
> >>>
> >>> mem2mem case: there is no such timing control,  user feeds data to it
> >>> then it generates output,  if user doesn't feed data, there is no xru=
n.
> >>> but mem2mem is just one of the components in the playback or capture
> >>> pipeline, overall there is time control for whole pipeline,
> >>>
> >>
> >> Have you looked at compress streams? If I remember correctly they are
> >> not tied to time due to the fact that they can pass data in arbitrary
> >> formats?
> >>
> >> From:
> >> https://docs.kernel.org/sound/designs/compress-offload.html
> >>
> >> "No notion of underrun/overrun. Since the bytes written are compressed
> >> in nature and data written/read doesn=E2=80=99t translate directly to =
rendered
> >> output in time, this does not deal with underrun/overrun and maybe dea=
lt
> >> in user-library"
> >
> > I checked the compress stream. mem2mem case is different with
> > compress-offload case
> >
> > compress-offload case is a full pipeline,  the user sends a compress
> > stream to it, then DSP decodes it and renders it to the speaker in real
> > time.
> >
> > mem2mem is just like the decoder in the compress pipeline. which is
> > one of the components in the pipeline.
>
> I was thinking of loopback with endpoints using compress streams,
> without physical endpoint, something like:
>
> compress playback (to feed data from userspace) -> DSP (processing) ->
> compress capture (send data back to userspace)
>
> Unless I'm missing something, you should be able to process data as fast
> as you can feed it and consume it in such case.
>

Actually in the beginning I tried this,  but it did not work well.
ALSA needs time control for playback and capture, playback and capture
needs to synchronize.  Usually the playback and capture pipeline is
independent in ALSA design,  but in this case, the playback and capture
should synchronize, they are not independent.

Best regards
Shengjiu Wang

> Amadeusz
