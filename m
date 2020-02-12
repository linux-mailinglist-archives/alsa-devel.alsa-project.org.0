Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C872D15A265
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 08:49:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 404E8165F;
	Wed, 12 Feb 2020 08:48:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 404E8165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581493741;
	bh=guh4IOmdEYu+ANwm6VPLEKvJSi2e9+KN5l8Z79723rM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gNxQJ6fuNx3b1eW+FXKJahauql//j0lCyUtCDmPHv6rumP62H7z0EPPmwT/Q9dPcb
	 omDqtwre7Nm4UnsB8d9ctR8R52X8TQZ4xs6p/cWKT1zQqsCB3q57nqOSoYYeuvKYwy
	 ezusftwi+CsyzFNtTNe8/sOIpTclqWtgZYSGqHhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6011CF80158;
	Wed, 12 Feb 2020 08:47:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48FC4F80157; Wed, 12 Feb 2020 08:47:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87E7DF80125
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 08:47:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87E7DF80125
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 01C7l6XG031331,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 01C7l6XG031331
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 15:47:06 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 12 Feb 2020 15:47:05 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f]) by
 RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f%6]) with mapi id
 15.01.1779.005; Wed, 12 Feb 2020 15:47:05 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Thread-Topic: Add more codec supported Headset Button
Thread-Index: AdXheGe8u4G9RpikQner9xHzC9zetA==
Date: Wed, 12 Feb 2020 07:47:05 +0000
Message-ID: <948f70b4488f4cc2b629a39ce4e4be33@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.169]
Content-Type: multipart/mixed;
 boundary="_002_948f70b4488f4cc2b629a39ce4e4be33realtekcom_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: [alsa-devel] Add more codec supported Headset Button
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

--_002_948f70b4488f4cc2b629a39ce4e4be33realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch.
Add supported Headset Button for ALC215/ALC285/ALC289.

Many Thanks.

BR,
Kailang

--_002_948f70b4488f4cc2b629a39ce4e4be33realtekcom_
Content-Type: application/octet-stream; name="0000-HS-BTN-supported.patch"
Content-Description: 0000-HS-BTN-supported.patch
Content-Disposition: attachment; filename="0000-HS-BTN-supported.patch";
	size=897; creation-date="Wed, 12 Feb 2020 07:33:35 GMT";
	modification-date="Wed, 12 Feb 2020 07:45:09 GMT"
Content-Transfer-Encoding: base64

RnJvbSA5ZTE1ZGI0YWQzZjU1YTQ2MDg4MDUyZDNkNGQwNTEzMTQ2MGNkNWExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IE1vbiwgMTAgRmViIDIwMjAgMTY6MTU6MTQgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFkZCBtb3JlIGNvZGVjIHN1cHBvcnRlZCBIZWFkc2V0IEJ1dHRvbgoK
QWRkIHN1cHBvcnRlZCBIZWFkc2V0IEJ1dHRvbiBmb3IgQUxDMjE1L0FMQzI4NS9BTEMyODkuCgpT
aWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CgpkaWZmIC0t
Z2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNo
X3JlYWx0ZWsuYwppbmRleCA0NzcwZmIzZjUxZmIuLjNlZTg4YWRmNTdlNyAxMDA2NDQKLS0tIGEv
c291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9y
ZWFsdGVrLmMKQEAgLTU3MDEsOCArNTcwMSwxMSBAQCBzdGF0aWMgdm9pZCBhbGNfZml4dXBfaGVh
ZHNldF9qYWNrKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAogCQlicmVhazsKIAljYXNlIEhEQV9G
SVhVUF9BQ1RfSU5JVDoKIAkJc3dpdGNoIChjb2RlYy0+Y29yZS52ZW5kb3JfaWQpIHsKKwkJY2Fz
ZSAweDEwZWMwMjE1OgogCQljYXNlIDB4MTBlYzAyMjU6CisJCWNhc2UgMHgxMGVjMDI4NToKIAkJ
Y2FzZSAweDEwZWMwMjk1OgorCQljYXNlIDB4MTBlYzAyODk6CiAJCWNhc2UgMHgxMGVjMDI5OToK
IAkJCWFsY193cml0ZV9jb2VmX2lkeChjb2RlYywgMHg0OCwgMHhkMDExKTsKIAkJCWFsY191cGRh
dGVfY29lZl9pZHgoY29kZWMsIDB4NDksIDB4MDA3ZiwgMHgwMDQ1KTsK

--_002_948f70b4488f4cc2b629a39ce4e4be33realtekcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_948f70b4488f4cc2b629a39ce4e4be33realtekcom_--
