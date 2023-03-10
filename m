Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C03546B40AB
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 14:44:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F04AB1891;
	Fri, 10 Mar 2023 14:43:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F04AB1891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678455886;
	bh=+oTjUT9dWlCUZC8w4w2lkVrrPHUfdJBooaWDyj+iano=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:From;
	b=SE4vCKO/rEBtaGVrZke01Gu2tvEp2j00IUE18swlcG5J7hQ3DDCINsyYlRhGohSX6
	 a1YoNqgou86Uaach7sqek9BeGVtB4zS5uL37smhVuxeVer+W4A6sk2nMHjWDP6zq8W
	 6HVkrzV6JXSZaJQDIGZjtmOm+09DBHKiMdJC86+c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A5B1F8042F;
	Fri, 10 Mar 2023 14:43:55 +0100 (CET)
Date: Fri, 10 Mar 2023 14:43:25 +0100
Subject: Re: TC-Helicon Blender
To: alsa-devel@alsa-project.org
References: <948733d5-cbea-2c9f-95c7-6e95fdcacaba@echtzeit.solutions>
 <87fsafiy9t.wl-tiwai@suse.de>
In-Reply-To: <87fsafiy9t.wl-tiwai@suse.de>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WLNFDO5ILEYF5ACBFSSYPNIRLG7BOGSF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167845583457.26.16247414324665605100@mailman-core.alsa-project.org>
From: =?utf-8?q?Florian_H=C3=A4nel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?Q?Florian_H=c3=a4nel?= <florian.haenel@echtzeit.solutions>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79572F8042F; Fri, 10 Mar 2023 14:43:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.echtzeit.solutions (echtzeit.solutions [116.203.43.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 588D8F80093
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 14:43:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 588D8F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=echtzeit.solutions header.i=@echtzeit.solutions
 header.a=rsa-sha256 header.s=dkim header.b=ZKIRrl6f
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BD2F9DB06D
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 14:43:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=echtzeit.solutions;
	s=dkim; t=1678455822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fh4ZSVN13PVjalXDGvWqe8/7Cr2aaG80RgAKnKnY3Ak=;
	b=ZKIRrl6fOW5hZjT4355JnFBj0J2CxLo3pPKvRe1XYAKhHIZ5ZWTli1qagtU4wYyjeZzS/P
	5RrooosyinOfPjaiBEXm1/Ghoj7NUXBFeDl4fekmRp0V8ZHtdRtvbmEVz8onN3QdzXTTZI
	1MFxn5wqsStoIMGHmw+efRgLApdGYQpQHTGZtuyxeY6Ery3lyp4w8PZSO5LAA9+ntC6PQh
	zO4LNBxSD4e8xO3hBZVbU6gqLSvGsQ1nuWt0AvirDUzLGk9bK9h28g8FhSSQoH0ttV+ywn
	b0XxP6MkHGPsokNEr2s0nI3KpJ/MOYbD+Iw624qsfa9KVDa2ipF2CNEbPydegQ==
Content-Type: multipart/mixed; boundary="------------2KUDlwlbFE00og4OLUeXK0zS"
Message-ID: <123b29e0-b3f1-66b4-b69a-bcd0cadfed80@echtzeit.solutions>
Date: Fri, 10 Mar 2023 14:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: TC-Helicon Blender
Content-Language: en-US
To: alsa-devel@alsa-project.org
References: <948733d5-cbea-2c9f-95c7-6e95fdcacaba@echtzeit.solutions>
 <87fsafiy9t.wl-tiwai@suse.de>
From: =?UTF-8?Q?Florian_H=c3=a4nel?= <florian.haenel@echtzeit.solutions>
In-Reply-To: <87fsafiy9t.wl-tiwai@suse.de>
Message-ID-Hash: WLNFDO5ILEYF5ACBFSSYPNIRLG7BOGSF
X-Message-ID-Hash: WLNFDO5ILEYF5ACBFSSYPNIRLG7BOGSF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WLNFDO5ILEYF5ACBFSSYPNIRLG7BOGSF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a multi-part message in MIME format.
--------------2KUDlwlbFE00og4OLUeXK0zS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 08.03.23 06:54, Takashi Iwai wrote:
> On Mon, 13 Feb 2023 08:57:19 +0100,
> Florian Hänel wrote:
>> I have this USB device called TC-Helicon Blender which provides 12
>> input streams, 8 output streams (6/4 stereo plugs), in addition to
>> some midi interface and internal playback and record channel.
>>
>> Bus 005 Device 016: ID 1220:8fe1 TC Electronic Blender
>>
>> If I power the device on while connected to a windows machine with its
>> driver installed, then plug it into my linux machine, it appears to
>> work correctly:
>>
>> arecord -D front:CARD=Blender  -r48000 -fS32_LE -c 12 blender.wav -d 20
>> Recording WAVE 'blender.wav' : Signed 32 bit Little Endian, Rate 48000
>> Hz, Channels 12
>>
>> 46080044 blender.wav
>>
>> However if I have it on my linux machine while powering it on, I only
>> get timeouts and no samples from arecord:
>>
>> arecord -D front:CARD=Blender  -r48000 -fS32_LE -c 12 blender.wav -d 20
>> Recording WAVE 'blender.wav' : Signed 32 bit Little Endian, Rate 48000
>> Hz, Channels 12
>> arecord: pcm_read:2221: read error: Input/output error
>>
>> 44 blender.wav
> So the device didn't give any data.

The maintainer of  the userland utility that makes a device of the same 
manufacturer work on osx and linux has provided this experimental patch.

Could you provide some feedback if this approach would be welcomed into 
alsa?

As I understand it it requires sending some vendor configuration packets.


- Florian

--------------2KUDlwlbFE00og4OLUeXK0zS
Content-Type: text/x-patch; charset=UTF-8; name="goxlr-patch.diff"
Content-Disposition: attachment; filename="goxlr-patch.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NvdW5kL3VzYi9xdWlya3MuYyBiL3NvdW5kL3VzYi9xdWlya3MuYwpp
bmRleCAzZWNkMWJhN2ZkNGIuLjM2ZWE1YWFiZDQxZCAxMDA2NDQKLS0tIGEvc291bmQvdXNi
L3F1aXJrcy5jCisrKyBiL3NvdW5kL3VzYi9xdWlya3MuYwpAQCAtMTM5MCw2ICsxMzkwLDI1
IEBAIHN0YXRpYyBpbnQgc25kX3VzYl9tb3R1X21fc2VyaWVzX2Jvb3RfcXVpcmsoc3RydWN0
IHVzYl9kZXZpY2UgKmRldikKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBzbmRfdXNi
X2dveGxyX2Jvb3RfcXVpcmsoc3RydWN0IHVzYl9kZXZpY2UgKmRldikKK3sKKwkvKiBMb2Fk
IHRoZSA0ODAwMEh6IHJhdGUgaW50byBhIGJ1ZmZlciAqLworCXU4IHNyYXRlWzRdID0gezB4
ODAsIDB4YmIsIDB4MDAsIDB4MDB9OworCXU4IHRlbXBbMjRdOworCisJLyogQ2xlYXIgdGhl
IFZlbmRvciBidWZmZXIsIHdlIGRvbid0IG5lZWQgdG8gZG8gYW55dGhpbmcgd2l0aCB0aGlz
IGRhdGEgKi8KKwlzbmRfdXNiX2N0bF9tc2coZGV2LCB1c2JfcmN2Y3RybHBpcGUoZGV2LDAp
LCAweDAwLAorCQlVU0JfRElSX0lOIHwgVVNCX1RZUEVfVkVORE9SIHwgVVNCX1JFQ0lQX0lO
VEVSRkFDRSwKKwkJMCwgMCwgJnRlbXAsIDB4MDAxOCk7CisKKwkvKiBTZW5kIHRoZSBwYWNr
ZXQgdG8gYWN0aXZhdGUgdGhlIGF1ZGlvIGF0IDQ4MDAwSHogKi8KKwlzbmRfdXNiX2N0bF9t
c2coZGV2LCB1c2Jfc25kY3RybHBpcGUoZGV2LCAwKSwgMHgwMSwKKwkJVVNCX0RJUl9PVVQg
fCBVU0JfVFlQRV9DTEFTUyB8IFVTQl9SRUNJUF9JTlRFUkZBQ0UsCisJCTB4MDEwMCwgMHgy
OTAwLCAmc3JhdGUsIDB4MDAwNCk7CisKKwlyZXR1cm4gMDsKK30KKwogLyoKICAqIFNldHVw
IHF1aXJrcwogICovCkBAIC0xNjE3LDYgKzE2MzYsMTAgQEAgaW50IHNuZF91c2JfYXBwbHlf
Ym9vdF9xdWlyayhzdHJ1Y3QgdXNiX2RldmljZSAqZGV2LAogCQkgICAgZ2V0X2lmYWNlX2Rl
c2MoaW50Zi0+YWx0c2V0dGluZyktPmJJbnRlcmZhY2VOdW1iZXIgPCAzKQogCQkJcmV0dXJu
IHNuZF91c2JfbW90dV9taWNyb2Jvb2tpaV9ib290X3F1aXJrKGRldik7CiAJCWJyZWFrOwor
CisJY2FzZSBVU0JfSUQoMHgxMjIwLCAweDhmZTApOiAvKiBUQy1IZWxpY29uIEdvWExSICov
CisJY2FzZSBVU0JfSUQoMHgxMjIwLCAweDhmZTQpOiAvKiBUQy1IZWxpY29uIEdvWExSIE1p
bmkgKi8KKwkJcmV0dXJuIHNuZF91c2JfZ294bHJfYm9vdF9xdWlyayhkZXYpOwogCX0KIAog
CXJldHVybiAwOwo=

--------------2KUDlwlbFE00og4OLUeXK0zS--
