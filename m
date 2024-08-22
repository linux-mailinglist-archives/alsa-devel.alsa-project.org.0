Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D4E95ABC6
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2024 05:15:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BF51820;
	Thu, 22 Aug 2024 05:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BF51820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724296499;
	bh=kMsmtGmfawtb8UPe3fbfsz5heWvudLZT20dOxNeWYJw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=F9cnV4waF7vL/GFrPG7zaEz2oZAjTgS2f2JDTzeTKnVO0Vif5pKm1M54dH4GIwQ7y
	 PQft4XtttPWfDzIKrFSlRLVMcaPPJHQatFNLNo8vClv+aeIguy21QtzbjHxcWUHC3K
	 Ccu6Dfy7fqisGg5Im3JLB3D3M3ohLI0kKYsa0d7s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28743F805BB; Thu, 22 Aug 2024 05:14:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DB0AF805B0;
	Thu, 22 Aug 2024 05:14:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CB14F80496; Thu, 22 Aug 2024 05:14:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 04468F800F0
	for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2024 05:14:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04468F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=tBtvOJBG
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 47M3E7d543505731,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1724296447; bh=kMsmtGmfawtb8UPe3fbfsz5heWvudLZT20dOxNeWYJw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=tBtvOJBGs5UTYqKECFsLOyYFVDfwbtW1zc8LvJAFYLb7iNpb+b9DfQ+bnqY/CgVZm
	 8maCMR6/EoZedPQNI9BFtCSq8jnB+lD7IZQbN4oZzBcgLGYRbDnV6nAb2afD7W1P+T
	 PazNB0OegEnBWv9Q2Q/kFt+y/s4u7GC+ZtQNzRyPV8TFVU1cyhU/tF5LoFpUJE8H30
	 0ppwVsKoIPl3/SVGkBAsIIor4YVi2fqdAE44yf+S1mv6Z93zM3pwwHMDD7XdtVQTku
	 J0QltoXlYZq5X+uRmQ5SOwcsmskU1I2mBwxqqOAV9Ezb7e36+BsQddHwZPpj1R97Pp
	 hYivPbbZwyKcg==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.02/5.92) with ESMTPS id 47M3E7d543505731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Aug 2024 11:14:07 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 11:14:07 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Aug 2024 11:14:07 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2]) by
 RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2%7]) with mapi id
 15.01.2507.035; Thu, 22 Aug 2024 11:14:07 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: ALC256 headphone no sound
Thread-Topic: ALC256 headphone no sound
Thread-Index: Adr0QRE/+pXiSackS2mnnWuPh86Inw==
Date: Thu, 22 Aug 2024 03:14:06 +0000
Message-ID: <bb8e2de30d294dc287944efa0667685a@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
x-kse-serverinfo: RTEXMBS02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_bb8e2de30d294dc287944efa0667685arealtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: JVLEJWNQSSB2LKFTAKTW7DSVHLGQ4XDL
X-Message-ID-Hash: JVLEJWNQSSB2LKFTAKTW7DSVHLGQ4XDL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JVLEJWNQSSB2LKFTAKTW7DSVHLGQ4XDL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_bb8e2de30d294dc287944efa0667685arealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch will solve headphone issue for alc256.
Many Thanks.

BR,
Kailang

--_002_bb8e2de30d294dc287944efa0667685arealtekcom_
Content-Type: application/octet-stream; name="0001-alc256-dell-tower.patch"
Content-Description: 0001-alc256-dell-tower.patch
Content-Disposition: attachment; filename="0001-alc256-dell-tower.patch";
	size=3555; creation-date="Thu, 22 Aug 2024 02:55:32 GMT";
	modification-date="Thu, 22 Aug 2024 03:06:26 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2OTcyNjhiYWY5MjMxNzFkOWQ5MzdhMTA0YWIwMjE5OGZlOGFkYTdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMjIgQXVnIDIwMjQgMTA6NTQ6MTkgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEZJeGVkIEFMQzI1NiBoZWFkcGhvbmUgbm8gc291bmQKCkRlbGwgcGxh
dGZvcm0sIHBsdWcgaGVhZHBob25lIG9yIGhlYWRzZXQsIGl0IGhhZCBhIGNoYW5jZSB0byBnZXQg
bm8gc291bmQgZnJvbSBoZWFkcGhvbmUuClJlcGxhY2UgZGVwb3AgcHJvY2VkdXJlIHdpbGwgc29s
dmUgdGhpcyBpc3N1ZS4KClNpZ25lZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFs
dGVrLmNvbT4KCmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3Nv
dW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IGM1NzMxODNjNjlhOS4uMGU0ZGYwNDA4
MmY2IDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3Vu
ZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtNDkzMCw2ICs0OTMwLDMwIEBAIHN0YXRpYyB2
b2lkIGFsYzI2OV9maXh1cF9ocF9saW5lMV9taWMxX2xlZChzdHJ1Y3QgaGRhX2NvZGVjICpjb2Rl
YywKIAl9CiB9CiAKK3N0YXRpYyB2b2lkIGFsY19ocF9tdXRlX2Rpc2FibGUoc3RydWN0IGhkYV9j
b2RlYyAqY29kZWMsIHVuc2lnbmVkIGludCBkZWxheSkKK3sKKwlpZiAoZGVsYXkgPD0gMCkKKwkJ
ZGVsYXkgPSA3NTsKKwlzbmRfaGRhX2NvZGVjX3dyaXRlKGNvZGVjLCAweDIxLCAwLAorCQkgICAg
QUNfVkVSQl9TRVRfQU1QX0dBSU5fTVVURSwgQU1QX09VVF9NVVRFKTsKKwltc2xlZXAoZGVsYXkp
OworCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIDB4MjEsIDAsCisJCSAgICBBQ19WRVJCX1NF
VF9QSU5fV0lER0VUX0NPTlRST0wsIDB4MCk7CisJbXNsZWVwKGRlbGF5KTsKK30KKworc3RhdGlj
IHZvaWQgYWxjX2hwX2VuYWJsZV91bm11dGUoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsIHVuc2ln
bmVkIGludCBkZWxheSkKK3sKKwlpZiAoZGVsYXkgPD0gMCkKKwkJZGVsYXkgPSA3NTsKKwlzbmRf
aGRhX2NvZGVjX3dyaXRlKGNvZGVjLCAweDIxLCAwLAorCQkgICAgQUNfVkVSQl9TRVRfUElOX1dJ
REdFVF9DT05UUk9MLCBQSU5fT1VUKTsKKwltc2xlZXAoZGVsYXkpOworCXNuZF9oZGFfY29kZWNf
d3JpdGUoY29kZWMsIDB4MjEsIDAsCisJCSAgICBBQ19WRVJCX1NFVF9BTVBfR0FJTl9NVVRFLCBB
TVBfT1VUX1VOTVVURSk7CisJbXNsZWVwKGRlbGF5KTsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVj
dCBjb2VmX2Z3IGFsYzIyNV9wcmVfaHNtb2RlW10gPSB7CiAJVVBEQVRFX0NPRUYoMHg0YSwgMTw8
OCwgMCksCiAJVVBEQVRFX0NPRUZFWCgweDU3LCAweDA1LCAxPDwxNCwgMCksCkBAIC01MDMxLDYg
KzUwNTUsNyBAQCBzdGF0aWMgdm9pZCBhbGNfaGVhZHNldF9tb2RlX3VucGx1Z2dlZChzdHJ1Y3Qg
aGRhX2NvZGVjICpjb2RlYykKIAljYXNlIDB4MTBlYzAyMzY6CiAJY2FzZSAweDEwZWMwMjU2Ogog
CWNhc2UgMHgxOWU1ODMyNjoKKwkJYWxjX2hwX211dGVfZGlzYWJsZShjb2RlYywgNzUpOwogCQlh
bGNfcHJvY2Vzc19jb2VmX2Z3KGNvZGVjLCBjb2VmMDI1Nik7CiAJCWJyZWFrOwogCWNhc2UgMHgx
MGVjMDIzNDoKQEAgLTUzMDIsNiArNTMyNyw3IEBAIHN0YXRpYyB2b2lkIGFsY19oZWFkc2V0X21v
ZGVfZGVmYXVsdChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAkJYWxjX3dyaXRlX2NvZWZfaWR4
KGNvZGVjLCAweDQ1LCAweGMwODkpOwogCQltc2xlZXAoNTApOwogCQlhbGNfcHJvY2Vzc19jb2Vm
X2Z3KGNvZGVjLCBjb2VmMDI1Nik7CisJCWFsY19ocF9lbmFibGVfdW5tdXRlKGNvZGVjLCA3NSk7
CiAJCWJyZWFrOwogCWNhc2UgMHgxMGVjMDIzNDoKIAljYXNlIDB4MTBlYzAyNzQ6CkBAIC01Mzk5
LDYgKzU0MjUsNyBAQCBzdGF0aWMgdm9pZCBhbGNfaGVhZHNldF9tb2RlX2N0aWEoc3RydWN0IGhk
YV9jb2RlYyAqY29kZWMpCiAJY2FzZSAweDEwZWMwMjU2OgogCWNhc2UgMHgxOWU1ODMyNjoKIAkJ
YWxjX3Byb2Nlc3NfY29lZl9mdyhjb2RlYywgY29lZjAyNTYpOworCQlhbGNfaHBfZW5hYmxlX3Vu
bXV0ZShjb2RlYywgNzUpOwogCQlicmVhazsKIAljYXNlIDB4MTBlYzAyMzQ6CiAJY2FzZSAweDEw
ZWMwMjc0OgpAQCAtNTUxNCw2ICs1NTQxLDcgQEAgc3RhdGljIHZvaWQgYWxjX2hlYWRzZXRfbW9k
ZV9vbXRwKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCWNhc2UgMHgxMGVjMDI1NjoKIAljYXNl
IDB4MTllNTgzMjY6CiAJCWFsY19wcm9jZXNzX2NvZWZfZncoY29kZWMsIGNvZWYwMjU2KTsKKwkJ
YWxjX2hwX2VuYWJsZV91bm11dGUoY29kZWMsIDc1KTsKIAkJYnJlYWs7CiAJY2FzZSAweDEwZWMw
MjM0OgogCWNhc2UgMHgxMGVjMDI3NDoKQEAgLTU2MTksMjUgKzU2NDcsMjEgQEAgc3RhdGljIHZv
aWQgYWxjX2RldGVybWluZV9oZWFkc2V0X3R5cGUoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJ
CWFsY193cml0ZV9jb2VmX2lkeChjb2RlYywgMHgwNiwgMHg2MTA0KTsKIAkJYWxjX3dyaXRlX2Nv
ZWZleF9pZHgoY29kZWMsIDB4NTcsIDB4MywgMHgwOWEzKTsKIAotCQlzbmRfaGRhX2NvZGVjX3dy
aXRlKGNvZGVjLCAweDIxLCAwLAotCQkJICAgIEFDX1ZFUkJfU0VUX0FNUF9HQUlOX01VVEUsIEFN
UF9PVVRfTVVURSk7Ci0JCW1zbGVlcCg4MCk7Ci0JCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMs
IDB4MjEsIDAsCi0JCQkgICAgQUNfVkVSQl9TRVRfUElOX1dJREdFVF9DT05UUk9MLCAweDApOwot
CiAJCWFsY19wcm9jZXNzX2NvZWZfZncoY29kZWMsIGNvZWYwMjU1KTsKIAkJbXNsZWVwKDMwMCk7
CiAJCXZhbCA9IGFsY19yZWFkX2NvZWZfaWR4KGNvZGVjLCAweDQ2KTsKIAkJaXNfY3RpYSA9ICh2
YWwgJiAweDAwNzApID09IDB4MDA3MDsKLQorCQlpZiAoIWlzX2N0aWEpIHsKKwkJCWFsY193cml0
ZV9jb2VmX2lkeChjb2RlYywgMHg0NSwgMHhlMDg5KTsKKwkJCW1zbGVlcCgxMDApOworCQkJdmFs
ID0gYWxjX3JlYWRfY29lZl9pZHgoY29kZWMsIDB4NDYpOworCQkJaWYgKCh2YWwgJiAweDAwNzAp
ID09IDB4MDA3MCkKKwkJCQlpc19jdGlhID0gZmFsc2U7CisJCQllbHNlIAorCQkJCWlzX2N0aWEg
PSB0cnVlOworCQl9CiAJCWFsY193cml0ZV9jb2VmZXhfaWR4KGNvZGVjLCAweDU3LCAweDMsIDB4
MGRhMyk7CiAJCWFsY191cGRhdGVfY29lZmV4X2lkeChjb2RlYywgMHg1NywgMHg1LCAxPDwxNCwg
MCk7Ci0KLQkJc25kX2hkYV9jb2RlY193cml0ZShjb2RlYywgMHgyMSwgMCwKLQkJCSAgICBBQ19W
RVJCX1NFVF9QSU5fV0lER0VUX0NPTlRST0wsIFBJTl9PVVQpOwotCQltc2xlZXAoODApOwotCQlz
bmRfaGRhX2NvZGVjX3dyaXRlKGNvZGVjLCAweDIxLCAwLAotCQkJICAgIEFDX1ZFUkJfU0VUX0FN
UF9HQUlOX01VVEUsIEFNUF9PVVRfVU5NVVRFKTsKIAkJYnJlYWs7CiAJY2FzZSAweDEwZWMwMjM0
OgogCWNhc2UgMHgxMGVjMDI3NDoK

--_002_bb8e2de30d294dc287944efa0667685arealtekcom_--
