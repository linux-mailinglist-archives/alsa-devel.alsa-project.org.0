Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C849D160AB
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 11:19:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BB47180C;
	Tue,  7 May 2019 11:18:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BB47180C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557220750;
	bh=c5MhSTAxnw++0tui8kO2lx+f9vzudbg/GemQ9iAUTZs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l7JsNr62w1n9DNKc/CLXArLm5WOyY07DUJYlsbCGYBeMdgfWan9VN+QqVOYpL3dcu
	 y9a87YmCVprsnC7O8ZPE2rTqkmsDt52o46qcm0z/UU2fbskxTLKIyBhZyhKJsLugWa
	 /L1Ow9Pu84FX4f1/7h96q9GECdRz6JXDtYoWx4Ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3396EF89674;
	Tue,  7 May 2019 11:17:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40BE0F89682; Tue,  7 May 2019 11:17:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2F26F807B5
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 11:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2F26F807B5
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x479HGvR014480,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcas11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x479HGvR014480
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 7 May 2019 17:17:16 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCAS11.realtek.com.tw ([fe80::7c6d:ced5:c4ff:8297%15]) with mapi id
 14.03.0399.000; Tue, 7 May 2019 17:17:16 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Thread-Topic: move eapd coef function before ACT_PRE_PROBE state
Thread-Index: AdT/J/zgDi+/s6pzRJ+XG6C5XTeJJQErwFhQADei07A=
Date: Tue, 7 May 2019 09:17:15 +0000
Message-ID: <6FAB7C47BCF00940BB0999A99BE3547A1D765A9D@RTITMBSVM07.realtek.com.tw>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_002_6FAB7C47BCF00940BB0999A99BE3547A1D765A9DRTITMBSVM07real_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] FW: move eapd coef function before ACT_PRE_PROBE state
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

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D765A9DRTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

This one.

-----Original Message-----
From: Kailang=20
Sent: Monday, May 6, 2019 2:46 PM
To: Takashi Iwai (tiwai@suse.de) <tiwai@suse.de>
Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
Subject: RE: move eapd coef function before ACT_PRE_PROBE state

Hi Takashi,

Are you available for apply this ?
Thanks.

BR,
Kailang

> -----Original Message-----
> From: Kailang
> Sent: Tuesday, April 30, 2019 3:41 PM
> To: Takashi Iwai (tiwai@suse.de) <tiwai@suse.de>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: move eapd coef function before ACT_PRE_PROBE state
>=20
> Hi Takashi,
>=20
> alc_fill_eapd_coef(),this function was change EAPD control to default.
> Default was set EAPD by verb control.
> This function was run in ACT_INIT state.
> Move it to ACT_PRE_PROBE above. It will have a chance to change EAPD=20
> control on ACT_PRE_PROBE state. It could change control by 0x20 coef bit.
>=20
> BR,
> Kailang

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D765A9DRTITMBSVM07real_
Content-Type: application/octet-stream;
	name="0000-move-eapd-coef-func.patch"
Content-Description: 0000-move-eapd-coef-func.patch
Content-Disposition: attachment; filename="0000-move-eapd-coef-func.patch";
	size=1327; creation-date="Fri, 26 Apr 2019 09:20:24 GMT";
	modification-date="Fri, 26 Apr 2019 09:28:26 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyM2M5YTFjMzI4OGM0ZTc4MjU1ZjEzM2E0ZDljNDhmNTg0MmUwM2U2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgMjYgQXByIDIwMTkgMTc6MTY6NDggKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIE1vdmUgRVBBRCBieSB2ZXJiIGZ1bmN0aW9uCgphbGNfZmlsbF9lYXBk
X2NvZWYoKSx0aGlzIGZ1bmN0aW9uIHdhcyBjaGFuZ2UgRUFQRCBjb250cm9sIHRvIGRlZmF1bHQu
CkRlZmF1bHQgd2FzIHNldCBFQVBEIGJ5IHZlcmIgY29udHJvbC4KVGhpcyBmdW5jdGlvbiB3YXMg
cnVuIGluIEFDVF9JTklUIHN0YXRlLgpNb3ZlIGl0IHRvIEFDVF9QUkVfUFJPQkUgYWJvdmUuIEl0
IHdpbGwgaGF2ZSBhIGNoYW5jZSB0byBjaGFuZ2UgRUFQRCBjb250cm9sCm9uIEFDVF9QUkVfUFJP
QkUgc3RhdGUuIEl0IGNvdWxkIGNoYW5nZSBjb250cm9sIGJ5IDB4MjAgY29lZiBiaXQuCgpTaWdu
ZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CgpkaWZmIC0tZ2l0
IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3Jl
YWx0ZWsuYwppbmRleCAxZDBlMGYyZTY1MjYuLjc1NTNmNzA0Y2I3ZiAxMDA2NDQKLS0tIGEvc291
bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFs
dGVrLmMKQEAgLTUwMSw3ICs1MDEsNiBAQCBzdGF0aWMgdm9pZCBhbGNfZWFwZF9zaHV0dXAoc3Ry
dWN0IGhkYV9jb2RlYyAqY29kZWMpCiAvKiBnZW5lcmljIEVBUEQgaW5pdGlhbGl6YXRpb24gKi8K
IHN0YXRpYyB2b2lkIGFsY19hdXRvX2luaXRfYW1wKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLCBp
bnQgdHlwZSkKIHsKLQlhbGNfZmlsbF9lYXBkX2NvZWYoY29kZWMpOwogCWFsY19hdXRvX3NldHVw
X2VhcGQoY29kZWMsIHRydWUpOwogCWFsY193cml0ZV9ncGlvKGNvZGVjKTsKIAlzd2l0Y2ggKHR5
cGUpIHsKQEAgLTEwODUsNiArMTA4NCw3IEBAIHN0YXRpYyBpbnQgYWxjX2FsbG9jX3NwZWMoc3Ry
dWN0IGhkYV9jb2RlYyAqY29kZWMsIGhkYV9uaWRfdCBtaXhlcl9uaWQpCiAJCXJldHVybiAtRU5P
TUVNOwogCWNvZGVjLT5zcGVjID0gc3BlYzsKIAlzbmRfaGRhX2dlbl9zcGVjX2luaXQoJnNwZWMt
Pmdlbik7CisJYWxjX2ZpbGxfZWFwZF9jb2VmKGNvZGVjKTsKIAlzcGVjLT5nZW4ubWl4ZXJfbmlk
ID0gbWl4ZXJfbmlkOwogCXNwZWMtPmdlbi5vd25fZWFwZF9jdGwgPSAxOwogCWNvZGVjLT5zaW5n
bGVfYWRjX2FtcCA9IDE7Cg==

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D765A9DRTITMBSVM07real_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_6FAB7C47BCF00940BB0999A99BE3547A1D765A9DRTITMBSVM07real_--
