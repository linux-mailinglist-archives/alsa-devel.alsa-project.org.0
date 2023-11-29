Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 201887FD025
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 08:54:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76419DEB;
	Wed, 29 Nov 2023 08:54:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76419DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701244458;
	bh=WDrAnTf3IevnuKxV9jOx0UnIhQW1/zYLFndExfoWs9c=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UJ8sst3uha06CXNEF7RHzT7ApV5Ue5SmjlxD7QVGB724Y+g+TZPqvwbNEg6LJMpwP
	 wu6NcHI5UEwF0G7WLD+hnDsYABSJcTcKcDxKsK3ObDzCJ7/2O9R/2KEDfS3WzC9LQD
	 3JUf9vWMoehwGjxZkjOgcUiCv8Daw7eujNZYgrq0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F9AFF80579; Wed, 29 Nov 2023 08:53:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C974F80571;
	Wed, 29 Nov 2023 08:53:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F5C9F8016E; Wed, 29 Nov 2023 08:52:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60ABEF8007E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 08:52:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60ABEF8007E
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3AT7qEI412624970,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3AT7qEI412624970
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Nov 2023 15:52:15 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 29 Nov 2023 15:52:14 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 29 Nov 2023 15:52:14 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::540c:c8d6:1d0f:ab9f]) by
 RTEXMBS01.realtek.com.tw ([fe80::540c:c8d6:1d0f:ab9f%5]) with mapi id
 15.01.2507.034; Wed, 29 Nov 2023 15:52:14 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Add ALC257 support for ChromeOS
Thread-Topic: Add ALC257 support for ChromeOS
Thread-Index: AdoimMNVqCS8t6AJSbKn3EBrnQgKMA==
Date: Wed, 29 Nov 2023 07:52:13 +0000
Message-ID: <99a88a7dbdb045fd9d934abeb6cec15f@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXDAG01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_99a88a7dbdb045fd9d934abeb6cec15frealtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: MZ2PAQTRRLBCVJFOGTVOLQG6BR246PG6
X-Message-ID-Hash: MZ2PAQTRRLBCVJFOGTVOLQG6BR246PG6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MZ2PAQTRRLBCVJFOGTVOLQG6BR246PG6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_99a88a7dbdb045fd9d934abeb6cec15frealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Chromebook want to support ALC257.

BR,
Kailang

--_002_99a88a7dbdb045fd9d934abeb6cec15frealtekcom_
Content-Type: application/octet-stream; name="0000-alc257-chromeOS.patch"
Content-Description: 0000-alc257-chromeOS.patch
Content-Disposition: attachment; filename="0000-alc257-chromeOS.patch";
	size=1394; creation-date="Wed, 29 Nov 2023 07:41:03 GMT";
	modification-date="Wed, 29 Nov 2023 07:49:33 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyZGVjOWZlYzc2YjMwMGFhNjlmZDBiNWZiOTU2OWM2NTRiMTEzYmM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFdlZCwgMjkgTm92IDIwMjMgMTU6Mzg6NDAgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlazogQWRkIHN1cHBvcnRlZCBBTEMyNTcgZm9yIENocm9tZU9TCgpDaHJvbWVP
UyB3YW50IHRvIHN1cHBvcnQgQUxDMjU3LgpBZGQgY29kZWMgSUQgdG8gc29tZSByZWxhdGlvbiBm
dW5jdGlvbi4KClNpZ25lZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNv
bT4KZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNp
L2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggMGRmNDRiMTg3NmYzLi4xZDVkM2Q4OTE3NTggMTAw
NjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9o
ZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC0zMjU2LDYgKzMyNTYsNyBAQCBzdGF0aWMgdm9pZCBhbGNf
ZGlzYWJsZV9oZWFkc2V0X2phY2tfa2V5KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCWNhc2Ug
MHgxMGVjMDIzMDoKIAljYXNlIDB4MTBlYzAyMzY6CiAJY2FzZSAweDEwZWMwMjU2OgorCWNhc2Ug
MHgxMGVjMDI1NzoKIAljYXNlIDB4MTllNTgzMjY6CiAJCWFsY193cml0ZV9jb2VmX2lkeChjb2Rl
YywgMHg0OCwgMHgwKTsKIAkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHg0OSwgMHgwMDQ1
LCAweDApOwpAQCAtMzI4NSw2ICszMjg2LDcgQEAgc3RhdGljIHZvaWQgYWxjX2VuYWJsZV9oZWFk
c2V0X2phY2tfa2V5KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCWNhc2UgMHgxMGVjMDIzMDoK
IAljYXNlIDB4MTBlYzAyMzY6CiAJY2FzZSAweDEwZWMwMjU2OgorCWNhc2UgMHgxMGVjMDI1NzoK
IAljYXNlIDB4MTllNTgzMjY6CiAJCWFsY193cml0ZV9jb2VmX2lkeChjb2RlYywgMHg0OCwgMHhk
MDExKTsKIAkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHg0OSwgMHgwMDdmLCAweDAwNDUp
OwpAQCAtNjQ5Niw2ICs2NDk4LDcgQEAgc3RhdGljIHZvaWQgYWxjX2NvbWJvX2phY2tfaHBfamRf
cmVzdGFydChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAljYXNlIDB4MTBlYzAyMzY6CiAJY2Fz
ZSAweDEwZWMwMjU1OgogCWNhc2UgMHgxMGVjMDI1NjoKKwljYXNlIDB4MTBlYzAyNTc6CiAJY2Fz
ZSAweDE5ZTU4MzI2OgogCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDFiLCAweDgwMDAs
IDEgPDwgMTUpOyAvKiBSZXNldCBIUCBKRCAqLwogCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVj
LCAweDFiLCAweDgwMDAsIDAgPDwgMTUpOwo=

--_002_99a88a7dbdb045fd9d934abeb6cec15frealtekcom_--
