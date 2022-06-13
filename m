Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4074154804B
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 09:16:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B238017A5;
	Mon, 13 Jun 2022 09:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B238017A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655104603;
	bh=chJj+2JoNgd1frgXKNP+zonfaxLxHYP2OBsbZXA2s1U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G1OjylSINuaZdKgFUDy9PsRHRPB0e1RI7z1JCBamhV0Bt/9IPLyNUG2Z6NWygIg8F
	 ip+5CJDo7nQ9Y+BJ6YtyhQ6GUakE5dduwU/0ZAG03u2jnQZ3IygjafK1Ys55N1qFgL
	 q1ZXMenyfBlwfWS8K8WbMSBA45WU66CocRBGjdnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29D9CF80107;
	Mon, 13 Jun 2022 09:15:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED276F804C1; Mon, 13 Jun 2022 09:15:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAF0FF80139
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 09:15:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAF0FF80139
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 25D7FQcS4026291,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36504.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 25D7FQcS4026291
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 13 Jun 2022 15:15:26 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36504.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 13 Jun 2022 15:15:26 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 13 Jun 2022 15:15:26 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::754e:2219:bbef:d0cd]) by
 RTEXMBS01.realtek.com.tw ([fe80::754e:2219:bbef:d0cd%5]) with mapi id
 15.01.2308.027; Mon, 13 Jun 2022 15:15:26 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: There is headset Mic issue on HP ALC897 Platform
Thread-Topic: There is headset Mic issue on HP ALC897 Platform
Thread-Index: Adh+9NJeodMPB4mjQpOVDxtvRC/wwQ==
Date: Mon, 13 Jun 2022 07:15:26 +0000
Message-ID: <719133a27d8844a890002cb817001dfa@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.99]
x-kse-serverinfo: RTEXDAG02.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2022/6/13_=3F=3F_06:01:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: multipart/mixed;
 boundary="_002_719133a27d8844a890002cb817001dfarealtekcom_"
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36504.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
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

--_002_719133a27d8844a890002cb817001dfarealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

HP ALC897 platform.
It need to fill 0x19 verb table to enable Headset MIC.
Attach was the supporting patch.

BR,
Kailang

--_002_719133a27d8844a890002cb817001dfarealtekcom_
Content-Type: application/octet-stream;
	name="0000-HP-alc897-HSMIC-0x8719.patch"
Content-Description: 0000-HP-alc897-HSMIC-0x8719.patch
Content-Disposition: attachment;
	filename="0000-HP-alc897-HSMIC-0x8719.patch"; size=1791;
	creation-date="Mon, 13 Jun 2022 06:59:34 GMT";
	modification-date="Mon, 13 Jun 2022 07:09:57 GMT"
Content-Transfer-Encoding: base64

RnJvbSA4ODY0OTAzYmY5ZjFiMDM1ZjY0ZmE1NTAwZDEwNTZiYmZiNjAyNGYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBrYWlsYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpEYXRlOiBN
b24sIDEzIEp1biAyMDIyIDE0OjU3OjE5ICswODAwClN1YmplY3Q6IFtQQVRDSF0gQUxTQTogaGRh
L3JlYWx0ZWsgLSBBTEM4OTcgaGVhZHNldCBNSUMgbm8gc291bmQKClRoZXJlIGlzIG5vdCBoYXZl
IEhlYWRzZXQgTWljIHZlcmIgdGFibGUgaW4gQklPUyBkZWZhdWx0LgpTbywgaXQgd2lsbCBoYXZl
IHJlY29yZGluZyBpc3N1ZSBmcm9tIGhlYWRzZXQgTUlDLgpBZGQgdGhlIHZlcmIgdGFibGUgdmFs
dWUgd2l0aG91dCBqYWNrIGRldGVjdC4gSXQgd2lsbCB0dXJuIG9uIEhlYWRzZXQgTWljLgoKU2ln
bmVkLW9mZi1ieTogS2FpbGFuZyBZYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgoKZGlmZiAtLWdp
dCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9y
ZWFsdGVrLmMKaW5kZXggOGEzZTJmZTQyMTA2Li5jMDU5Mjk2ZmU5ZDYgMTAwNjQ0Ci0tLSBhL3Nv
dW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVh
bHRlay5jCkBAIC0xMDI2Niw2ICsxMDI2Niw3IEBAIGVudW0gewogCUFMQzY2OF9GSVhVUF9BU1VT
X05PX0hFQURTRVRfTUlDLAogCUFMQzY2OF9GSVhVUF9IRUFEU0VUX01JQywKIAlBTEM2NjhfRklY
VVBfTUlDX0RFVF9DT0VGLAorCUFMQzg5N19GSVhVUF9IUF9IU01JQ19WRVJCLAogfTsKIAogc3Rh
dGljIGNvbnN0IHN0cnVjdCBoZGFfZml4dXAgYWxjNjYyX2ZpeHVwc1tdID0gewpAQCAtMTA2NzIs
NiArMTA2NzMsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfZml4dXAgYWxjNjYyX2ZpeHVw
c1tdID0gewogCQkJe30KIAkJfSwKIAl9LAorCVtBTEM4OTdfRklYVVBfSFBfSFNNSUNfVkVSQl0g
PSB7CisJCS50eXBlID0gSERBX0ZJWFVQX1BJTlMsCisJCS52LnBpbnMgPSAoY29uc3Qgc3RydWN0
IGhkYV9waW50YmxbXSkgeworCQkJeyAweDE5LCAweDAxYTE5MTNjIH0sIC8qIHVzZSBhcyBoZWFk
c2V0IG1pYywgd2l0aG91dCBpdHMgb3duIGphY2sgZGV0ZWN0ICovCisJCQl7IH0KKwkJfSwKKwl9
LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJrIGFsYzY2Ml9maXh1cF90
YmxbXSA9IHsKQEAgLTEwNjk3LDYgKzEwNzA1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRf
cGNpX3F1aXJrIGFsYzY2Ml9maXh1cF90YmxbXSA9IHsKIAlTTkRfUENJX1FVSVJLKDB4MTAyOCwg
MHgwNjk4LCAiRGVsbCIsIEFMQzY2OF9GSVhVUF9ERUxMX01JQ19OT19QUkVTRU5DRSksCiAJU05E
X1BDSV9RVUlSSygweDEwMjgsIDB4MDY5ZiwgIkRlbGwiLCBBTEM2NjhfRklYVVBfREVMTF9NSUNf
Tk9fUFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDE2MzIsICJIUCBSUDU4MDAi
LCBBTEM2NjJfRklYVVBfSFBfUlA1ODAwKSwKKwlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4NzE5
LCAiSFAiLCBBTEM4OTdfRklYVVBfSFBfSFNNSUNfVkVSQiksCiAJU05EX1BDSV9RVUlSSygweDEw
M2MsIDB4ODczZSwgIkhQIiwgQUxDNjcxX0ZJWFVQX0hQX0hFQURTRVRfTUlDMiksCiAJU05EX1BD
SV9RVUlSSygweDEwNDMsIDB4MTA4MCwgIkFzdXMgVVg1MDFWVyIsIEFMQzY2OF9GSVhVUF9IRUFE
U0VUX01PREUpLAogCVNORF9QQ0lfUVVJUksoMHgxMDQzLCAweDExY2QsICJBc3VzIE41NTAiLCBB
TEM2NjJfRklYVVBfQVNVU19OeDUwKSwK

--_002_719133a27d8844a890002cb817001dfarealtekcom_--
