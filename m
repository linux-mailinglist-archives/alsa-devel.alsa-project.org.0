Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E9F8225E0
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 01:18:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 908DAE73;
	Wed,  3 Jan 2024 01:18:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 908DAE73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704241112;
	bh=hSQCNLhgdrUSuSOnKYd9NYUiotK5NpzVFOrkxQJlZ7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jLXRnYDQ9U6K3QjUfcwnkhHeqy7kAffJwtdOAkgKo7GgVlNQZvx+eBvDjV60Jb9xW
	 C4nLI5GiVT2IDJgqIjoW0Bjl7xDTf80ZkdQh3kCjDQ2Mz9wm7vZ/WQ4or+92TfKJBV
	 NmHxLtGWbJJKLhCqp/VaP2RI8QJaZLV02xB0a7/g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E03D2F805BD; Wed,  3 Jan 2024 01:18:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B665F8057A;
	Wed,  3 Jan 2024 01:18:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CA70F80551; Wed,  3 Jan 2024 01:17:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D62FDF80074
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 01:17:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D62FDF80074
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=merlins.org
	; s=key; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=t9XfppTAXB/R7RwW8dr4rHSvu5BTIy+GAdi8E1JMC7k=; b=QwPKDucgsKyIFvU9J1D/Pj5Tri
	VCRKltktTy4Yv1jnPHs3G/H21xD6A0y4/PBb9DERiLJ4A3RY1WxwjDktE9Ert3DyPSGS3KFIKNJkm
	0bp97rlJvdhD/7d9bv3bbtwcZnmRX1XR6l4GFLNMQfOOiDHXoz0iHd33ysP+mBiR6sx62yjnoCS8Q
	9Gqc0TpNWN6KElsyWmOtfCt1Ski4D0qfA0hmCXKsPCjmgABYTRiwDaOd5SFS3JX/fI2hbeth7ItaI
	wDO0qJkRD1R5H6gpz3A1J3ZFk5pW/43kI/kC4Nyf0WLMZsgY4i/BVNXKIjKDeL43+fPWZEEDcPPnm
	hyK8TLVw==;
Received: from [172.58.27.122] (port=52915 helo=merlin.svh.merlins.org)
	by mail1.merlins.org with esmtpsa
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim
 4.94.2 #2)
	id 1rKbw8-00068g-KA by authid <merlins.org> with srv_auth_plain;
 Tue, 02 Jan 2024 02:23:52 -0800
Received: from merlin by merlin.svh.merlins.org with local (Exim 4.96)
	(envelope-from <marc@merlins.org>)
	id 1rKbw5-0003v0-0B;
	Tue, 02 Jan 2024 02:23:49 -0800
Date: Tue, 2 Jan 2024 02:23:49 -0800
From: Marc MERLIN <marc@merlins.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: sof-audio-pci-intel-tgl/soundwire 6.6.8 kernel outputs no sound
 on speakers but works on headphones
Message-ID: <ZZPkNRuMXYKOe-Os@merlins.org>
References: <20231223234430.GA11359@merlins.org>
 <alpine.DEB.2.22.394.2401021117370.14041@eliteleevi.tm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2401021117370.14041@eliteleevi.tm.intel.com>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
X-SA-Exim-Connect-IP: 172.58.27.122
X-SA-Exim-Mail-From: marc@merlins.org
Message-ID-Hash: D5U7BVOQQVXANYM5TVXSVH66AX564Y2A
X-Message-ID-Hash: D5U7BVOQQVXANYM5TVXSVH66AX564Y2A
X-MailFrom: marc@merlins.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D5U7BVOQQVXANYM5TVXSVH66AX564Y2A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jan 02, 2024 at 11:26:18AM +0200, Kai Vehmanen wrote:
> Hi,
> 
> On Sat, 23 Dec 2023, Marc MERLIN wrote:
> 
> > Howdy,
> > 
> > First, apologies if I'm not sending this to the right place, I could not
> > find an approrpriate soundwire/sof mailing list, please redirect me as
> > needed (I had to find an old soundwire message for reference)
> > 
> > laptop; Dell XPS 17 9730
> > 
> > merlin:~# lspci | grep -i audio
> > 0000:00:1f.3 Multimedia audio controller: Intel Corporation Device 51ca (rev 01)
> > 
> > stock mainline 6.6.8 shows the device, but no sound comes out, as if it
> > were muted, but I do not see anyting muted in alsamixer. If I plug in
> 
> we'd need a bit more info, especially alsa-info output, to figure out 
> whether this is an issue with the mixer settings and/or the drivers. 
> Instructions how to get alsa-info output availbale at 
> https://thesofproject.github.io/latest/getting_started/intel_debug/suggestions.html

Sure thing. I tried to give a lot fo machine info in my first 2 Emails,
sorry that I missed some.
Reading that page, the good news is that sound output works with the
same 6.5.0-14.generic kernel under ubuntu 23, so at least linux can make
it work without windows needed.

looks like alsa-info mostly gathered what I had captured manually and
posted, but here it is
https://alsa-project.org/db/?f=d732a80cdb3d8e569a97c7dc73a32ddc76aea8a9

I added the modprobe.conf debugging recommended in your page, and that
seems to have killed sound:
https://alsa-project.org/db/?f=7397a0f60194cc275fe7e6c0ed38733559d91382

> Please file a bug at 
> https://github.com/thesofproject/linux/issues
 
THanks, done: https://github.com/thesofproject/linux/issues/4758

> There was one bug affecting 9730 variants, but I don't think your case
> is the the same:
> https://github.com/thesofproject/linux/issues/4380

Indeed, I referenced them, thanks.

Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
