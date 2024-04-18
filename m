Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 623588A9325
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 08:34:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F27A9E94;
	Thu, 18 Apr 2024 08:34:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F27A9E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713422088;
	bh=rRtBYbIqdL0DFhxpAy1slDIzMF7D1GaTkC5RqajmICg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ClgdtXpm73cGcs75/9RvL7a8A8jmOcpeoUCfZFZdtrXEynf0mQramk/MWOxJHInoT
	 v7ACjVXSKjOFj2Ehx0BZx7VZTdq/GrMIWUBpTr1fLcy9uowHVg7UKkkfjacYxvnnyR
	 puqklmI44Hn6UaObxZdLeQFkPkcKd7W4VX9PFbXQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79358F80579; Thu, 18 Apr 2024 08:34:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4DDEF805A0;
	Thu, 18 Apr 2024 08:34:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA252F8025A; Thu, 18 Apr 2024 08:34:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83FC1F8003A
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 08:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83FC1F8003A
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 43I6Xg302011818,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 43I6Xg302011818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Apr 2024 14:33:42 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 14:33:42 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 14:33:42 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975]) by
 RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975%5]) with mapi id
 15.01.2507.035; Thu, 18 Apr 2024 14:33:42 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: RE: Thinkpad with ALC1318 has a chance of damaging the IC
Thread-Topic: Thinkpad with ALC1318 has a chance of damaging the IC
Thread-Index: AdqLKCI9ErPUavK7TEaXgj62PwNxmgD7qaAAAH+2eoAAEQ+VEA==
Date: Thu, 18 Apr 2024 06:33:42 +0000
Message-ID: <acb0953b16d14047ae581772268c1e7c@realtek.com>
References: <c646c8ef954d41e6b8fa78b202fd306d@realtek.com>
 <87o7a7xkas.wl-tiwai@suse.de>
In-Reply-To: <87o7a7xkas.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.22.102.106]
Content-Type: multipart/mixed;
	boundary="_002_acb0953b16d14047ae581772268c1e7crealtekcom_"
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: JBGIC4Q6WOFO2CMXADJDWUFFSCTTV7EG
X-Message-ID-Hash: JBGIC4Q6WOFO2CMXADJDWUFFSCTTV7EG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JBGIC4Q6WOFO2CMXADJDWUFFSCTTV7EG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_acb0953b16d14047ae581772268c1e7crealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

New patch was attached.
new additional function was request from Lenovo.

BR,
Kailang

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Thursday, April 18, 2024 2:22 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: Thinkpad with ALC1318 has a chance of damaging the IC
>=20
>=20
> External mail.
>=20
>=20
>=20
> On Mon, 15 Apr 2024 11:27:50 +0200,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > Please don't apply this patch.
> > They want to add stream open to enable GPIO3 functions.
>=20
> OK, let me know if the new patch is ready.
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> >
> > BR,
> > Kailang
> >
> > > -----Original Message-----
> > > From: Kailang
> > > Sent: Wednesday, April 10, 2024 5:23 PM
> > > To: Takashi Iwai (tiwai@suse.de) <tiwai@suse.de>
> > > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> > > Subject: Thinkpad with ALC1318 has a chance of damaging the IC
> > >
> > > Hi Takashi,
> > >
> > > Thinkpad with ALC1318 has a chance of damaging the IC at S4 resume.
> > >
> > > BR,
> > > Kailang

--_002_acb0953b16d14047ae581772268c1e7crealtekcom_
Content-Type: application/octet-stream;
	name="0001-alc287-tp-with-alc1318.patch"
Content-Description: 0001-alc287-tp-with-alc1318.patch
Content-Disposition: attachment;
	filename="0001-alc287-tp-with-alc1318.patch"; size=3439;
	creation-date="Mon, 15 Apr 2024 09:46:54 GMT";
	modification-date="Thu, 18 Apr 2024 06:29:58 GMT"
Content-Transfer-Encoding: base64

RnJvbSBjZTlhMGVlOTliMDc5ZTE1OGM1NTRjYmMzNjkzM2MyNGIxNmZhNWFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMTggQXByIDIwMjQgMTQ6MjM6NTcgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIFNldCBHUElPMyB0byBkZWZhdWx0IGF0IFM0IHN0YXRlIGZvciBUaGlu
a3BhZCB3aXRoIEFMQzEzMTgKClRoZXJlIGlzIGEgY2hhbmNlIG9mIGRhbWFnaW5nIHRoZSBJQyB3
aGVuIFM0IHJlc3VtZS4KQWRkIHNhZmUgbW9kZSBmb3Igbm8gc3RyZWFtIHRvIGRpc2FibGUgR1BJ
TzMuClRoaW5rcGFkIHdpdGggQUxDMTMxOCBwbGF0Zm9ybSBuZWVkIHRvIGFkZCB0aGlzIHdvcmth
cm91bmQuCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+
CmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9o
ZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IGQ2OTQwYmM0ZWMzOS4uOGQ0M2I3OWFjYjliIDEwMDY0
NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRh
L3BhdGNoX3JlYWx0ZWsuYwpAQCAtNzE4Miw2ICs3MTgyLDQzIEBAIHN0YXRpYyB2b2lkIGFsYzI0
NV9maXh1cF9ocF9zcGVjdHJlX3gzNjBfZXUweHh4KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAog
CWFsYzI0NV9maXh1cF9ocF9tdXRlX2xlZF9jb2VmYml0KGNvZGVjLCBmaXgsIGFjdGlvbik7CiAJ
YWxjMjQ1X2ZpeHVwX2hwX2dwaW9fbGVkKGNvZGVjLCBmaXgsIGFjdGlvbik7CiB9CisvKgorICog
QUxDMjg3IFBDTSBob29rcworICovCitzdGF0aWMgdm9pZCBhbGMyODdfYWxjMTMxOF9wbGF5YmFj
a19wY21faG9vayhzdHJ1Y3QgaGRhX3BjbV9zdHJlYW0gKmhpbmZvLAorCQkJCSAgIHN0cnVjdCBo
ZGFfY29kZWMgKmNvZGVjLAorCQkJCSAgIHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3Ry
ZWFtLAorCQkJCSAgIGludCBhY3Rpb24pCit7CisJYWxjX3dyaXRlX2NvZWZfaWR4KGNvZGVjLCAw
eDEwLCAweDg4MDYpOyAvKiBDaGFuZ2UgTUxLIHRvIEdQSU8zICovCisJc3dpdGNoIChhY3Rpb24p
IHsKKwljYXNlIEhEQV9HRU5fUENNX0FDVF9PUEVOOgorCQlhbGNfd3JpdGVfY29lZmV4X2lkeChj
b2RlYywgMHg1YSwgMHgwMCwgMHg5NTRmKTsgLyogd3JpdGUgZ3BpbzMgdG8gaGlnaCAqLworCQli
cmVhazsKKwljYXNlIEhEQV9HRU5fUENNX0FDVF9DTE9TRToKKwkJYWxjX3dyaXRlX2NvZWZleF9p
ZHgoY29kZWMsIDB4NWEsIDB4MDAsIDB4NTU0Zik7IC8qIHdyaXRlIGdwaW8zIGFzIGRlZmF1bHQg
dmFsdWUgKi8KKwkJYnJlYWs7CisJfQorfQorCitzdGF0aWMgdm9pZCBhbGMyODdfczRfcG93ZXJf
Z3BpbzNfZGVmYXVsdChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKK3sKKwlpZiAoY29kZWMtPmNv
cmUuZGV2LnBvd2VyLnBvd2VyX3N0YXRlID09IFBNU0dfRlJFRVpFKSB7CisJCWFsY193cml0ZV9j
b2VmX2lkeChjb2RlYywgMHgxMCwgMHg4ODA2KTsgLyogQ2hhbmdlIE1MSyB0byBHUElPMyAqLwor
CQlhbGNfd3JpdGVfY29lZmV4X2lkeChjb2RlYywgMHg1YSwgMHgwMCwgMHg1NTRmKTsgLyogd3Jp
dGUgZ3BpbzMgYXMgZGVmYXVsdCB2YWx1ZSAqLworCX0KK30KKworc3RhdGljIHZvaWQgYWxjMjg3
X2ZpeHVwX2xlbm92b190aGlua3BhZF93aXRoX2FsYzEzMTgoc3RydWN0IGhkYV9jb2RlYyAqY29k
ZWMsCisJCQkgICAgICAgY29uc3Qgc3RydWN0IGhkYV9maXh1cCAqZml4LCBpbnQgYWN0aW9uKQor
eworCXN0cnVjdCBhbGNfc3BlYyAqc3BlYyA9IGNvZGVjLT5zcGVjOworCisJaWYgKGFjdGlvbiAh
PSBIREFfRklYVVBfQUNUX1BSRV9QUk9CRSkKKwkJcmV0dXJuOworCXNwZWMtPnBvd2VyX2hvb2sg
PSBhbGMyODdfczRfcG93ZXJfZ3BpbzNfZGVmYXVsdDsKKwlzcGVjLT5nZW4ucGNtX3BsYXliYWNr
X2hvb2sgPSBhbGMyODdfYWxjMTMxOF9wbGF5YmFja19wY21faG9vazsKK30KIAogCiBlbnVtIHsK
QEAgLTc0NjcsNiArNzUwNCw3IEBAIGVudW0gewogCUFMQzI4NV9GSVhVUF9DUzM1TDU2X0kyQ18y
LAogCUFMQzI4NV9GSVhVUF9DUzM1TDU2X0kyQ180LAogCUFMQzI4NV9GSVhVUF9BU1VTX0dBNDAz
VSwKKwlBTEMyODdfRklYVVBfTEVOT1ZPX1RIS1BBRF9XSF9BTEMxMzE4LAogfTsKIAogLyogQSBz
cGVjaWFsIGZpeHVwIGZvciBMZW5vdm8gQzk0MCBhbmQgWW9nYSBEdWV0IDc7CkBAIC05NjkwLDYg
Kzk3MjgsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfZml4dXAgYWxjMjY5X2ZpeHVwc1td
ID0gewogCQkudHlwZSA9IEhEQV9GSVhVUF9GVU5DLAogCQkudi5mdW5jID0gYWxjMjg1X2ZpeHVw
X2FzdXNfZ2E0MDN1LAogCX0sCisJW0FMQzI4N19GSVhVUF9MRU5PVk9fVEhLUEFEX1dIX0FMQzEz
MThdID0geworCQkudHlwZSA9IEhEQV9GSVhVUF9GVU5DLAorCQkudi5mdW5jID0gYWxjMjg3X2Zp
eHVwX2xlbm92b190aGlua3BhZF93aXRoX2FsYzEzMTgsCisJfSwKIH07CiAKIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7CkBAIC0xMDM1NSw2
ICsxMDM5Nyw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMyNjlfZml4
dXBfdGJsW10gPSB7CiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MjMxOCwgIlRoaW5rcGFkIFox
MyBHZW4yIiwgQUxDMjg3X0ZJWFVQX01HX1JUS0NfQ1NBTVBfQ1MzNUw0MV9JMkNfVEhJTktQQUQp
LAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDIzMTksICJUaGlua3BhZCBaMTYgR2VuMiIsIEFM
QzI4N19GSVhVUF9NR19SVEtDX0NTQU1QX0NTMzVMNDFfSTJDX1RISU5LUEFEKSwKIAlTTkRfUENJ
X1FVSVJLKDB4MTdhYSwgMHgyMzFhLCAiVGhpbmtwYWQgWjE2IEdlbjIiLCBBTEMyODdfRklYVVBf
TUdfUlRLQ19DU0FNUF9DUzM1TDQxX0kyQ19USElOS1BBRCksCisJU05EX1BDSV9RVUlSSygweDE3
YWEsIDB4MjMxZSwgIlRoaW5rcGFkIiwgQUxDMjg3X0ZJWFVQX0xFTk9WT19USEtQQURfV0hfQUxD
MTMxOCksCisJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MjMxZiwgIlRoaW5rcGFkIiwgQUxDMjg3
X0ZJWFVQX0xFTk9WT19USEtQQURfV0hfQUxDMTMxOCksCiAJU05EX1BDSV9RVUlSSygweDE3YWEs
IDB4MzBiYiwgIlRoaW5rQ2VudHJlIEFJTyIsIEFMQzIzM19GSVhVUF9MRU5PVk9fTElORTJfTUlD
X0hPVEtFWSksCiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzBlMiwgIlRoaW5rQ2VudHJlIEFJ
TyIsIEFMQzIzM19GSVhVUF9MRU5PVk9fTElORTJfTUlDX0hPVEtFWSksCiAJU05EX1BDSV9RVUlS
SygweDE3YWEsIDB4MzEwYywgIlRoaW5rQ2VudHJlIFN0YXRpb24iLCBBTEMyOTRfRklYVVBfTEVO
T1ZPX01JQ19MT0NBVElPTiksCg==

--_002_acb0953b16d14047ae581772268c1e7crealtekcom_--
