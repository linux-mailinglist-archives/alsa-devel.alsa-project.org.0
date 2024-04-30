Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 603198B779C
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 15:53:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E235E14E1;
	Tue, 30 Apr 2024 15:53:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E235E14E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714485210;
	bh=Uko8HS1g2ylxAZcYhzNrJijEd2kEOyt+s0j1KcTMN7k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G1nmX5Cpas0nxCWd5eDOtGx5p7OQDtZEKUopeZOgJslUy6tpBX/lPaUeFyKEqMrdv
	 b4Aaqc5AwpqAxB91wNW4tP67Iek8pORaY/ARnMEDFb+JXhrekVrvEdB1zwinCL52eO
	 h7JHGhpSKc70UNNbP2zbUuj+jpjUjQX/gZDjQVZw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73DF8F805A0; Tue, 30 Apr 2024 15:52:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEC43F805AB;
	Tue, 30 Apr 2024 15:52:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFFC0F804F2; Tue, 30 Apr 2024 15:52:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE401F8028D
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 15:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE401F8028D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tlcO3h30
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55C71615DE;
	Tue, 30 Apr 2024 13:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93A8C2BBFC;
	Tue, 30 Apr 2024 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714485165;
	bh=Uko8HS1g2ylxAZcYhzNrJijEd2kEOyt+s0j1KcTMN7k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tlcO3h30P7SZ7oSLctRoaEeNW1W7XBgT+wj+zgU83zv/UWcg/7/p2i8L0SUN4QGMA
	 h06L7zGqa0MtBw4/BxmQiM433Pb/Sg/OY8/hNd4H+Gkjvvk5ZGi2xZtHpiuqf+BuG3
	 7h3k0+YgBpAiCm+vI7kvSvfUjxLl7o38tWkhbCGoerRwxpSotDKbsGdzhrQ3HFOOTx
	 nyX5qR2eM3/crVpKtjO74t24Rsd2A4TbYY8fcDObkUOMZ6106Yk7mG5PV9ySvLEjOs
	 EbHpa2N9KkyXhXAGZGa1GJ5+PPO4GX29Qo3XFEzfkV5dBfjUN/2ArJTtJiav5UrM66
	 tznsKICFix6nA==
Date: Tue, 30 Apr 2024 14:52:36 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi, tfiga@chromium.org,
 m.szyprowski@samsung.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Message-ID: <20240430145236.36febb03@sal.lan>
In-Reply-To: <32d0c83c-4d0c-4d22-b2f1-d03d075f4898@xs4all.nl>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
	<20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
	<32d0c83c-4d0c-4d22-b2f1-d03d075f4898@xs4all.nl>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Z7BYO5C5HC3X23TV24GE6EDZ4OAHKN3F
X-Message-ID-Hash: Z7BYO5C5HC3X23TV24GE6EDZ4OAHKN3F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z7BYO5C5HC3X23TV24GE6EDZ4OAHKN3F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Em Tue, 30 Apr 2024 10:47:13 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 30/04/2024 10:21, Sebastian Fricke wrote:
> > Hey Shengjiu,
> > 
> > first of all thanks for all of this work and I am very sorry for only
> > emerging this late into the series, I sadly didn't notice it earlier.
> > 
> > I would like to voice a few concerns about the general idea of adding
> > Audio support to the Media subsystem.
> > 
> > 1. The biggest objection is, that the Linux Kernel has a subsystem
> > specifically targeted for audio devices, adding support for these
> > devices in another subsystem are counterproductive as they work around
> > the shortcomings of the audio subsystem while forcing support for a
> > device into a subsystem that was never designed for such devices.
> > Instead, the audio subsystem has to be adjusted to be able to support
> > all of the required workflows, otherwise, the next audio driver with
> > similar requirements will have to move to the media subsystem as well,
> > the audio subsystem would then never experience the required change and
> > soon we would have two audio subsystems.
> > 
> > 2. Closely connected to the previous objection, the media subsystem with
> > its current staff of maintainers is overworked and barely capable of
> > handling the workload, which includes an abundance of different devices
> > from DVB, codecs, cameras, PCI devices, radio tuners, HDMI CEC, IR
> > receivers, etc. Adding more device types to this matrix will make the
> > situation worse and should only be done with a plan for how first to
> > improve the current maintainer situation.
> > 
> > 3. By using the same framework and APIs as the video codecs, the audio
> > codecs are going to cause extra work for the video codec developers and
> > maintainers simply by occupying the same space that was orginally
> > designed for the purpose of video only. Even if you try to not cause any
> > extra stress the simple presence of the audio code in the codebase is
> > going to cause restrictions.
> > 
> > The main issue here is that the audio subsystem doesn't provide a
> > mem2mem framework and I would say you are in luck because the media
> > subsystem has gathered a lot of shortcomings with its current
> > implementation of the mem2mem framework over time, which is why a new
> > implementation will be necessary anyway.
> > 
> > So instead of hammering a driver into the wrong destination, I would
> > suggest bundling our forces and implementing a general memory-to-memory
> > framework that both the media and the audio subsystem can use, that
> > addresses the current shortcomings of the implementation and allows you
> > to upload the driver where it is supposed to be.
> > This is going to cause restrictions as well, like mentioned in the
> > concern number 3, but with the difference that we can make a general
> > plan for such a framework that accomodates lots of use cases and each
> > subsystem can add their routines on top of the general framework.
> > 
> > Another possible alternative is to try and make the DRM scheduler more
> > generally available, this scheduler is the most mature and in fact is
> > very similar to what you and what the media devices need.
> > Which again just shows how common your usecase actually is and how a
> > general solution is the best long term solution.
> > 
> > Please notice that Daniel Almeida is currently working on something
> > related to this:
> > https://lore.kernel.org/linux-media/3F80AC0D-DCAA-4EDE-BF58-BB1369C7EDCA@collabora.com/T/#u
> > 
> > If the toplevel maintainers decide to add the patchset so be it, but I
> > wanted to voice my concerns and also highlight that this is likely going
> > to cause extra stress for the video codecs maintainers and the
> > maintainers in general. We cannot spend a lot of time on audio codecs,
> > as video codecs already fill up our available time sufficiently,
> > so the use of the framework needs to be conservative and cause as little
> > extra work as possible for the original use case of the framework.  
> 
> I would really like to get the input of the audio maintainers on this.
> Sebastian has a good point, especially with us being overworked :-)
> 
> Having a shared mem2mem framework would certainly be nice, on the other
> hand, developing that will most likely take a substantial amount of time.
> 
> Perhaps it is possible to copy the current media v4l2-mem2mem.c and turn
> it into an alsa-mem2mem.c? I really do not know enough about the alsa
> subsystem to tell if that is possible.
> 
> While this driver is a rate converter, not an audio codec, the same
> principles would apply to off-line audio codecs as well. And it is true
> that we definitely do not want to support audio codecs in the media
> subsystem.
> 
> Accepting this driver creates a precedent and would open the door for
> audio codecs.
> 
> I may have been too hasty in saying yes to this, I did not consider
> the wider implications for our workload and what it can lead to. I
> sincerely apologize to Shengjiu Wang as it is no fun to end up in a
> situation like this.

I agree with both Sebastian and Hans here: media devices always had
audio streams, even on old PCI analog TV devices like bttv. There
are even some devices like the ones based on usb em28xx that contains
an AC97 chip on it. The decision was always to have audio supported by
ALSA APIs/subsystem, as otherwise we'll end duplicating code and 
reinventing the wheel with new incompatible APIs for audio in and outside
media, creating unneeded complexity, which will end being reflected on
userspace as well.

So, IMO it makes a lot more sense to place audio codecs and processor
blocks inside ALSA, probably as part of ALSA SOF, if possible.

Hans suggestion of forking v4l2-mem2mem.c on ALSA seems a good
starting point. Also, moving the DRM mem2mem functionality to a 
core library that could be re-used by the three subsystems sounds
a good idea, but I suspect that a change like that could be more
time-consuming.

Regards,
Mauro
