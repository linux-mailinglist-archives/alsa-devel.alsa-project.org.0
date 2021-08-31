Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAB73FC767
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Aug 2021 14:39:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FD671729;
	Tue, 31 Aug 2021 14:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FD671729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630413558;
	bh=vt6atietADvSg6kqAbKKjSeZIYsiqB7/9ofLS2Ir9+s=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DeJeXlZ6QFkfnDhl6X7gSZpdG5RE9YfuHyK0daHJRCFkYrgg4O3utJLXg8PBhbjP9
	 XeGwSt8DXYJUhi9Do0Ilx2oy6RwIXGM6MI0pGiOinz9sauPelYB2ao1SJYg7ZvP3Hn
	 QAYqAL8ey/IO2uUHL3Hg47S0Q35sa8fjYAHlAtyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0E58F80269;
	Tue, 31 Aug 2021 14:38:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0323CF8025B; Tue, 31 Aug 2021 14:37:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BD26F800BE
 for <alsa-devel@alsa-project.org>; Tue, 31 Aug 2021 14:37:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BD26F800BE
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 17VCbc3lB009559,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 17VCbc3lB009559
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Aug 2021 20:37:38 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 31 Aug 2021 20:37:37 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 31 Aug 2021 20:37:37 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::ddc7:f5b1:d3ae:8354]) by
 RTEXMBS01.realtek.com.tw ([fe80::ddc7:f5b1:d3ae:8354%5]) with mapi id
 15.01.2106.013; Tue, 31 Aug 2021 20:37:36 +0800
From: =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
To: Bard liao <yung-chuan.liao@linux.intel.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Subject: RE: [PATCH 1/2] ASoC: rt5682s: Add driver for ALC5682I-VS codec
Thread-Topic: [PATCH 1/2] ASoC: rt5682s: Add driver for ALC5682I-VS codec
Thread-Index: AQHXmlG6wErj5sEQCkm83JSM93MaYquM8wgAgACgu+A=
Date: Tue, 31 Aug 2021 12:37:36 +0000
Message-ID: <f78bb0bcf2f84e9592aa7bba48860fa3@realtek.com>
References: <20210826080938.14872-1-derek.fang@realtek.com>
 <8d4c9eed-e641-36c9-6727-ac744e87ff45@linux.intel.com>
In-Reply-To: <8d4c9eed-e641-36c9-6727-ac744e87ff45@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.142]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzgvMzEg5LiK5Y2IIDA4OjAxOjAw?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 08/31/2021 12:25:17
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 165881 [Aug 31 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: derek.fang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 460 460 984a5b846aca9773080f7b1ec5049bf53f1b6f95
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2; realtek.com:7.1.1
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, from}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/31/2021 12:28:00
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, Albert Chen <albertchen@realtek.com>,
 =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
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

DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBBU29DOiBydDU2ODJzOiBBZGQgZHJpdmVyIGZv
ciBBTEM1NjgySS1WUyBjb2RlYw0KPiANCj4gT24gOC8yNi8yMDIxIDQ6MDkgUE0sIGRlcmVrLmZh
bmdAcmVhbHRlay5jb20gd3JvdGU6DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IGlzX3N5c19jbGtf
ZnJvbV9wbGxhKHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0ICp3LA0KPiA+ICsJCXN0cnVjdCBz
bmRfc29jX2RhcG1fd2lkZ2V0ICpzaW5rKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3Qgc25kX3NvY19j
b21wb25lbnQgKmNvbXBvbmVudCA9DQo+IHNuZF9zb2NfZGFwbV90b19jb21wb25lbnQody0+ZGFw
bSk7DQo+ID4gKwlzdHJ1Y3QgcnQ1Njgyc19wcml2ICpydDU2ODJzID0NCj4gc25kX3NvY19jb21w
b25lbnRfZ2V0X2RydmRhdGEoY29tcG9uZW50KTsNCj4gPiArDQo+ID4gKwlpZiAoKHJ0NTY4MnMt
PnN5c2Nsa19zcmMgPT0gUlQ1NjgyU19DTEtfU1JDX1BMTDEpIHx8DQo+ID4gKwkgICAgKHJ0NTY4
MnMtPnN5c2Nsa19zcmMgPT0gUlQ1NjgyU19DTEtfU1JDX1BMTDIgJiYNCj4gPiArCSAgICAgcnQ1
Njgycy0+cGxsX2NvbWIgPT0gVVNFX1BMTEFCKSkNCj4gDQo+IA0KPiBXaGF0IGFib3V0IHJ0NTY4
MnMtPnBsbF9jb21iID09IFVTRV9QTExBPw0KDQpUaGFua3MgZm9yIHJldmlldy4NCg0KTXkgZGVz
aWduIHRob3VnaHQgb2YgdGhpcyBjaGVjayBmdW5jdGlvbiBpcyB0aGF0DQpwbGxfY29tYiB3b3Vs
ZCBiZSBzZXQgdmlhIHNuZF9zb2NfZGFpX3NldF9wbGwgYW5kIA0Kc3lzY2xrX3NyYyB3b3VsZCBi
ZSBzZXQgdmlhIHNuZF9zb2NfZGFpX3NldF9zeXNjbGsuDQoNClNvIEkgd2FudCB0byBtYWtlIHN1
cmUgdGhlIHR3byBzZXR0aW5ncyBhcmUgYm90aCBjb3JyZWN0IGZpcnN0DQphbmQgdGhlbiBwb3dl
ciBQTExBL0IuDQpPdGhlcndpc2UsIG5vdCBwb3dlciwgYWx0aG91Z2ggdGhlIGNoYW5jZSBvZiBt
aXN0YWtlIGlzIHJhcmUuDQoNCiAgIF9fXyAgICstLT5bUExMQV0tKy0tLS0tLS0tLS0tLS0tLS0t
LS0+IFBMTDEgb3V0DQogIHxDbGt8ICB8ICAgICAgICAgIHwgICAgX19fDQogIHxNdXh8LS18ICAg
ICAgICAgICstLT58Q2xrfA0KICB8X19ffCAgfAkgICAgICAgIHxNdXh8LS0+W1BMTEJdLS0+IFBM
TDIgb3V0DQoJICstLS0tLS0tLS0tLS0tPnxfX198DQoNCj4gDQo+ID4gKwkJcmV0dXJuIDE7DQo+
ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgaXNf
c3lzX2Nsa19mcm9tX3BsbGIoc3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgKncsDQo+ID4gKwkJ
c3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgKnNpbmspDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBz
bmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50ID0NCj4gc25kX3NvY19kYXBtX3RvX2NvbXBvbmVu
dCh3LT5kYXBtKTsNCj4gPiArCXN0cnVjdCBydDU2ODJzX3ByaXYgKnJ0NTY4MnMgPQ0KPiBzbmRf
c29jX2NvbXBvbmVudF9nZXRfZHJ2ZGF0YShjb21wb25lbnQpOw0KPiA+ICsNCj4gPiArCWlmIChy
dDU2ODJzLT5zeXNjbGtfc3JjID09IFJUNTY4MlNfQ0xLX1NSQ19QTEwyKQ0KPiANCj4gDQo+IFNo
b3VsZCB3ZSBhbHNvIHRlc3QgcnQ1Njgycy0+cGxsX2NvbWIgaGVyZT8NCj4gDQo+IA0KPiA+ICsJ
CXJldHVybiAxOw0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4NCj4gLS0tLS0t
UGxlYXNlIGNvbnNpZGVyIHRoZSBlbnZpcm9ubWVudCBiZWZvcmUgcHJpbnRpbmcgdGhpcyBlLW1h
aWwuDQo=
