Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAA13E340D
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Aug 2021 10:18:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3532616B6;
	Sat,  7 Aug 2021 10:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3532616B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628324308;
	bh=d7H3u7cqpnsZ9Xce5y7GvurT2XWmylBa5mXCyE1ePvQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EjG+CKqcGOl7xruRnw+Q+4NJFkgfHeLkWlGIpPOsLhrm9W/sqYT+HWh4w3wvRcMiD
	 xNYxEbZitvyH0HCWXp5Fui1+DS3BSepSgp2bOijXAK4s0rXMXcn2UGYk3VNP5RgEHG
	 Qnuh5uwulHuGFSWf66JMtiIdBO27c8Dxw2rwVor8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A41ACF802E8;
	Sat,  7 Aug 2021 10:17:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A016F8027C; Sat,  7 Aug 2021 10:16:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B110F800FD
 for <alsa-devel@alsa-project.org>; Sat,  7 Aug 2021 10:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B110F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="GLjNarE2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADF6460F59;
 Sat,  7 Aug 2021 08:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628324210;
 bh=d7H3u7cqpnsZ9Xce5y7GvurT2XWmylBa5mXCyE1ePvQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GLjNarE2CCrxFP5ZVjcAo7+4fyzNmsFTceG6YzX+7Y0OCpbHZzu4T5WAzxHq6EWfG
 NZf2UaSTpxVWNALNF1Nf73bPqxwaWYK7tAOdmV7QoaMWcEB7vayxy7vaLdk6Iq12gC
 tF+LQ0eEDfsc4gQ6eRPP4hPs17cfS1mmR7/wo2LE=
Date: Sat, 7 Aug 2021 10:16:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>, Jeff Woods <jwoods@fnordco.com>
Subject: Re: Kernel 5.13.6 breaks mmap with snd-hdsp module
Message-ID: <YQ5Bb+mPgPivLqvX@kroah.com>
References: <17b1f9647ee.1179b6a05461889.5940365952430364689@fnordco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17b1f9647ee.1179b6a05461889.5940365952430364689@fnordco.com>
Cc: alsa-devel@alsa-project.org, regressions <regressions@lists.linux.dev>,
 stable <stable@vger.kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, Aug 07, 2021 at 12:49:07AM -0700, Jeff Woods wrote:
> Specifically, commit c4824ae7db418aee6f50f308a20b832e58e997fd triggers the problem. Reverting this change restores functionality.
> 
> The device is an RME Multiface II, using the snd-hdsp driver.
> 
> Expected behavior: Device plays sound normally
> 
> Exhibited behavior: When a program attempts to open the device, the following ALSA lib error happens:
> 
> ALSA lib pcm_direct.c:1169:(snd1_pcm_direct_initialize_slave) slave plugin does not support mmap interleaved or mmap noninterleaved access
> 
> This change hasn't affected my other computers with less esoteric hardware, so probably the problem lies with the snd-hdsp driver, but the device is unusable without reverting that commit.
> 
> I am available to test any patches for this issue.

Have you notified the developers involved in this change about this
issue?

Adding them now...

thanks,

greg k-h
