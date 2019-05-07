Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EDD15EAA
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 09:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0789717C0;
	Tue,  7 May 2019 09:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0789717C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557215730;
	bh=1KHPxPRWI5hsz4Yj3y3+Ve0pju+Tt1sgviBbBJLYZmY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MT5tMPQWzuRCqV4BRN0P/QuJXApf0lwbOZ/Bpq9nHJVKpAoLG1jKazHfHPTHi8vwK
	 qmyrJlHyI+ONyW9uQ5JLSVcFcJyAqktLMJC8dlQEAHSr776i9fzTZvYzaCqLmU6NiI
	 AZiNvnX0qU7pxuCK+HgkdtyNBqcQh43eaLv+QKBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 147D1F89673;
	Tue,  7 May 2019 09:53:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18592F89674; Tue,  7 May 2019 09:53:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 662E2F80726
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 09:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 662E2F80726
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x477rPkZ002100,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcasv01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x477rPkZ002100
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=NOT);
 Tue, 7 May 2019 15:53:25 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCASV01.realtek.com.tw ([::1]) with mapi id 14.03.0415.000; Tue, 7 May
 2019 15:53:25 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Thread-Topic: Support low power consumption for ALC3254
Thread-Index: AdUEqfFNg0PmEGXzT5G9nIHf8haChg==
Date: Tue, 7 May 2019 07:53:24 +0000
Message-ID: <6FAB7C47BCF00940BB0999A99BE3547A1D765A46@RTITMBSVM07.realtek.com.tw>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_002_6FAB7C47BCF00940BB0999A99BE3547A1D765A46RTITMBSVM07real_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] Support low power consumption for ALC3254
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

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D765A46RTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Chrome OS want to support low power consumption.
This patch will support low consumption.

Thanks.

BR,
Kailang

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D765A46RTITMBSVM07real_
Content-Type: application/octet-stream;
	name="0002-chrome-alc3254-power-save.patch"
Content-Description: 0002-chrome-alc3254-power-save.patch
Content-Disposition: attachment;
	filename="0002-chrome-alc3254-power-save.patch"; size=4505;
	creation-date="Mon, 06 May 2019 07:10:58 GMT";
	modification-date="Tue, 07 May 2019 07:49:04 GMT"
Content-Transfer-Encoding: base64

RnJvbSAwN2YyYmUzMmE0Y2JmMmQ2ZGUwNmM1Y2Q3ZmU3YzAyNjZiMDUxMmRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IE1vbiwgNiBNYXkgMjAxOSAxNTowOTo0MiArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gU3VwcG9ydCBsb3cgcG93ZXIgY29uc3VtcHRpb24gZm9yIEFMQzI5NQoK
RW50ZXIgdG8gY2xvc2UgbW9yZSBwb3dlciBjb250cm9sIHdpZGdldHMgYXQgc3VzcGVuZC4KUmVt
b3ZlIGhwX3BpbiBjaGVjay4gQWRkIHRoZSBkZWZhdWx0IHBpbiAweDIxIGFzIGhlYWRwaG9uZS4K
U3VwcG9ydGVkIGxvdyBwb3dlciBjb25zdW1wdGlvbiwgaXQgbXVzdCB0byBkbyBkZXBvcCBwcm9j
ZWR1cmUgd2hlbiBoZWFkc2V0IGphY2sgd2FzIHBsdWdnZWQgb3IgdW5wbHVnZ2VkLgpTbywgYWxj
MjI1X2luaXQoKSBhbmQgYWxjMjI1X3NodXR1cCgpIG11c3QgdG8gcnVuIGRlbGF5IHdoZW4gaGVh
ZHNldCBqYWNrIHdhcyBwbHVnZ2VkIG9yIHVucGx1Z2dlZC4KSWYgZGVwb3AgcHJvY2VkdXJlIG5v
dCBydW4gd2l0aCBkZWxheSwgaXQgd2lsbCBoYXMgYSBjaGFuY2UgdG8gbGV0IHBvd2VyIGNvbnN1
bXB0aW9uIHJhaXNlIGhpZ2guCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdA
cmVhbHRlay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMg
Yi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCAxZDBlMGYyZTY1MjYuLmYxY2Rk
NDY3ZDRhYiAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIv
c291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTExOSw2ICsxMTksNyBAQCBzdHJ1Y3Qg
YWxjX3NwZWMgewogCXVuc2lnbmVkIGludCBub19kZXBvcF9kZWxheToxOwogCXVuc2lnbmVkIGlu
dCBkb25lX2hwX2luaXQ6MTsKIAl1bnNpZ25lZCBpbnQgbm9fc2h1dHVwX3BpbnM6MTsKKwl1bnNp
Z25lZCBpbnQgdWx0cmFfbG93X3Bvd2VyOjE7CiAKIAkvKiBmb3IgUExMIGZpeCAqLwogCWhkYV9u
aWRfdCBwbGxfbmlkOwpAQCAtMzI2OCw5ICszMjY5LDcgQEAgc3RhdGljIHZvaWQgYWxjMjI1X2lu
aXQoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJaGRhX25pZF90IGhwX3BpbiA9IGFsY19nZXRf
aHBfcGluKHNwZWMpOwogCWJvb2wgaHAxX3Bpbl9zZW5zZSwgaHAyX3Bpbl9zZW5zZTsKIAotCWlm
ICghaHBfcGluKQotCQlyZXR1cm47Ci0KKwlocF9waW4gPyBocF9waW4gOiAweDIxOwogCW1zbGVl
cCgzMCk7CiAKIAlocDFfcGluX3NlbnNlID0gc25kX2hkYV9qYWNrX2RldGVjdChjb2RlYywgaHBf
cGluKTsKQEAgLTMyODAsMjUgKzMyNzksMzEgQEAgc3RhdGljIHZvaWQgYWxjMjI1X2luaXQoc3Ry
dWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJCW1zbGVlcCgyKTsKIAogCWFsY191cGRhdGVfY29lZmV4
X2lkeChjb2RlYywgMHg1NywgMHgwNCwgMHgwMDA3LCAweDEpOyAvKiBMb3cgcG93ZXIgKi8KKwlp
ZiAoc3BlYy0+dWx0cmFfbG93X3Bvd2VyKSB7CisJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMs
IDB4MDgsIDB4MGYgPDwgMiwgMzw8Mik7CisJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4
MGUsIDc8PDYsIDc8PDYpOworCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDMzLCAxPDwx
MSwgMCk7CisJCW1zbGVlcCgzMCk7CisJfQogCi0JaWYgKGhwMV9waW5fc2Vuc2UpCisJaWYgKGhw
MV9waW5fc2Vuc2UgfHwgc3BlYy0+dWx0cmFfbG93X3Bvd2VyKQogCQlzbmRfaGRhX2NvZGVjX3dy
aXRlKGNvZGVjLCBocF9waW4sIDAsCiAJCQkgICAgQUNfVkVSQl9TRVRfQU1QX0dBSU5fTVVURSwg
QU1QX09VVF9NVVRFKTsKIAlpZiAoaHAyX3Bpbl9zZW5zZSkKIAkJc25kX2hkYV9jb2RlY193cml0
ZShjb2RlYywgMHgxNiwgMCwKIAkJCSAgICBBQ19WRVJCX1NFVF9BTVBfR0FJTl9NVVRFLCBBTVBf
T1VUX01VVEUpOwogCi0JaWYgKGhwMV9waW5fc2Vuc2UgfHwgaHAyX3Bpbl9zZW5zZSkKKwlpZiAo
aHAxX3Bpbl9zZW5zZSB8fCBocDJfcGluX3NlbnNlIHx8IHNwZWMtPnVsdHJhX2xvd19wb3dlcikK
IAkJbXNsZWVwKDg1KTsKIAotCWlmIChocDFfcGluX3NlbnNlKQorCWlmIChocDFfcGluX3NlbnNl
IHx8IHNwZWMtPnVsdHJhX2xvd19wb3dlcikKIAkJc25kX2hkYV9jb2RlY193cml0ZShjb2RlYywg
aHBfcGluLCAwLAogCQkJICAgIEFDX1ZFUkJfU0VUX1BJTl9XSURHRVRfQ09OVFJPTCwgUElOX09V
VCk7CiAJaWYgKGhwMl9waW5fc2Vuc2UpCiAJCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIDB4
MTYsIDAsCiAJCQkgICAgQUNfVkVSQl9TRVRfUElOX1dJREdFVF9DT05UUk9MLCBQSU5fT1VUKTsK
IAotCWlmIChocDFfcGluX3NlbnNlIHx8IGhwMl9waW5fc2Vuc2UpCisJaWYgKGhwMV9waW5fc2Vu
c2UgfHwgaHAyX3Bpbl9zZW5zZSB8fCBzcGVjLT51bHRyYV9sb3dfcG93ZXIpCiAJCW1zbGVlcCgx
MDApOwogCiAJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHg0YSwgMyA8PCAxMCwgMCk7CkBA
IC0zMzExLDExICszMzE2LDcgQEAgc3RhdGljIHZvaWQgYWxjMjI1X3NodXR1cChzdHJ1Y3QgaGRh
X2NvZGVjICpjb2RlYykKIAloZGFfbmlkX3QgaHBfcGluID0gYWxjX2dldF9ocF9waW4oc3BlYyk7
CiAJYm9vbCBocDFfcGluX3NlbnNlLCBocDJfcGluX3NlbnNlOwogCi0JaWYgKCFocF9waW4pIHsK
LQkJYWxjMjY5X3NodXR1cChjb2RlYyk7Ci0JCXJldHVybjsKLQl9Ci0KKwlocF9waW4gPyBocF9w
aW4gOiAweDIxOwogCS8qIDNrIHB1bGwgbG93IGNvbnRyb2wgZm9yIEhlYWRzZXQgamFjay4gKi8K
IAlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDRhLCAwLCAzIDw8IDEwKTsKIApAQCAtMzMy
NSwyOCArMzMyNiwzNiBAQCBzdGF0aWMgdm9pZCBhbGMyMjVfc2h1dHVwKHN0cnVjdCBoZGFfY29k
ZWMgKmNvZGVjKQogCWlmIChocDFfcGluX3NlbnNlIHx8IGhwMl9waW5fc2Vuc2UpCiAJCW1zbGVl
cCgyKTsKIAotCWlmIChocDFfcGluX3NlbnNlKQorCWlmIChocDFfcGluX3NlbnNlIHx8IHNwZWMt
PnVsdHJhX2xvd19wb3dlcikKIAkJc25kX2hkYV9jb2RlY193cml0ZShjb2RlYywgaHBfcGluLCAw
LAogCQkJICAgIEFDX1ZFUkJfU0VUX0FNUF9HQUlOX01VVEUsIEFNUF9PVVRfTVVURSk7CiAJaWYg
KGhwMl9waW5fc2Vuc2UpCiAJCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIDB4MTYsIDAsCiAJ
CQkgICAgQUNfVkVSQl9TRVRfQU1QX0dBSU5fTVVURSwgQU1QX09VVF9NVVRFKTsKIAotCWlmICho
cDFfcGluX3NlbnNlIHx8IGhwMl9waW5fc2Vuc2UpCisJaWYgKGhwMV9waW5fc2Vuc2UgfHwgaHAy
X3Bpbl9zZW5zZSB8fCBzcGVjLT51bHRyYV9sb3dfcG93ZXIpCiAJCW1zbGVlcCg4NSk7CiAKLQlp
ZiAoaHAxX3Bpbl9zZW5zZSkKKwlpZiAoaHAxX3Bpbl9zZW5zZSB8fCBzcGVjLT51bHRyYV9sb3df
cG93ZXIpCiAJCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIGhwX3BpbiwgMCwKIAkJCSAgICBB
Q19WRVJCX1NFVF9QSU5fV0lER0VUX0NPTlRST0wsIDB4MCk7CiAJaWYgKGhwMl9waW5fc2Vuc2Up
CiAJCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIDB4MTYsIDAsCiAJCQkgICAgQUNfVkVSQl9T
RVRfUElOX1dJREdFVF9DT05UUk9MLCAweDApOwogCi0JaWYgKGhwMV9waW5fc2Vuc2UgfHwgaHAy
X3Bpbl9zZW5zZSkKKwlpZiAoaHAxX3Bpbl9zZW5zZSB8fCBocDJfcGluX3NlbnNlIHx8IHNwZWMt
PnVsdHJhX2xvd19wb3dlcikKIAkJbXNsZWVwKDEwMCk7CiAKIAlhbGNfYXV0b19zZXR1cF9lYXBk
KGNvZGVjLCBmYWxzZSk7CiAJYWxjX3NodXR1cF9waW5zKGNvZGVjKTsKKwlpZiAoc3BlYy0+dWx0
cmFfbG93X3Bvd2VyKSB7CisJCW1zbGVlcCg1MCk7CisJCWFsY191cGRhdGVfY29lZl9pZHgoY29k
ZWMsIDB4MDgsIDB4MGYgPDwgMiwgMHgwYyA8PCAyKTsKKwkJYWxjX3VwZGF0ZV9jb2VmX2lkeChj
b2RlYywgMHgwZSwgNzw8NiwgMCk7CisJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4MzMs
IDE8PDExLCAxPDwxMSk7CisJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4NGEsIDM8PDQs
IDI8PDQpOworCQltc2xlZXAoMzApOworCX0KIH0KIAogc3RhdGljIHZvaWQgYWxjX2RlZmF1bHRf
aW5pdChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKQEAgLTU1MjUsNiArNTUzNCw5IEBAIHN0YXRp
YyB2b2lkIGFsYzI5NV9maXh1cF9jaHJvbWVib29rKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAog
CQkJCSAgICBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwICpmaXgsIGludCBhY3Rpb24pCiB7CiAJc3dp
dGNoIChhY3Rpb24pIHsKKwljYXNlIEhEQV9GSVhVUF9BQ1RfUFJFX1BST0JFOgorCQlzcGVjLT51
bHRyYV9sb3dfcG93ZXIgPSB0cnVlOworCQlicmVhazsKIAljYXNlIEhEQV9GSVhVUF9BQ1RfSU5J
VDoKIAkJc3dpdGNoIChjb2RlYy0+Y29yZS52ZW5kb3JfaWQpIHsKIAkJY2FzZSAweDEwZWMwMjk1
Ogo=

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D765A46RTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D765A46RTITMBSVM07real_--
