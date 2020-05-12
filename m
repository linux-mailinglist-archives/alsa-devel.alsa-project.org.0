Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 569891CF705
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 16:24:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0F0316AE;
	Tue, 12 May 2020 16:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0F0316AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589293485;
	bh=z7EGuKJEeX3Z2fi7VbqJBG6ndnPy0VrLVDx24DRcMhE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hS76ByZIDaYgvuNu+8JirViSfFqwGIAwgn+MIi+/0NYy851McC275O6d/XC8Hs1fQ
	 PkeVFov+ofjTL5GL5YY5gELofsdBqL+0YzWVl6s+aSmKet6/Sdu7SB9aJbFdYN+9iQ
	 drnBFD9Tlr6UUtLTuNzujZGDBk0GbkxVfMSh9j4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7160F800E3;
	Tue, 12 May 2020 16:23:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FC3FF8014C; Tue, 12 May 2020 16:23:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4CF7F800AA
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 16:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4CF7F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="pXDwF+4S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCBVpz0i9pOVXnqNZ2KPHLeeyJChPoiMLdxZEagRPETOokRhoOyOJ3rdEjpRWEMI60unn4WI+i9TAD3NnxPUbtPvQ6YoCfkcnUeAXR+g0dtB/8nz9lMfZQH4kRxr6yRrWYXkW3yj8I3ZfIJcED+cOBdcEeDUoxr7PaZb1p+3No/0J969bzpP+beY7jJRAGSujyqaomaV/UyPorVbMzLMFk/53uiNokX2rpCbuvhE+u4mnnBkh1/Ff3xOyv1x5YjbMjps06q10jbSc7f2W1gaix/Xojt2fyejvzyWoCuR+KeOwgb37fbpBb8E+XCmo1hEz9M4HFrKEjfrXB+9vvwDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7EGuKJEeX3Z2fi7VbqJBG6ndnPy0VrLVDx24DRcMhE=;
 b=gg2odfo/cvM7LJRNYggXm+DeHUrjxuQ7a2NV1yg4MFW5/77GO0LgWGf1UPWCLXqnOLglnFQmKicl71wFMW53ML8b3a3VLuic60DCHNIE6sdP99W4VLL3fJIBNBRYfE6ENdQjmMI+1QYl5nhr2JrpRz4444syjZp+7u+11uawzA6gGRPxtNY/KGHGGUEHfYQ9oywWZwtWVVdKa2W5RHptYNSYekZQkSUWH7WgYrjRxfADRhutBg6JyPyEUpbp4P3O1z9Zp9Q4AsYekn6lHrgDZren4qZbjwj342ewNYigbPgAnuqbrpDVjrbdagLrEW0lg8mpc1W7LaIeRY/TqGqEPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7EGuKJEeX3Z2fi7VbqJBG6ndnPy0VrLVDx24DRcMhE=;
 b=pXDwF+4SSj8ggfeeFp8c2QpThg03FT7DTSJhYGEA6YvGQSalNGVL5VSvIcjHfLjjdfNjLIK56c/MHn8D3aQmn08dcjabDMTaeyNIwXtxCYxEBEu8TVP7916qUxEBV8nqVR3trj+GIwNRVwRlOz3w3RcfZH8tTSIHKwAVfvVHAuU=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB4529.namprd12.prod.outlook.com (2603:10b6:5:2ab::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.20; Tue, 12 May 2020 14:22:48 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 14:22:48 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Alex Deucher
 <alexdeucher@gmail.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "broonie@kernel.org" <broonie@kernel.org>,
 "tiwai@suse.de" <tiwai@suse.de>
Subject: RE: [PATCH v2 13/14] ASoC: amd: RN machine driver using dmic
Thread-Topic: [PATCH v2 13/14] ASoC: amd: RN machine driver using dmic
Thread-Index: AQHWJ9oGdIvfK+zmrk6tSLs5oUz+hKijebMAgAEHjiA=
Date: Tue, 12 May 2020 14:22:47 +0000
Message-ID: <DM6PR12MB2633C6CBD186E8BEEBE159CC97BE0@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200511212014.2359225-1-alexander.deucher@amd.com>
 <20200511212014.2359225-14-alexander.deucher@amd.com>
 <c6b037b5-ef02-8919-a3c9-6b1a53f1cc0c@linux.intel.com>
In-Reply-To: <c6b037b5-ef02-8919-a3c9-6b1a53f1cc0c@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-05-12T14:20:33Z; 
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=cf7a73e5-3fea-41cf-9def-0000bee22c51;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_enabled: true
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_setdate: 2020-05-12T14:22:44Z
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_method: Privileged
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_name: Non-Business
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_actionid: 0beb69d5-d1f2-4778-b415-00002a378b86
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_contentbits: 0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [2401:4900:33af:22e0:290b:e37e:51cd:c5b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b50e12d1-e121-4e3f-8630-08d7f67ff230
x-ms-traffictypediagnostic: DM6PR12MB4529:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB45293DFFA948C18C248803ED97BE0@DM6PR12MB4529.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0401647B7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EhzSYHPRe4PmVbN32nDMFyswVK0WUh7CAfq36Fxh/wJmyNyCL6C8+cWGCejLPIc9z/3ZPjS6u9pXUwfJm9l3P4+dYxf2v143kXRIAM10pn+6hHrpl5Ofets2botO0YQUDlGVHfU8FVsr8mqQBvCHiZpzpI+h97rvUoCtaSNoByL6pz40E+vkSI51nHz8OcERL1weH7ih34A0HNtXqNSyAkIppNhkMG20VvMF6lFFr56Dj1T3YNxWiOBBYpowNd9Tz9e29OEz93lkfWAcJ9Zhr+EFF1GjpujCHRsxqWxwkFrivX7H8XBQxzBUiMq21ivRwB24v1yyhcVg7RGMDSteP1fyem0u6Y5QdUYJP6FO5rfFf2H2DIqXJeZR9oTXg0z4kW1T7dqfOZKsENt4+2C8iPC/FN+ydoUOV7SoLA5XFZ//gZRApaMS2s+Xx++Zani39wwCgOhvQZQEgNFvNlBcfJdA3CLZ1A5P3Vo6gS2XT+V+2lkrzaMzZfiktVm59VDRtK7ckXof5KfaM5RJyYWGXQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(33430700001)(71200400001)(186003)(478600001)(9686003)(7696005)(8936002)(6506007)(53546011)(4326008)(52536014)(33656002)(33440700001)(316002)(76116006)(2906002)(55016002)(110136005)(66946007)(64756008)(66476007)(86362001)(5660300002)(8676002)(66446008)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: uvxByeq59oixmtPVu2hX+llKItM9Q88sOTt200ApbHP/sEBi0x/G52ONL9WOOWrDQXlEYI2N05QzkPtcVbdlwkfH/acfi9+K3ZIYSJPP6aJBmrLfoDeYQvDF3vemGc2WzuPcNZrIBACMfaWNKxx+7yKCGcpNs8mkipWq+V7lbgabzYYwxSt2mXgA3268ARz/VaC5M2FIfTnZf0Lb58+wqO4Y2aFNXOJdactNb/9H6WncVlUdPzzVmRfrrgZ0JCndqM5yAKLGQI8Na67hTRytCPdTS0cdcaD415qQeR5mz9Z496u/s0NzV/66HyUbVVhdUqmhQoHbfp+Y636fwaLjjrQGt+atsE7kgDccAc1K/c8UBnF2stGtam5xwVL426CidKEptV4NmnfGk9lA6AaN71mORuN25LXb+S11lOsyYEUJw0NeVIHgSFoAtOCC4G2wHbJnLPpAW7gmqqJPOgQE2eh5vZzlYTZaKuAIj4wG7QG+2GRVE2oT/yFn/f6f9FZB4da06v5z5XX22PmCFFmZUtWwntbiPYW3sxpNeu+ulSCXsiu/SPgwKcO2o5XM4JCZ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b50e12d1-e121-4e3f-8630-08d7f67ff230
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2020 14:22:48.0180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NGTzgK3c0hF6wu/lClcFItyukadnbl7fBnlXpZSwJCb+ottAIXxpMzLZAaZkdKsHUyKsVltDeYfBsPFMhm6fdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4529
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
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogVHVl
c2RheSwgTWF5IDEyLCAyMDIwIDQ6MDcgQU0NCj4gVG86IEFsZXggRGV1Y2hlciA8YWxleGRldWNo
ZXJAZ21haWwuY29tPjsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOw0KPiBicm9vbmllQGtl
cm5lbC5vcmc7IE11a3VuZGEsIFZpamVuZGFyIDxWaWplbmRhci5NdWt1bmRhQGFtZC5jb20+Ow0K
PiB0aXdhaUBzdXNlLmRlDQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVj
aGVyQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMTMvMTRdIEFTb0M6IGFtZDog
Uk4gbWFjaGluZSBkcml2ZXIgdXNpbmcgZG1pYw0KPiANCj4gDQo+IA0KPiANCj4gPiArc3RhdGlj
IGludCBhY3BfcGRtX2h3X3BhcmFtcyhzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVh
bSwNCj4gPiArCQkJICAgICBzdHJ1Y3Qgc25kX3BjbV9od19wYXJhbXMgKmh3X3BhcmFtcykNCj4g
PiArew0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gDQo+IGlzIHRoaXMgbmVlZGVkPw0KDQpX
aWxsIHJlbW92ZSBpdC4NCj4gDQo+ID4gKw0KPiA+ICtzdGF0aWMgc3RydWN0IHNuZF9zb2Nfb3Bz
IGFjcF9wZG1fb3BzID0gew0KPiA+ICsJLmh3X3BhcmFtcyA9IGFjcF9wZG1faHdfcGFyYW1zLA0K
PiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGludCBhY3BfaW5pdChzdHJ1Y3Qgc25kX3NvY19w
Y21fcnVudGltZSAqcnRkKQ0KPiA+ICt7DQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiANCj4g
aXMgdGhpcyBuZWVkZWQ/DQoNCldpbGwgcmVtb3ZlIGl0Lg0KDQo+IA0KPiANCj4gPiArc3RhdGlj
IHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgYWNwX21hY2hfZHJpdmVyID0gew0KPiA+ICsJLmRyaXZl
ciA9IHsNCj4gPiArCQkubmFtZSA9ICJhY3BfcGRtX21hY2giLA0KPiA+ICsJCS5wbSA9ICZzbmRf
c29jX3BtX29wcywNCj4gPiArCX0sDQo+ID4gKwkucHJvYmUgPSBhY3BfcHJvYmUsDQo+ID4gK307
DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBhY3BfYXVkaW9faW5pdCh2b2lkKQ0KPiA+
ICt7DQo+ID4gKwlwbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIoJmFjcF9tYWNoX2RyaXZlcik7DQo+
ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgX19leGl0IGFj
cF9hdWRpb19leGl0KHZvaWQpDQo+ID4gK3sNCj4gPiArCXBsYXRmb3JtX2RyaXZlcl91bnJlZ2lz
dGVyKCZhY3BfbWFjaF9kcml2ZXIpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICttb2R1bGVfaW5pdChh
Y3BfYXVkaW9faW5pdCk7DQo+ID4gK21vZHVsZV9leGl0KGFjcF9hdWRpb19leGl0KTsNCj4gDQo+
IHVzZSBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKCkgLSB3YXMgYWxyZWFkeSBmZWVkYmFjayBvbiB2
MS4uLg0KDQpTb3JyeSwgSSBoYXZlIG92ZXIgbG9va2VkIGl0LiBXaWxsIGZpeCBpdC4NCg0K
