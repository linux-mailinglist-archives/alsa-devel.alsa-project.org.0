Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12132792089
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 08:26:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40E7184B;
	Tue,  5 Sep 2023 08:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40E7184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693895162;
	bh=3dA6B21MpOeO+vnbYj6PlzE02mgKoVOK0wQ3YCGnuKc=;
	h=Date:To:References:Cc:From:Subject:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O6BLbHzJBCmdTDIG6+6HjMHTd4V+0n6MraJMtev+ExnwjJaNJ5hMeOTU6kGLc/mPF
	 76qu7Mq6MyDD+bl5dduxcHpCkKVneRq1KHyaJx4mrO4UShUnxMqP1msslGO0ozNbFB
	 UL2H7FTtmB/OAAkGqhl2ysXFJfEOHwokGdjrGek4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00501F80558; Tue,  5 Sep 2023 08:24:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DE50F80558;
	Tue,  5 Sep 2023 08:24:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E130F80494; Mon,  4 Sep 2023 18:01:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-6.5 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from asave02.hostfactory.ch (asave02.hostfactory.ch
 [217.150.252.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E71A0F800AA
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 18:00:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E71A0F800AA
Received: from server11.hostfactory.ch ([185.117.169.60])
	by asave02.hostfactory.ch with esmtps (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rolf.anderegg@weiss.ch>)
	id 1qdC02-0006gT-2f; Mon, 04 Sep 2023 18:00:33 +0200
Received: from [192.168.0.32]
 (156.14.3.213.static.wline.lns.sme.cust.swisscom.ch [213.3.14.156])
	(Authenticated sender: rolf.anderegg@weiss.ch)
	by server11.hostfactory.ch (Postfix) with ESMTPSA id DA14742A38641;
	Mon,  4 Sep 2023 18:00:24 +0200 (CEST)
Message-ID: <d102d417-c34d-b4f5-f037-e5460c01ea58@weiss.ch>
Date: Mon, 4 Sep 2023 18:00:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: de-CH
To: o-takashi@sakamocchi.jp
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20230728131308.GA142765@workstation.local>
 <7a0cf3fd-9e31-45e1-7aa4-97cab27dafa7@weiss.ch>
 <20230731140655.GA367100@workstation.local>
 <81450de2-3bf5-cb96-114f-6d75314e5a03@weiss.ch>
 <20230808152511.GA729027@workstation.local>
 <a41c675d-c1bd-4e89-9519-63b2b088f16d@weiss.ch>
 <20230822135807.GA470519@workstation.local>
 <20230831132817.GB174574@workstation.local>
Cc: alsa-devel@alsa-project.org, Michele Perrone <michele.perrone@weiss.ch>
From: Rolf Anderegg <rolf.anderegg@weiss.ch>
Organization: Weiss Engineering Ltd.
Subject: Re: ALSA: dice: improve support for Weiss devices
In-Reply-To: <20230831132817.GB174574@workstation.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <169384322527.22281.10021821344401036927@server11.hostfactory.ch>
X-PPP-Vhost: weiss.ch
X-Originating-IP: 185.117.169.60
X-SpamExperts-Domain: outboundprotection.hostfactory.ch
X-SpamExperts-Username: 185.117.169.60
Authentication-Results: hostfactory.ch;
 auth=pass smtp.auth=185.117.169.60@outboundprotection.hostfactory.ch
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.09)
X-Recommended-Action: accept
X-Filter-ID: 
 Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/QqFnbrALFnot/wSvVeZldPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5ynOqv5wVH0VS/etXvrFNNzaJlM0GUlwLkcZrRacppWhTh3
 wKoTBNAKgp9qBcKLgDl1CmCG4MXmWFl9KMUaH9XX58fMnqZUTt7CyKlJUh+zhrYhErDEEIdn/C4U
 8KpYKm2DJYXE4Dl0gs/Km8rE1WFZsa4tn+I7Msq8d2ButzR7zuNCJEw/kSI+NGmTkOAYrsWG+7KW
 gD+bDPIkhgaV+BrNPm4RC15bm+XtbeDRPYK0+jEhP40QAirHpNS4YoSI2qtGsLox8B6DUPOzRotI
 6xKqEjbpD80/bJiKjNrjoh6e0i1+Itm3Zi67f33Q0vSIt5Es9EoJF76glRJeGkLNzPOkhY6U4Nwm
 pcGPuCEf4Z43ofcLVphtCwl8mpTwF6N+yd3meH6vXVooEJgrc7O3bOwHG4jNxwLDu0EPJmzXz3lI
 JZGQYfs9F/5Z8G6oVO3G8vqzIh1wkn5B+muMTuS2LDwzt8Ds8HhMu8AsuC+XP0IWdXNPnE19HtJr
 tg3Pj7jTUmPeUd4qXkcTpXUhLfkIyoAKIK/1NH5THMtlYvyHAYGOGuJw+IsbRAYC1LPVQPP+P/MU
 IKFuyZZpeW4SbXxBSCRr93wvZTChPWwfDgTtlLzfbONw0JKLDioL9Z4pCXUCLbd61/pco8xTx3df
 E/RPFMfwCQLa5nNSdrQDB4LZxme9E5fOwaqLFCCS9XCFAivhVnG+2/Y3iC0yOiwsaVCcWrnB93wG
 SEFHjCmk2dux8tzSTKd7Rmxfs4ILxAJFVcQ/5Xb/yoaQOiMB7ZonIORAzSkLgCiMGTCTvDSRAoQA
 K/A0J2oFCRHPi46HPBrWGOmdew+L5G+4JpIW4R+nxuNie4yXloMKJlkXBiCTmD6N6o7ifIa+6T/z
 PdRUeNaWpSUdKA3DqcigOvSxdRnthmhn8Zn6uu3zsy2HWa01VCJlF37T+8b+yU156XkjK+YxHYcT
 0IBbSA6U/PExIgJ14JdFndotryNCh0sMXXeuXmotCoWhkxSj8rS+aoLPhLJzbnRZjOcnMDkGIqtX
 9wv/CDPO9I7KeNW0qU4GFuWhP2np9THNGLxl+IRxtooIbZZkii79MO4xL7hrJSk60SF3F6RYOYr2
X-Report-Abuse-To: spam@asave01.hostfactory.ch
X-MailFrom: rolf.anderegg@weiss.ch
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: THQPSOANUMPGLGO6ODRYXAKDOJKMBYLP
X-Message-ID-Hash: THQPSOANUMPGLGO6ODRYXAKDOJKMBYLP
X-Mailman-Approved-At: Tue, 05 Sep 2023 06:24:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: rolf.anderegg@weiss.ch
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/THQPSOANUMPGLGO6ODRYXAKDOJKMBYLP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

Glad that we could be of help.
We checked this on the firmware side and yes, we can confirm that the
Weiss MAN301 is the only device with AV/C protocol (using vendor dependent
commands).

We are deploying a small set of commands in order to probe and control
the parameters on the MAN301:

WEISS_CMD_ID_DEV_CONST:
	probe the number of parameters

WEISS_CMD_ID_PARAM_OP:
	read/write to a parameter

WEISS_CMD_ID_PARAM_INFO:
	read parameter info (index, type, iface type, name)

WEISS_CMD_ID_ENUM_ITEM_INFO:
	read parameter enum type info

This allows us to populate and control snd-control instances that represent
the device's featured parameters [1].

How would you like to proceed for `snd-firewire-ctl-services`?
We can start by giving you the output of `amixer contents` for the MAN301,
so you see all the controls and their possible values (see below).

Let us know if there's any additional information we can provide.

Kind regards,
Rolf Anderegg


[1] https://github.com/weiss-engineering/snd-dice/blob/avc/dice-avc.c



--
$ amixer contents
numid=3,iface=CARD,name='Dual Wire Mode Switch'
   ; type=BOOLEAN,access=rw------,values=1
   : values=off
numid=4,iface=CARD,name='Dual Wire Word Clock Half Rate Switch'
   ; type=BOOLEAN,access=rw------,values=1
   : values=off
numid=1,iface=CARD,name='Sync source'
   ; type=ENUMERATED,access=rw------,values=1,items=13
   ; Item #0 'AES1'
   ; Item #1 'AES2'
   ; Item #2 'AES3'
   ; Item #3 'AES4'
   ; Item #4 'AES'
   ; Item #5 'ADAT'
   ; Item #6 'TDIF'
   ; Item #7 'Wordclock'
   ; Item #8 'ARX1'
   ; Item #9 'ARX2'
   ; Item #10 'ARX3'
   ; Item #11 'ARX4'
   ; Item #12 'Internal'
   : values=2
numid=10,iface=MIXER,name='DAC::Analog Output Level'
   ; type=ENUMERATED,access=rw------,values=1,items=4
   ; Item #0 '0 dB'
   ; Item #1 '-10 dB'
   ; Item #2 '-20 dB'
   ; Item #3 '-30 dB'
   : values=1
numid=8,iface=MIXER,name='DAC::DAC Filter Type'
   ; type=ENUMERATED,access=rw------,values=1,items=2
   ; Item #0 'A'
   ; Item #1 'B'
   : values=0
numid=9,iface=MIXER,name='DAC::DAC Output Playback Switch'
   ; type=BOOLEAN,access=rw------,values=1
   : values=on
numid=7,iface=MIXER,name='DAC::DAC Polarity Inversion Playback Switch'
   ; type=BOOLEAN,access=rw------,values=1
   : values=off
numid=2,iface=MIXER,name='Digital Input Capture Route'
   ; type=ENUMERATED,access=rw------,values=1,items=3
   ; Item #0 'AES/EBU (XLR)'
   ; Item #1 'S/PDIF (RCA)'
   ; Item #2 'S/PDIF (TOS)'
   : values=2
numid=6,iface=MIXER,name='RCA::RCA Output Playback Switch'
   ; type=BOOLEAN,access=rw------,values=1
   : values=on
numid=5,iface=MIXER,name='XLR::XLR Output Playback Switch'
   ; type=BOOLEAN,access=rw------,values=1
   : values=on



On 31.08.23 15:28, Takashi Sakamoto wrote:
> Hi Michele,
> 
> Thanks for your contribution of configuration ROM for Weiss models[1].
> I'm sorry for my little reaction but currently I'm working for Debian ITP
> to linux-firewire-utils package[2][3].
> 
> As a quick glance, all of configuration ROMs except for Weiss MAN301
> include single unit directory, while the exception includes two unit
> directories; 1394TA AV/C protocol and TCAT protocol. It means that
> the vendor-dependent AV/C command[4] is implemented in MAN301, but not
> in the others. Then I would like to figure out whether it is correct or
> not. If it is unique for MAN301, the implementation of control service
> can be simpler to support the command just for MAN301.
> 
> [1] https://github.com/takaswie/am-config-roms/pull/5
> [2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1050551
> [3] https://mentors.debian.net/package/linux-firewire-utils/
> [4] https://github.com/weiss-engineering/snd-dice/blob/avc/dice-avc.c
> 
> 
> Regards
> 
> Takashi Sakamoto
