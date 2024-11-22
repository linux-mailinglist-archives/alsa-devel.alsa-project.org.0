Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8434C9D59F9
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2024 08:30:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEE3A1903;
	Fri, 22 Nov 2024 08:30:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEE3A1903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732260648;
	bh=NHPW+B6PAvMMjXDG/UpVwOgWtbVQlnjBk0ks8cHMHpE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RivkkxgMWpKeJTnKWvK44ZmRPgo3pedrRN5nM1ieM9qGxaDair6ZmjNwxZuBsI5Z9
	 SBb7wz6nXiSQhcQCA3l5lCa0AlijZ1GI+dOcD62W7Jl9hiPr1cVZCJDA78v5S3zt/T
	 V7/VapkfQggAcfRg6MvGUX7vcp4gYP5crZSn8zdk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D20FF80535; Fri, 22 Nov 2024 08:30:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7262F8053B;
	Fri, 22 Nov 2024 08:30:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1943DF80533; Fri, 22 Nov 2024 08:30:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F537F80134
	for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2024 08:30:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F537F80134
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=UEGL2XBk
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4AM7TutJ62899330,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1732260596; bh=NHPW+B6PAvMMjXDG/UpVwOgWtbVQlnjBk0ks8cHMHpE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=UEGL2XBkGjIo6D489Wihx+HUwM8UU6dFIkBLCv0QP7Qpxs5vkqnblh1iVZwJD8H4w
	 rE5rrawuUH0E0FuxaBLfFniHu4GT5jhT40LYJjsQgEbt15Fe+bpZk2tx0McuY5YHcF
	 QwpNZmCG8yZnhcw2bKsDKipxYhnNpBRL0Pr4W1fE6eE09f2g1MoYZtAKEoqMP6YD3m
	 6EUZGKa5VJaw+Ty0TJTODzdqfwhE+0Sp9DCpMmZGYsSn5c7+6q6ia8rhiu9UNElY+G
	 6twbARmpYLgozAhi+V8EE6CToAwF9m876DGdv+ccOvodgRd56PHs0YzuTt+ZUQ5dPU
	 xx6lv710eMghA==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 4AM7TutJ62899330
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 Nov 2024 15:29:56 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 15:29:56 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Nov 2024 15:29:56 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2]) by
 RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2%7]) with mapi id
 15.01.2507.035; Fri, 22 Nov 2024 15:29:56 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Set pcbeep to default value
Thread-Topic: Set pcbeep to default value
Thread-Index: Ads8sBHNzM+TirlYQ/mnHXgYWQoEnw==
Date: Fri, 22 Nov 2024 07:29:56 +0000
Message-ID: <a76a10fc88e740f2b157375d44f167c7@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
Content-Type: multipart/mixed;
	boundary="_002_a76a10fc88e740f2b157375d44f167c7realtekcom_"
MIME-Version: 1.0
Message-ID-Hash: 6M2D4SUFKHUIQLBMOGOP3FBLGP2GHISU
X-Message-ID-Hash: 6M2D4SUFKHUIQLBMOGOP3FBLGP2GHISU
X-MailFrom: kailang@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6M2D4SUFKHUIQLBMOGOP3FBLGP2GHISU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_a76a10fc88e740f2b157375d44f167c7realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch will set pcbeep to default value for ALC274.

BR,
Kailang

--_002_a76a10fc88e740f2b157375d44f167c7realtekcom_
Content-Type: application/octet-stream;
	name="0000-dell-alc274-beep-default.patch"
Content-Description: 0000-dell-alc274-beep-default.patch
Content-Disposition: attachment;
	filename="0000-dell-alc274-beep-default.patch"; size=745;
	creation-date="Thu, 21 Nov 2024 08:17:27 GMT";
	modification-date="Fri, 22 Nov 2024 07:27:13 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1OTA5ODc4MzZmNWY4ZTU2NWU3ZmVkMzcyNTYxODVmNTUwNGQ2ZGE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMjEgTm92IDIwMjQgMTY6MTY6MjYgKzA4MDAKU3ViamVjdDogW1BBVENIXSBTZXQg
UENCZWVwIHRvIGRlZmF1bHQgdmFsdWUgZm9yIEFMQzI3NAoKRW5hYmxlIFBDIGJlZXAgcGF0aCBj
YXVzZSBwb3Agbm9pc2UgdmlhIHNwZWFrZXIgZHVyaW5nIGJvb3QgdGltZS4KU2V0IHRvIGRlZmF1
bHQgdmFsdWUgd2lsbCBzb2x2ZSB0aGUgaXNzdWUuCgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hk
YS9wYXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCA1
NmEzNjIyY2EyYzEuLjY3MDM2ZmU2YzZjYyAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRj
aF9yZWFsdGVrLmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTQ3Myw2
ICs0NzMsOCBAQCBzdGF0aWMgdm9pZCBhbGNfZmlsbF9lYXBkX2NvZWYoc3RydWN0IGhkYV9jb2Rl
YyAqY29kZWMpCiAJCWJyZWFrOwogCWNhc2UgMHgxMGVjMDIzNDoKIAljYXNlIDB4MTBlYzAyNzQ6
CisJCWFsY193cml0ZV9jb2VmX2lkeChjb2RlYywgMHg2ZSwgMHgwYzI1KTsKKwkJZmFsbHRocm91
Z2g7CiAJY2FzZSAweDEwZWMwMjk0OgogCWNhc2UgMHgxMGVjMDcwMDoKIAljYXNlIDB4MTBlYzA3
MDE6Cg==

--_002_a76a10fc88e740f2b157375d44f167c7realtekcom_--
