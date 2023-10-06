Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C567BC5BD
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Oct 2023 09:47:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BB2874C;
	Sat,  7 Oct 2023 09:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BB2874C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696664874;
	bh=EPqSyTCn/O20avnBdXohNXkWT7ftPi4FBS3E2U9UFdA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jwS51tqggCwwi4HBrbNwyq4674Y97pxoJRqSLipt9LcLOjvpd6CTxjzNiYHdwyQqy
	 8HY8c3nKHUgrUZU0VqdW6Yy3yzeDY3d7mvFo1URC4V08fYgg3Hr5GExWXKQ3WuvKgK
	 G+hp/TYU3J/d2NheZTNNMWXkLMTd0vbY6Ev1jlx0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C409F80571; Sat,  7 Oct 2023 09:46:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA27AF8055B;
	Sat,  7 Oct 2023 09:46:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7AF3F8047D; Fri,  6 Oct 2023 20:06:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01B3DF80130
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 20:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01B3DF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=O8CHCjiS
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-406aaccb41dso5143625e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Oct 2023 11:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696615600; x=1697220400;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cm3rU0s+wij9WVyx3Qhj5G5fmBbZgp+XmLtSeaB6d2U=;
        b=O8CHCjiS5yE7zi54NqoBrd4imiYpr9Eq53XhiSzMmZ5jkF+jl4SKair+7jeUFU0SAB
         i2dQHPyW5YlCfjeFpMLe9PagWyTJiu3UqZJGcSAWQWjhpzyhETUuWZWD6io+7wpW8Mt3
         kgGBgL6fc9CDFN26McU6jARbI8BIHWfi5uCeX7pm5o13QoGwvjGEGfVKIYjxOPj+CLlO
         vICBABDIYwaYLLYWEHQqub2qGV9yTXgg87FeY81Wch3E1q6LRReUqlwLXxzucFRs5VRT
         OBk2gy+6EaXoP5F4UJxWWKqBSArNvhlIMyDOg/LIup0UOLa/8uf8lzDzQN3KGSjNSbBs
         HmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696615600; x=1697220400;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cm3rU0s+wij9WVyx3Qhj5G5fmBbZgp+XmLtSeaB6d2U=;
        b=JfIUj+dnN6BomYQMM7o9fD8yaQ9uPKbLufeOE9KmpLrrQzoJlBYVTyakJkRVNddpbT
         Q7h2T0KT8/EvPujsPYksjZz0x/EB3SvG6j346rfaTHIrn053DtLa00xqQJmNugkn32X+
         63rloso6Am4KdESLadpR10AO9h9HCk+44ErvtxZCOx5wDnV1ML1FWwx0d0hhximxYB6p
         gRfwCB+4yi4IdwFs9ysS26oecx2uAuCpf2+TuaT2AoMR3OaTcZq7wVAlXqV+l5PvC67s
         BnQMR5pj3sCs9UbSx42sOfGI6z+BamWBezt8seIgKAqmeSRYFot66shlClTmX5f55C42
         3/ow==
X-Gm-Message-State: AOJu0YwfQLDLgLSOonVlwVnF6kuoIG7TQlN9eWHHw2YjiqNyY3AwJyDi
	GySCPAjb5SHjCrqZyyQqm+ogeIQyVPIV+w==
X-Google-Smtp-Source: 
 AGHT+IEbbIpQ+E7sgB0llYkcPQJK3+3Sog2yKB7MyyaZhZ3taDN1yVM75GHsqn8cu9e0OgVsnL2jOQ==
X-Received: by 2002:a05:600c:474b:b0:401:c07f:72bd with SMTP id
 w11-20020a05600c474b00b00401c07f72bdmr8262114wmo.4.1696615600162;
        Fri, 06 Oct 2023 11:06:40 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:e405:da00:cf04:a7d5:e45d:73bf?
 ([2a01:4b00:e405:da00:cf04:a7d5:e45d:73bf])
        by smtp.gmail.com with ESMTPSA id
 f17-20020a1c6a11000000b004063ea92492sm4215134wmc.22.2023.10.06.11.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 11:06:39 -0700 (PDT)
Message-ID: <e82750a9-d12f-77e4-0284-71d502f58254@gmail.com>
Date: Fri, 6 Oct 2023 19:06:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] ALSA: aloop: Add support for the non-interleaved
 access mode
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20230927113555.14877-1-ivan.orlov0322@gmail.com>
 <87sf6ow2t6.wl-tiwai@suse.de>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <87sf6ow2t6.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WV4FNISHPP35NWQEVT4GHSM5ZC4NURPU
X-Message-ID-Hash: WV4FNISHPP35NWQEVT4GHSM5ZC4NURPU
X-Mailman-Approved-At: Sat, 07 Oct 2023 07:46:14 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WV4FNISHPP35NWQEVT4GHSM5ZC4NURPU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/6/23 09:52, Takashi Iwai wrote:
> On Wed, 27 Sep 2023 13:35:54 +0200,
> Ivan Orlov wrote:
>>
>> The current version of the loopback driver supports interleaved access
>> mode only. This patch introduces support for the non-interleaved
>> access mode.
>>
>> When in the interleaved mode, the 'copy_play_buf' function copies data
>> from the playback to the capture buffer using one memcpy call. This call
>> copies samples for multiple, interleaved channels.
>>
>> In the non-interleaved mode we have multiple channel buffers, so we have
>> to perform multiple memcpy calls to copy samples channel after channel.
>>
>> Add new function called 'copy_play_buf_part_n', which copies a part of
>> each channel buffer from playback to capture. Modify the 'copy_play_buf'
>> to use the corresponding memory copy function(just memcpy /
>> copy_play_buf_part_n) depending on the access mode.
>>
>> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> 
> Sorry for the late reaction, as I've been (still) off since the last
> week.
> 
> Now applied both patches.  Thanks.
> 

Hi Takashi,

No worries and thank you for applying both patches :)

--
Kind regards,
Ivan Orlov

