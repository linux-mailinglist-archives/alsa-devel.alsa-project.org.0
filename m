Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E682E195D
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 08:30:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50E0917D5;
	Wed, 23 Dec 2020 08:29:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50E0917D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608708627;
	bh=bRCqaCg9pW303jNkYY55gkP3P+ZBsDQiGurtXbHbsr4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GMZeBDnsZC59W0mY3x5krYP1ux2gLLNEjPbP1Fvl9pYz7XnLKlqKFKF1lr8hkjtgB
	 hWAh9oOv8/XtUcMp2IYu5y7aU5BC7pPiqp9X6fImfw0tXJbkn33zRWyrwbRVngsjIQ
	 vpgHE+KZbZqQSA5l2Zb9FP34Sv7rbBMa8KQkDpY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7237CF80168;
	Wed, 23 Dec 2020 08:28:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 034C6F801D5; Wed, 23 Dec 2020 08:28:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_NONE autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB84BF80116
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 08:28:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB84BF80116
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0BN7SbZM2004686,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb05.realtek.com.tw[172.21.6.98])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0BN7SbZM2004686
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 23 Dec 2020 15:28:37 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMB05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Wed, 23 Dec 2020 15:28:37 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 23 Dec 2020 15:28:36 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::5d07:e256:a2a2:81ee]) by
 RTEXMBS01.realtek.com.tw ([fe80::5d07:e256:a2a2:81ee%5]) with mapi id
 15.01.2106.006; Wed, 23 Dec 2020 15:28:36 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: Lenovo C940 speaker
Thread-Topic: Lenovo C940 speaker
Thread-Index: AdbY/JHqMt6Sv2xNQOOJ7gSk3OAxFQ==
Date: Wed, 23 Dec 2020 07:28:36 +0000
Message-ID: <ea25b4e5c468491aa2e9d6cb1f2fced3@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.96]
Content-Type: multipart/mixed;
 boundary="_002_ea25b4e5c468491aa2e9d6cb1f2fced3realtekcom_"
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

--_002_ea25b4e5c468491aa2e9d6cb1f2fced3realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

C940 make i2s Amp(none Realtek) verb in BIOS verb table. It will enable int=
ernal speaker.
This patch will solve it can't adjust speaker volume issue.

BR,
Kailang

--_002_ea25b4e5c468491aa2e9d6cb1f2fced3realtekcom_
Content-Type: application/octet-stream;
	name="0000-alc298-lenovo-c940-spk.patch"
Content-Description: 0000-alc298-lenovo-c940-spk.patch
Content-Disposition: attachment;
	filename="0000-alc298-lenovo-c940-spk.patch"; size=1664;
	creation-date="Fri, 23 Oct 2020 06:48:06 GMT";
	modification-date="Wed, 23 Dec 2020 07:18:22 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkNjgwNWZmMDBlZTM2NTQ0ZjE1MWRiNDA2Y2I3NmNlZGM4Zjc1MmRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgMjMgT2N0IDIwMjAgMTQ6NDY6NDcgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIENhbm5vdCBhZGp1c3Qgc3BlYWtlcidzIHZvbHVtZSBvbiBMZW5vdm8g
Qzk0MAoKQXBwbHlpbmcgdGhlIGFsYzI5OF9maXh1cF9zcGVha2VyX3ZvbHVtZSBmdW5jdGlvbiBj
YW4gZml4IHRoZSBpc3N1ZS4KClNpZ25lZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0By
ZWFsdGVrLmNvbT4KZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIv
c291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggZjIzOTg3MjFhYzFlLi5iZWJkYmM1
NGViNDYgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3Nv
dW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC02Mjc3LDYgKzYyNzcsNyBAQCBlbnVtIHsK
IAlBTEMyNTZfRklYVVBfSU5URUxfTlVDOF9SVUdHRUQsCiAJQUxDMjU1X0ZJWFVQX1hJQU9NSV9I
RUFEU0VUX01JQywKIAlBTEMyNzRfRklYVVBfSFBfTUlDLAorCUFMQzI5OF9GSVhVUF9MRU5PVk9f
U1BLX1ZPTFVNRSwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwIGFsYzI2OV9m
aXh1cHNbXSA9IHsKQEAgLTc2NjQsNiArNzY2NSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhk
YV9maXh1cCBhbGMyNjlfZml4dXBzW10gPSB7CiAJCQl7IH0KIAkJfSwKIAl9LAorCVtBTEMyOThf
RklYVVBfTEVOT1ZPX1NQS19WT0xVTUVdID0geworCQkudHlwZSA9IEhEQV9GSVhVUF9GVU5DLAor
CQkudi5mdW5jID0gYWxjMjk4X2ZpeHVwX3NwZWFrZXJfdm9sdW1lLAorCX0sCiB9OwogCiBzdGF0
aWMgY29uc3Qgc3RydWN0IHNuZF9wY2lfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewpAQCAt
NzkzNSw2ICs3OTQwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJrIGFsYzI2
OV9maXh1cF90YmxbXSA9IHsKIAlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgzMTUxLCAiVGhpbmtD
ZW50cmUgU3RhdGlvbiIsIEFMQzI4M19GSVhVUF9IRUFEU0VUX01JQyksCiAJU05EX1BDSV9RVUlS
SygweDE3YWEsIDB4MzE3NiwgIlRoaW5rQ2VudHJlIFN0YXRpb24iLCBBTEMyODNfRklYVVBfSEVB
RFNFVF9NSUMpLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDMxNzgsICJUaGlua0NlbnRyZSBT
dGF0aW9uIiwgQUxDMjgzX0ZJWFVQX0hFQURTRVRfTUlDKSwKKwlTTkRfUENJX1FVSVJLKDB4MTdh
YSwgMHgzODE4LCAiTGVub3ZvIEM5NDAiLCBBTEMyOThfRklYVVBfTEVOT1ZPX1NQS19WT0xVTUUp
LAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDM5MDIsICJMZW5vdm8gRTUwLTgwIiwgQUxDMjY5
X0ZJWFVQX0RNSUNfVEhJTktQQURfQUNQSSksCiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4Mzk3
NywgIklkZWFQYWQgUzIxMCIsIEFMQzI4M19GSVhVUF9JTlRfTUlDKSwKIAlTTkRfUENJX1FVSVJL
KDB4MTdhYSwgMHgzOTc4LCAiTGVub3ZvIEI1MC03MCIsIEFMQzI2OV9GSVhVUF9ETUlDX1RISU5L
UEFEX0FDUEkpLAo=

--_002_ea25b4e5c468491aa2e9d6cb1f2fced3realtekcom_--
