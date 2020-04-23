Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 864EB1B550B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 09:01:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2302116D6;
	Thu, 23 Apr 2020 09:00:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2302116D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587625299;
	bh=Fsh9JnxtOxnrXlk+fduGwq9rdFy8LhDD399f0QicJ9A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fGVN8I1B52i4A2eC+fD+XXO9vPycaA662e9Xmnw1TMJQT5FeD0LRt/WcisQK3WZN5
	 COgOFE2jeZIDGzgcgGZ3Z9UyTzc6vdebZ/0Rj3K99oDGW/f/RCtiIngLWzdK7IEDh8
	 KDgtJeuAmjZaBJnKzF/zohtrqq98nwCgY+t2vHXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 566ECF801ED;
	Thu, 23 Apr 2020 08:59:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28BF1F801F5; Thu, 23 Apr 2020 08:59:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BF71F800F2
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 08:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BF71F800F2
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 03N6xSBp9016119,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 03N6xSBp9016119
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Apr 2020 14:59:28 +0800
Received: from RTEXMB05.realtek.com.tw (172.21.6.98) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 23 Apr 2020 14:59:27 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 23 Apr 2020 14:59:27 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8]) by
 RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8%5]) with mapi id
 15.01.1779.005; Thu, 23 Apr 2020 14:59:27 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: New codec ALC245
Thread-Topic: New codec ALC245
Thread-Index: AdYZPHTB/BjuOQ8oQz6lAyTQ0NZ+rw==
Date: Thu, 23 Apr 2020 06:59:27 +0000
Message-ID: <8c0804738b2c42439f59c39c8437817f@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.171]
Content-Type: multipart/mixed;
 boundary="_002_8c0804738b2c42439f59c39c8437817frealtekcom_"
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

--_002_8c0804738b2c42439f59c39c8437817frealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,
=09
Attach was ALC245 supported patch.
Many Thanks.

BR,
Kailang

--_002_8c0804738b2c42439f59c39c8437817frealtekcom_
Content-Type: application/octet-stream; name="0000-alc245-supported.patch"
Content-Description: 0000-alc245-supported.patch
Content-Disposition: attachment; filename="0000-alc245-supported.patch";
	size=1406; creation-date="Thu, 23 Apr 2020 06:22:46 GMT";
	modification-date="Thu, 23 Apr 2020 06:22:00 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkYmZkZWYxZjhmY2RlNzRjYmQ5MWRmMzU4ZmIzZmM4ZjVkNWQ2YTUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMjMgQXByIDIwMjAgMTQ6MTg6MzEgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFkZCBuZXcgY29kZWMgc3VwcG9ydGVkIGZvciBBTEMyNDUKCkVuYWJs
ZSBuZXcgY29kZWMgc3VwcG9ydGVkIGZvciBBTEMyNDUuCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5n
IFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9w
YXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCA1NGUx
YzljMGEzM2YuLmMxYTg1YzhmN2I2OSAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9y
ZWFsdGVrLmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTM3Nyw2ICsz
NzcsNyBAQCBzdGF0aWMgdm9pZCBhbGNfZmlsbF9lYXBkX2NvZWYoc3RydWN0IGhkYV9jb2RlYyAq
Y29kZWMpCiAJY2FzZSAweDEwZWMwMjMzOgogCWNhc2UgMHgxMGVjMDIzNToKIAljYXNlIDB4MTBl
YzAyMzY6CisJY2FzZSAweDEwZWMwMjQ1OgogCWNhc2UgMHgxMGVjMDI1NToKIAljYXNlIDB4MTBl
YzAyNTY6CiAJY2FzZSAweDEwZWMwMjU3OgpAQCAtODE5OCw2ICs4MTk5LDcgQEAgc3RhdGljIGlu
dCBwYXRjaF9hbGMyNjkoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJCXNwZWMtPmdlbi5taXhl
cl9uaWQgPSAwOwogCQlicmVhazsKIAljYXNlIDB4MTBlYzAyMTU6CisJY2FzZSAweDEwZWMwMjQ1
OgogCWNhc2UgMHgxMGVjMDI4NToKIAljYXNlIDB4MTBlYzAyODk6CiAJCXNwZWMtPmNvZGVjX3Zh
cmlhbnQgPSBBTEMyNjlfVFlQRV9BTEMyMTU7CkBAIC05NDU5LDYgKzk0NjEsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGhkYV9kZXZpY2VfaWQgc25kX2hkYV9pZF9yZWFsdGVrW10gPSB7CiAJSERB
X0NPREVDX0VOVFJZKDB4MTBlYzAyMzQsICJBTEMyMzQiLCBwYXRjaF9hbGMyNjkpLAogCUhEQV9D
T0RFQ19FTlRSWSgweDEwZWMwMjM1LCAiQUxDMjMzIiwgcGF0Y2hfYWxjMjY5KSwKIAlIREFfQ09E
RUNfRU5UUlkoMHgxMGVjMDIzNiwgIkFMQzIzNiIsIHBhdGNoX2FsYzI2OSksCisJSERBX0NPREVD
X0VOVFJZKDB4MTBlYzAyNDUsICJBTEMyNDUiLCBwYXRjaF9hbGMyNjkpLAogCUhEQV9DT0RFQ19F
TlRSWSgweDEwZWMwMjU1LCAiQUxDMjU1IiwgcGF0Y2hfYWxjMjY5KSwKIAlIREFfQ09ERUNfRU5U
UlkoMHgxMGVjMDI1NiwgIkFMQzI1NiIsIHBhdGNoX2FsYzI2OSksCiAJSERBX0NPREVDX0VOVFJZ
KDB4MTBlYzAyNTcsICJBTEMyNTciLCBwYXRjaF9hbGMyNjkpLAo=

--_002_8c0804738b2c42439f59c39c8437817frealtekcom_--
