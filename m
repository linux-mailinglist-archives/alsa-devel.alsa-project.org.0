Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 379AF27672
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 09:01:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA843166F;
	Thu, 23 May 2019 09:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA843166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558594876;
	bh=4SnM+Uw4BlexNwEAW4J6L0JMzwuRgU+h3wz4bhukVrw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pne84jo0STzx0AC14R2ySkPLQVooJMoRK1gdM7xh/VJNSQxbIaABMKRzwvlTcaus1
	 uMerlMQLxaLd5DtDL8BbwfNqhjWFRExtVumW6qP02eaYPs34nvzSJOli4ksSTGvfUu
	 1fqFKZfPfZeLM3FlYHYCOf1eT7zypQg8ByZv7Os8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A376F89670;
	Thu, 23 May 2019 08:59:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE983F89670; Thu, 23 May 2019 08:59:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77414F80C0F
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 08:59:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77414F80C0F
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x4N6xKNZ007758,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcas11.realtek.com.tw [172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTP id x4N6xKNZ007758;
 Thu, 23 May 2019 14:59:20 +0800
Received: from RTITEXH01.realtek.com.tw (172.21.6.62) by
 RTITCAS11.realtek.com.tw (172.21.6.12) with Microsoft SMTP Server (TLS) id
 14.3.399.0; Thu, 23 May 2019 14:59:19 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITEXH01.realtek.com.tw ([::1]) with mapi id 14.03.0439.000; Thu, 23 May
 2019 14:59:19 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Thread-Topic: set power_save_node=0 as default
Thread-Index: AdURNMhSIsih67thSMa5RqgzY//x/Q==
Date: Thu, 23 May 2019 06:59:18 +0000
Message-ID: <6FAB7C47BCF00940BB0999A99BE3547A1D766DC0@RTITMBSVM07.realtek.com.tw>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_002_6FAB7C47BCF00940BB0999A99BE3547A1D766DC0RTITMBSVM07real_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] set power_save_node=0 as default
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

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D766DC0RTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

I measured power consumption between power_save_node=3D1 and power_save_nod=
e=3D0.
It's almost the same.
Codec will enter to runtime suspend and suspend.
That pin also will enter to D3. Don't need to enter to D3 by single pin.
So, Disable power_save_node as default. It will avoid more issues.
Windows Driver also has not this option at runtime PM.

Many Thanks.

BR,
Kailang

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D766DC0RTITMBSVM07real_
Content-Type: application/octet-stream;
	name="0000-power-save-node-disable.patch"
Content-Description: 0000-power-save-node-disable.patch
Content-Disposition: attachment;
	filename="0000-power-save-node-disable.patch"; size=1064;
	creation-date="Thu, 23 May 2019 06:46:59 GMT";
	modification-date="Thu, 23 May 2019 06:56:40 GMT"
Content-Transfer-Encoding: base64

RnJvbSA0MDhjNjQ5ZTFlNmRjYWIyZGZmMmZjMDJlMTkxZTdlZDRhNmFlNWY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMjMgTWF5IDIwMTkgMTQ6NDM6MDQgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIFNldCBkZWZhdWx0IHBvd2VyIHNhdmUgbm9kZSB0byAwCgpJIG1lYXN1
cmVkIHBvd2VyIGNvbnN1bXB0aW9uIGJldHdlZW4gcG93ZXJfc2F2ZV9ub2RlPTEgYW5kIHBvd2Vy
X3NhdmVfbm9kZT0wLgpJdCdzIGFsbW9zdCB0aGUgc2FtZS4KQ29kZWMgd2lsbCBlbnRlciB0byBy
dW50aW1lIHN1c3BlbmQgYW5kIHN1c3BlbmQuClRoYXQgcGluIGFsc28gd2lsbCBlbnRlciB0byBE
My4gRG9uJ3QgbmVlZCB0byBlbnRlciB0byBEMyBieSBzaW5nbGUgcGluLgpTbywgRGlzYWJsZSBw
b3dlcl9zYXZlX25vZGUgYXMgZGVmYXVsdC4gSXQgd2lsbCBhdm9pZCBtb3JlIGlzc3Vlcy4KV2lu
ZG93cyBEcml2ZXIgYWxzbyBoYXMgbm90IHRoaXMgb3B0aW9uIGF0IHJ1bnRpbWUgUE0uCgpTaWdu
ZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CgpkaWZmIC0tZ2l0
IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3Jl
YWx0ZWsuYwppbmRleCBmODNmMjFkNjRkZDQuLjQxM2ZjMzFkNWE4ZiAxMDA2NDQKLS0tIGEvc291
bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFs
dGVrLmMKQEAgLTc3MDYsNyArNzcwNiw3IEBAIHN0YXRpYyBpbnQgcGF0Y2hfYWxjMjY5KHN0cnVj
dCBoZGFfY29kZWMgKmNvZGVjKQogCiAJc3BlYyA9IGNvZGVjLT5zcGVjOwogCXNwZWMtPmdlbi5z
aGFyZWRfbWljX3ZyZWZfcGluID0gMHgxODsKLQljb2RlYy0+cG93ZXJfc2F2ZV9ub2RlID0gMTsK
Kwljb2RlYy0+cG93ZXJfc2F2ZV9ub2RlID0gMDsKIAogI2lmZGVmIENPTkZJR19QTQogCWNvZGVj
LT5wYXRjaF9vcHMuc3VzcGVuZCA9IGFsYzI2OV9zdXNwZW5kOwo=

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D766DC0RTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D766DC0RTITMBSVM07real_--
