Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A193B16593D
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 09:32:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2627416B0;
	Thu, 20 Feb 2020 09:32:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2627416B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582187573;
	bh=RqvmcNINXK8FhamMSqQRnanM0AEULVKrMqWScWUc/fA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kp0K0BzuwxwJTxmqgvQTSIApxiouoRHE9J/XYKVdTPfqojRpoyZsloqwm4SP569SF
	 7Zu5NiFJgQeli+pINwaRc6ra/yxwNR0xsbTyKII4VM25kRZSTQn6LUWvz1U3C9h6Hy
	 Bac7/hkRcbIHN4t6+lh1psBD/kKLcoVK0SJcVdzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 149ADF8011D;
	Thu, 20 Feb 2020 09:31:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C723FF80150; Thu, 20 Feb 2020 09:31:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95A40F8014A
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 09:31:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95A40F8014A
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 01K8V0pR014322,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 01K8V0pR014322
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Feb 2020 16:31:00 +0800
Received: from RTEXMB02.realtek.com.tw (172.21.6.95) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 20 Feb 2020 16:31:00 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 20 Feb 2020 16:30:59 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f]) by
 RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f%6]) with mapi id
 15.01.1779.005; Thu, 20 Feb 2020 16:30:59 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: RE: Enable Headset Mic for Dell desktop
Thread-Topic: Enable Headset Mic for Dell desktop
Thread-Index: AdXnx8TP23W6Nsc3Tzmxz+zjJkuQPAAADXlQ
Date: Thu, 20 Feb 2020 08:30:59 +0000
Message-ID: <b9da28d772ef43088791b0f3675929e7@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.169]
Content-Type: multipart/mixed;
 boundary="_002_b9da28d772ef43088791b0f3675929e7realtekcom_"
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

--_002_b9da28d772ef43088791b0f3675929e7realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry! Forgot attach file.

> -----Original Message-----
> From: Kailang
> Sent: Thursday, February 20, 2020 4:30 PM
> To: Takashi Iwai (tiwai@suse.de) <tiwai@suse.de>
> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
> Subject: Enable Headset Mic for Dell desktop
>=20
> Hi Takashi,
>=20
> Attach patch was supported headset Mic.
>=20
> BR,
> Kailang

--_002_b9da28d772ef43088791b0f3675929e7realtekcom_
Content-Type: application/octet-stream; name="0001-dell-alc256-0x098d.patch"
Content-Description: 0001-dell-alc256-0x098d.patch
Content-Disposition: attachment; filename="0001-dell-alc256-0x098d.patch";
	size=1297; creation-date="Thu, 20 Feb 2020 08:25:58 GMT";
	modification-date="Thu, 20 Feb 2020 07:29:37 GMT"
Content-Transfer-Encoding: base64

RnJvbSBhYjA4MzRlNDUzMmQ1NzFkYTQ3OGRiMmNjNmM5ZDczNWQ2YzIwNjJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMjAgRmViIDIwMjAgMTU6MjE6NTQgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFkZCBIZWFkc2V0IE1pYyBzdXBwb3J0ZWQKCkRlbGwgZGVza3RvcCBw
bGF0Zm9ybSBzdXBwb3J0ZWQgaGVhZHNldCBNaWMuCkFkZCBwaW4gdmVyYiB0byBlbmFibGUgaGVh
ZHNldCBNaWMuClRoaXMgcGxhdGZvcm0gb25seSBzdXBwb3J0IGZpeGVkIHR5cGUgaGVhZHNldCBm
b3IgSXBob25lIHR5cGUuCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVh
bHRlay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9z
b3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCAzMWJlZTA1MTIzMzQuLjEyOGM3ZTlk
ZjZkZSAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291
bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTcxMTcsNiArNzExNyw4IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7CiAJU05EX1BD
SV9RVUlSSygweDEwMjgsIDB4MDkzNSwgIkRlbGwiLCBBTEMyNzRfRklYVVBfREVMTF9BSU9fTElO
RU9VVF9WRVJCKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAyOCwgMHgwOTdlLCAiRGVsbCBQcmVjaXNp
b24iLCBBTEMyODlfRklYVVBfRFVBTF9TUEspLAogCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDA5
N2QsICJEZWxsIFByZWNpc2lvbiIsIEFMQzI4OV9GSVhVUF9EVUFMX1NQSyksCisJU05EX1BDSV9R
VUlSSygweDEwMjgsIDB4MDk4ZCwgIkRlbGwgUHJlY2lzaW9uIiwgQUxDMjMzX0ZJWFVQX0FTVVNf
TUlDX05PX1BSRVNFTkNFKSwKKwlTTkRfUENJX1FVSVJLKDB4MTAyOCwgMHgwOWJmLCAiRGVsbCBQ
cmVjaXNpb24iLCBBTEMyMzNfRklYVVBfQVNVU19NSUNfTk9fUFJFU0VOQ0UpLAogCVNORF9QQ0lf
UVVJUksoMHgxMDI4LCAweDE2NGEsICJEZWxsIiwgQUxDMjkzX0ZJWFVQX0RFTEwxX01JQ19OT19Q
UkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDEwMjgsIDB4MTY0YiwgIkRlbGwiLCBBTEMyOTNf
RklYVVBfREVMTDFfTUlDX05PX1BSRVNFTkNFKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHgx
NTg2LCAiSFAiLCBBTEMyNjlfRklYVVBfSFBfTVVURV9MRURfTUlDMiksCg==

--_002_b9da28d772ef43088791b0f3675929e7realtekcom_--
