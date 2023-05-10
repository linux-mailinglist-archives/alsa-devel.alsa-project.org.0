Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EBE6FD88A
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 09:49:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECE54103D;
	Wed, 10 May 2023 09:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECE54103D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683704962;
	bh=Q0YkIVrsYSiUntR8XUeUJQ9NKp/dYkedYevQTQb2i4I=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TKKzY+/HPuNB5Lsx1XXEYgeVmGL3NXxxyP3lj9ywXrh3QeME6uW7jBJpUgMSpr0Wg
	 gZdk5UrP1i4CtCkAM7QhNrEJ+MoNI0lXwxoKH9xZ1tSeA1H84xKwwbTf8PYdRxTknZ
	 eGw1prWbKitaDS43LYiDyLOC3mpHtD4yvGEQAoSw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B596DF80310;
	Wed, 10 May 2023 09:48:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 278CDF8032D; Wed, 10 May 2023 09:48:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55B5EF8014C
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 09:48:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55B5EF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=HMuI5RNh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7969962EDD;
	Wed, 10 May 2023 07:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB3EC433EF;
	Wed, 10 May 2023 07:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1683704898;
	bh=Q0YkIVrsYSiUntR8XUeUJQ9NKp/dYkedYevQTQb2i4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HMuI5RNh4+G6d5k8e8/2GKKF50cdI+G/tsR83FkbP+ja2j0Xs9BIkIVpMhH5WNQjO
	 Xo6lT3ztyddPfAQyuOcCOH6nSRoVO+Rh8HI0sPw5pxHeKkm+Rf8uv/QDrxjqK0U+kq
	 xXkz/fZAcQ6L7xjKi5wr/EAhvF8LlEu4aol4cUh8=
Date: Wed, 10 May 2023 09:48:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH] ALSA: PCM: Fix codestyle issues in pcm_native.c
Message-ID: <2023051052-recoil-headache-1594@gregkh>
References: <20230510072726.435247-1-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510072726.435247-1-ivan.orlov0322@gmail.com>
Message-ID-Hash: 4JSZBDDNKYVUHWQU2YPI4EZE6PFKJARM
X-Message-ID-Hash: 4JSZBDDNKYVUHWQU2YPI4EZE6PFKJARM
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, oswald.buddenhagen@gmx.de, axboe@kernel.dk,
 42.hyeyoo@gmail.com, surenb@google.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4JSZBDDNKYVUHWQU2YPI4EZE6PFKJARM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 10, 2023 at 11:27:26AM +0400, Ivan Orlov wrote:
> Fix some obvious codestyle issues in the pcm_native.c file. Some of them
> were found by checkpatch with --strict option, and the others by just
> looking at the code. These issues include incorrect placement of brackets,
> trailing and starting spaces, wrong alignment of function arguments,
> incorrect multiline comments, using __attribute__((packed)) instead of just
> "__packed", comparison with null instead of using "!". Also, today we have
> 100 columns per line available, and I tried to reformat the file
> considering this.
> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
>  sound/core/pcm_native.c | 696 +++++++++++++++++++---------------------
>  1 file changed, 323 insertions(+), 373 deletions(-)

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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
