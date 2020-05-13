Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8185F1D1C87
	for <lists+alsa-devel@lfdr.de>; Wed, 13 May 2020 19:46:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2469A165E;
	Wed, 13 May 2020 19:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2469A165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589391968;
	bh=omgozQ7VFUsBPLh+ORjmwV4yVSkSa5PvE3X4CVC8DBA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ncJUmD2VqZpL7Ek6QngXPj0g9nzulAiDHCbJgdG0SLTQUrqpU4DodULyZinjYm7Go
	 GneG1WXuLKC12pkYiNAv+0TLAzoc3D6tjYT9ZbaPqwHmbHN1pciAiftCuQESDOpkHe
	 7JADuslsp1qBvyslb3FL2wEqsSrGMDI1xlA7Jqjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E42A1F8022D;
	Wed, 13 May 2020 19:44:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F00E7F80247; Wed, 13 May 2020 19:44:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53A9FF800BD
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 19:44:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53A9FF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="gFxy32qw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UP1y3PNUBxqjTXYZ/tayYMNtOM4lVrfLmcvLFsZtjqpbGGhS0fo0WOz7th7lbXR57tfN0qX5wtah5f0W49Djgo2EQhAKF+mhlMFCnRF2s+4RBURnhIAOov9F/KeyVv5Sz8SMz9JSL0Op74PrNgWnRjJ6HRzsbFP9kMcW7L+Bp+jwEtZmNR3I16IUN7vTzKpFbe1q1REEWAndhOjt1YPrBDA4sUrPJgN/LnaxFN3MMtxjpVIjPL1anNVQ2DYSO9zREhk2kJawTfoOBM1ui5gYH4iRxnKvuVjcZQaEaa4+8WbHavyU1CKqHVTWzlfwnBFkca/1jiH9rZKo9JfaZnUW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omgozQ7VFUsBPLh+ORjmwV4yVSkSa5PvE3X4CVC8DBA=;
 b=lJbiJaB943PxKwSm+THJ9BKrnme+pakjL0LoD4jF2jjLbpGZ0fqDBSUYoSPGzyvSvdai5dbmL4WXSCDS29ypeLWqXDiXra7DWkkVntbgQ+CHO0bb7SMN/TGeKzY77rxw0QW0AjuDaP1yDHiCwrgqSr9myZMPeZe+44Hf5oyNHVoIHgA3NArK4BwOofXfCXB+meS4KZ2geS9RpcEarzQChhpknyv6wkD8fbDEcbuKlfgcZ0O2KVFou/6Jq0WIg3vMWW/9mrEO6BY0C1UKqFT8XT7UrqHA9+/GXCEB0TxghVrQBQR4NGGEg5z6E6zfWoC1H1f4mBxCEleK/GZchY1IVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omgozQ7VFUsBPLh+ORjmwV4yVSkSa5PvE3X4CVC8DBA=;
 b=gFxy32qwu60Txjd0Q/6gdSkVU0EvvqCiqF+jplmeVFCQooFM3gai+KG/1Wh0Gl9m7IIboOaXo2iIy9lEDcwXaHpoMy6ipYjPqKwLvgQDPm5wTn1D1cxbB6wE2FP14Par0Yl6qcrM0JyKMddFx5BonklVz5i3nBHjPm+IMgRXpuk=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB2729.namprd12.prod.outlook.com (2603:10b6:5:43::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.20; Wed, 13 May 2020 17:44:09 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.2979.033; Wed, 13 May 2020
 17:44:09 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Alex Deucher
 <alexdeucher@gmail.com>
Subject: RE: [PATCH v2 09/14] ASoC: amd: add Renoir ACP PCI driver PM ops
Thread-Topic: [PATCH v2 09/14] ASoC: amd: add Renoir ACP PCI driver PM ops
Thread-Index: AQHWJ9oDqvYojRTkQ06RJWLof66Ai6ijd1eAgAEATACAABlAgIAAS1zAgAAOCwCAAV6FwA==
Date: Wed, 13 May 2020 17:44:09 +0000
Message-ID: <DM6PR12MB2633E6DFC2D8EACE3939C29897BF0@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200511212014.2359225-1-alexander.deucher@amd.com>
 <20200511212014.2359225-10-alexander.deucher@amd.com>
 <3c131eb1-9f5c-fd37-687c-182888774e08@linux.intel.com>
 <CADnq5_NHzg5dVhbx9ZqNDgVZVWfGaUteVtxLRORCXVM6UOP1nQ@mail.gmail.com>
 <565ebd07-e515-c84c-f4c5-7997dbac308b@linux.intel.com>
 <BYAPR12MB2632FF6DE6FBA71764F40E1197BE0@BYAPR12MB2632.namprd12.prod.outlook.com>
 <13e8c823-466c-cee3-ed93-071ecece02f5@linux.intel.com>
In-Reply-To: <13e8c823-466c-cee3-ed93-071ecece02f5@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-05-13T17:44:06Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=164d13b7-7a0b-4f9e-9caa-0000c20b2b61;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-05-13T17:44:06Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 113a16d4-a839-4147-8177-00005c869d3f
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 662bfa7b-293f-42d7-8654-08d7f7653dcd
x-ms-traffictypediagnostic: DM6PR12MB2729:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB272931C0E0A6AB0E50CB9D7497BF0@DM6PR12MB2729.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0402872DA1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SEfn612VMajpujNHoOFbj6e+h63ci9NHppuItAvlMZd1Sk/l4hEVEL0yBVGNgTA9RfZiIfOlSwwqvvK9tep/+5YyaMCoh2KbR2vXKm6YM779IEQqYPsohG/d1A9oi1bixuOmLNQDjgO5d6GpmK19zR6hn494AA3K3s/IbRlY3blW+76p3hrH6qqT6Cm5aozwN52w/Qo1zz+FLsKDcUtXGh6gnAEmBro+GMR8bFtu0OGV3hLztSXLb2IK5DcGuLMAAc66jN2kLZf7iZ9yflVJANeXhKLZ+pm8DPfxjzsdDnzMbxnHfrHyZwxUbqI0YWwyJEuwTjz7zvTp2hSZz22nNr8sQ2FLWeEVvGZGT8ISc6GeMoraDZ/VHJQupDeCuLQikRlgzc8zN6/5UJQadkoQJeFykvNEjVXcgach62dCz5WHjR9B9OwMEf5MuNT+7r9yuTRI7PntqZ8/JX5g3D0fT5MRknD28pSwurpncD+/4Enu4UTObMeJVrO+NSeKW8TGZAytXOAn3tQKjLZKIhkC+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(33430700001)(76116006)(55016002)(66946007)(26005)(6506007)(53546011)(8936002)(8676002)(4326008)(33656002)(86362001)(110136005)(52536014)(54906003)(186003)(7696005)(316002)(64756008)(66476007)(9686003)(5660300002)(478600001)(66446008)(66556008)(33440700001)(71200400001)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Zqehbs+7iZP9iPBrY493lBlYyEmT9ko/UFZnNapOB5QVw7xtcUkKv28RE3pCnTivreFXv5SDVM3wSGYOeAFpHtGTezPDyXLzWEfpqX5ym8Th7VppBiOseLDfGDMzhdWAbg35VbCaCBaLypZ1l4g29nsq2Lt5eX2bmk0bH4+315zXyPgeEa5Qfi+ZshogYO50pTuY1nDaNgOnqyJLSbNuZH4pf7I+6NkNxgrkZSVBwfERKyX/utXwhQtjRH7Ui4Yt+jxKfaHmzfRwJnPuXGAgfou+t7rsMDMGPET3ADDxWD3R4OuuGkwhsO477Gack14FIGXFvwZxYn6EeqB2zVW7x1HHaM5Er2rzADYVfVGfCbGH3Mgk9yTbIygJrBZV29OJugX/LE4c5ERGvMwDCsEY3tYeF1zsuXw6UQpDT8JiCBcrEvlQe6a8nFSH/cO+2kpJ7fDQbrWfhF0Omu60IdZ0r0kWHBdJbQ3NK8Up4MCXcGaPv6DraOvmE86Yity5FylX
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 662bfa7b-293f-42d7-8654-08d7f7653dcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2020 17:44:09.5952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AnRMFKcYG0MX2rKhuNoef6Arzov7b11/EXBxQMZ9fF3JHpr1IdB0GaDvfKuWiZMGPLaKyMOOyRhb6wPng7FxXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2729
Cc: Takashi Iwai <tiwai@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
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
ZXNkYXksIE1heSAxMywgMjAyMCAyOjA2IEFNDQo+IFRvOiBNdWt1bmRhLCBWaWplbmRhciA8Vmlq
ZW5kYXIuTXVrdW5kYUBhbWQuY29tPjsgQWxleCBEZXVjaGVyDQo+IDxhbGV4ZGV1Y2hlckBnbWFp
bC5jb20+DQo+IENjOiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+OyBEZXVjaGVyLCBBbGV4
YW5kZXINCj4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBhbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmc7IE1hcmsgQnJvd24NCj4gPGJyb29uaWVAa2VybmVsLm9yZz4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MiAwOS8xNF0gQVNvQzogYW1kOiBhZGQgUmVub2lyIEFDUCBQQ0kgZHJpdmVy
IFBNIG9wcw0KPiANCj4gDQo+IA0KPiA+Pj4+PiArICAgICBwbV9ydW50aW1lX3NldF9hdXRvc3Vz
cGVuZF9kZWxheSgmcGNpLT5kZXYsDQo+ID4+IEFDUF9TVVNQRU5EX0RFTEFZX01TKTsNCj4gPj4+
Pj4gKyAgICAgcG1fcnVudGltZV91c2VfYXV0b3N1c3BlbmQoJnBjaS0+ZGV2KTsNCj4gPj4+Pj4g
KyAgICAgcG1fcnVudGltZV9hbGxvdygmcGNpLT5kZXYpOw0KPiA+Pj4+PiArICAgICBwbV9ydW50
aW1lX21hcmtfbGFzdF9idXN5KCZwY2ktPmRldik7DQo+ID4+Pj4+ICsgICAgIHBtX3J1bnRpbWVf
cHV0X2F1dG9zdXNwZW5kKCZwY2ktPmRldik7DQo+ID4+Pj4NCj4gPj4+PiB1c3VhbGx5IHRoZXJl
IGlzIGEgcG1fcnVudGltZV9wdXRfbm9pZGxlKCkgaGVyZT8NCj4gPj4+DQo+ID4+PiBJJ20gbm90
IHN1cmUuDQo+ID4+Pg0KPiA+Pj4+DQo+ID4+Pj4gWy4uLl0NCj4gPj4+Pg0KPiA+Pj4+PiAgICAg
c3RhdGljIHZvaWQgc25kX3JuX2FjcF9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBjaSkNCj4gPj4+
Pj4gICAgIHsNCj4gPj4+Pj4gICAgICAgICBzdHJ1Y3QgYWNwX2Rldl9kYXRhICphZGF0YTsNCj4g
Pj4+Pj4gQEAgLTI2MCw2ICszMDIsOSBAQCBzdGF0aWMgdm9pZCBzbmRfcm5fYWNwX3JlbW92ZShz
dHJ1Y3QgcGNpX2Rldg0KPiA+PiAqcGNpKQ0KPiA+Pj4+PiAgICAgICAgIHJldCA9IHJuX2FjcF9k
ZWluaXQoYWRhdGEtPmFjcF9iYXNlKTsNCj4gPj4+Pj4gICAgICAgICBpZiAocmV0KQ0KPiA+Pj4+
PiAgICAgICAgICAgICAgICAgZGV2X2VycigmcGNpLT5kZXYsICJBQ1AgZGUtaW5pdCBmYWlsZWRc
biIpOw0KPiA+Pj4+PiArICAgICBwbV9ydW50aW1lX3B1dF9ub2lkbGUoJnBjaS0+ZGV2KTsNCj4g
Pj4+Pj4gKyAgICAgcG1fcnVudGltZV9nZXRfc3luYygmcGNpLT5kZXYpOw0KPiA+Pj4+PiArICAg
ICBwbV9ydW50aW1lX2ZvcmJpZCgmcGNpLT5kZXYpOw0KPiA+Pj4+DQo+ID4+Pj4gZG9pbmcgYSBw
dXRfbm9pZGxlKCkgZm9sbG93ZWQgYnkgYSBnZXRfc3luYygpIGFuZCBpbW1lZGlhdGVseSBmb3Ji
aWQoKQ0KPiA+Pj4+IGlzIHZlcnkgb2RkIGF0IGJlc3QuDQo+ID4+Pj4gSXNuJ3QgdGhlIHJlY29t
bWVuZGF0aW9uIHRvIGNhbGwgZ2V0X25vcmVzdW1lKCkgaGVyZT8NCj4gPj4+Pg0KPiA+Pj4NCj4g
Pj4+IEknbSBub3Qgc3VyZSBoZXJlIGVpdGhlci4gIElzIHRoZXJlIHNvbWUgZGVmaW5pdGl2ZSBk
b2N1bWVudGF0aW9uIG9uDQo+ID4+PiB3aGF0IGV4YWN0IHNlcXVlbmNlcyBhcmUgc3VwcG9zZWQg
dG8gYmUgdXNlZCBpbiBkcml2ZXJzPyAgQSBxdWljaw0KPiA+Pj4gYnJvd3NlIHRocm91Z2ggZHJp
dmVycyB0aGF0IGltcGxlbWVudCBydW50aW1lIHBtIHNlZW1zIHRvIHNob3cgYSBsb3QNCj4gPj4+
IG9mIHZhcmlhdGlvbi4gIFRoaXMgc2VxdWVuY2Ugd29ya3MuICBJJ20gbm90IHN1cmUgaWYgaXQn
cyBvcHRpbWFsIG9yDQo+ID4+PiBub3QuDQo+ID4+DQo+ID4+IFdlIGJhc2VkIG91ciBzZXF1ZW5j
ZSBvbiB0aGUgY29tbWVudHMgaW4gZHJpdmVycy9wY2kvcGNpLWRyaXZlci5jDQo+ID4+DQo+ID4+
IC8qDQo+ID4+ICAgICogVW5ib3VuZCBQQ0kgZGV2aWNlcyBhcmUgYWx3YXlzIHB1dCBpbiBEMCwg
cmVnYXJkbGVzcyBvZg0KPiA+PiAgICAqIHJ1bnRpbWUgUE0gc3RhdHVzLiAgRHVyaW5nIHByb2Jl
LCB0aGUgZGV2aWNlIGlzIHNldCB0bw0KPiA+PiAgICAqIGFjdGl2ZSBhbmQgdGhlIHVzYWdlIGNv
dW50IGlzIGluY3JlbWVudGVkLiAgSWYgdGhlIGRyaXZlcg0KPiA+PiAgICAqIHN1cHBvcnRzIHJ1
bnRpbWUgUE0sIGl0IHNob3VsZCBjYWxsIHBtX3J1bnRpbWVfcHV0X25vaWRsZSgpLA0KPiA+PiAg
ICAqIG9yIGFueSBvdGhlciBydW50aW1lIFBNIGhlbHBlciBmdW5jdGlvbiBkZWNyZW1lbnRpbmcg
dGhlIHVzYWdlDQo+ID4+ICAgICogY291bnQsIGluIGl0cyBwcm9iZSByb3V0aW5lIGFuZCBwbV9y
dW50aW1lX2dldF9ub3Jlc3VtZSgpIGluDQo+ID4+ICAgICogaXRzIHJlbW92ZSByb3V0aW5lLg0K
PiA+PiAgICAqLw0KPiA+DQo+ID4gSWYgSSB1bmRlcnN0b29kIGNvcnJlY3RseSwgYmVsb3cgc2hv
dWxkIGJlICB0aGUgY29ycmVjdCBzZXF1ZW5jZSByaXRlID8NCj4gPg0KPiA+IGFjcCBwY2kgZHJp
dmVyIHByb2JlIHNlcXVlbmNlOg0KPiA+DQo+ID4gcG1fcnVudGltZV9zZXRfYXV0b3N1c3BlbmRf
ZGVsYXkoJnBjaS0+ZGV2LCBBQ1BfU1VTUEVORF9ERUxBWV9NUyk7DQo+ID4gcG1fcnVudGltZV91
c2VfYXV0b3N1c3BlbmQoJnBjaS0+ZGV2KTsNCj4gPiBwbV9ydW50aW1lX3B1dF9ub2lkbGUoJnBj
aS0+ZGV2KTsNCj4gPiBwbV9ydW50aW1lX2FsbG93KCZwY2ktPmRldik7DQo+IA0KPiBzb3VuZHMg
YWJvdXQgcmlnaHQuIFdlIGFkZGVkIGFuIGV4dHJhIHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3ko
KSB0bw0KPiBtYWtlIHN1cmUgdGhlIGluZm9ybWF0aW9uIGlzIHVwZGF0ZWQsIGJ1dCB0aGF0J3Mg
cHJvYmFibHkgb24gdGhlDQo+IHBhcmFub2lkIHNpZGUuDQo+ID4NCj4gPiBhY3AgcGNpIGRyaXZl
ciByZW1vdmUgc2VxdWVuY2U6DQo+ID4NCj4gPiBwbV9ydW50aW1lX2dldF9ub3Jlc3VtZSgmcGNp
LT5kZXYpOw0KPiA+IHBtX3J1bnRpbWVfZGlzYWJsZSgmcGNpLT5kZXYpOw0KPiA+DQo+ID4gSSBo
YXZlIHN0aWxsIGhhdmUgYSBkb3VidC4NCj4gPiBEbyB3ZSBuZWVkIHRvIGNhbGwgcG1fcnVudGlt
ZV9kaXNhYmxlKCkgZXhwbGljaXRseSAgaW4gdGhpcyBjYXNlID8NCj4gDQo+IHdlIGRvbid0IGNh
bGwgcG1fcnVudGltZV9kaXNhYmxlKCkuDQoNCkkgc2VlIGluIG9uZSBvZiB0aGUgUENJIGRyaXZl
ciBpbXBsZW1lbnRhdGlvbiwgaW4gZHJpdmVyIHJlbW92ZSBzZXF1ZW5jZQ0KcG1fcnVudGltZV9m
b3JiaWQoICkgQVBJIGlzIGNhbGxlZCBiZWZvcmUgcG1fcnVudGltZV9nZXRfbm9yZXN1bWUgKCkg
Y2FsbC4NCg0KSSBiZWxpZXZlICwgSXQncyBzYWZlIHRvIGNhbGwgcG1fcnVudGltZV9mb3JiaWQo
KSB3aGljaCB3aWxsIHByZXZlbnQgZGV2aWNlIHRvIA0KYmUgcG93ZXIgbWFuYWdlZCAgYXQgcnVu
dGltZSBpbiByZW1vdmUgc2VxdWVuY2UuDQoNCkNvcnJlY3QgbWUsIGlmIG15IHVuZGVyc3RhbmRp
bmcgaXMgd3JvbmcgLg0KDQo=
