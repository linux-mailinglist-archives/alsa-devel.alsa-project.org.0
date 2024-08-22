Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC06D95B11C
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2024 11:05:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B30B1826;
	Thu, 22 Aug 2024 11:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B30B1826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724317542;
	bh=6lT+LGL/I20MfzE4BRC7sLPbfUeS9Ml2WH147QThFPk=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lA87SKvvURFkQTpZQQdNQu5THPLPqJ0O1uN7je1PcYIG3ayHs3p5WeeeZdf1yqOuH
	 PoXxXIB5iqHKlmHNOrNlklgk6/frTItOVFI8gWyM9U26xto2h3jgZozgZB5oJuIxo/
	 6AjKC/24AcZi2Nc4Keq4sQ75zJeTmPjkNxt8/x/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A2BFF805B2; Thu, 22 Aug 2024 11:05:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A15CF805A0;
	Thu, 22 Aug 2024 11:05:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51AE5F80496; Thu, 22 Aug 2024 11:02:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 881F5F8025E
	for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2024 11:01:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 881F5F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=V69ig1VR
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 47M91mXwA3768974,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1724317308; bh=6lT+LGL/I20MfzE4BRC7sLPbfUeS9Ml2WH147QThFPk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=V69ig1VRBS5udOskfkYPcDb+bw7ND4YRU7XokYeT56qvroDQGwLAQD0LZgxRSs/a0
	 GoEK8alZ1E7phK9kjqOXyouOzoxcLr4qLpHni755k6o1te3IeNh9YLsA/UXrfqOVuf
	 k2g/zaNuV/sTokHdPuD256tgQ0tpa4KIeEnxHrv/YCOGpj38VpDXelldMcqpWXmODP
	 NUF3MHQGDuepOyPeE9JagcWMSyZLl5gXb/55dfDq1e1UEI2aKz7nPJ8IJFQV7ihgam
	 CKKABSIWI9yh2bxeLssD1ltUaQY5gusSS9orSdbQ3wlAiZy7s+4aY9/s3VKim3iEsN
	 iyh06R1uYHvhw==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.02/5.92) with ESMTPS id 47M91mXwA3768974
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Aug 2024 17:01:48 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 17:01:48 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Aug 2024 17:01:48 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2]) by
 RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2%7]) with mapi id
 15.01.2507.035; Thu, 22 Aug 2024 17:01:48 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: ALC285 headphone no sound
Thread-Topic: ALC285 headphone no sound
Thread-Index: Adr0cdNcHsTBmuiwR5q9wIT1ild7sg==
Date: Thu, 22 Aug 2024 09:01:48 +0000
Message-ID: <d0de1b03fd174520945dde216d765223@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
Content-Type: multipart/mixed;
	boundary="_002_d0de1b03fd174520945dde216d765223realtekcom_"
MIME-Version: 1.0
Message-ID-Hash: TVCOIUVGV5SX6N256R6UDNBWJTGPENWY
X-Message-ID-Hash: TVCOIUVGV5SX6N256R6UDNBWJTGPENWY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TVCOIUVGV5SX6N256R6UDNBWJTGPENWY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_d0de1b03fd174520945dde216d765223realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

I also changed with ALC215 ALC285 ALC289 ALC225 ALC295 ALC299 codec.
It maybe has similar issue as ALC256.
Let it has same procedure.=20
Many Thanks.

BR,
Kailang

> -----Original Message-----
> From: Kailang
> Sent: Thursday, August 22, 2024 11:14 AM
> To: Takashi Iwai (tiwai@suse.de) <tiwai@suse.de>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: ALC256 headphone no sound
>=20
> Hi Takashi,
>=20
> Attach patch will solve headphone issue for alc256.
> Many Thanks.
>=20
> BR,
> Kailang

--_002_d0de1b03fd174520945dde216d765223realtekcom_
Content-Type: application/octet-stream;
	name="0000-alc285-dell-menual-mode-depop.patch"
Content-Description: 0000-alc285-dell-menual-mode-depop.patch
Content-Disposition: attachment;
	filename="0000-alc285-dell-menual-mode-depop.patch"; size=3126;
	creation-date="Thu, 22 Aug 2024 08:48:56 GMT";
	modification-date="Thu, 22 Aug 2024 08:53:31 GMT"
Content-Transfer-Encoding: base64

RnJvbSBhMzIzZjZiMjk2MGM1NWZhZjcyODEwMTY4M2JjZDNlZmYyNWE4ZDFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMjIgQXVnIDIwMjQgMTY6NDY6NTYgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEZJeGVkIEFMQzI4NSBoZWFkcGhvbmUgbm8gc291bmQKCkRlbGwgcGxh
dGZvcm0gd2l0aCBBTEMyMTUgQUxDMjg1IEFMQzI4OSBBTEMyMjUgQUxDMjk1IEFMQzI5OSwgcGx1
ZyBoZWFkcGhvbmUgb3IgaGVhZHNldC4KSXQgaGFkIGEgY2hhbmNlIHRvIGdldCBubyBzb3VuZCBm
cm9tIGhlYWRwaG9uZS4KUmVwbGFjZSBkZXBvcCBwcm9jZWR1cmUgd2lsbCBzb2x2ZSB0aGlzIGlz
c3VlLgoKU2lnbmVkLW9mZi1ieTogS2FpbGFuZyBZYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgoK
ZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hk
YS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggZTcwZDkzMThhYjMwLi5kOWJlNmUwOGI0ODAgMTAwNjQ0
Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEv
cGF0Y2hfcmVhbHRlay5jCkBAIC01MDkwLDYgKzUwOTAsNyBAQCBzdGF0aWMgdm9pZCBhbGNfaGVh
ZHNldF9tb2RlX3VucGx1Z2dlZChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAljYXNlIDB4MTBl
YzAyOTU6CiAJY2FzZSAweDEwZWMwMjg5OgogCWNhc2UgMHgxMGVjMDI5OToKKwkJYWxjX2hwX211
dGVfZGlzYWJsZShjb2RlYywgNzUpOwogCQlhbGNfcHJvY2Vzc19jb2VmX2Z3KGNvZGVjLCBhbGMy
MjVfcHJlX2hzbW9kZSk7CiAJCWFsY19wcm9jZXNzX2NvZWZfZncoY29kZWMsIGNvZWYwMjI1KTsK
IAkJYnJlYWs7CkBAIC01MzE1LDYgKzUzMTYsNyBAQCBzdGF0aWMgdm9pZCBhbGNfaGVhZHNldF9t
b2RlX2RlZmF1bHQoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJY2FzZSAweDEwZWMwMjk5Ogog
CQlhbGNfcHJvY2Vzc19jb2VmX2Z3KGNvZGVjLCBhbGMyMjVfcHJlX2hzbW9kZSk7CiAJCWFsY19w
cm9jZXNzX2NvZWZfZncoY29kZWMsIGNvZWYwMjI1KTsKKwkJYWxjX2hwX2VuYWJsZV91bm11dGUo
Y29kZWMsIDc1KTsKIAkJYnJlYWs7CiAJY2FzZSAweDEwZWMwMjU1OgogCQlhbGNfcHJvY2Vzc19j
b2VmX2Z3KGNvZGVjLCBjb2VmMDI1NSk7CkBAIC01NDc0LDYgKzU0NzYsNyBAQCBzdGF0aWMgdm9p
ZCBhbGNfaGVhZHNldF9tb2RlX2N0aWEoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJCQlhbGNf
cHJvY2Vzc19jb2VmX2Z3KGNvZGVjLCBjb2VmMDIyNV8yKTsKIAkJZWxzZQogCQkJYWxjX3Byb2Nl
c3NfY29lZl9mdyhjb2RlYywgY29lZjAyMjVfMSk7CisJCWFsY19ocF9lbmFibGVfdW5tdXRlKGNv
ZGVjLCA3NSk7CiAJCWJyZWFrOwogCWNhc2UgMHgxMGVjMDg2NzoKIAkJYWxjX3VwZGF0ZV9jb2Vm
ZXhfaWR4KGNvZGVjLCAweDU3LCAweDUsIDE8PDE0LCAwKTsKQEAgLTU1NzksNiArNTU4Miw3IEBA
IHN0YXRpYyB2b2lkIGFsY19oZWFkc2V0X21vZGVfb210cChzdHJ1Y3QgaGRhX2NvZGVjICpjb2Rl
YykKIAljYXNlIDB4MTBlYzAyODk6CiAJY2FzZSAweDEwZWMwMjk5OgogCQlhbGNfcHJvY2Vzc19j
b2VmX2Z3KGNvZGVjLCBjb2VmMDIyNSk7CisJCWFsY19ocF9lbmFibGVfdW5tdXRlKGNvZGVjLCA3
NSk7CiAJCWJyZWFrOwogCX0KIAljb2RlY19kYmcoY29kZWMsICJIZWFkc2V0IGphY2sgc2V0IHRv
IE5va2lhLXN0eWxlIGhlYWRzZXQgbW9kZS5cbiIpOwpAQCAtNTczOCwxMiArNTc0Miw2IEBAIHN0
YXRpYyB2b2lkIGFsY19kZXRlcm1pbmVfaGVhZHNldF90eXBlKHN0cnVjdCBoZGFfY29kZWMgKmNv
ZGVjKQogCWNhc2UgMHgxMGVjMDI5NToKIAljYXNlIDB4MTBlYzAyODk6CiAJY2FzZSAweDEwZWMw
Mjk5OgotCQlzbmRfaGRhX2NvZGVjX3dyaXRlKGNvZGVjLCAweDIxLCAwLAotCQkJICAgIEFDX1ZF
UkJfU0VUX0FNUF9HQUlOX01VVEUsIEFNUF9PVVRfTVVURSk7Ci0JCW1zbGVlcCg4MCk7Ci0JCXNu
ZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIDB4MjEsIDAsCi0JCQkgICAgQUNfVkVSQl9TRVRfUElO
X1dJREdFVF9DT05UUk9MLCAweDApOwotCiAJCWFsY19wcm9jZXNzX2NvZWZfZncoY29kZWMsIGFs
YzIyNV9wcmVfaHNtb2RlKTsKIAkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHg2NywgMHhm
MDAwLCAweDEwMDApOwogCQl2YWwgPSBhbGNfcmVhZF9jb2VmX2lkeChjb2RlYywgMHg0NSk7CkBA
IC01NzYwLDE1ICs1NzU4LDE5IEBAIHN0YXRpYyB2b2lkIGFsY19kZXRlcm1pbmVfaGVhZHNldF90
eXBlKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCQkJdmFsID0gYWxjX3JlYWRfY29lZl9pZHgo
Y29kZWMsIDB4NDYpOwogCQkJaXNfY3RpYSA9ICh2YWwgJiAweDAwZjApID09IDB4MDBmMDsKIAkJ
fQorCQlpZiAoIWlzX2N0aWEpIHsKKwkJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4NDUs
IDB4M2Y8PDEwLCAweDM4PDwxMCk7CisJCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDQ5
LCAzPDw4LCAxPDw4KTsKKwkJCW1zbGVlcCgxMDApOworCQkJdmFsID0gYWxjX3JlYWRfY29lZl9p
ZHgoY29kZWMsIDB4NDYpOworCQkJaWYgKCh2YWwgJiAweDAwZjApID09IDB4MDBmMCkKKwkJCQlp
c19jdGlhID0gZmFsc2U7CisJCQllbHNlCisJCQkJaXNfY3RpYSA9IHRydWU7CisJCX0KIAkJYWxj
X3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHg0YSwgNzw8NiwgNzw8Nik7CiAJCWFsY191cGRhdGVf
Y29lZl9pZHgoY29kZWMsIDB4NGEsIDM8PDQsIDM8PDQpOwogCQlhbGNfdXBkYXRlX2NvZWZfaWR4
KGNvZGVjLCAweDY3LCAweGYwMDAsIDB4MzAwMCk7Ci0KLQkJc25kX2hkYV9jb2RlY193cml0ZShj
b2RlYywgMHgyMSwgMCwKLQkJCSAgICBBQ19WRVJCX1NFVF9QSU5fV0lER0VUX0NPTlRST0wsIFBJ
Tl9PVVQpOwotCQltc2xlZXAoODApOwotCQlzbmRfaGRhX2NvZGVjX3dyaXRlKGNvZGVjLCAweDIx
LCAwLAotCQkJICAgIEFDX1ZFUkJfU0VUX0FNUF9HQUlOX01VVEUsIEFNUF9PVVRfVU5NVVRFKTsK
IAkJYnJlYWs7CiAJY2FzZSAweDEwZWMwODY3OgogCQlpc19jdGlhID0gdHJ1ZTsK

--_002_d0de1b03fd174520945dde216d765223realtekcom_--
