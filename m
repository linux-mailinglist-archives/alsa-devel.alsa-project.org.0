Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D85AA81E28
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Apr 2025 09:21:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0C0667623;
	Wed,  9 Apr 2025 09:20:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0C0667623
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744183256;
	bh=TUy8N4tbq0j/2btvClKxatCnG+hf2VrrW8E0to8Fv5Y=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=POox803+OynQix9u4mzQdwGcWzza6MVSQzamJottuluBySDeFoBJe5xeWJ1pW8QQr
	 kqbMzOOScESbLIweGLdGAiFqVIkkOOr/tGJcwfVAvHlEF+tdeVBuXTl5CutQi0KHux
	 xwu1ZfLPyeej7SGtkC2AzskhTKzSsQRvW054b5Xw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 739E4F805BD; Wed,  9 Apr 2025 09:20:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12777F805BE;
	Wed,  9 Apr 2025 09:20:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B89D6F804E5; Wed,  9 Apr 2025 09:20:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5AB8F8016A
	for <alsa-devel@alsa-project.org>; Wed,  9 Apr 2025 09:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5AB8F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=oWt3bJiw
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 5397K3K701151343,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1744183204; bh=TUy8N4tbq0j/2btvClKxatCnG+hf2VrrW8E0to8Fv5Y=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=oWt3bJiw9BeoH9UMRyU2mlFKbdKyHmIMc4wqjyidEu6Z0hnLMYL9onD+6I2pqrPzd
	 W8DP/4Dl5gGxqA+sglP7ZaODMfSYfJ9aoduvySuLvthyGGRRsxnzcj3E7EFJnYwF/n
	 JH6jg7PPAUTyOED1mOvMrVCXV2Rmoqz+3IUll5X0Aros0P4srqAICFimBjYhG/I6Gu
	 gBp0gCiXn7jVs/ot05flf8prg4HF2fQ/70Gso9QuaNd0HnewnO/sxWB+80RdPCC172
	 Qt3yVBC84xsoLeqf9g7707wcWNhUJ3FGlLeFJb8oiXrvk/xlXMX66G7Pxz/zGfsgQ3
	 f8v1v4+5G9o8A==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 5397K3K701151343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Apr 2025 15:20:04 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Apr 2025 15:20:03 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 9 Apr 2025 15:20:03 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Wed, 9 Apr 2025 15:20:03 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Enable Headset Mic for ASUS platform
Thread-Topic: Enable Headset Mic for ASUS platform
Thread-Index: AdupH4xt3y1erGWmSpCQwvkYvricow==
Date: Wed, 9 Apr 2025 07:20:03 +0000
Message-ID: <0fe3421a6850461fb0b7012cb28ef71d@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
Content-Type: multipart/mixed;
	boundary="_002_0fe3421a6850461fb0b7012cb28ef71drealtekcom_"
MIME-Version: 1.0
Message-ID-Hash: QOPH3ZFSQ2PXWQZALVL72PRCTNT6QEV6
X-Message-ID-Hash: QOPH3ZFSQ2PXWQZALVL72PRCTNT6QEV6
X-MailFrom: kailang@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QOPH3ZFSQ2PXWQZALVL72PRCTNT6QEV6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_0fe3421a6850461fb0b7012cb28ef71drealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch was fixed headset Mic issue for Asus platform.
Many Thanks.

Kailang.

--_002_0fe3421a6850461fb0b7012cb28ef71drealtekcom_
Content-Type: application/octet-stream; name="0001-alc294-asus-hsmic.patch"
Content-Description: 0001-alc294-asus-hsmic.patch
Content-Disposition: attachment; filename="0001-alc294-asus-hsmic.patch";
	size=3725; creation-date="Wed, 09 Apr 2025 07:11:41 GMT";
	modification-date="Wed, 09 Apr 2025 07:15:41 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlNjNiMGQ3YzFkOGZkYmFlNzIwODRiN2ZhNmQ3N2IzYjk3M2YwNTczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFdlZCwgOSBBcHIgMjAyNSAxNTowOTowOCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gRml4ZWQgQVNVUyBwbGF0Zm9ybSBoZWFkc2V0IE1pYyBpc3N1ZQoKQVNV
UyBwbGF0Zm9ybSBIZWFkc2V0IE1pYyB3YXMgZGlzYWJsZSBieSBkZWZhdWx0LgpBc3NpZ25lZCB2
ZXJiIHRhYmxlIGZvciBNaWMgcGluIHdpbGwgZW5hYmxlIGl0LgoKU2lnbmVkLW9mZi1ieTogS2Fp
bGFuZyBZYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgoKZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9o
ZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5kZXgg
YjY5YjY1OWFlNjU5Li4xZGE2MTNmN2IyNTQgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0
Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC03OTUw
LDYgKzc5NTAsNyBAQCBlbnVtIHsKIAlBTEMyMzNfRklYVVBfTUVESU9OX01UTF9TUEssCiAJQUxD
Mjk0X0ZJWFVQX0JBU1NfU1BFQUtFUl8xNSwKIAlBTEMyODNfRklYVVBfREVMTF9IUF9SRVNVTUUs
CisJQUxDMjk0X0ZJWFVQX0FTVVNfQ1MzNUw0MV9TUElfMiwKIH07CiAKIC8qIEEgc3BlY2lhbCBm
aXh1cCBmb3IgTGVub3ZvIEM5NDAgYW5kIFlvZ2EgRHVldCA3OwpAQCAtMTAzMTAsNiArMTAzMTEs
MTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfZml4dXAgYWxjMjY5X2ZpeHVwc1tdID0gewog
CQkudHlwZSA9IEhEQV9GSVhVUF9GVU5DLAogCQkudi5mdW5jID0gYWxjMjgzX2ZpeHVwX2RlbGxf
aHBfcmVzdW1lLAogCX0sCisJW0FMQzI5NF9GSVhVUF9BU1VTX0NTMzVMNDFfU1BJXzJdID0gewor
CQkudHlwZSA9IEhEQV9GSVhVUF9GVU5DLAorCQkudi5mdW5jID0gY3MzNWw0MV9maXh1cF9zcGlf
dHdvLAorCQkuY2hhaW5lZCA9IHRydWUsCisJCS5jaGFpbl9pZCA9IEFMQzI5NF9GSVhVUF9BU1VT
X0hFQURTRVRfTUlDLAorCX0sCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9xdWlyayBh
bGMyNjlfZml4dXBfdGJsW10gPSB7CkBAIC0xMDgxMiw3ICsxMDgxOSw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgaGRhX3F1aXJrIGFsYzI2OV9maXh1cF90YmxbXSA9IHsKIAlTTkRfUENJX1FVSVJL
KDB4MTA0MywgMHgxMmEwLCAiQVNVUyBYNDQxVVYiLCBBTEMyMzNfRklYVVBfRUFQRF9DT0VGX0FO
RF9NSUNfTk9fUFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJUksoMHgxMDQzLCAweDEyYTMsICJBc3Vz
IE43NjkxWk0iLCBBTEMyNjlfRklYVVBfQVNVU19ONzYwMVpNKSwKIAlTTkRfUENJX1FVSVJLKDB4
MTA0MywgMHgxMmFmLCAiQVNVUyBVWDU4MlpTIiwgQUxDMjQ1X0ZJWFVQX0NTMzVMNDFfU1BJXzIp
LAotCVNORF9QQ0lfUVVJUksoMHgxMDQzLCAweDEyYjQsICJBU1VTIEIzNDA1Q0NBIC8gUDM0MDVD
Q0EiLCBBTEMyNDVfRklYVVBfQ1MzNUw0MV9TUElfMiksCisJU05EX1BDSV9RVUlSSygweDEwNDMs
IDB4MTJiNCwgIkFTVVMgQjM0MDVDQ0EgLyBQMzQwNUNDQSIsIEFMQzI5NF9GSVhVUF9BU1VTX0NT
MzVMNDFfU1BJXzIpLAogCVNORF9QQ0lfUVVJUksoMHgxMDQzLCAweDEyZTAsICJBU1VTIFg1NDFT
QSIsIEFMQzI1Nl9GSVhVUF9BU1VTX01JQyksCiAJU05EX1BDSV9RVUlSSygweDEwNDMsIDB4MTJm
MCwgIkFTVVMgWDU0MVVWIiwgQUxDMjU2X0ZJWFVQX0FTVVNfTUlDKSwKIAlTTkRfUENJX1FVSVJL
KDB4MTA0MywgMHgxMzEzLCAiQXN1cyBLNDJKWiIsIEFMQzI2OVZCX0ZJWFVQX0FTVVNfTUlDX05P
X1BSRVNFTkNFKSwKQEAgLTEwOTAxLDE0ICsxMDkwOCwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGhkYV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7CiAJU05EX1BDSV9RVUlSSygweDEwNDMs
IDB4MWZiMywgIkFTVVMgUk9HIEZsb3cgWjEzIEdaMzAyRUEiLCBBTEMyODdfRklYVVBfQ1MzNUw0
MV9JMkNfMiksCiAJU05EX1BDSV9RVUlSSygweDEwNDMsIDB4MzAxMSwgIkFTVVMgQjU2MDVDVkEi
LCBBTEMyNDVfRklYVVBfQ1MzNUw0MV9TUElfMiksCiAJU05EX1BDSV9RVUlSSygweDEwNDMsIDB4
MzAzMCwgIkFTVVMgWk4yNzBJRSIsIEFMQzI1Nl9GSVhVUF9BU1VTX0FJT19HUElPMiksCi0JU05E
X1BDSV9RVUlSSygweDEwNDMsIDB4MzA2MSwgIkFTVVMgQjM0MDVDQ0EiLCBBTEMyNDVfRklYVVBf
Q1MzNUw0MV9TUElfMiksCi0JU05EX1BDSV9RVUlSSygweDEwNDMsIDB4MzA3MSwgIkFTVVMgQjU0
MDVDQ0EiLCBBTEMyNDVfRklYVVBfQ1MzNUw0MV9TUElfMiksCi0JU05EX1BDSV9RVUlSSygweDEw
NDMsIDB4MzBjMSwgIkFTVVMgQjM2MDVDQ0EgLyBQMzYwNUNDQSIsIEFMQzI0NV9GSVhVUF9DUzM1
TDQxX1NQSV8yKSwKLQlTTkRfUENJX1FVSVJLKDB4MTA0MywgMHgzMGQxLCAiQVNVUyBCNTQwNUND
QSIsIEFMQzI0NV9GSVhVUF9DUzM1TDQxX1NQSV8yKSwKLQlTTkRfUENJX1FVSVJLKDB4MTA0Mywg
MHgzMGUxLCAiQVNVUyBCNTYwNUNDQSIsIEFMQzI0NV9GSVhVUF9DUzM1TDQxX1NQSV8yKSwKKwlT
TkRfUENJX1FVSVJLKDB4MTA0MywgMHgzMDYxLCAiQVNVUyBCMzQwNUNDQSIsIEFMQzI5NF9GSVhV
UF9BU1VTX0NTMzVMNDFfU1BJXzIpLAorCVNORF9QQ0lfUVVJUksoMHgxMDQzLCAweDMwNzEsICJB
U1VTIEI1NDA1Q0NBIiwgQUxDMjk0X0ZJWFVQX0FTVVNfQ1MzNUw0MV9TUElfMiksCisJU05EX1BD
SV9RVUlSSygweDEwNDMsIDB4MzBjMSwgIkFTVVMgQjM2MDVDQ0EgLyBQMzYwNUNDQSIsIEFMQzI5
NF9GSVhVUF9BU1VTX0NTMzVMNDFfU1BJXzIpLAorCVNORF9QQ0lfUVVJUksoMHgxMDQzLCAweDMw
ZDEsICJBU1VTIEI1NDA1Q0NBIiwgQUxDMjk0X0ZJWFVQX0FTVVNfQ1MzNUw0MV9TUElfMiksCisJ
U05EX1BDSV9RVUlSSygweDEwNDMsIDB4MzBlMSwgIkFTVVMgQjU2MDVDQ0EiLCBBTEMyOTRfRklY
VVBfQVNVU19DUzM1TDQxX1NQSV8yKSwKIAlTTkRfUENJX1FVSVJLKDB4MTA0MywgMHgzMWQwLCAi
QVNVUyBaZW4gQUlPIDI3IFoyNzJTRF9BMjcyU0QiLCBBTEMyNzRfRklYVVBfQVNVU19aRU5fQUlP
XzI3KSwKLQlTTkRfUENJX1FVSVJLKDB4MTA0MywgMHgzMWUxLCAiQVNVUyBCNTYwNUNDQSIsIEFM
QzI0NV9GSVhVUF9DUzM1TDQxX1NQSV8yKSwKLQlTTkRfUENJX1FVSVJLKDB4MTA0MywgMHgzMWYx
LCAiQVNVUyBCMzYwNUNDQSIsIEFMQzI0NV9GSVhVUF9DUzM1TDQxX1NQSV8yKSwKKwlTTkRfUENJ
X1FVSVJLKDB4MTA0MywgMHgzMWUxLCAiQVNVUyBCNTYwNUNDQSIsIEFMQzI5NF9GSVhVUF9BU1VT
X0NTMzVMNDFfU1BJXzIpLAorCVNORF9QQ0lfUVVJUksoMHgxMDQzLCAweDMxZjEsICJBU1VTIEIz
NjA1Q0NBIiwgQUxDMjk0X0ZJWFVQX0FTVVNfQ1MzNUw0MV9TUElfMiksCiAJU05EX1BDSV9RVUlS
SygweDEwNDMsIDB4M2EyMCwgIkFTVVMgRzYxNEpaUiIsIEFMQzI4NV9GSVhVUF9BU1VTX1NQSV9S
RUFSX1NQRUFLRVJTKSwKIAlTTkRfUENJX1FVSVJLKDB4MTA0MywgMHgzYTMwLCAiQVNVUyBHODE0
SlZSL0pJUiIsIEFMQzI4NV9GSVhVUF9BU1VTX1NQSV9SRUFSX1NQRUFLRVJTKSwKIAlTTkRfUENJ
X1FVSVJLKDB4MTA0MywgMHgzYTQwLCAiQVNVUyBHODE0SlpSIiwgQUxDMjg1X0ZJWFVQX0FTVVNf
U1BJX1JFQVJfU1BFQUtFUlMpLAo=

--_002_0fe3421a6850461fb0b7012cb28ef71drealtekcom_--
