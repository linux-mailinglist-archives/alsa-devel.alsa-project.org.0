Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CD42BA0A0
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 03:47:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89DA29F6;
	Fri, 20 Nov 2020 03:46:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89DA29F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605840469;
	bh=jRc9VZn/VYj66LZBRwskFuUqHUUvFfymtv3BXCLcukk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qs0pfTDRxdIojgMsGUGshsZJnNvQJoFpB4OgxAxmXuu4TYXVsurQ79zcSaIICqTmX
	 kJDe/wMogEw85hbjjldutmKctqG3zfzpX7FaGEmnuqzfK8ZXWqpaTjc1k2J4nULEAh
	 SkfTDr5qEPysIF2AGRrCy8Iv0H3TghNSYDlC3o6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FB7AF80166;
	Fri, 20 Nov 2020 03:46:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C902F8016C; Fri, 20 Nov 2020 03:46:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD64CF800C5
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 03:46:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD64CF800C5
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0AK2jwmoF023812,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb05.realtek.com.tw[172.21.6.98])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0AK2jwmoF023812
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 20 Nov 2020 10:45:59 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMB05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Fri, 20 Nov 2020 10:45:58 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2]) by
 RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2%8]) with mapi id
 15.01.2106.003; Fri, 20 Nov 2020 10:45:58 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: Dell AIO wrong sound tone
Thread-Topic: Dell AIO wrong sound tone
Thread-Index: Ada+Vbame/j5bVA8Sy+3hUmLjgVgfv//n/MA//5/WfA=
Date: Fri, 20 Nov 2020 02:45:58 +0000
Message-ID: <593c777dcfef4546aa050e105b8e53b5@realtek.com>
References: <582be5538aca4c5e86e436854e06036b@realtek.com>
 <s5h3615lgm9.wl-tiwai@suse.de>
In-Reply-To: <s5h3615lgm9.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.96]
Content-Type: multipart/mixed;
 boundary="_002_593c777dcfef4546aa050e105b8e53b5realtekcom_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--_002_593c777dcfef4546aa050e105b8e53b5realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Thursday, November 19, 2020 7:40 PM
> To: Kailang <kailang@realtek.com>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Re: Dell AIO wrong sound tone
>=20
> On Thu, 19 Nov 2020 10:26:58 +0100,
> Kailang wrote:
> >
> > Hi Takashi,
> >
> > Dell AIO only had one audio jack.
> > It will get wrong sound tone with replug speaker or HP or headset.
> > This patch will solve it.
>=20
> Could you give a brief comment what actually this COEF change does?
>=20
It was combo jack control. It changed for Mic RING and SLEEVE swap.
This issue also headset Mic can't record.
>=20
> thanks,
>=20
> Takashi
>=20
> ------Please consider the environment before printing this e-mail.

--_002_593c777dcfef4546aa050e105b8e53b5realtekcom_
Content-Type: application/octet-stream; name="0001-dell-aio-headset.patch"
Content-Description: 0001-dell-aio-headset.patch
Content-Disposition: attachment; filename="0001-dell-aio-headset.patch";
	size=4106; creation-date="Fri, 20 Nov 2020 02:44:05 GMT";
	modification-date="Fri, 20 Nov 2020 02:44:06 GMT"
Content-Transfer-Encoding: base64

RnJvbSA4ZDk3ZDY3OGZkYmYwY2U5OGQ2MjgxYzA3NjgwNTgxNDgyNjhiMzY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBrYWlsYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpEYXRlOiBU
aHUsIDE5IE5vdiAyMDIwIDE3OjA0OjIxICswODAwClN1YmplY3Q6IFtQQVRDSF0gQUxTQTogaGRh
L3JlYWx0ZWsgLSBGaXhlZCBEZWxsIEFJTyB3cm9uZyBzb3VuZCB0b25lCgpUaGlzIHBsYXRmb3Jt
IG9ubHkgaGFkIG9uZSBhdWRpbyBqYWNrLgpJZiBpdCBwbHVnZ2VkIHNwZWFrZXIgdGhlbiByZXBs
dWcgd2l0aCBzcGVha2VyIG9yIGhlYWRzZXQsIHRoZSBzb3VuZCB0b25lIHdpbGwgCmNoYW5nZSB0
byBhYm5vcm1hbC4KSGVhZHNldCBNaWMgYWxzbyBjYW4ndCByZWNvcmQgd2hlbiB0aGlzIGlzc3Vl
IHdhcyBoYXBwZW4uCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRl
ay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3Vu
ZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCA3MzlkYmFmNTQ1MTcuLjI3MDY5ZDk5NTYy
ZCAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291bmQv
cGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTExOSw2ICsxMTksNyBAQCBzdHJ1Y3QgYWxjX3Nw
ZWMgewogCXVuc2lnbmVkIGludCBub19zaHV0dXBfcGluczoxOwogCXVuc2lnbmVkIGludCB1bHRy
YV9sb3dfcG93ZXI6MTsKIAl1bnNpZ25lZCBpbnQgaGFzX2hzX2tleToxOworCXVuc2lnbmVkIGlu
dCBub19pbnRlcm5hbF9taWNfcGluOjE7CiAKIAkvKiBmb3IgUExMIGZpeCAqLwogCWhkYV9uaWRf
dCBwbGxfbmlkOwpAQCAtNDUyMyw2ICs0NTI0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjb2Vm
X2Z3IGFsYzIyNV9wcmVfaHNtb2RlW10gPSB7CiAKIHN0YXRpYyB2b2lkIGFsY19oZWFkc2V0X21v
ZGVfdW5wbHVnZ2VkKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogeworCXN0cnVjdCBhbGNfc3Bl
YyAqc3BlYyA9IGNvZGVjLT5zcGVjOwogCXN0YXRpYyBjb25zdCBzdHJ1Y3QgY29lZl9mdyBjb2Vm
MDI1NVtdID0gewogCQlXUklURV9DT0VGKDB4MWIsIDB4MGMwYiksIC8qIExETyBhbmQgTUlTQyBj
b250cm9sICovCiAJCVdSSVRFX0NPRUYoMHg0NSwgMHhkMDg5KSwgLyogVUFKIGZ1bmN0aW9uIHNl
dCB0byBtZW51YWwgbW9kZSAqLwpAQCAtNDU5Nyw2ICs0NTk5LDExIEBAIHN0YXRpYyB2b2lkIGFs
Y19oZWFkc2V0X21vZGVfdW5wbHVnZ2VkKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCQl7fQog
CX07CiAKKwlpZiAoc3BlYy0+bm9faW50ZXJuYWxfbWljX3BpbikgeworCQlhbGNfdXBkYXRlX2Nv
ZWZfaWR4KGNvZGVjLCAweDQ1LCAweGY8PDEyIHwgMTw8MTAsIDU8PDEyKTsKKwkJcmV0dXJuOwor
CX0KKwogCXN3aXRjaCAoY29kZWMtPmNvcmUudmVuZG9yX2lkKSB7CiAJY2FzZSAweDEwZWMwMjU1
OgogCQlhbGNfcHJvY2Vzc19jb2VmX2Z3KGNvZGVjLCBjb2VmMDI1NSk7CkBAIC01MTYzLDYgKzUx
NzAsMTEgQEAgc3RhdGljIHZvaWQgYWxjX2RldGVybWluZV9oZWFkc2V0X3R5cGUoc3RydWN0IGhk
YV9jb2RlYyAqY29kZWMpCiAJCXt9CiAJfTsKIAorCWlmIChzcGVjLT5ub19pbnRlcm5hbF9taWNf
cGluKSB7CisJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4NDUsIDB4Zjw8MTIgfCAxPDwx
MCwgNTw8MTIpOworCQlyZXR1cm47CisJfQorCiAJc3dpdGNoIChjb2RlYy0+Y29yZS52ZW5kb3Jf
aWQpIHsKIAljYXNlIDB4MTBlYzAyNTU6CiAJCWFsY19wcm9jZXNzX2NvZWZfZncoY29kZWMsIGNv
ZWYwMjU1KTsKQEAgLTYxMjEsNiArNjEzMywyMiBAQCBzdGF0aWMgdm9pZCBhbGMyNzRfZml4dXBf
aHBfaGVhZHNldF9taWMoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCiAJfQogfQogCitzdGF0aWMg
dm9pZCBhbGNfZml4dXBfbm9faW50X21pYyhzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYywKKwkJCQkg
ICAgY29uc3Qgc3RydWN0IGhkYV9maXh1cCAqZml4LCBpbnQgYWN0aW9uKQoreworCXN0cnVjdCBh
bGNfc3BlYyAqc3BlYyA9IGNvZGVjLT5zcGVjOworCisJc3dpdGNoIChhY3Rpb24pIHsKKwljYXNl
IEhEQV9GSVhVUF9BQ1RfUFJFX1BST0JFOgorCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAw
eDQ1LCAweGY8PDEyIHwgMTw8MTAsIDU8PDEyKTsKKwkJc3BlYy0+bm9faW50ZXJuYWxfbWljX3Bp
biA9IHRydWU7CisJCWJyZWFrOworCWNhc2UgSERBX0ZJWFVQX0FDVF9JTklUOgorCQlhbGNfY29t
Ym9famFja19ocF9qZF9yZXN0YXJ0KGNvZGVjKTsKKwkJYnJlYWs7CisJfQorfQorCiAvKiBmb3Ig
aGRhX2ZpeHVwX3RoaW5rcGFkX2FjcGkoKSAqLwogI2luY2x1ZGUgInRoaW5rcGFkX2hlbHBlci5j
IgogCkBAIC02MzIwLDYgKzYzNDgsNyBAQCBlbnVtIHsKIAlBTEMyODVfRklYVVBfVEhJTktQQURf
Tk9fQkFTU19TUEtfSEVBRFNFVF9KQUNLLAogCUFMQzI4N19GSVhVUF9IUF9HUElPX0xFRCwKIAlB
TEMyNTZfRklYVVBfSFBfSEVBRFNFVF9NSUMsCisJQUxDMjM2X0ZJWFVQX0RFTExfQUlPX0hFQURT
RVRfTUlDLAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfZml4dXAgYWxjMjY5X2ZpeHVw
c1tdID0gewpAQCAtNzczOCw2ICs3NzY3LDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX2Zp
eHVwIGFsYzI2OV9maXh1cHNbXSA9IHsKIAkJLnR5cGUgPSBIREFfRklYVVBfRlVOQywKIAkJLnYu
ZnVuYyA9IGFsYzI3NF9maXh1cF9ocF9oZWFkc2V0X21pYywKIAl9LAorCVtBTEMyMzZfRklYVVBf
REVMTF9BSU9fSEVBRFNFVF9NSUNdID0geworCQkudHlwZSA9IEhEQV9GSVhVUF9GVU5DLAorCQku
di5mdW5jID0gYWxjX2ZpeHVwX25vX2ludF9taWMsCisJCS5jaGFpbmVkID0gdHJ1ZSwKKwkJLmNo
YWluX2lkID0gQUxDMjU1X0ZJWFVQX0RFTEwxX01JQ19OT19QUkVTRU5DRQorCX0sCiB9OwogCiBz
dGF0aWMgY29uc3Qgc3RydWN0IHNuZF9wY2lfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewpA
QCAtNzgxNSw2ICs3ODUwLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJrIGFs
YzI2OV9maXh1cF90YmxbXSA9IHsKIAlTTkRfUENJX1FVSVJLKDB4MTAyOCwgMHgwOTdkLCAiRGVs
bCBQcmVjaXNpb24iLCBBTEMyODlfRklYVVBfRFVBTF9TUEspLAogCVNORF9QQ0lfUVVJUksoMHgx
MDI4LCAweDA5OGQsICJEZWxsIFByZWNpc2lvbiIsIEFMQzIzM19GSVhVUF9BU1VTX01JQ19OT19Q
UkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDEwMjgsIDB4MDliZiwgIkRlbGwgUHJlY2lzaW9u
IiwgQUxDMjMzX0ZJWFVQX0FTVVNfTUlDX05PX1BSRVNFTkNFKSwKKwlTTkRfUENJX1FVSVJLKDB4
MTAyOCwgMHgwYTJlLCAiRGVsbCIsIEFMQzIzNl9GSVhVUF9ERUxMX0FJT19IRUFEU0VUX01JQyks
CisJU05EX1BDSV9RVUlSSygweDEwMjgsIDB4MGEzMCwgIkRlbGwiLCBBTEMyMzZfRklYVVBfREVM
TF9BSU9fSEVBRFNFVF9NSUMpLAogCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDE2NGEsICJEZWxs
IiwgQUxDMjkzX0ZJWFVQX0RFTEwxX01JQ19OT19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygw
eDEwMjgsIDB4MTY0YiwgIkRlbGwiLCBBTEMyOTNfRklYVVBfREVMTDFfTUlDX05PX1BSRVNFTkNF
KSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHgxNTg2LCAiSFAiLCBBTEMyNjlfRklYVVBfSFBf
TVVURV9MRURfTUlDMiksCkBAIC04MzUzLDYgKzgzOTAsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHNuZF9oZGFfcGluX3F1aXJrIGFsYzI2OV9waW5fZml4dXBfdGJsW10gPSB7CiAJCXsweDE5LCAw
eDAyYTExMDIwfSwKIAkJezB4MWEsIDB4MDJhMTEwMzB9LAogCQl7MHgyMSwgMHgwMjIxMTAxZn0p
LAorCVNORF9IREFfUElOX1FVSVJLKDB4MTBlYzAyMzYsIDB4MTAyOCwgIkRlbGwiLCBBTEMyMzZf
RklYVVBfREVMTF9BSU9fSEVBRFNFVF9NSUMsCisJCXsweDIxLCAweDAyMjExMDEwfSksCiAJU05E
X0hEQV9QSU5fUVVJUksoMHgxMGVjMDIzNiwgMHgxMDNjLCAiSFAiLCBBTEMyNTZfRklYVVBfSFBf
SEVBRFNFVF9NSUMsCiAJCXsweDE0LCAweDkwMTcwMTEwfSwKIAkJezB4MTksIDB4MDJhMTEwMjB9
LAo=

--_002_593c777dcfef4546aa050e105b8e53b5realtekcom_--
