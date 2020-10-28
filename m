Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D133E29CE5A
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 07:21:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67BCA1677;
	Wed, 28 Oct 2020 07:20:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67BCA1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603866083;
	bh=etzk0jndIkO59V8lAZh6q/t8lJ8OC/56W0acxNeTNDE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OtCnVOHoccD312eoZkFqxrdAbRWdrQdSgxxL2bYYHIYje00wjoFkrNRTalsWBdnKX
	 lgamVCeYJRFcEAXLzc0rZCske8A/WSk3gKY1IQU4jgrIyxaIOg7DFPcX5wWjU+Kkq7
	 lgteSu9ouVh2++qKs6F6j7ouIxrUpFZ6DrxHjzbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5B38F80249;
	Wed, 28 Oct 2020 07:19:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C25C0F80212; Wed, 28 Oct 2020 07:19:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56896F800E1
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 07:19:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56896F800E1
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 09S6JSizC020289,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb04.realtek.com.tw[172.21.6.97])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 09S6JSizC020289
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 28 Oct 2020 14:19:28 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMB04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Wed, 28 Oct 2020 14:19:28 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::d54f:4e7c:a966:6dc0]) by
 RTEXMBS01.realtek.com.tw ([fe80::d54f:4e7c:a966:6dc0%8]) with mapi id
 15.01.2106.002; Wed, 28 Oct 2020 14:19:28 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: HP AIO Headset Mic issue
Thread-Topic: HP AIO Headset Mic issue
Thread-Index: Adas8fHNfXo/ByJqRU2FhpqJgV4zqA==
Date: Wed, 28 Oct 2020 06:19:27 +0000
Message-ID: <f42ae1ede1cf47029ae2bef1a42caf03@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.96]
Content-Type: multipart/mixed;
 boundary="_002_f42ae1ede1cf47029ae2bef1a42caf03realtekcom_"
MIME-Version: 1.0
Cc: Hui Wang <hui.wang@canonical.com>,
 " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
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

--_002_f42ae1ede1cf47029ae2bef1a42caf03realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

HP AIO had headset Mic can't be detected by boot time.
Attach patch will fix it.

Many Thanks.
Kailang

--_002_f42ae1ede1cf47029ae2bef1a42caf03realtekcom_
Content-Type: application/octet-stream;
	name="0000-alc274-hp-aio-headset-mic.patch"
Content-Description: 0000-alc274-hp-aio-headset-mic.patch
Content-Disposition: attachment;
	filename="0000-alc274-hp-aio-headset-mic.patch"; size=4007;
	creation-date="Tue, 27 Oct 2020 08:48:22 GMT";
	modification-date="Wed, 28 Oct 2020 06:16:13 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2MzBhZDc4MTRlOWEyNzlhZDRiMGM3NWUwYzJmNzk0OGY4MjdiOGUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFR1ZSwgMjcgT2N0IDIwMjAgMTY6NDY6MzggKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEZpeGVkIEhQIGhlYWRzZXQgTWljIGNhbid0IGJlIGRldGVjdGVkCgpT
eXN0ZW0gYm9vdCB3aXRoIHBsdWdnZWQgaGVhZHNldC4gSXQgd2lsbCBub3QgZGV0ZWN0IGhlYWRz
ZXQgTWljLgpJdCB3aWxsIGhhcHBlbiBvbiBjb2xkIGJvb3QgcmVzdGFydCByZXN1bWUgc3RhdGUu
ClF1aXJrIGJ5IFNTSUQgY2hhbmdlIHRvIHF1aXJrIGJ5IHBpbiB2ZXJiLgoKZml4ZXM6MTM0Njhi
ZmE4YzU4ICgiQUxTQTogaGRhL3JlYWx0ZWsgLSBzZXQgbWljIHRvIGF1dG8gZGV0ZWN0IG9uIGEg
SFAgQUlPIG1hY2hpbmUiKQpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVh
bHRlay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9z
b3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCBmMjM5ODcyMWFjMWUuLjg5ZTg1MGRj
NThkNCAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291
bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTYwMDgsNiArNjAwOCwyNyBAQCBzdGF0aWMg
dm9pZCBhbGMyODVfZml4dXBfaW52YWxpZGF0ZV9kYWNzKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVj
LAogCXNuZF9oZGFfb3ZlcnJpZGVfd2NhcHMoY29kZWMsIDB4MDMsIDApOwogfQogCitzdGF0aWMg
dm9pZCBhbGNfY29tYm9famFja19ocF9qZF9yZXN0YXJ0KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVj
KQoreworCXN3aXRjaCAoY29kZWMtPmNvcmUudmVuZG9yX2lkKSB7CisJY2FzZSAweDEwZWMwMjc0
OgorCWNhc2UgMHgxMGVjMDI5NDoKKwljYXNlIDB4MTBlYzAyMjU6CisJY2FzZSAweDEwZWMwMjk1
OgorCWNhc2UgMHgxMGVjMDI5OToKKwkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHg0YSwg
MHg4MDAwLCAxIDw8IDE1KTsgLyogUmVzZXQgSFAgSkQgKi8KKwkJYWxjX3VwZGF0ZV9jb2VmX2lk
eChjb2RlYywgMHg0YSwgMHg4MDAwLCAwIDw8IDE1KTsKKwkJYnJlYWs7CisJY2FzZSAweDEwZWMw
MjM1OgorCWNhc2UgMHgxMGVjMDIzNjoKKwljYXNlIDB4MTBlYzAyNTU6CisJY2FzZSAweDEwZWMw
MjU2OgorCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDFiLCAweDgwMDAsIDEgPDwgMTUp
OyAvKiBSZXNldCBIUCBKRCAqLworCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDFiLCAw
eDgwMDAsIDAgPDwgMTUpOworCQlicmVhazsKKwl9Cit9CisKIHN0YXRpYyB2b2lkIGFsYzI5NV9m
aXh1cF9jaHJvbWVib29rKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAogCQkJCSAgICBjb25zdCBz
dHJ1Y3QgaGRhX2ZpeHVwICpmaXgsIGludCBhY3Rpb24pCiB7CkBAIC02MDE4LDE2ICs2MDM5LDcg
QEAgc3RhdGljIHZvaWQgYWxjMjk1X2ZpeHVwX2Nocm9tZWJvb2soc3RydWN0IGhkYV9jb2RlYyAq
Y29kZWMsCiAJCXNwZWMtPnVsdHJhX2xvd19wb3dlciA9IHRydWU7CiAJCWJyZWFrOwogCWNhc2Ug
SERBX0ZJWFVQX0FDVF9JTklUOgotCQlzd2l0Y2ggKGNvZGVjLT5jb3JlLnZlbmRvcl9pZCkgewot
CQljYXNlIDB4MTBlYzAyOTU6Ci0JCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDRhLCAw
eDgwMDAsIDEgPDwgMTUpOyAvKiBSZXNldCBIUCBKRCAqLwotCQkJYWxjX3VwZGF0ZV9jb2VmX2lk
eChjb2RlYywgMHg0YSwgMHg4MDAwLCAwIDw8IDE1KTsKLQkJCWJyZWFrOwotCQljYXNlIDB4MTBl
YzAyMzY6Ci0JCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDFiLCAweDgwMDAsIDEgPDwg
MTUpOyAvKiBSZXNldCBIUCBKRCAqLwotCQkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgx
YiwgMHg4MDAwLCAwIDw8IDE1KTsKLQkJCWJyZWFrOwotCQl9CisJCWFsY19jb21ib19qYWNrX2hw
X2pkX3Jlc3RhcnQoY29kZWMpOwogCQlicmVhazsKIAl9CiB9CkBAIC02MDgzLDYgKzYwOTUsMTYg
QEAgc3RhdGljIHZvaWQgIGFsYzI4NV9maXh1cF9ocF9ncGlvX2FtcF9pbml0KHN0cnVjdCBoZGFf
Y29kZWMgKmNvZGVjLAogCWFsY193cml0ZV9jb2VmX2lkeChjb2RlYywgMHg2NSwgMHgwKTsKIH0K
IAorc3RhdGljIHZvaWQgYWxjMjc0X2ZpeHVwX2hwX2hlYWRzZXRfbWljKHN0cnVjdCBoZGFfY29k
ZWMgKmNvZGVjLAorCQkJCSAgICBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwICpmaXgsIGludCBhY3Rp
b24pCit7CisJc3dpdGNoIChhY3Rpb24pIHsKKwljYXNlIEhEQV9GSVhVUF9BQ1RfSU5JVDoKKwkJ
YWxjX2NvbWJvX2phY2tfaHBfamRfcmVzdGFydChjb2RlYyk7CisJCWJyZWFrOworCX0KK30KKwog
LyogZm9yIGhkYV9maXh1cF90aGlua3BhZF9hY3BpKCkgKi8KICNpbmNsdWRlICJ0aGlua3BhZF9o
ZWxwZXIuYyIKIApAQCAtNjI3Nyw2ICs2Mjk5LDcgQEAgZW51bSB7CiAJQUxDMjU2X0ZJWFVQX0lO
VEVMX05VQzhfUlVHR0VELAogCUFMQzI1NV9GSVhVUF9YSUFPTUlfSEVBRFNFVF9NSUMsCiAJQUxD
Mjc0X0ZJWFVQX0hQX01JQywKKwlBTEMyNzRfRklYVVBfSFBfSEVBRFNFVF9NSUMsCiB9OwogCiBz
dGF0aWMgY29uc3Qgc3RydWN0IGhkYV9maXh1cCBhbGMyNjlfZml4dXBzW10gPSB7CkBAIC03NjY0
LDYgKzc2ODcsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfZml4dXAgYWxjMjY5X2ZpeHVw
c1tdID0gewogCQkJeyB9CiAJCX0sCiAJfSwKKwlbQUxDMjc0X0ZJWFVQX0hQX0hFQURTRVRfTUlD
XSA9IHsKKwkJLnR5cGUgPSBIREFfRklYVVBfRlVOQywKKwkJLnYuZnVuYyA9IGFsYzI3NF9maXh1
cF9ocF9oZWFkc2V0X21pYywKKwkJLmNoYWluZWQgPSB0cnVlLAorCQkuY2hhaW5faWQgPSBBTEMy
NzRfRklYVVBfSFBfTUlDCisJfSwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3BjaV9x
dWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7CkBAIC03ODE1LDcgKzc4NDQsNiBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHNuZF9wY2lfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewogCVNORF9Q
Q0lfUVVJUksoMHgxMDNjLCAweDg2OWQsICJIUCIsIEFMQzIzNl9GSVhVUF9IUF9NVVRFX0xFRCks
CiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4ODcyOSwgIkhQIiwgQUxDMjg1X0ZJWFVQX0hQX0dQ
SU9fTEVEKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4NzM2LCAiSFAiLCBBTEMyODVfRklY
VVBfSFBfR1BJT19BTVBfSU5JVCksCi0JU05EX1BDSV9RVUlSSygweDEwM2MsIDB4ODc0ZSwgIkhQ
IiwgQUxDMjc0X0ZJWFVQX0hQX01JQyksCiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4ODc2MCwg
IkhQIiwgQUxDMjg1X0ZJWFVQX0hQX01VVEVfTEVEKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywg
MHg4NzdhLCAiSFAiLCBBTEMyODVfRklYVVBfSFBfTVVURV9MRUQpLAogCVNORF9QQ0lfUVVJUkso
MHgxMDNjLCAweDg3N2QsICJIUCIsIEFMQzIzNl9GSVhVUF9IUF9NVVRFX0xFRCksCkBAIC04MzM5
LDYgKzgzNjcsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfaGRhX3Bpbl9xdWlyayBhbGMy
NjlfcGluX2ZpeHVwX3RibFtdID0gewogCQl7MHgxYSwgMHg5MGE3MDEzMH0sCiAJCXsweDFiLCAw
eDkwMTcwMTEwfSwKIAkJezB4MjEsIDB4MDMyMTEwMjB9KSwKKyAgICAgICBTTkRfSERBX1BJTl9R
VUlSSygweDEwZWMwMjc0LCAweDEwM2MsICJIUCIsIEFMQzI3NF9GSVhVUF9IUF9IRUFEU0VUX01J
QywKKwkJezB4MTcsIDB4OTAxNzAxMTB9LAorCQl7MHgxOSwgMHgwM2ExMTAzMH0sCisJCXsweDIx
LCAweDAzMjExMDIwfSksCiAJU05EX0hEQV9QSU5fUVVJUksoMHgxMGVjMDI4MCwgMHgxMDNjLCAi
SFAiLCBBTEMyODBfRklYVVBfSFBfR1BJTzQsCiAJCXsweDEyLCAweDkwYTYwMTMwfSwKIAkJezB4
MTQsIDB4OTAxNzAxMTB9LAo=

--_002_f42ae1ede1cf47029ae2bef1a42caf03realtekcom_--
