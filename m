Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6319D2094A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 16:13:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3DCD16DC;
	Thu, 16 May 2019 16:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3DCD16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558016004;
	bh=LBvzrguxPu3rV6/4mKEuPoKCTyRuV2YYD/VcGPLuG0U=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=YtZ9gE+IFYQzLMz+EwPcZu/sDEAf/xT2GQPU/w1zjNkGMLyUB7xWh6S8uWKcuNu3+
	 SDJWXAAHop5r7RnbNVsOP3l4e+2Kgp7PBgr5wLpeZCSNJiPCoTesmYnCRRYP01VYOw
	 7NUp8GzaItb+TZVsPIhqYuTgiOsReRrF95+1eHR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69DE5F89693;
	Thu, 16 May 2019 16:11:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CEE9F896B6; Thu, 16 May 2019 16:11:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40069.outbound.protection.outlook.com [40.107.4.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F5DFF8078F
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 16:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F5DFF8078F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="i76VpgiQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4akrvowfNyYOehKZ9Q5YErSNQPJay5iHlfxaOvuhEPk=;
 b=i76VpgiQVZoc/X5heZ2agVEU8hhJxMXmZOelbMfCRH5pOoFL7xvLigfWfVTe8pAOtnADo47LCc/esbULrFL8e756tE/puMhRgGrpz4M50BK0Up3mEyWp66SpYImOAwxGI9fw1KvUrlH1o13Mui7pW3vbE01LNznOOgLLhGr1BEI=
Received: from VI1PR04MB4704.eurprd04.prod.outlook.com (20.177.48.157) by
 VI1PR04MB4591.eurprd04.prod.outlook.com (20.177.55.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Thu, 16 May 2019 14:11:31 +0000
Received: from VI1PR04MB4704.eurprd04.prod.outlook.com
 ([fe80::2ce8:d8f5:9745:99df]) by VI1PR04MB4704.eurprd04.prod.outlook.com
 ([fe80::2ce8:d8f5:9745:99df%6]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 14:11:31 +0000
From: Viorel Suman <viorel.suman@nxp.com>
To: "festevam@gmail.com" <festevam@gmail.com>
Thread-Topic: [alsa-devel] [PATCH] ASoC: AK4458: add regulator for ak4458
Thread-Index: AQHVC+dix6gnGF9HoUCg65Wy4dJcvqZtutYAgAAP3wA=
Date: Thu, 16 May 2019 14:11:31 +0000
Message-ID: <1558015890.29679.3.camel@nxp.com>
References: <1558011640-7864-1-git-send-email-viorel.suman@nxp.com>
 <CAOMZO5C1jm=7tiui221B-N+ptEknK_ZdHvrjvSHfvQ=W-K54Qw@mail.gmail.com>
In-Reply-To: <CAOMZO5C1jm=7tiui221B-N+ptEknK_ZdHvrjvSHfvQ=W-K54Qw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=viorel.suman@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6493366-7844-4f82-b7fe-08d6da08652f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB4591; 
x-ms-traffictypediagnostic: VI1PR04MB4591:
x-microsoft-antispam-prvs: <VI1PR04MB459174B631E2E0546C9B4082920A0@VI1PR04MB4591.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(39860400002)(396003)(376002)(346002)(136003)(366004)(199004)(189003)(5660300002)(5640700003)(256004)(186003)(26005)(6512007)(14444005)(53546011)(6506007)(102836004)(25786009)(3450700001)(14454004)(4744005)(76176011)(86362001)(54906003)(1411001)(6436002)(6486002)(99286004)(7416002)(43066004)(2616005)(229853002)(2351001)(11346002)(446003)(486006)(44832011)(103116003)(6916009)(478600001)(36756003)(73956011)(76116006)(64756008)(66446008)(66476007)(66946007)(66556008)(8676002)(4326008)(68736007)(7736002)(316002)(6116002)(3846002)(305945005)(2906002)(476003)(6246003)(71190400001)(71200400001)(66066001)(81156014)(1730700003)(2501003)(1361003)(53936002)(8936002)(81166006)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4591;
 H:VI1PR04MB4704.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yd9D9JtUEWpHOI8vI9vZtmh45EI/o928pHF8cDnwL8wQoMMTnzJjRGj6s27TcG23PkRU5z8+c1zYvzEZxAvnjkwFjNxMIQ3DHMomLN4JXbbvpARTFqvSK8ugSrcJKdPpdyABVAtxM68x2a2oZ1vy5lVJLX62h+4XPq4B1fZ8VqdpKMop3D7WKFDcOy65Fmp4sfUunE3z4wH3dtuilDSfVlmDRamU3nGhr6BbtWJWFbJ+2Qa4WLTqC23r8+S20552IpaDe1yooqaO0PGrbspkXzbOxqvcEbbZBUCHy3+yAuWS73A2RWSgVT79i6wM+Vapi/3Lq4sXhzFzjrEuqKi7MHgK17hWCZB9r8PLxwXna2j2KIuW9vyCkVk0iUnBwyFdFicHe7G/T3WkmIEFfRV585W/xv7HS7GWgFiXp29HIcE=
Content-ID: <9AFBB40C861ED643B8A18A2B24339827@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6493366-7844-4f82-b7fe-08d6da08652f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 14:11:31.0134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4591
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "viorel.suman@gmail.com" <viorel.suman@gmail.com>,
 "Julia.Lawall@lip6.fr" <Julia.Lawall@lip6.fr>,
 "broonie@kernel.org" <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "colin.king@canonical.com" <colin.king@canonical.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: AK4458: add regulator for ak4458
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
Reply-To: Viorel Suman <viorel.suman@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gSm8sIDIwMTktMDUtMTYgYXQgMTA6MTQgLTAzMDAsIEZhYmlvIEVzdGV2YW0gd3JvdGU6DQo+
IE9uIFRodSwgTWF5IDE2LCAyMDE5IGF0IDEwOjAyIEFNIFZpb3JlbCBTdW1hbiA8dmlvcmVsLnN1
bWFuQG54cC5jb20+IHdyb3RlOg0KPiANCj4gPiANCj4gPiArwqDCoMKgwqDCoMKgwqBmb3IgKGkg
PSAwOyBpIDwgQVJSQVlfU0laRShhazQ0NTgtPnN1cHBsaWVzKTsgaSsrKQ0KPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhazQ0NTgtPnN1cHBsaWVzW2ldLnN1cHBseSA9IGFrNDQ1
OF9zdXBwbHlfbmFtZXNbaV07DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoHJldCA9IGRldm1f
cmVndWxhdG9yX2J1bGtfZ2V0KGFrNDQ1OC0+ZGV2LCBBUlJBWV9TSVpFKGFrNDQ1OC0+c3VwcGxp
ZXMpLA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFrNDQ1OC0+c3VwcGxpZXMpOw0KPiA+ICvCoMKg
wqDCoMKgwqDCoGlmIChyZXQgIT0gMCkgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBkZXZfZXJyKGFrNDQ1OC0+ZGV2LCAiRmFpbGVkIHRvIHJlcXVlc3Qgc3VwcGxpZXM6ICVk
XG4iLCByZXQpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0
Ow0KPiBUaGlzIHdvdWxkIGJyZWFrIGV4aXN0aW5nIHVzZXJzIHRoYXQgZG8gbm90IHBhc3MgdGhl
IHJlZ3VsYXRvcnMgaW4gZGV2aWNlIHRyZWUuDQo+IA0KPiBPaywgaW4gdGhpcyBjYXNlIHRoZXJl
IGlzIG5vIGFrNDQ1OCB1c2VyIGluIGFueSBkdHMsIHNvIHRoYXQgd291bGQgbm90DQo+IGJlIGFu
IGlzc3VlLg0KPiANCj4gUGxlYXNlIHVwZGF0ZSB0aGUgZHQtYmluZGluZ3Mgd2l0aCB0aGUgcmVn
dWxhdG9yIGVudHJpZXMuDQoNClRoYW5rcywgd2lsbCBzZW5kIGluIFYyLg0KDQovVmlvcmVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwg
bWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4u
YWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
