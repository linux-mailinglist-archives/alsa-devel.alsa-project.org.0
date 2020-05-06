Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 158A51C75A4
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 18:03:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 988191740;
	Wed,  6 May 2020 18:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 988191740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588780992;
	bh=/5NOtECoJe0hAoKDnDnSqKuPSxPF0eD5BmLrkCFfUoQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bTu4NvDgIbiDOcezOTH74Yf3h+ozRkg0d9hjva0EBINhhFrC/t1DGTsCT+znRqCrs
	 whBThfuU2Ii+RXkYoT51KAg1z7sABfUCy4OkJGv/ZhAK22BmArRMHJkex7htEamMMy
	 6f45E5/775ZBgEiZJFIM1XcBw3BajSaZgQy2yxS0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7284F800DF;
	Wed,  6 May 2020 18:01:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18203F80249; Wed,  6 May 2020 18:01:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD083F800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 18:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD083F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="yUQhH2gZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5S3VtyGSvC05GD+bsqLaQyUV+euE9SeT70qwkPFpLd+otnlDB1KXTL9yymuM8KBneqxecirpgWXvyo0zA7UdiOby3JQ15INMzGuZ/nw1fBIMDvTShp4vrbM51nV8TuThH5Sq7MQ9su7e+sNXGj6mi8tz+SetcCgLSVcrZUp1zrro20YrjQ3gVSDO67ye/1y3GP27Aman3PrHKSvPDyrLYQTleTt6Q88yZRE7KqbN0fnA1dYnPTnLhiwkoqwndW8dohfFjfnQvrxPf9As8i2QRHrCCKbOY/TAqrCaYK3pAFk4zwl/1CBr+nh1JakT4JTCv71hTZangZcIGDZtKZmTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5NOtECoJe0hAoKDnDnSqKuPSxPF0eD5BmLrkCFfUoQ=;
 b=aNQYtXgBH9cczca9B2HirGx2k6BzYnfFexWdLslBqEAQGnZTq6St5DDqkarjrbh10MlyEU507TidJVZjugf2DG+vACd2eTOwV+j5M5BFdAvcTw29R1RBeTRJYkSzgA+6T1ZfogDkrv8l2clgatx/nrK6fmKfhTxHpm1IHKG+/OLN2lRjBGeFt9a5mNzTaaQr6pRkY04z+gyNGp37Gr/s1/Y2nCMY3qZajLhxufXvLoNlAW7stYTe9VPFukaNO0IUTFPggrGZvQjsPrYkDUGwzdTTiHes28PCHAyZRq5Ol3c6mUtMpImiILEWXVcvkJGvwLSAk/FHrSaBL7+MKuP6aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5NOtECoJe0hAoKDnDnSqKuPSxPF0eD5BmLrkCFfUoQ=;
 b=yUQhH2gZgcAYXF6dJ1GkAXD9sFKg+RFYJJ4+mMwDGxWfkwZas20mRxKJJdxD1Cir+GaR9O8UVReNaRganU/0+/Q6DSFankTsCRKPOaAxZFxmNwlq+22gQ5JmRyhBrAlyl6ECDKeciPtT6V3/I/8rimw5tFcxZZl8xTlUdfj7lp0=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB3178.namprd12.prod.outlook.com (2603:10b6:5:18d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20; Wed, 6 May 2020 16:01:14 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.2958.029; Wed, 6 May 2020
 16:01:14 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Alex Deucher
 <alexdeucher@gmail.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "broonie@kernel.org" <broonie@kernel.org>,
 "tiwai@suse.de" <tiwai@suse.de>
Subject: RE: [PATCH 13/14] ASoC: amd: RN machine driver using dmic
Thread-Topic: [PATCH 13/14] ASoC: amd: RN machine driver using dmic
Thread-Index: AQHWIx9MQcElWEzBPU2eqB4LfO1DtKiaBJEAgAEyfmA=
Date: Wed, 6 May 2020 16:01:14 +0000
Message-ID: <DM6PR12MB263388F37A0A99C2D1B96F2797A40@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-14-alexander.deucher@amd.com>
 <262fb234-f940-d3be-4a9b-9f3263cced54@linux.intel.com>
In-Reply-To: <262fb234-f940-d3be-4a9b-9f3263cced54@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-05-06T15:58:46Z; 
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=1029e71c-adf2-4573-b4d8-0000de8fe5a5;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_enabled: true
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_setdate: 2020-05-06T16:01:10Z
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_method: Privileged
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_name: Non-Business
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_actionid: 45fe6cba-6ce6-4405-a662-00004d6d3e78
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_contentbits: 0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 98be9d83-9380-4f74-d219-08d7f1d6b43f
x-ms-traffictypediagnostic: DM6PR12MB3178:|DM6PR12MB3178:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB31781986DB46445B581A2B5F97A40@DM6PR12MB3178.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:158;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kqsYlEbPZm9QElFo8qIaSnVcv4z3JP7/vngsgxKNmZer8zIGxbQWxkgsET4E/oy1fI7Wq+7CPgJDifz4QG78Ve1zIx3zUkNkZpNTAw2KJFXRZPeIuJPRlN34/NX39L1WWmFF7gigxldb4AO7eH81il3eIJeaJO/gtISg5fqUCTFsS81cGG1cOBJ3wzifh+lqfXq7+mZttDCuJl74YfgsmpMWrT7/Ag88tl1keg3IVqmFpR2/lQT5Mgm47KpVbsCgO2fcaimuOlhTJHm9+H4e8Q/PrktBeNXbVWmUr+btGvVXXSVM50p4S5Xf0kOwDrvaLTAn2/IkXcRgSaYznW3SMomEoElo8VGgvD4y3RfPc6a2hjPyPsbbURU5wzH4vFdHPf+Lbh5E42QGJEM0bM+A+2QFPHVf3u1Fmx5dsizjGlSaYq0qYY0uvcITArZvAigcso3RYZ9N9DGOxuLb9x2AaNTWA2sVI+8TERMh/lfEGfHbO5TEFiwS+TOwSL0u/56HqjE08bt1u83I170xyZGUcw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(33430700001)(66946007)(76116006)(52536014)(64756008)(8936002)(26005)(66556008)(66446008)(66476007)(33440700001)(316002)(33656002)(71200400001)(110136005)(8676002)(5660300002)(86362001)(4326008)(478600001)(55016002)(9686003)(186003)(7696005)(2906002)(53546011)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: FEVotl0maRMOJTXGQT21W/aHbPK/7qIiZyPqH3b9pOOsFRzd0ayZBi4s2Wx4UrVB50hA0aH2xM8OUCG8XxQD86PGStosrJUiw9QkfREszZFXV5KqwIiZUgMrUfnnT5g5YuzeqlSHVTYXjlc+xA7dJCeC32QwSZXbouI+FsuZlJbd0A0NRCgX3LUUkOcGYCKggo7fhADi5w4BC7s3cYoT9UaZ7hU4xbYsgTYf1zCFcK1/agk7sfXVAwskZzvlbBIt92qIkjjBa5hZLb99wckBlMWFup4nIbliEiW2fc25QtKm/HmH8pnA7Yl9x9uzkPgz5mhJtiZ6k2RMiJ5PNnfSYRvfK2Ekml9WK9OF58/pOZvfCi2JmJY5yDnt71lLc9MgDc4tNEa/oLLKF+zriMuiakhKE38/dRnHVg4v3HH2JWy3im+M2zZbS5bwnOmkGHrlecboBpIm+ESG8W5RUenW0884aJRh5usWGWVWmm5YfUoZfk3jQL5B3KTXm7QlpyZJ8IEVhU6bbFdgqhJCZ7zvUvQkUyMHrTA98Ip1cn3EGUfSM+YJ3f1FZ1UJRIX+RYDTLi1sPNduCVNNYgMi4VTUXdnQUQV2aEHnjGMbfca8LfnhMW8b3kubwaIcm6Luo2SeDJ75Uv/nFeAXJZ10qknG7wd4co9iY/Bevw7S/NYDJt0IXEV3uT7poCLSiqgJQl1Ea5dX4lbm0OLhR5Z+PFAuie/lHvPOWuHlNMPsBJLYOjZlmFjSydVJzZHExBJaKuW5ezkRpF+TfxagvpfZT1a3esporTCoJEicQkdlkuKhdDui8BwS/kkTzAZxwDiXvxbi
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98be9d83-9380-4f74-d219-08d7f1d6b43f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 16:01:14.3892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X/R/uVQfs5DlpY+t/KYz4zRUggbxSzB697f5AFYIK40o2DybvAEbg8xcV7h31/K/hx6ioTtztZMrizsmqbhbhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3178
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogV2Vk
bmVzZGF5LCBNYXkgNiwgMjAyMCAzOjA4IEFNDQo+IFRvOiBBbGV4IERldWNoZXIgPGFsZXhkZXVj
aGVyQGdtYWlsLmNvbT47IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsNCj4gYnJvb25pZUBr
ZXJuZWwub3JnOyBNdWt1bmRhLCBWaWplbmRhciA8VmlqZW5kYXIuTXVrdW5kYUBhbWQuY29tPjsN
Cj4gdGl3YWlAc3VzZS5kZQ0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1
Y2hlckBhbWQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEzLzE0XSBBU29DOiBhbWQ6IFJO
IG1hY2hpbmUgZHJpdmVyIHVzaW5nIGRtaWMNCj4gDQo+IA0KPiANCj4gPiArc3RhdGljIGludCBh
Y3BfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiArew0KPiA+ICsJaW50
IHJldDsNCj4gPiArCXN0cnVjdCBhY3BfcGRtICptYWNoaW5lID0gTlVMTDsNCj4gPiArCXN0cnVj
dCBzbmRfc29jX2NhcmQgKmNhcmQ7DQo+ID4gKw0KPiA+ICsJY2FyZCA9ICZhY3BfY2FyZDsNCj4g
PiArCWFjcF9jYXJkLmRldiA9ICZwZGV2LT5kZXY7DQo+ID4gKw0KPiA+ICsJcGxhdGZvcm1fc2V0
X2RydmRhdGEocGRldiwgY2FyZCk7DQo+ID4gKwlzbmRfc29jX2NhcmRfc2V0X2RydmRhdGEoY2Fy
ZCwgbWFjaGluZSk7DQo+ID4gKwlyZXQgPSBkZXZtX3NuZF9zb2NfcmVnaXN0ZXJfY2FyZCgmcGRl
di0+ZGV2LCBjYXJkKTsNCj4gPiArCWlmIChyZXQpIHsNCj4gPiArCQlkZXZfZXJyKCZwZGV2LT5k
ZXYsDQo+ID4gKwkJCSJzbmRfc29jX3JlZ2lzdGVyX2NhcmQoJXMpIGZhaWxlZDogJWRcbiIsDQo+
ID4gKwkJCWFjcF9jYXJkLm5hbWUsIHJldCk7DQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArCX0N
Cj4gPiArCWlmIChyZXQpIHsNCj4gPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsDQo+ID4gKwkJCSJz
bmRfc29jX3JlZ2lzdGVyX2NhcmQoJXMpIGZhaWxlZDogJWRcbiIsDQo+ID4gKwkJCWFjcF9jYXJk
Lm5hbWUsIHJldCk7DQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArCX0NCj4gDQo+IGNvcHktcGFz
dGUgbWlzdGFrZSBoZXJlLCB0aGUgc2FtZSBibG9jayBhcHBlYXJzIHR3aWNlPw0KDQpXaWxsIGZp
eCBpdCBhbmQgc2hhcmUgdXBkYXRlZCBwYXRjaC4NCg0KLVZpamVuZGFyDQo+IA0KPiA+ICsJcmV0
dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVy
IGFjcF9tYWNoX2RyaXZlciA9IHsNCj4gPiArCS5kcml2ZXIgPSB7DQo+ID4gKwkJLm5hbWUgPSAi
YWNwX3BkbV9tYWNoIiwNCj4gPiArCQkucG0gPSAmc25kX3NvY19wbV9vcHMsDQo+ID4gKwl9LA0K
PiA+ICsJLnByb2JlID0gYWNwX3Byb2JlLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGlu
dCBfX2luaXQgYWNwX2F1ZGlvX2luaXQodm9pZCkNCj4gPiArew0KPiA+ICsJcGxhdGZvcm1fZHJp
dmVyX3JlZ2lzdGVyKCZhY3BfbWFjaF9kcml2ZXIpOw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30N
Cj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIF9fZXhpdCBhY3BfYXVkaW9fZXhpdCh2b2lkKQ0KPiA+
ICt7DQo+ID4gKwlwbGF0Zm9ybV9kcml2ZXJfdW5yZWdpc3RlcigmYWNwX21hY2hfZHJpdmVyKTsN
Cj4gPiArfQ0KPiA+ICsNCj4gPiArbW9kdWxlX2luaXQoYWNwX2F1ZGlvX2luaXQpOw0KPiA+ICtt
b2R1bGVfZXhpdChhY3BfYXVkaW9fZXhpdCk7DQo+IA0KPiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVy
KGFjcF9tYWNoX2RyaXZlcikgZG9lcyBhbGwgdGhpcyBfX2luaXQgYW5kIF9fZXhpdA0KPiBmb3Ig
eW91Lg0KPiANCj4gPiArDQo+ID4gK01PRFVMRV9BVVRIT1IoIlZpamVuZGFyLk11a3VuZGFAYW1k
LmNvbSIpOw0KPiA+ICtNT0RVTEVfTElDRU5TRSgiR1BMIHYyIik7DQo+ID4gK01PRFVMRV9BTElB
UygicGxhdGZvcm06IiBEUlZfTkFNRSk7DQo+ID4NCg==
