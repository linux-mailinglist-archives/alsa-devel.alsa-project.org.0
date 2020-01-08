Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A4B133E36
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jan 2020 10:21:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97EBF1724;
	Wed,  8 Jan 2020 10:20:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97EBF1724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578475308;
	bh=nNssamM4gNImzDq4u6Tcrd++40QWH5EyS5Vt2lgwCkM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OKq+4a+Wzx/NP9e71ItaMoae/bdIaoYwCQRk6Tu8gp5N8LFtLamHPea+I7D1lShE/
	 5S1ZdAeS7WDyfd+VAE4VAMOJbpaUKqunAmf8N8o+NFuYxlLJZwSokvZRuYszgT4LEL
	 pKUmrbW8zATeSUcc5GLRI0CD811dKLM3+b+3DNWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD365F801DA;
	Wed,  8 Jan 2020 10:20:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9E89F80159; Wed,  8 Jan 2020 10:20:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=HTML_MESSAGE,PRX_APP_ATTACH,
 PRX_BODY_135,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DE1AF8010B
 for <alsa-devel@alsa-project.org>; Wed,  8 Jan 2020 10:19:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DE1AF8010B
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 0089JsBQ004092,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCAS11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 0089JsBQ004092
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Jan 2020 17:19:54 +0800
Received: from RTEXMB05.realtek.com.tw (172.21.6.98) by
 RTITCAS11.realtek.com.tw (172.21.6.12) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Wed, 8 Jan 2020 17:19:54 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 8 Jan 2020 17:19:53 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::a917:b20f:da75:59e0]) by
 RTEXMB01.realtek.com.tw ([fe80::a917:b20f:da75:59e0%6]) with mapi id
 15.01.1779.005; Wed, 8 Jan 2020 17:19:53 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Thread-Topic: Add quirk for Lenovo X1 Yoga
Thread-Index: AdXGBKMUeHaDCEg8TFmHusFrUFmazg==
Date: Wed, 8 Jan 2020 09:19:53 +0000
Message-ID: <6d3af68aa0fe48848c62943e9a342698@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_004_6d3af68aa0fe48848c62943e9a342698realtekcom_"
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] Add quirk for Lenovo X1 Yoga
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

--_004_6d3af68aa0fe48848c62943e9a342698realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch was for Lenovo X1 Yoga.

BR,
Kailang

--_004_6d3af68aa0fe48848c62943e9a342698realtekcom_
Content-Type: application/octet-stream; name="0000-lenovo-x1-yoga.patch"
Content-Description: 0000-lenovo-x1-yoga.patch
Content-Disposition: attachment; filename="0000-lenovo-x1-yoga.patch";
	size=1282; creation-date="Wed, 08 Jan 2020 09:11:16 GMT";
	modification-date="Wed, 08 Jan 2020 09:14:51 GMT"
Content-Transfer-Encoding: base64

RnJvbSAxYjg2YTk5NjllZmM1OWJmNTUzNWIyMmFlNjMzOTQyYzg3MmY0NzMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFdlZCwgOCBKYW4gMjAyMCAxNjo0Nzo1NiArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gQWRkIHF1aXJrIGZvciB0aGUgYmFzcyBzcGVha2VyIG9uIExlbm92byBZ
b2dhCiBYMSA3dGggZ2VuCgpBZGQgcXVpcmsgdG8gQUxDMjg1X0ZJWFVQX1NQRUFLRVIyX1RPX0RB
QzEuCgpGaXhlczogZDJjZDc5NWM0ZWNlICgiQUxTQTogaGRhIC0gZml4dXAgZm9yIHRoZSBiYXNz
IHNwZWFrZXIgb24gTGVub3ZvIENhcmJvbiBYMSA3dGggZ2VuIikKU2lnbmVkLW9mZi1ieTogS2Fp
bGFuZyBZYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgoKZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9o
ZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5kZXgg
NzM0MDdiMjVhNzc3Li5hMDA4ZDg1YTRlYTkgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0
Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC03MjY3
LDYgKzcyNjcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9wY2lfcXVpcmsgYWxjMjY5X2Zp
eHVwX3RibFtdID0gewogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDIyNGMsICJUaGlua3BhZCIs
IEFMQzI5OF9GSVhVUF9UUFQ0NzBfRE9DSyksCiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MjI0
ZCwgIlRoaW5rcGFkIiwgQUxDMjk4X0ZJWFVQX1RQVDQ3MF9ET0NLKSwKIAlTTkRfUENJX1FVSVJL
KDB4MTdhYSwgMHgyMjVkLCAiVGhpbmtwYWQgVDQ4MCIsIEFMQzI2OV9GSVhVUF9MSU1JVF9JTlRf
TUlDX0JPT1NUKSwKKwlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgyMjkyLCAiVGhpbmtwYWQgWDEg
WW9nYSA3dGgiLCBBTEMyODVfRklYVVBfU1BFQUtFUjJfVE9fREFDMSksCiAJU05EX1BDSV9RVUlS
SygweDE3YWEsIDB4MjI5MywgIlRoaW5rcGFkIFgxIENhcmJvbiA3dGgiLCBBTEMyODVfRklYVVBf
U1BFQUtFUjJfVE9fREFDMSksCiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzBiYiwgIlRoaW5r
Q2VudHJlIEFJTyIsIEFMQzIzM19GSVhVUF9MRU5PVk9fTElORTJfTUlDX0hPVEtFWSksCiAJU05E
X1BDSV9RVUlSSygweDE3YWEsIDB4MzBlMiwgIlRoaW5rQ2VudHJlIEFJTyIsIEFMQzIzM19GSVhV
UF9MRU5PVk9fTElORTJfTUlDX0hPVEtFWSksCg==

--_004_6d3af68aa0fe48848c62943e9a342698realtekcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_004_6d3af68aa0fe48848c62943e9a342698realtekcom_--
