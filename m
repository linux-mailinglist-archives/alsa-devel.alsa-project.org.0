Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 862A81C77C8
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 19:24:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16D4F83A;
	Wed,  6 May 2020 19:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16D4F83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588785891;
	bh=xD44VlgDvZ3uaI5oahbTD9JfkUsFvFQ8tY0ijfGL+XM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R3NFSRF6nWJzFIq2t2fC3QbpX9o/tXEleDYZOmiVSXnp4rih0ht+zGdFL4wBD1rMu
	 Vz6qLy7lOkJUbcEsD6LlDiZZM7KV1yJ2WCnYpEm+QgBc2dW8TnryLqb0wyDni6t5MJ
	 TfPMbz+jHjV47BJ9wCRznbalsjb/TSx4qtIWn0H0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C364F802C4;
	Wed,  6 May 2020 19:20:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6559DF802C3; Wed,  6 May 2020 19:20:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::621])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD1B3F802BE
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 19:20:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD1B3F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="GnpdS3Ii"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k80H8ov3HruOek66NKBEkREr1RPaiiyA3GMMWaLWlP8kAis0jVBzkozOgserlSDlOBLYWa6AlirUhBxFqQHATQ6g4f8AVv/orwzBfHdRf99+6qR29J8hb4ncjj/vbGEEtbRYglS5tGQkdFB1ElUPKRUlW00ayhL43d2cCggReRLiMItkE/m4fqORsqbK4be0MS0asSS9K02Wcwn43K/3sspAelzdOIHk4aubNFHjYoY6ez8UiboL4xV4U53gbDspn0O3/y1rGZ1hL8mE4LwOht80Iu+zcrGz51nDT1srPJAoFq9/cT+g9uDXJC1vi+p1+7qs9PivVWq/vjxD8LfbIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xD44VlgDvZ3uaI5oahbTD9JfkUsFvFQ8tY0ijfGL+XM=;
 b=V626RsuTkkPDuuOWIywo3WJYnGyi90PdD8SlnwvEha8wYoU3nB67Pb+kakLH9fvx97xeCesbJu+mk/HJCxoMKSX5D7zk7TE07B60Yucz74Ynptm9PYhUwb3Hcf8dkHoESUHXnNxHVMO42w5kGAyO6dG84u6SVMitEwFrKAXw3osu7pFjQTbyNRI4oeJaaGd+nUer/JdmmZk3Zs0YceAT72RUEFjYuNbxlGP62N06GX7jrZPoJSoEbLKUsu+wOXghE9vCb8y/cIvwHwtJaDCuuo95zaVbkR3AoUYeOLWClKkO6LNaT9KQDNM0cQYp5Ty8Ln4wumstjRZHu6ougaTChQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xD44VlgDvZ3uaI5oahbTD9JfkUsFvFQ8tY0ijfGL+XM=;
 b=GnpdS3IioyR6ANwdjDBlDXrNpi5oDxMXjKIrmWc2grQeym8wMhW796swavK+g2dVqgLznfIOoHv/0yCUSZhe69tKJIsshZU03GvxBXCmzweLxUUIjOCOV5TRmea3oeGb8UzH9FvMGE39gxdp4ZcSZO59caDk4jIMuLnsFCoS11U=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB4386.namprd12.prod.outlook.com (2603:10b6:5:28f::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.29; Wed, 6 May 2020 17:20:11 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.2958.029; Wed, 6 May 2020
 17:20:11 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Alex Deucher
 <alexdeucher@gmail.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "broonie@kernel.org" <broonie@kernel.org>,
 "tiwai@suse.de" <tiwai@suse.de>
Subject: RE: [PATCH 05/14] ASoC: amd: add ACP3x PDM platform driver
Thread-Topic: [PATCH 05/14] ASoC: amd: add ACP3x PDM platform driver
Thread-Index: AQHWIx9EQHyCeayUi02hl30wIoxyXaiaC7gAgAFBzjA=
Date: Wed, 6 May 2020 17:20:10 +0000
Message-ID: <DM6PR12MB263345EB1787ED55544324D697A40@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-6-alexander.deucher@amd.com>
 <3fa76374-4125-ed8a-436e-7127476baedd@linux.intel.com>
In-Reply-To: <3fa76374-4125-ed8a-436e-7127476baedd@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-05-06T17:20:07Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=b2a835a7-e4d7-498d-9ec3-0000650cdb15;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-05-06T17:20:07Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: d87849c4-8a17-4cf6-b43b-000050a7a24c
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 895753d7-4710-4c83-3959-08d7f1e1bb7e
x-ms-traffictypediagnostic: DM6PR12MB4386:|DM6PR12MB4386:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4386B3CB92820984DDFE884D97A40@DM6PR12MB4386.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:21;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KDqG09IwLFL7SQwttEs7mZw8G9uN42/frgm4FMIPM2rFpwSRKAonVAVIL/rCUrMTQUIQ8wO+ltGAAB064+w4ggGXEzzgVCci8c857OW9tJx4SOu+DV5gLddAA2viKQjbmfWRYg7Hc2S2T/FILMn/EUZZ6/ES942uX+IKH8VmX8mLQCd2TYZqRb4SzdnqtwPZzdjilNaAW8gLoqNrvtue0k/ZB/67YzLcIVgz3CNnqdRtyJUboIhSTSk/EwYt4SPz8No4NQiUMlm9M1kXgU9ZjwXIcsi/pXs8sgcxQ4yPdJU4IWOR0WOJNiu+fd5XIOqAVvSm28VRlr6fRN+422bHhxQnMc2MB5BjAH4bN1f+OxN/LwdBz7CIrPquek+Lo1QIwF/YKMmzpTjbSvzxeb1lgpLtkdQzV4UNfBZpAdUcdN54qKeGklQLp8rcg62Vzzzh2Q1Nx+iPHPnKqEHse1vw7NWmvdZYvGQzXCi6g7/pk9F62LFfD62rxF86HN6nXG3nLZ6OpQ1J56sAgOwYWYmyeCwhIgONgBRkfSW+UEZ9Mqdixi2muiNr4BAZY5dYYs/u
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(33430700001)(33656002)(110136005)(53546011)(7696005)(33440700001)(316002)(186003)(86362001)(6506007)(26005)(52536014)(9686003)(478600001)(5660300002)(71200400001)(8936002)(8676002)(55016002)(76116006)(66476007)(66556008)(66946007)(2906002)(64756008)(4326008)(66446008)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: e5CWZjJxNwH0WB28CYTKlm81jMkVc5kT/oIZrQxx7E8ts8yctmIVtgfRo3Hs3ioXp6nHwUMDRK3AnS4JwHctZ18hn4XtS/kz4eTpYt8b5Q0qMtr0ppIyCBf+5iKYq9Q7L1gjjEloMwGEbBr1pSr4OL6xUsfnbKgMdc4NsxpLB0bcVg0iK5urrWvnrvXEKGjNT7kePloMFWvgJBk3r3UrQ3GHSMsNiPngNu4T3k5Hrx6d+qBtu2DspA12f8Wp2ELeiCrk0ZZ7C/lMx36jw5FqHgcJSjAUyeNNvatBgBeFzJHcJn+7DzcqMOjSP1flX8DLuOE234YBlPhhLTo2k34iiYoC4WMl0RckM+E65EB5vlhTjssPwseHoMytW3VrQGCbv2deGp8qE6ctoyAuh4ZKoT/MnMsColOfzvZthMNJXIffPH4TBIbaHIYa78sfiXTz1dybqKEM9LR8bQjm2T8OPpJ1hcvl+L6n0u2K3WzKj4wa2da17gM7xij1DF1Z2d37/DoanTbah5SDy8BsUoiwkBYGQ13FdjFO7o9sPxx+0ksuEgUSC93wFETD9VY0vI0Z8i9vsr3vj0b3qR3VIrzkiZBW58bb6JhEixauk91Qua2B0+3+RtWZDmSDi++Z4AhRIsORlMhBagmueT+WKAfWpkRndUO3bnq914mtfdP7KX/YpyXr3xqBbJoV12Qpwe/gPq4CKQAB/jBWPseOc/haolHSECYdXWFYWxIpTGwrpfmF3HaiiJV3YuvbfD4R7SUu7xaIQn8RHCPslGWtFaGDZba2eppe1FBEWmVRrAgp9WJU2HNqAFV8k14sBJaWITrU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895753d7-4710-4c83-3959-08d7f1e1bb7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 17:20:10.9872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 99HccaMKZIxjVGq0m6X1U+icFfPjFARfO3RgZkE0zM8qZ1xFrThWQdcqvHKjxx47ukI8E6OU3M9Pl0Xi+aJTiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4386
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
ZXNkYXksIE1heSA2LCAyMDIwIDM6MzMgQU0NCj4gVG86IEFsZXggRGV1Y2hlciA8YWxleGRldWNo
ZXJAZ21haWwuY29tPjsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOw0KPiBicm9vbmllQGtl
cm5lbC5vcmc7IE11a3VuZGEsIFZpamVuZGFyIDxWaWplbmRhci5NdWt1bmRhQGFtZC5jb20+Ow0K
PiB0aXdhaUBzdXNlLmRlDQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVj
aGVyQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDUvMTRdIEFTb0M6IGFtZDogYWRk
IEFDUDN4IFBETSBwbGF0Zm9ybSBkcml2ZXINCj4gDQo+IA0KPiANCj4gDQo+ID4gK3N0YXRpYyBz
dHJ1Y3Qgc25kX3NvY19kYWlfb3BzIGFjcF9wZG1fZGFpX29wcyA9IHsNCj4gPiArCS5od19wYXJh
bXMgPSBOVUxMLA0KPiA+ICsJLnRyaWdnZXIgICA9IE5VTEwsDQo+ID4gK307DQo+IA0KPiBkb2Vz
bid0IHNlZW0gdmVyeSB1c2VmdWw/IGNhbiB5b3UgcmVtb3ZlIHRoaXMgcGRtX2RhaV9vcHM/DQoN
CldpbGwgcmVtb3ZlIGl0IC4NCj4gDQo+ID4gKw0KPiA+ICtzdGF0aWMgc3RydWN0IHNuZF9zb2Nf
ZGFpX2RyaXZlciBhY3BfcGRtX2RhaV9kcml2ZXIgPSB7DQo+ID4gKwkuY2FwdHVyZSA9IHsNCj4g
PiArCQkucmF0ZXMgPSBTTkRSVl9QQ01fUkFURV80ODAwMCwNCj4gPiArCQkuZm9ybWF0cyA9IFNO
RFJWX1BDTV9GTVRCSVRfUzI0X0xFIHwNCj4gPiArCQkJICAgU05EUlZfUENNX0ZNVEJJVF9TMzJf
TEUsDQo+ID4gKwkJLmNoYW5uZWxzX21pbiA9IDIsDQo+ID4gKwkJLmNoYW5uZWxzX21heCA9IDIs
DQo+ID4gKwkJLnJhdGVfbWluID0gNDgwMDAsDQo+ID4gKwkJLnJhdGVfbWF4ID0gNDgwMDAsDQo+
ID4gKwl9LA0KPiA+ICsJLm9wcyA9ICZhY3BfcGRtX2RhaV9vcHMsDQo+ID4gK307DQo+ID4gKw0K
PiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfY29tcG9uZW50X2RyaXZlciBhY3BfcGRt
X2NvbXBvbmVudCA9IHsNCj4gPiArCS5uYW1lCQk9IERSVl9OQU1FLA0KPiA+ICt9Ow0KPiA+ICsN
Cj4gPiArc3RhdGljIGludCBhY3BfcGRtX2F1ZGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCByZXNvdXJjZSAqcmVzOw0KPiA+ICsJc3Ry
dWN0IHBkbV9kZXZfZGF0YSAqYWRhdGE7DQo+ID4gKwl1bnNpZ25lZCBpbnQgaXJxZmxhZ3M7DQo+
ID4gKwlpbnQgc3RhdHVzOw0KPiA+ICsNCj4gPiArCWlmICghcGRldi0+ZGV2LnBsYXRmb3JtX2Rh
dGEpIHsNCj4gPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJwbGF0Zm9ybV9kYXRhIG5vdCByZXRy
aWV2ZWRcbiIpOw0KPiA+ICsJCXJldHVybiAtRU5PREVWOw0KPiA+ICsJfQ0KPiANCj4gaXMgdGhp
cyB0ZXN0IG5lZWRlZD8NCg0KSXRzIG9ubHkgcHJvdmlkZXMgYW4gZXh0cmEgY2hlY2suIFRoaXMg
aXMgYSBjaGlsZCBkZXZpY2UgY3JlYXRlZCBieSBBQ1AgZGV2aWNlLg0KQUNQIGRldmljZSBwYXNz
ZXMgbWVtb3J5IGFuZCBJUlEgcmVzb3VyY2VzIHRvIHRoaXMgY2hpbGQgZGV2aWNlLg0KDQo+IA0K
PiA+ICsJaXJxZmxhZ3MgPSAqKCh1bnNpZ25lZCBpbnQgKikocGRldi0+ZGV2LnBsYXRmb3JtX2Rh
dGEpKTsNCj4gPiArDQo+ID4gKwlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9S
RVNPVVJDRV9NRU0sIDApOw0KPiA+ICsJaWYgKCFyZXMpIHsNCj4gPiArCQlkZXZfZXJyKCZwZGV2
LT5kZXYsICJJT1JFU09VUkNFX01FTSBGQUlMRURcbiIpOw0KPiA+ICsJCXJldHVybiAtRU5PREVW
Ow0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWFkYXRhID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYs
IHNpemVvZigqYWRhdGEpLCBHRlBfS0VSTkVMKTsNCj4gPiArCWlmICghYWRhdGEpDQo+ID4gKwkJ
cmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiA+ICsJYWRhdGEtPmFjcF9iYXNlID0gZGV2bV9pb3Jl
bWFwKCZwZGV2LT5kZXYsIHJlcy0+c3RhcnQsDQo+ID4gKwkJCQkgICAgICAgcmVzb3VyY2Vfc2l6
ZShyZXMpKTsNCj4gPiArCWlmICghYWRhdGEtPmFjcF9iYXNlKQ0KPiA+ICsJCXJldHVybiAtRU5P
TUVNOw0KPiA+ICsNCj4gPiArCWFkYXRhLT5jYXB0dXJlX3N0cmVhbSA9IE5VTEw7DQo+ID4gKw0K
PiA+ICsJZGV2X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYsIGFkYXRhKTsNCj4gPiArCXN0YXR1cyA9
IGRldm1fc25kX3NvY19yZWdpc3Rlcl9jb21wb25lbnQoJnBkZXYtPmRldiwNCj4gPiArCQkJCQkJ
ICZhY3BfcGRtX2NvbXBvbmVudCwNCj4gPiArCQkJCQkJICZhY3BfcGRtX2RhaV9kcml2ZXIsIDEp
Ow0KPiA+ICsJaWYgKHN0YXR1cykgew0KPiA+ICsJCWRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWwg
dG8gcmVnaXN0ZXIgYWNwIHBkbSBkYWlcbiIpOw0KPiA+ICsNCj4gPiArCQlyZXR1cm4gLUVOT0RF
VjsNCj4gDQo+IHJldHVybiBzdGF0dXM7DQo+IA0KPiA+ICsJfQ0KPiA+ICsJcmV0dXJuIDA7DQo+
ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgYWNwX3BkbV9hdWRpb19yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiArew0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30N
Cj4gDQo+IG5vdCBuZWVkZWQ/DQoNCkl0IGdldHMgZmlsbGVkIGluIGZ1dHVyZSBwYXRjaC4NCg0K
PiANCj4gPiArDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGFjcF9wZG1fZG1h
X2RyaXZlciA9IHsNCj4gPiArCS5wcm9iZSA9IGFjcF9wZG1fYXVkaW9fcHJvYmUsDQo+ID4gKwku
cmVtb3ZlID0gYWNwX3BkbV9hdWRpb19yZW1vdmUsDQo+ID4gKwkuZHJpdmVyID0gew0KPiA+ICsJ
CS5uYW1lID0gImFjcF9ybl9wZG1fZG1hIiwNCj4gPiArCX0sDQo+ID4gK307DQo+ID4gKw0KPiA+
ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVyKGFjcF9wZG1fZG1hX2RyaXZlcik7DQo=
