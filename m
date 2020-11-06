Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AEC2A90CA
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 08:55:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0025D1661;
	Fri,  6 Nov 2020 08:54:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0025D1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604649349;
	bh=qkbzCK4yJLEkrFLHOEk4nm/Weg83Cdp+000HrZPSVXo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S3JQatF/yaRavV6VAX8skdBIR8wbp6zU1J5m9vQuHpYsXeIXJdGYL6tQAm+wr3ClC
	 OeRa0JWJDcGIdNuw/PCTmgjDuh4vQUtzgANWKWfN9e6DhFk3Djbd/5IyQ8zboUPeh0
	 kzHHhNB01Hcgz5t+ciJVUHzFtjp5/lUXUtJ5YuOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91857F80234;
	Fri,  6 Nov 2020 08:54:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 181A7F80234; Fri,  6 Nov 2020 08:54:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60E1DF80150
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 08:54:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60E1DF80150
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0A67rtibF020101,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb04.realtek.com.tw[172.21.6.97])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0A67rtibF020101
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 6 Nov 2020 15:53:55 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.34) by
 RTEXMB04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Fri, 6 Nov 2020 15:53:55 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMBS03.realtek.com.tw (172.21.6.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 6 Nov 2020 15:53:55 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2]) by
 RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2%8]) with mapi id
 15.01.2106.003; Fri, 6 Nov 2020 15:53:55 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: ThinkPad support headset button
Thread-Topic: ThinkPad support headset button
Thread-Index: Ada0EaqeWy69e6ukQlaC0ksDVZSiUw==
Date: Fri, 6 Nov 2020 07:53:55 +0000
Message-ID: <f39b11d00340408ca2ed2df9b4fc2a09@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.96]
Content-Type: multipart/mixed;
 boundary="_002_f39b11d00340408ca2ed2df9b4fc2a09realtekcom_"
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

--_002_f39b11d00340408ca2ed2df9b4fc2a09realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Two ThinkPad want to support headset button.
Attach was support patch.

Many Thanks.

BR,
Kailang

--_002_f39b11d00340408ca2ed2df9b4fc2a09realtekcom_
Content-Type: application/octet-stream;
	name="0001-alc285-thinkpad-hsb.patch"
Content-Description: 0001-alc285-thinkpad-hsb.patch
Content-Disposition: attachment; filename="0001-alc285-thinkpad-hsb.patch";
	size=1985; creation-date="Mon, 02 Nov 2020 07:03:32 GMT";
	modification-date="Fri, 06 Nov 2020 07:50:43 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyMWY2MzFkNmY1YjFkNDc3OTU4ZWJmN2UwMGMwYWE0ZmJkYTM5ZjVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBrYWlsYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpEYXRlOiBN
b24sIDIgTm92IDIwMjAgMTU6MDA6MTIgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNBOiBoZGEv
cmVhbHRlayAtIEFkZCBzdXBwb3J0ZWQgZm9yIExlbm92byBUaGlua1BhZCBIZWFkc2V0IEJ1dHRv
bgpBZGQgc3VwcG9ydGVkIGZvciBMZW5vdm8gVGhpbmtQYWQgSGVhZHNldCBCdXR0b24uClRoaW5r
cGFkIFAxIEdlbiAzICgweDIyYzEpClRoaW5rcGFkIFgxIEV4dHJlbWUgR2VuIDMgKDB4MjJjMikK
U2lnbmVkLW9mZi1ieTogS2FpbGFuZyBZYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgoKZGlmZiAt
LWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRj
aF9yZWFsdGVrLmMKaW5kZXggZjIzOTg3MjFhYzFlLi4yNWI1MmQ3MDlmOGUgMTAwNjQ0Ci0tLSBh
L3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hf
cmVhbHRlay5jCkBAIC02Mjc3LDYgKzYyNzcsNyBAQCBlbnVtIHsKIAlBTEMyNTZfRklYVVBfSU5U
RUxfTlVDOF9SVUdHRUQsCiAJQUxDMjU1X0ZJWFVQX1hJQU9NSV9IRUFEU0VUX01JQywKIAlBTEMy
NzRfRklYVVBfSFBfTUlDLAorCUFMQzI4NV9GSVhVUF9USElOS1BBRF9OT19CQVNTX1NQS19IRUFE
U0VUX0pBQ0ssCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9maXh1cCBhbGMyNjlfZml4
dXBzW10gPSB7CkBAIC03NjY0LDYgKzc2NjUsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFf
Zml4dXAgYWxjMjY5X2ZpeHVwc1tdID0gewogCQkJeyB9CiAJCX0sCiAJfSwKKwlbQUxDMjg1X0ZJ
WFVQX1RISU5LUEFEX05PX0JBU1NfU1BLX0hFQURTRVRfSkFDS10gPSB7CisJCS50eXBlID0gSERB
X0ZJWFVQX0ZVTkMsCisJCS52LmZ1bmMgPSBhbGNfZml4dXBfaGVhZHNldF9qYWNrLAorCQkuY2hh
aW5lZCA9IHRydWUsCisJCS5jaGFpbl9pZCA9IEFMQzI2OV9GSVhVUF9USElOS1BBRF9BQ1BJCisJ
fSwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMyNjlfZml4dXBf
dGJsW10gPSB7CkBAIC03OTI1LDYgKzc5MzIsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9w
Y2lfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAw
eDIyNWQsICJUaGlua3BhZCBUNDgwIiwgQUxDMjY5X0ZJWFVQX0xJTUlUX0lOVF9NSUNfQk9PU1Qp
LAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDIyOTIsICJUaGlua3BhZCBYMSBDYXJib24gN3Ro
IiwgQUxDMjg1X0ZJWFVQX1RISU5LUEFEX0hFQURTRVRfSkFDSyksCiAJU05EX1BDSV9RVUlSSygw
eDE3YWEsIDB4MjJiZSwgIlRoaW5rcGFkIFgxIENhcmJvbiA4dGgiLCBBTEMyODVfRklYVVBfVEhJ
TktQQURfSEVBRFNFVF9KQUNLKSwKKwlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgyMmMxLCAiVGhp
bmtwYWQgUDEgR2VuIDMiLCBBTEMyODVfRklYVVBfVEhJTktQQURfTk9fQkFTU19TUEtfSEVBRFNF
VF9KQUNLKSwKKwlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgyMmMyLCAiVGhpbmtwYWQgWDEgRXh0
cmVtZSBHZW4gMyIsIEFMQzI4NV9GSVhVUF9USElOS1BBRF9OT19CQVNTX1NQS19IRUFEU0VUX0pB
Q0spLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDMwYmIsICJUaGlua0NlbnRyZSBBSU8iLCBB
TEMyMzNfRklYVVBfTEVOT1ZPX0xJTkUyX01JQ19IT1RLRVkpLAogCVNORF9QQ0lfUVVJUksoMHgx
N2FhLCAweDMwZTIsICJUaGlua0NlbnRyZSBBSU8iLCBBTEMyMzNfRklYVVBfTEVOT1ZPX0xJTkUy
X01JQ19IT1RLRVkpLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDMxMGMsICJUaGlua0NlbnRy
ZSBTdGF0aW9uIiwgQUxDMjk0X0ZJWFVQX0xFTk9WT19NSUNfTE9DQVRJT04pLAo=

--_002_f39b11d00340408ca2ed2df9b4fc2a09realtekcom_--
