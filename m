Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C05813D72
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 23:45:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B8F3A4A;
	Thu, 14 Dec 2023 23:44:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B8F3A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702593903;
	bh=LYXCU9fi63kDFhednd7yX9odQt4cJeEAeLW9S1G4NwM=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IKT5U/0I8uU5mTOcbF5zzesh/WJsQIT/hF/r/qm1W8RtXMPSzA0JQQysV9y2O8e3F
	 aGZa5xKtZI4GRWFIYMatK5ZEN+Aa7nBTTiKSzAIGrn1jvI2fusW88oSrnA/6f0zfoG
	 UdT3WPvxqSDstBE0Yis3ahazXOiWt2NGHWgaJazQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10308F8019B; Thu, 14 Dec 2023 23:44:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80224F80166;
	Thu, 14 Dec 2023 23:44:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 667AEF8016A; Thu, 14 Dec 2023 23:42:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7211BF8001F
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 23:42:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7211BF8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=A+mnfaIu
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c69403b3eso562125e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 14 Dec 2023 14:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702593718; x=1703198518;
 darn=alsa-project.org;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LYXCU9fi63kDFhednd7yX9odQt4cJeEAeLW9S1G4NwM=;
        b=A+mnfaIu85xR/kuXNa9iz8hNTPtfgmFlwppImIl3/av0Vb6BKlrgKHnM3/8lnoau9F
         JMbEaGc30yq6YR0/KlsNisUiRQpPVe+QbkhlscUj77pY3cdBn+Eow77vZFSJL6HOWZ8f
         19Eq3lvFcVdnNH1By3QuqO8oujVVTPxsgp+RW3xmGMl48V7cZaUsTL9mV+Jq3MNEqHWi
         XrLn3g2c2KegOYngvNTgf/kBYMyPRjM94fa86rIuBqsz9ZevvJpylkKD+VsrNFZF3avs
         QQr3C5UoVfgYORP5Jd3jBq18ojcFNq2RpUjIfsi5eG7K69GgVRFMqcYypGeWhC7k7tDu
         crkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702593718; x=1703198518;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYXCU9fi63kDFhednd7yX9odQt4cJeEAeLW9S1G4NwM=;
        b=tpehk1kd/iTxHgm/vKr8AGXCAm1j5pfH520nyJ/qGl6OFJgD7rJqbISwol95AWgYWl
         xlOJH6mU5L2j3HSinnaURGVOUHgqmVnBVNyiL7FidkruLzH2hQ1HcarZ2EIPdbmHKSq4
         38dNX1JdXfkHEzzXQtaLhI9+khPJn4bUV60v5PXngqgf6Xu9ZPJmOSfMqNMjPlOBBQX3
         dgO/qL48LZNy8NyPBU+4ya3ah6EurHcDm3ooa6GbgxFtc/FP8Y/4YcEg8VVen+zHoNG2
         1Kv/Kq74/bgfgbEjtTuIhMn5Biik8Kvee49hb2rPnEiiQQb19gAdILUrRnZBw26Up0Fw
         TOOg==
X-Gm-Message-State: AOJu0Yy9Wdk+tg0toRn784Xw6+QzDH6G/Zrz0LWsW7TUGWmN/jltKBV9
	359wwpONDlmP7cRFQ8gElWEdv+PJdqw=
X-Google-Smtp-Source: 
 AGHT+IHHtc/msVAOypPWk0mQDbzuZjeFa44N6Q6UXSyU3idGbYBVtsGlmrEVwgfgEsN8hRbclVlv/g==
X-Received: by 2002:a05:600c:444e:b0:40c:48c2:f69f with SMTP id
 v14-20020a05600c444e00b0040c48c2f69fmr3538034wmn.12.1702593717556;
        Thu, 14 Dec 2023 14:41:57 -0800 (PST)
Received: from ?IPV6:2001:861:3381:daa0:f66d:4ff:fe9a:2c1?
 ([2001:861:3381:daa0:f66d:4ff:fe9a:2c1])
        by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c468800b0040c488e4fb5sm16335216wmo.40.2023.12.14.14.41.56
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 14:41:56 -0800 (PST)
Sender: Sebastien ALAIWAN <sebastien.alaiwan@gmail.com>
Message-ID: <39898130-8f05-48d4-9e18-5456bfcf6acd@gmail.com>
Date: Thu, 14 Dec 2023 23:41:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: alsa-devel@alsa-project.org
From: Sebastien Alaiwan <sebastien.alaiwan+alsa@gmail.com>
Subject: Getting a strange error code with Behringer UMC1820
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UodIyrDyGkh652TyvK3ohiMb"
Message-ID-Hash: 6ODOC74DOCZ5NULKR4JD3MBDSHJ7DLYF
X-Message-ID-Hash: 6ODOC74DOCZ5NULKR4JD3MBDSHJ7DLYF
X-MailFrom: sebastien.alaiwan+alsa@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ODOC74DOCZ5NULKR4JD3MBDSHJ7DLYF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UodIyrDyGkh652TyvK3ohiMb
Content-Type: multipart/mixed; boundary="------------t16qKO5DnssVRG0YPEt0j0oL";
 protected-headers="v1"
From: Sebastien Alaiwan <sebastien.alaiwan+alsa@gmail.com>
To: alsa-devel@alsa-project.org
Message-ID: <39898130-8f05-48d4-9e18-5456bfcf6acd@gmail.com>
Subject: Getting a strange error code with Behringer UMC1820

--------------t16qKO5DnssVRG0YPEt0j0oL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkndmUgYmVlbiBydW5uaW5nIHNvbWUgZXhwZXJpbWVudHMgb24gdGhlIEJlaHJp
bmdlciBVTUMxODIwLCB3aGljaCBpcyBhIFVTQiBhdWRpbyBpbnRlcmZhY2UsIHN1cHBvc2Vk
bHkgY2xhc3MtY29tcGxpYW50Lg0KSSB3cm90ZSBhIHRpbnkgcHJvZ3JhbSAiYWxzYS1zaW5l
IiB0aGF0IHNpbXBseSBwbGF5cyBzaWxlbmNlIG9uIGEgZ2l2ZW4gQUxTQSBkZXZpY2UgKCBw
bGVhc2UgZmluZCB0aGUgc291cmNlIGZvciBpdCBhdCB0aGUgYm90dG9tIG9mIHRoaXMgbWVz
c2FnZSApLg0KVGhpcyB0aW55IHByb2dyYW0gYWxsb3dzIHRvIHNwZWNpZnkgdGhlIGJ1ZmZl
ciBzaXplLCBhbmQgdGhlIHBlcmlvZCBzaXplICggSGVyZSwgSSdsbCBhbHdheXMgYmUgdXNp
bmcgYSBidWZmZXIgc2l6ZSBvZiAyNTYgKS4NCg0KSGVyZSwgaSdtIHRlc3RpbmcgNSB2YWx1
ZXMgZm9yIHRoZSBwZXJpb2Qgc2l6ZSAodGhlIGxhc3QgY29tbWFuZCBsaW5lIGFyZ3VtZW50
KS4gQWxsIHBlcmlvZCBzaXplcyB3b3JrLCBleGNlcHQgLi4uIDEyNy4NClNlZSBiZWxvdzoN
Cg0KIMKgwqDCoCAkIC4vYWxzYV9zaW5lICdodzpDQVJEPVVNQzE4MjAsREVWPTAnIDI1NiAx
MjUNCiDCoMKgwqAgYnVmZmVyX3NpemU9MjU2IChhc2tlZCAyNTYpLCBwZXJpb2Rfc2l6ZT0x
MjUgKGFza2VkIDEyNSksIGNoYW5uZWxzPTEyLCBmb3JtYXQ9UzI0XzNMRSAoMjQgYnBwKQ0K
IMKgwqDCoCBPSw0KDQogwqDCoMKgICQgLi9hbHNhX3NpbmUgJ2h3OkNBUkQ9VU1DMTgyMCxE
RVY9MCcgMjU2IDEyNg0KIMKgwqDCoCBidWZmZXJfc2l6ZT0yNTYgKGFza2VkIDI1NiksIHBl
cmlvZF9zaXplPTEyNiAoYXNrZWQgMTI2KSwgY2hhbm5lbHM9MTIsIGZvcm1hdD1TMjRfM0xF
ICgyNCBicHApDQogwqDCoMKgIE9LDQoNCiDCoMKgwqAgJCAuL2Fsc2Ffc2luZSAnaHc6Q0FS
RD1VTUMxODIwLERFVj0wJyAyNTYgMTI3DQogwqDCoMKgIGJ1ZmZlcl9zaXplPTI1NiAoYXNr
ZWQgMjU2KSwgcGVyaW9kX3NpemU9MTI3IChhc2tlZCAxMjcpLCBjaGFubmVscz0xMiwgZm9y
bWF0PVMyNF8zTEUgKDI0IGJwcCkNCiDCoMKgwqAgW2Fsc2Ffc2luZS5jOjY2XSBlcnJvcjog
c25kX3BjbV9kcmFpbihwY20pIDogSW5wdXQvb3V0cHV0IGVycm9yDQogwqDCoMKgIEFib3J0
aW5nLg0KDQogwqDCoMKgICQgLi9hbHNhX3NpbmUgJ2h3OkNBUkQ9VU1DMTgyMCxERVY9MCcg
MjU2IDEyOA0KIMKgwqDCoCBidWZmZXJfc2l6ZT0yNTYgKGFza2VkIDI1NiksIHBlcmlvZF9z
aXplPTEyOCAoYXNrZWQgMTI4KSwgY2hhbm5lbHM9MTIsIGZvcm1hdD1TMjRfM0xFICgyNCBi
cHApDQogwqDCoMKgIE9LDQoNCiDCoMKgwqAgJCAuL2Fsc2Ffc2luZSAnaHc6Q0FSRD1VTUMx
ODIwLERFVj0wJyAyNTYgMTI5DQogwqDCoMKgIGJ1ZmZlcl9zaXplPTI1NiAoYXNrZWQgMjU2
KSwgcGVyaW9kX3NpemU9MTI4IChhc2tlZCAxMjkpLCBjaGFubmVscz0xMiwgZm9ybWF0PVMy
NF8zTEUgKDI0IGJwcCkNCiDCoMKgwqAgT0sNCg0KSSBhbHNvIG93biBhIFZpcnVzIFRJLCB3
aGljaCBhbHNvIGltcGxlbWVudHMgYW4gVVNCIGF1ZGlvIGludGVyZmFjZSwgYWxzbyBzdXBw
b3NlZGx5IGNsYXNzLWNvbXBsaWFudC4NClNvIEkgcmFuIHRoZSBzYW1lIHRlc3Qgb24gaXQs
IGFuZCBpbnRlcmVzdGluZ2x5LCB0aGVyZSdzIG5vIGVycm9yOg0KDQogwqDCoMKgICQgLi9h
bHNhX3NpbmUgJ2h3OkNBUkQ9VEksREVWPTAnIDI1NiAxMjUNCiDCoMKgwqAgYnVmZmVyX3Np
emU9MjU2IChhc2tlZCAyNTYpLCBwZXJpb2Rfc2l6ZT0xMjUgKGFza2VkIDEyNSksIGNoYW5u
ZWxzPTIsIGZvcm1hdD1TMTZfTEUgKDE2IGJwcCkNCiDCoMKgwqAgT0sNCg0KIMKgwqDCoCAk
IC4vYWxzYV9zaW5lICdodzpDQVJEPVRJLERFVj0wJyAyNTYgMTI2DQogwqDCoMKgIGJ1ZmZl
cl9zaXplPTI1NiAoYXNrZWQgMjU2KSwgcGVyaW9kX3NpemU9MTI2IChhc2tlZCAxMjYpLCBj
aGFubmVscz0yLCBmb3JtYXQ9UzE2X0xFICgxNiBicHApDQogwqDCoMKgIE9LDQoNCiDCoMKg
wqAgJCAuL2Fsc2Ffc2luZSAnaHc6Q0FSRD1USSxERVY9MCcgMjU2IDEyNw0KIMKgwqDCoCBi
dWZmZXJfc2l6ZT0yNTYgKGFza2VkIDI1NiksIHBlcmlvZF9zaXplPTEyNyAoYXNrZWQgMTI3
KSwgY2hhbm5lbHM9MiwgZm9ybWF0PVMxNl9MRSAoMTYgYnBwKQ0KIMKgwqDCoCBPSw0KDQog
wqDCoMKgICQgLi9hbHNhX3NpbmUgJ2h3OkNBUkQ9VEksREVWPTAnIDI1NiAxMjgNCiDCoMKg
wqAgYnVmZmVyX3NpemU9MjU2IChhc2tlZCAyNTYpLCBwZXJpb2Rfc2l6ZT0xMjggKGFza2Vk
IDEyOCksIGNoYW5uZWxzPTIsIGZvcm1hdD1TMTZfTEUgKDE2IGJwcCkNCiDCoMKgwqAgT0sN
Cg0KIMKgwqDCoCAkIC4vYWxzYV9zaW5lICdodzpDQVJEPVRJLERFVj0wJyAyNTYgMTI5DQog
wqDCoMKgIGJ1ZmZlcl9zaXplPTI1NiAoYXNrZWQgMjU2KSwgcGVyaW9kX3NpemU9MTI4IChh
c2tlZCAxMjkpLCBjaGFubmVscz0yLCBmb3JtYXQ9UzE2X0xFICgxNiBicHApDQogwqDCoMKg
IE9LDQoNClNvIGF0IHRoaXMgcG9pbnQsIEknbSB3b25kZXJpbmcgaWYgSSBtaWdodCBiZSBk
b2luZyBzb21ldGhpbmcgd3JvbmcuIEknbSBub3QgdHJ5aW5nIHRvIGFjaGlldmUgYW55dGhp
bmcgaGVyZSBvdGhlciB0aGFuIHRyeWluZyB0byB1bmRlcnN0YW5kIHdoYXQncyBnb2luZyBv
bi4NCk1heWJlIHRoZSBVTUMxODIwIGRvZXNuJ3Qgc3VwcG9ydCBhIHBlcmlvZCBzaXplIG9m
IDEyNyA/ICggZG9lcyBpdCBldmVuIG1ha2Ugc2Vuc2UgdG8gc2F5IHRoaXM/ICkgSWYgc28s
IGhvdyBpcyBpdCBwb3NzaWJsZSBmb3IgYW4gYXBwbGljYXRpb24gdG8ga25vdyBhYm91dCB0
aGlzIGxpbWl0YXRpb24/DQpNYXliZSBteSB0ZXN0IHByb2dyYW0gaXMgc2ltcGx5IGluY29y
cmVjdCwgYW5kIGl0J3MgYmVoYXZpb3IgaXMgdW5kZWZpbmVkPyBCdXQgdGhlbiwgaG93IGNh
biB3ZSBleHBsYWluIHRoZSBkaWZmZXJlbmNlIGluIGJlaGF2aW9yIGJldHdlZW4gdGhlIFVN
QzE4MjAgYW5kIHRoZSBWaXJ1cyBUSSA/DQoNCk15IGtlcm5lbCB2ZXJzaW9uIGlzOiBMaW51
eCBBTlRFQyA2LjUuMC01LWFtZDY0ICMxIFNNUCBQUkVFTVBUX0RZTkFNSUMgRGViaWFuIDYu
NS4xMy0xICgyMDIzLTExLTI5KSB4ODZfNjQgR05VL0xpbnV4DQpBbHNvLCBEZWJpYW4gdGVs
bHMgbWUgSSdtIHVzaW5nIHRoZSBwYWNrYWdlOiBsaWJhc291bmQgMS4yLjEwLTENCg0KQlRX
LCBwbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhpcyBpcyBub3QgdGhlIHByb3BlciBtYWlsaW5n
IGxpc3QgdG8gdGFsayBhYm91dCBzdWNoIHRoaW5ncyENCg0KVGhhbmtzLA0KU2ViYXN0aWVu
IEFsYWl3YW4NCg0KDQoNCg0KDQoNCi8vLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQovLyBnY2MgYWxzYV9zaW5lLmMg
LWxhc291bmQNCiNpbmNsdWRlIDxhbHNhL2Fzb3VuZGxpYi5oPg0KI2luY2x1ZGUgPHN0ZGlv
Lmg+DQoNCmNvbnN0IGludCBTYW1wbGVSYXRlID0gNDgwMDA7DQoNCnZvaWQgY2hlY2tDYWxs
KGludCByZXQsIGNvbnN0IGNoYXIqIGV4cHIsIGNvbnN0IGNoYXIqIGZpbGUsIGludCBsaW5l
KQ0Kew0KIMKgIGlmKHJldCA8IDApDQogwqAgew0KIMKgwqDCoCBmcHJpbnRmKHN0ZGVyciwg
IlslczolZF0gZXJyb3I6ICVzIDogJXNcbkFib3J0aW5nLlxuIiwgZmlsZSwgbGluZSwgZXhw
ciwgc25kX3N0cmVycm9yKHJldCkpOw0KIMKgwqDCoCBleGl0KDEpOw0KIMKgIH0NCn0NCg0K
I2RlZmluZSBDSEVDS19DQUxMKGEpIGNoZWNrQ2FsbChhLCAjIGEsIF9fRklMRV9fLCBfX0xJ
TkVfXykNCg0KaW50IG1haW4oaW50IGFyZ2MsIGNoYXIqIGFyZ3ZbXSkNCnsNCiDCoCBpZihh
cmdjICE9IDQpDQogwqAgew0KIMKgwqDCoCBmcHJpbnRmKHN0ZGVyciwgIlVzYWdlOiAlcyA8
ZGV2aWNlPiA8YnVmZmVyX3NpemU+IDxwZXJpb2Rfc2l6ZT5cbiIsIGFyZ3ZbMF0pOw0KIMKg
wqDCoCByZXR1cm4gMTsNCiDCoCB9DQoNCiDCoCBjb25zdCBjaGFyKiBkZXZOYW1lID0gYXJn
dlsxXTsNCiDCoCBjb25zdCBzbmRfcGNtX3VmcmFtZXNfdCBhc2tlZF9idWZmZXJfc2l6ZSA9
IGF0b2koYXJndlsyXSk7DQogwqAgY29uc3Qgc25kX3BjbV91ZnJhbWVzX3QgYXNrZWRfcGVy
aW9kX3NpemUgPSBhdG9pKGFyZ3ZbM10pOw0KDQogwqAgc25kX3BjbV90KiBwY20gPSBOVUxM
Ow0KIMKgIENIRUNLX0NBTEwoc25kX3BjbV9vcGVuKCZwY20sIGRldk5hbWUsIFNORF9QQ01f
U1RSRUFNX1BMQVlCQUNLLCAwKSk7DQoNCiDCoCBzbmRfcGNtX2h3X3BhcmFtc190KiBod19w
YXJhbXMgPSBOVUxMOw0KIMKgIENIRUNLX0NBTEwoc25kX3BjbV9od19wYXJhbXNfbWFsbG9j
KCZod19wYXJhbXMpKTsNCiDCoCBDSEVDS19DQUxMKHNuZF9wY21faHdfcGFyYW1zX2FueShw
Y20sIGh3X3BhcmFtcykpOw0KDQogwqAgc25kX3BjbV9mb3JtYXRfdCBmbXQ7DQogwqAgdW5z
aWduZWQgaW50IGNoYW5uZWxzID0gMDsNCiDCoCBDSEVDS19DQUxMKHNuZF9wY21faHdfcGFy
YW1zX2dldF9mb3JtYXQoaHdfcGFyYW1zLCAmZm10KSk7DQogwqAgQ0hFQ0tfQ0FMTChzbmRf
cGNtX2h3X3BhcmFtc19nZXRfY2hhbm5lbHNfbWluKGh3X3BhcmFtcywgJmNoYW5uZWxzKSk7
DQoNCiDCoCBzbmRfcGNtX3VmcmFtZXNfdCBidWZmZXJfc2l6ZSA9IGFza2VkX2J1ZmZlcl9z
aXplOw0KIMKgIHNuZF9wY21fdWZyYW1lc190IHBlcmlvZF9zaXplID0gYXNrZWRfcGVyaW9k
X3NpemU7DQogwqAgQ0hFQ0tfQ0FMTChzbmRfcGNtX2h3X3BhcmFtc19zZXRfcmF0ZShwY20s
IGh3X3BhcmFtcywgU2FtcGxlUmF0ZSwgMCkpOw0KIMKgIENIRUNLX0NBTEwoc25kX3BjbV9o
d19wYXJhbXNfc2V0X2FjY2VzcyhwY20sIGh3X3BhcmFtcywgU05EX1BDTV9BQ0NFU1NfUldf
SU5URVJMRUFWRUQpKTsNCiDCoCBDSEVDS19DQUxMKHNuZF9wY21faHdfcGFyYW1zX3NldF9i
dWZmZXJfc2l6ZV9uZWFyKHBjbSwgaHdfcGFyYW1zLCAmYnVmZmVyX3NpemUpKTsNCiDCoCBD
SEVDS19DQUxMKHNuZF9wY21faHdfcGFyYW1zX3NldF9wZXJpb2Rfc2l6ZV9uZWFyKHBjbSwg
aHdfcGFyYW1zLCAmcGVyaW9kX3NpemUsIE5VTEwpKTsNCiDCoCBDSEVDS19DQUxMKHNuZF9w
Y21faHdfcGFyYW1zKHBjbSwgaHdfcGFyYW1zKSk7DQogwqAgc25kX3BjbV9od19wYXJhbXNf
ZnJlZShod19wYXJhbXMpOw0KDQogwqAgcHJpbnRmKCJidWZmZXJfc2l6ZT0lZCAoYXNrZWQg
JWQpLCAiLCAoaW50KWJ1ZmZlcl9zaXplLCAoaW50KWFza2VkX2J1ZmZlcl9zaXplKTsNCiDC
oCBwcmludGYoInBlcmlvZF9zaXplPSVkIChhc2tlZCAlZCksICIsIChpbnQpcGVyaW9kX3Np
emUsIChpbnQpYXNrZWRfcGVyaW9kX3NpemUpOw0KIMKgIHByaW50ZigiY2hhbm5lbHM9JWQs
ICIsIGNoYW5uZWxzKTsNCiDCoCBwcmludGYoImZvcm1hdD0lcyAoJWQgYnBwKVxuIiwgc25k
X3BjbV9mb3JtYXRfbmFtZShmbXQpLCBzbmRfcGNtX2Zvcm1hdF93aWR0aChmbXQpKTsNCg0K
IMKgIGNvbnN0IGludCB0b3RhbFNhbXBsZXMgPSBTYW1wbGVSYXRlICogMS4wOw0KDQogwqAg
aW50IGJpdHNQZXJTYW1wbGUgPSBzbmRfcGNtX2Zvcm1hdF93aWR0aChmbXQpOw0KIMKgIGFz
c2VydChiaXRzUGVyU2FtcGxlICUgOCA9PSAwKTsNCiDCoCBpbnQgc2l6ZSA9IHRvdGFsU2Ft
cGxlcyAqIGNoYW5uZWxzICogYml0c1BlclNhbXBsZSAvIDg7DQogwqAgdWludDhfdCogYnVm
ZmVyID0gKHVpbnQ4X3QqKW1hbGxvYyhzaXplKTsNCiDCoCBtZW1zZXQoYnVmZmVyLCAwLCBz
aXplKTsNCiDCoCBDSEVDS19DQUxMKHNuZF9wY21fd3JpdGVpKHBjbSwgYnVmZmVyLCB0b3Rh
bFNhbXBsZXMpKTsNCiDCoCBmcmVlKGJ1ZmZlcik7DQoNCiDCoCBDSEVDS19DQUxMKHNuZF9w
Y21fZHJhaW4ocGNtKSk7DQogwqAgc25kX3BjbV9jbG9zZShwY20pOw0KDQogwqAgcHJpbnRm
KCJPS1xuIik7DQogwqAgcmV0dXJuIDA7DQp9DQovLy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQoNCg==

--------------t16qKO5DnssVRG0YPEt0j0oL--

--------------UodIyrDyGkh652TyvK3ohiMb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE6Rcoo1q8aGn5zUm9BmUw1iF5xC8FAmV7hLMFAwAAAAAACgkQBmUw1iF5xC9x
VA//ewd0V88FihWlOTg1STyCJgzR112FFN4VE+Z7c3J26sCoLO1Ekhtj/pHyJLLewsV0cslS+c/N
m/TzlQSRY7saSGmgCf2EsjspS2LUxZVsYg/RkITqpQkeoHE71B0SqZP14aKCxKQJb/0hu8SZbTo8
lOUJysnuM12hBNbuF7FG+gyTKgchfxjoeWHwTnMfZgApfSMniLGu4zlxOFwMNLJgL9EpNROZac/a
nM6bS+fWwVL0GViFpxz36/UUOCC9dTB4qMkCgti9i5VybzD9yt7m6LgS0su4jhBFz58sorlPlEfx
90+9vj9S1qnWvdV8nS1KIoKfH2J/5McvKqUEzg5ZV9WL8POA1X5DnrDj/JZVwmmZoa/ZZAvGXI5s
r3X3wfYGDNQs5jAzfvIrj4he9+xB4KWX04WDsTKbzw4rpGtRlnzBP/ZfR1VsvhkkH05pRZqfXVkI
N6aDqbvsBliF05neSHB4LHbcuFkxc7uRV+HVU1j2fWqX/0d7Na11og0sh3vrTkbftuahGUFTOQUV
PMNWcczUgnoyaDLjsX0o1TAU+crHXMxuax5P4c8p1PfDNN+EkA4dRLpVtznwm3lJsO7Go+W/gfh9
QOvVqJvyQo16T/OsR0QSu8c+nOJRgHVTiLnzUNQsjfcqDzCBbZkvAOrs2zxq91zvxt64Kq21rfQQ
/0k=
=MrW3
-----END PGP SIGNATURE-----

--------------UodIyrDyGkh652TyvK3ohiMb--
