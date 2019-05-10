Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A4C199D4
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 10:42:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6A98193A;
	Fri, 10 May 2019 10:41:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6A98193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557477763;
	bh=AvOsAsSCmSjZEubsv8qLaAzacx0+vmwS8gS1o07AO98=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P5GQ83JmB0Fo7zVpeC0zBBLqjTwLlVRA59a/mzQFb8WLVHqE6AwDxKV2CBlB3dVNp
	 hopv9WH7BbmA7Zu4uj8a+QvmypsZvcKGKgRdM4ly6pCQwMoqN1gWlDNBauMLfquiNa
	 vEa9uPZO0wG+ZaWvSRCKgLiKHdoTRHNrMNJe8KxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 251ECF896F0;
	Fri, 10 May 2019 10:40:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1889F896FD; Fri, 10 May 2019 10:40:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC14DF89673
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 10:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC14DF89673
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x4A8eiTU008689,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcas11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x4A8eiTU008689
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 16:40:45 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCAS11.realtek.com.tw ([fe80::7c6d:ced5:c4ff:8297%15]) with mapi id
 14.03.0399.000; Fri, 10 May 2019 16:40:44 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Thread-Topic: ALC298 headphone noise
Thread-Index: AdUHC9/tbaE9yjqnSiKjgt5S8jrOEg==
Date: Fri, 10 May 2019 08:40:43 +0000
Message-ID: <6FAB7C47BCF00940BB0999A99BE3547A1D76602E@RTITMBSVM07.realtek.com.tw>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_002_6FAB7C47BCF00940BB0999A99BE3547A1D76602ERTITMBSVM07real_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] ALC298 headphone noise
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

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D76602ERTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Dell platform with ALC298.
system enter to runtime suspend. Headphone had noise.
Let Headset Mic not shutup will solve this issue.

BR,
Kailang

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D76602ERTITMBSVM07real_
Content-Type: application/octet-stream;
	name="0000-alc298-headset-mic-no-shutup.patch"
Content-Description: 0000-alc298-headset-mic-no-shutup.patch
Content-Disposition: attachment;
	filename="0000-alc298-headset-mic-no-shutup.patch"; size=2976;
	creation-date="Fri, 10 May 2019 03:47:00 GMT";
	modification-date="Fri, 10 May 2019 08:37:20 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmNjhjYmEwZWI5ZGU4MDFiNTY1OTUwOWVkMmJiMDk0MzcxZTAzNjM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgMTAgTWF5IDIwMTkgMTY6Mjg6NTcgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEZpeHVwIGhlYWRwaG9uZSBub2lzZSB2aWEgcnVudGltZSBzdXNwZW5k
CgpEZWxsIHBsYXRmb3JtIHdpdGggQUxDMjk4LgpzeXN0ZW0gZW50ZXIgdG8gcnVudGltZSBzdXNw
ZW5kLiBIZWFkcGhvbmUgaGFkIG5vaXNlLgpMZXQgSGVhZHNldCBNaWMgbm90IHNodXR1cCB3aWxs
IHNvbHZlIHRoaXMgaXNzdWUuCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdA
cmVhbHRlay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMg
Yi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCBkYWNjY2FjYjVmZTAuLjczMzNi
Mzc2YmE0ZiAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIv
c291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTQ3OCwxMiArNDc4LDQwIEBAIHN0YXRp
YyB2b2lkIGFsY19hdXRvX3NldHVwX2VhcGQoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsIGJvb2wg
b24pCiAJCXNldF9lYXBkKGNvZGVjLCAqcCwgb24pOwogfQogCitzdGF0aWMgaW50IGZpbmRfZXh0
X21pY19waW4oc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpOworCitzdGF0aWMgdm9pZCBhbGNfaGVh
ZHNldF9taWNfbm9fc2h1dHVwKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKSB7CisJY29uc3Qgc3Ry
dWN0IGhkYV9waW5jZmcgKnBpbjsKKwlpbnQgaTsKKwlpbnQgbWljX3BpbiA9IGZpbmRfZXh0X21p
Y19waW4oY29kZWMpOworCS8qIGRvbid0IHNodXQgdXAgcGlucyB3aGVuIHVubG9hZGluZyB0aGUg
ZHJpdmVyOyBvdGhlcndpc2UgaXQgYnJlYWtzCisJICogdGhlIGRlZmF1bHQgcGluIHNldHVwIGF0
IHRoZSBuZXh0IGxvYWQgb2YgdGhlIGRyaXZlcgorCSAqLworCWlmIChjb2RlYy0+YnVzLT5zaHV0
ZG93bikKKwkJcmV0dXJuOworCXNuZF9hcnJheV9mb3JfZWFjaCgmY29kZWMtPmluaXRfcGlucywg
aSwgcGluKSB7CisJCS8qIHVzZSByZWFkIGhlcmUgZm9yIHN5bmNpbmcgYWZ0ZXIgaXNzdWluZyBl
YWNoIHZlcmIgKi8KKwkJaWYgKHBpbi0+bmlkICE9IG1pY19waW4pCisJCQlzbmRfaGRhX2NvZGVj
X3JlYWQoY29kZWMsIHBpbi0+bmlkLCAwLAorCQkJCQlBQ19WRVJCX1NFVF9QSU5fV0lER0VUX0NP
TlRST0wsIDApOworCX0KKwljb2RlYy0+cGluc19zaHV0dXAgPSAxOworfQorCiBzdGF0aWMgdm9p
ZCBhbGNfc2h1dHVwX3BpbnMoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiB7CiAJc3RydWN0IGFs
Y19zcGVjICpzcGVjID0gY29kZWMtPnNwZWM7Ci0KLQlpZiAoIXNwZWMtPm5vX3NodXR1cF9waW5z
KQotCQlzbmRfaGRhX3NodXR1cF9waW5zKGNvZGVjKTsKKwlzd2l0Y2ggKGNvZGVjLT5jb3JlLnZl
bmRvcl9pZCkgeworCQljYXNlIDB4MTBlYzAyODY6CisJCWNhc2UgMHgxMGVjMDI4ODoKKwkJY2Fz
ZSAweDEwZWMwMjk4OgorCQkJYWxjX2hlYWRzZXRfbWljX25vX3NodXR1cChjb2RlYyk7CisJCQli
cmVhazsKKwkJZGVmYXVsdDoKKwkJCWlmICghc3BlYy0+bm9fc2h1dHVwX3BpbnMpCisJCQkJc25k
X2hkYV9zaHV0dXBfcGlucyhjb2RlYyk7CisJCQlicmVhazsKKwkJfQogfQogCiAvKiBnZW5lcmlj
IHNodXR1cCBjYWxsYmFjazsKQEAgLTI5MjQsMjcgKzI5NTIsNiBAQCBzdGF0aWMgaW50IGFsYzI2
OV9wYXJzZV9hdXRvX2NvbmZpZyhzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAlyZXR1cm4gYWxj
X3BhcnNlX2F1dG9fY29uZmlnKGNvZGVjLCBhbGMyNjlfaWdub3JlLCBzc2lkcyk7CiB9CiAKLXN0
YXRpYyBpbnQgZmluZF9leHRfbWljX3BpbihzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYyk7Ci0KLXN0
YXRpYyB2b2lkIGFsYzI4Nl9zaHV0dXAoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCi17Ci0JY29u
c3Qgc3RydWN0IGhkYV9waW5jZmcgKnBpbjsKLQlpbnQgaTsKLQlpbnQgbWljX3BpbiA9IGZpbmRf
ZXh0X21pY19waW4oY29kZWMpOwotCS8qIGRvbid0IHNodXQgdXAgcGlucyB3aGVuIHVubG9hZGlu
ZyB0aGUgZHJpdmVyOyBvdGhlcndpc2UgaXQgYnJlYWtzCi0JICogdGhlIGRlZmF1bHQgcGluIHNl
dHVwIGF0IHRoZSBuZXh0IGxvYWQgb2YgdGhlIGRyaXZlcgotCSAqLwotCWlmIChjb2RlYy0+YnVz
LT5zaHV0ZG93bikKLQkJcmV0dXJuOwotCXNuZF9hcnJheV9mb3JfZWFjaCgmY29kZWMtPmluaXRf
cGlucywgaSwgcGluKSB7Ci0JCS8qIHVzZSByZWFkIGhlcmUgZm9yIHN5bmNpbmcgYWZ0ZXIgaXNz
dWluZyBlYWNoIHZlcmIgKi8KLQkJaWYgKHBpbi0+bmlkICE9IG1pY19waW4pCi0JCQlzbmRfaGRh
X2NvZGVjX3JlYWQoY29kZWMsIHBpbi0+bmlkLCAwLAotCQkJCQlBQ19WRVJCX1NFVF9QSU5fV0lE
R0VUX0NPTlRST0wsIDApOwotCX0KLQljb2RlYy0+cGluc19zaHV0dXAgPSAxOwotfQotCiBzdGF0
aWMgdm9pZCBhbGMyNjl2Yl90b2dnbGVfcG93ZXJfb3V0cHV0KHN0cnVjdCBoZGFfY29kZWMgKmNv
ZGVjLCBpbnQgcG93ZXJfdXApCiB7CiAJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgwNCwg
MSA8PCAxMSwgcG93ZXJfdXAgPyAoMSA8PCAxMSkgOiAwKTsKQEAgLTc3MjEsNyArNzcyOCw2IEBA
IHN0YXRpYyBpbnQgcGF0Y2hfYWxjMjY5KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCWNhc2Ug
MHgxMGVjMDI4NjoKIAljYXNlIDB4MTBlYzAyODg6CiAJCXNwZWMtPmNvZGVjX3ZhcmlhbnQgPSBB
TEMyNjlfVFlQRV9BTEMyODY7Ci0JCXNwZWMtPnNodXR1cCA9IGFsYzI4Nl9zaHV0dXA7CiAJCWJy
ZWFrOwogCWNhc2UgMHgxMGVjMDI5ODoKIAkJc3BlYy0+Y29kZWNfdmFyaWFudCA9IEFMQzI2OV9U
WVBFX0FMQzI5ODsK

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D76602ERTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D76602ERTITMBSVM07real_--
