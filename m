Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CA3DE60C
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 10:15:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 295B61660;
	Mon, 21 Oct 2019 10:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 295B61660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571645703;
	bh=k/eM7xhOTOE9tv0E/knpjPWHjThttCuZeQWn3ZHqLxE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l5Kw6lkwBvhlj6aRcPcpop2pW7Dw+liFC1+DHICGJWfscQ3x591azmxhlyzrqr/Tt
	 BIgjWXPsbnD24mRWALbk9iV6dsxHQFi6d0Nvq4PWT1m4EE8pP8tuGA8c/qNxi847Dx
	 6bxxZ/zkKVWR4OO4nsFwpj6H+4Yu2BDv+HP0rRsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61F4CF801EB;
	Mon, 21 Oct 2019 10:13:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5A47F80368; Mon, 21 Oct 2019 10:13:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=HTML_MESSAGE,PRX_APP_ATTACH,
 PRX_BODY_135,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF0F2F801EB
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 10:13:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF0F2F801EB
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x9L8D2Mu018404,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x9L8D2Mu018404
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 21 Oct 2019 16:13:02 +0800
Received: from RTEXMB02.realtek.com.tw (172.21.6.95) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Mon, 21 Oct 2019 16:13:02 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 21 Oct 2019 16:13:01 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::6d88:58e2:6d4b:ff7c]) by
 RTEXMB01.realtek.com.tw ([fe80::6d88:58e2:6d4b:ff7c%13]) with mapi id
 15.01.1779.005; Mon, 21 Oct 2019 16:13:01 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Thread-Topic: ALC711 support
Thread-Index: AdWH5zU7BPXvl5ptS7iMy/fZ7B+Ivg==
Date: Mon, 21 Oct 2019 08:13:01 +0000
Message-ID: <3d3447fed8364551bae632d4cfede619@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_004_3d3447fed8364551bae632d4cfede619realtekcom_"
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] ALC711 support
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

--_004_3d3447fed8364551bae632d4cfede619realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch was support ALC711 HDA mode.

BR,
Kailang

--_004_3d3447fed8364551bae632d4cfede619realtekcom_
Content-Type: application/octet-stream; name="0000-alc711-supported.patch"
Content-Description: 0000-alc711-supported.patch
Content-Disposition: attachment; filename="0000-alc711-supported.patch";
	size=1527; creation-date="Thu, 02 May 2019 08:06:59 GMT";
	modification-date="Thu, 02 May 2019 08:06:29 GMT"
Content-Transfer-Encoding: base64

RnJvbSBiMmViYzQ5ZGIwYmU2ZjUyYmZhZGIwMTc4NDQxZGM4NjRhYWRlZmFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMiBNYXkgMjAxOSAxNjowMzoyNiArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gQWRkIHN1cHBvcnQgZm9yIEFMQzcxMQoKU3VwcG9ydCBuZXcgY29kZWMg
QUxDNzExLgoKU2lnbmVkLW9mZi1ieTogS2FpbGFuZyBZYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29t
PgoKZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNp
L2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggMWQwZTBmMmU2NTI2Li5kNDcwODhiOTRmMGYgMTAw
NjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9o
ZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC00MDUsNiArNDA1LDcgQEAgc3RhdGljIHZvaWQgYWxjX2Zp
bGxfZWFwZF9jb2VmKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCWNhc2UgMHgxMGVjMDcwMDoK
IAljYXNlIDB4MTBlYzA3MDE6CiAJY2FzZSAweDEwZWMwNzAzOgorCWNhc2UgMHgxMGVjMDcxMToK
IAkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgxMCwgMTw8MTUsIDApOwogCQlicmVhazsK
IAljYXNlIDB4MTBlYzA2NjI6CkBAIC03NzQ2LDYgKzc3NDcsNyBAQCBzdGF0aWMgaW50IHBhdGNo
X2FsYzI2OShzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAljYXNlIDB4MTBlYzA3MDA6CiAJY2Fz
ZSAweDEwZWMwNzAxOgogCWNhc2UgMHgxMGVjMDcwMzoKKwljYXNlIDB4MTBlYzA3MTE6CiAJCXNw
ZWMtPmNvZGVjX3ZhcmlhbnQgPSBBTEMyNjlfVFlQRV9BTEM3MDA7CiAJCXNwZWMtPmdlbi5taXhl
cl9uaWQgPSAwOyAvKiBBTEM3MDAgZG9lcyBub3QgaGF2ZSBhbnkgbG9vcGJhY2sgbWl4ZXIgcGF0
aCAqLwogCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDRhLCAxIDw8IDE1LCAwKTsgLyog
Q29tYm8gamFjayBhdXRvIHRyaWdnZXIgY29udHJvbCAqLwpAQCAtODg3Miw2ICs4ODc0LDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfZGV2aWNlX2lkIHNuZF9oZGFfaWRfcmVhbHRla1tdID0g
ewogCUhEQV9DT0RFQ19FTlRSWSgweDEwZWMwNzAwLCAiQUxDNzAwIiwgcGF0Y2hfYWxjMjY5KSwK
IAlIREFfQ09ERUNfRU5UUlkoMHgxMGVjMDcwMSwgIkFMQzcwMSIsIHBhdGNoX2FsYzI2OSksCiAJ
SERBX0NPREVDX0VOVFJZKDB4MTBlYzA3MDMsICJBTEM3MDMiLCBwYXRjaF9hbGMyNjkpLAorCUhE
QV9DT0RFQ19FTlRSWSgweDEwZWMwNzExLCAiQUxDNzExIiwgcGF0Y2hfYWxjMjY5KSwKIAlIREFf
Q09ERUNfRU5UUlkoMHgxMGVjMDg2NywgIkFMQzg5MSIsIHBhdGNoX2FsYzY2MiksCiAJSERBX0NP
REVDX0VOVFJZKDB4MTBlYzA4ODAsICJBTEM4ODAiLCBwYXRjaF9hbGM4ODApLAogCUhEQV9DT0RF
Q19FTlRSWSgweDEwZWMwODgyLCAiQUxDODgyIiwgcGF0Y2hfYWxjODgyKSwK

--_004_3d3447fed8364551bae632d4cfede619realtekcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_004_3d3447fed8364551bae632d4cfede619realtekcom_--
