Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C631403DB
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 07:16:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6BB117BF;
	Fri, 17 Jan 2020 07:16:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6BB117BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579241814;
	bh=m5IsVExfSh3bpoRo+bqnq3Muv+TlPTFLCPmMFt2rIcE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mq49NTMyU1/nkCxhX6A41bQ05jzVoy9aREE1q+5q91IXn78zUW3rNw8WfXcVWDkfA
	 LBgPU0SPlFsseTC5bZhfjYg38ldmak/NnAKgmYkwOpUg/Qa/DWgGSlW3Lsviu9IM4L
	 AQuXwopfm2ZY4mz7a44u7K53qA3qDg604ZELvnFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16581F801F8;
	Fri, 17 Jan 2020 07:15:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66534F801EB; Fri, 17 Jan 2020 07:15:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E397F800AA
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 07:14:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E397F800AA
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 00H6Elwm016526,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCAS11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 00H6Elwm016526
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 14:14:47 +0800
Received: from RTEXMB02.realtek.com.tw (172.21.6.95) by
 RTITCAS11.realtek.com.tw (172.21.6.12) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Fri, 17 Jan 2020 14:14:46 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 17 Jan 2020 14:14:46 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f]) by
 RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f%6]) with mapi id
 15.01.1779.005; Fri, 17 Jan 2020 14:14:46 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Thread-Topic: HP ALC671 support headset Mic
Thread-Index: AdXM/TTMJmAkNHhOTauVerEQ1XfdLA==
Date: Fri, 17 Jan 2020 06:14:46 +0000
Message-ID: <1afdc37edb8c4c6ca07b73322117cc7b@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_002_1afdc37edb8c4c6ca07b73322117cc7brealtekcom_"
MIME-Version: 1.0
Cc: Hui Wang <hui.wang@canonical.com>, Chih-Hsyuan Ho <chih.ho@canonical.com>,
 " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] HP ALC671 support headset Mic
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

--_002_1afdc37edb8c4c6ca07b73322117cc7brealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

HP cPC need to support headset Mic.
Attach patch was the support patch.

BR,
Kailang

--_002_1afdc37edb8c4c6ca07b73322117cc7brealtekcom_
Content-Type: application/octet-stream;
	name="0005-hp-alc671-headset-mic.patch"
Content-Description: 0005-hp-alc671-headset-mic.patch
Content-Disposition: attachment;
	filename="0005-hp-alc671-headset-mic.patch"; size=2764;
	creation-date="Fri, 17 Jan 2020 06:07:32 GMT";
	modification-date="Fri, 17 Jan 2020 06:07:06 GMT"
Content-Transfer-Encoding: base64

RnJvbSBiOTdmOTRmYWRjZDFkYzFhMjBmY2ExOTg2NDBhZmY3MTVkOWIwNDY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgMTcgSmFuIDIwMjAgMTQ6MDQ6MDEgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFkZCBIZWFkc2V0IE1pYyBzdXBwb3J0ZWQgZm9yIEhQIGNQQwoKSFAg
QUxDNjcxIG5lZWQgdG8gc3VwcG9ydCBIZWFkc2V0IE1pYy4KCkZpeGVzOiBkMmNkNzk1YzRlY2Ug
KCJBTFNBOiBoZGEgLSBmaXh1cCBmb3IgdGhlIGJhc3Mgc3BlYWtlciBvbiBMZW5vdm8gQ2FyYm9u
IFgxIDd0aCBnZW4iKQpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRl
ay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3Vu
ZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCA3MzQwN2IyNWE3NzcuLmU0NDY5YTI1NTYw
ZSAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291bmQv
cGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTg0ODIsNiArODQ4MiwyOSBAQCBzdGF0aWMgdm9p
ZCBhbGM2NjJfZml4dXBfYXNwaXJlX2V0aG9zX2hwKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAog
CX0KIH0KIAorc3RhdGljIHZvaWQgYWxjNjcxX2ZpeHVwX2hwX2hlYWRzZXRfbWljMihzdHJ1Y3Qg
aGRhX2NvZGVjICpjb2RlYywKKwkJCQkJICAgICBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwICpmaXgs
IGludCBhY3Rpb24pCit7CisJc3RydWN0IGFsY19zcGVjICpzcGVjID0gY29kZWMtPnNwZWM7CisK
KwlzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9waW50YmwgcGluY2Znc1tdID0geworCQl7IDB4MTks
IDB4MDJhMTEwNDAgfSwgLyogdXNlIGFzIGhlYWRzZXQgbWljLCB3aXRoIGl0cyBvd24gamFjayBk
ZXRlY3QgKi8KKwkJeyAweDFiLCAweDAxODEzMDRmIH0sCisJCXsgfQorCX07CisKKwlzd2l0Y2gg
KGFjdGlvbikgeworCWNhc2UgSERBX0ZJWFVQX0FDVF9QUkVfUFJPQkU6CisJCXNwZWMtPmdlbi5t
aXhlcl9uaWQgPSAwOworCQlzcGVjLT5wYXJzZV9mbGFncyB8PSBIREFfUElOQ0ZHX0hFQURTRVRf
TUlDOworCQlzbmRfaGRhX2FwcGx5X3BpbmNmZ3MoY29kZWMsIHBpbmNmZ3MpOworCQlicmVhazsK
KwljYXNlIEhEQV9GSVhVUF9BQ1RfSU5JVDoKKwkJYWxjX3dyaXRlX2NvZWZfaWR4KGNvZGVjLCAw
eDE5LCAweGEwNTQpOworCQlicmVhazsKKwl9Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY29l
Zl9mdyBhbGM2NjhfY29lZnNbXSA9IHsKIAlXUklURV9DT0VGKDB4MDEsIDB4YmViZSksIFdSSVRF
X0NPRUYoMHgwMiwgMHhhYWFhKSwgV1JJVEVfQ09FRigweDAzLCAgICAweDApLAogCVdSSVRFX0NP
RUYoMHgwNCwgMHgwMTgwKSwgV1JJVEVfQ09FRigweDA2LCAgICAweDApLCBXUklURV9DT0VGKDB4
MDcsIDB4MGY4MCksCkBAIC04NTU1LDYgKzg1NzgsNyBAQCBlbnVtIHsKIAlBTEM2NjJfRklYVVBf
TEVOT1ZPX01VTFRJX0NPREVDUywKIAlBTEM2NjlfRklYVVBfQUNFUl9BU1BJUkVfRVRIT1MsCiAJ
QUxDNjY5X0ZJWFVQX0FDRVJfQVNQSVJFX0VUSE9TX0hFQURTRVQsCisJQUxDNjcxX0ZJWFVQX0hQ
X0hFQURTRVRfTUlDMiwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwIGFsYzY2
Ml9maXh1cHNbXSA9IHsKQEAgLTg4OTYsNiArODkyMCwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGhkYV9maXh1cCBhbGM2NjJfZml4dXBzW10gPSB7CiAJCS5jaGFpbmVkID0gdHJ1ZSwKIAkJLmNo
YWluX2lkID0gQUxDNjY5X0ZJWFVQX0FDRVJfQVNQSVJFX0VUSE9TX0hFQURTRVQKIAl9LAorCVtB
TEM2NzFfRklYVVBfSFBfSEVBRFNFVF9NSUMyXSA9IHsKKwkJLnR5cGUgPSBIREFfRklYVVBfRlVO
QywKKwkJLnYuZnVuYyA9IGFsYzY3MV9maXh1cF9ocF9oZWFkc2V0X21pYzIsCisJfSwKIH07CiAK
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGM2NjJfZml4dXBfdGJsW10gPSB7
CkBAIC05MDc4LDYgKzkxMDYsMjIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfaGRhX3Bpbl9x
dWlyayBhbGM2NjJfcGluX2ZpeHVwX3RibFtdID0gewogCQl7MHgxMiwgMHg5MGE2MDEzMH0sCiAJ
CXsweDE0LCAweDkwMTcwMTEwfSwKIAkJezB4MTUsIDB4MDMyMTEwMWZ9KSwKKwlTTkRfSERBX1BJ
Tl9RVUlSSygweDEwZWMwNjcxLCAweDEwM2MsICJIUCBjUEMiLCBBTEM2NzFfRklYVVBfSFBfSEVB
RFNFVF9NSUMyLAorCQl7MHgxNCwgMHgwMTAxNDAxMH0sCisJCXsweDE3LCAweDkwMTcwMTUwfSwK
KwkJezB4MWIsIDB4MDE4MTMwMzB9LAorCQl7MHgyMSwgMHgwMjIxMTAyMH0pLAorCVNORF9IREFf
UElOX1FVSVJLKDB4MTBlYzA2NzEsIDB4MTAzYywgIkhQIGNQQyIsIEFMQzY3MV9GSVhVUF9IUF9I
RUFEU0VUX01JQzIsCisJCXsweDE0LCAweDAxMDE0MDEwfSwKKwkJezB4MTgsIDB4MDFhMTkwNDB9
LAorCQl7MHgxYiwgMHgwMTgxMzAzMH0sCisJCXsweDIxLCAweDAyMjExMDIwfSksCisJU05EX0hE
QV9QSU5fUVVJUksoMHgxMGVjMDY3MSwgMHgxMDNjLCAiSFAgY1BDIiwgQUxDNjcxX0ZJWFVQX0hQ
X0hFQURTRVRfTUlDMiwKKwkJezB4MTQsIDB4MDEwMTQwMjB9LAorCQl7MHgxNywgMHg5MDE3MDEx
MH0sCisJCXsweDE4LCAweDAxYTE5MDUwfSwKKwkJezB4MWIsIDB4MDE4MTMwNDB9LAorCQl7MHgy
MSwgMHgwMjIxMTAzMH0pLAogCXt9CiB9OwogCg==

--_002_1afdc37edb8c4c6ca07b73322117cc7brealtekcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_1afdc37edb8c4c6ca07b73322117cc7brealtekcom_--
