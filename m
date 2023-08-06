Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 590EB771426
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Aug 2023 11:20:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D540210;
	Sun,  6 Aug 2023 11:19:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D540210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691313607;
	bh=VuePgNk0Oif3pidnp5hRGiQBzyS5IrEUZtAUCxV2tz0=;
	h=To:From:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dO0STT6n+bcYNRwfsYN2RbdXWM4Ba7DfeUcgA0ChntH5mXHaEfTxAzdafI4rBEr0w
	 jyafQKzXTGDwNCBpfgIscsJKoLVP86q3Kon8EEtCAMemSzqc0ysDR+8iLNMB66kFiW
	 2fjiMPgrNOyNj/K620SoT9Zz8Pg5I3HbUMKpy+6g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF495F80520; Sun,  6 Aug 2023 11:19:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0ECCF8016B;
	Sun,  6 Aug 2023 11:19:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D0A9F8016D; Sun,  6 Aug 2023 11:18:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FROM_STARTS_WITH_NUMS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FAEBF80132
	for <alsa-devel@alsa-project.org>; Sun,  6 Aug 2023 11:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FAEBF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.ch header.i=400thecat@gmx.ch header.a=rsa-sha256
 header.s=s31663417 header.b=GHbLin0w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.ch;
 s=s31663417; t=1691313481; x=1691918281; i=400thecat@gmx.ch;
 bh=VuePgNk0Oif3pidnp5hRGiQBzyS5IrEUZtAUCxV2tz0=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=GHbLin0wpNPU+XSV7lq0ytvZYQjxSe1ENTj6NTvglUFUgrcHPyjhyAVHhelvU38oc61Xt+c
 Y/L6AFcBkRrArC37wUBAb8r1poDXU5hB7ZeijtcMz7cPZZSail3jofVqJOpRZO3ztqCUosMPN
 kbQRLsKOiAfmoyo9FzATWA/IVN7zDFlQJXYTUGPeC3mzj0jbfTPQmqt89ijQG7BthKXO/GnWI
 MiRNNYt3f/RlJYbJFy4g6kTX37CXMi8ADP1Dq9RcCmV/pHAW4AUfp+CC4h76R22RisTXsqBaN
 2xQeRLHehFtTqWNNN2D44+NKF611WBgaG1jetvBmsWvHl1Qv7Eng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.1.2.16] ([212.25.11.75]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEUzA-1qd1Mp1OrC-00G31p for
 <alsa-devel@alsa-project.org>; Sun, 06 Aug 2023 11:18:01 +0200
To: alsa-devel@alsa-project.org
From: Fourhundred Thecat <400thecat@gmx.ch>
Subject: change order in which kernel initializes devices
Message-ID: <aa95b260-134d-42f7-2d07-74e60b327839@gmx.ch>
Date: Sun, 6 Aug 2023 11:18:00 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:J1amAuTluCgu7nWhyfSka8UD1NKFybbXnx6lbb93YpSrYHYZcqn
 0gRfP41XBQL+W3hYM5swf5O5+hVwNdhJMuvz89x8kVukqHlZsMxJxNe9c3k/ReXZxXM02nn
 V0w3vjVRs1ek+ji0udLBvNdNpj21ALaymuxBNg9kjDTrKpUVZDVhNfyybhAw6NXKvf5BW57
 yQPD6fxdBpu39Cae+29kw==
UI-OutboundReport: notjunk:1;M01:P0:owjTB3dIFfc=;J7g+w7r1yhfqDqxuWIX3zN9nhMc
 //jJlneL7wbLA5WnDKYogMITaKlGifUJnXP78+ErLn7zHyvu/lZVHdjOtxC6VCRBy55JLJarR
 HHnbKDit/ftgClIfN/Lo60iKCRoQLMoCjLdPmuUx9aCwFWOYVzfWsA9ffd/Iu5fz9yspCc9g1
 kHXPaKiRXko6W+gbZpB3ZIUSHM4T2/SMhq659LXEFrLs244B7fgXLA/C4iUmP9l7kuGq3XQWp
 Dl2dFTx95Fqre2emrcABIYoDcMbTfzukNCyc8vXiWH8TPD4ek+2keZ2sMyL38FlvWgvpzv9+v
 DSTm9tQ8fBS65PGAl+uWGd7xwePb+Uzypcvsrwa8I707VeuBOe5tWJwqId6KFxrWIi6RUT1FN
 gBPcW5uGQLMQro12ZQTuqp56MtUwU+HFz1OXfx6UogXAtZx6Y3nT0Oca/sV5HORNBUzCmJwai
 DJ1uhO3qL8rIgEMtX1slmSk7rcyLbv1gm/WtSVPR8mmAzSM2+6jgaGXmZoefFg6rQ2EpvkwLv
 OdSm5mjFavDBVO53coh2SRautRbILbQDk85Zod1G1y3PF+2qCkc7jNFv5ljKpb0vE89hceCdc
 Qf3hbvusgTRm1zZlp2QBFEnYTGrWe/DJ54vPdMpaRh/ZSUyrkcthCIlX0dFiXHUzTB5v/lLHE
 EhIGDIkm5GSyqkUXSr9VHwTPf2MmBvSyHhNibIuzEzpXGUqEJyCtoKp2ZZZnV6IxOHG0zFNst
 Pcll8383m5T60jnpP2eSNUhG7zytRTNWxZ1stXuTR75f5c7skLBOC0CUWK6P5EmqWGrN4akcx
 WWgGHfFv7pP/IQP5e6W1UYrUoOgxzOY+a77noAxir3OFzxZ8QyTwVIrkeNqdY6T0422gdioyt
 gF8067N+VAjIr1sdl/w1rdYb9MfkWLI2uwxKyDWWfFNUFLGhLpYph17NNaOysOtcD6g1/FK2i
 b22GaUHANer76MgMU64PI5J3mQI=
Message-ID-Hash: IZEMPTAWUE5Z65K4N74LCRXGGPTR2CSL
X-Message-ID-Hash: IZEMPTAWUE5Z65K4N74LCRXGGPTR2CSL
X-MailFrom: 400thecat@gmx.ch
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IZEMPTAWUE5Z65K4N74LCRXGGPTR2CSL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

I am using monolithic kernel without loadable module support. Everything
is compiled in statically.

Now I have snd-aloop (CONFIG_SND_ALOOP=3Dy) and when i boot my kernel, it
is recognized as primary device. My real hw card is as second device.

Is there any way I can change the order, in which kernel initializes the
sound devices, so that my real (hw) sound card is recognized first ?

If I was using modules, I could simply load snd-aloop later.

I am compiling my own kernel, so I would be happy to patch the code if
necessary, if somebody could point me into the right section.

Here is output of aplay -l, in case it helps:

**** List of PLAYBACK Hardware Devices ****
card 0: Loopback [Loopback], device 0: Loopback PCM [Loopback PCM]
   Subdevices: 8/8
   Subdevice #0: subdevice #0
   Subdevice #1: subdevice #1
   Subdevice #2: subdevice #2
   Subdevice #3: subdevice #3
   Subdevice #4: subdevice #4
   Subdevice #5: subdevice #5
   Subdevice #6: subdevice #6
   Subdevice #7: subdevice #7
card 0: Loopback [Loopback], device 1: Loopback PCM [Loopback PCM]
   Subdevices: 8/8
   Subdevice #0: subdevice #0
   Subdevice #1: subdevice #1
   Subdevice #2: subdevice #2
   Subdevice #3: subdevice #3
   Subdevice #4: subdevice #4
   Subdevice #5: subdevice #5
   Subdevice #6: subdevice #6
   Subdevice #7: subdevice #7
card 1: PCH [HDA Intel PCH], device 0: Generic Analog [Generic Analog]
   Subdevices: 1/1
   Subdevice #0: subdevice #0


PS: why are there 2 loopback devices, with 8 subdevices?
When I am alredy at it, can I change tat in the kernel, so that I only
have 1 loopback device for simplicity ?

thank you,
