Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 376972E7660
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Dec 2020 06:50:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 572CD17FD;
	Wed, 30 Dec 2020 06:39:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 572CD17FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609306841;
	bh=Cf36IZnyRPXOBZzB0pkZxKp7N8v5FA9IbIrm+6eGthE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dKAs1m/RMP5sm13Epq87XAe3Vc/9cguTElXDsfB2HANfZ+ksSixVv+2L4MuG3nq+k
	 EM75EpErv7vOQtJTm8n3BNMtDaEeb3rRxkYzAQoxD9YxWU6pHEhVJ7S2ZE/bijUrkx
	 wz3PB9EUYOivwBXktCMN2QaQ+huS32sFl/zqLW3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5FA1F801ED;
	Wed, 30 Dec 2020 06:39:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65177F801F5; Wed, 30 Dec 2020 06:39:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=HTML_MESSAGE,PRX_APP_ATTACH,
 PRX_BODY_135,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E84FF80162
 for <alsa-devel@alsa-project.org>; Wed, 30 Dec 2020 06:38:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E84FF80162
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0BU5cpwtF003021,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs02.realtek.com.tw[172.21.6.95])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0BU5cpwtF003021
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 30 Dec 2020 13:38:51 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 30 Dec 2020 13:38:51 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 30 Dec 2020 13:38:50 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::5d07:e256:a2a2:81ee]) by
 RTEXMBS01.realtek.com.tw ([fe80::5d07:e256:a2a2:81ee%5]) with mapi id
 15.01.2106.006; Wed, 30 Dec 2020 13:38:50 +0800
From: Pshou <pshou@realtek.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: add two intel reference  SSID in the ALC256
Thread-Topic: add two intel reference  SSID in the ALC256
Thread-Index: AdbebZGk2DCWCejCTTmllvq3byGImw==
Date: Wed, 30 Dec 2020 05:38:50 +0000
Message-ID: <5978d2267f034c28973d117925ec9c63@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.210]
Content-Type: multipart/mixed;
 boundary="_004_5978d2267f034c28973d117925ec9c63realtekcom_"
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>
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

--_004_5978d2267f034c28973d117925ec9c63realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alsa-devel ML:



Can you help me add some source code to patch_realtek.c?



Add two intel reference board SSID in the alc256.



Best regards

Pshou


--_004_5978d2267f034c28973d117925ec9c63realtekcom_
Content-Type: application/octet-stream;
	name="0001-add-some-SSID-in-the-ALC256.patch"
Content-Description: 0001-add-some-SSID-in-the-ALC256.patch
Content-Disposition: attachment;
	filename="0001-add-some-SSID-in-the-ALC256.patch"; size=1240;
	creation-date="Tue, 29 Dec 2020 01:33:35 GMT";
	modification-date="Tue, 29 Dec 2020 01:33:35 GMT"
Content-Transfer-Encoding: base64

RnJvbTogUGVpU2VuIEhvdSA8cHNob3VAcmVhbHRlay5jb20+ClN1YmplY3Q6IEFMU0E6IGhkYS9y
ZWFsdGVrOiBBZGQgdHdvICJJbnRlbCBSZWZlcmVuY2UgYm9hcmQiIFNTSUQgaW4gdGhlIEFMQzI1
Ni4KCkFkZCB0d28gIkludGVsIFJlZmVyZW5jZSBib2FkIiBTU0lEIGluIHRoZSBhbGMyNTYuCkVu
YWJsZSAicG93ZXIgc2F2aW5nIG1vZGUiIGFuZCBFbmFibGUgImhlYWRzZXQgamFjayBtb2RlIi4K
ClNpZ25lZC1vZmYtYnk6IFBlaVNlbiBIb3UgPHBzaG91QHJlYWx0ZWssY29tPgpkaWZmIC0tZ2l0
IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3Jl
YWx0ZWsuYwppbmRleCBmNDljZjBmLi44YTVmMGU5IDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRh
L3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAt
ODAyNiw2ICs4MDI2LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJrIGFsYzI2
OV9maXh1cF90YmxbXSA9IHsKIAlTTkRfUENJX1FVSVJLKDB4MTBjZiwgMHgxODQ1LCAiTGlmZWJv
b2sgVTkwNCIsIEFMQzI2OV9GSVhVUF9MSUZFQk9PS19FWFRNSUMpLAogCVNORF9QQ0lfUVVJUkso
MHgxMGVjLCAweDEwZjIsICJJbnRlbCBSZWZlcmVuY2UgYm9hcmQiLCBBTEM3MDBfRklYVVBfSU5U
RUxfUkVGRVJFTkNFKSwKIAlTTkRfUENJX1FVSVJLKDB4MTBlYywgMHgxMjMwLCAiSW50ZWwgUmVm
ZXJlbmNlIGJvYXJkIiwgQUxDMjk1X0ZJWFVQX0NIUk9NRV9CT09LKSwKKwlTTkRfUENJX1FVSVJL
KDB4MTBlYywgMHgxMjUyLCAiSW50ZWwgUmVmZXJlbmNlIGJvYXJkIiwgQUxDMjk1X0ZJWFVQX0NI
Uk9NRV9CT09LKSwKKwlTTkRfUENJX1FVSVJLKDB4MTBlYywgMHgxMjU0LCAiSW50ZWwgUmVmZXJl
bmNlIGJvYXJkIiwgQUxDMjk1X0ZJWFVQX0NIUk9NRV9CT09LKSwKIAlTTkRfUENJX1FVSVJLKDB4
MTBmNywgMHg4MzM4LCAiUGFuYXNvbmljIENGLVNaNiIsIEFMQzI2OV9GSVhVUF9IRUFEU0VUX01P
REUpLAogCVNORF9QQ0lfUVVJUksoMHgxNDRkLCAweGMxMDksICJTYW1zdW5nIEF0aXYgYm9vayA5
IChOUDkwMFgzRykiLCBBTEMyNjlfRklYVVBfSU5WX0RNSUMpLAogCVNORF9QQ0lfUVVJUksoMHgx
NDRkLCAweGMxNjksICJTYW1zdW5nIE5vdGVib29rIDkgUGVuIChOUDkzMFNCRS1LMDFVUykiLCBB
TEMyOThfRklYVVBfU0FNU1VOR19IRUFEUEhPTkVfVkVSWV9RVUlFVCksCg==

--_004_5978d2267f034c28973d117925ec9c63realtekcom_--
