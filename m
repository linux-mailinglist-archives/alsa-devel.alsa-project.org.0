Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBE611CFBB
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 15:25:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB82E16D6;
	Thu, 12 Dec 2019 15:24:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB82E16D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576160720;
	bh=6G9E7k8PsmupEQpApDHgsm+joitD2sHsm3W7qnQj9GE=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RzudSgR/p9Q8HypE26BJwngiEr81YNSWRI+rrFGUD73Vj6DhfoXzqSFzsgqzVjfHx
	 F61HYNn+ZzALhiNyV4fMDliTv+eKImlcI6KH8n/cNF3k9hsgkLDSDYFZGlTtsdf/91
	 NQdkgbK7i84vRayUvyx6RIAHqk/iVEhwW6/ZpORg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62D69F8027B;
	Thu, 12 Dec 2019 15:19:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42093F8020C; Thu, 12 Dec 2019 10:24:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_SPF_HELO,SPF_HELO_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::61e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 356E3F800EC
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 10:24:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 356E3F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="AyGXu9vm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjzElu1fbcYKJGClvlxTeF3QdyNh1VgsbtrQimfD4FoAKucuicqhTQiwUVo26j7o4IiZFd4WGVNM2cUE1xQx39Q5mi+2bcpvwBprnwaoKbVErYK13wMnhDSeu8y5DziUq3snQc/Vc8g6AyxZk+ZxSMqzHL3FLPZkSGm4xOV3bb35DieHAydiES7TR8iqWAOn6oR7nJY9QrJXShRcQblo2YKEd3A1qv+qPidz4Q4IYfFH8k4Ztz9cQs0Hok3E9Z8vbBpXsJ7ucRxy3EMuIWbmXgM7HiviiaBgFDDn7olhtH6suXqM2CHdLkW0EScxuTRjtbvfyi2VhzoqxnbP6as8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bUsp7tpe2CrFkKpjsbXbgjp+KboaM10geoPb9dQU3g=;
 b=ZCMZWjwFC0XRyng0LmRRypbTku0td1idSC8LdZJqayH7w7NXY+eLfzGmuBEmcKDsWORkRogDca04FhnVkinrMjkaxPGw/RyDQu2bm2cAJ/qA93ixI6stMV/2Q9/tVyryXFyeUl0VIB4llbM6vFJVMQs0GIuW9tkvQk/k3oEB/hEl3KR2Dp87W7F025z1N83W7dg8IqK34BC08Tz+BMDEUMGswhx0lon9zOT/8TT8dkaJK5d6O8FWH624yEicTWXZOxA7HiPXZZIBONA7fLEgnbm1Xudt4/wQf1u/dWKVdROuwo12fwjgK2aq8K/PbCJ3vzrxdum4dpSKYAe4SNButQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bUsp7tpe2CrFkKpjsbXbgjp+KboaM10geoPb9dQU3g=;
 b=AyGXu9vmnVZQcvyYMo9jvVpiUWxbA4irTTzmUETYnJ2zmGp2Xj5Xj7l0uK3EMKIVZG5I4E4bOy6gVrj/QrzVgOXZaVEJVYZTDwuxinshf8J20Waus6Un2CIt0/41sVdA/N4WhsNYPB1nYrh8aE/treLbFKtU8G3JtuUKeFENV2M=
Received: from VI1PR04MB4062.eurprd04.prod.outlook.com (52.133.12.32) by
 VI1PR04MB5935.eurprd04.prod.outlook.com (20.178.204.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Thu, 12 Dec 2019 09:24:42 +0000
Received: from VI1PR04MB4062.eurprd04.prod.outlook.com
 ([fe80::20fe:3e38:4eec:ea03]) by VI1PR04MB4062.eurprd04.prod.outlook.com
 ([fe80::20fe:3e38:4eec:ea03%7]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 09:24:42 +0000
From: Alison Wang <alison.wang@nxp.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Thread-Topic: [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC: sgtl5000: Fix of
 unmute outputs on probe"
Thread-Index: AQHVsLyIRDFbzLs7vEuxsFkXl6DgTKe2NokAgAAA1bA=
Date: Thu, 12 Dec 2019 09:24:42 +0000
Message-ID: <VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
References: <20191212071847.45561-1-alison.wang@nxp.com>
 <CAGgjyvHHzPWjRTqxYmGCmk3qa6=kOezHywVDFomgD6UNj-zwpQ@mail.gmail.com>
In-Reply-To: <CAGgjyvHHzPWjRTqxYmGCmk3qa6=kOezHywVDFomgD6UNj-zwpQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alison.wang@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: deb4047d-c061-4012-8145-08d77ee51ece
x-ms-traffictypediagnostic: VI1PR04MB5935:|VI1PR04MB5935:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <VI1PR04MB5935F1D0D7C36AE5376BE9FDF4550@VI1PR04MB5935.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(189003)(199004)(13464003)(7696005)(316002)(2906002)(44832011)(66946007)(53546011)(55016002)(33656002)(66616009)(9686003)(5660300002)(6506007)(66446008)(66556008)(66476007)(64756008)(54906003)(52536014)(478600001)(8676002)(81156014)(86362001)(8936002)(4326008)(6916009)(76116006)(26005)(71200400001)(81166006)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5935;
 H:VI1PR04MB4062.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7PYhQR1ZAE0yEcDJRS8jNPAs10LcP0GOwQMBgVxnn7dVXp7/moUIkioBSRXMmb1eZU6kdv92pH11zO1SBhl7PuuvZ//r89j1VJlDijB+o0Sshl3thpB/mkHQorMFbnmy3pJ81kmuQPG699MXnQTnvLb1ov6VaVBYWriWixuMAEDP9lMUcTgdge6uaxGiqC+efvV6Js4pB4cS5l9HZz/4MxIPZj2urkkpAuHg0vviX+ED8c6Pff/q1mpjg37HTWAkWvaBgBGHAw+cR1OfzFb/DFpYeGAlIBEKWgRXYvtEWdJ16xvxKXDk0fx4ZWyMg0MY3vQS/wEJfO0R7r3spUmYblwLvbEOsGFGtZQz70lO+D0TW7dlxlob4G7XOdQVE391aWCOeqEQZUU7vN392PS6vyWw71YhJP5Qh9rSHD5Wx7O1HaS/x8oX8HgwbwLX+OcGq1BZAR2BbSX1puefYKoNqqB4xri83LhMdFf12HCN657/AEjWFJZnd4iGxSo4hHd4
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_002_VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550VI1PR04MB4062eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb4047d-c061-4012-8145-08d77ee51ece
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 09:24:42.4585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hAljXWXyS55kxv/YzmM98XJi95yy2ZxI9v0mfY4apkwFWbYt3CM2xgDiTyBccVyS1qWPcs77C1vG6aohZbHq3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5935
X-Mailman-Approved-At: Thu, 12 Dec 2019 15:19:27 +0100
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC:
 sgtl5000: Fix of unmute outputs on probe"
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

--_002_VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550VI1PR04MB4062eurp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE9sZWtzYW5kciwNCg0KSSB0aGluayBJIGhhdmUgZXhwbGFpbmVkIHRoZSByZWFzb24gaW4g
bXkgZW1haWwgd2hpY2ggc2VudCB0byB5b3UgeWVzdGVyZGF5LiBJIGF0dGFjaGVkIGl0IHRvby4N
CkFjY29yZGluZyB0byBteSB0ZXN0IG9uIHRoZSBib2FyZHMsIE1VVEVfTE8sIE1VVEVfSFAgYW5k
IE1VVEVfQURDIGFyZSBhbGwgbXV0ZWQgd2hlbg0KcGxheWluZyB0aGUgc291bmQuDQoNCkNvdWxk
IHlvdSBnaXZlIG1lIHNvbWUgaWRlYXMgYWJvdXQgdGhpcyBpc3N1ZT8NCg0KDQpCZXN0IFJlZ2Fy
ZHMsSSANCkFsaXNvbiBXYW5nDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBPbGVrc2FuZHIgU3V2b3JvdiA8b2xla3NhbmRyLnN1dm9yb3ZAdG9yYWRleC5jb20+DQo+
IFNlbnQ6IFRodXJzZGF5LCBEZWNlbWJlciAxMiwgMjAxOSA1OjExIFBNDQo+IFRvOiBBbGlzb24g
V2FuZyA8YWxpc29uLndhbmdAbnhwLmNvbT4NCj4gQ2M6IE1hcmNlbCBaaXN3aWxlciA8bWFyY2Vs
Lnppc3dpbGVyQHRvcmFkZXguY29tPjsgSWdvciBPcGFuaXVrDQo+IDxpZ29yLm9wYW5pdWtAdG9y
YWRleC5jb20+OyBmZXN0ZXZhbUBnbWFpbC5jb207IGJyb29uaWVAa2VybmVsLm9yZzsNCj4gbGdp
cmR3b29kQGdtYWlsLmNvbTsgT2xla3NhbmRyIFN1dm9yb3YgPG9sZWtzYW5kci5zdXZvcm92QHRv
cmFkZXguY29tPjsNCj4gYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0hdIEFTb0M6IHNndGw1
MDAwOiBSZXZlcnQgIkFTb0M6IHNndGw1MDAwOiBGaXggb2YNCj4gdW5tdXRlIG91dHB1dHMgb24g
cHJvYmUiDQo+IA0KPiBDYXV0aW9uOiBFWFQgRW1haWwNCj4gDQo+IEFsaXNvbiwgY291bGQgeW91
IHBsZWFzZSBleHBsYWluLCB3aGF0IHJlYXNvbiB0byByZXZlcnQgdGhpcyBmaXg/IEFsbCB0aGVz
ZSBibG9ja3MNCj4gaGF2ZSB0aGVpciBvd24gY29udHJvbCBhbmQgdW5tdXRlIG9uIGRlbWFuZC4N
Cj4gV2h5IGRvIHlvdSBzdGFuZCBvbiB1bmNvbmRpdGlvbmFsIHVubXV0aW5nIG9mIG91dHB1dHMg
YW5kIEFEQyBvbiBkcml2ZXINCj4gcHJvYmluZz8NCj4gDQo+IE9uIFRodSwgRGVjIDEyLCAyMDE5
IGF0IDk6MjAgQU0gQWxpc29uIFdhbmcgPGFsaXNvbi53YW5nQG54cC5jb20+DQo+IHdyb3RlOg0K
PiA+DQo+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCA2MzFiYzhmMDEzNGFlOTYyMGQ4NmE5NmI4YzVm
OTQ0NWQ5MWEyZGNhLg0KPiA+DQo+ID4gSW4gY29tbWl0IDYzMWJjOGYwMTM0YSwgc25kX3NvY19j
b21wb25lbnRfdXBkYXRlX2JpdHMgaXMgdXNlZCBpbnN0ZWFkDQo+ID4gb2Ygc25kX3NvY19jb21w
b25lbnRfd3JpdGUuIEFsdGhvdWdoIEVOX0hQX1pDRCBhbmQgRU5fQURDX1pDRCBhcmUNCj4gPiBl
bmFibGVkIGluIEFOQV9DVFJMIHJlZ2lzdGVyLCBNVVRFX0xPLCBNVVRFX0hQIGFuZCBNVVRFX0FE
QyBiaXRzIGFyZQ0KPiA+IHJlbWFpbmVkIGFzIHRoZSBkZWZhdWx0IHZhbHVlLiBJdCBjYXVzZXMg
TE8sIEhQIGFuZCBBREMgYXJlIGFsbCBtdXRlZA0KPiA+IGFmdGVyIGRyaXZlciBwcm9iZS4NCj4g
Pg0KPiA+IFRoZSBwYXRjaCBpcyB0byByZXZlcnQgdGhpcyBjb21taXQsIHNuZF9zb2NfY29tcG9u
ZW50X3dyaXRlIGlzIHN0aWxsDQo+ID4gdXNlZCBhbmQgTVVURV9MTywgTVVURV9IUCBhbmQgTVVU
RV9BREMgYXJlIHNldCBhcyB6ZXJvICh1bm11dGVkKS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IEFsaXNvbiBXYW5nIDxhbGlzb24ud2FuZ0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBzb3VuZC9z
b2MvY29kZWNzL3NndGw1MDAwLmMgfCA2ICsrKy0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3NvdW5k
L3NvYy9jb2RlY3Mvc2d0bDUwMDAuYyBiL3NvdW5kL3NvYy9jb2RlY3Mvc2d0bDUwMDAuYw0KPiA+
IGluZGV4IGFhMWY5NjMuLjBiMzVmY2EgMTAwNjQ0DQo+ID4gLS0tIGEvc291bmQvc29jL2NvZGVj
cy9zZ3RsNTAwMC5jDQo+ID4gKysrIGIvc291bmQvc29jL2NvZGVjcy9zZ3RsNTAwMC5jDQo+ID4g
QEAgLTE0NTgsNyArMTQ1OCw2IEBAIHN0YXRpYyBpbnQgc2d0bDUwMDBfcHJvYmUoc3RydWN0DQo+
IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQpDQo+ID4gICAgICAgICBpbnQgcmV0Ow0KPiA+
ICAgICAgICAgdTE2IHJlZzsNCj4gPiAgICAgICAgIHN0cnVjdCBzZ3RsNTAwMF9wcml2ICpzZ3Rs
NTAwMCA9DQo+IHNuZF9zb2NfY29tcG9uZW50X2dldF9kcnZkYXRhKGNvbXBvbmVudCk7DQo+ID4g
LSAgICAgICB1bnNpZ25lZCBpbnQgemNkX21hc2sgPSBTR1RMNTAwMF9IUF9aQ0RfRU4gfA0KPiBT
R1RMNTAwMF9BRENfWkNEX0VOOw0KPiA+DQo+ID4gICAgICAgICAvKiBwb3dlciB1cCBzZ3RsNTAw
MCAqLw0KPiA+ICAgICAgICAgcmV0ID0gc2d0bDUwMDBfc2V0X3Bvd2VyX3JlZ3MoY29tcG9uZW50
KTsNCj4gPiBAQCAtMTQ4Niw4ICsxNDg1LDkgQEAgc3RhdGljIGludCBzZ3RsNTAwMF9wcm9iZShz
dHJ1Y3QNCj4gc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCkNCj4gPiAgICAgICAgICAgICAg
ICAweDFmKTsNCj4gPiAgICAgICAgIHNuZF9zb2NfY29tcG9uZW50X3dyaXRlKGNvbXBvbmVudCwN
Cj4gU0dUTDUwMDBfQ0hJUF9QQURfU1RSRU5HVEgsDQo+ID4gcmVnKTsNCj4gPg0KPiA+IC0gICAg
ICAgc25kX3NvY19jb21wb25lbnRfdXBkYXRlX2JpdHMoY29tcG9uZW50LA0KPiBTR1RMNTAwMF9D
SElQX0FOQV9DVFJMLA0KPiA+IC0gICAgICAgICAgICAgICB6Y2RfbWFzaywgemNkX21hc2spOw0K
PiA+ICsgICAgICAgc25kX3NvY19jb21wb25lbnRfd3JpdGUoY29tcG9uZW50LA0KPiBTR1RMNTAw
MF9DSElQX0FOQV9DVFJMLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIFNHVEw1MDAwX0hQ
X1pDRF9FTiB8DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgU0dUTDUwMDBfQURDX1pDRF9F
Tik7DQo+ID4NCj4gPiAgICAgICAgIHNuZF9zb2NfY29tcG9uZW50X3VwZGF0ZV9iaXRzKGNvbXBv
bmVudCwNCj4gU0dUTDUwMDBfQ0hJUF9NSUNfQ1RSTCwNCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICBTR1RMNTAwMF9CSUFTX1JfTUFTSywNCj4gPiAtLQ0KPiA+IDIuOS41DQo+ID4NCj4gDQo+
IA0KPiAtLQ0KPiBCZXN0IHJlZ2FyZHMNCj4gT2xla3NhbmRyIFN1dm9yb3YNCj4gDQo+IFRvcmFk
ZXggQUcNCj4gQWx0c2FnZW5zdHJhc3NlIDUgfCA2MDQ4IEhvcncvTHV6ZXJuIHwgU3dpdHplcmxh
bmQgfCBUOiArNDEgNDEgNTAwDQo+IDQ4MDAgKG1haW4gbGluZSkNCg==

--_002_VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550VI1PR04MB4062eurp_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Thu, 12 Dec 2019 09:24:39 GMT";
	modification-date="Thu, 12 Dec 2019 09:24:39 GMT"

From: Alison Wang <alison.wang@nxp.com>
To: "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>, Marcel
 Ziswiler <marcel.ziswiler@toradex.com>, "igor.opaniuk@toradex.com"
	<igor.opaniuk@toradex.com>, Fabio Estevam <festevam@gmail.com>,
	"broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [v6,5/6] ASoC: sgtl5000: Fix of unmute outputs on probe
Thread-Topic: [v6,5/6] ASoC: sgtl5000: Fix of unmute outputs on probe
Thread-Index: AdWv8c/6ILgEMkLmRYinQyj4db74kQAAAgFQ
Date: Wed, 11 Dec 2019 07:59:23 +0000
Message-ID:  <VI1PR04MB4062BD2BB10ADE4EB0DF9C37F45A0@VI1PR04MB4062.eurprd04.prod.outlook.com>
References:  <VI1PR04MB4062948CF9A3C420C6345A7DF45A0@VI1PR04MB4062.eurprd04.prod.outlook.com>
In-Reply-To:  <VI1PR04MB4062948CF9A3C420C6345A7DF45A0@VI1PR04MB4062.eurprd04.prod.outlook.com>
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Hi, Oleksandr,

I have a question about this patch. Could you give me some ideas? Thanks.

In this patch, snd_soc_component_update_bits is used instead of snd_soc_com=
ponent_write. Although EN_HP_ZCD and EN_ADC_ZCD are enabled in ANA_CTRL reg=
ister, MUTE_LO, MUTE_HP and MUTE_ADC bits are remained as the default value=
. It causes LO, HP and ADC are all muted after driver probe. BTW, in the or=
iginal code, snd_soc_component_write is used and MUTE_LO, MUTE_HP and MUTE_=
ADC are all set as zero (unmute).

I saw the above phenomenon on the latest linux-next. For LO and HP are mute=
d, no sound can be heard.


Best Regards,
Alison Wang

> Subject: [v6,5/6] ASoC: sgtl5000: Fix of unmute outputs on probe
>=20
> To enable "zero cross detect" for ADC/HP, change HP_ZCD_EN/ADC_ZCD_EN
> bits only instead of writing the whole CHIP_ANA_CTRL register.
>=20
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Reviewed-by: Igor Opaniuk <igor.opaniuk@toradex.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
>=20
> ---
>=20
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - Fix patch formatting
>=20
>  sound/soc/codecs/sgtl5000.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
>=20
> diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c in=
dex
> b65232521ea8..23f4ae2f0723 100644
> --- a/sound/soc/codecs/sgtl5000.c
> +++ b/sound/soc/codecs/sgtl5000.c
> @@ -1453,6 +1453,7 @@  static int sgtl5000_probe(struct
> snd_soc_component *component)
>  	int ret;
>  	u16 reg;
>  	struct sgtl5000_priv *sgtl5000 =3D
> snd_soc_component_get_drvdata(component);
> +	unsigned int zcd_mask =3D SGTL5000_HP_ZCD_EN |
> SGTL5000_ADC_ZCD_EN;
>=20
>  	/* power up sgtl5000 */
>  	ret =3D sgtl5000_set_power_regs(component);
> @@ -1480,9 +1481,8 @@  static int sgtl5000_probe(struct
> snd_soc_component *component)
>  	       0x1f);
>  	snd_soc_component_write(component, SGTL5000_CHIP_PAD_STRENGTH,
> reg);
>=20
> -	snd_soc_component_write(component, SGTL5000_CHIP_ANA_CTRL,
> -			SGTL5000_HP_ZCD_EN |
> -			SGTL5000_ADC_ZCD_EN);
> +	snd_soc_component_update_bits(component,
> SGTL5000_CHIP_ANA_CTRL,
> +		zcd_mask, zcd_mask);
>=20
>  	snd_soc_component_update_bits(component,
> SGTL5000_CHIP_MIC_CTRL,
>  			SGTL5000_BIAS_R_MASK,
>=20


--_002_VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550VI1PR04MB4062eurp_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550VI1PR04MB4062eurp_--
