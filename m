Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 877D576E083
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 08:50:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D7FD3E7;
	Thu,  3 Aug 2023 08:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D7FD3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691045420;
	bh=aQP/EAduSEvtZ8jM6PNfbiXRZ1VSBqyt37TvkXPMwjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r6s7xDYET9jIRO5hfcplRVh4xtEkmnCQC0NtIz4H3Mup7BmawKkF9AyDHZvSS0EXs
	 6LDWqgOx4qGw3WPdH9GaXxM2Tqb2uwHtN5WNSzYzOoQezoRzcveYr4z3GEYj5+3qmX
	 E3m8GWwlIV/IUcb1U1UVVI9Qg1L897VNlKrqqDc8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9ADFF80535; Thu,  3 Aug 2023 08:49:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 779F3F801D5;
	Thu,  3 Aug 2023 08:49:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EAAFF8025A; Thu,  3 Aug 2023 08:49:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6159FF80149
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 08:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6159FF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=rKxSS6ze
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0DEC961C04;
	Thu,  3 Aug 2023 06:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB9EC433C8;
	Thu,  3 Aug 2023 06:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691045355;
	bh=aQP/EAduSEvtZ8jM6PNfbiXRZ1VSBqyt37TvkXPMwjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rKxSS6zey+k25OjRZLv3Ts9EuXnWp3bwe06x+A0+52XsnUCs8JqhDcwQdgfa8PsEZ
	 lgj6JRP3hR5Wl6QnL+HDFDdR+MKZhpyBGsJwxJ1TJ3megPE/sAsYiqCJAsy9kxmGYV
	 Zi7alNaIUgaQNXx5DBHqNqya0hPIFbMHUkYKqd9I=
Date: Thu, 3 Aug 2023 08:49:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: cujomalainey@chromium.org
Cc: alsa-devel@alsa-project.org, Doug Anderson <dianders@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Zheyu Ma <zheyuma97@gmail.com>, Dan Carpenter <error27@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Clement Lecigne <clecigne@google.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH v2] sound: core: fix device ownership model in card and
 pcm
Message-ID: <2023080352-undertook-cardboard-bc88@gregkh>
References: 
 <CAOReqxjNdczwPXQ76TdR3M1nEKg3ZxPE5DBrzHSDy6msFRCF7w@mail.gmail.com>
 <20230802174451.3611976-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802174451.3611976-1-cujomalainey@chromium.org>
Message-ID-Hash: NWVDW6OCXDCBMRXW63YSNR44F4WA7XQM
X-Message-ID-Hash: NWVDW6OCXDCBMRXW63YSNR44F4WA7XQM
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWVDW6OCXDCBMRXW63YSNR44F4WA7XQM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 02, 2023 at 10:43:49AM -0700, cujomalainey@chromium.org wrote:
> From: Curtis Malainey <cujomalainey@chromium.org>
> 
> The current implementation of how devices are released is valid for
> production use cases (root control of memory is handled by card_dev, all
> other devices are no-ops).
> 
> This model does not work though in a kernel hacking environment where
> KASAN and delayed release on kobj is enabled. If the card_dev device is
> released before any of the child objects a use-after-free bug is caught
> by KASAN as the delayed release still has a reference to the devices
> that were freed by the card_dev release. Also both snd_card and snd_pcm
> both own two devices internally, so even if they released independently,
> the shared struct would result in another use after free.
> 
> Solution is to move the child devices into their own memory so they can
> be handled independently and released on their own schedule.
> 
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> Cc: Doug Anderson <dianders@chromium.org>
> ---
>  include/sound/core.h            |  2 +-
>  include/sound/pcm.h             |  2 +-
>  sound/aoa/soundbus/i2sbus/pcm.c |  4 ++--
>  sound/core/control.c            | 21 +++++++++++++++------
>  sound/core/control_led.c        |  4 ++--
>  sound/core/pcm.c                | 30 ++++++++++++++++++++----------
>  sound/usb/media.c               |  4 ++--
>  7 files changed, 43 insertions(+), 24 deletions(-)
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
