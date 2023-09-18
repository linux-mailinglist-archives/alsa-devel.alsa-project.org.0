Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7217A4A8F
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 15:20:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDB036C0;
	Mon, 18 Sep 2023 15:19:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDB036C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695043213;
	bh=CuataMUEyVikdRHTR22s60Cl4ND2HQARZ8DtUCWfG3A=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VwRrtlRBxrUXo6a/qRsWti+FIEbHNAvWe5apAQkm0UAj1+yz3ID9bvvBASprnElO9
	 eATiRU4834cfqqwPRzdHEzhaEDgt7hsFo4tTqMzfSxnoY5v4/1gkncL1FApFoxFty/
	 UCVM9owfBlVjB/wA7y6FoqGcixrByVAbJ6fYpsdc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98391F80551; Mon, 18 Sep 2023 15:19:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63625F801D5;
	Mon, 18 Sep 2023 15:19:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AC9EF801F5; Mon, 18 Sep 2023 15:19:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from asave02.hostfactory.ch (asave02.hostfactory.ch
 [217.150.252.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25B47F80125
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 15:19:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25B47F80125
Received: from server11.hostfactory.ch ([185.117.169.60])
	by asave02.hostfactory.ch with esmtps (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <michele.perrone@weiss.ch>)
	id 1qiE9g-000KCM-AO; Mon, 18 Sep 2023 15:19:14 +0200
Received: from [192.168.0.85]
 (156.14.3.213.static.wline.lns.sme.cust.swisscom.ch [213.3.14.156])
	(Authenticated sender: michele.perrone@weiss.ch)
	by server11.hostfactory.ch (Postfix) with ESMTPSA id EFB88406E8E5B;
	Mon, 18 Sep 2023 15:19:10 +0200 (CEST)
Message-ID: <eb2cd50f-04c9-47f6-9fb3-c75d7b20a563@weiss.ch>
Date: Mon, 18 Sep 2023 15:19:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: MAN301 external clock issues (Re: [PATCH] ALSA: dice: add stream
 format parameters for Weiss devices)
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20230905235441.GA24829@workstation.local>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Rolf Anderegg <rolf.anderegg@weiss.ch>,
 alsa-devel@alsa-project.org
From: Michele Perrone <michele.perrone@weiss.ch>
In-Reply-To: <20230905235441.GA24829@workstation.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <169504315132.19284.13001116025218913990@server11.hostfactory.ch>
X-PPP-Vhost: weiss.ch
X-Originating-IP: 185.117.169.60
X-SpamExperts-Domain: outboundprotection.hostfactory.ch
X-SpamExperts-Username: 185.117.169.60
Authentication-Results: hostfactory.ch;
 auth=pass smtp.auth=185.117.169.60@outboundprotection.hostfactory.ch
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.06)
X-Recommended-Action: accept
X-Filter-ID: 
 Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9YxNVnKAqjhcfWfQQqfZD5PUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5ynOqv5wVH0VS/etXvrFNNzaJlM0GUlwLkcZrRacppWhTh3
 wKoTBNAKgp9qBcKLgDljPyzCxIJm7qFlTroi9VKv/7Rl0Dd5eFQ0eM8i42SsSUGlz8CJSOMrvzx9
 TVg3RkWQ6c4UiQBR66nPA1IbkGNlp8jZ4AoGBlDR94YkH0RjFcsS2wyX4wFvfD5xwAerAR9lOVrL
 YTpDlVt2LhrK2BfEQs6EgGedxeuvfrMrARjFPFvgLMSxRi5YRTe8Z3SJQg3k/agSvtgte2zCXW1J
 lwXnBK88wSgI9iE9tWo2DOKsd0rqhy+tapdwJ8uKml1tG0Pt3JsC5e/DlYVV9jqBtc/t9a3fvBg8
 I7q5hFKojyxxcVkDWpg3cUqnTXK7+jR2jt1xuwt6BW/LqWzUw+fkjzpuRAwX31WVY5lWjWxuGSRu
 xdeJD5/Wl4aBF+CY0mxh2pSR7yU2QIWCTCd5A9CNaN6pRWtLR0Mn2ASypXTCTfApisVZPVE5xgLw
 XEbnvqUcIYd16SviU/hmLrTy1VycMwgpTs2BZNjhN1NaK5LAGwujj33UzKaibcXCMztdU5OxbHAz
 rxMg36Jn7L4UIiMZgOGil2hsR99u5gXb6tWyU4Ig+a0jiD6XqsJZtjQxlyCdsey58WWBxScz+7ZU
 b5hec23OlEC8+erD3OkwDkKYW7EGEyBYBNrmJdst/PgiVbfVm5gVQDVq6up0K/2HSasMXS5TKY5u
 jgGwWVuemfvhvSIcUI9y7ZZuUeOGm+4qk1nHR1YRFZ4oobg8BBg3Jq+ntzj0TU+pCeNHSwntkibz
 BzZIRllmsK3yNAFcZTU4WEP7zO8Gm7aaCl3M5SpNcWXJO6248Kj+DOJNiwIlttKhifiux2bjO41F
 yBEqIaDudcVplPFtaXc7xOjH9dPpz2edJqwXnVPd3Rv7yHTtOavNlNtFUdd7RPkK3o/sjAPglERp
 S+MW3C/Zgln8It1ygSUkJAGD4r2nh0dmBVoho+yhCdMzNxGzP5KUoLsGY7m9SCwGWpgHbZtuKdsE
 YWqRhqAcba8sq/6xsNA0tMoVZz3DSMzt5eis4Xuj3CbeOaSyPKeW4H8n8Hbamu81eV+uiBiCWQZ4
 YWVFr7auOOhAKS4grcT7xQ==
X-Report-Abuse-To: spam@asave01.hostfactory.ch
Message-ID-Hash: ULJMTYUCIAASQC4YBTXBB47K4DMXCDTV
X-Message-ID-Hash: ULJMTYUCIAASQC4YBTXBB47K4DMXCDTV
X-MailFrom: michele.perrone@weiss.ch
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ULJMTYUCIAASQC4YBTXBB47K4DMXCDTV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

I'm encountering a strange issue when working with our MAN301 device and
external clock sync. I am currently using our kernel-side AV/C code to
switch between clock sources[1].

When I switch to an external clock source, the user-space ALSA code is not
able to change the clock rate anymore. This means that I cannot switch to
the external clock rate that the DICE is currently locked onto.

Here is a practical example / steps to reproduce:

1. Set the clock source to internal and the clock rate to an arbitrary
    value (e.g. 44100) from the user-space. The relevant sections of
    /proc/asound/card0/firewire/dice will then look like this:

global:
   owner: ffc0:000100000000
   notification: 00000040
   nick name: Weiss MAN301
   clock select: internal 44100
   enable: 0
   status: locked 44100
   ext status: 00010001
   sample rate: 44100
   version: 1.0.12.0
   clock caps: 44100 48000 88200 96000 176400 192000 aes1 aes2 aes3 wc 
internal
   clock source names: AES/EBU (XLR)\S/PDIF (RCA)\S/PDIF 
(TOS)\Unused\Unused\Unused\Unused\Word Clock 
(BNC)\Unused\Unused\Unused\Unused\Internal\\

ext status:
   clock source: internal
   locked: 1
   rate: 44100

2. Set the clock source to external (e.g. aes1) through AV/C command[1]
    and connect a digital input with a different clock rate (e.g. 48000).
    Now the two sections of will look like this. You can see that the
    external source status is "locked".

global:
   owner: ffc0:000100000000
   notification: 00000010
   nick name: Weiss MAN301
   clock select: aes1 44100
   enable: 0
   status: unlocked 44100
   ext status: 00010001
   sample rate: 44100
   version: 1.0.12.0
   clock caps: 44100 48000 88200 96000 176400 192000 aes1 aes2 aes3 wc 
internal
   clock source names: AES/EBU (XLR)\S/PDIF (RCA)\S/PDIF 
(TOS)\Unused\Unused\Unused\Unused\Word Clock 
(BNC)\Unused\Unused\Unused\Unused\Internal\\

ext status:
   clock source: aes1
   locked: 1
   rate: 48000

3. Try to set the clock rate to 48000 from user-space ALSA. This will
    fail. Only 44100 can be used. Example:

$ aplay --disable-resample 48000_S32.wav
Playing WAVE '48000_S32.wav' : Signed 32 bit Little Endian, Rate 48000 
Hz, Stereo
Warning: rate is not accurate (requested = 48000Hz, got = 44100Hz)


The current workaround is going back to the internal clock source, switch
the clock rate to the one reported in the "ext status" section, and then
go back to the external clock source. This however does not feel quite
right.

I will be very grateful for any suggestion from your side.

Thank you and kind regards,
Michele Perrone

[1]https://github.com/weiss-engineering/snd-dice/blob/5a95496c0666048bc5bc8c07b3e1d74f392dc9a4/dice-avc.c#L436 

