Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFCC8C6771
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2024 15:35:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD913845;
	Wed, 15 May 2024 15:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD913845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715780148;
	bh=I+RNBBkXNRun6dwlq79VjFtLu9GasAAvP0Ewzfa3yQQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BsKyWfBoQrNUaXb38Foa8i1A1417o5dUrpKn44gzcaokmROY1L+GRqcwo1b9l0MFw
	 bxkEYHK+xe2EzLo2Kq4mEdzNUGe3oM6u/mWo8kJG8G/QB+I6hnbJeb/IPPIIZ0MmIg
	 4YWUKD/mTxjMYW+gaGlBG1Qoh4x2XCnBAmtPQJko=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93A5EF8059F; Wed, 15 May 2024 15:35:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25E30F8059F;
	Wed, 15 May 2024 15:35:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC936F80224; Wed, 15 May 2024 15:35:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09564F800F5
	for <alsa-devel@alsa-project.org>; Wed, 15 May 2024 15:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09564F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WYHbmRCJ
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-36c9c603b1dso728295ab.1
        for <alsa-devel@alsa-project.org>;
 Wed, 15 May 2024 06:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715780095; x=1716384895;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKaNiR2tHzqJJTEKvrwnceIlUex2fFxFPfEzvQnl9LY=;
        b=WYHbmRCJszKEDEGAR5kxB8F6uaFiakcuTDzWrH8eEJH+OCxRKh5RNbbHEbzFO0vPTG
         735j/Q54PFei88qCAIiKwC4DxkTrsrjB0WuyrtS0NIFqlmW6SLQrTKAOgibGS0qeEFsc
         60N/vSeVserhIH68Z9OPyIyWD68J1MLuMoizqUqxCAz8tZtA8XcIoCxVk5VwNyjOJHtZ
         pQDde5kJu+DbMUSp6INgODiwb9sI7hMF9U6Yagqc+GMmDtgubBk0Jakl/sw7ElhbkrwA
         0u3AM1k3OlA5/dIsw2bg3o8AcWDmz/1MytIGY2zV+y8RxZSMC0oLX3gQbWXqYC0W8tfp
         AQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715780095; x=1716384895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKaNiR2tHzqJJTEKvrwnceIlUex2fFxFPfEzvQnl9LY=;
        b=WWm1dQFdSq9pUpMY7z/1U2HpeJLCrAsVduaRU+IXPr341m0KrgGCbe6B66dHdFHWb9
         lVdteufF565//wu82TaJeu/o0Oi8A9PLaZAkl5TONAE3THGdEJtVB0xTso6S25yCoG3x
         kSzQQX+vk9jAE1v3moV+k0UPxEiSxs7tI3NSb7EyxjAMQ2BFNHOP9PvI0oq+yd/3As2b
         +c2LjdHsLGRPk+9l3HvWnmaWZ7Y0Icm2RWVkQUNq+99/Em+SpPy4718c9RSXcz/JLibf
         HogGyYXaApmWL+oZJHlWUATz/L5FgoShpoQVoQWkPKx6NcvT5tKyL+Lq8g8vpXRI2Mo2
         s7Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdrdzd+EYh/ASKjEprKoB6sG1fXAbsi8d6JduCYL9EfY37K6DM7ONmxHa8a16fk87IXUoEq5Vc+w/f40MPXK4P/40jBrkZFnIMxaI=
X-Gm-Message-State: AOJu0YzyBzws67Y24eE1lFizkEFFIZAuCm3CFPH34JnWYaRR3W/xNoLD
	bg/UmzWouOj3zMZU3LV5zZwMuXqsVt37PaoLarpSKDIgItGF5SZMRckHPjkPAUPgviiiyQuUOtn
	UkwAqy7Mv9JE0y8Nl/E/DzBzlZqc=
X-Google-Smtp-Source: 
 AGHT+IHfRlOUxQoum9oYFbcfElme0a98PvIrTeymgurRG3pRPNQgq34N6O3Htci09zrMSFYrILhaT785x6RkUCQvVK8=
X-Received: by 2002:a05:6e02:12cd:b0:36c:c536:80dd with SMTP id
 e9e14a558f8ab-36cc536824dmr181987035ab.11.1715780095030; Wed, 15 May 2024
 06:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
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
 <CAA+D8AMJKPVR99jzYCR5EsbMa8P95jQrDL=4ayYMuz+Cu1d2mQ@mail.gmail.com>
 <28d423b1-49d8-4180-8394-622b1afd9cd9@perex.cz>
 <850a80b2-d952-4c14-bd0b-98cb5a5c0233@perex.cz>
 <c5dbb765-8c93-4050-84e1-c0f63b43d6c2@xs4all.nl>
 <8a6f84ac-5813-4954-b852-84f5118e607c@perex.cz>
 <87o7975qcw.wl-tiwai@suse.de> <e63ec6c8-7da7-4b87-b7ff-a71ff12dcfc1@perex.cz>
In-Reply-To: <e63ec6c8-7da7-4b87-b7ff-a71ff12dcfc1@perex.cz>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 15 May 2024 21:34:43 +0800
Message-ID: 
 <CAA+D8AOj2ZkiSg2sXfQypg-xc4f8dMykENu5GoGMx6REGu+WBQ@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Brown <broonie@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
	sakari.ailus@iki.fi, tfiga@chromium.org, m.szyprowski@samsung.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 27WBDXC5HXS7WU7TQIP57BEOQ3LXMCUY
X-Message-ID-Hash: 27WBDXC5HXS7WU7TQIP57BEOQ3LXMCUY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/27WBDXC5HXS7WU7TQIP57BEOQ3LXMCUY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 15, 2024 at 6:46=E2=80=AFPM Jaroslav Kysela <perex@perex.cz> wr=
ote:
>
> On 15. 05. 24 12:19, Takashi Iwai wrote:
> > On Wed, 15 May 2024 11:50:52 +0200,
> > Jaroslav Kysela wrote:
> >>
> >> On 15. 05. 24 11:17, Hans Verkuil wrote:
> >>> Hi Jaroslav,
> >>>
> >>> On 5/13/24 13:56, Jaroslav Kysela wrote:
> >>>> On 09. 05. 24 13:13, Jaroslav Kysela wrote:
> >>>>> On 09. 05. 24 12:44, Shengjiu Wang wrote:
> >>>>>>>> mem2mem is just like the decoder in the compress pipeline. which=
 is
> >>>>>>>> one of the components in the pipeline.
> >>>>>>>
> >>>>>>> I was thinking of loopback with endpoints using compress streams,
> >>>>>>> without physical endpoint, something like:
> >>>>>>>
> >>>>>>> compress playback (to feed data from userspace) -> DSP (processin=
g) ->
> >>>>>>> compress capture (send data back to userspace)
> >>>>>>>
> >>>>>>> Unless I'm missing something, you should be able to process data =
as fast
> >>>>>>> as you can feed it and consume it in such case.
> >>>>>>>
> >>>>>>
> >>>>>> Actually in the beginning I tried this,  but it did not work well.
> >>>>>> ALSA needs time control for playback and capture, playback and cap=
ture
> >>>>>> needs to synchronize.  Usually the playback and capture pipeline i=
s
> >>>>>> independent in ALSA design,  but in this case, the playback and ca=
pture
> >>>>>> should synchronize, they are not independent.
> >>>>>
> >>>>> The core compress API core no strict timing constraints. You can ev=
entually0
> >>>>> have two half-duplex compress devices, if you like to have really i=
ndependent
> >>>>> mechanism. If something is missing in API, you can extend this API =
(like to
> >>>>> inform the user space that it's a producer/consumer processing with=
out any
> >>>>> relation to the real time). I like this idea.
> >>>>
> >>>> I was thinking more about this. If I am right, the mentioned use in =
gstreamer
> >>>> is supposed to run the conversion (DSP) job in "one shot" (can be ha=
ndled
> >>>> using one system call like blocking ioctl).  The goal is just to off=
load the
> >>>> CPU work to the DSP (co-processor). If there are no requirements for=
 the
> >>>> queuing, we can implement this ioctl in the compress ALSA API easily=
 using the
> >>>> data management through the dma-buf API. We can eventually define a =
new
> >>>> direction (enum snd_compr_direction) like SND_COMPRESS_CONVERT or so=
 to allow
> >>>> handle this new data scheme. The API may be extended later on real d=
emand, of
> >>>> course.
> >>>>
> >>>> Otherwise all pieces are already in the current ALSA compress API
> >>>> (capabilities, params, enumeration). The realtime controls may be cr=
eated
> >>>> using ALSA control API.
> >>>
> >>> So does this mean that Shengjiu should attempt to use this ALSA appro=
ach first?
> >>
> >> I've not seen any argument to use v4l2 mem2mem buffer scheme for this
> >> data conversion forcefully. It looks like a simple job and ALSA APIs
> >> may be extended for this simple purpose.
> >>
> >> Shengjiu, what are your requirements for gstreamer support? Would be a
> >> new blocking ioctl enough for the initial support in the compress ALSA
> >> API?
> >
> > If it works with compress API, it'd be great, yeah.
> > So, your idea is to open compress-offload devices for read and write,
> > then and let them convert a la batch jobs without timing control?
> >
> > For full-duplex usages, we might need some more extensions, so that
> > both read and write parameters can be synchronized.  (So far the
> > compress stream is a unidirectional, and the runtime buffer for a
> > single stream.)
> >
> > And the buffer management is based on the fixed size fragments.  I
> > hope this doesn't matter much for the intended operation?
>
> It's a question, if the standard I/O is really required for this case. My
> quick idea was to just implement a new "direction" for this job supportin=
g
> only one ioctl for the data processing which will execute the job in "one
> shot" at the moment. The I/O may be handled through dma-buf API (which se=
ems
> to be standard nowadays for this purpose and allows future chaining).
>
> So something like:
>
> struct dsp_job {
>     int source_fd;     /* dma-buf FD with source data - for dma_buf_get()=
 */
>     int target_fd;     /* dma-buf FD for target data - for dma_buf_get() =
*/
>     ... maybe some extra data size members here ...
>     ... maybe some special parameters here ...
> };
>
> #define SNDRV_COMPRESS_DSPJOB _IOWR('C', 0x60, struct dsp_job)
>
> This ioctl will be blocking (thus synced). My question is, if it's feasib=
le
> for gstreamer or not. For this particular case, if the rate conversion is
> implemented in software, it will block the gstreamer data processing, too=
.
>

Thanks.

I have several questions:
1.  Compress API alway binds to a sound card.  Can we avoid that?
     For ASRC, it is just one component,

2.  Compress API doesn't seem to support mmap().  Is this a problem
     for sending and getting data to/from the driver?

3. How does the user get output data from ASRC after each conversion?
   it should happen every period.

best regards
Shengjiu Wang.
