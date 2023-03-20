Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E5F6C1502
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 15:43:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2C4B1E1;
	Mon, 20 Mar 2023 15:42:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2C4B1E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679323397;
	bh=6ovM0T9TVMGjqDSbyWQDwqpTnYKG0xlbFq50tHK3Q+k=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vjKcKIGCavf5ioSSIxFdJId29eUaqrLCovKxPQeqMofeputCDWMGHpCT3U+xp04/D
	 Tu4NLnruKzW4FYRV6XlFKbkbSJqT1pmIr7ssuRw6l3Dt1pXbEHeITxN/kQqkmeUwd7
	 /BPdGSRpzmEwEbpFkGJgQUF8Av6Tl09EXf78Ezx8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA217F80254;
	Mon, 20 Mar 2023 15:42:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C598F8027B; Mon, 20 Mar 2023 15:42:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E043F80105
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 15:42:20 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id EC93E11CB;
	Mon, 20 Mar 2023 15:42:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz EC93E11CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1679323340; bh=jiG7tttAllibNSjSkUujMcxdbJ8P0x2ks4YQyVlQdxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JktfRXHlcDl2aOCC4rlYRsolYLLtQMyUi3jtdSozHhz9+ytDIHktW/07YTUHNdceW
	 llfU0yYaC+M9Q8liNav+KdONovt2roPh0LcgaitDD4+mkm08BBNagMX3Ha7vs3J+Mi
	 iPhJQymHD94FCrC2qm13jUwwVuPmeJ7lh4tyobkM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 20 Mar 2023 15:42:16 +0100 (CET)
Message-ID: <77bb2ac9-94b9-8e9f-0b9b-8e7a1c8c9dd6@perex.cz>
Date: Mon, 20 Mar 2023 15:42:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ALSA: usb-audio: Fix recursive locking at XRUN during
 syncing
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20230320142838.494-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230320142838.494-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VCRVYBEEX5KJ2AVWR7CUUDE7KP4L445G
X-Message-ID-Hash: VCRVYBEEX5KJ2AVWR7CUUDE7KP4L445G
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: John Keeping <john@metanate.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCRVYBEEX5KJ2AVWR7CUUDE7KP4L445G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20. 03. 23 15:28, Takashi Iwai wrote:
> The recent support of low latency playback in USB-audio driver made
> the snd_usb_queue_pending_output_urbs() function to be called via PCM
> ack ops.  In the new code path, the function is performed alread in
> the PCM stream lock.  The problem is that, when an XRUN is detected,
> the  function calls snd_pcm_xrun() to notify, but snd_pcm_xrun() is
> supposed to be called only outside the stream lock.  As a result, it
> leads to a deadlock of PCM stream locking.
> 
> For avoiding such a recursive locking, this patch adds an additional
> check to the code paths in PCM core that call the ack callback; now it
> checks the error code from the callback, and if it's -EPIPE, the XRUN
> is handled in the PCM core side gracefully.  Along with it, the
> USB-audio driver code is changed to follow that, i.e. -EPIPE is
> returned instead of the explicit snd_pcm_xrun() call when the function
> is performed already in the stream lock.
> 
> Fixes: d5f871f89e21 ("ALSA: usb-audio: Improved lowlatency playback support")
> Reported-and-tested-by: John Keeping <john@metanate.com>
> Link: https://lore.kernel.org/r/20230317195128.3911155-1-john@metanate.com
> Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

I think that this is the best variant of the proposed solutions.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

