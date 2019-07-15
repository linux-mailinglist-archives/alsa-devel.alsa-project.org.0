Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BA06825B
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jul 2019 04:52:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6907A1666;
	Mon, 15 Jul 2019 04:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6907A1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563159143;
	bh=bdB7eUvcVvMZaZmZM9MnMRetE/1fIQ2SkTCAlkFNdG8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MpmaVD9ydzPm7+JaQgnstwZHXGoB7k7o7vfRxSX/C4jypBPJSLbeec/GQTg7XGSA3
	 bJ6Eko57A7GWYkbeWFT1v9L/mFnIcScIUzyg4fyY8K+9b+AN4XbIa4LQP+uWLCpnLx
	 z2EZRTZezR8/hzsmiRtg5ojAsNzE5hKjVn9QyhYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86B6DF80368;
	Mon, 15 Jul 2019 04:50:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19898F80367; Mon, 15 Jul 2019 04:50:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=HTML_MESSAGE,PRX_APP_ATTACH,
 PRX_BODY_135,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC200F800D8
 for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2019 04:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC200F800D8
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x6F2oL7q018901,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV02.realtek.com.tw[172.21.6.19])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x6F2oL7q018901
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 15 Jul 2019 10:50:22 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCASV02.realtek.com.tw ([::1]) with mapi id 14.03.0439.000; Mon, 15 Jul
 2019 10:50:21 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Thread-Topic: Dell ALC295 Headphone Mic can't record
Thread-Index: AdU6t+aIHx4kf8K9Q+WkE9jcrCnJJQ==
Date: Mon, 15 Jul 2019 02:50:20 +0000
Message-ID: <6FAB7C47BCF00940BB0999A99BE3547A1D769F1A@RTITMBSVM07.realtek.com.tw>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_004_6FAB7C47BCF00940BB0999A99BE3547A1D769F1ARTITMBSVM07real_"
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] Dell ALC295 Headphone Mic can't record
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

--_004_6FAB7C47BCF00940BB0999A99BE3547A1D769F1ARTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch was for Dell ALC295 Headphone Mic can't record.
Thanks.

BR,
Kailang

--_004_6FAB7C47BCF00940BB0999A99BE3547A1D769F1ARTITMBSVM07real_
Content-Type: application/octet-stream;
	name="0000-dell-alc295-HP-Mic-fail.patch"
Content-Description: 0000-dell-alc295-HP-Mic-fail.patch
Content-Disposition: attachment;
	filename="0000-dell-alc295-HP-Mic-fail.patch"; size=1176;
	creation-date="Mon, 15 Jul 2019 02:48:01 GMT";
	modification-date="Mon, 15 Jul 2019 02:47:06 GMT"
Content-Transfer-Encoding: base64

RnJvbSAxODJmOWI0ZjEzYmQyNzNhMmM5ZTg2ZTMwMjZmYzZhMjEwMmY1YWY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IE1vbiwgMTUgSnVsIDIwMTkgMTA6NDE6NTAgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEZpeGVkIEhlYWRwaG9uZSBNaWMgY2FuJ3QgcmVjb3JkIG9uIERlbGwK
IHBsYXRmb3JtCgpJdCBhc3NpZ25lZCB0byB3cm9uZyBtb2RlbC4gU28sIFRoZSBoZWFkcGhvbmUg
TWljIGNhbid0IHdvcmsuCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVh
bHRlay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9z
b3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCAwZjc3NjQ0NGFiODYuLjE5NmRlNTFm
OGRjNiAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291
bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTc2NzAsOSArNzY3MCwxMiBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHNuZF9oZGFfcGluX3F1aXJrIGFsYzI2OV9waW5fZml4dXBfdGJsW10gPSB7
CiAJCXsweDEyLCAweDkwYTYwMTMwfSwKIAkJezB4MTcsIDB4OTAxNzAxMTB9LAogCQl7MHgyMSwg
MHgwMzIxMTAyMH0pLAotCVNORF9IREFfUElOX1FVSVJLKDB4MTBlYzAyOTUsIDB4MTAyOCwgIkRl
bGwiLCBBTEMyNjlfRklYVVBfREVMTDFfTUlDX05PX1BSRVNFTkNFLAorCVNORF9IREFfUElOX1FV
SVJLKDB4MTBlYzAyOTUsIDB4MTAyOCwgIkRlbGwiLCBBTEMyNjlfRklYVVBfREVMTDRfTUlDX05P
X1BSRVNFTkNFLAogCQl7MHgxNCwgMHg5MDE3MDExMH0sCiAJCXsweDIxLCAweDA0MjExMDIwfSks
CisJU05EX0hEQV9QSU5fUVVJUksoMHgxMGVjMDI5NSwgMHgxMDI4LCAiRGVsbCIsIEFMQzI2OV9G
SVhVUF9ERUxMNF9NSUNfTk9fUFJFU0VOQ0UsCisJCXsweDE0LCAweDkwMTcwMTEwfSwKKwkJezB4
MjEsIDB4MDQyMTEwMzB9KSwKIAlTTkRfSERBX1BJTl9RVUlSSygweDEwZWMwMjk1LCAweDEwMjgs
ICJEZWxsIiwgQUxDMjY5X0ZJWFVQX0RFTEwxX01JQ19OT19QUkVTRU5DRSwKIAkJQUxDMjk1X1NU
QU5EQVJEX1BJTlMsCiAJCXsweDE3LCAweDIxMDE0MDIwfSwK

--_004_6FAB7C47BCF00940BB0999A99BE3547A1D769F1ARTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_004_6FAB7C47BCF00940BB0999A99BE3547A1D769F1ARTITMBSVM07real_--
