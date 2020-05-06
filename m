Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C47BC1C77ED
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 19:32:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 674AD17A0;
	Wed,  6 May 2020 19:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 674AD17A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588786330;
	bh=JX1MpNN+u0dKpVtmCtufkZ7FwXd8c/fqX85b4qdYSXc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MQcEL75qSrp53GT+XR46i/VCORfz0syXG1KvC17Y6OTKeIphyn1tcSoqlzA8BxfFI
	 XhLHjxfA6k/3FLOJPsMXdR0Ap1+kNE0yXIvGuvt44tZDkzEfeBtOcfCuBTIx2Pe607
	 vQxjtO+OqLAVyqYlBcD82Xg9OIXKmFEVOZLtpwOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A176DF80253;
	Wed,  6 May 2020 19:30:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72F4EF80249; Wed,  6 May 2020 19:30:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::625])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97601F800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 19:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97601F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="qWJGjfSh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbsU+PwsdHXTJDMPyPgDXZx70Kt8UYcunOeBDXMJmObl9Hvxm9AG3I62BOm5PWs2/pXjLuuk6OnJXq2uP5jgQyLUEiZrGMxyxv1gqeYTRvetMAEmclEhLzabTmPi6j955I8eC5dA6Wdk9573Ku6U641sFyzGAG8XcwzfZRfqXOlKly+qjgn2WkoeqSuhwUM5uSgZiJD0LQ7hLaJskm8E/tYHExVfCgpheg2vfcFcRoJPg0Bt3ZflXHGHhD9R//jyT1XHuNkZmBwmiH4JPw5LD0dP5LT8JnyZ0PiiijAKY3L6Su4rCB2lEegToZC2odX6ohevxeS6d7Z6txV6o772rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JX1MpNN+u0dKpVtmCtufkZ7FwXd8c/fqX85b4qdYSXc=;
 b=iI/q5IGf0v8y6keKQn4IoWeMcEVjLrUYmZJl+AFUMmwRtEDYdtYfJuYHFUKjPuEhiCPZUNribZHZP/aW3wNQN7laNmfQ1/spPfp1eJ4H9whvRs19gTERfhYtp37eojeW5c6wNp2cBs8otn5818TVC/eYigvyBw5ZqeCAz7aPCuEbPaBmxZ3jyy2S81Kii+0CeTFkkaBo1nUyGOUqG5G+S0ZxJ4bM2e41JLNaYZJTlqhFGpzrpZve2iBNzXy68BzYo6eO+bRPbZWv1RqR8gd00LZm02FI0VroV+GWvaYaOHetopB+XTM5rYZuQZ4tcAOapgo43u3u4J8uclnFzW779w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JX1MpNN+u0dKpVtmCtufkZ7FwXd8c/fqX85b4qdYSXc=;
 b=qWJGjfShp98WC3CqqviLgz/WAyLXU2Tal0Il68h2inejrCdouFyTdxehcgxK8i6f6WHbZKgG/r8G7VFQnn+RN4bsIchwl7C8p4Pe5+ABhHhnxczsW57YIpyWvMtdEHUKGxy72zjv2EePpSZQopdMOs8g/lE+CHoQ+yU606JDeuY=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB3067.namprd12.prod.outlook.com (2603:10b6:5:115::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.29; Wed, 6 May 2020 17:30:08 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.2958.029; Wed, 6 May 2020
 17:30:08 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Alex Deucher
 <alexdeucher@gmail.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "broonie@kernel.org" <broonie@kernel.org>,
 "tiwai@suse.de" <tiwai@suse.de>
Subject: RE: [PATCH 07/14] ASoC: amd: add acp3x pdm driver dma ops
Thread-Topic: [PATCH 07/14] ASoC: amd: add acp3x pdm driver dma ops
Thread-Index: AQHWIx9GMBbwHJ1n8ECSyQH1R7DefqiaCpoAgAFEbcA=
Date: Wed, 6 May 2020 17:30:08 +0000
Message-ID: <DM6PR12MB26333FCDC930138DC47CC20397A40@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-8-alexander.deucher@amd.com>
 <fa130cbb-412d-768e-db71-15463fa58ab1@linux.intel.com>
In-Reply-To: <fa130cbb-412d-768e-db71-15463fa58ab1@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-05-06T17:30:03Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=be014e90-5f95-48fb-a03c-00005060cc9a;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-05-06T17:30:03Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: fda49060-0ba8-4e88-bdab-000021ac84ba
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ff9b3ca8-fb42-4797-fde6-08d7f1e31faf
x-ms-traffictypediagnostic: DM6PR12MB3067:|DM6PR12MB3067:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3067124A91BA7A93FB1847E097A40@DM6PR12MB3067.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EUACzd4OAtmp6W5kTqNC1rF2X5Wk3p4m4ZItXW+kacJDBYC/v3iyojGyl2keA93BdQR8fOgGg7/TrOnURqALOXU5g8LgDnY/qTw7p82hCo+wWT7S0jaiiiVcfP7rQhl+0uIIJN9B2+vFGnxeKGyriHCH5oYMVHDahs9A7o+xg6Cl4Y59wyHCN529vsIqcjHwJY5f4EC0yFVbFbpR7O4yPL9sDfyEzvxVZNCa1txaSgUs/nk9b2ECs5atrH6ksWgU9sqV8autu9s1rxhDx3KbAIznNkGWWYbCXb2WGcuzAprJ4Z7GfilYSpO3oWZALrKi8Y/tB/vrKTsQbnAs/wsDtB8mCFQE/H0opIoMp9/4u1l87EGt6llP1QfI6Zz8NAelqj04Fly9YJZtrDUm9kebhSVHTm+HBQsExzdc+dxk2/RAA/i6Yc8QfuONCt+CdXiW6/edDqswVNsVbGMtQqwL5JIAwru5KUn2w5vm/I87ap1IyK1fi405jHJgChbNsPBu6zKOevCqOCR/3QVJt9PRIwuE0Wefg54qh5L/f1+OXgqWngWMuyVwp5NlKg3Lr+E0NEAuWE6TPFPtgUGm6wjnsw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(33430700001)(5660300002)(86362001)(33440700001)(316002)(2906002)(7696005)(66946007)(110136005)(53546011)(6506007)(186003)(71200400001)(4326008)(8936002)(52536014)(478600001)(26005)(9686003)(66556008)(66446008)(8676002)(55016002)(66476007)(76116006)(33656002)(64756008)(42413003)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: HaWtH5kwO/fXDFJxBAjonmeJW8C5lOhB13VdGzh5sJGG/8ZEpbuyKn0mQRGi9r7mL0koLKIY74mzrj7TJCwUmPZa4xEzOHVMy6yYClLkScfryp+2WYDRahf3n3NmKzr6/ElcYTsO30U0LSyKQZpnt1ayPUMsI4eZlLrI1KA8qHtfC7Z0BQk93FWtU07OeGccp6g0hWgKQg8CFxTcu9Kr4Xqqq8VBNAQD1LHCYt16Eak2R95jsgS5BJ1deINyDoet7MceKoBrXwff8OxKlxpWwr5Kkqb8CxgX3khcUx2ygkWi2BbDHNrT3xeFOh6CpQMfFJPiPJKMB/h7K3nn5L3rIxAXwIML3ib3p7xnQ2ct/alvC9bfNvgIFyKr1NGVOgPsd7wCWydQY02qilJ7/kjnLH5leWJdvG3Rn9UL3lLb9zFDHJ74b3Rk4d5LL+ufKUYZgU7ASLg452aPHf6WeB737T2sOcHXaTT9+1Yh40Ha6r3IpH85GFwXMjHrm5kHAYoAZ5Yel3qsswm1ax+Nn/OE8gXsacr3bXuNTbxRrjz9fdEYNbXLMx5JhcALyxUf13kqbWksuCJ/UZ0DwGT3qefThUmE0zOfRM1YB663SgxDXhOopLecLdXReK7eflirAsJu1sA5ThZ9hysd4Z8X0sKuMQflWbLGTo6etkmpBCvwX9ZCG13TWm9STVvFgu5MKSdxO8Vuze4rY9pzEpjb4StF/1Hy0GxvhVQivFoTEY7mysASYrkfllT88IZuJ8cAeFYyE5hBbYm55OzLgKdmahHbKqGxaVfeZPPKgAJ9slO+PdRbHHl7refjHve5vthqc1y9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9b3ca8-fb42-4797-fde6-08d7f1e31faf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 17:30:08.4074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1rj8hbuXyExOVZFwKAUXshZqkz+0VkLK/slyUQgQLlJq0E7MPzH2FykuLmsD2TsZ/zHkdecoJ6pp3LsFNyw6FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3067
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQoN
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaWVycmUtTG91aXMgQm9z
c2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRu
ZXNkYXksIE1heSA2LCAyMDIwIDM6MjkgQU0NCj4gVG86IEFsZXggRGV1Y2hlciA8YWxleGRldWNo
ZXJAZ21haWwuY29tPjsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOw0KPiBicm9vbmllQGtl
cm5lbC5vcmc7IE11a3VuZGEsIFZpamVuZGFyIDxWaWplbmRhci5NdWt1bmRhQGFtZC5jb20+Ow0K
PiB0aXdhaUBzdXNlLmRlDQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVj
aGVyQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDcvMTRdIEFTb0M6IGFtZDogYWRk
IGFjcDN4IHBkbSBkcml2ZXIgZG1hIG9wcw0KPiANCj4gDQo+IA0KPiBPbiA1LzUvMjAgMzo1MyBQ
TSwgQWxleCBEZXVjaGVyIHdyb3RlOg0KPiA+IEZyb206IFZpamVuZGFyIE11a3VuZGEgPFZpamVu
ZGFyLk11a3VuZGFAYW1kLmNvbT4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBQRE0gZHJpdmVy
IERNQSBvcGVyYXRpb25zLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVmlqZW5kYXIgTXVrdW5k
YSA8VmlqZW5kYXIuTXVrdW5kYUBhbWQuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHNvdW5kL3Nv
Yy9hbWQvcmVub2lyL2FjcDN4LXBkbS1kbWEuYyB8IDE5OQ0KPiArKysrKysrKysrKysrKysrKysr
KysrKysrKysNCj4gPiAgIHNvdW5kL3NvYy9hbWQvcmVub2lyL3JuX2FjcDN4LmggICAgICB8ICAy
OSArKysrDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDIyOCBpbnNlcnRpb25zKCspDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2FtZC9yZW5vaXIvYWNwM3gtcGRtLWRtYS5jDQo+IGIv
c291bmQvc29jL2FtZC9yZW5vaXIvYWNwM3gtcGRtLWRtYS5jDQo+ID4gaW5kZXggNGVlNDdhODVl
MzdlLi4wYjVkYzQ5ZjQyYzMgMTAwNjQ0DQo+ID4gLS0tIGEvc291bmQvc29jL2FtZC9yZW5vaXIv
YWNwM3gtcGRtLWRtYS5jDQo+ID4gKysrIGIvc291bmQvc29jL2FtZC9yZW5vaXIvYWNwM3gtcGRt
LWRtYS5jDQo+ID4gQEAgLTE2LDYgKzE2LDI1IEBADQo+ID4NCj4gPiAgICNkZWZpbmUgRFJWX05B
TUUgImFjcF9ybl9wZG1fZG1hIg0KPiA+DQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3Bj
bV9oYXJkd2FyZSBhY3BfcGRtX2hhcmR3YXJlX2NhcHR1cmUgPSB7DQo+ID4gKwkuaW5mbyA9IFNO
RFJWX1BDTV9JTkZPX0lOVEVSTEVBVkVEIHwNCj4gPiArCQlTTkRSVl9QQ01fSU5GT19CTE9DS19U
UkFOU0ZFUiB8DQo+ID4gKwkJU05EUlZfUENNX0lORk9fQkFUQ0ggfCBTTkRSVl9QQ01fSU5GT19N
TUFQIHwNCj4gPiArCQlTTkRSVl9QQ01fSU5GT19NTUFQX1ZBTElEIHwNCj4gPiArCSAgICBTTkRS
Vl9QQ01fSU5GT19QQVVTRSB8IFNORFJWX1BDTV9JTkZPX1JFU1VNRSwNCj4gDQo+IENhbiB5b3Ug
YWN0dWFsbHkgcmVzdW1lIGZyb20gdGhlIHNhbWUgcG9zaXRpb24/IHRoaXMgc2VlbXMgb2RkIHdo
ZW4NCj4gY29tYmluZWQgd2l0aCBJTkZPX0JBVENIIHdoaWNoIG1lYW5zIHRoZSBwb3NpdGlvbiBp
cyBvbmx5IHByZWNpc2UgYXQNCj4gcGVyaW9kIGJvdW5kYXJpZXMuDQo+IA0KV2UgdXNlZCBzaW1p
bGFyIGZsYWcgaW4gUmF2ZW4gQVBVIGFjcCBkbWEgZHJpdmVyIHdlbGwuDQpBcyBwZXIgbXkgdW5k
ZXJzdGFuZGluZyBJTkZPX0JBVENIIGlzIG1vcmUgYWJvdXQgcHJvdmlkaW5nIHBlcmlvZCBncmFu
dWxhcml0eSB3aGVuIGh3X3B0ciBpcyBxdWVyaWVkLg0KQnV0IFBETSBkcml2ZXIgRE1BIHBvaW50
ZXIgY2FsbGJhY2sgcmV0dXJucyBwcmVjaXNlIGh3X3B0ciB3aGVuIHF1ZXJpZWQuDQpDb3JyZWN0
IG1lLCBpZiB1bmRlcnN0YW5kaW5nIGlzIHdyb25nLg0KDQoNCiANCg0KPiA+ICsJLmZvcm1hdHMg
PSBTTkRSVl9QQ01fRk1UQklUX1MzMl9MRSwNCj4gPiArCS5jaGFubmVsc19taW4gPSAyLA0KPiA+
ICsJLmNoYW5uZWxzX21heCA9IDIsDQo+ID4gKwkucmF0ZXMgPSBTTkRSVl9QQ01fUkFURV80ODAw
MCwNCj4gPiArCS5yYXRlX21pbiA9IDQ4MDAwLA0KPiA+ICsJLnJhdGVfbWF4ID0gNDgwMDAsDQo+
ID4gKwkuYnVmZmVyX2J5dGVzX21heCA9IENBUFRVUkVfTUFYX05VTV9QRVJJT0RTICoNCj4gQ0FQ
VFVSRV9NQVhfUEVSSU9EX1NJWkUsDQo+ID4gKwkucGVyaW9kX2J5dGVzX21pbiA9IENBUFRVUkVf
TUlOX1BFUklPRF9TSVpFLA0KPiA+ICsJLnBlcmlvZF9ieXRlc19tYXggPSBDQVBUVVJFX01BWF9Q
RVJJT0RfU0laRSwNCj4gPiArCS5wZXJpb2RzX21pbiA9IENBUFRVUkVfTUlOX05VTV9QRVJJT0RT
LA0KPiA+ICsJLnBlcmlvZHNfbWF4ID0gQ0FQVFVSRV9NQVhfTlVNX1BFUklPRFMsDQo+ID4gK307
DQo+ID4gKw0KPiANCj4gWy4uLl0NCj4gDQo+ID4gK3N0YXRpYyBzbmRfcGNtX3VmcmFtZXNfdCBh
Y3BfcGRtX2RtYV9wb2ludGVyKHN0cnVjdA0KPiBzbmRfc29jX2NvbXBvbmVudCAqY29tcCwNCj4g
PiArCQkJCQkgICAgIHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbQ0KPiAqc3RyZWFtKQ0KPiA+ICt7
DQo+ID4gKwlzdHJ1Y3QgcGRtX3N0cmVhbV9pbnN0YW5jZSAqcnRkOw0KPiA+ICsJdTMyIHBvcywg
YnVmZmVyc2l6ZTsNCj4gPiArCXU2NCBieXRlc2NvdW50Ow0KPiA+ICsNCj4gPiArCXJ0ZCA9IHN0
cmVhbS0+cnVudGltZS0+cHJpdmF0ZV9kYXRhOw0KPiA+ICsJcG9zID0gMDsNCj4gPiArCWJ1ZmZl
cnNpemUgPSAwOw0KPiA+ICsJYnl0ZXNjb3VudCA9IDA7DQo+IA0KPiB0aGVzZSAzIGluaXRzIHNl
ZW0gdW5uZWNlc3Nhcnk/DQoNCldpbGwgcmVtb3ZlIGl0Lg0KPiA+ICsNCj4gPiArCWJ1ZmZlcnNp
emUgPSBmcmFtZXNfdG9fYnl0ZXMoc3RyZWFtLT5ydW50aW1lLA0KPiA+ICsJCQkJICAgICBzdHJl
YW0tPnJ1bnRpbWUtPmJ1ZmZlcl9zaXplKTsNCj4gPiArCWJ5dGVzY291bnQgPSBhY3BfcGRtX2dl
dF9ieXRlX2NvdW50KHJ0ZCwgc3RyZWFtLT5zdHJlYW0pOw0KPiA+ICsJaWYgKGJ5dGVzY291bnQg
PiBydGQtPmJ5dGVzY291bnQpDQo+ID4gKwkJYnl0ZXNjb3VudCAtPSBydGQtPmJ5dGVzY291bnQ7
DQo+ID4gKwlwb3MgPSBkb19kaXYoYnl0ZXNjb3VudCwgYnVmZmVyc2l6ZSk7DQo+ID4gKwlyZXR1
cm4gYnl0ZXNfdG9fZnJhbWVzKHN0cmVhbS0+cnVudGltZSwgcG9zKTsNCj4gPiArfQ0KPiA+ICsN
Cg==
