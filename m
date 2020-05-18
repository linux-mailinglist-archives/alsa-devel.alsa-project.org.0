Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2D71D7B0C
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 16:22:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05A6816F3;
	Mon, 18 May 2020 16:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05A6816F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589811776;
	bh=vsUz1msV1GEbu1UYDLHdeLahA4Mes1IytICh7uBLGHQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h8/aTxHnMpeuRHJ1y/0z1B7pC00T+T1uzfOzmycq2MhXkOonAOoqMGbpLse+pxvoH
	 bzny2qf/2EEWrCwpzSd53EzPUvpFIoMvwDNaowKTMzG6ZNnJJzoXr3OZal+N8GgfAe
	 JRjgTs6Au2fNdt4ezJeLyEa8RcOf9X2or8P3ohA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFB10F802D2;
	Mon, 18 May 2020 16:18:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4EB2F80216; Mon, 18 May 2020 11:11:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60069.outbound.protection.outlook.com [40.107.6.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9710BF8015C
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 11:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9710BF8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="rZWIxvWS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BP+57A5T2FB0ttmjX5/8nDEj6CKQVlhBiUHwJ0YlfEoROoieJdViMr45OdZxq8+4ARzZyGaj3vP8Q3eEtdbAF904hTY83svCxl5Hy3srD0dw2IIrV+mAGaG9mi3kuTM6NiMRwMyk501a77f2MD56XPAhtWMu5onGYjrCNdV1w54Fc0yObP5UlBlq9JwbTmHPwYMid7CHOVds6g8R8qVRzIUUiVK1o1p0jyfkaCr7I6QF0kHuAH9OIfJ6jaRG1K1qzQaNT2f57jcbE1kfYbU9y8iU8tW24/NTUzAw6OH9zJQ7tMb0HmOkEJLTWB3wdKO/Z1Gq905/NkB0MQ6JU2/MRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsUz1msV1GEbu1UYDLHdeLahA4Mes1IytICh7uBLGHQ=;
 b=Yne+pX2bkN3v75gxSS05kllp93Ji6OxE54euUW2PI4xq0wvXPpaKOAM2fYQB8c87IdQ9WmMgd0tUnPTK7rjp+XGO+spmtXhbgMKG7BNOk+hEpHYF8gFWrTj2znTiIuyd5aUkMDpNcfrjpW3TKczEsjNa2/ElqPM+2TXYEgK+MyqqzjjTNHfaLf3QCXJ7puPdg50vR6eXZJcQI4v50HoGxuL1dR880qHecT4OmHs4MEqnboED/WL5gvVYVhlN3DTNULVkFLKPqdgDD/F3vmw3Ro+hVXlrvAID8uLSuk3nc12T/xdtOJRCyEIpuirZvqs4KUg2XE7U1+Hhf3ZPE6HkUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsUz1msV1GEbu1UYDLHdeLahA4Mes1IytICh7uBLGHQ=;
 b=rZWIxvWSlqHfQ2WotqvxbO/zNlUi9X4W8pH6+CfXrAiTqZ2v5354ceYJxzF1idUg17UGx3MbqW92bniDnP5NRsWYmHpdF10wkUej8VQ582KyK94+NO2H+f2wzZGsr0mr7/Ip3cg3TdN/vMUxQCeReQ3n24KNfY1Z6Xd30Uwa5jQ=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5509.eurprd04.prod.outlook.com (2603:10a6:20b:28::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Mon, 18 May
 2020 09:11:44 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d%7]) with mapi id 15.20.3000.033; Mon, 18 May 2020
 09:11:44 +0000
From: Aisheng Dong <aisheng.dong@nxp.com>
To: "tharvey@gateworks.com" <tharvey@gateworks.com>, Timur Tabi
 <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, dl-linux-imx
 <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>, Anson Huang
 <anson.huang@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, Daniel Baluta
 <daniel.baluta@nxp.com>
Subject: RE: imx8mm fsl_sai clock config failing
Thread-Topic: imx8mm fsl_sai clock config failing
Thread-Index: AQHWJ99T4rEGeMnnt0C/Oc8qp4CAsaitmJIQ
Date: Mon, 18 May 2020 09:11:44 +0000
Message-ID: <AM6PR04MB4966BF44BCECB83835CA0A4F80B80@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <CAJ+vNU3ekA76nXE7UV+kxA1DtbSMiRCnhTOy6RwixOrj1AoJug@mail.gmail.com>
In-Reply-To: <CAJ+vNU3ekA76nXE7UV+kxA1DtbSMiRCnhTOy6RwixOrj1AoJug@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gateworks.com; dkim=none (message not signed)
 header.d=none;gateworks.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: eaea4214-a4b3-4048-ff4e-08d7fb0b7c8a
x-ms-traffictypediagnostic: AM6PR04MB5509:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5509EFD04B4EC5DF60A0C53680B80@AM6PR04MB5509.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zr9NSCxDLR9KTSMEzbVTpCCgptSR6Ntubv7Py7uLlT1sAdCXLl/Uj83/Qg3SigIMhm7ZNG6ERmPtI8RYpgVDBsmKR74RvxkCIZNcBdW28x4gQ7sxzWasu6OgsR5ys0r2xqMFz8uZBN89aEdC3BtRxUOowkbOeFNk0ntJ/njFEpx0bQQcwLXe1/JvttqTImoMVXmhwtNKhulWd28zW3vSkO4jytyHO0RdkwA4ry9+MbbitEd29yq9sszgYl8BsW5WtmnCP6zI6a1alo11fgQ/J5iJoyGO1m4emjKQeQtd09t2GLlibJTODvQwQsgtI7fP/wT1du75wrq20+qPSCiuF0GjjJe5Yrbt4WBjD2Gg1cqk3oPnTOsTmzAmU3ct9NybkrBiVur5KEJPj4p/KH+43AvjjTTYZ+V3Ykm4dgHxXcynfUnvWPHvePfYjzqkrt/3qkbZz6Cg1bJ6tEx4ncVXx6MxpHNJk4WjP3XHmuN9TsXNOmv+LQbJKkcAYRhIl2eC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB4966.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(5660300002)(55016002)(8936002)(8676002)(26005)(186003)(71200400001)(6506007)(9686003)(7416002)(4326008)(478600001)(7696005)(316002)(110136005)(6636002)(86362001)(44832011)(66476007)(33656002)(64756008)(2906002)(76116006)(66446008)(52536014)(66946007)(66556008)(921003)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: EwCqf+B/76Q0CMlT8YkKCWN5WPV7kFxv2v9+rBdmajri2PGJ9x35QiWMTAFx69TacMB6hlOyvVWTLeu60LcEkbnB9eXfo2JnbasdhDGoDh2bBcc0IGrLlprVG/N+vlyu07Lc3aNlBLmsgDZE9z0uC2ntLfUS9skDrf24AMnnJxziOylCm7Q/DM3wrd2avhRrSwSQdMUnNp5H5dSIpqrLptjUtUGQm9nqL509GJenMCy/CeogM2ltjwhgaJde9S8Oy7YVbbVYtsB3DgSAHopt5MoKA3RCFF2oFDZz3xiQ5EgX5W8ML+giq5IUlBS4P3c7QXH4LU7lTVHRvWIfM3+8fdIV+6mKFdHX/5Voe4+bSIE8DY+aDoaSZ4/MyVDQhZ+nLzmbZAk1PycDL0e7dUzYKq7jrDwZ0aH9QQhvW21PN/h5DShuhVyEV4E3SxRXY22nKzPicPuOvLjDWtffcesqLdXN0wZaXDa6q1ETZqOMfyN+K3dz0TaehytfgauGNCMT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaea4214-a4b3-4048-ff4e-08d7fb0b7c8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 09:11:44.8011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vhr4pqnThkHlqTY1en2PIdrvWNXZP8YH+jp3JXSnn78MvnNPUu1V8gn760zYx1I2h0LDlKLLuGTP+A2FOzeCpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5509
X-Mailman-Approved-At: Mon, 18 May 2020 16:18:11 +0200
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

PiBGcm9tOiBUaW0gSGFydmV5IDx0aGFydmV5QGdhdGV3b3Jrcy5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIE1heSAxMiwgMjAyMCA1OjU4IEFNDQo+IA0KPiBHcmVldGluZ3MsDQo+IA0KPiBJJ20gdHJ5
aW5nIHRvIGdldCBpbXg4bW0gc2FpIHdvcmtpbmcgd2l0aCBhIHRsdjMyMGFpYzN4IGNvZGVjIG9u
IGEgbmV3IGJvYXJkDQo+IGFuZCBhbSBmaW5kaW5nIHRoYXQgdGhlIHNhaTMgYnVzIGNsb2NrIGlz
IGdldHRpbmcgZGVyaXZlZCBmcm9tIHRoZSB3cm9uZyBzb3VyY2UNCj4gbGVhZGluZyBod19wYXJh
bXMoKSB0byBmYWlsIHdpdGggJ2ZzbC1zYWkNCj4gMzAwMzAwMDAuc2FpOiBmYWlsZWQgdG8gZGVy
aXZlIHJlcXVpcmVkIFR4IHJhdGU6IDMwNzIwMDAnDQo+IA0KPiBJbiBjb21wYXJpc29uIHRvIHRo
ZSBpbXg4bW0tZXZrIEkgZmluZCBpdCdzIGNsb2NrIGdldHMgY29uZmlndXJlZCBhcyBkZXNpcmVk
IHlldA0KPiBJIGhhdmUgdGhlIHNhbWUgZGV2aWNlLXRyZWUgY29uZmlndXJhdGlvbiBmb3Igc2Fp
My4NCj4gDQo+IEhlcmUgaXMgbXkgYm9hcmQncyBkdHM6DQo+IC8gew0KPiAuLi4NCj4gICAgICAg
ICBzb3VuZCB7DQo+ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNpbXBsZS1hdWRpby1j
YXJkIjsNCj4gICAgICAgICAgICAgICAgIHNpbXBsZS1hdWRpby1jYXJkLG5hbWUgPSAidGx2MzIw
LWF1ZGlvIjsNCj4gICAgICAgICAgICAgICAgIHNpbXBsZS1hdWRpby1jYXJkLGZvcm1hdCA9ICJp
MnMiOw0KPiAgICAgICAgICAgICAgICAgc2ltcGxlLWF1ZGlvLWNhcmQsZnJhbWUtbWFzdGVyID0g
PCZjcHVkYWk+Ow0KPiAgICAgICAgICAgICAgICAgc2ltcGxlLWF1ZGlvLWNhcmQsYml0Y2xvY2st
bWFzdGVyID0gPCZjcHVkYWk+Ow0KPiAgICAgICAgICAgICAgICAgc2ltcGxlLWF1ZGlvLWNhcmQs
d2lkZ2V0cyA9DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICJMaW5lIiwgIkxlZnQgTGluZSBP
dXQgSmFjayIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICJMaW5lIiwgIlJpZ2h0IExpbmUg
T3V0IEphY2siOw0KPiAgICAgICAgICAgICAgICAgc2ltcGxlLWF1ZGlvLWNhcmQscm91dGluZyA9
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICJMZWZ0IExpbmUgT3V0IEphY2siLCAiTExPVVQi
LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAiUmlnaHQgTGluZSBPdXQgSmFjayIsICJSTE9V
VCI7DQo+IA0KPiAgICAgICAgICAgICAgICAgY3B1ZGFpOiBzaW1wbGUtYXVkaW8tY2FyZCxjcHUg
ew0KPiAgICAgICAgICAgICAgICAgICAgICAgICBzb3VuZC1kYWkgPSA8JnNhaTM+Ow0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICBkYWktdGRtLXNsb3QtbnVtID0gPDI+Ow0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICBkYWktdGRtLXNsb3Qtd2lkdGggPSA8MzI+Ow0KPiAgICAgICAgICAgICAg
ICAgfTsNCj4gDQo+ICAgICAgICAgICAgICAgICBzaW1wbGUtYXVkaW8tY2FyZCxjb2RlYyB7DQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIHNvdW5kLWRhaSA9IDwmdGx2MzIwYWljMzEwNT47DQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY2xrIElNWDhNTV9DTEtfU0FJM19S
T09UPjsNCj4gICAgICAgICAgICAgICAgIH07DQo+ICAgICAgICAgfTsNCj4gfTsNCj4gDQo+ICZp
MmMyIHsNCj4gLi4uDQo+ICAgICAgICAgdGx2MzIwYWljMzEwNTogY29kZWNAMTggew0KPiAgICAg
ICAgICAgICAgICAgI3NvdW5kLWRhaS1jZWxscyA9IDwwPjsNCj4gICAgICAgICAgICAgICAgIHBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICAgICAgICAgICAgICAgICBwaW5jdHJsLTAgPSA8
JnBpbmN0cmxfdGx2PjsNCj4gICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGksdGx2MzIw
YWljM3giOw0KPiAgICAgICAgICAgICAgICAgcmVnID0gPDB4MTg+Ow0KPiAgICAgICAgICAgICAg
ICAgcmVzZXQtZ3Bpb3MgPSA8JmdwaW80IDQgR1BJT19BQ1RJVkVfTE9XPjsNCj4gICAgICAgICAg
ICAgICAgIGFpM3gtbWljYmlhcy12ZyA9IDwyPjsgLyogTUlDQklBU18yXzVWICovDQo+ICAgICAg
ICAgICAgICAgICAvKiBSZWd1bGF0b3JzICovDQo+ICAgICAgICAgICAgICAgICBEUlZERC1zdXBw
bHkgPSA8JnJlZ18zcDN2PjsNCj4gICAgICAgICAgICAgICAgIEFWREQtc3VwcGx5ID0gPCZyZWdf
M3Azdj47DQo+ICAgICAgICAgICAgICAgICBJT1ZERC1zdXBwbHkgPSA8JnJlZ18zcDN2PjsNCj4g
ICAgICAgICAgICAgICAgIERWREQtc3VwcGx5ID0gPCZyZWdfMXA4dj47DQo+ICAgICAgICAgfTsN
Cj4gfQ0KPiANCj4gJnNhaTMgew0KPiAgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7
DQo+ICAgICAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX3NhaTM+Ow0KPiAgICAgICAgIGFzc2ln
bmVkLWNsb2NrcyA9IDwmY2xrIElNWDhNTV9DTEtfU0FJMz47DQo+ICAgICAgICAgYXNzaWduZWQt
Y2xvY2stcGFyZW50cyA9IDwmY2xrIElNWDhNTV9BVURJT19QTEwxX09VVD47DQo+ICAgICAgICAg
YXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8MjQ1NzYwMDA+Ow0KPiAgICAgICAgIHN0YXR1cyA9ICJv
a2F5IjsNCj4gfTsNCj4gDQo+IGFuZCAvc3lzL2tlcm5lbC9kZWJ1Zy9jbGsvY2xrX3N1bW1hcnkg
ZnJvbSBteSBib2FyZDoNCj4gIG9zY18yNG0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICA3
ICAgICAgIDEwICAgICAgICAwDQo+IDI0MDAwMDAwDQo+ICAgICAgICAgMCAgICAgMCAgNTAwMDAN
Cj4gLi4uDQo+ICAgICBhdWRpb19wbGwxX3JlZl9zZWwgICAgICAgICAgICAgICAgMCAgICAgICAg
MCAgICAgICAgMA0KPiAyNDAwMDAwMA0KPiAgICAgICAgIDAgICAgIDAgIDUwMDAwDQo+ICAgICAg
ICBhdWRpb19wbGwxICAgICAgICAgICAgICAgICAgICAgMCAgICAgICAgMCAgICAgICAgMA0KPiA2
NTAwMDAwMDANCj4gICAgICAgICAwICAgICAwICA1MDAwMA0KPiAgICAgICAgICAgYXVkaW9fcGxs
MV9ieXBhc3MgICAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDANCj4gNjUwMDAwMDAwDQo+ICAg
ICAgICAgMCAgICAgMCAgNTAwMDANCj4gICAgICAgICAgICAgIGF1ZGlvX3BsbDFfb3V0ICAgICAg
ICAgICAwICAgICAgICAwICAgICAgICAwDQo+IDY1MDAwMDAwMA0KPiAgICAgICAgIDAgICAgIDAg
IDUwMDAwDQo+ICAgICAgICAgICAgICAgICBzYWkzICAgICAgICAgICAgICAgICAgMCAgICAgICAg
MCAgICAgICAgMA0KPiAyNTAwMDAwMA0KPiAgICAgICAgIDAgICAgIDAgIDUwMDAwDQo+ICAgICAg
ICAgICAgICAgICAgICBzYWkzX3Jvb3RfY2xrICAgICAgIDAgICAgICAgIDAgICAgICAgIDANCj4g
MjUwMDAwMDANCj4gICAgICAgICAgMCAgICAgMCAgNTAwMDANCj4gXl5eXiBub3RlIDI1MDAwMDAw
IGluc3RlYWQgb2YgcmVxdWVzdGVkIDI0NTc2MDAwDQo+IA0KPiBBbmQgSGVyZSBpcyB0aGUgaW14
OG1tLWV2ayBkdHM6DQo+IC8gew0KPiAuLi4NCj4gICAgICAgICB3bTg1MjQ6IGF1ZGlvLWNvZGVj
IHsNCj4gICAgICAgICAgICAgICAgICNzb3VuZC1kYWktY2VsbHMgPSA8MD47DQo+ICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gIndsZix3bTg1MjQiOw0KPiAgICAgICAgICAgICAgICAgcGlu
Y3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gICAgICAgICAgICAgICAgIHBpbmN0cmwtMCA9IDwm
cGluY3RybF9ncGlvX3dsZj47DQo+ICAgICAgICAgICAgICAgICB3bGYsbXV0ZS1ncGlvcyA9IDwm
Z3BpbzUgMjEgR1BJT19BQ1RJVkVfTE9XPjsNCj4gICAgICAgICB9Ow0KPiANCj4gICAgICAgICBz
b3VuZC13bTg1MjQgew0KPiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYXVk
aW8tY2FyZCI7DQo+ICAgICAgICAgICAgICAgICBzaW1wbGUtYXVkaW8tY2FyZCxuYW1lID0gIndt
ODUyNC1hdWRpbyI7DQo+ICAgICAgICAgICAgICAgICBzaW1wbGUtYXVkaW8tY2FyZCxmb3JtYXQg
PSAiaTJzIjsNCj4gICAgICAgICAgICAgICAgIHNpbXBsZS1hdWRpby1jYXJkLGZyYW1lLW1hc3Rl
ciA9IDwmY3B1ZGFpPjsNCj4gICAgICAgICAgICAgICAgIHNpbXBsZS1hdWRpby1jYXJkLGJpdGNs
b2NrLW1hc3RlciA9IDwmY3B1ZGFpPjsNCj4gICAgICAgICAgICAgICAgIHNpbXBsZS1hdWRpby1j
YXJkLHdpZGdldHMgPQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAiTGluZSIsICJMZWZ0IExp
bmUgT3V0IEphY2siLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAiTGluZSIsICJSaWdodCBM
aW5lIE91dCBKYWNrIjsNCj4gICAgICAgICAgICAgICAgIHNpbXBsZS1hdWRpby1jYXJkLHJvdXRp
bmcgPQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAiTGVmdCBMaW5lIE91dCBKYWNrIiwgIkxJ
TkVWT1VUTCIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICJSaWdodCBMaW5lIE91dCBKYWNr
IiwgIkxJTkVWT1VUUiI7DQo+IA0KPiAgICAgICAgICAgICAgICAgY3B1ZGFpOiBzaW1wbGUtYXVk
aW8tY2FyZCxjcHUgew0KPiAgICAgICAgICAgICAgICAgICAgICAgICBzb3VuZC1kYWkgPSA8JnNh
aTM+Ow0KPiAgICAgICAgICAgICAgICAgICAgICAgICBkYWktdGRtLXNsb3QtbnVtID0gPDI+Ow0K
PiAgICAgICAgICAgICAgICAgICAgICAgICBkYWktdGRtLXNsb3Qtd2lkdGggPSA8MzI+Ow0KPiAg
ICAgICAgICAgICAgICAgfTsNCj4gDQo+ICAgICAgICAgICAgICAgICBzaW1wbGUtYXVkaW8tY2Fy
ZCxjb2RlYyB7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHNvdW5kLWRhaSA9IDwmd204NTI0
PjsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjbGsgSU1YOE1NX0NMS19T
QUkzX1JPT1Q+Ow0KPiAgICAgICAgICAgICAgICAgfTsNCj4gICAgICAgICB9Ow0KPiB9Ow0KPiAN
Cj4gJnNhaTMgew0KPiAgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICAgICAg
ICAgcGluY3RybC0wID0gPCZwaW5jdHJsX3NhaTM+Ow0KPiAgICAgICAgIGFzc2lnbmVkLWNsb2Nr
cyA9IDwmY2xrIElNWDhNTV9DTEtfU0FJMz47DQo+ICAgICAgICAgYXNzaWduZWQtY2xvY2stcGFy
ZW50cyA9IDwmY2xrIElNWDhNTV9BVURJT19QTEwxX09VVD47DQo+ICAgICAgICAgYXNzaWduZWQt
Y2xvY2stcmF0ZXMgPSA8MjQ1NzYwMDA+Ow0KPiAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4g
fTsNCj4gDQo+IGFuZCAvc3lzL2tlcm5lbC9kZWJ1Zy9jbGsvY2xrX3N1bW1hcnkgZnJvbSBpbXg4
bW1fZXZrOg0KPiAgb3NjXzI0bSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDcgICAgICAg
MTAgICAgICAgIDANCj4gMjQwMDAwMDANCj4gICAgICAgICAwICAgICAwICA1MDAwMA0KPiAuLi4N
Cj4gICAgIGF1ZGlvX3BsbDFfcmVmX3NlbCAgICAgICAgICAgICAgICAwICAgICAgICAwICAgICAg
ICAwDQo+IDI0MDAwMDAwDQo+ICAgICAgICAgMCAgICAgMCAgNTAwMDANCj4gICAgICAgIGF1ZGlv
X3BsbDEgICAgICAgICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwDQo+IDM5MzIxNTk5
NQ0KPiAgICAgICAgIDAgICAgIDAgIDUwMDAwDQo+ICAgICAgICAgICBhdWRpb19wbGwxX2J5cGFz
cyAgICAgICAgICAgMCAgICAgICAgMCAgICAgICAgMA0KPiAzOTMyMTU5OTUNCj4gICAgICAgICAw
ICAgICAwICA1MDAwMA0KPiAgICAgICAgICAgICAgYXVkaW9fcGxsMV9vdXQgICAgICAgICAgIDAg
ICAgICAgIDAgICAgICAgIDANCj4gMzkzMjE1OTk1DQo+ICAgICAgICAgMCAgICAgMCAgNTAwMDAN
Cj4gICAgICAgICAgICAgICAgIHNhaTMgICAgICAgICAgICAgICAgICAwICAgICAgICAwICAgICAg
ICAwDQo+IDI0NTc2MDAwDQo+ICAgICAgICAgMCAgICAgMCAgNTAwMDANCj4gICAgICAgICAgICAg
ICAgICAgIHNhaTNfcm9vdF9jbGsgICAgICAgMCAgICAgICAgMCAgICAgICAgMA0KPiAyNDU3NjAw
MA0KPiAgICAgICAgICAwICAgICAwICA1MDAwMA0KPiBeXl5eIG5vdGUgMjQ1NzYwMDAgYXMgcmVx
dWVzdGVkDQo+IA0KPiBBbnkgaWRlYXMgd2hhdCBJJ20gZG9pbmcgd3JvbmcgaGVyZT8NCj4gDQo+
IE5vdGUgdGhhdCBldmVuIHRob3VnaCB0aGUgaW14OG1tLWV2ayBhcHBlYXJzIHRvIGNvbmZpZ3Vy
ZSBpdHMgY2xvY2sgY29ycmVjdGx5IEkNCj4gc3RpbGwgaGF2ZSBub3QgYmVlbiBhYmxlIHRvIHBs
YXkgYXVkaW8gb3V0IHRoZSB3bTg1MjQgYW5kIHRoZSBzeXN0ZW0gYXBwZWFycw0KPiB0byBoYW5n
IGR1cmluZyBwbGF5YmFjayBhcyBpZiBCQ0xLL01DTEsgd2VyZSBub3QgY2xvY2tpbmcuDQo+IA0K
PiBQZXJoYXBzIHRoZXJlIGlzIHNvbWV0aGluZyBub3Qgc3VwcG9ydGVkIHlldCB1cHN0cmVhbSB3
aXRoIHJlZ2FyZHMgdG8NCj4gSU1YOE1NIFNBST8NCj4gDQoNCkNvcHkgRGFuaWVsIGluIGNhc2Ug
aGUgaGFzIHNvbWUgY29tbWVudHMuDQoNClJlZ2FyZHMNCkFpc2hlbmcNCg0KPiBCZXN0IFJlZ2Fy
ZHMsDQo+IA0KPiBUaW0NCg==
