Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 354C5365259
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Apr 2021 08:28:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 838A3167F;
	Tue, 20 Apr 2021 08:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 838A3167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618900085;
	bh=TDc5m9/ZfcWJFvEukUZYqCYnxHHMt0k2+0OYDSSc5xc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hvtpik0RyrttVCA1rfqBcNmCowwdVV+00JP83Pf3D+S3vKwqI+zYgMIZG0HShaGac
	 e4Q5Xs762bjOI8+oGY2rVr0RsaCyZndENaYfZBKjWN1ELjyaJUsiY+iSxwqRcqhsLa
	 exMk3kfiXgRKzoRuuy3e1KgKjJghcyq/uRKThubE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CCB4F80273;
	Tue, 20 Apr 2021 08:26:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06F95F80253; Tue, 20 Apr 2021 08:26:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_NONE autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10421F80164
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 08:26:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10421F80164
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 13K6QLsrC013951,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 13K6QLsrC013951
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 20 Apr 2021 14:26:21 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 20 Apr 2021 14:26:20 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 20 Apr 2021 14:26:20 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::e1bc:d5c7:d79c:2ab7]) by
 RTEXMBS01.realtek.com.tw ([fe80::e1bc:d5c7:d79c:2ab7%13]) with mapi id
 15.01.2106.013; Tue, 20 Apr 2021 14:26:20 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: Headset MIC issue on HP ThinClient
Thread-Topic: Headset MIC issue on HP ThinClient
Thread-Index: Adc1rak5tRFrfPcARA+rTR5oi9UZBg==
Date: Tue, 20 Apr 2021 06:26:20 +0000
Message-ID: <207eecfc3189466a820720bc0c409ea9@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.96]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2021/4/19_=3F=3F_11:43:00?=
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: multipart/mixed;
 boundary="_002_207eecfc3189466a820720bc0c409ea9realtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 04/20/2021 02:53:45
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 163215 [Apr 19 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: kailang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 442 442 b985cb57763b61d2a20abb585d5d4cc10c315b09
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {Tracking_susp_attach_format}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/20/2021 02:57:00
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzQvMjAgpFekyCAwNDo0NjowMA==?=
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 04/20/2021 06:13:15
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 163217 [Apr 20 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: kailang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 442 442 b985cb57763b61d2a20abb585d5d4cc10c315b09
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {Tracking_susp_attach_format}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 realtek.com:7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, headers_charset}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/20/2021 06:16:00
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

--_002_207eecfc3189466a820720bc0c409ea9realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Some HP machines, boot with plugged headset, the headset MIC will lose.
Attach patch will solve it.

BR,
Kailang

--_002_207eecfc3189466a820720bc0c409ea9realtekcom_
Content-Type: application/octet-stream; name="0002-hp-hsmic.patch"
Content-Description: 0002-hp-hsmic.patch
Content-Disposition: attachment; filename="0002-hp-hsmic.patch"; size=1184;
	creation-date="Tue, 20 Apr 2021 06:20:00 GMT";
	modification-date="Tue, 20 Apr 2021 06:21:59 GMT"
Content-Transfer-Encoding: base64

RnJvbSA4OTZmMzY4YWY0YmI0ZDg1YjI4NTE4ZjliMjJhMmIxOTNjMWMzOWU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBrYWlsYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpEYXRlOiBU
dWUsIDIwIEFwciAyMDIxIDE0OjE3OjM0ICswODAwClN1YmplY3Q6IFtQQVRDSF0gQUxTQTogaGRh
L3JlYWx0ZWsgLSBIZWFkc2V0IE1pYyBpc3N1ZSBvbiBIUCBwbGF0Zm9ybQoKQm9vdCB3aXRoIHBs
dWdnZWQgaGVhZHNldCwgdGhlIEhlYWRzZXQgTWljIHdpbGwgYmUgZ29uZS4KClNpZ25lZC1vZmYt
Ynk6IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KCmRpZmYgLS1naXQgYS9zb3Vu
ZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5j
CmluZGV4IDFhZDFiYjc0MGMzMi4uNzdjYjcyZmUzYjFiIDEwMDY0NAotLS0gYS9zb3VuZC9wY2kv
aGRhL3BhdGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpA
QCAtODEwNCw2ICs4MTA0LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJrIGFs
YzI2OV9maXh1cF90YmxbXSA9IHsKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHgyMjFjLCAiSFAg
RWxpdGVCb29rIDc1NSBHMiIsIEFMQzI4MF9GSVhVUF9IUF9IRUFEU0VUX01JQyksCiAJU05EX1BD
SV9RVUlSSygweDEwM2MsIDB4ODAyZSwgIkhQIFoyNDAgU0ZGIiwgQUxDMjIxX0ZJWFVQX0hQX01J
Q19OT19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4ODAyZiwgIkhQIFoyNDAi
LCBBTEMyMjFfRklYVVBfSFBfTUlDX05PX1BSRVNFTkNFKSwKKwlTTkRfUENJX1FVSVJLKDB4MTAz
YywgMHg4MDc3LCAiSFAiLCBBTEMyNTZfRklYVVBfSFBfSEVBRFNFVF9NSUMpLAorCVNORF9QQ0lf
UVVJUksoMHgxMDNjLCAweDgxNTgsICJIUCIsIEFMQzI1Nl9GSVhVUF9IUF9IRUFEU0VUX01JQyks
CiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4ODIwZCwgIkhQIFBhdmlsaW9uIDE1IiwgQUxDMjY5
X0ZJWFVQX0hQX01VVEVfTEVEX01JQzMpLAogCVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDgyNTYs
ICJIUCIsIEFMQzIyMV9GSVhVUF9IUF9GUk9OVF9NSUMpLAogCVNORF9QQ0lfUVVJUksoMHgxMDNj
LCAweDgyN2UsICJIUCB4MzYwIiwgQUxDMjk1X0ZJWFVQX0hQX1gzNjApLAo=

--_002_207eecfc3189466a820720bc0c409ea9realtekcom_--
