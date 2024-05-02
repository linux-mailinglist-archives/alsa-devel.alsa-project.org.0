Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA0B8B97B3
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2024 11:27:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2D4FE67;
	Thu,  2 May 2024 11:27:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2D4FE67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714642061;
	bh=oY0Gx6If0++vxj2+S3fuQcurWamwddWAm81q/kUiGjU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fvyZ/cG4pG0VeO7nk7UpElxuIMdNWSjFmq5Su9ahcaS1vqnNGWX4ePsm+vnqhq9BN
	 j4fB68mQBaLukDsToug/9PuTTESVODvOOW3ySu2oLkTHxktcIABky995ogv5+UL22T
	 Ivbedf0HrU75BB5fC29XPDDEBdoP3Q0hzctFfV2M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 594DEF805AC; Thu,  2 May 2024 11:27:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3EF1F805A8;
	Thu,  2 May 2024 11:27:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 404BEF80266; Thu,  2 May 2024 11:27:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67863F800E2
	for <alsa-devel@alsa-project.org>; Thu,  2 May 2024 11:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67863F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=McJijZSx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B517D60B37;
	Thu,  2 May 2024 09:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5136C113CC;
	Thu,  2 May 2024 09:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714642011;
	bh=oY0Gx6If0++vxj2+S3fuQcurWamwddWAm81q/kUiGjU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=McJijZSx4HT+pc7PIROstYqYLQebx7DArWvPe7VtiB22W2Z2hrBh6JYmgReg3tcPh
	 rEit1+urFYR37wL69ajCwUD/O9dEmOYuy6VmVvVGv96jfZMeb4NLIFclQpizbhmL3h
	 h/xqI/qfoR4PtQHxRYG+CvVXfRhpzALSleYF1DloR3/lUhOkSWGiI0jF5hKPiSMFY6
	 kki0XkU3bLZzR8hwfiTIYwCDaPiaY+BB6OFzOxMLu5AXceZbkqGpiixP3urNvdddZO
	 PSFVgtt2q1oX4NlW5QGvoldGjXft3T+UV1L02sQrhbW1/loHrVlIAZhj2jci9WudSq
	 url8vW7vdYLvQ==
Date: Thu, 2 May 2024 10:26:43 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
 m.szyprowski@samsung.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Message-ID: <20240502102643.4ee7f6c2@sal.lan>
In-Reply-To: <20240502095956.0a8c5b26@sal.lan>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
	<20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
	<ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
	<20240430172752.20ffcd56@sal.lan>
	<ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
	<87sez0k661.wl-tiwai@suse.de>
	<20240502095956.0a8c5b26@sal.lan>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YVXNG2WHOS6P3UPJDFZBOK3JVC67QFOX
X-Message-ID-Hash: YVXNG2WHOS6P3UPJDFZBOK3JVC67QFOX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YVXNG2WHOS6P3UPJDFZBOK3JVC67QFOX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Em Thu, 2 May 2024 09:59:56 +0100
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> Em Thu, 02 May 2024 09:46:14 +0200
> Takashi Iwai <tiwai@suse.de> escreveu:
> 
> > On Wed, 01 May 2024 03:56:15 +0200,
> > Mark Brown wrote:
> > > 
> > > On Tue, Apr 30, 2024 at 05:27:52PM +0100, Mauro Carvalho Chehab wrote:  
> > > > Mark Brown <broonie@kernel.org> escreveu:  
> > > > > On Tue, Apr 30, 2024 at 10:21:12AM +0200, Sebastian Fricke wrote:  
> > >   
> > > > > The discussion around this originally was that all the audio APIs are
> > > > > very much centered around real time operations rather than completely  
> > >   
> > > > The media subsystem is also centered around real time. Without real
> > > > time, you can't have a decent video conference system. Having
> > > > mem2mem transfers actually help reducing real time delays, as it 
> > > > avoids extra latency due to CPU congestion and/or data transfers
> > > > from/to userspace.  
> > > 
> > > Real time means strongly tied to wall clock times rather than fast - the
> > > issue was that all the ALSA APIs are based around pushing data through
> > > the system based on a clock.
> > >   
> > > > > That doesn't sound like an immediate solution to maintainer overload
> > > > > issues...  if something like this is going to happen the DRM solution
> > > > > does seem more general but I'm not sure the amount of stop energy is
> > > > > proportionate.  
> > >   
> > > > I don't think maintainer overload is the issue here. The main
> > > > point is to avoid a fork at the audio uAPI, plus the burden
> > > > of re-inventing the wheel with new codes for audio formats,
> > > > new documentation for them, etc.  
> > > 
> > > I thought that discussion had been had already at one of the earlier
> > > versions?  TBH I've not really been paying attention to this since the
> > > very early versions where I raised some similar "why is this in media"
> > > points and I thought everyone had decided that this did actually make
> > > sense.  
> > 
> > Yeah, it was discussed in v1 and v2 threads, e.g.
> >   https://patchwork.kernel.org/project/linux-media/cover/1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com/#25485573
> > 
> > My argument at that time was how the operation would be, and the point
> > was that it'd be a "batch-like" operation via M2M without any timing
> > control.  It'd be a very special usage for for ALSA, and if any, it'd
> > be hwdep -- that is a very hardware-specific API implementation -- or
> > try compress-offload API, which looks dubious.
> > 
> > OTOH, the argument was that there is already a framework for M2M in
> > media API and that also fits for the batch-like operation, too.  So
> > was the thread evolved until now.
> 
> M2M transfers are not a hardware-specific API, and such kind of
> transfers is not new either. Old media devices like bttv have
> internally a way to do PCI2PCI transfers, allowing media streams
> to be transferred directly without utilizing CPU. The media driver
> supports it for video, as this made a huge difference of performance
> back then.
> 
> On embedded world, this is a pretty common scenario: different media
> IP blocks can communicate with each other directly via memory. This
> can happen for video capture, video display and audio.
> 
> With M2M, most of the control is offloaded to the hardware.
> 
> There are still time control associated with it, as audio and video
> needs to be in sync. This is done by controlling the buffers size 
> and could be fine-tuned by checking when the buffer transfer is done.
> 
> On media, M2M buffer transfers are started via VIDIOC_QBUF,
> which is a request to do a frame transfer. A similar ioctl
> (VIDIOC_DQBUF) is used to monitor when the hardware finishes
> transfering the buffer. On other words, the CPU is responsible
> for time control.

Just complementing: on media, we do this per video buffer (or
per half video buffer). A typical use case on cameras is to have
buffers transferred 30 times per second, if the video was streamed 
at 30 frames per second. 

I would assume that, on an audio/video stream, the audio data
transfer will be programmed to also happen on a regular interval.

So, if the video stream is programmed to a 30 frames per second
rate, I would assume that the associated audio stream will also be
programmed to be grouped into 30 data transfers per second. On such
scenario, if the audio is sampled at 48 kHZ, it means that:

1) each M2M transfer commanded by CPU will copy 1600 samples;
2) the time between each sample will remain 1/48000;
3) a notification event telling that 1600 samples were transferred
   will be generated when the last sample happens;
4) CPU will do time control by looking at the notification events.

> On other words, this is still real time. The main difference
> from a "sync" transfer is that the CPU doesn't need to copy data
> from/to different devices, as such operation is offloaded to the
> hardware.
> 
> Regards,
> Mauro
