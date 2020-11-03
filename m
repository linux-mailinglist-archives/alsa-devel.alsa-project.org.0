Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E74022A3E27
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:57:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87E65177B;
	Tue,  3 Nov 2020 08:56:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87E65177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604390235;
	bh=dvts5n+A0MO2w7ZGDf7axHLbB5GGg/qSUIThTigZtIE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GncuERKhJ78hg8oY5OAWt2K62kRJL/iiJRnDSJkDh3g9nT8MDbqTA6hyO6ZOovrfj
	 vg47egFVIwbYEg/wiA1FmV4SMHQB0tDMdtF1VsNEjJuE8BJkxaqfQV8Hkj7OTpzQlO
	 hxp/nVgMCBCFAOnquXcpwuSgvg8uJs289FmiAptI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C14A2F8028D;
	Tue,  3 Nov 2020 08:49:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4721BF8015A; Tue,  3 Nov 2020 08:49:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50802F80108
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 08:49:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50802F80108
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0A37ncqK7018045,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb05.realtek.com.tw[172.21.6.98])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0A37ncqK7018045
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 3 Nov 2020 15:49:38 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMB05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Tue, 3 Nov 2020 15:49:38 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2]) by
 RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2%8]) with mapi id
 15.01.2106.003; Tue, 3 Nov 2020 15:49:38 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: ASUS TM420 headphone enable
Thread-Topic: ASUS TM420 headphone enable
Thread-Index: AdaxtaxRO3Y6pYlvT6+6jYCrnkWx/A==
Date: Tue, 3 Nov 2020 07:49:38 +0000
Message-ID: <3d6177d7023b4783bf2793861c577ada@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.96]
Content-Type: multipart/mixed;
 boundary="_002_3d6177d7023b4783bf2793861c577adarealtekcom_"
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

--_002_3d6177d7023b4783bf2793861c577adarealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

ASUS TM420 need to use COEF bit to turn on HP.
Attach was enable patch.

BR,
Kailang

--_002_3d6177d7023b4783bf2793861c577adarealtekcom_
Content-Type: application/octet-stream; name="0001-asus-enable-hp.patch"
Content-Description: 0001-asus-enable-hp.patch
Content-Disposition: attachment; filename="0001-asus-enable-hp.patch";
	size=1648; creation-date="Tue, 03 Nov 2020 07:41:49 GMT";
	modification-date="Tue, 03 Nov 2020 07:47:13 GMT"
Content-Transfer-Encoding: base64

RnJvbSAwNTQwN2JlNzMxODc3N2FiOGQ3NzgyZDA2NTY0MzIwNDkyMGJlYWUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBrYWlsYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpEYXRlOiBU
dWUsIDMgTm92IDIwMjAgMTU6NDA6MzUgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNBOiBoZGEv
cmVhbHRlayAtIEVuYWJsZSBoZWFkcGhvbmUgZm9yIEFTVVMgVE00MjAKCkFTVVMgVE00MjAgaGFk
IGRlcG9wIGNpcmN1aXQgZm9yIGhlYWRwaG9uZS4KSXQgbmVlZCB0byB0dXJuIG9uIGJ5IENPRUYg
Yml0LgoKU2lnbmVkLW9mZi1ieTogS2FpbGFuZyBZYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgoK
ZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hk
YS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggNGYwZWE4MDEzYmY2Li43ODE2NjEwYmY2OTkgMTAwNjQ0
Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEv
cGF0Y2hfcmVhbHRlay5jCkBAIC03NjkzLDYgKzc2OTMsMTcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBoZGFfZml4dXAgYWxjMjY5X2ZpeHVwc1tdID0gewogCQkuY2hhaW5lZCA9IHRydWUsCiAJCS5j
aGFpbl9pZCA9IEFMQzI3NF9GSVhVUF9IUF9NSUMKIAl9LAorCVtBTEMyNTZfRklYVVBfQVNVU19I
UEVdID0geworCQkudHlwZSA9IEhEQV9GSVhVUF9WRVJCUywKKwkJLnYudmVyYnMgPSAoY29uc3Qg
c3RydWN0IGhkYV92ZXJiW10pIHsKKwkJCS8qIFNldCBFQVBEIGhpZ2ggKi8KKwkJCXsgMHgyMCwg
QUNfVkVSQl9TRVRfQ09FRl9JTkRFWCwgMHgwZiB9LAorCQkJeyAweDIwLCBBQ19WRVJCX1NFVF9Q
Uk9DX0NPRUYsIDB4Nzc3OCB9LAorCQkJeyB9CisJCX0sCisJCS5jaGFpbmVkID0gdHJ1ZSwKKwkJ
LmNoYWluX2lkID0gQUxDMjk0X0ZJWFVQX0FTVVNfSEVBRFNFVF9NSUMKKwl9LAogfTsKIAogc3Rh
dGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJrIGFsYzI2OV9maXh1cF90YmxbXSA9IHsKQEAg
LTc4NzYsNiArNzg4Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMy
NjlfZml4dXBfdGJsW10gPSB7CiAJU05EX1BDSV9RVUlSSygweDEwNDMsIDB4MWJiZCwgIkFTVVMg
WjU1ME1BIiwgQUxDMjU1X0ZJWFVQX0FTVVNfTUlDX05PX1BSRVNFTkNFKSwKIAlTTkRfUENJX1FV
SVJLKDB4MTA0MywgMHgxYzIzLCAiQXN1cyBYNTVVIiwgQUxDMjY5X0ZJWFVQX0xJTUlUX0lOVF9N
SUNfQk9PU1QpLAogCVNORF9QQ0lfUVVJUksoMHgxMDQzLCAweDFjY2QsICJBU1VTIFg1NTVVQiIs
IEFMQzI1Nl9GSVhVUF9BU1VTX01JQyksCisJU05EX1BDSV9RVUlSSygweDEwNDMsIDB4MWQ0ZSwg
IkFTVVMgVE00MjAiLCBBTEMyNTZfRklYVVBfQVNVU19IUEUpLAogCVNORF9QQ0lfUVVJUksoMHgx
MDQzLCAweDFlMTEsICJBU1VTIFplcGh5cnVzIEcxNSIsIEFMQzI4OV9GSVhVUF9BU1VTX0dBNTAy
KSwKIAlTTkRfUENJX1FVSVJLKDB4MTA0MywgMHgxZjExLCAiQVNVUyBaZXBoeXJ1cyBHMTQiLCBB
TEMyODlfRklYVVBfQVNVU19HQTQwMSksCiAJU05EX1BDSV9RVUlSSygweDEwNDMsIDB4MTg4MSwg
IkFTVVMgWmVwaHlydXMgUy9NIiwgQUxDMjk0X0ZJWFVQX0FTVVNfR1g1MDJfUElOUyksCg==

--_002_3d6177d7023b4783bf2793861c577adarealtekcom_--
