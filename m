Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BA38B7CD9
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 18:29:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAA40DEC;
	Tue, 30 Apr 2024 18:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAA40DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714494541;
	bh=u27bGd4V0G96pi8D9gvQaaGAkmUp7bSeoFGhoO/A8XE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lVyxNDNrbhL1IuzRqUPK6UMa+eIxGovPuGGa5aK1TgcXC5UsRdnDZFEcZMnjNTxxu
	 UADIjQZSuzQP7PCXRtou79sEa0ATQZGcnr2Xuh5M0Y1BrvERMlIQIfQGidrwNhbkXl
	 DJ4LpxGgCDpm+XHv6MBY+1tzA6Te1qHskgfPTGuc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DD5EF805A8; Tue, 30 Apr 2024 18:28:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 259B7F805A0;
	Tue, 30 Apr 2024 18:28:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00DD7F80266; Tue, 30 Apr 2024 18:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A13FF8003C
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 18:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A13FF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OCiswKJN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 188D8614AE;
	Tue, 30 Apr 2024 16:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2C0C2BBFC;
	Tue, 30 Apr 2024 16:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714494479;
	bh=u27bGd4V0G96pi8D9gvQaaGAkmUp7bSeoFGhoO/A8XE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OCiswKJNOu0sfl6Oov4FuPcbIbdEIAUmabyt1qX3yut7X6jtOUtNez6dT2UiSY6rd
	 UmyD5qSfJyubO8kEyMTErYCZFFaSEvieHPnBf/O2A4ovxK9v590e5J/L2+RHeaDufu
	 3aLtZ/r7wpN+MjcKfycQd3ZruzmmING/5cJxi/GHSRw/rwljtTiMnDsS3wfXBynfUg
	 B4fyEoVTtsQN7u/8lKgsS41p9O3Kp948p3GmD1zd0hA8sXXiyo/YefgCGzFrpWqMJ/
	 rBedlv16kTuD1X+QNkL5ru7Fpfk26uvfe2RSEm1+a4lgLtmlZkk9sQ1OLC8jaC+EHZ
	 oFr1SVAafVguA==
Date: Tue, 30 Apr 2024 17:27:52 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Message-ID: <20240430172752.20ffcd56@sal.lan>
In-Reply-To: <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
	<20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
	<ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PAMC3CB3XXQPUXHQTHBHNDCQ2QULT76Z
X-Message-ID-Hash: PAMC3CB3XXQPUXHQTHBHNDCQ2QULT76Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PAMC3CB3XXQPUXHQTHBHNDCQ2QULT76Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Em Tue, 30 Apr 2024 23:46:03 +0900
Mark Brown <broonie@kernel.org> escreveu:

> On Tue, Apr 30, 2024 at 10:21:12AM +0200, Sebastian Fricke wrote:
> 
> > first of all thanks for all of this work and I am very sorry for only
> > emerging this late into the series, I sadly didn't notice it earlier.  
> 
> It might be worth checking out the discussion on earlier versions...
> 
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
> 
> The discussion around this originally was that all the audio APIs are
> very much centered around real time operations rather than completely
> async memory to memory operations and that it's not clear that it's
> worth reinventing the wheel simply for the sake of having things in
> ALSA when that's already pretty idiomatic for the media subsystem.  It
> wasn't the memory to memory bit per se, it was the disconnection from
> any timing.

The media subsystem is also centered around real time. Without real
time, you can't have a decent video conference system. Having
mem2mem transfers actually help reducing real time delays, as it 
avoids extra latency due to CPU congestion and/or data transfers
from/to userspace.

> 
> > So instead of hammering a driver into the wrong destination, I would
> > suggest bundling our forces and implementing a general memory-to-memory
> > framework that both the media and the audio subsystem can use, that
> > addresses the current shortcomings of the implementation and allows you
> > to upload the driver where it is supposed to be.  
> 
> That doesn't sound like an immediate solution to maintainer overload
> issues...  if something like this is going to happen the DRM solution
> does seem more general but I'm not sure the amount of stop energy is
> proportionate.

I don't think maintainer overload is the issue here. The main
point is to avoid a fork at the audio uAPI, plus the burden
of re-inventing the wheel with new codes for audio formats,
new documentation for them, etc.

Regards,
Mauro
