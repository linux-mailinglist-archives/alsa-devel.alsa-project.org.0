Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C070725508
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 09:07:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51FA574C;
	Wed,  7 Jun 2023 09:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51FA574C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686121624;
	bh=35TsqHFlbS1gS6LscyZBFX+ZMdi0X5/BKDaC7ID0p2o=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y0+TOhbnj7yzE6Q9EQiNn4BxE1Vjb+4SnLLgKMpUEfFcQZslXOUINKCz1WiJ47XNL
	 346EdYChF0t1VtEJ/HjK6ZLUsJkZNtVUVyz6UpYBC3TuMFPEswTk5J4JU4z5eKrKP8
	 ctNKeDCZDJx2YlIX/+4LDdnV6dD5qVqc7eRjw9AY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57E3DF8016C; Wed,  7 Jun 2023 09:06:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE243F8016C;
	Wed,  7 Jun 2023 09:06:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDBABF80199; Wed,  7 Jun 2023 09:06:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52E7DF80130
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 09:06:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52E7DF80130
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 35775e4vA029445,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 35775e4vA029445
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Wed, 7 Jun 2023 15:05:40 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 7 Jun 2023 15:05:56 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 7 Jun 2023 15:05:56 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::4d7:e49a:674a:598]) by
 RTEXMBS01.realtek.com.tw ([fe80::4d7:e49a:674a:598%5]) with mapi id
 15.01.2375.007; Wed, 7 Jun 2023 15:05:56 +0800
From: Kailang <kailang@realtek.com>
To: "Joseph C. Sible" <josephcsible@gmail.com>
CC: Takashi Iwai <tiwai@suse.de>, Bagas Sanjaya <bagasdotme@gmail.com>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
Thread-Topic: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
Thread-Index: 
 AQHZhdSOD7kY6mXBDkGA3ryhp811r69Yu5SAgAASNACAAA22gIAA7n+AgAEJrYCABLe/YIAJNIWAgAIHAcD//4tyAIAB8UZw///vxgCADzWhgIABfgWAgACUPoCAAPnsAIAAmlKw
Date: Wed, 7 Jun 2023 07:05:55 +0000
Message-ID: <485f99149508488080d563144454040e@realtek.com>
References: <bug-217440-225600@https.bugzilla.kernel.org/>
 <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
 <ZGB0cVVI7OgaJU6t@debian.me>
 <CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
 <87cz338ix4.wl-tiwai@suse.de>
 <CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
 <874jodlnmi.wl-tiwai@suse.de> <415d4bc84aa74c74af913048f28b42a9@realtek.com>
 <87fs7mdofi.wl-tiwai@suse.de> <7da2fdfdae614b1c98deda6e11ca34eb@realtek.com>
 <87353kd8b9.wl-tiwai@suse.de> <1170325957764b4cbd7cd3639575f285@realtek.com>
 <CABpewhGBakDSBLKZ1cr2=OMspuu3qyYwZrsXUggQ3vt8gsD88A@mail.gmail.com>
 <873536js7q.wl-tiwai@suse.de>
 <CABpewhE0NAC-Q=iqG2Ba=XhT7SXsWy18wQGYUaopzmKDfFxyPw@mail.gmail.com>
 <2c1fcbc00bb44d66a29ac1c1e4bec5ad@realtek.com>
 <CABpewhFthKG97dPiQC4JhGx9sapX9Yu5rWABQjpY95TSA+eawA@mail.gmail.com>
In-Reply-To: 
 <CABpewhFthKG97dPiQC4JhGx9sapX9Yu5rWABQjpY95TSA+eawA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS05.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_003_485f99149508488080d563144454040erealtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: UX7SYZQZJ6OK2G6YKATJ7WLWMGHF3DI7
X-Message-ID-Hash: UX7SYZQZJ6OK2G6YKATJ7WLWMGHF3DI7
X-MailFrom: kailang@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UX7SYZQZJ6OK2G6YKATJ7WLWMGHF3DI7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_003_485f99149508488080d563144454040erealtekcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSm9zZXBoLA0KDQpQbGVhc2UgdHJ5IGF0dGFjaCBwYXRjaC4NClBsZWFzZSBwYXRjaCBmb2xs
b3cgbnVtYmVyIHNlcXVlbmNlLg0KDQpUaGFua3MuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogSm9zZXBoIEMuIFNpYmxlIDxqb3NlcGhjc2libGVAZ21haWwuY29tPg0K
PiBTZW50OiBXZWRuZXNkYXksIEp1bmUgNywgMjAyMyAxOjQ3IFBNDQo+IFRvOiBLYWlsYW5nIDxr
YWlsYW5nQHJlYWx0ZWsuY29tPg0KPiBDYzogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPjsg
QmFnYXMgU2FuamF5YSA8YmFnYXNkb3RtZUBnbWFpbC5jb20+Ow0KPiByZWdyZXNzaW9uc0BsaXN0
cy5saW51eC5kZXY7IHBlcmV4QHBlcmV4LmN6OyB0aXdhaUBzdXNlLmNvbTsNCj4gYWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBGd2Q6IFtCdWcgMjE3NDQwXSBOZXc6
IEFMQzIzNiBhdWRpbyBkaXNhcHBlYXJzIGZyb20gSFANCj4gMTV6LWZjMDAwIG9uIHdhcm0gYm9v
dA0KPiANCj4gDQo+IEV4dGVybmFsIG1haWwuDQo+IA0KPiANCj4gDQo+IE9uIFR1ZSwgSnVuIDYs
IDIwMjMgYXQgMjo1NeKAr0FNIEthaWxhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+IHdyb3RlOg0K
PiA+DQo+ID4gQ291bGQgeW91IHJ1biBhdHRhY2ggdG8gZ2V0IGR1bXAgZm9yIG1lPw0KPiA+DQo+
ID4gLi9hbHNhLWluZm8gLS1uby11cGxvYWQNCj4gDQo+IFRoZSByZXN1bHQgaXMgYXR0YWNoZWQu
DQo+IA0KPiBUaGFua3MsDQo+IA0KPiBKb3NlcGggQy4gU2libGUNCj4gDQo+IC0tLS0tLVBsZWFz
ZSBjb25zaWRlciB0aGUgZW52aXJvbm1lbnQgYmVmb3JlIHByaW50aW5nIHRoaXMgZS1tYWlsLg0K

--_003_485f99149508488080d563144454040erealtekcom_
Content-Type: application/octet-stream; name="0001-hp-alc236.patch"
Content-Description: 0001-hp-alc236.patch
Content-Disposition: attachment; filename="0001-hp-alc236.patch"; size=2261;
	creation-date="Wed, 07 Jun 2023 06:48:45 GMT";
	modification-date="Wed, 07 Jun 2023 06:59:12 GMT"
Content-Transfer-Encoding: base64

RnJvbSBiZDEzMzU3ODdhZDkyMDQ1MzJlYmMxNzIzMjA3NzcxNzhjNjNiZmVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFdlZCwgNyBKdW4gMjAyMyAxNDo0NjoyMCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gYWRkIGNvbWJvIGphY2sgcmVzdGFydCBmb3IgSFAgbWFjaGluZQoKSFAg
MHg4YjJmIHdpbGwgbG9zZSBoZWFkc2V0IE1JQy4KQWRkIGNvbWJvIGphY2sgcmVzdGFydCBwcm9j
ZWR1cmUgd2lsbCBzb2x2ZSB0aGlzIGlzc3VlLgoKZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEv
cGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggN2Rj
YzA0ZTE4NWU2Li41ZjVhYjc3ZTU0YzcgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hf
cmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC02NDgzLDYg
KzY0ODMsMTggQEAgc3RhdGljIHZvaWQgYWxjMjk1X2ZpeHVwX2Nocm9tZWJvb2soc3RydWN0IGhk
YV9jb2RlYyAqY29kZWMsCiAJfQogfQogCitzdGF0aWMgdm9pZCBhbGMyMjVfYWxjMjU2X2ZpeHVw
X2hlYWRzZXRfbWljKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAorCQkJCSAgICBjb25zdCBzdHJ1
Y3QgaGRhX2ZpeHVwICpmaXgsIGludCBhY3Rpb24pCit7CisJc3RydWN0IGFsY19zcGVjICpzcGVj
ID0gY29kZWMtPnNwZWM7CisKKwlzd2l0Y2ggKGFjdGlvbikgeworCWNhc2UgSERBX0ZJWFVQX0FD
VF9JTklUOgorCQlhbGNfY29tYm9famFja19ocF9qZF9yZXN0YXJ0KGNvZGVjKTsKKwkJYnJlYWs7
CisJfQorfQorCiBzdGF0aWMgdm9pZCBhbGNfZml4dXBfZGlzYWJsZV9taWNfdnJlZihzdHJ1Y3Qg
aGRhX2NvZGVjICpjb2RlYywKIAkJCQkgIGNvbnN0IHN0cnVjdCBoZGFfZml4dXAgKmZpeCwgaW50
IGFjdGlvbikKIHsKQEAgLTcyMDEsNiArNzIxMyw3IEBAIGVudW0gewogCUFMQzI4N19GSVhVUF9Z
T0dBOV8xNElBUDdfQkFTU19TUEtfUElOLAogCUFMQzI5NV9GSVhVUF9ERUxMX0lOU1BJUk9OX1RP
UF9TUEVBS0VSUywKIAlBTEMyMzZfRklYVVBfREVMTF9EVUFMX0NPREVDUywKKwlBTEMyNTZfRklY
VVBfSEVBRFNFVF9NSUMsCiB9OwogCiAvKiBBIHNwZWNpYWwgZml4dXAgZm9yIExlbm92byBDOTQw
IGFuZCBZb2dhIER1ZXQgNzsKQEAgLTkyMDUsNiArOTIxOCwxMCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGhkYV9maXh1cCBhbGMyNjlfZml4dXBzW10gPSB7CiAJCS5jaGFpbmVkID0gdHJ1ZSwKIAkJ
LmNoYWluX2lkID0gQUxDMjU1X0ZJWFVQX0RFTEwxX01JQ19OT19QUkVTRU5DRSwKIAl9LAorCVtB
TEMyNTZfRklYVVBfSEVBRFNFVF9NSUNdID0geworCQkudHlwZSA9IEhEQV9GSVhVUF9QSU5TLAor
CQkudi5mdW5jID0gYWxjMjI1X2FsYzI1Nl9maXh1cF9oZWFkc2V0X21pYywKKwl9LAogfTsKIAog
c3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJrIGFsYzI2OV9maXh1cF90YmxbXSA9IHsK
QEAgLTk0NzcsNiArOTQ5NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBh
bGMyNjlfZml4dXBfdGJsW10gPSB7CiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGFiYiwgIkhQ
IFpCb29rIEZpcmVmbHkgMTQgRzkiLCBBTEMyNDVfRklYVVBfQ1MzNUw0MV9TUElfMl9IUF9HUElP
X0xFRCksCiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGFkMSwgIkhQIEVsaXRlQm9vayA4NDAg
MTQgaW5jaCBHOSBOb3RlYm9vayBQQyIsIEFMQzI0NV9GSVhVUF9DUzM1TDQxX1NQSV8yX0hQX0dQ
SU9fTEVEKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4YWQyLCAiSFAgRWxpdGVCb29rIDg2
MCAxNiBpbmNoIEc5IE5vdGVib29rIFBDIiwgQUxDMjQ1X0ZJWFVQX0NTMzVMNDFfU1BJXzJfSFBf
R1BJT19MRUQpLAorCVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDhiMmYsICJIUCAxNXotZmMwMDAi
LCBBTEMyNTZfRklYVVBfSEVBRFNFVF9NSUMpLAogCVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDhi
NDIsICJIUCIsIEFMQzI0NV9GSVhVUF9DUzM1TDQxX1NQSV8yX0hQX0dQSU9fTEVEKSwKIAlTTkRf
UENJX1FVSVJLKDB4MTAzYywgMHg4YjQzLCAiSFAiLCBBTEMyNDVfRklYVVBfQ1MzNUw0MV9TUElf
Ml9IUF9HUElPX0xFRCksCiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGI0NCwgIkhQIiwgQUxD
MjQ1X0ZJWFVQX0NTMzVMNDFfU1BJXzJfSFBfR1BJT19MRUQpLAo=

--_003_485f99149508488080d563144454040erealtekcom_
Content-Type: application/octet-stream;
	name="0000-alc236-cancel-3kpullLow.patch"
Content-Description: 0000-alc236-cancel-3kpullLow.patch
Content-Disposition: attachment;
	filename="0000-alc236-cancel-3kpullLow.patch"; size=1692;
	creation-date="Wed, 07 Jun 2023 06:48:45 GMT";
	modification-date="Wed, 07 Jun 2023 06:55:50 GMT"
Content-Transfer-Encoding: base64

RnJvbSBhNjcyMTU5YTNjZDJkOTBiMDVhOTU5OTFmMWFiMGNmMjRjMWNhMGI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFR1ZSwgNiBKdW4gMjAyMyAxNDo0NDo0MiArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gcmVtb3ZlIDNrIHB1bGwgbG93IHByb2NlZHVyZQoKVGhpcyB3YXMgdGhl
IEFMQzI4MyBkZXBvcCBwcm9jZWR1cmUuCk1heWJlIHRoaXMgcHJvY2VkdXJlIHdhc24ndCBzdWl0
YWJsZSB3aXRoIG5ldyBjb2RlYy4KU28sIGxldCByZW1vdmUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBL
YWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CmRpZmYgLS1naXQgYS9zb3VuZC9wY2kv
aGRhL3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4
IGYxMDc5MGFjZTVjMS4uN2RjYzA0ZTE4NWU2IDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3Bh
dGNoX3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtMzYw
MCw3ICszNjAwLDYgQEAgc3RhdGljIHZvaWQgYWxjMjU2X2luaXQoc3RydWN0IGhkYV9jb2RlYyAq
Y29kZWMpCiAJaWYgKGhwX3Bpbl9zZW5zZSB8fCBzcGVjLT51bHRyYV9sb3dfcG93ZXIpCiAJCW1z
bGVlcCgxMDApOwogCi0JYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHg0NiwgMyA8PCAxMiwg
MCk7CiAJYWxjX3VwZGF0ZV9jb2VmZXhfaWR4KGNvZGVjLCAweDU3LCAweDA0LCAweDAwMDcsIDB4
NCk7IC8qIEhpZ2h0IHBvd2VyICovCiAJYWxjX3VwZGF0ZV9jb2VmZXhfaWR4KGNvZGVjLCAweDUz
LCAweDAyLCAweDgwMDAsIDEgPDwgMTUpOyAvKiBDbGVhciBiaXQgKi8KIAlhbGNfdXBkYXRlX2Nv
ZWZleF9pZHgoY29kZWMsIDB4NTMsIDB4MDIsIDB4ODAwMCwgMCA8PCAxNSk7CkBAIC0zNjI3LDYg
KzM2MjYsOCBAQCBzdGF0aWMgdm9pZCBhbGMyNTZfc2h1dHVwKHN0cnVjdCBoZGFfY29kZWMgKmNv
ZGVjKQogCWlmIChocF9waW5fc2Vuc2UpCiAJCW1zbGVlcCgyKTsKIAorCWFsY191cGRhdGVfY29l
ZmV4X2lkeChjb2RlYywgMHg1NywgMHgwNCwgMHgwMDA3LCAweDEpOyAvKiBMb3cgcG93ZXIgKi8K
KwogCXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIGhwX3BpbiwgMCwKIAkJCSAgICBBQ19WRVJC
X1NFVF9BTVBfR0FJTl9NVVRFLCBBTVBfT1VUX01VVEUpOwogCkBAIC0zNjM4LDkgKzM2MzksNiBA
QCBzdGF0aWMgdm9pZCBhbGMyNTZfc2h1dHVwKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCS8q
IElmIGRpc2FibGUgM2sgcHVsbGRvd24gY29udHJvbCBmb3IgYWxjMjU3LCB0aGUgTWljIGRldGVj
dGlvbiB3aWxsIG5vdCB3b3JrIGNvcnJlY3RseQogCSAqIHdoZW4gYm9vdGluZyB3aXRoIGhlYWRz
ZXQgcGx1Z2dlZC4gU28gc2tpcCBzZXR0aW5nIGl0IGZvciB0aGUgY29kZWMgYWxjMjU3CiAJICov
Ci0JaWYgKGNvZGVjLT5jb3JlLnZlbmRvcl9pZCAhPSAweDEwZWMwMjM2ICYmCi0JICAgIGNvZGVj
LT5jb3JlLnZlbmRvcl9pZCAhPSAweDEwZWMwMjU3KQotCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNv
ZGVjLCAweDQ2LCAwLCAzIDw8IDEyKTsKIAogCWlmICghc3BlYy0+bm9fc2h1dHVwX3BpbnMpCiAJ
CXNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIGhwX3BpbiwgMCwK

--_003_485f99149508488080d563144454040erealtekcom_--
