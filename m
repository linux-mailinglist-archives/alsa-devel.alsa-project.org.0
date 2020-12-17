Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D652DCE05
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 10:01:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BD0117FD;
	Thu, 17 Dec 2020 10:00:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BD0117FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608195660;
	bh=/kuUQXKulF5einW+tNJhB1P/USqBYhiKKa75LR0kxGE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=efVlBS+rz3q/irtwD43QEu0RAvAzvZnL6vyxMO6anpMczLlKLfSKOaLP6xwnsOKoo
	 c5ewF7eaKwJnzgqcPd8NnckWqjFCgh6Dgi1ESFR3hruWlpzcI49al9CdOMD2y7NLbv
	 gsU6o7Ldnm0tGqVzwLFqLE7Yhb61Qh/s07ME5rK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3C00F80278;
	Thu, 17 Dec 2020 09:59:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1FC1F80260; Thu, 17 Dec 2020 09:59:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_NONE autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AF9AF80148
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 09:59:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AF9AF80148
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0BH8xGVw9011673,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb05.realtek.com.tw[172.21.6.98])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0BH8xGVw9011673
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Dec 2020 16:59:17 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMB05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Thu, 17 Dec 2020 16:59:16 +0800
Received: from RTEXDAG01.realtek.com.tw ([fe80::59c5:2160:6be0:8c50]) by
 RTEXDAG01.realtek.com.tw ([fe80::59c5:2160:6be0:8c50%6]) with mapi id
 15.01.2106.006; Thu, 17 Dec 2020 16:59:16 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: Dell fixed type headset platform
Thread-Topic: Dell fixed type headset platform
Thread-Index: AdbUUUjR8u+jzg0qRxWBWc/p2qyC7Q==
Date: Thu, 17 Dec 2020 08:59:16 +0000
Message-ID: <b97e971978034bc9b772a08ec91265e8@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.96]
Content-Type: multipart/mixed;
 boundary="_002_b97e971978034bc9b772a08ec91265e8realtekcom_"
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

--_002_b97e971978034bc9b772a08ec91265e8realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Dell has fixed type headset platform for desktop.
Attach patch was add pin verb. BIOS verb table was setting for fixed type c=
oef.

Many Thanks.

BR,
Kailang

--_002_b97e971978034bc9b772a08ec91265e8realtekcom_
Content-Type: application/octet-stream;
	name="0001-dell-fixed-type-headset.patch"
Content-Description: 0001-dell-fixed-type-headset.patch
Content-Disposition: attachment;
	filename="0001-dell-fixed-type-headset.patch"; size=1175;
	creation-date="Thu, 17 Dec 2020 08:54:46 GMT";
	modification-date="Thu, 17 Dec 2020 08:58:14 GMT"
Content-Transfer-Encoding: base64

RnJvbSBjZDI0ZGZkOWMzMGU2ZWU4OTNjYTkzNmZhYzYwNDE5YTVhZjhhNzZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBrYWlsYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpEYXRlOiBU
aHUsIDE3IERlYyAyMDIwIDE2OjUyOjQ0ICswODAwClN1YmplY3Q6IFtQQVRDSF0gQUxTQTogaGRh
L3JlYWx0ZWsgLSBTdXBwb3J0ZWQgRGVsbCBmaXhlZCB0eXBlIGhlYWRzZXQKClRoaXMgcGxhdGZv
cm0gb25seSBzdXBwb3J0ZWQgaXBob25lIHR5cGUgaGVhZHNldC4KSXQgY2FuJ3Qgc3VwcG9ydCBE
ZWxsIGhlYWRzZXQgbW9kZS4KClNpZ25lZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0By
ZWFsdGVrLmNvbT4KZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIv
c291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggODYxNmM1NjI0ODcwLi41Njg1MDVl
NDQ5ZWYgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3Nv
dW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC03ODY4LDYgKzc4NjgsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHNuZF9wY2lfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewogCVNORF9Q
Q0lfUVVJUksoMHgxMDI4LCAweDA5YmYsICJEZWxsIFByZWNpc2lvbiIsIEFMQzIzM19GSVhVUF9B
U1VTX01JQ19OT19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDEwMjgsIDB4MGEyZSwgIkRl
bGwiLCBBTEMyMzZfRklYVVBfREVMTF9BSU9fSEVBRFNFVF9NSUMpLAogCVNORF9QQ0lfUVVJUkso
MHgxMDI4LCAweDBhMzAsICJEZWxsIiwgQUxDMjM2X0ZJWFVQX0RFTExfQUlPX0hFQURTRVRfTUlD
KSwKKwlTTkRfUENJX1FVSVJLKDB4MTAyOCwgMHgwYTU4LCAiRGVsbCBQcmVjaXNpb24gMzY1MCBU
b3dlciIsIEFMQzI1NV9GSVhVUF9ERUxMX0hFQURTRVRfTUlDKSwKIAlTTkRfUENJX1FVSVJLKDB4
MTAyOCwgMHgxNjRhLCAiRGVsbCIsIEFMQzI5M19GSVhVUF9ERUxMMV9NSUNfTk9fUFJFU0VOQ0Up
LAogCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDE2NGIsICJEZWxsIiwgQUxDMjkzX0ZJWFVQX0RF
TEwxX01JQ19OT19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4MTU4NiwgIkhQ
IiwgQUxDMjY5X0ZJWFVQX0hQX01VVEVfTEVEX01JQzIpLAo=

--_002_b97e971978034bc9b772a08ec91265e8realtekcom_--
