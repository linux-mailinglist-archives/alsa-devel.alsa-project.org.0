Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 456CF6BEA54
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 14:41:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13AB3F59;
	Fri, 17 Mar 2023 14:40:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13AB3F59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679060488;
	bh=jw8ycedN/Zf9HoGhXQF7yT17adsda8z6c+G1UVKYT1E=;
	h=Date:Subject:From:To:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WQrFBD/jlPDZiTLnWzN9BmBWxOTPUU2NjDr283XdHr/WHn/OFU0Ppm242Go+R5NFu
	 1Jpo9TqeULIJjksxbN5qnXlo9z2HcGaa1Z67NeVDgb1liEjNn9vHwpIjx6XjQxSw1H
	 RGZ4QKwsh10AwVBhsedw1Rf7oQjIAehIGJaGJOHU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2998F80423;
	Fri, 17 Mar 2023 14:40:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BB5BF80482; Fri, 17 Mar 2023 14:40:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_NEUTRAL,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail.insite.cz
 (dynamic-2a00-1028-cc00-021d-021b-78ff-fe9a-2881.ipv6.o2.cz
 [IPv6:2a00:1028:cc00:21d:21b:78ff:fe9a:2881])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 206F7F80423
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 14:40:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 206F7F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=MkjllpzD;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=aJ+qjQ9E
Received: from localhost (localhost [127.0.0.1])
	by mail.insite.cz (Postfix) with ESMTP id 8EEB1A1A32302;
	Fri, 17 Mar 2023 14:41:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1679060503; bh=jw8ycedN/Zf9HoGhXQF7yT17adsda8z6c+G1UVKYT1E=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=MkjllpzDNBrpWH7OElh0RTldw7RRPiTG4fEmI1RmldzDsxZQf+Gy2SqjyORNjjmHm
	 EjW24pc7d4j/M4Q24YKbpyEZtEFa9DCbYzsVcIAoA9ZuTKUAgQzWpWYKTmcOXfnTt7
	 A88LcGEWST5l78zNWBr89GyiMpcmPsxXIsvXtr0c=
Received: from mail.insite.cz ([10.0.1.254])
	by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z07IUZpZlqtN; Fri, 17 Mar 2023 14:41:37 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by mail.insite.cz (Postfix) with ESMTPSA id 38172A1A32301;
	Fri, 17 Mar 2023 14:41:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1679060496; bh=jw8ycedN/Zf9HoGhXQF7yT17adsda8z6c+G1UVKYT1E=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=aJ+qjQ9ExAFKi1lwftgSysF5th6vap5qpwJ60ntV1V1k8cOqMmUPzwd+F7+7B2BIH
	 3YBqkwrdZgqLKAU9demNnf3gM2z8hAgykDsqS5Ej+KALUU3vIy7y65aZlKGPtLHBLq
	 1Ya/sjDDeRs/JzVEMa0agMgSBBUl4Gags72DkDdI=
Message-ID: <d2bf41f1-cc77-eeb5-d5b1-40f6ae146077@ivitera.com>
Date: Fri, 17 Mar 2023 14:40:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Unlikely big volume range volume range on EMEET webcam
Content-Language: en-US
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <64d33968-3a5f-83f4-1730-4f91f5b82607@ivitera.com>
In-Reply-To: <64d33968-3a5f-83f4-1730-4f91f5b82607@ivitera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JE6JMGVQ52DTZ5QA3LA5KYM7EX3JKUW5
X-Message-ID-Hash: JE6JMGVQ52DTZ5QA3LA5KYM7EX3JKUW5
X-MailFrom: pavel.hofman@ivitera.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JE6JMGVQ52DTZ5QA3LA5KYM7EX3JKUW5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Dne 10. 03. 23 v 14:43 Pavel Hofman napsal(a):
> Hi,
> 
> Speaker-webcam eMeet C980 Pro does not play, outputs only silent noise. 
> The digital volume seems to be down.
> 
> dmesg:
> 
> [22406.805176] input: HD Webcam eMeet C980 Pro: HD We as 
> /devices/pci0000:00/0000:00:01.2/0000:02:00.0/usb1/1-7/1-7.1/1-7.1:1.0/input/input27
> [22406.829048] usb 1-7.1: current rate 16000 is different from the 
> runtime rate 48000
> [22406.933044] usb 1-7.1: Warning! Unlikely big volume range (=10240), 
> cval->res is probably wrong.
> [22406.933048] usb 1-7.1: [5] FU [PCM Playback Volume] ch = 1, val = 
> -7168/3072/1
> [22407.001043] usb 1-7.1: Warning! Unlikely big volume range (=3072), 
> cval->res is probably wrong.
> [22407.001047] usb 1-7.1: [6] FU [Headset Capture Volume] ch = 1, val = 
> -1536/1536/1
> 

Maybe it's a problem with endianness, like e.g. reported in 
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2181737.html

All the large numbers are divisible by 256.

But honestly I do not know what the fix should be - converting the 
min/max (min >>=8) or the resolution (res >>=8)?

What difference do the two methods make?
What effect does rewriting the cval min/max/res values actually have, 
with regards to the reading from the device (get) and writing to the 
device (put) methods?

Thanks a lot for any hint.

Best regards,

Pavel.

> 
> amixer contents:
> .....
> numid=3,iface=MIXER,name='PCM Playback Switch'
>    ; type=BOOLEAN,access=rw------,values=1
>    : values=on
> numid=4,iface=MIXER,name='PCM Playback Volume'
>    ; type=INTEGER,access=rw---R--,values=1,min=0,max=10240,step=0
>    : values=10240
>    | dBminmax-min=-28.00dB,max=12.00dB
> numid=5,iface=MIXER,name='Headset Capture Switch'
>    ; type=BOOLEAN,access=rw------,values=1
>    : values=on
> numid=6,iface=MIXER,name='Headset Capture Volume'
>    ; type=INTEGER,access=rw---R--,values=1,min=0,max=3072,step=0
>    : values=3072
>    | dBminmax-min=-6.00dB,max=6.00dB
> .....
> 
