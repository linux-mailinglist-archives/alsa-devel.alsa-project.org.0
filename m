Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5848F8B6D4D
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 10:50:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87337825;
	Tue, 30 Apr 2024 10:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87337825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714467032;
	bh=778E1c8iAZG0ACA+zRws4wbilA1ZAtTXpb/AFIFHd3E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vpPdwrc22VXRM4amcFZAGu/3OTX/6ZpKYiX57LwH1FtbfLCKDTpVKYcDJ2l0y1fGC
	 PZT48x6tyYXGDzr3gq4+TiIRDmx97kfZuymJ5H5gGATPTVT6XruRjHsJArJmaGuziN
	 aTNYHw2i8OJOxRFxWZ2lVazrL0H/Fl+olMZU+U/A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29BE4F80570; Tue, 30 Apr 2024 10:49:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64325F805A0;
	Tue, 30 Apr 2024 10:49:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A99A3F80266; Tue, 30 Apr 2024 10:47:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CE71F8003C
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 10:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CE71F8003C
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 950A5CE0F88;
	Tue, 30 Apr 2024 08:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C809C2BBFC;
	Tue, 30 Apr 2024 08:47:14 +0000 (UTC)
Message-ID: <32d0c83c-4d0c-4d22-b2f1-d03d075f4898@xs4all.nl>
Date: Tue, 30 Apr 2024 10:47:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Content-Language: en-US, nl
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: sakari.ailus@iki.fi, tfiga@chromium.org, m.szyprowski@samsung.com,
 mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: A5TXBCHMULSTI2ILT5EFQJEFOZL3GS53
X-Message-ID-Hash: A5TXBCHMULSTI2ILT5EFQJEFOZL3GS53
X-MailFrom: SRS0=PY4m=MD=xs4all.nl=hverkuil@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A5TXBCHMULSTI2ILT5EFQJEFOZL3GS53/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 30/04/2024 10:21, Sebastian Fricke wrote:
> Hey Shengjiu,
> 
> first of all thanks for all of this work and I am very sorry for only
> emerging this late into the series, I sadly didn't notice it earlier.
> 
> I would like to voice a few concerns about the general idea of adding
> Audio support to the Media subsystem.
> 
> 1. The biggest objection is, that the Linux Kernel has a subsystem
> specifically targeted for audio devices, adding support for these
> devices in another subsystem are counterproductive as they work around
> the shortcomings of the audio subsystem while forcing support for a
> device into a subsystem that was never designed for such devices.
> Instead, the audio subsystem has to be adjusted to be able to support
> all of the required workflows, otherwise, the next audio driver with
> similar requirements will have to move to the media subsystem as well,
> the audio subsystem would then never experience the required change and
> soon we would have two audio subsystems.
> 
> 2. Closely connected to the previous objection, the media subsystem with
> its current staff of maintainers is overworked and barely capable of
> handling the workload, which includes an abundance of different devices
> from DVB, codecs, cameras, PCI devices, radio tuners, HDMI CEC, IR
> receivers, etc. Adding more device types to this matrix will make the
> situation worse and should only be done with a plan for how first to
> improve the current maintainer situation.
> 
> 3. By using the same framework and APIs as the video codecs, the audio
> codecs are going to cause extra work for the video codec developers and
> maintainers simply by occupying the same space that was orginally
> designed for the purpose of video only. Even if you try to not cause any
> extra stress the simple presence of the audio code in the codebase is
> going to cause restrictions.
> 
> The main issue here is that the audio subsystem doesn't provide a
> mem2mem framework and I would say you are in luck because the media
> subsystem has gathered a lot of shortcomings with its current
> implementation of the mem2mem framework over time, which is why a new
> implementation will be necessary anyway.
> 
> So instead of hammering a driver into the wrong destination, I would
> suggest bundling our forces and implementing a general memory-to-memory
> framework that both the media and the audio subsystem can use, that
> addresses the current shortcomings of the implementation and allows you
> to upload the driver where it is supposed to be.
> This is going to cause restrictions as well, like mentioned in the
> concern number 3, but with the difference that we can make a general
> plan for such a framework that accomodates lots of use cases and each
> subsystem can add their routines on top of the general framework.
> 
> Another possible alternative is to try and make the DRM scheduler more
> generally available, this scheduler is the most mature and in fact is
> very similar to what you and what the media devices need.
> Which again just shows how common your usecase actually is and how a
> general solution is the best long term solution.
> 
> Please notice that Daniel Almeida is currently working on something
> related to this:
> https://lore.kernel.org/linux-media/3F80AC0D-DCAA-4EDE-BF58-BB1369C7EDCA@collabora.com/T/#u
> 
> If the toplevel maintainers decide to add the patchset so be it, but I
> wanted to voice my concerns and also highlight that this is likely going
> to cause extra stress for the video codecs maintainers and the
> maintainers in general. We cannot spend a lot of time on audio codecs,
> as video codecs already fill up our available time sufficiently,
> so the use of the framework needs to be conservative and cause as little
> extra work as possible for the original use case of the framework.

I would really like to get the input of the audio maintainers on this.
Sebastian has a good point, especially with us being overworked :-)

Having a shared mem2mem framework would certainly be nice, on the other
hand, developing that will most likely take a substantial amount of time.

Perhaps it is possible to copy the current media v4l2-mem2mem.c and turn
it into an alsa-mem2mem.c? I really do not know enough about the alsa
subsystem to tell if that is possible.

While this driver is a rate converter, not an audio codec, the same
principles would apply to off-line audio codecs as well. And it is true
that we definitely do not want to support audio codecs in the media
subsystem.

Accepting this driver creates a precedent and would open the door for
audio codecs.

I may have been too hasty in saying yes to this, I did not consider
the wider implications for our workload and what it can lead to. I
sincerely apologize to Shengjiu Wang as it is no fun to end up in a
situation like this.

Regards,

	Hans
