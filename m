Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0398C3DDD
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 11:13:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68DD286F;
	Mon, 13 May 2024 11:13:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68DD286F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715591602;
	bh=zb2CvNq4j4GIkLi0DtZrdgJwPgv9ih5YCGFFcCecTuo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ehzM00IMMLnzm8T8oghcBhEZiAbbEp7pustdKvxlpdgABg+eDRq8M42vT506DzWFy
	 O7MKoUiAMkaqRBUI4ctJEm7LAA9hq3Lb4hhbVYtkT6tYXaekNofDR8+32vd+AOBbax
	 WCUOrm89mh+Kf/tPr5YVUYE8YZ9aUwO+fCegB3Sw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37E23F8057B; Mon, 13 May 2024 11:12:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 853B9F805A0;
	Mon, 13 May 2024 11:12:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E5CCF8003A; Mon, 13 May 2024 11:11:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEF2FF8003A
	for <alsa-devel@alsa-project.org>; Mon, 13 May 2024 11:10:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEF2FF8003A
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 44D9AjNaA1398655,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 44D9AjNaA1398655
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 May 2024 17:10:46 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 17:10:45 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 17:10:45 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975]) by
 RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975%5]) with mapi id
 15.01.2507.035; Mon, 13 May 2024 17:10:45 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Headset Mic lose issue ALC256
Thread-Topic: Headset Mic lose issue ALC256
Thread-Index: AdqlFRkPW0sCemNGQIK5QcUgKK3PTQ==
Date: Mon, 13 May 2024 09:10:45 +0000
Message-ID: <c8b638590c5f45a6a5c6aeb20c31fd5b@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.22.102.106]
Content-Type: multipart/mixed;
	boundary="_002_c8b638590c5f45a6a5c6aeb20c31fd5brealtekcom_"
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: YKH3KJTYXUATN25XCR5J2XFO3GHXWJQM
X-Message-ID-Hash: YKH3KJTYXUATN25XCR5J2XFO3GHXWJQM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YKH3KJTYXUATN25XCR5J2XFO3GHXWJQM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_c8b638590c5f45a6a5c6aeb20c31fd5brealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

New ChromeBook had Headset Mic issue.
Attach patch will solve it.

Many Thanks.
Kailang

--_002_c8b638590c5f45a6a5c6aeb20c31fd5brealtekcom_
Content-Type: application/octet-stream;
	name="0000-2024y-new-chromebook.patch"
Content-Description: 0000-2024y-new-chromebook.patch
Content-Disposition: attachment; filename="0000-2024y-new-chromebook.patch";
	size=2378; creation-date="Tue, 30 Apr 2024 08:40:20 GMT";
	modification-date="Mon, 13 May 2024 09:07:13 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmYjFhZTg4NGRiZTg1MTQwNzUxZjAxMWNkZjY5MjA5NmE2ZTgxM2E3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IE1vbiwgMTMgTWF5IDIwMjQgMTY6Mzg6MTEgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIGZpeGVkIGhlYWRzZXQgTWljIG5vdCBzaG93CgpBTEMyNTYgcnVuIG9u
IFNPRiBtb2RlLiBCb290IHdpdGggcGx1Z2dlZCBoZWFkc2V0LCB0aGUgSGVhZHNldCBNaWMgd2ls
bCBiZSBnb25lLgpQbHVnZ2VkIGhlYWRzZXQgYWZ0ZXIgYm9vdC4gSXQgaGFkIHBhcnRpYWwgZmFp
bCB3aXRoIEhlYWRzZXQgTWljIGRldGVjdC4KQWRkIHNwZWMtPmVuXzNrcHVsbF9sb3cgPSBmYWxz
ZSB3aWxsIHNvbHZlIGFsbCBpc3N1ZXMuCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGth
aWxhbmdAcmVhbHRlay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFs
dGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCBiZDFiODI0YmFhZTEu
LmUxMzE4ZDAxODExOSAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMK
KysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTY1MzUsNiArNjUzNSwyMCBA
QCBzdGF0aWMgdm9pZCBhbGMyOTVfZml4dXBfY2hyb21lYm9vayhzdHJ1Y3QgaGRhX2NvZGVjICpj
b2RlYywKIAl9CiB9CiAKK3N0YXRpYyB2b2lkIGFsYzI1Nl9maXh1cF9jaHJvbWVib29rKHN0cnVj
dCBoZGFfY29kZWMgKmNvZGVjLAorCQkJCSAgICBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwICpmaXgs
IGludCBhY3Rpb24pCit7CisJc3RydWN0IGFsY19zcGVjICpzcGVjID0gY29kZWMtPnNwZWM7CisK
Kwlzd2l0Y2ggKGFjdGlvbikgeworCWNhc2UgSERBX0ZJWFVQX0FDVF9QUkVfUFJPQkU6CisJCXNw
ZWMtPmdlbi5zdXBwcmVzc19hdXRvX211dGUgPSAxOworCQlzcGVjLT5nZW4uc3VwcHJlc3NfYXV0
b19taWMgPSAxOworCQlzcGVjLT5lbl8za3B1bGxfbG93ID0gZmFsc2U7CisJCWJyZWFrOworCX0K
K30KKwogc3RhdGljIHZvaWQgYWxjX2ZpeHVwX2Rpc2FibGVfbWljX3ZyZWYoc3RydWN0IGhkYV9j
b2RlYyAqY29kZWMsCiAJCQkJICBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwICpmaXgsIGludCBhY3Rp
b24pCiB7CkBAIC03NTE1LDYgKzc1MjksNyBAQCBlbnVtIHsKIAlBTEMyODVfRklYVVBfQVNVU19H
VTYwNV9TUElfMl9IRUFEU0VUX01JQywKIAlBTEMyODVfRklYVVBfQVNVU19HVTYwNV9TUElfU1BF
QUtFUjJfVE9fREFDMSwKIAlBTEMyODdfRklYVVBfTEVOT1ZPX1RIS1BBRF9XSF9BTEMxMzE4LAor
CUFMQzI1Nl9GSVhVUF9DSFJPTUVfQk9PSywKIH07CiAKIC8qIEEgc3BlY2lhbCBmaXh1cCBmb3Ig
TGVub3ZvIEM5NDAgYW5kIFlvZ2EgRHVldCA3OwpAQCAtOTc5Nyw2ICs5ODEyLDEyIEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwIGFsYzI2OV9maXh1cHNbXSA9IHsKIAkJLmNoYWluZWQg
PSB0cnVlLAogCQkuY2hhaW5faWQgPSBBTEMyNjlfRklYVVBfVEhJTktQQURfQUNQSQogCX0sCisJ
W0FMQzI1Nl9GSVhVUF9DSFJPTUVfQk9PS10gPSB7CisJCS50eXBlID0gSERBX0ZJWFVQX0ZVTkMs
CisJCS52LmZ1bmMgPSBhbGMyNTZfZml4dXBfY2hyb21lYm9vaywKKwkJLmNoYWluZWQgPSB0cnVl
LAorCQkuY2hhaW5faWQgPSBBTEMyMjVfRklYVVBfSEVBRFNFVF9KQUNLCisJfSwKIH07CiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7CkBA
IC0xMDc2MSw2ICsxMDc4Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX21vZGVsX2ZpeHVw
IGFsYzI2OV9maXh1cF9tb2RlbHNbXSA9IHsKIAl7LmlkID0gQUxDMjk1X0ZJWFVQX0hQX1gzNjAs
IC5uYW1lID0gImFsYzI5NS1ocC14MzYwIn0sCiAJey5pZCA9IEFMQzIyNV9GSVhVUF9IRUFEU0VU
X0pBQ0ssIC5uYW1lID0gImFsYy1oZWFkc2V0LWphY2sifSwKIAl7LmlkID0gQUxDMjk1X0ZJWFVQ
X0NIUk9NRV9CT09LLCAubmFtZSA9ICJhbGMtY2hyb21lLWJvb2sifSwKKwl7LmlkID0gQUxDMjU2
X0ZJWFVQX0NIUk9NRV9CT09LLCAubmFtZSA9ICJhbGMtMjAyNHktY2hyb21lYm9vayJ9LAogCXsu
aWQgPSBBTEMyOTlfRklYVVBfUFJFREFUT1JfU1BLLCAubmFtZSA9ICJwcmVkYXRvci1zcGsifSwK
IAl7LmlkID0gQUxDMjk4X0ZJWFVQX0hVQVdFSV9NQlhfU1RFUkVPLCAubmFtZSA9ICJodWF3ZWkt
bWJ4LXN0ZXJlbyJ9LAogCXsuaWQgPSBBTEMyNTZfRklYVVBfTUVESU9OX0hFQURTRVRfTk9fUFJF
U0VOQ0UsIC5uYW1lID0gImFsYzI1Ni1tZWRpb24taGVhZHNldCJ9LAo=

--_002_c8b638590c5f45a6a5c6aeb20c31fd5brealtekcom_--
