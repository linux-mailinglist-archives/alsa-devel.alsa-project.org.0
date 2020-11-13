Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A4E2B1680
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Nov 2020 08:33:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D4C71784;
	Fri, 13 Nov 2020 08:32:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D4C71784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605252797;
	bh=mt13r7DDslYI53SPKLn/PzhR42VaM+/7Bz4sn26euBU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cVpUXq39ioJqYI10gln6WrXvvGcviXFgAc1bfUz5SpJ1Cc0MG5dW1JBD1tJHXDh1Y
	 BOGCndcpdZbaFZPIGqO0q34442WawI0dARTFd0Wx1NLfuqSMCxSlspQMogqVe1q7As
	 cTDyWUEAfmgMwoHlQZ+qRyxAQHP6qLIT89tZkJO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90C6DF800D1;
	Fri, 13 Nov 2020 08:31:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5634DF8020C; Fri, 13 Nov 2020 08:31:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11222F80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 08:31:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11222F80086
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0AD7VQzT4026829,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb05.realtek.com.tw[172.21.6.98])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0AD7VQzT4026829
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 13 Nov 2020 15:31:26 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.35) by
 RTEXMB05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Fri, 13 Nov 2020 15:31:26 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMBS02.realtek.com.tw (172.21.6.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 13 Nov 2020 15:31:26 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2]) by
 RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2%8]) with mapi id
 15.01.2106.003; Fri, 13 Nov 2020 15:31:26 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: HP headset Mic detect issue
Thread-Topic: HP headset Mic detect issue
Thread-Index: Ada5jrIAocTs0/8sSMuEm//vjlMRcQ==
Date: Fri, 13 Nov 2020 07:31:26 +0000
Message-ID: <1ae4d98e92c147b780ace3911c4e1d73@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.96]
Content-Type: multipart/mixed;
 boundary="_002_1ae4d98e92c147b780ace3911c4e1d73realtekcom_"
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

--_002_1ae4d98e92c147b780ace3911c4e1d73realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

If it turn on power save mode, Headset Mic will lose after boot.
Attach patch will solve it.

Many Thanks.

BR,
Kailang

--_002_1ae4d98e92c147b780ace3911c4e1d73realtekcom_
Content-Type: application/octet-stream;
	name="0001-alc236-alc256-hp-hsmic.patch"
Content-Description: 0001-alc236-alc256-hp-hsmic.patch
Content-Disposition: attachment;
	filename="0001-alc236-alc256-hp-hsmic.patch"; size=1958;
	creation-date="Tue, 03 Nov 2020 07:32:27 GMT";
	modification-date="Fri, 13 Nov 2020 07:27:55 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkMTMwYTFiNWI5MGE3ZGY3NjA5YmJhMTI5MjZkYjBhYmYzZGIwMDM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBrYWlsYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpEYXRlOiBU
dWUsIDMgTm92IDIwMjAgMTU6MzA6NTEgKzA4MDAKU3ViamVjdDogW1BBVENIXSBIUCBIZWFkc2V0
IE1pYyBjYW4ndCBkZXRlY3QgYWZ0ZXIgYm9vdAoKU3lzdGVtIGJvb3Qgb3Igd2FybSBib290IHdp
dGggcGx1Z2dlZCBoZWFkc2V0LgpJZiBpdCB0dXJuIG9uIHBvd2VyIHNhdmUgbW9kZSwgSGVhZHNl
dCBNaWMgd2lsbCBsb3NlLgpUaGlzIHBhdGNoIHdpbGwgc29sdmUgdGhpcyBpc3N1ZS4KClNpZ25l
ZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KCmRpZmYgLS1naXQg
YS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVh
bHRlay5jCmluZGV4IDRmMGVhODAxM2JmNi4uOWRjNWFmY2E4Y2IyIDEwMDY0NAotLS0gYS9zb3Vu
ZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0
ZWsuYwpAQCAtNjMwMCw2ICs2MzAwLDcgQEAgZW51bSB7CiAJQUxDMjU1X0ZJWFVQX1hJQU9NSV9I
RUFEU0VUX01JQywKIAlBTEMyNzRfRklYVVBfSFBfTUlDLAogCUFMQzI3NF9GSVhVUF9IUF9IRUFE
U0VUX01JQywKKwlBTEMyNTZfRklYVVBfSFBfSEVBRFNFVF9NSUMsCiB9OwogCiBzdGF0aWMgY29u
c3Qgc3RydWN0IGhkYV9maXh1cCBhbGMyNjlfZml4dXBzW10gPSB7CkBAIC03NjkzLDYgKzc2OTQs
MTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfZml4dXAgYWxjMjY5X2ZpeHVwc1tdID0gewog
CQkuY2hhaW5lZCA9IHRydWUsCiAJCS5jaGFpbl9pZCA9IEFMQzI3NF9GSVhVUF9IUF9NSUMKIAl9
LAorCVtBTEMyNTZfRklYVVBfSFBfSEVBRFNFVF9NSUNdID0geworCQkudHlwZSA9IEhEQV9GSVhV
UF9GVU5DLAorCQkudi5mdW5jID0gYWxjMjc0X2ZpeHVwX2hwX2hlYWRzZXRfbWljLAorCX0sCiB9
OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9wY2lfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtd
ID0gewpAQCAtODI2NSw2ICs4MjcwLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX2hkYV9w
aW5fcXVpcmsgYWxjMjY5X3Bpbl9maXh1cF90YmxbXSA9IHsKIAkJezB4MTksIDB4MDJhMTEwMjB9
LAogCQl7MHgxYSwgMHgwMmExMTAzMH0sCiAJCXsweDIxLCAweDAyMjExMDFmfSksCisJU05EX0hE
QV9QSU5fUVVJUksoMHgxMGVjMDIzNiwgMHgxMDNjLCAiSFAiLCBBTEMyNTZfRklYVVBfSFBfSEVB
RFNFVF9NSUMsCisJCXsweDE0LCAweDkwMTcwMTEwfSwKKwkJezB4MTksIDB4MDJhMTEwMjB9LAor
CQl7MHgyMSwgMHgwMjIxMTAzMH0pLAogCVNORF9IREFfUElOX1FVSVJLKDB4MTBlYzAyNTUsIDB4
MTAyOCwgIkRlbGwiLCBBTEMyNTVfRklYVVBfREVMTDJfTUlDX05PX1BSRVNFTkNFLAogCQl7MHgx
NCwgMHg5MDE3MDExMH0sCiAJCXsweDIxLCAweDAyMjExMDIwfSksCkBAIC04MzY3LDYgKzgzNzYs
MTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfaGRhX3Bpbl9xdWlyayBhbGMyNjlfcGluX2Zp
eHVwX3RibFtdID0gewogCQl7MHgxYSwgMHg5MGE3MDEzMH0sCiAJCXsweDFiLCAweDkwMTcwMTEw
fSwKIAkJezB4MjEsIDB4MDMyMTEwMjB9KSwKKyAgICAgICBTTkRfSERBX1BJTl9RVUlSSygweDEw
ZWMwMjU2LCAweDEwM2MsICJIUCIsIEFMQzI1Nl9GSVhVUF9IUF9IRUFEU0VUX01JQywKKwkJezB4
MTQsIDB4OTAxNzAxMTB9LAorCQl7MHgxOSwgMHgwMmExMTAyMH0sCisJCXsweDIxLCAweDAyMjEx
MDFmfSksCiAgICAgICAgU05EX0hEQV9QSU5fUVVJUksoMHgxMGVjMDI3NCwgMHgxMDNjLCAiSFAi
LCBBTEMyNzRfRklYVVBfSFBfSEVBRFNFVF9NSUMsCiAJCXsweDE3LCAweDkwMTcwMTEwfSwKIAkJ
ezB4MTksIDB4MDNhMTEwMzB9LAo=

--_002_1ae4d98e92c147b780ace3911c4e1d73realtekcom_--
