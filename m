Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F7D7B9B59
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:25:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18770AE8;
	Thu,  5 Oct 2023 09:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18770AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696490700;
	bh=yXxq9yVRIbY8l7/FsvlR1aMSVlJWeO//wdwmTQ7iPhU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NidesQe+Y1ATuWBwWG5g7dl6y7wXEaa6v3AyIOx1IDcDyMxyMcFaP19khngMiwfi2
	 38MG7iMbPTW/6+z685oJuHfWW1CDVC0dbdhPbi79L1oakwaE46BKMv8RUJ7pCMverm
	 q4R3CVpnqffI3lVYTT5DgKFA4mHQlTpXO3s/ENLc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DD6DF80549; Thu,  5 Oct 2023 09:24:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F500F80310;
	Thu,  5 Oct 2023 09:24:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3779F8047D; Thu,  5 Oct 2023 09:24:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FACEF800C1
	for <alsa-devel@alsa-project.org>; Thu,  5 Oct 2023 09:23:56 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 01B862C80;
	Thu,  5 Oct 2023 09:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 01B862C80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1696490636; bh=5tUjAAffC21PeqN5RCHFtO+dCZ7ZbDslD8JvlTNPOHk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RMC/XdI+giZhjrbO60WuxY5G65Nvhs8t+MbQCl/unIEbm48UuP4o9PE3o+/LjD5ZY
	 d7RwtIL/oz1qE8tFe9EeW9swhH4BRxUozQ45FjA9lZZrA5DIK878YGn9dSECse2xZo
	 POvFdJkqYUojdZO8pOdxvrQmBLybjEfowmTkZWMc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu,  5 Oct 2023 09:23:51 +0200 (CEST)
Message-ID: <b9b2ea05-9d10-d263-f08a-5e3cf1f33a9d@perex.cz>
Date: Thu, 5 Oct 2023 09:23:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] ALSA: aloop: Add support for the non-interleaved
 access mode
Content-Language: en-US
To: Ivan Orlov <ivan.orlov0322@gmail.com>, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230927113555.14877-1-ivan.orlov0322@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230927113555.14877-1-ivan.orlov0322@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HFWRD2SOB2SLQBB54D7MUX3JPK5J73GC
X-Message-ID-Hash: HFWRD2SOB2SLQBB54D7MUX3JPK5J73GC
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFWRD2SOB2SLQBB54D7MUX3JPK5J73GC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27. 09. 23 13:35, Ivan Orlov wrote:
> The current version of the loopback driver supports interleaved access
> mode only. This patch introduces support for the non-interleaved
> access mode.
> 
> When in the interleaved mode, the 'copy_play_buf' function copies data
> from the playback to the capture buffer using one memcpy call. This call
> copies samples for multiple, interleaved channels.
> 
> In the non-interleaved mode we have multiple channel buffers, so we have
> to perform multiple memcpy calls to copy samples channel after channel.
> 
> Add new function called 'copy_play_buf_part_n', which copies a part of
> each channel buffer from playback to capture. Modify the 'copy_play_buf'
> to use the corresponding memory copy function(just memcpy /
> copy_play_buf_part_n) depending on the access mode.
> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>

Nice extension. Thank you.

> +static void copy_play_buf_part_n(struct loopback_pcm *play, struct loopback_pcm *capt,
> +				 unsigned int size, unsigned int src_off, unsigned int dst_off)

I would probably prefer to have dst,src,size arguments to follow memcpy, but 
it's really nitpicking.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

