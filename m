Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0786D421F2D
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 08:56:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87A5A1670;
	Tue,  5 Oct 2021 08:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87A5A1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633417010;
	bh=UH2F9mFC00wM7rtBmHE7pKpEbzISRKeFMbRxXfToqgo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OHnNAuVjLniC9vS8Zcrcv/mFB7JRlDmyE8BU1xQGkaAoaMyHbPMtFYWzzErxMurYy
	 4y7SWA5i/6vjHf9N06QEWd/SLkdanR+EBlIrAFns2v87Ia33NwO0uN9DMkGAXRj9PK
	 bdNb6e+ZUKsUPrchhtZ+9hji56N4Mytc4dZnYJOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12318F8028B;
	Tue,  5 Oct 2021 08:55:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A224FF8027D; Tue,  5 Oct 2021 08:55:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66CBAF80154
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 08:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66CBAF80154
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1956tFtN5017586,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1956tFtN5017586
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 5 Oct 2021 14:55:15 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 5 Oct 2021 14:55:14 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 5 Oct 2021 14:55:14 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::ddc7:f5b1:d3ae:8354]) by
 RTEXMBS01.realtek.com.tw ([fe80::ddc7:f5b1:d3ae:8354%5]) with mapi id
 15.01.2106.013; Tue, 5 Oct 2021 14:55:14 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: ALC236 recording issue
Thread-Topic: ALC236 recording issue
Thread-Index: Ade5tYSZhOipxzjxS1u2xzQL3Lg4bQ==
Date: Tue, 5 Oct 2021 06:55:14 +0000
Message-ID: <ccb0cdd5bbd7486eabbd8d987d384cb0@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.97]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2021/10/5_=3F=3F_03:48:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: multipart/mixed;
 boundary="_002_ccb0cdd5bbd7486eabbd8d987d384cb0realtekcom_"
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 10/05/2021 06:38:01
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 166506 [Oct 04 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: kailang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 463 463 5854868460de3f0d8e8c0a4df98aeb05fb764a09
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {Tracking_susp_attach_format}
X-KSE-AntiSpam-Info: realtek.com:7.1.1; 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/05/2021 06:40:00
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

--_002_ccb0cdd5bbd7486eabbd8d987d384cb0realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch will solve alc236 recording issue for HP platform.

Many Thanks.

BR,
Kailang

--_002_ccb0cdd5bbd7486eabbd8d987d384cb0realtekcom_
Content-Type: application/octet-stream;
	name="0000-alc236-headset-mic-delay.patch"
Content-Description: 0000-alc236-headset-mic-delay.patch
Content-Disposition: attachment;
	filename="0000-alc236-headset-mic-delay.patch"; size=1435;
	creation-date="Tue, 05 Oct 2021 06:40:47 GMT";
	modification-date="Tue, 05 Oct 2021 06:43:00 GMT"
Content-Transfer-Encoding: base64

RnJvbSAwYTUxYzA0Yjc5ZjRiYWY3YzM2OGI5NjgyYWNhMjExZDY3ODg2Y2JhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFR1ZSwgNSBPY3QgMjAyMSAxNDozNToxNCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gQUxDMjM2IGhlYWRzZXQgTUlDIHJlY29yZGluZyBpc3N1ZQoKSW4gcG93
ZXIgc2F2ZSBtb2RlLCB0aGUgcmVjb3JkaW5nIHZvaWNlIGZyb20gaGVhZHNldCBtaWMgd2lsbCAy
cyBtb3JlIGRlbGF5LgpBZGQgdGhpcyBwYXRjaCB3aWxsIHNvbHZlIHRoaXMgaXNzdWUuCgpTaWdu
ZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+ClRlc3RlZC1ieTog
S2FpLUhlbmcgRmVuZyA8a2FpLmhlbmcuZmVuZ0BjYW5vbmljYWwuY29tPgoKZGlmZiAtLWdpdCBh
L3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFs
dGVrLmMKaW5kZXggMDMzMWZhZTU1MjVlLi4xMjIwOGJkZmQyZGYgMTAwNjQ0Ci0tLSBhL3NvdW5k
L3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRl
ay5jCkBAIC01MjYsNiArNTI2LDggQEAgc3RhdGljIHZvaWQgYWxjX3NodXR1cF9waW5zKHN0cnVj
dCBoZGFfY29kZWMgKmNvZGVjKQogCXN0cnVjdCBhbGNfc3BlYyAqc3BlYyA9IGNvZGVjLT5zcGVj
OwogCiAJc3dpdGNoIChjb2RlYy0+Y29yZS52ZW5kb3JfaWQpIHsKKwljYXNlIDB4MTBlYzAyMzY6
CisJY2FzZSAweDEwZWMwMjU2OgogCWNhc2UgMHgxMGVjMDI4MzoKIAljYXNlIDB4MTBlYzAyODY6
CiAJY2FzZSAweDEwZWMwMjg4OgpAQCAtMzUyOSw4ICszNTMxLDkgQEAgc3RhdGljIHZvaWQgYWxj
MjU2X3NodXR1cChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAkvKiBJZiBkaXNhYmxlIDNrIHB1
bGxkb3duIGNvbnRyb2wgZm9yIGFsYzI1NywgdGhlIE1pYyBkZXRlY3Rpb24gd2lsbCBub3Qgd29y
ayBjb3JyZWN0bHkKIAkgKiB3aGVuIGJvb3Rpbmcgd2l0aCBoZWFkc2V0IHBsdWdnZWQuIFNvIHNr
aXAgc2V0dGluZyBpdCBmb3IgdGhlIGNvZGVjIGFsYzI1NwogCSAqLwotCWlmIChjb2RlYy0+Y29y
ZS52ZW5kb3JfaWQgIT0gMHgxMGVjMDI1NykKLQkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywg
MHg0NiwgMCwgMyA8PCAxMik7CisJaWYgKHNwZWMtPmNvZGVjX3ZhcmlhbnQgIT0gQUxDMjY5X1RZ
UEVfQUxDMjU3ICYmCisJCXNwZWMtPmNvZGVjX3ZhcmlhbnQgIT0gQUxDMjY5X1RZUEVfQUxDMjU2
KQorCQkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHg0NiwgMCwgMyA8PCAxMik7CiAKIAlp
ZiAoIXNwZWMtPm5vX3NodXR1cF9waW5zKQogCQlzbmRfaGRhX2NvZGVjX3dyaXRlKGNvZGVjLCBo
cF9waW4sIDAsCg==

--_002_ccb0cdd5bbd7486eabbd8d987d384cb0realtekcom_--
