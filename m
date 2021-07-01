Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 679C03B8E88
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jul 2021 10:05:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03C111695;
	Thu,  1 Jul 2021 10:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03C111695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625126727;
	bh=WN4JRTJuHJ9aduYQjT1SgpNn0TTNXljYqKNtdsJxzSo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iGFaeL/+I/zdCw1coYs9oTMgn6N6lJMfo8C6vQ0iKh3nZ7G7sANv0IO5Yo3g7FHiZ
	 4F9N2gA25L2NEn7Q/5U5/q5gGs5zMiVkeUxcw/njfEXDU9ytE8hLu40coImwuy/sos
	 B6yqr3VJv1au1pX84/TYDXonCycP3HLsupLu/MnI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A6DBF800E3;
	Thu,  1 Jul 2021 10:03:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44938F802D2; Thu,  1 Jul 2021 10:03:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_NONE autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEA1EF800BA
 for <alsa-devel@alsa-project.org>; Thu,  1 Jul 2021 10:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEA1EF800BA
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 16183it96028684,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 16183it96028684
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 1 Jul 2021 16:03:44 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 1 Jul 2021 16:03:44 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 1 Jul 2021 16:03:43 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::3132:fefa:293c:f022]) by
 RTEXMBS01.realtek.com.tw ([fe80::3132:fefa:293c:f022%13]) with mapi id
 15.01.2106.013; Thu, 1 Jul 2021 16:03:43 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: Add ALC285 Headphone initial procedure
Thread-Topic: Add ALC285 Headphone initial procedure
Thread-Index: AQHXbk9ZR8uEUflGHkqKQPyoKYuiFg==
Date: Thu, 1 Jul 2021 08:03:43 +0000
Message-ID: <2b7539c3e96f41a4ab458d53ea5f5784@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [119.77.141.10]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzcvMSCkV6TIIDA2OjAwOjAw?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: multipart/mixed;
 boundary="_003_2b7539c3e96f41a4ab458d53ea5f5784realtekcom_"
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzcvMSCkV6TIIDA3OjEwOjAw?=
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 07/01/2021 07:45:11
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 164753 [Jul 01 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: kailang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 448 448 71fb1b37213ce9a885768d4012c46ac449c77b17
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {Tracking_susp_attach_format}
X-KSE-AntiSpam-Info: realtek.com:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, headers_charset}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 07/01/2021 07:47:00
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

--_003_2b7539c3e96f41a4ab458d53ea5f5784realtekcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

DQpIaSBUYWthc2hpLA0KDQpBdHRhY2ggcGF0Y2ggd2FzIGZvciBBTEMyODUgSFAgaW5pdC4NCg0K
QlIsDQpLYWlsYW5n

--_003_2b7539c3e96f41a4ab458d53ea5f5784realtekcom_
Content-Type: application/octet-stream;
	name="0000-add-type-for-alc287.patch"
Content-Description: 0000-add-type-for-alc287.patch
Content-Disposition: attachment; filename="0000-add-type-for-alc287.patch";
	size=1623; creation-date="Thu, 01 Jul 2021 08:02:30 GMT";
	modification-date="Thu, 01 Jul 2021 08:02:30 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmZGNjNTNhYzNjYzZlNGU3NGVhMGU3ZTJiNmFlYzE3MDNhZGYzOWQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMSBKdWwgMjAyMSAwOTowOTozNyArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gQWRkIHR5cGUgZm9yIEFMQzI4NwoKQWRkIGluZGVwZW5kZW50IHR5cGUg
Zm9yIEFMQzI4Ny4KClNpZ25lZC1vZmYtYnk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVr
LmNvbT4KCmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5k
L3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IDMwOGE1OGE4M2YzMy4uZjMyNTcyYjFjZjQ5
IDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9w
Y2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtMzA1NSw2ICszMDU1LDcgQEAgZW51bSB7CiAJQUxD
MjY5X1RZUEVfQUxDMjU3LAogCUFMQzI2OV9UWVBFX0FMQzIxNSwKIAlBTEMyNjlfVFlQRV9BTEMy
MjUsCisJQUxDMjY5X1RZUEVfQUxDMjg3LAogCUFMQzI2OV9UWVBFX0FMQzI5NCwKIAlBTEMyNjlf
VFlQRV9BTEMzMDAsCiAJQUxDMjY5X1RZUEVfQUxDNjIzLApAQCAtMzA5MSw2ICszMDkyLDcgQEAg
c3RhdGljIGludCBhbGMyNjlfcGFyc2VfYXV0b19jb25maWcoc3RydWN0IGhkYV9jb2RlYyAqY29k
ZWMpCiAJY2FzZSBBTEMyNjlfVFlQRV9BTEMyNTc6CiAJY2FzZSBBTEMyNjlfVFlQRV9BTEMyMTU6
CiAJY2FzZSBBTEMyNjlfVFlQRV9BTEMyMjU6CisJY2FzZSBBTEMyNjlfVFlQRV9BTEMyODc6CiAJ
Y2FzZSBBTEMyNjlfVFlQRV9BTEMyOTQ6CiAJY2FzZSBBTEMyNjlfVFlQRV9BTEMzMDA6CiAJY2Fz
ZSBBTEMyNjlfVFlQRV9BTEM2MjM6CkBAIC05Mzg2LDcgKzkzODgsNiBAQCBzdGF0aWMgaW50IHBh
dGNoX2FsYzI2OShzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIAljYXNlIDB4MTBlYzAyMTU6CiAJ
Y2FzZSAweDEwZWMwMjQ1OgogCWNhc2UgMHgxMGVjMDI4NToKLQljYXNlIDB4MTBlYzAyODc6CiAJ
Y2FzZSAweDEwZWMwMjg5OgogCQlzcGVjLT5jb2RlY192YXJpYW50ID0gQUxDMjY5X1RZUEVfQUxD
MjE1OwogCQlzcGVjLT5zaHV0dXAgPSBhbGMyMjVfc2h1dHVwOwpAQCAtOTQwMSw2ICs5NDAyLDEy
IEBAIHN0YXRpYyBpbnQgcGF0Y2hfYWxjMjY5KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCQlz
cGVjLT5pbml0X2hvb2sgPSBhbGMyMjVfaW5pdDsKIAkJc3BlYy0+Z2VuLm1peGVyX25pZCA9IDA7
IC8qIG5vIGxvb3BiYWNrIG9uIEFMQzIyNSwgQUxDMjk1IGFuZCBBTEMyOTkgKi8KIAkJYnJlYWs7
CisJY2FzZSAweDEwZWMwMjg3OgorCQlzcGVjLT5jb2RlY192YXJpYW50ID0gQUxDMjY5X1RZUEVf
QUxDMjg3OworCQlzcGVjLT5zaHV0dXAgPSBhbGMyMjVfc2h1dHVwOworCQlzcGVjLT5pbml0X2hv
b2sgPSBhbGMyMjVfaW5pdDsKKwkJc3BlYy0+Z2VuLm1peGVyX25pZCA9IDA7IC8qIG5vIGxvb3Bi
YWNrIG9uIEFMQzI4NyAqLworCQlicmVhazsKIAljYXNlIDB4MTBlYzAyMzQ6CiAJY2FzZSAweDEw
ZWMwMjc0OgogCWNhc2UgMHgxMGVjMDI5NDoK

--_003_2b7539c3e96f41a4ab458d53ea5f5784realtekcom_
Content-Type: application/octet-stream; name="0001-alc285-hp-init.patch"
Content-Description: 0001-alc285-hp-init.patch
Content-Disposition: attachment; filename="0001-alc285-hp-init.patch";
	size=2870; creation-date="Thu, 01 Jul 2021 08:02:44 GMT";
	modification-date="Thu, 01 Jul 2021 08:02:44 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlOTM3ZWJkZTE0NjZlYzliOWI5ZDMxZDc0ZTU3MmUxYWM2ODViNWJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMSBKdWwgMjAyMSAwOTozMzozMyArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gQWRkIEFMQzI4NSBIUCBpbml0IHByb2NlZHVyZQoKQUxDMjg1IGhlYWRw
aG9uZSBpbml0aWFsIHByb2NlZHVyZS4KSXQgYWxzbyBjb3VsZCBzdWl0YWJsZSBmb3IgQUxDMjE1
L0FMQzI4OS9BTEMyMjUvQUxDMjk1L0FMQzI5OS4KClNpZ25lZC1vZmYtYnk6IEthaWxhbmcgWWFu
ZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KCmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNo
X3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IGYzMjU3MmIx
Y2Y0OS4uMmE3NzgzOGNjZTk0IDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0
ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtMzU2MywxMiArMzU2
Myw3MCBAQCBzdGF0aWMgdm9pZCBhbGMyNTZfc2h1dHVwKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVj
KQogCX0KIH0KIAorc3RhdGljIHZvaWQgYWxjMjg1X2hwX2luaXQoc3RydWN0IGhkYV9jb2RlYyAq
Y29kZWMpCit7CisJc3RydWN0IGFsY19zcGVjICpzcGVjID0gY29kZWMtPnNwZWM7CisJaGRhX25p
ZF90IGhwX3BpbiA9IGFsY19nZXRfaHBfcGluKHNwZWMpOworCWludCBpLCB2YWw7CisJaW50IGNv
ZWYzOCwgY29lZjBkLCBjb2VmMzY7CisKKwlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDRh
LCAxPDwxNSwgMTw8MTUpOyAvKiBSZXNldCBIUCBKRCAqLworCWNvZWYzOCA9IGFsY19yZWFkX2Nv
ZWZfaWR4KGNvZGVjLCAweDM4KTsgLyogQW1wIGNvbnRyb2wgKi8KKwljb2VmMGQgPSBhbGNfcmVh
ZF9jb2VmX2lkeChjb2RlYywgMHgwZCk7IC8qIERpZ2l0YWwgTWlzYyBjb250cm9sICovCisJY29l
ZjM2ID0gYWxjX3JlYWRfY29lZl9pZHgoY29kZWMsIDB4MzYpOyAvKiBQYXNzdGhyb3VnaCBDb250
cm9sICovCisJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgzOCwgMTw8NCwgMHgwKTsKKwlh
bGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDBkLCAweDExMCwgMHgwKTsKKworCWFsY191cGRh
dGVfY29lZl9pZHgoY29kZWMsIDB4NjcsIDB4ZjAwMCwgMHgzMDAwKTsKKworCWlmIChocF9waW4p
CisJCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIGhwX3BpbiwgMCwKKwkJCSAgICBBQ19WRVJC
X1NFVF9BTVBfR0FJTl9NVVRFLCBBTVBfT1VUX01VVEUpOworCisJbXNsZWVwKDEzMCk7CisJYWxj
X3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgzNiwgMTw8MTQsIDE8PDE0KTsKKwlhbGNfdXBkYXRl
X2NvZWZfaWR4KGNvZGVjLCAweDM2LCAxPDwxMywgMHgwKTsKKworCWlmIChocF9waW4pCisJCXNu
ZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIGhwX3BpbiwgMCwKKwkJCSAgICBBQ19WRVJCX1NFVF9Q
SU5fV0lER0VUX0NPTlRST0wsIDB4MCk7CisJbXNsZWVwKDEwKTsKKwlhbGNfd3JpdGVfY29lZl9p
ZHgoY29kZWMsIDB4NjcsIDB4MCk7IC8qIFNldCBIUCBkZXBvcCB0byBtYW51YWwgbW9kZSAqLwor
CWFsY193cml0ZV9jb2VmZXhfaWR4KGNvZGVjLCAweDU4LCAweDAwLCAweDc4ODApOworCWFsY193
cml0ZV9jb2VmZXhfaWR4KGNvZGVjLCAweDU4LCAweDBmLCAweGYwNDkpOworCWFsY191cGRhdGVf
Y29lZmV4X2lkeChjb2RlYywgMHg1OCwgMHgwMywgMHgwMGYwLCAweDAwYzApOworCisJYWxjX3dy
aXRlX2NvZWZleF9pZHgoY29kZWMsIDB4NTgsIDB4MDAsIDB4Zjg4OCk7IC8qIEhQIGRlcG9wIHBy
b2NlZHVyZSBzdGFydCAqLworCXZhbCA9IGFsY19yZWFkX2NvZWZleF9pZHgoY29kZWMsIDB4NTgs
IDB4MDApOworCWZvciAoaSA9IDA7IGkgPCAyMCAmJiB2YWwgJiAweDgwMDA7IGkrKykgeworCQlt
c2xlZXAoNTApOworCQl2YWwgPSBhbGNfcmVhZF9jb2VmZXhfaWR4KGNvZGVjLCAweDU4LCAweDAw
KTsKKwl9IC8qIFdhaXQgZm9yIGRlcG9wIHByb2NlZHVyZSBmaW5pc2ggICovCisKKwlhbGNfd3Jp
dGVfY29lZmV4X2lkeChjb2RlYywgMHg1OCwgMHgwMCwgdmFsKTsgLyogd3JpdGUgYmFjayB0aGUg
cmVzdWx0ICovCisJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgzOCwgMTw8NCwgY29lZjM4
KTsKKwlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDBkLCAweDExMCwgY29lZjBkKTsKKwlh
bGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDM2LCAzPDwxMywgY29lZjM2KTsKKworCW1zbGVl
cCg1MCk7CisJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHg0YSwgMTw8MTUsIDApOworfQor
CiBzdGF0aWMgdm9pZCBhbGMyMjVfaW5pdChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKIHsKIAlz
dHJ1Y3QgYWxjX3NwZWMgKnNwZWMgPSBjb2RlYy0+c3BlYzsKIAloZGFfbmlkX3QgaHBfcGluID0g
YWxjX2dldF9ocF9waW4oc3BlYyk7CiAJYm9vbCBocDFfcGluX3NlbnNlLCBocDJfcGluX3NlbnNl
OwogCisJaWYgKHNwZWMtPmNvZGVjX3ZhcmlhbnQgIT0gQUxDMjY5X1RZUEVfQUxDMjg3KQorCQkv
KiByZXF1aXJlZCBvbmx5IGF0IGJvb3Qgb3IgUzMgYW5kIFM0IHJlc3VtZSB0aW1lICovCisJCWlm
ICghc3BlYy0+ZG9uZV9ocF9pbml0IHx8CisJCQlpc19zM19yZXN1bWUoY29kZWMpIHx8CisJCQlp
c19zNF9yZXN1bWUoY29kZWMpKSB7CisJCQlhbGMyODVfaHBfaW5pdChjb2RlYyk7CisJCQlzcGVj
LT5kb25lX2hwX2luaXQgPSB0cnVlOworCQl9CisKIAlpZiAoIWhwX3BpbikKIAkJaHBfcGluID0g
MHgyMTsKIAltc2xlZXAoMzApOwo=

--_003_2b7539c3e96f41a4ab458d53ea5f5784realtekcom_--
