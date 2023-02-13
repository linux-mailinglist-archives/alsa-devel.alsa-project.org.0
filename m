Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79067693F42
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 08:58:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74A5D839;
	Mon, 13 Feb 2023 08:57:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74A5D839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676275107;
	bh=duVWByKYcGOMe88dw7mCpkjLKn0OMCGQWKjxu1DFz7c=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tJ7NRd1BT0x3yOCpzpBOHIJ/T/LOfuRG5MxhGCDnttrRPv64fsAalrNEcR1vs7/Up
	 dphpPrJJoqA+8VxWmsIT1a/iomFJ9LWyUGakf08jxiKU7RBw1KHSIpkBNSXjGR7bXv
	 LTEmYg8KRUdNyVIt79ufoBZwKnwrLbI7F0WoHsOw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95061F804B0;
	Mon, 13 Feb 2023 08:57:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46DD0F804B4; Mon, 13 Feb 2023 08:57:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.echtzeit.solutions (echtzeit.solutions [116.203.43.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50787F80038
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 08:57:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50787F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=echtzeit.solutions header.i=@echtzeit.solutions
 header.a=rsa-sha256 header.s=dkim header.b=Xq3CC7fv
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 966F8DB01C
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 08:57:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=echtzeit.solutions;
	s=dkim; t=1676275040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0zKmuCItsyjTN+L40cLo4yJ6IQyemtgpw4kxHgS7FtU=;
	b=Xq3CC7fvs931j2d38+uyZSoWkqL1Xzs/pZ3JDYHf88vFj+yE+R5xAcaw9npbfqtwRb4IUE
	KuEhpNotS27sKnC1w/jp8tAs+FYIwji21mRwxR7zVUJeb+VefKySM8x66zyOjQCupxG0ql
	hjyaG/AhHiZ5JqTGwfTBo6Rib6vIYMD/+M7PYbPLRT6qAWWfzknJzWGIc8e7xKIJguF/e9
	IVuo4worzIohRv+/K5Ik2b5KWEzTO3qU6mjMAN4mMwokjdJrvXrthcZbm+CvAAWUEMEnH5
	i1E49YladUMfSrzAXdFzGjdaHimoKo0NKLKvNVmdURAoOdH7XNln+xviLigjXA==
Message-ID: <948733d5-cbea-2c9f-95c7-6e95fdcacaba@echtzeit.solutions>
Date: Mon, 13 Feb 2023 08:57:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: alsa-devel@alsa-project.org
Content-Language: en-US
From: =?UTF-8?Q?Florian_H=c3=a4nel?= <florian.haenel@echtzeit.solutions>
Subject: TC-Helicon Blender
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BR2SP6QQOENEPFWQVE5I5SA2GYME7BKZ
X-Message-ID-Hash: BR2SP6QQOENEPFWQVE5I5SA2GYME7BKZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BR2SP6QQOENEPFWQVE5I5SA2GYME7BKZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I have this USB device called TC-Helicon Blender which provides 12 input 
streams, 8 output streams (6/4 stereo plugs), in addition to some midi 
interface and internal playback and record channel.

Bus 005 Device 016: ID 1220:8fe1 TC Electronic Blender

If I power the device on while connected to a windows machine with its 
driver installed, then plug it into my linux machine, it appears to work 
correctly:

arecord -D front:CARD=Blender  -r48000 -fS32_LE -c 12 blender.wav -d 20
Recording WAVE 'blender.wav' : Signed 32 bit Little Endian, Rate 48000 
Hz, Channels 12

46080044 blender.wav

However if I have it on my linux machine while powering it on, I only 
get timeouts and no samples from arecord:

arecord -D front:CARD=Blender  -r48000 -fS32_LE -c 12 blender.wav -d 20
Recording WAVE 'blender.wav' : Signed 32 bit Little Endian, Rate 48000 
Hz, Channels 12
arecord: pcm_read:2221: read error: Input/output error

44 blender.wav


What can I do to try and get this device to init correctly under linux? 
I have captured USB packets of the init phase using wireshark on both 
windows and linux but comparing them is tedious if I don't know what to 
look for. Are there quirks flags I can play around with? This is my 
first time looking at a linux device driver issue like this.

Would it be ok to attach the usb captures on this mailing list?


thanks

Florian

-- 
Florian Hänel
Geschäftsführer

echtzeit.solutions GmbH
Handelsregistergericht München HRB 231056
Ust-ID DE310379807

