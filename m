Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2441C785C
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 19:44:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9491717A5;
	Wed,  6 May 2020 19:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9491717A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588787078;
	bh=XPoGY+DJfcLDw7r3GsMp7jMxXj+T8I6YYOqmTsJegxk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=REFLPCHTk17cjEB+rPngqTdBIyaNqgUNs+CKjXS0xZrACSsMpIUJ4HMvdSp08aET8
	 g1LwG8qKuMq+gO9jvI9lb++lMupFXI9L0/rEhsvOQvFxhNgiSPhD8djJcAA0cl6ttz
	 qDuiKKmv3l8eqp6O2ai0hfPDbfA+JYAxzTnu5kQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5974F800DF;
	Wed,  6 May 2020 19:42:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F9A3F80249; Wed,  6 May 2020 19:42:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1953F800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 19:42:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1953F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="Bux2/Lau"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JA3emlrj3OqtmtQYHmFTsSZIBOq1i3cJQUqCZU4BFBqpn/i66Yx4hVjZ7K81bHYOdFpAS80H9z3WRztDtSRM9cj8DGjlqkku/zIBgdfFt/NUtm9pBPK+XStj17shWwbQaimDIeHumpbkmZGgtT5CKHmE9AWNLGMPmbUoUHBdRknTMCD84QhzhgGZLIBKddAZUtE7ubS3Jj6aU/XK/CnY1eJcLSRQMnYV0Y8GFx0oqW/ye92rgLfoT31rQmtnvqT0bJguiCyW3qV9DLpRPGS6AJSoh9+2kq/rTXbUYJakJ1f191Dn3nNytBQsQe/EVz3Xx8dep5uuQyJ4JXgiRfbYIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPoGY+DJfcLDw7r3GsMp7jMxXj+T8I6YYOqmTsJegxk=;
 b=jRMJZk0fSF337uXE0v4DFtkBKop/MPtKc9xDS51kwUZ3Ff/D0hch4lkXGFcMZe8ogxM/vV/amBuau4oA0YKTrGgxweu5rSOccc6HyIjSZ+J5ZRFVMtCwyHrOu2WDOpKP9+cuGnVg3QknkHmyQqjcjjDjEkYoyhQX1EvvnsC8NDsG5U3POm2NWoRrI+WF8JFBu2KHQl31BeUzffn0CrNOqTY6Kk2vQwk0i+7XGzG4RA6jdlEUEkgDxgmWig9xUDOYYH5WiUWpx/br6X7AsVEpo4a8xOY3n1u3dp2ZGHS9sTl2gcnUEFEju9xQVbjIJ+BsJuOkvX6MuS9f2vqcSUSdgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPoGY+DJfcLDw7r3GsMp7jMxXj+T8I6YYOqmTsJegxk=;
 b=Bux2/LauIvtwgfjXmaY8HssHkPcbJV5o5LLjkZIPvRGXfoKy2S8UbPBMdbQAj4EHXq7VZenSa5iGQ2QNab3fJd/CFB5CB4x9Wn47kyGqueDuXKzH0YS2crg9uNBHqYD6y9MRxh6Co1bLCGD8AacAeS2Xjo/PFuH8WnRnLnqezFQ=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB3995.namprd12.prod.outlook.com (2603:10b6:5:1c6::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.27; Wed, 6 May 2020 17:42:39 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.2958.029; Wed, 6 May 2020
 17:42:39 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Alex Deucher
 <alexdeucher@gmail.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "broonie@kernel.org" <broonie@kernel.org>,
 "tiwai@suse.de" <tiwai@suse.de>
Subject: RE: [PATCH 09/14] ASoC: amd: add Renoir ACP PCI driver PM ops
Thread-Topic: [PATCH 09/14] ASoC: amd: add Renoir ACP PCI driver PM ops
Thread-Index: AQHWIx9ITFSW3RL/TkinZSliRGorIaiaB66AgAFK+UA=
Date: Wed, 6 May 2020 17:42:39 +0000
Message-ID: <DM6PR12MB263348006EAC4B664E7E556F97A40@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-10-alexander.deucher@amd.com>
 <7a675344-e5be-0570-f56e-6def475d19b8@linux.intel.com>
In-Reply-To: <7a675344-e5be-0570-f56e-6def475d19b8@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-05-06T17:33:38Z; 
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=accd02df-28ee-42d1-af1b-000036517082;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_enabled: true
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_setdate: 2020-05-06T17:42:36Z
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_method: Privileged
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_name: Non-Business
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_actionid: b833c310-75bc-45d6-9160-0000efd6d5ae
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_contentbits: 0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 09320288-ffb2-4744-5005-08d7f1e4df6c
x-ms-traffictypediagnostic: DM6PR12MB3995:|DM6PR12MB3995:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB399536885F332EC71241D11497A40@DM6PR12MB3995.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JvzdLf1S8DXsybJ/l6vRXOF28XED55lbys9BZAVy+YzJeaynKWwEhIO/We/6sljC4wuJYCbW+Pm7NPvieDpW82td1beMJGKkrR5SQ6DRQt4Os4KHihOvODF4my9qkv5DnPL4E8Jf/hZtygSbJ370X0UErWxZrBV4Ro5GYtXdQIP+ta+t/YaIBZIucpoQfpY7xS+srNFs9KNZtr3Y0JRRpv0LguQ8PwikancXc8C0z+iQNKfOJ7+H4OUmR+unpxeK4EQYNwVp4p41nUiVdA9I9kWbAG1OYVhVeLSE0OO4a8SpL8E+aXwEJRS8YXodPWrCIvCayOCkWc7Rb+uM8sj7PvQc4TA8dEiOEe61GBXkAlkvKu/cRM5ZExd8d1oPrcgXB+1UN9UnhDr/l1oLP5ZvhPCudUS0BoKKuesJt1ZBWlUiZDO0dHb6as74ktCLK4nexMdpxO09k0yGxonBkw0tjLTq59hCPnKPg3QLPjGXoTM4ppFOvTPOYQUlOBNNT9gwjRHIpDjGlB0yH5so+UVn5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(33430700001)(64756008)(478600001)(6506007)(86362001)(4326008)(53546011)(7696005)(71200400001)(2906002)(52536014)(9686003)(8676002)(5660300002)(55016002)(66946007)(186003)(26005)(33656002)(33440700001)(316002)(66556008)(8936002)(66476007)(66446008)(76116006)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: oalPdthY+s9iGtRMHCEUI/YJ/HzxeBWvx4HCnttNLDXyweCbmj+XIetXS2G6Fz0y7tjGFVX4OdUXl1HR3vRr6t08I4efA2uLTvKDvevbXtTrlXR61RK7vY+AmvEQVY9P8lq8y5jatWgcUrJG/HouzL53VqBVjkuQNgkeKSW67UDYh9jknM3Z7K8/OU3OdavPcGpTT0jIHcRjG9f1nR/rrqBl1nO57TZzY+Uo473riZmnuKOU0lCoOwMObW9UpRWX71Gl1RL/GawHorYu7DSR6/nOSvwjewmvWkTZpXVcl80AVOTcRwSstJ8wSQdXMwxLfyqnpEYMCxoxn8XLQ0vF4XPtACNwBrD5K7d4Hksrv6B0phn6XzaQDEimlBA0a4wYHMSzTJhYqvVKiSOecBLWKVt8wUB/9rCxrF1JjMbFYAMeSmXs/jQi3kRS3krEgj9CJbXZ/wrIe3YAxVmoTKWVWTwSHCFcAlADYj1uA3CvIiLwf2snxzMXjk1D0PMzY58BjZ4+PhTS9kWUMPoLdJdMd886bqiTqjQ03GjvTcRQ3v9IGf1486mM8w3Cai0VS4nQBflrnramzejncrhy3eSnjViOryg0vG8sJCuSfvDOoapn5Z8dHGeKRsUFuWme87JK9V8XSeG6XjJRd3BgPc28VL+ibg/iTf7tYh3woty26NkM5nzYYiIsYcGzvaGbhYLcGZHD7ELtZ4eopC3kxg0lHhRAm4xvkK+iIWMG+//AHHLyBUw+zjM/SY4dKrj+UDquMT77uHX5qSqXlO//GT7xYGR+y11ubD0CS8JLwJ1VXSsB0JsbMOkUGKDSiWzqyz89
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09320288-ffb2-4744-5005-08d7f1e4df6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 17:42:39.8550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GvE53fLN0WtqDxtnHoCOO+I+J2UspupTO95+5jB9AxQjTkYSFYGK2fRMhimigr48q+B9hhgCMU5WJ+3gTO6lqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3995
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
bmVzZGF5LCBNYXkgNiwgMjAyMCAzOjE5IEFNDQo+IFRvOiBBbGV4IERldWNoZXIgPGFsZXhkZXVj
aGVyQGdtYWlsLmNvbT47IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsNCj4gYnJvb25pZUBr
ZXJuZWwub3JnOyBNdWt1bmRhLCBWaWplbmRhciA8VmlqZW5kYXIuTXVrdW5kYUBhbWQuY29tPjsN
Cj4gdGl3YWlAc3VzZS5kZQ0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1
Y2hlckBhbWQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDA5LzE0XSBBU29DOiBhbWQ6IGFk
ZCBSZW5vaXIgQUNQIFBDSSBkcml2ZXIgUE0gb3BzDQo+IA0KPiANCj4gDQo+ID4gZGlmZiAtLWdp
dCBhL3NvdW5kL3NvYy9hbWQvcmVub2lyL3JuLXBjaS1hY3AzeC5jDQo+IGIvc291bmQvc29jL2Ft
ZC9yZW5vaXIvcm4tcGNpLWFjcDN4LmMNCj4gPiBpbmRleCAzNjI0MDllZjBkODUuLjZkMDEzYTFi
ZmZhNiAxMDA2NDQNCj4gPiAtLS0gYS9zb3VuZC9zb2MvYW1kL3Jlbm9pci9ybi1wY2ktYWNwM3gu
Yw0KPiA+ICsrKyBiL3NvdW5kL3NvYy9hbWQvcmVub2lyL3JuLXBjaS1hY3AzeC5jDQo+ID4gQEAg
LTEwLDYgKzEwLDcgQEANCj4gPiAgICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KPiA+ICAgI2lu
Y2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L2lu
dGVycnVwdC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPiA+DQo+ID4g
ICAjaW5jbHVkZSAicm5fYWNwM3guaCINCj4gPg0KPiA+IEBAIC0yMzMsNiArMjM0LDEyIEBAIHN0
YXRpYyBpbnQgc25kX3JuX2FjcF9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGNpLA0KPiA+ICAgCQly
ZXQgPSBQVFJfRVJSKGFkYXRhLT5wZGV2KTsNCj4gPiAgIAkJZ290byB1bnJlZ2lzdGVyX2RldnM7
DQo+ID4gICAJfQ0KPiA+ICsJcG1fcnVudGltZV9zZXRfYXV0b3N1c3BlbmRfZGVsYXkoJnBjaS0+
ZGV2LA0KPiBBQ1BfU1VTUEVORF9ERUxBWV9NUyk7DQo+ID4gKwlwbV9ydW50aW1lX3VzZV9hdXRv
c3VzcGVuZCgmcGNpLT5kZXYpOw0KPiA+ICsJcG1fcnVudGltZV9zZXRfYWN0aXZlKCZwY2ktPmRl
dik7DQo+IA0KPiBpcyB0aGUgc2V0X2FjdGl2ZSgpIG5lZWRlZD8gSSBoYXZlbid0IHNlZW4gdGhp
cyBpbiB0aGUgb3RoZXIgUENJIGF1ZGlvDQo+IGRyaXZlcnM/DQoNCldlIGhhdmUgc2ltaWxhciBp
bXBsZW1lbnRhdGlvbiBpbiBvdXIgUmF2ZW4gQUNQIFBDSSBkcml2ZXIgYXMgd2VsbA0Kd2hpY2gg
Z290IHVwIHN0cmVhbWVkLg0KSSB3aWxsIGdpdmUgYSB0cnkgYnkgbW9kaWZ5aW5nIHRoaXMgc2Vx
dWVuY2UuDQpDb3VsZCB5b3UgcGxlYXNlIHBvaW50IG1lICwgd2hhdCdzIGV4YWN0bHkgd3Jvbmcg
d2l0aCB0aGlzIGNvZGU/DQo+IA0KPiA+ICsJcG1fcnVudGltZV9wdXRfbm9pZGxlKCZwY2ktPmRl
dik7DQo+ID4gKwlwbV9ydW50aW1lX2VuYWJsZSgmcGNpLT5kZXYpOw0KPiANCj4gc2FtZSwgaXMg
dGhlIF9lbmFibGUoKSBuZWVkZWQoKT8NCg0KV2UgaGF2ZSBzaW1pbGFyIGltcGxlbWVudGF0aW9u
IGluIFJhdmVuIEFDUCBQQ0kgZHJpdmVyIGFzIHdlbGwuDQo+IA0KPiA+ICsJcG1fcnVudGltZV9h
bGxvdygmcGNpLT5kZXYpOw0KPiA+ICAgCXJldHVybiAwOw0KPiA+DQo+ID4gICB1bnJlZ2lzdGVy
X2RldnM6DQo+ID4gQEAgLTI1MCw2ICsyNTcsNDIgQEAgc3RhdGljIGludCBzbmRfcm5fYWNwX3By
b2JlKHN0cnVjdCBwY2lfZGV2ICpwY2ksDQo+ID4gICAJcmV0dXJuIHJldDsNCj4gPiAgIH0NCj4g
Pg0KDQo=
