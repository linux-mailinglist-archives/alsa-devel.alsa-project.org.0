Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 137A2153EE3
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 07:50:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A16DF9F6;
	Thu,  6 Feb 2020 07:49:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A16DF9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580971836;
	bh=JzQTd+u91gtviSHMU37TqUO7Oa9in7qzLyIJP8zHWQY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AVA20Z0BetCHUfL/OhHlLxun0Degt/UVjTKLxazwsUJ7Kbr1tqhAMEKftrhvxDWh+
	 /djKoA8prTB486eqpepHgI0jST3Kx9UI7QNa+9k4lCBAKq+/lVxZuaOPTGJkCtlTwq
	 DFDU5LRDosj+w6VXb89iOKOyl7jF8IxvDhrmmcXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87490F801DB;
	Thu,  6 Feb 2020 07:48:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CD2FF80162; Thu,  6 Feb 2020 07:48:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=HTML_MESSAGE,PRX_APP_ATTACH,
 PRX_BODY_135,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDDBFF800AB
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 07:48:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDDBFF800AB
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 0166mZ0m022210,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 0166mZ0m022210
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 6 Feb 2020 14:48:35 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 6 Feb 2020 14:48:35 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f]) by
 RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f%6]) with mapi id
 15.01.1779.005; Thu, 6 Feb 2020 14:48:35 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Thread-Topic: HP ALC671 Platform update
Thread-Index: AdXcuO22HOtpCUL3S7e8b7qBqphqfQ==
Date: Thu, 6 Feb 2020 06:48:35 +0000
Message-ID: <8863d36977ea44b4a50dc3de26f1b9be@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
Content-Type: multipart/mixed;
 boundary="_004_8863d36977ea44b4a50dc3de26f1b9berealtekcom_"
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Hui Wang <hui.wang@canonical.com>,
 " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] HP ALC671 Platform update
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

--_004_8863d36977ea44b4a50dc3de26f1b9berealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

HP want to keep BIOS verb table setting for release platform.
So, one of platform need to add 0x19 pin for verb quirk.
This patch was verified by Canonical.

Many Thanks.

BR,
Kailang

--_004_8863d36977ea44b4a50dc3de26f1b9berealtekcom_
Content-Type: application/octet-stream;
	name="0000-hp-alc671-add-0x19-pin-verb.patch"
Content-Description: 0000-hp-alc671-add-0x19-pin-verb.patch
Content-Disposition: attachment;
	filename="0000-hp-alc671-add-0x19-pin-verb.patch"; size=1017;
	creation-date="Wed, 05 Feb 2020 07:44:01 GMT";
	modification-date="Wed, 05 Feb 2020 07:55:24 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmYWZmODY0MmFjNWE1ZGY1ZTRiZmE5NGU0MzI2NmI5N2ZkM2E3YjQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFdlZCwgNSBGZWIgMjAyMCAxNTo0MDowMSArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gRml4ZWQgb25lIG9mIEhQIEFMQzY3MSBwbGF0Zm9ybSBIZWFkc2V0IE1p
YyBzdXBwb3J0ZWQKCkhQIHdhbnQgdG8ga2VlcCBCSU9TIHZlcmIgdGFibGUgZm9yIHJlbGVhc2Ug
cGxhdGZvcm0uClNvLCBpdCBuZWVkIHRvIGFkZCAweDE5IHBpbiBmb3IgcXVpcmsuCgpGaXhlczog
NWFmMjkwMjhmZDZkICgiQUxTQTogaGRhL3JlYWx0ZWsgLSBBZGQgSGVhZHNldCBNaWMgc3VwcG9y
dGVkIGZvciBIUCBjUEMiKQpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVh
bHRlay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9z
b3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCAzYjM4YTEzYWJiN2EuLjQ3NzBmYjNm
NTFmYiAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291
bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTkxMTEsNiArOTExMSw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgc25kX2hkYV9waW5fcXVpcmsgYWxjNjYyX3Bpbl9maXh1cF90YmxbXSA9IHsK
IAlTTkRfSERBX1BJTl9RVUlSSygweDEwZWMwNjcxLCAweDEwM2MsICJIUCBjUEMiLCBBTEM2NzFf
RklYVVBfSFBfSEVBRFNFVF9NSUMyLAogCQl7MHgxNCwgMHgwMTAxNDAxMH0sCiAJCXsweDE3LCAw
eDkwMTcwMTUwfSwKKwkJezB4MTksIDB4MDJhMTEwNjB9LAogCQl7MHgxYiwgMHgwMTgxMzAzMH0s
CiAJCXsweDIxLCAweDAyMjExMDIwfSksCiAJU05EX0hEQV9QSU5fUVVJUksoMHgxMGVjMDY3MSwg
MHgxMDNjLCAiSFAgY1BDIiwgQUxDNjcxX0ZJWFVQX0hQX0hFQURTRVRfTUlDMiwK

--_004_8863d36977ea44b4a50dc3de26f1b9berealtekcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_004_8863d36977ea44b4a50dc3de26f1b9berealtekcom_--
