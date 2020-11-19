Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB02F2B97BF
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 17:25:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94ADA1726;
	Thu, 19 Nov 2020 17:24:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94ADA1726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605803120;
	bh=AR0HRj54qtc+cHcJ6Pp33/LNMwv+OOOpRpPD1NWiI7M=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LYYP0nKuWXCmNC/RVpYGDHcyT5Q5hOmSGCEdHSOc/aHWf5J/7RazLR0PdEJt5ho6A
	 gRkAusTDaQ/Ri3qEXJ0bXLaVK4u7onKsq4JtidKajpsPW0B47nMOJ4cB1sbhICMTXh
	 t61hHX0XX6YpmuKYDAvjl7C9phbvIhecGN3DLArE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED116F800C5;
	Thu, 19 Nov 2020 17:24:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4ED92F801F9; Thu, 19 Nov 2020 17:24:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70078.outbound.protection.outlook.com [40.107.7.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06B63F800C5
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 17:24:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06B63F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="Ncvy1KUb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MoDUV/5dvM3cZluKSWQFNMImGpuSub+V5Cf088lWGhn4Tw3EJBO2MrURO1Mq+C06w15Hs0E4tIAaxIyH9KYkTNrRYoaJVhAhxNgTryIz9Y5D8Oufykexwqqfkw1y0eAod6keyzVFM3D2bU0bjgC/VKqRs+0LfBj8R5LWl2F0RllY5yxM+nGe8bzJ43KxE96LTjchtEiInmPieWqTVT7YxkCDFEUCAD9ush4xZvzW3jfbwb/dPdcz+1KrEt7MuAgFvIX31ppxyFweb9WbW6n8Spfdyo+APA82uGMPd583K5Eb5C7YHcUI3XluIMdazsFKfeMxf+Z/gq3am+5v+BqEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AR0HRj54qtc+cHcJ6Pp33/LNMwv+OOOpRpPD1NWiI7M=;
 b=DeBi4lCroUDEEqtDgZtGItEHLQweipG8doZNp0GeL++qBDLpjs5RtCEuKzVUj00P0NFOk2Sr8ZQCIFJFQeR1PjN+84iP92uQXOdxZLMkX9sAicg3uRuxlzq54r87G/aFHE1AubYin4hGG4qfFh4ycOfq1mUd+wB6z8LTtWXes9AJYZT/+57R7esA10ql1iHFEMohjs2PnLhjiY/M6OACOuggNLDgywXtTB6gWNaL6GPMS0OEZlZDJREGIlRv1tCx/QKks8a4aAQfpsoW8wLziGWeJ/BkozK48oW1mbIp+jskcYJo/ps5kkl9hAp4g8wM1mZVVaKIs55yIgOgbFPFuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AR0HRj54qtc+cHcJ6Pp33/LNMwv+OOOpRpPD1NWiI7M=;
 b=Ncvy1KUbthNFro8lO6O4XV+2Zs0Y1oXwMnU4QurfXAvlrutgAna2BKc2aFH9rZlubjlLHSM8q/uo+b9oQOQKCofKZVFYLgaOTCO6/Rz2z+HggowqoKj+2wwSwhSgkKZz1kwTYN7YtmRydNR4i9AuRYQttZ08tKVfAw7Lalj/2Jk=
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR0402MB3488.eurprd04.prod.outlook.com
 (2603:10a6:803:10::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Thu, 19 Nov
 2020 16:24:10 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::91f8:d96b:f238:7962]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::91f8:d96b:f238:7962%8]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 16:24:10 +0000
From: Viorel Suman <viorel.suman@nxp.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, "Viorel Suman (OSS)"
 <viorel.suman@oss.nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Lee Jones
 <lee.jones@linaro.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [RFC PATCH] ASoC: ak4458: use reset control instead of reset gpio
Thread-Topic: [RFC PATCH] ASoC: ak4458: use reset control instead of reset gpio
Thread-Index: AQHWvGa/ULTQkQTG3EuXXoMLDy7cbKnPa9MAgAAJFpA=
Date: Thu, 19 Nov 2020 16:24:10 +0000
Message-ID: <VI1PR0401MB22729D51912D66FDB2973A7792E00@VI1PR0401MB2272.eurprd04.prod.outlook.com>
References: <20201116222036.343635-1-viorel.suman@oss.nxp.com>
 <cee287f3-29c1-771f-ca20-812de1ae8044@ti.com>
In-Reply-To: <cee287f3-29c1-771f-ca20-812de1ae8044@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [5.12.106.221]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3307aa86-5dd6-4855-da88-08d88ca78b96
x-ms-traffictypediagnostic: VI1PR0402MB3488:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB34888ECA9CBB9A8A9AA4161992E00@VI1PR0402MB3488.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6RTtaHMv5g4VlwvNuUC8dMtHeJdRonqdF4pGr6X+zJpFblaXiOuFxykv76WPRrT4+SWx4A2bvgvBfmXZvL32otQsnZdJtX9Lkh/PeaNz2TXveBXKwg730jUQGLJRJXRik3FN3mg05m1JAK84I7aTNVaex0MT2WQG1ueoS7r+KCny9lbkXgeA1NjXeFkQsZGJPrOjbp7LA4KZDiyWgv+6P/+Xf/p4uBOBmOguAyy+tm1gJywXh2l9Rm+oSlIB3x38fdzrhEo0Y+EZ8/x7pIahzikXbQp6OwWWbmCHg8D9pQGMKubY8UyqxxNulIkvHJHyj6h7I3n/XpRwwI1ao0EJm581ED/EpVLvSeXG/9AEIYmCI0PEJNZVw5AEkz09F89lY3BnaLcVi9bZ4JYEEJA2DQfTmy58ZULYM0bgXAFuaX/31+/KD69ULzZ4VZhjIw8v
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(7416002)(478600001)(86362001)(33656002)(71200400001)(26005)(55016002)(2906002)(921005)(44832011)(83380400001)(9686003)(5660300002)(52536014)(186003)(316002)(6506007)(7696005)(76116006)(66946007)(64756008)(8676002)(8936002)(66446008)(66556008)(110136005)(66476007)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: IFQMLRikzP4JVwCCaO95/Pe0/PxCpoEozuI6T0wvfdLt+TjyOxbVQxeEOlqa/FI+5XFRDNo3l3MaC4PfgG/aqZuUfTbcx+WEOEVMCrBH456rIZJ2uFGKKBuhJcU6tMegnVXIXBzVu5zP3AbSePrvO9Awji2/CaeGqdwV/HuaZ1ApuxvTFuPhRUQHyEnZQUWThovU0YmKnnpM8s8ChrwZ/MEji8H5w+qj//x0GJk+49egqet4Yl8MGhiHdiIklWtNgaSCGursbQe5rHTivWLaKqzyCliWUPE5CRGVFB6PDqGo5nJt/4WlxK2eHvGgOL6KqrZ9FUI0pJuvoKG7U0KKaPZ2RSADGQ9+SheG5H99vArnQeTNuCoBzUu5YsCM5orzc3HQ2Q4fgZnv44k3Qn1vm/s/D4Mqo7hb/8exzEgjIne9KJSvyIRCkvXuKM1Ilx5vg1ACBTy8stD1RaVzNogqCmys6EcZujtx5nR28udWk+WMq/PafE0dkROCfCamzBN+Amm69oZwsKo+ThtBCCtw6XSs/T3BeffjGtsp2HPw3zbNzciahkonoGcjdU2qgvzjGV9j3KLESIYGdhUzk6Wim3HEabL4bFh7QWPgXgAMQH6qcOUaexEEfWRqLfeT9otjLQEau6sTeNaoEg1PKH+M8Q==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3307aa86-5dd6-4855-da88-08d88ca78b96
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 16:24:10.1002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dqyALH0srer/zEqDHnpzjgyMMe3jhQjPBSVzTXeVKc7xPkB9QeN2pEcWTdjMeuIMpXVYrQtXyEmEoHaxN9P5PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3488
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

SGkgUGV0ZXIsDQoNCj4gRFRTIGlzIHN1cHBvc2VkIHRvIGxvb2sgYXMgZm9sbG93czoNCj4gPg0K
PiA+IC8gew0KPiA+ICAgICBhazQ0NThfcmVzZXQ6IGdwaW8tcmVzZXQgew0KPiA+ICAgICAgICBj
b21wYXRpYmxlID0gImdwaW8tcmVzZXQiOw0KPiA+ICAgICAgICByZXNldC1ncGlvcyA9IDwmcGNh
NjQxNiA0IEdQSU9fQUNUSVZFX0xPVz47DQo+ID4gICAgICAgICNyZXNldC1jZWxscyA9IDwwPjsN
Cj4gPiAgICAgICAgaW5pdGlhbGx5LWluLXJlc2V0Ow0KPiANCj4gSSBjYW4gbm90IGZpbmQgYW55
dGhpbmcgcmVzZW1ibGluZyB0byB0aGlzIGluIG5leHQtMjAyMDExMTkuDQo+IFdoZXJlIGlzIHRo
ZSBpbXBsZW1lbnRhdGlvbiBhbmQgZG9jdW1lbnRhdGlvbiBmb3IgdGhpcyBncGlvLXJlc2V0Pw0K
DQpUaGUgYm9hcmQgc2NoZW1hdGljcyBpcyBub3QgcHVibGljbHkgYXZhaWxhYmxlOyBzb21lIGlu
Zm8gbWF5IGJlIHNlZW4gaW4gRFRTIGZpbGVzIGJlbG93Og0KaHR0cHM6Ly9zb3VyY2UuY29kZWF1
cm9yYS5vcmcvZXh0ZXJuYWwvaW14L2xpbnV4LWlteC90cmVlL2FyY2gvYXJtNjQvYm9vdC9kdHMv
ZnJlZXNjYWxlL2lteDhtbS1ldmsuZHRzP2g9aW14XzUuNC4yNF8yLjEuMA0KaHR0cHM6Ly9zb3Vy
Y2UuY29kZWF1cm9yYS5vcmcvZXh0ZXJuYWwvaW14L2xpbnV4LWlteC90cmVlL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1hYjIuZHRzP2g9aW14XzUuNC4yNF8yLjEuMA0KaHR0
cHM6Ly9zb3VyY2UuY29kZWF1cm9yYS5vcmcvZXh0ZXJuYWwvaW14L2xpbnV4LWlteC90cmVlL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1hYjIuZHRzP2g9aW14XzUuNC4yNF8y
LjEuMA0KDQpJbiBleGFtcGxlcyBhYm92ZSB0aGUgR1BJTyBpcyBoYW5kbGVkIGJ5IG1hY2hpbmUg
ZHJpdmVyIC0gd3JvbmcgYXBwcm9hY2ggZ2l2ZW4gdGhhdA0KaXQgcmVxdWlyZXMgbWFjaGluZSBk
cml2ZXIgYmVpbmcgcHJvYmVkIGJlZm9yZSBjb2RlYyBkcml2ZXIuDQoNCj4gPiAtCWFrNDQ1OC0+
cmVzZXRfZ3Bpb2QgPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChhazQ0NTgtPmRldiwNCj4gInJl
c2V0IiwNCj4gPiAtCQkJCQkJICAgICAgR1BJT0RfT1VUX0xPVyk7DQo+ID4gLQlpZiAoSVNfRVJS
KGFrNDQ1OC0+cmVzZXRfZ3Bpb2QpKQ0KPiA+IC0JCXJldHVybiBQVFJfRVJSKGFrNDQ1OC0+cmVz
ZXRfZ3Bpb2QpOw0KPiA+ICsJYWs0NDU4LT5yZXNldCA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRf
b3B0aW9uYWxfc2hhcmVkKGFrNDQ1OC0NCj4gPmRldiwgTlVMTCk7DQo+ID4gKwlpZiAoSVNfRVJS
KGFrNDQ1OC0+cmVzZXQpKQ0KPiA+ICsJCXJldHVybiBQVFJfRVJSKGFrNDQ1OC0+cmVzZXQpOw0K
PiANCj4gVGhlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBtdXN0IGJlIHVwZGF0ZWQgYW5kIHlvdSBt
dXN0IHN1cHBvcnQgdGhlIGdwaW8NCj4gd2F5IGFzIHdlbGwuDQoNClN1cmUsIG1ha2Ugc2Vuc2Uu
DQoNCj4gV2hlbiBJIGhhZCB0aGlzIGRpc2N1c3Npb24gYXJvdW5kIHVzaW5nIHRoZSByZXNldCBm
cmFtZXdvcmsgZm9yIHNoYXJlZA0KPiBlbmFibGUgYW5kL29yIHJlc2V0IHBpbnMgaXQgd2FzIHN1
Z2dlc3RlZCB0aGF0IF9pZl8gc3VjaCBhIGRyaXZlciBtYWtlcw0KPiBzZW5zZSB0aGVuIGl0IHNo
b3VsZCBpbnRlcm5hbGx5IGhhbmRsZSAoYnkgdXNpbmcgbWFnaWMgc3RyaW5ncykgdGhlIGZhbGxi
YWNrDQo+IGFuZCB3b3JrIHdpdGggcHJlLXJlc2V0IGJpbmRpbmcuDQoNClRoYW5rcywgd291bGQg
YXBwcmVjaWF0ZSBpZiB5b3UgcG9pbnQgbWUgdG8gdGhlIGRpc2N1c3Npb24geW91IGhhZC4NCg0K
VmlvcmVsDQo=
