Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AB3AE349C
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jun 2025 07:12:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07FEC601FA;
	Mon, 23 Jun 2025 07:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07FEC601FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750655531;
	bh=osOb2Dv1Vv/DbbryMfpbkPWA+Lby1V0KQ2C0VuWAACg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gizo/asmb1sCKcOOzHzKGjr7o3eAzm//azQInWjIfE4lMhL4TWyiRlxkshcHrgqEv
	 XVv1Cln0WLik0utT8to4n7ebSrv7rmxR7x6t3Zw5JeW7wwkgfp87D5RHIUvTXy3nTn
	 /4sEIsUrNRKeX3Xioso7jJPcCwLnhTrAox5Xswmg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CDE6F805C7; Mon, 23 Jun 2025 07:11:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1711FF805C1;
	Mon, 23 Jun 2025 07:11:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 241B6F80424; Mon, 23 Jun 2025 07:11:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D1D4F8013D
	for <alsa-devel@alsa-project.org>; Mon, 23 Jun 2025 07:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D1D4F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=X9zCy2Iq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38B7160EDF;
	Mon, 23 Jun 2025 05:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95310C4CEED;
	Mon, 23 Jun 2025 05:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750655483;
	bh=osOb2Dv1Vv/DbbryMfpbkPWA+Lby1V0KQ2C0VuWAACg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X9zCy2IqxV0TYP6qoO2crXX54XS/b+CpuwUlXmDcE7yHlxxv7FsEv7VfsvfJyJhzR
	 K4RmufsUQlkE/84GovX2AYdfB+/79S9Gsi03wOXxw6CV3rKkBtK39kCi3vcxdyS96x
	 w5g36XK9i/DRj72Wu3injqcbV9r414ItJ4ePswio=
Date: Mon, 23 Jun 2025 07:11:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?77+9zL3Cuu+/vQ==?= <seungbin.lee@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, perex@perex.cz, tiwai@suse.de,
	pilsun.jang@samsung.com, s47.kang@samsung.com,
	donghee.moon@samsung.com
Subject: Re: FW: [PATCH] ASoC: soc-compress: Fix race condition in
 soc_compr_open_fe
Message-ID: <2025062349-decimal-line-30f2@gregkh>
References: 
 <CGME20250623013055epcas2p15c17e1f34632e868cd504380d147490d@epcas2p1.samsung.com>
 <000601dbe3de$76d88db0$6489a910$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <000601dbe3de$76d88db0$6489a910$@samsung.com>
Message-ID-Hash: NA7SFPDABNBWXVAC32DHIPPKRSAT7C2Z
X-Message-ID-Hash: NA7SFPDABNBWXVAC32DHIPPKRSAT7C2Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NA7SFPDABNBWXVAC32DHIPPKRSAT7C2Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 23, 2025 at 10:30:55AM +0900, �̽º� wrote:
> Add recipient addition and modification patch to the body of the
> transmission.
> 
>  
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
