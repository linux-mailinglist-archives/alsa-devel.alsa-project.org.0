Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C9C694ED6
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 19:08:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54AF483D;
	Mon, 13 Feb 2023 19:07:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54AF483D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676311686;
	bh=Y9HFf4tspO48yW1qcQsZgkjpkJ5mSymTgJ1KOuWi4FY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=OLlOkrQPLzUMlN6BI7YcAWtDtkugdWrctKV+lNdlFNSZ0if3ZM8yJ27r3hV47lijQ
	 Yyaz4GP14kMNNJJ3bgZ/0w6ELuNnKz9ixXdG5LpY8rwIfa7Pp59bf4IUsLE9g74z/9
	 UGf0/CmYkE2vtsRkdx5lIo1QeWAidfYIM0EJKJFQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 959BEF804B0;
	Mon, 13 Feb 2023 19:07:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FCB1F804B4; Mon, 13 Feb 2023 19:07:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.echtzeit.solutions (echtzeit.solutions [116.203.43.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B11A6F8001E
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 19:07:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B11A6F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=echtzeit.solutions header.i=@echtzeit.solutions
 header.a=rsa-sha256 header.s=dkim header.b=BXrZms02
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 45158DAD02
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 19:06:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=echtzeit.solutions;
	s=dkim; t=1676311613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eyF94rZTDHeW4e6lj3P4UIhwyuxb5h81Oom+a++YKkY=;
	b=BXrZms02ff4jkifYuupVK+BzA6C/PGFROmkYpS5vRr4mIoUgv0dsUWzPEs6zoFobe7cWpu
	xeBFVeQsR1E6rc82eZo5+DIleEx82ZO9LR58Xhs0w0Q/KyyyLdSUITAVa4v2uaYBiXkA46
	gGs2iuZnz1zCjcUaG60e7iQk4XpFcKCdEOXsoFwGdMr8y6cv/Dw+QGbZh4W2CGxdUyEj0H
	TFvbwhYY/XsBIjpQAdS2+1+2vQO1COQYlgVDwPEsiQuwbySQ+7SeaV7RCskpm1m2WzCMpm
	m1tWbpYkwSPAhZm5s6f5Y6B/6+FmoLa8mj6aMYcx21J85kSMZnsuUq36ECa57g==
Message-ID: <5b801868-0a03-a200-8d88-59079f5a41ab@echtzeit.solutions>
Date: Mon, 13 Feb 2023 19:06:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: TC-Helicon Blender
Content-Language: en-US
To: alsa-devel@alsa-project.org
References: <948733d5-cbea-2c9f-95c7-6e95fdcacaba@echtzeit.solutions>
From: =?UTF-8?Q?Florian_H=c3=a4nel?= <florian.haenel@echtzeit.solutions>
In-Reply-To: <948733d5-cbea-2c9f-95c7-6e95fdcacaba@echtzeit.solutions>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VXCD7A7SKM4EGUG72WLBAFHKDZW7E3HE
X-Message-ID-Hash: VXCD7A7SKM4EGUG72WLBAFHKDZW7E3HE
X-MailFrom: florian.haenel@echtzeit.solutions
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VXCD7A7SKM4EGUG72WLBAFHKDZW7E3HE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I found a tool [1] written for a device by the same vendor, so likely to 
share hardware/firmware and it sends a single packet to make the device 
work.

It sort of works for me, except I have to unplug and re-plug the device 
to make it work.

My question now is, is there a quirks flag and configuration that allows 
me to do the same thing on plug-in?


Florian


[1]: 
https://github.com/GoXLR-on-Linux/goxlr-utility/blob/main/initialiser/src/main.rs#L117

On 13.02.23 08:57, Florian Hänel wrote:
> I have this USB device called TC-Helicon Blender which provides 12 
> input streams, 8 output streams (6/4 stereo plugs), in addition to 
> some midi interface and internal playback and record channel.
>
> Bus 005 Device 016: ID 1220:8fe1 TC Electronic Blender
>
> If I power the device on while connected to a windows machine with its 
> driver installed, then plug it into my linux machine, it appears to 
> work correctly:
>
> arecord -D front:CARD=Blender  -r48000 -fS32_LE -c 12 blender.wav -d 20
> Recording WAVE 'blender.wav' : Signed 32 bit Little Endian, Rate 48000 
> Hz, Channels 12
>
> 46080044 blender.wav
>
> However if I have it on my linux machine while powering it on, I only 
> get timeouts and no samples from arecord:
>
> arecord -D front:CARD=Blender  -r48000 -fS32_LE -c 12 blender.wav -d 20
> Recording WAVE 'blender.wav' : Signed 32 bit Little Endian, Rate 48000 
> Hz, Channels 12
> arecord: pcm_read:2221: read error: Input/output error
>
> 44 blender.wav
>
>
> What can I do to try and get this device to init correctly under 
> linux? I have captured USB packets of the init phase using wireshark 
> on both windows and linux but comparing them is tedious if I don't 
> know what to look for. Are there quirks flags I can play around with? 
> This is my first time looking at a linux device driver issue like this.
>
> Would it be ok to attach the usb captures on this mailing list?
>
>
> thanks
>
> Florian
>
-- 
Florian Hänel
Geschäftsführer

echtzeit.solutions GmbH
Handelsregistergericht München HRB 231056
Ust-ID DE310379807

