Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D649A37F7A
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2025 11:11:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2B77602C2;
	Mon, 17 Feb 2025 11:10:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2B77602C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739787068;
	bh=zt7iDenZyRr2ZhjXd9FrArhigiID8+lzpGKIMUUhPWs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I02K/3pLja9hRlBiwcLbKrR3m0pdoG4LgNYOVZ0pvt4cbvbFLT6PkylL557bdJspg
	 XyJbbmmtabAfYW6fCtAc4x7bgPqr6dJs70DCag9zADBBIq/ZqX3CVpVs1qo0/MEKlH
	 z6m8/MrtErgTlHvcJO85+PiWdN9D73mm0fBsvV9Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 427F6F8061E; Mon, 17 Feb 2025 11:09:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 273A8F80622;
	Mon, 17 Feb 2025 11:09:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 146CCF8051F; Wed, 12 Feb 2025 07:55:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B28DF800E4
	for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2025 07:55:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B28DF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=FshMaKw/
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 51C6tKfjD1749646,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1739343320; bh=zt7iDenZyRr2ZhjXd9FrArhigiID8+lzpGKIMUUhPWs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version;
	b=FshMaKw/xE+f6PjKWomiVpDW5XQ4S7wAcTRNk9kr1Aj4B3VA8F5u53dK7B/quPMoo
	 SFZ6LQwUi5RaQ84W36A18sstzWc+5l/QulDei3vK2rN9ICYqSEH4VujK+qDMkKz4BU
	 z8WDV/peIjbHx7c4ZDgCuMPX19inkSeECXDr6ZJumpeWrFnXk3nyG/pmPji2w3jXqD
	 CnqXUiYefmI1juxb4poVUvaXVUmMQ8YH6CN/5b8dxa4iaiDMeF1vXFUAf8ZmF4Ohzl
	 ecdGfu3Guq+u8LrE7fKVhEUfNp+mvghNwnJwlY9S2Tykhf0Ns0a5PMcBR7StzVZQN9
	 WHhOBilMqNmmQ==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 51C6tKfjD1749646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2025 14:55:20 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Feb 2025 14:55:20 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 12 Feb 2025 14:55:20 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Wed, 12 Feb 2025 14:55:20 +0800
From: Kailang <kailang@realtek.com>
To: "bugzilla-daemon@kernel.org" <bugzilla-daemon@kernel.org>,
        "Takashi Iwai
 (tiwai@suse.de)" <tiwai@suse.de>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "
 (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: RE: [Bug 219743] [REGRESSION,
 BISECTED] ASUS GA402XY Headset mic stopped working after 6.12.2
Thread-Topic: [Bug 219743] [REGRESSION, BISECTED] ASUS GA402XY Headset mic
 stopped working after 6.12.2
Thread-Index: AQHbe5CALM4/NqKCy0ae6JW97tmZU7NDPn7Q
Date: Wed, 12 Feb 2025 06:55:20 +0000
Message-ID: <0474a095ab0044d0939ec4bf4362423d@realtek.com>
References: <bug-219743-196757@https.bugzilla.kernel.org/>
 <bug-219743-196757-RLkOfxHF9E@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219743-196757-RLkOfxHF9E@https.bugzilla.kernel.org/>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_0474a095ab0044d0939ec4bf4362423drealtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-MailFrom: kailang@realtek.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
Message-ID-Hash: LALCB2N3Z3Q6RCKRSH3ROSPHRGZXGGOQ
X-Message-ID-Hash: LALCB2N3Z3Q6RCKRSH3ROSPHRGZXGGOQ
X-Mailman-Approved-At: Mon, 17 Feb 2025 10:09:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LALCB2N3Z3Q6RCKRSH3ROSPHRGZXGGOQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_0474a095ab0044d0939ec4bf4362423drealtekcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rml4dXAgaGVhZHNldCBNSUMgbm8gZnVuY3Rpb24uDQo=

--_002_0474a095ab0044d0939ec4bf4362423drealtekcom_
Content-Type: application/octet-stream; name="0000-alc285-depop-fixup.patch"
Content-Description: 0000-alc285-depop-fixup.patch
Content-Disposition: attachment; filename="0000-alc285-depop-fixup.patch";
	size=849; creation-date="Wed, 12 Feb 2025 06:42:20 GMT";
	modification-date="Wed, 12 Feb 2025 06:52:54 GMT"
Content-Transfer-Encoding: base64

RnJvbSA5MzI1ZTJkMzBlNTYzNmIxZWQ3ZDM4OGJjYjlmZWY1NTE1ZTAxMTNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFdlZCwgMTIgRmViIDIwMjUgMTQ6NDA6NDYgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlazogRml4dXAgQUxDMjI1IGRlcG9wIHByb2NlZHVyZQoKSGVhZHNldCBNSUMg
d2lsbCBubyBmdW5jdGlvbiB3aGVuIHBvd2VyX3NhdmU9MC4KCkZpeGVzOiAxZmQ1MDUwOWZlMTQg
KCJBTFNBOiBoZGEvcmVhbHRlazogVXBkYXRlIEFMQzIyNSBkZXBvcCBwcm9jZWR1cmUiKQpTaWdu
ZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CgpkaWZmIC0tZ2l0
IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3Jl
YWx0ZWsuYwppbmRleCBhZTBiZWI1MmU3YjAuLjIyNDYxNmZiZWM0ZiAxMDA2NDQKLS0tIGEvc291
bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFs
dGVrLmMKQEAgLTM3ODgsNiArMzc4OCw3IEBAIHN0YXRpYyB2b2lkIGFsYzIyNV9pbml0KHN0cnVj
dCBoZGFfY29kZWMgKmNvZGVjKQogCQkJCSAgICBBQ19WRVJCX1NFVF9BTVBfR0FJTl9NVVRFLCBB
TVBfT1VUX1VOTVVURSk7CiAKIAkJbXNsZWVwKDc1KTsKKwkJYWxjX3VwZGF0ZV9jb2VmX2lkeChj
b2RlYywgMHg0YSwgMyA8PCAxMCwgMCk7CiAJCWFsY191cGRhdGVfY29lZmV4X2lkeChjb2RlYywg
MHg1NywgMHgwNCwgMHgwMDA3LCAweDQpOyAvKiBIaWdodCBwb3dlciAqLwogCX0KIH0K

--_002_0474a095ab0044d0939ec4bf4362423drealtekcom_--
