Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0073E2A3A0D
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 02:51:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FCE5173C;
	Tue,  3 Nov 2020 02:51:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FCE5173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604368314;
	bh=jXsBWDngzItI4c0m+l7GIzlewQnVCNIef/IDw6mIoc4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PeIF1FVRPDdfRrWwqGraSqFr8BtREdR9G1Wpj+GQ0aMLMn8VXNPv3RiYwchjA3M+L
	 Hx9awpHx1gA6OetPPR/XP3ToXaz2/SmZ98AGHAatX+3+/gp61g3U3uzRYnHEplPUNI
	 OmcBO9W0wCCMUuJ3Mz+05HAzbd6zWUg89GdkxprU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D5ABF80083;
	Tue,  3 Nov 2020 02:50:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFB79F80232; Tue,  3 Nov 2020 02:50:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35C5BF8015A
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 02:50:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35C5BF8015A
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0A31o3Kg9031833,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0A31o3Kg9031833
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 3 Nov 2020 09:50:03 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Tue, 3 Nov 2020 09:50:02 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2]) by
 RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2%8]) with mapi id
 15.01.2106.003; Tue, 3 Nov 2020 09:50:02 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>
Subject: RE: [PATCH] ASoC: rt1015: support TDM slot configuration
Thread-Topic: [PATCH] ASoC: rt1015: support TDM slot configuration
Thread-Index: AQHWsPjuJUkb0/8uwkWQKeqrZZUxlKm0afeAgAEsbLA=
Date: Tue, 3 Nov 2020 01:50:02 +0000
Message-ID: <33af2503fe4f46e49ff9682bad80b570@realtek.com>
References: <20201102091656.25379-1-shumingf@realtek.com>
 <3d8b58fa-81c2-ea9e-8627-b5c58ca91c7a@linux.intel.com>
In-Reply-To: <3d8b58fa-81c2-ea9e-8627-b5c58ca91c7a@linux.intel.com>
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

PiA+ICtzdGF0aWMgaW50IHJ0MTAxNV9zZXRfdGRtX3Nsb3Qoc3RydWN0IHNuZF9zb2NfZGFpICpk
YWksDQo+ID4gKwl1bnNpZ25lZCBpbnQgdHhfbWFzaywgdW5zaWduZWQgaW50IHJ4X21hc2ssIGlu
dCBzbG90cywgaW50DQo+ID4gK3Nsb3Rfd2lkdGgpIHsNCj4gPiArCXN0cnVjdCBzbmRfc29jX2Nv
bXBvbmVudCAqY29tcG9uZW50ID0gZGFpLT5jb21wb25lbnQ7DQo+ID4gKwl1bnNpZ25lZCBpbnQg
dmFsID0gMCwgcnhfc2xvdG51bSwgdHhfc2xvdG51bTsNCj4gPiArCWludCByZXQgPSAwLCBmaXJz
dF9iaXQ7DQo+ID4gKw0KPiA+ICsJc3dpdGNoIChzbG90cykgew0KPiA+ICsJY2FzZSA0Og0KPiA+
ICsJCXZhbCB8PSBSVDEwMTVfSTJTX1RYXzRDSDsNCj4gPiArCQlicmVhazsNCj4gPiArCWNhc2Ug
NjoNCj4gPiArCQl2YWwgfD0gUlQxMDE1X0kyU19UWF82Q0g7DQo+ID4gKwkJYnJlYWs7DQo+ID4g
KwljYXNlIDg6DQo+ID4gKwkJdmFsIHw9IFJUMTAxNV9JMlNfVFhfOENIOw0KPiA+ICsJCWJyZWFr
Ow0KPiA+ICsJY2FzZSAyOg0KPiA+ICsJCWJyZWFrOw0KPiANCj4gbml0LXBpY2s6IEkgd291bGQg
cHV0IHRoZSBjYXNlIDIgZmlyc3QgdG8ga2VlcCB0aGUgb3JkZXIuIEkgdGhvdWdodCBmb3IgYSBz
ZWNvbmQNCj4gdGhpcyB3YXMgYW4gZXJyb3IgY2FzZSBkdWUgdG8gdGhlIGRpc2NvbnRpbnVpdHku
DQoNCk9LLCB3aWxsIGZpeCB0aGF0Lg0KDQo+ID4gKwlkZWZhdWx0Og0KPiA+ICsJCXJldCA9IC1F
SU5WQUw7DQo+ID4gKwkJZ290byBfc2V0X3RkbV9lcnJfOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAr
CXN3aXRjaCAoc2xvdF93aWR0aCkgew0KPiA+ICsJY2FzZSAyMDoNCj4gPiArCQl2YWwgfD0gUlQx
MDE1X0kyU19DSF9UWF9MRU5fMjBCOw0KPiA+ICsJCWJyZWFrOw0KPiA+ICsJY2FzZSAyNDoNCj4g
PiArCQl2YWwgfD0gUlQxMDE1X0kyU19DSF9UWF9MRU5fMjRCOw0KPiA+ICsJCWJyZWFrOw0KPiA+
ICsJY2FzZSAzMjoNCj4gPiArCQl2YWwgfD0gUlQxMDE1X0kyU19DSF9UWF9MRU5fMzJCOw0KPiA+
ICsJCWJyZWFrOw0KPiA+ICsJY2FzZSAxNjoNCj4gPiArCQlicmVhazsNCj4gDQo+IG5pdC1waWNr
OiBzYW1lIGhlcmUsIEkgd291bGQgcHV0IDE2IGZpcnN0Lg0KPiANCj4gPiArCWRlZmF1bHQ6DQo+
ID4gKwkJcmV0ID0gLUVJTlZBTDsNCj4gPiArCQlnb3RvIF9zZXRfdGRtX2Vycl87DQo+ID4gKwl9
DQo+ID4gKw0KPiA+ICsJLyogUnggc2xvdCBjb25maWd1cmF0aW9uICovDQo+ID4gKwlyeF9zbG90
bnVtID0gaHdlaWdodF9sb25nKHJ4X21hc2spOw0KPiA+ICsJaWYgKHJ4X3Nsb3RudW0gPiAxIHx8
ICFyeF9zbG90bnVtKSB7DQo+IA0KPiBJIGFtIGNvbmZ1c2VkIGhlcmUsIGlzIHRoaXMgc2F5aW5n
IHlvdSBjYW4gb25seSBoYXZlIGEgc2luZ2xlIGNoYW5uZWwgb24gUlg/DQo+IA0KPiBJZiB5ZXMg
c2hvdWxkIHRoaXMgYmUgc2ltcGxpZmllZCBhcyBpZiAocnhfc2xvdG51bSAhPSAxKSA/DQoNClll
cywgUlQxMDE1IGlzIGEgbW9ubyBhbXBsaWZpZXIsIHNvIG9ubHkgYSBzaW5nbGUgY2hhbm5lbCB3
aWxsIGJlIGNvbmZpZ3VyZWQuDQpJIHdpbGwgZml4IHRoZSBjaGVjayBjb25kaXRpb24gYXMgeW91
ciBzdWdnZXN0aW9uLiBUaGFua3MuDQoNCj4gPiArCQlyZXQgPSAtRUlOVkFMOw0KPiA+ICsJCWRl
dl9lcnIoY29tcG9uZW50LT5kZXYsICJ0b28gbWFueSByeCBzbG90cyBvciB6ZXJvIHNsb3RcbiIp
Ow0KPiA+ICsJCWdvdG8gX3NldF90ZG1fZXJyXzsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlmaXJz
dF9iaXQgPSBfX2ZmcyhyeF9tYXNrKTsNCj4gPiArCXN3aXRjaCAoZmlyc3RfYml0KSB7DQo+ID4g
KwljYXNlIDA6DQo+ID4gKwljYXNlIDI6DQo+ID4gKwljYXNlIDQ6DQo+ID4gKwljYXNlIDY6DQo+
ID4gKwkJc25kX3NvY19jb21wb25lbnRfdXBkYXRlX2JpdHMoY29tcG9uZW50LA0KPiA+ICsJCQlS
VDEwMTVfUEFEX0RSVjIsIFJUMTAxNV9NT05PX0xSX1NFTF9NQVNLLA0KPiA+ICsJCQlSVDEwMTVf
TU9OT19MX0NIQU5ORUwpOw0KPiA+ICsJCXNuZF9zb2NfY29tcG9uZW50X3VwZGF0ZV9iaXRzKGNv
bXBvbmVudCwNCj4gPiArCQkJUlQxMDE1X1RETTFfNCwNCj4gPiArCQkJUlQxMDE1X1RETV9JMlNf
VFhfTF9EQUMxXzFfTUFTSyB8DQo+ID4gKwkJCVJUMTAxNV9URE1fSTJTX1RYX1JfREFDMV8xX01B
U0ssDQo+ID4gKwkJCShmaXJzdF9iaXQgPDwgUlQxMDE1X1RETV9JMlNfVFhfTF9EQUMxXzFfU0ZU
KSB8DQo+ID4gKwkJCSgoZmlyc3RfYml0KzEpIDw8IFJUMTAxNV9URE1fSTJTX1RYX1JfREFDMV8x
X1NGVCkpOw0KPiANCj4gbG9va3MgbGlrZSB0aGVyZSdzIGFuIGFzc3VtcHRpb24gdGhhdCB0aGUg
cnggbWFzayBoYXMgY29udGlndW91cyBiaXRzIHNldD8NCj4gTWF5YmUgYWRkIGEgY29tbWVudCB0
byBleHBsYWluIGhvdyB0aGUgUlggcGF0aCB3b3Jrcz8NCg0KWWVzLiBJbiB0aGUgbm9ybWFsIGNh
c2UsIHRoZSBzeXN0ZW0gd2lsbCBzZW5kIHRoZSBzdGVyZW8gYXVkaW8gdG8gdGhlIGNvZGVjLg0K
SSBhc3N1bWUgdGhhdCB0aGUgc3RlcmVvIGF1ZGlvIGlzIHBsYWNlZCBpbiBzbG90IDAvMi80LzYu
DQpJIHdpbGwgYWRkIGEgY29tbWVudCBhYm92ZSB0aGlzIHN3aXRjaCBjYXNlLg0KDQo+ID4gKwkJ
YnJlYWs7DQo+ID4gKwljYXNlIDE6DQo+ID4gKwljYXNlIDM6DQo+ID4gKwljYXNlIDU6DQo+ID4g
KwljYXNlIDc6DQo+ID4gKwkJc25kX3NvY19jb21wb25lbnRfdXBkYXRlX2JpdHMoY29tcG9uZW50
LA0KPiA+ICsJCQlSVDEwMTVfUEFEX0RSVjIsIFJUMTAxNV9NT05PX0xSX1NFTF9NQVNLLA0KPiA+
ICsJCQlSVDEwMTVfTU9OT19SX0NIQU5ORUwpOw0KPiA+ICsJCXNuZF9zb2NfY29tcG9uZW50X3Vw
ZGF0ZV9iaXRzKGNvbXBvbmVudCwNCj4gPiArCQkJUlQxMDE1X1RETTFfNCwNCj4gPiArCQkJUlQx
MDE1X1RETV9JMlNfVFhfTF9EQUMxXzFfTUFTSyB8DQo+ID4gKwkJCVJUMTAxNV9URE1fSTJTX1RY
X1JfREFDMV8xX01BU0ssDQo+ID4gKwkJCSgoZmlyc3RfYml0LTEpIDw8IFJUMTAxNV9URE1fSTJT
X1RYX0xfREFDMV8xX1NGVCkgfA0KPiA+ICsJCQkoZmlyc3RfYml0IDw8IFJUMTAxNV9URE1fSTJT
X1RYX1JfREFDMV8xX1NGVCkpOw0KPiA+ICsJCWJyZWFrOw0K
