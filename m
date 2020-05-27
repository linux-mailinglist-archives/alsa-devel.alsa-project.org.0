Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 966431E38E3
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 08:16:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D3E41793;
	Wed, 27 May 2020 08:15:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D3E41793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590560189;
	bh=1jR1lUavmshaUpqO5BWtfKkAusqCO86KIw1IDGg4/ZE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I3Y3XDguqCXt620oqcXEOGDuVhxsVXmJ0vghs8DlFzt8o/fkaAySVHva0eUGQ4XqL
	 S2Z/wkg0Gyj6KLxfGlYXal5PnSsIzq9L+ncfX7tufiAYbAuyIk+HY3UNiPf+61rQLt
	 1u5fvFIRCy/jeJeLvPLiz3rqwBIkOeq4VrotqGqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ADCAF8016F;
	Wed, 27 May 2020 08:14:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AA13F8014E; Wed, 27 May 2020 08:14:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E315AF800CD
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 08:14:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E315AF800CD
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 04R6EQKa8011736,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 04R6EQKa8011736
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 27 May 2020 14:14:26 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 27 May 2020 14:14:26 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 27 May 2020 14:14:25 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8]) by
 RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8%5]) with mapi id
 15.01.1779.005; Wed, 27 May 2020 14:14:25 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: Add new codec supported for ALC287
Thread-Topic: Add new codec supported for ALC287
Thread-Index: AdYz7eNW4hWjl1VTTs6oU2zsmIJstw==
Date: Wed, 27 May 2020 06:14:25 +0000
Message-ID: <dcf5ce5507104d0589a917cbb71dc3c6@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.171]
Content-Type: multipart/mixed;
 boundary="_002_dcf5ce5507104d0589a917cbb71dc3c6realtekcom_"
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

--_002_dcf5ce5507104d0589a917cbb71dc3c6realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch was new codec supported.
Many Thanks.

BR,
Kailang

--_002_dcf5ce5507104d0589a917cbb71dc3c6realtekcom_
Content-Type: application/octet-stream; name="0000-alc287-supported.patch"
Content-Description: 0000-alc287-supported.patch
Content-Disposition: attachment; filename="0000-alc287-supported.patch";
	size=1420; creation-date="Wed, 27 May 2020 06:12:28 GMT";
	modification-date="Wed, 27 May 2020 06:11:57 GMT"
Content-Transfer-Encoding: base64

RnJvbSA4NGNjNjZiMTA3YjhlZjZiNmZkYTIwMWM4YzEzNDQyZDA0ZjU1NmIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFdlZCwgMjcgTWF5IDIwMjAgMTQ6MTA6MjYgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFkZCBuZXcgY29kZWMgc3VwcG9ydGVkIGZvciBBTEMyODcKCkVuYWJs
ZSBuZXcgY29kZWMgc3VwcG9ydGVkIGZvciBBTEMyODcuCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5n
IFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9w
YXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCBlYjQy
NWE0ZmJlNGIuLjBhYTc3OGZmN2YyYiAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9y
ZWFsdGVrLmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTM4Niw2ICsz
ODYsNyBAQCBzdGF0aWMgdm9pZCBhbGNfZmlsbF9lYXBkX2NvZWYoc3RydWN0IGhkYV9jb2RlYyAq
Y29kZWMpCiAJY2FzZSAweDEwZWMwMjgyOgogCWNhc2UgMHgxMGVjMDI4MzoKIAljYXNlIDB4MTBl
YzAyODY6CisJY2FzZSAweDEwZWMwMjg3OgogCWNhc2UgMHgxMGVjMDI4ODoKIAljYXNlIDB4MTBl
YzAyODU6CiAJY2FzZSAweDEwZWMwMjk4OgpAQCAtODMyOSw2ICs4MzMwLDcgQEAgc3RhdGljIGlu
dCBwYXRjaF9hbGMyNjkoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJY2FzZSAweDEwZWMwMjE1
OgogCWNhc2UgMHgxMGVjMDI0NToKIAljYXNlIDB4MTBlYzAyODU6CisJY2FzZSAweDEwZWMwMjg3
OgogCWNhc2UgMHgxMGVjMDI4OToKIAkJc3BlYy0+Y29kZWNfdmFyaWFudCA9IEFMQzI2OV9UWVBF
X0FMQzIxNTsKIAkJc3BlYy0+c2h1dHVwID0gYWxjMjI1X3NodXR1cDsKQEAgLTk2MDcsNiArOTYw
OSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX2RldmljZV9pZCBzbmRfaGRhX2lkX3JlYWx0
ZWtbXSA9IHsKIAlIREFfQ09ERUNfRU5UUlkoMHgxMGVjMDI4NCwgIkFMQzI4NCIsIHBhdGNoX2Fs
YzI2OSksCiAJSERBX0NPREVDX0VOVFJZKDB4MTBlYzAyODUsICJBTEMyODUiLCBwYXRjaF9hbGMy
NjkpLAogCUhEQV9DT0RFQ19FTlRSWSgweDEwZWMwMjg2LCAiQUxDMjg2IiwgcGF0Y2hfYWxjMjY5
KSwKKwlIREFfQ09ERUNfRU5UUlkoMHgxMGVjMDI4NywgIkFMQzI4NyIsIHBhdGNoX2FsYzI2OSks
CiAJSERBX0NPREVDX0VOVFJZKDB4MTBlYzAyODgsICJBTEMyODgiLCBwYXRjaF9hbGMyNjkpLAog
CUhEQV9DT0RFQ19FTlRSWSgweDEwZWMwMjg5LCAiQUxDMjg5IiwgcGF0Y2hfYWxjMjY5KSwKIAlI
REFfQ09ERUNfRU5UUlkoMHgxMGVjMDI5MCwgIkFMQzI5MCIsIHBhdGNoX2FsYzI2OSksCg==

--_002_dcf5ce5507104d0589a917cbb71dc3c6realtekcom_--
