Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 086598BA913
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 10:43:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 384A7A4A;
	Fri,  3 May 2024 10:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 384A7A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714725804;
	bh=MET1Qlb3RINT8Dmpmt3ZV/bGlWPZcEfr50B9DIeHIIU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HSO4CDR/xPtJJvy3zX8Dt0dvTBAb8zrVnOtyCkElm4EkyIjc0tun79LjCCxqZayll
	 4zrNoK4IaXUGln/7k3UXNZaX3W21U54+7ibNdF+IZgA5x90UDZ3LEsQxrpPlcy1mHR
	 sVK7iMEVtLx75FvsU6YndtM6fQEUnar2CEJCJ/1Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE804F80570; Fri,  3 May 2024 10:42:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43A3AF80570;
	Fri,  3 May 2024 10:42:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D69BF80266; Fri,  3 May 2024 10:42:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97F72F800E2
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 10:42:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97F72F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JIt7IELV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E42F61CDF;
	Fri,  3 May 2024 08:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B42C116B1;
	Fri,  3 May 2024 08:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714725753;
	bh=MET1Qlb3RINT8Dmpmt3ZV/bGlWPZcEfr50B9DIeHIIU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JIt7IELVzP41blGAllJ9i8j/HS//Q/20ZO9vPGBh8jb46CD6lFpzHqh6QbE6VgOY2
	 rJ0dQ5I+IE0MHPV9U+hn8BD4+lTOpcGpli29Gue6Q+GNcsz3a7uW5wTQIFIANNh+Ih
	 c90B5GxcJU4Cen1jbpOB4Zq19rfVUU6XKR22jYI1ONTpok0fBVYIjBsIR3QRN0ahOE
	 EVgqqfIW5tpxj3/tw0fzx3mKx7ybFh3xANShJf3fLXLHHirdNjAi6igogfygNFNiq/
	 SpV2vQXcG/lvkopazpgf9f7UFEovF26N5XMXxRn63f9Z9ZxfaOK5OjI2Mh6NBcdWM8
	 01uL84MAgn/gw==
Date: Fri, 3 May 2024 09:42:25 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
 m.szyprowski@samsung.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Message-ID: <20240503094225.47fe4836@sal.lan>
In-Reply-To: <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
	<20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
	<ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
	<20240430172752.20ffcd56@sal.lan>
	<ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
	<87sez0k661.wl-tiwai@suse.de>
	<20240502095956.0a8c5b26@sal.lan>
	<20240502102643.4ee7f6c2@sal.lan>
	<ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OXW5USYSBPERSYG7GWPUTH4SZQSFOS53
X-Message-ID-Hash: OXW5USYSBPERSYG7GWPUTH4SZQSFOS53
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OXW5USYSBPERSYG7GWPUTH4SZQSFOS53/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Em Fri, 3 May 2024 10:47:19 +0900
Mark Brown <broonie@kernel.org> escreveu:

> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrote:
> > Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:  
> 
> > > There are still time control associated with it, as audio and video
> > > needs to be in sync. This is done by controlling the buffers size 
> > > and could be fine-tuned by checking when the buffer transfer is done.  
> 
> ...
> 
> > Just complementing: on media, we do this per video buffer (or
> > per half video buffer). A typical use case on cameras is to have
> > buffers transferred 30 times per second, if the video was streamed 
> > at 30 frames per second.   
> 
> IIRC some big use case for this hardware was transcoding so there was a
> desire to just go at whatever rate the hardware could support as there
> is no interactive user consuming the output as it is generated.

Indeed, codecs could be used to just do transcoding, but I would
expect it to be a border use case. See, as the chipsets implementing 
codecs are typically the ones used on mobiles, I would expect that
the major use cases to be to watch audio and video and to participate
on audio/video conferences.

Going further, the codec API may end supporting not only transcoding
(which is something that CPU can usually handle without too much
processing) but also audio processing that may require more 
complex algorithms - even deep learning ones - like background noise
removal, echo detection/removal, volume auto-gain, audio enhancement
and such.

On other words, the typical use cases will either have input
or output being a physical hardware (microphone or speaker).

> > I would assume that, on an audio/video stream, the audio data
> > transfer will be programmed to also happen on a regular interval.  
> 
> With audio the API is very much "wake userspace every Xms".
