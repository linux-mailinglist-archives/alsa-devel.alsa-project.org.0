Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19388D884
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 09:14:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE7152BD6;
	Wed, 27 Mar 2024 09:14:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE7152BD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711527259;
	bh=yCP1CH96izi8owCfv8mH8fThqtiNs2POCXAO4ghwBkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vx9ZwxwbvTk0eJDEYYNpfvcdqTY7V8srfVfC582FkYSo3K8ti9E1mnhBEtD3HR9Bo
	 ohWe80rY/MyI+8ZXjiJ1QVLj8B5LsuA2hCQgQKjzDETq+vxhPjMlYA+A89FiUnIYLe
	 CDnfWwC/RVgQ+239qetQu0kK8XSKiWeEZBwAVmyg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2BEEF805B0; Wed, 27 Mar 2024 09:13:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 609B3F805A1;
	Wed, 27 Mar 2024 09:13:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA717F8025F; Wed, 27 Mar 2024 09:13:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 202D1F801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 09:13:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 202D1F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=VJvuwsGf
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9101BCE257B;
	Wed, 27 Mar 2024 08:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C4A3C433F1;
	Wed, 27 Mar 2024 08:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711527200;
	bh=yCP1CH96izi8owCfv8mH8fThqtiNs2POCXAO4ghwBkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VJvuwsGflB9Wy6Ac5P5GkjUjzMXqdcfxA5m+JWio120YrCJ6xvm46zoD1YXoikF4M
	 IDdzC80maw5AFzm29iVSSRpYgn7sPUqU/wmW6zhHQvQxa1448qr9Ua6ahA/4weaEcs
	 y2qQSCSUFRjFfyTUDv+9CHuWk1DOqxNMHeEiQs14=
Date: Wed, 27 Mar 2024 09:13:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [PATCH 0/7] Soundwire: clean up sysfs group creation
Message-ID: <2024032742-armless-cage-7c6c@gregkh>
References: <2024013025-spoiling-exact-ad20@gregkh>
 <ZbpFTyW9UCZdCs_v@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbpFTyW9UCZdCs_v@matsya>
Message-ID-Hash: DTOEJH377JDJ4Y6CPGITWEFXBDDIOEOL
X-Message-ID-Hash: DTOEJH377JDJ4Y6CPGITWEFXBDDIOEOL
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DTOEJH377JDJ4Y6CPGITWEFXBDDIOEOL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 31, 2024 at 06:34:15PM +0530, Vinod Koul wrote:
> On 30-01-24, 10:46, Greg Kroah-Hartman wrote:
> > Note, this is a redone version of a very old series I wrote back in
> > 2022:
> > 	https://lore.kernel.org/r/20220824135951.3604059-1-gregkh@linuxfoundation.org
> > but everyone has forgotten about it now, and I've reworked it, so I'm
> > considering it a "new" version, and not v2.
> > 
> > Here's a series that adds the functionality to the driver core to hide
> > entire attribute groups, in a much saner way than we have attempted in
> > the past (i.e. dynamically figuring it out.)  Many thanks to Dan for
> > this patch.  I'll also be taking this into my driver-core branch and
> > creating a stable tag for anyone else to pull from to get it into their
> > trees, as I think it will want to be in many for this development cycle.
> > 
> > After the driver core change, there's cleanups to the soundwire core for
> > how the attribute groups are created, to remove the "manual" creation of
> > them, and allow the driver core to create them correctly, as needed,
> > when needed, which makes things much smaller for the soundwire code to
> > manage.
> 
> The series lgtm, having the core handle these would be good. I will wait
> couple of days for people to test this and give a t-b and apply.
> I hope it is okay if patch1 goes thru sdw tree?

patch 1 is now in Linus's tree, so the remaining ones can go through the
your tree now if you want.  Or I can resend them if needed, just let me
know.

thanks,

greg k-h
