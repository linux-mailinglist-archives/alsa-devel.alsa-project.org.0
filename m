Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F942125A84
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 06:23:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F41C886;
	Thu, 19 Dec 2019 06:22:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F41C886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576733009;
	bh=78NfHWIEaS1d1l5pL317vSC5DXcyCsgSTw+cF39Bha8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Nn9+aBjRauOuJ7OBfx3DfbuGGIv8r1rcaQMPLvF96/OM5eECIP5v/86f61Ay7Cf9/
	 pylQ/mRilfhXkSj8q0HQrZiIOJYaL52ywK5RaVEfVcNwGRdD0249ouuLtgjtw6jPAj
	 kpyZtVwvdfLNhYWaIgWkfPuaAxVNN3tJRvewdNCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6515F80218;
	Thu, 19 Dec 2019 06:21:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6D25F80234; Thu, 19 Dec 2019 06:21:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51C1FF8013E
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 06:20:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51C1FF8013E
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID xBJ5KlqI020421,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id xBJ5KlqI020421
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 19 Dec 2019 13:20:47 +0800
Received: from RTEXMB03.realtek.com.tw (172.21.6.96) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Thu, 19 Dec 2019 13:20:47 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 19 Dec 2019 13:20:47 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::a917:b20f:da75:59e0]) by
 RTEXMB01.realtek.com.tw ([fe80::a917:b20f:da75:59e0%6]) with mapi id
 15.01.1779.005; Thu, 19 Dec 2019 13:20:47 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Thread-Topic: Add headset Mic no shutup for ALC283
Thread-Index: AdW2K/3o1bhRI19tSgevrpsPKZq2Lw==
Date: Thu, 19 Dec 2019 05:20:46 +0000
Message-ID: <2692449396954c6c968f5b75e2660358@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_002_2692449396954c6c968f5b75e2660358realtekcom_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] Add headset Mic no shutup for ALC283
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

--_002_2692449396954c6c968f5b75e2660358realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

ChromeBox machine had humming noise from external skeaker plugin at
codec D3 state.

BR,
Kailang

--_002_2692449396954c6c968f5b75e2660358realtekcom_
Content-Type: application/octet-stream; name="0000-alc283-spk-noise.patch"
Content-Description: 0000-alc283-spk-noise.patch
Content-Disposition: attachment; filename="0000-alc283-spk-noise.patch";
	size=769; creation-date="Mon, 09 Dec 2019 08:02:46 GMT";
	modification-date="Thu, 19 Dec 2019 05:18:12 GMT"
Content-Transfer-Encoding: base64

RnJvbSAxNzc3OGI5YTViNGFiNDQ0MzgyYWVkYjBkNDQ0MGE0ODdkMDMwNDQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IE1vbiwgOSBEZWMgMjAxOSAxNTo1NjoxNSArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gQWRkIGhlYWRzZXQgTWljIG5vIHNodXR1cCBmb3IgQUxDMjgzCgpDaHJv
bWUgbWFjaGluZSBoYWQgaHVtbWluZyBub2lzZSBmcm9tIGV4dGVybmFsIHNrZWFrZXIgcGx1Z2lu
IGF0CmNvZGVjIEQzIHN0YXRlLgoKU2lnbmVkLW9mZi1ieTogS2FpbGFuZyBZYW5nIDxrYWlsYW5n
QHJlYWx0ZWsuY29tPgoKZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5j
IGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggNmQ2ZTM0YjNiM2FhLi4zOTBi
ZjQ1ZTkxN2MgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBi
L3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC01MDEsNiArNTAxLDcgQEAgc3RhdGlj
IHZvaWQgYWxjX3NodXR1cF9waW5zKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCXN0cnVjdCBh
bGNfc3BlYyAqc3BlYyA9IGNvZGVjLT5zcGVjOwogCiAJc3dpdGNoIChjb2RlYy0+Y29yZS52ZW5k
b3JfaWQpIHsKKwljYXNlIDB4MTBlYzAyODM6CiAJY2FzZSAweDEwZWMwMjg2OgogCWNhc2UgMHgx
MGVjMDI4ODoKIAljYXNlIDB4MTBlYzAyOTg6Cg==

--_002_2692449396954c6c968f5b75e2660358realtekcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_2692449396954c6c968f5b75e2660358realtekcom_--
