Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6696895E86F
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2024 08:21:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8D333E7;
	Mon, 26 Aug 2024 08:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8D333E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724653296;
	bh=waGqCk9mOj70KmWruIse7BdZwqMFjuomaEGG9ogzjHk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=s4tpdacwTaADupwUR9W1dXrix32N/EGkwAoYvwSVxBw/4kUWY39ngpyc2FFyaymbf
	 6f6IZkwkxuNVZOQlFfwrkUkGyFhgRhqcc/00HTIsKwp7NagXQbRJMjA2ZCOBuj10G2
	 S6e/IF7qbv36KIDcw0UwQBNqNtEe1UZ9mdG8AkTM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 298ADF8059F; Mon, 26 Aug 2024 08:21:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 903E5F805AE;
	Mon, 26 Aug 2024 08:21:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5388FF80423; Mon, 26 Aug 2024 08:17:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF069F80087
	for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2024 08:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF069F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=hsdbjkoN;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=HnOPnet3
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 3748A17EF9B;
	Mon, 26 Aug 2024 08:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1724653038; bh=waGqCk9mOj70KmWruIse7BdZwqMFjuomaEGG9ogzjHk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=hsdbjkoNUHBT2t61pb+6GBUIOQHHqgInsnBQUSURDEgTr2gqDBwssMfu3vwG8IE3o
	 p8nE0DTPShlsiiTeBT7qoju5p8KXB/qnRansKm06qSKgYv+bYTJEQMNPJSq+vjYTyq
	 zUcAUoQ6xC9O2oL+XFXZLOimlGwQH3G8WfgURAhw=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6T6LcdYwb87z; Mon, 26 Aug 2024 08:17:17 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 9591A17F574;
	Mon, 26 Aug 2024 08:17:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1724653037; bh=waGqCk9mOj70KmWruIse7BdZwqMFjuomaEGG9ogzjHk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=HnOPnet3VNvFauJUFIzDv7nRwaLmYKDR/EWFq6JM7Ddxm7eS0h82hiUuJmonCmEMX
	 /prjLxI4iucz2dIkWLOtnIDEn9ukaZNBa32XioWU+Azxv6oSnffcnMqSa8qBcz19p+
	 5KD8so7O/HhIvQlz9wrSCJdUwKi5W5pBQz4yV6Z4=
Message-ID: <42070a30-18e1-373e-aff6-9dbab9a5241f@ivitera.com>
Date: Mon, 26 Aug 2024 08:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Specifying supported hw params (channels, format, etc.) by the
 plug plugin in alsa config?
To: Jaroslav Kysela <perex@perex.cz>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <24c2052b-607d-3f2a-8733-0aa67bcde874@ivitera.com>
 <2b9a0040-960a-4dbb-b8de-13b5c271dac1@perex.cz>
Content-Language: en-US
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: <2b9a0040-960a-4dbb-b8de-13b5c271dac1@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FOIPUQM7TJKM475C5H7F7HTRSERQZA6V
X-Message-ID-Hash: FOIPUQM7TJKM475C5H7F7HTRSERQZA6V
X-MailFrom: pavel.hofman@ivitera.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FOIPUQM7TJKM475C5H7F7HTRSERQZA6V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jaroslav,

On 25. 08. 24 20:28, Jaroslav Kysela wrote:
> On 25. 08. 24 20:16, Pavel Hofman wrote:
>> Hi,
>>
>> Please is it possible to restrict the hw params space for the plug
>> plugin by some alsa configuration, so that it reports/accepts only a
>> specific number of channels/specific sample format? I was not able to
>> figure it out, I apologize if it's trivial :-)
> 
> Hi,
> 
>     here's a quick example:
> 
> ===
> pcm.hubcap {
>   type plug
>   slave {
>     pcm "hw:Loopback,1,0"
>     rate 48000
>     format S16_LE
>   }
> }
> ===
> 
> Documentation:
> https://www.alsa-project.org/alsa-doc/alsa-lib/pcm_plugins.html
> 



Thanks a lot for your quick response. IIUC this config specifies params
for the slave, but the plug's input hw params remain unrestricted:


aplay -v --dump-hw-params  -D hubcap /dev/zero
HW Params of device "hubcap":
--------------------
ACCESS:  MMAP_INTERLEAVED MMAP_NONINTERLEAVED MMAP_COMPLEX
RW_INTERLEAVED RW_NONINTERLEAVED
FORMAT:  S8 U8 S16_LE S16_BE U16_LE U16_BE S24_LE S24_BE U24_LE U24_BE
S32_LE S32_BE U32_LE U32_BE FLOAT_LE FLOAT_BE FLOAT64_LE FLOAT64_BE
MU_LAW A_LAW IMA_ADPCM S20_LE S20_BE U20_LE U20_BE S24_3LE S24_3BE
U24_3LE U24_3BE S20_3LE S20_3BE U20_3LE U20_3BE S18_3LE S18_3BE U18_3LE
U18_3BE
SUBFORMAT:  STD
SAMPLE_BITS: [4 64]
FRAME_BITS: [4 640000]
CHANNELS: [1 10000]
RATE: [4000 4294967295)
PERIOD_TIME: (20 10922667)
PERIOD_SIZE: (0 4294967295)
PERIOD_BYTES: (0 4294967295)
PERIODS: (0 4294967295]
BUFFER_TIME: [1 4294967295]
BUFFER_SIZE: [1 4294967294]
BUFFER_BYTES: [1 4294967295]
TICK_TIME: ALL
--------------------
Plug PCM: Rate conversion PCM (48000, sformat=S16_LE)
...

I am looking for restricting the params offered by the plug plugin to
upstream.

Sometimes it's useful to fix the input channels or sample format, while
keeping the plug conversion capabilities. An example is the a52 plugin
which accepts only non-interleaved access. For clients which support
only interleaved access (e.g. java alsa interface), the plug will do the
conversion, but will also obscure the fact that a52 works with 6
channels and S16_LE, runs preferrably at 48kHz, etc. Yes, it will any of
the conversions necessary, but sometimes the client would prefer knowing
the optimal format instead.

I tried wrapping the plug with empty plugin which according to the docs
should be able to limit the plug input format
https://www.alsa-project.org/alsa-doc/alsa-lib/pcm_plugins.html#pcm_plugins_empty
but those slave params format/channels were refused by snd config.

Thanks a lot for any help.

With regards,

Pavel.
