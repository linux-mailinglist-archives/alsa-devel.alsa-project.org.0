Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D352A5C17
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 02:43:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FDE5169E;
	Wed,  4 Nov 2020 02:43:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FDE5169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604454232;
	bh=XiW3bYVLOO4gDesEujYrke+52xShDWO3MUtcS8866l8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LaIF1wyinCniCpgFcYTMoT0IDjkjYoph2pjFBLObOupCAduYsXbZzUGwaQT49qFZH
	 WXu5nFcEXIK8gg5KiAoto01iwrHJvwBj5plRVRxH3Y+amj+5S+OLyr9AOt6rU8PLq3
	 VV3jvu9/7zB6uLR8xlwhjxhFZ9LUTqcSeFOK7cmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A47E9F80162;
	Wed,  4 Nov 2020 02:42:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E768F80171; Wed,  4 Nov 2020 02:42:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D556DF8015A
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 02:42:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D556DF8015A
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0A41g1ytD024501,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0A41g1ytD024501
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 4 Nov 2020 09:42:01 +0800
Received: from RTEXMB02.realtek.com.tw (172.21.6.95) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Wed, 4 Nov 2020 09:42:01 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMB02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Wed, 4 Nov 2020 09:42:01 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2]) by
 RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2%8]) with mapi id
 15.01.2106.003; Wed, 4 Nov 2020 09:42:00 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>
Subject: RE: [PATCH v2] ASoC: rt1015: support TDM slot configuration
Thread-Topic: [PATCH v2] ASoC: rt1015: support TDM slot configuration
Thread-Index: AQHWscG3IaPJsdSghk62C8+T4qtpAqm2B5uAgAEroqA=
Date: Wed, 4 Nov 2020 01:42:00 +0000
Message-ID: <8640bbac481c42508aecebeb8ef658cf@realtek.com>
References: <20201103091402.8126-1-shumingf@realtek.com>
 <659af5ba-9854-b6d2-95f7-36fd1a5b2bfe@linux.intel.com>
In-Reply-To: <659af5ba-9854-b6d2-95f7-36fd1a5b2bfe@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.209]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?utf-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>, "Keith.Tzeng@quantatw.com" <Keith.Tzeng@quantatw.com>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "brent.lu@intel.com" <brent.lu@intel.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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

PiA+ICsJLyogVGhpcyBpcyBhbiBhc3N1bXB0aW9uIHRoYXQgdGhlIHN5c3RlbSBzZW5kcyBzdGVy
ZW8gYXVkaW8gdG8gdGhlDQo+IGFtcGxpZmllciB0eXBpY2FsbHkuDQo+ID4gKwkgKiBBbmQgdGhl
IHN0ZXJlbyBhdWRpbyBpcyBwbGFjZWQgaW4gc2xvdCAwLzIvNC82IGFzIHRoZSBzdGFydGluZyBz
bG90Lg0KPiA+ICsJICogQWNjb3JkaW5nIHRvIHRoZSBzbG90IG51bWJlciwgd2UgYWxzbyBzZXQg
dGhlIG1vbm8gTFIgdG8gc2VsZWN0IHRoZQ0KPiByaWdodCBzbG90Lg0KPiA+ICsJICovDQo+ID4g
KwlmaXJzdF9iaXQgPSBfX2ZmcyhyeF9tYXNrKTsNCj4gPiArCXN3aXRjaCAoZmlyc3RfYml0KSB7
DQo+ID4gKwljYXNlIDA6DQo+ID4gKwljYXNlIDI6DQo+ID4gKwljYXNlIDQ6DQo+ID4gKwljYXNl
IDY6DQo+ID4gKwkJc25kX3NvY19jb21wb25lbnRfdXBkYXRlX2JpdHMoY29tcG9uZW50LA0KPiA+
ICsJCQlSVDEwMTVfUEFEX0RSVjIsIFJUMTAxNV9NT05PX0xSX1NFTF9NQVNLLA0KPiA+ICsJCQlS
VDEwMTVfTU9OT19MX0NIQU5ORUwpOw0KPiA+ICsJCXNuZF9zb2NfY29tcG9uZW50X3VwZGF0ZV9i
aXRzKGNvbXBvbmVudCwNCj4gPiArCQkJUlQxMDE1X1RETTFfNCwNCj4gPiArCQkJUlQxMDE1X1RE
TV9JMlNfVFhfTF9EQUMxXzFfTUFTSyB8DQo+ID4gKwkJCVJUMTAxNV9URE1fSTJTX1RYX1JfREFD
MV8xX01BU0ssDQo+ID4gKwkJCShmaXJzdF9iaXQgPDwgUlQxMDE1X1RETV9JMlNfVFhfTF9EQUMx
XzFfU0ZUKSB8DQo+ID4gKwkJCSgoZmlyc3RfYml0KzEpIDw8IFJUMTAxNV9URE1fSTJTX1RYX1Jf
REFDMV8xX1NGVCkpOw0KPiA+ICsJCWJyZWFrOw0KPiA+ICsJY2FzZSAxOg0KPiA+ICsJY2FzZSAz
Og0KPiA+ICsJY2FzZSA1Og0KPiA+ICsJY2FzZSA3Og0KPiA+ICsJCXNuZF9zb2NfY29tcG9uZW50
X3VwZGF0ZV9iaXRzKGNvbXBvbmVudCwNCj4gPiArCQkJUlQxMDE1X1BBRF9EUlYyLCBSVDEwMTVf
TU9OT19MUl9TRUxfTUFTSywNCj4gPiArCQkJUlQxMDE1X01PTk9fUl9DSEFOTkVMKTsNCj4gPiAr
CQlzbmRfc29jX2NvbXBvbmVudF91cGRhdGVfYml0cyhjb21wb25lbnQsDQo+ID4gKwkJCVJUMTAx
NV9URE0xXzQsDQo+ID4gKwkJCVJUMTAxNV9URE1fSTJTX1RYX0xfREFDMV8xX01BU0sgfA0KPiA+
ICsJCQlSVDEwMTVfVERNX0kyU19UWF9SX0RBQzFfMV9NQVNLLA0KPiA+ICsJCQkoKGZpcnN0X2Jp
dC0xKSA8PCBSVDEwMTVfVERNX0kyU19UWF9MX0RBQzFfMV9TRlQpIHwNCj4gPiArCQkJKGZpcnN0
X2JpdCA8PCBSVDEwMTVfVERNX0kyU19UWF9SX0RBQzFfMV9TRlQpKTsNCj4gPiArCQlicmVhazsN
Cj4gDQo+IE9uZSBtb3JlIHF1ZXN0aW9uIGZyb20gbWU6IGlmIHlvdSBoYXZlIDIgYW1wbGlmaWVy
cyBvbiB0aGUgc2FtZSBsaW5rIGFuZCB1c2UNCj4gc2xvdCAwIGFuZCAxLCB3aGF0IHdvdWxkIGJl
IHRoZSByeF9tYXNrIGZvciBlYWNoIGFtcGxpZmllcj8gSWYgdGhlIG1hc2sgaXMNCj4gQklUKDAp
IGZvciBsZWZ0IGFuZCBCSVQoMSkgZm9yIHJpZ2h0LCBpdCBsb29rcyBsaWtlIGJvdGggd291bGQg
cmVuZGVyIEwrUj8NCg0KT2gsIEkgZGlkbid0IGV4cGVjdCB0aGF0IHRoZSBjdXN0b21lcnMgd2Fu
dCB0byByZW5kZXIgTCtSIHdoZW4gdXNpbmcgVERNIGNvbmZpZ3VyYXRpb24uDQoNCj4gQWxzbyBz
aG91bGQgdGhlIHNldHRpbmdzIGFuZCBjaGFubmVsIHNlbGVjdGlvbiBiZSBtb2RpZmlhYmxlIHVz
aW5nIHRoZSBjb2RlYw0KPiBjb25maWd1cmF0aW9uIGFzIHdlJ3ZlIGRvbmUgZm9yIFJUMTMwOCwg
ZS5nLiBydDEwMTUtMSB3b3VsZCB1c2UgTEwgYW5kDQo+IHJ0MTAxNS0yIHdvdWxkIHVzZSBSUj8N
Cg0KT0ssIEkgd2lsbCByZW1vdmUgdGhlIG1vbm8gTFIgY2hhbm5lbCBzZWxlY3Rpb24gaW4gcnQx
MDE1X3NldF90ZG1fc2xvdCBmdW5jdGlvbi4NClRoZSBjaGFubmVsIHNlbGVjdGlvbiBzZXR0aW5n
IHdvdWxkIGJlIGNvbnRyb2xsZWQgYnkgdGhlIGFwcGxpY2F0aW9uIGxldmVsIG9ubHkuDQpSVDEw
MTUgaXMgYSBtb25vIGFtcGxpZmllciwgaXQgY291bGQgc2VsZWN0ICdMZWZ0JywgJ1JpZ2h0JyBh
bmQgJ0xlZnQgKyBSaWdodCBhdmVyYWdlJy4NCg0KPiANCj4gVGhhbmtzDQo+IC1QaWVycmUNCj4g
DQo+IC0tLS0tLVBsZWFzZSBjb25zaWRlciB0aGUgZW52aXJvbm1lbnQgYmVmb3JlIHByaW50aW5n
IHRoaXMgZS1tYWlsLg0K
