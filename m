Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E7189EEB9
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 11:24:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A22127A8;
	Wed, 10 Apr 2024 11:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A22127A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712741056;
	bh=LhsJn032F5W7xfDZBk4D1YLq6MZXfXT9oABK0K3FKaM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TABGsfQwzjqhCArWJulkW1n8mcbr2L3Ih/kv9ECxrOgQ6QOK7Y8PnU3gb7UVGAfXA
	 tCxYsF4O6gt9/Yn4A/H9+IUwUOg/eRJrvZL/w9s6Bhwq2Gj0UT2F1IGnclw8jt9TLP
	 DBLKjISnqUTccOAleRwHRxhuBBy01eTnP7KPEN0Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A46BFF8057A; Wed, 10 Apr 2024 11:23:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B74DF8059F;
	Wed, 10 Apr 2024 11:23:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A4EBF8026D; Wed, 10 Apr 2024 11:23:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE0F5F8013D
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 11:23:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE0F5F8013D
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 43A9NMZh83893147,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 43A9NMZh83893147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Apr 2024 17:23:22 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 17:23:22 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 17:23:22 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975]) by
 RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975%5]) with mapi id
 15.01.2507.035; Wed, 10 Apr 2024 17:23:22 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Thinkpad with ALC1318 has a chance of damaging the IC
Thread-Topic: Thinkpad with ALC1318 has a chance of damaging the IC
Thread-Index: AdqLKCI9ErPUavK7TEaXgj62PwNxmg==
Date: Wed, 10 Apr 2024 09:23:21 +0000
Message-ID: <abaf92fb83b04f1397a283db241db9a0@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_abaf92fb83b04f1397a283db241db9a0realtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: 4UH3AFOUSCT3NTVVH72JVEODZXUP52L6
X-Message-ID-Hash: 4UH3AFOUSCT3NTVVH72JVEODZXUP52L6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4UH3AFOUSCT3NTVVH72JVEODZXUP52L6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_abaf92fb83b04f1397a283db241db9a0realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Thinkpad with ALC1318 has a chance of damaging the IC at S4 resume.

BR,
Kailang

--_002_abaf92fb83b04f1397a283db241db9a0realtekcom_
Content-Type: application/octet-stream;
	name="0000-alc287-tp-with-alc1318.patch"
Content-Description: 0000-alc287-tp-with-alc1318.patch
Content-Disposition: attachment;
	filename="0000-alc287-tp-with-alc1318.patch"; size=2747;
	creation-date="Tue, 09 Apr 2024 07:05:57 GMT";
	modification-date="Wed, 10 Apr 2024 09:12:57 GMT"
Content-Transfer-Encoding: base64

RnJvbSAxNGM1MTYwOWM4YzIzN2UzNWJjN2VkMzFhZTI4ZTMzYTcyNjE3MGY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFdlZCwgMTAgQXByIDIwMjQgMTY6NTc6MjggKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIFNldCBHUElPMyB0byBkZWZhdWx0IGF0IFM0IHN0YXRlIGZvciBUaGlu
a3BhZCB3aXRoIEFMQzEzMTgKClRoZXJlIGlzIGEgY2hhbmNlIG9mIGRhbWFnaW5nIHRoZSBJQyB3
aGVuIFM0IHJlc3VtZS4KVGhpbmtwYWQgd2l0aCBBTEMxMzE4IHBsYXRmb3JtIG5lZWQgdG8gYWRk
IHRoaXMgd29ya2Fyb3VuZC4KClNpZ25lZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0By
ZWFsdGVrLmNvbT4KZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIv
c291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggZDY5NDBiYzRlYzM5Li5kYmM3NzU2
ZWI5ODAgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3Nv
dW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC03MTgzLDYgKzcxODMsMjQgQEAgc3RhdGlj
IHZvaWQgYWxjMjQ1X2ZpeHVwX2hwX3NwZWN0cmVfeDM2MF9ldTB4eHgoc3RydWN0IGhkYV9jb2Rl
YyAqY29kZWMsCiAJYWxjMjQ1X2ZpeHVwX2hwX2dwaW9fbGVkKGNvZGVjLCBmaXgsIGFjdGlvbik7
CiB9CiAKK3N0YXRpYyB2b2lkIGFsYzI4N19zNF9wb3dlcl9ncGlvM19kZWZhdWx0KHN0cnVjdCBo
ZGFfY29kZWMgKmNvZGVjKQoreworCWlmIChjb2RlYy0+Y29yZS5kZXYucG93ZXIucG93ZXJfc3Rh
dGUgPT0gUE1TR19GUkVFWkUpIHsKKwkJYWxjX3dyaXRlX2NvZWZfaWR4KGNvZGVjLCAweDEwLCAw
eDg4MDYpOyAvKiBDaGFuZ2UgTUNMSyB0byBHUElPMyAqLworCQlhbGNfd3JpdGVfY29lZmV4X2lk
eChjb2RlYywgMHg1YSwgMHgwMCwgMHg1NTRmKTsgLyogd3JpdGUgZ3BpbzMgYXMgZGVmYXVsdCB2
YWx1ZSAqLworCX0KK30KKworc3RhdGljIHZvaWQgYWxjMjg3X2ZpeHVwX2xlbm92b190aGlua3Bh
ZF93aXRoX2FsYzEzMTgoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCisJCQkgICAgICAgY29uc3Qg
c3RydWN0IGhkYV9maXh1cCAqZml4LCBpbnQgYWN0aW9uKQoreworCXN0cnVjdCBhbGNfc3BlYyAq
c3BlYyA9IGNvZGVjLT5zcGVjOworCisJaWYgKGFjdGlvbiAhPSBIREFfRklYVVBfQUNUX1BSRV9Q
Uk9CRSkKKwkJcmV0dXJuOworCXNwZWMtPnBvd2VyX2hvb2sgPSBhbGMyODdfczRfcG93ZXJfZ3Bp
bzNfZGVmYXVsdDsKK30KKwogCiBlbnVtIHsKIAlBTEMyNjlfRklYVVBfR1BJTzIsCkBAIC03NDY3
LDYgKzc0ODUsNyBAQCBlbnVtIHsKIAlBTEMyODVfRklYVVBfQ1MzNUw1Nl9JMkNfMiwKIAlBTEMy
ODVfRklYVVBfQ1MzNUw1Nl9JMkNfNCwKIAlBTEMyODVfRklYVVBfQVNVU19HQTQwM1UsCisJQUxD
Mjg3X0ZJWFVQX0xFTk9WT19USEtQQURfV0hfQUxDMTMxOCwKIH07CiAKIC8qIEEgc3BlY2lhbCBm
aXh1cCBmb3IgTGVub3ZvIEM5NDAgYW5kIFlvZ2EgRHVldCA3OwpAQCAtOTY5MCw2ICs5NzA5LDEw
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwIGFsYzI2OV9maXh1cHNbXSA9IHsKIAkJ
LnR5cGUgPSBIREFfRklYVVBfRlVOQywKIAkJLnYuZnVuYyA9IGFsYzI4NV9maXh1cF9hc3VzX2dh
NDAzdSwKIAl9LAorCVtBTEMyODdfRklYVVBfTEVOT1ZPX1RIS1BBRF9XSF9BTEMxMzE4XSA9IHsK
KwkJLnR5cGUgPSBIREFfRklYVVBfRlVOQywKKwkJLnYuZnVuYyA9IGFsYzI4N19maXh1cF9sZW5v
dm9fdGhpbmtwYWRfd2l0aF9hbGMxMzE4LAorCX0sCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0
IHNuZF9wY2lfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewpAQCAtMTAzNTUsNiArMTAzNzgs
OCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9wY2lfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtd
ID0gewogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDIzMTgsICJUaGlua3BhZCBaMTMgR2VuMiIs
IEFMQzI4N19GSVhVUF9NR19SVEtDX0NTQU1QX0NTMzVMNDFfSTJDX1RISU5LUEFEKSwKIAlTTkRf
UENJX1FVSVJLKDB4MTdhYSwgMHgyMzE5LCAiVGhpbmtwYWQgWjE2IEdlbjIiLCBBTEMyODdfRklY
VVBfTUdfUlRLQ19DU0FNUF9DUzM1TDQxX0kyQ19USElOS1BBRCksCiAJU05EX1BDSV9RVUlSSygw
eDE3YWEsIDB4MjMxYSwgIlRoaW5rcGFkIFoxNiBHZW4yIiwgQUxDMjg3X0ZJWFVQX01HX1JUS0Nf
Q1NBTVBfQ1MzNUw0MV9JMkNfVEhJTktQQUQpLAorCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDIz
MWUsICJUaGlua3BhZCIsIEFMQzI4N19GSVhVUF9MRU5PVk9fVEhLUEFEX1dIX0FMQzEzMTgpLAor
CVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDIzMWYsICJUaGlua3BhZCIsIEFMQzI4N19GSVhVUF9M
RU5PVk9fVEhLUEFEX1dIX0FMQzEzMTgpLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDMwYmIs
ICJUaGlua0NlbnRyZSBBSU8iLCBBTEMyMzNfRklYVVBfTEVOT1ZPX0xJTkUyX01JQ19IT1RLRVkp
LAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDMwZTIsICJUaGlua0NlbnRyZSBBSU8iLCBBTEMy
MzNfRklYVVBfTEVOT1ZPX0xJTkUyX01JQ19IT1RLRVkpLAogCVNORF9QQ0lfUVVJUksoMHgxN2Fh
LCAweDMxMGMsICJUaGlua0NlbnRyZSBTdGF0aW9uIiwgQUxDMjk0X0ZJWFVQX0xFTk9WT19NSUNf
TE9DQVRJT04pLAo=

--_002_abaf92fb83b04f1397a283db241db9a0realtekcom_--
