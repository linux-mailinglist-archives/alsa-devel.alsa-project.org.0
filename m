Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C15911D9035
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 08:41:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 113A117E0;
	Tue, 19 May 2020 08:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 113A117E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589870510;
	bh=r2/Z7AU0j0hWHkVWRJX/Bz10jFblnhltlU8ctopMwUY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nUicItVAtxVbQkxNjM1ZV0AhCjehJbE8cZBJuSpUU7pZE3X/eS2P8BHWFhn5GhQ9h
	 sCbq2VF5FpISnX9DBC93dP0YR83tOzCvPOHJvDYbkkYX9tHcLC1b/CHqVL+M28kjzo
	 eYdSgELGMG2jpypHF42KWWZHbLLWmKIcx2I5SFlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37AD5F801A3;
	Tue, 19 May 2020 08:40:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61891F801A3; Tue, 19 May 2020 08:40:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=PRX_APP_ATTACH,PRX_BODY_94,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85CBAF80132
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 08:39:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85CBAF80132
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 04J6dkGqB004153,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 04J6dkGqB004153
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 19 May 2020 14:39:46 +0800
Received: from RTEXMB04.realtek.com.tw (172.21.6.97) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 19 May 2020 14:39:46 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 19 May 2020 14:39:45 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8]) by
 RTEXMB01.realtek.com.tw ([fe80::d53a:d9a5:318:7cd8%5]) with mapi id
 15.01.1779.005; Tue, 19 May 2020 14:39:45 +0800
From: Pshou <pshou@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: =?utf-8?B?5Zue6KaGOiDlm57opoY6IENMRVZPIHVzZXMgdGhlIG1vZGVsIG5hbWUgYW5k?=
 =?utf-8?Q?_SSID_list_of_Realtek_audio_CODEC_ALC1220?=
Thread-Topic: =?utf-8?B?5Zue6KaGOiBDTEVWTyB1c2VzIHRoZSBtb2RlbCBuYW1lIGFuZCBTU0lEIGxp?=
 =?utf-8?Q?st_of_Realtek_audio_CODEC_ALC1220?=
Thread-Index: AdYoKUh6WPXISdSXRwu3jOBqWXLI2wCMTl+AAJ7hoaAAAWqugAAx95Lw
Date: Tue, 19 May 2020 06:39:45 +0000
Message-ID: <82505b43d61f4a5bbf6fffdca5fc0fbb@realtek.com>
References: <63d2069dd6394e0195739bd9dd3de5d0@realtek.com>
 <s5hsgg1mszs.wl-tiwai@suse.de>	<dd45ef275b494538a4d4748480698c78@realtek.com>
 <s5hsgfxib2i.wl-tiwai@suse.de>
In-Reply-To: <s5hsgfxib2i.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.203]
Content-Type: multipart/mixed;
 boundary="_002_82505b43d61f4a5bbf6fffdca5fc0fbbrealtekcom_"
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kailang <kailang@realtek.com>, "tiwai@suse.com" <tiwai@suse.com>
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

--_002_82505b43d61f4a5bbf6fffdca5fc0fbbrealtekcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgVGFrYXNoOg0KDQpJcyBpdCBva2F5IHRvIGNoYW5nZSB0aGlzIHdheT8NCg0KUGVpU2VuIEhv
dSA8cHNob3VAcmVhbHRlay5jb20+DQpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9y
ZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYw0KDQpCZXN0IHJlZ2FyZHMN
CnBzaG91DQoNCi0tLS0t5Y6f5aeL6YO15Lu2LS0tLS0NCuWvhOS7tuiAhTogVGFrYXNoaSBJd2Fp
IDx0aXdhaUBzdXNlLmRlPiANCuWvhOS7tuaXpeacnzogMjAyMOW5tDXmnIgxOOaXpSAyMjoxNQ0K
5pS25Lu26ICFOiBQc2hvdSA8cHNob3VAcmVhbHRlay5jb20+DQrlia/mnKw6IGFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZzsgdGl3YWlAc3VzZS5jb207IEthaWxhbmcgPGthaWxhbmdAcmVhbHRl
ay5jb20+DQrkuLvml6g6IFJlOiDlm57opoY6IENMRVZPIHVzZXMgdGhlIG1vZGVsIG5hbWUgYW5k
IFNTSUQgbGlzdCBvZiBSZWFsdGVrIGF1ZGlvIENPREVDIEFMQzEyMjANCg0KT24gTW9uLCAxOCBN
YXkgMjAyMCAxMToxMzo0OCArMDIwMCwNClBzaG91IHdyb3RlOg0KPiANCj4gSGkgVGFrYXNoOg0K
PiANCj4gSSBoYXZlIGFkZGVkIHRoZSAiU2lnbmVkLW9mZi1ieSIgbGluZS4NCj4gQ2FuIHlvdSBz
ZWUgaWYgeW91IGNhbj8NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBzaG91IDxwc2hvdUByZWFsdGVr
LmNvbT4NCg0KV2UgbmVlZCBhIHJlYWwgZnVsbCBuYW1lIGhlcmUgdG8gU2lnbmVkLW9mZi1ieSBs
aW5lLiAgSXQncyBhIGxlZ2FsIHJlcXVpcmVtZW50LiAgQ291bGQgeW91IGZpbGwgaXQgYW5kIHJl
c2VuZD8NCg0KDQp0aGFua3MsDQoNClRha2FzaGkNCg0KPiBkaWZmIC0tZ2l0IGEvc291bmQvcGNp
L2hkYS9wYXRjaF9yZWFsdGVrLmMgDQo+IGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMN
Cj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBQc2hvdQ0KPiANCj4gLS0tLS3ljp/lp4vpg7Xku7YtLS0t
LQ0KPiDlr4Tku7bogIU6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4NCj4g5a+E5Lu25pel
5pyfOiAyMDIw5bm0NeaciDE15pelIDE3OjQ1DQo+IOaUtuS7tuiAhTogUHNob3UgPHBzaG91QHJl
YWx0ZWsuY29tPg0KPiDlia/mnKw6IHRpd2FpQHN1c2UuY29tOyBLYWlsYW5nIDxrYWlsYW5nQHJl
YWx0ZWsuY29tPg0KPiDkuLvml6g6IFJlOiBDTEVWTyB1c2VzIHRoZSBtb2RlbCBuYW1lIGFuZCBT
U0lEIGxpc3Qgb2YgUmVhbHRlayBhdWRpbyBDT0RFQyANCj4gQUxDMTIyMA0KPiANCj4gT24gRnJp
LCAxNSBNYXkgMjAyMCAxMToyNDo0NSArMDIwMCwNCj4gUHNob3Ugd3JvdGU6DQo+ID4gDQo+ID4g
SGkgVGFrYXNoaToNCj4gPiANCj4gPiBDYW4geW91IGhlbHAgbWUgYWRkIHNvbWUgc291cmNlIGNv
ZGUgdG8gcGF0Y2hfcmVhbHRlay5jPw0KPiA+IA0KPiA+IEFkZCBzb21lIENMRVZPIFNTSUQgaW4g
dGhlIGFsYzEyMjAuDQo+ID4gDQo+ID4gICAgICAgICBTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHg2
N2QxLCAiQ2xldm8gUEI3MVtFUl1bQ0RGXSIsIA0KPiA+IEFMQzEyMjBfRklYVVBfQ0xFVk9fUEI1
MUVEX1BJTlMpLA0KPiA+IA0KPiA+ICsgICAgICBTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHg1MGQz
LCAiQ2xldm8gUEM1MFtFUl1bQ0RGXSIsDQo+ID4gQUxDMTIyMF9GSVhVUF9DTEVWT19QQjUxRURf
UElOUyksDQo+ID4gDQo+ID4gKyAgICAgIFNORF9QQ0lfUVVJUksoMHgxNTU4LCAweDcwZDEsICJD
bGV2byBQQzcwW0VSXVtDREZdIiwNCj4gPiBBTEMxMjIwX0ZJWFVQX0NMRVZPX1BCNTFFRF9QSU5T
KSwNCj4gPiANCj4gPiArICAgICAgU05EX1BDSV9RVUlSSygweDE1NTgsIDB4NzcxNCwgIkNsZXZv
IFgxNzAiLA0KPiA+IEFMQzEyMjBfRklYVVBfQ0xFVk9fUEI1MUVEX1BJTlMpLA0KPiA+IA0KPiA+
ICAgICAgIFNORF9QQ0lfUVVJUktfVkVORE9SKDB4MTU1OCwgIkNsZXZvIGxhcHRvcCIsIA0KPiA+
IEFMQzg4Ml9GSVhVUF9FQVBEKSwNCj4gDQo+IFN1cmUsIGNvdWxkIHlvdSBnaXZlIHlvdXIgU2ln
bmVkLW9mZi1ieSBsaW5lLCBzbyB0aGF0IEkgY2FuIHJlYXJyYW5nZSwgc3VibWl0IHRvIGFsc2Et
ZGV2ZWwgYW5kIG1lcmdlIHRvIHVwc3RyZWFtPw0KPiANCj4gDQo+IHRoYW5rcywNCj4gDQo+IFRh
a2FzaGkNCj4gDQo+IC0tLS0tLVBsZWFzZSBjb25zaWRlciB0aGUgZW52aXJvbm1lbnQgYmVmb3Jl
IHByaW50aW5nIHRoaXMgZS1tYWlsLg0KPiBbMiAwMDAxLUFkZC1zZXZlcmFsLUNsZXZvLVNTSUQt
aW4tdGhlLUFMQzEyMjAucGF0Y2ggDQo+IDxhcHBsaWNhdGlvbi9vY3RldC1zdHJlYW0gKGJhc2U2
NCk+XQ0KPiANCg==

--_002_82505b43d61f4a5bbf6fffdca5fc0fbbrealtekcom_
Content-Type: application/octet-stream;
	name="0001-Add-several-Clevo-SSID-in-the-ALC1220.patch"
Content-Description: 0001-Add-several-Clevo-SSID-in-the-ALC1220.patch
Content-Disposition: attachment;
	filename="0001-Add-several-Clevo-SSID-in-the-ALC1220.patch"; size=1016;
	creation-date="Mon, 18 May 2020 21:38:58 GMT";
	modification-date="Mon, 18 May 2020 21:38:58 GMT"
Content-Transfer-Encoding: base64

UGVpU2VuIEhvdSA8cHNob3VAcmVhbHRlay5jb20+CmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRh
L3BhdGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IDJm
OTg4ZjguLmMzN2U0ZmMgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5j
CisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC0yNDc0LDYgKzI0NzQsOSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9wY2lfcXVpcmsgYWxjODgyX2ZpeHVwX3RibFtdID0g
ewogCVNORF9QQ0lfUVVJUksoMHgxNTU4LCAweDk3ZTEsICJDbGV2byBQOTcwW0VSXVtDREZOXSIs
IEFMQzEyMjBfRklYVVBfQ0xFVk9fUDk1MCksCiAJU05EX1BDSV9RVUlSSygweDE1NTgsIDB4NjVk
MSwgIkNsZXZvIFBCNTFbRVJdW0NERl0iLCBBTEMxMjIwX0ZJWFVQX0NMRVZPX1BCNTFFRF9QSU5T
KSwKIAlTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHg2N2QxLCAiQ2xldm8gUEI3MVtFUl1bQ0RGXSIs
IEFMQzEyMjBfRklYVVBfQ0xFVk9fUEI1MUVEX1BJTlMpLAorCVNORF9QQ0lfUVVJUksoMHgxNTU4
LCAweDUwZDMsICJDbGV2byBQQzUwW0VSXVtDREZdIiwgQUxDMTIyMF9GSVhVUF9DTEVWT19QQjUx
RURfUElOUyksCisJU05EX1BDSV9RVUlSSygweDE1NTgsIDB4NzBkMSwgIkNsZXZvIFBDNzBbRVJd
W0NERl0iLCBBTEMxMjIwX0ZJWFVQX0NMRVZPX1BCNTFFRF9QSU5TKSwKKwlTTkRfUENJX1FVSVJL
KDB4MTU1OCwgMHg3NzE0LCAiQ2xldm8gWDE3MCIsIEFMQzEyMjBfRklYVVBfQ0xFVk9fUEI1MUVE
X1BJTlMpLAogCVNORF9QQ0lfUVVJUktfVkVORE9SKDB4MTU1OCwgIkNsZXZvIGxhcHRvcCIsIEFM
Qzg4Ml9GSVhVUF9FQVBEKSwKIAlTTkRfUENJX1FVSVJLKDB4MTYxZiwgMHgyMDU0LCAiTWVkaW9u
IGxhcHRvcCIsIEFMQzg4M19GSVhVUF9FQVBEKSwKIAlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgz
YTBkLCAiTGVub3ZvIFk1MzAiLCBBTEM4ODJfRklYVVBfTEVOT1ZPX1k1MzApLAo=

--_002_82505b43d61f4a5bbf6fffdca5fc0fbbrealtekcom_--
