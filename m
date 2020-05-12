Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9811CFA5B
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 18:17:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E43FE16C2;
	Tue, 12 May 2020 18:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E43FE16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589300225;
	bh=pm2iqZAQfFIeyYZ6DQKEc3Tpn2J2wOmmOsHA4Okq1Oo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gVtgjts1ACJCeE2Vy/f3xBXdYzA4EQoA6Vssa9siKkvjYZM7Y0akrpha3pcEbb5ot
	 KBeOvJ+GQewcehG2EXBfpxa9Q46DqRYEyeRuy1ZyBllRDdgWin+BAbk9Kr8G+WQmk7
	 zJgplHT55UfDUSC/qNsuf3QScBnp5+nXsphSp8MA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6469F800B7;
	Tue, 12 May 2020 18:15:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B64FF8014C; Tue, 12 May 2020 18:15:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,PRX_BODY_30,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBAE1F800B7
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 18:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBAE1F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="xFtU9CFi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zygdi+u8n23a9YLm89FMOZWLbBXTgtMuAyxM3gYk+veB8a7JwalASZ1NiYTqXeUoZjJ//rRoUCEJjM3AgfhXhaK9uBrgPM3n3iP1DdI1LZ5Et/6teuyXNb3IYnMPw02fzixBsGni53YxkIGL0C/W9KZP/hnsf+3ylqi/0wGwlXl2smzhbP2C4DjTBg9jN8V8cWOJqmRjP6Sx1D0tddR9QAKz3l4TyTgHUj+Far3u38yPTXT1gmSCDy89jZ6Ehr2/LS8+CTifi/s4v16xT0K5pNDTAXTZcgG1Cq342guxFCNT4847VjCz/KVJOxoApU2ppMEY00eRYjXMYUVzIdQ11Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm2iqZAQfFIeyYZ6DQKEc3Tpn2J2wOmmOsHA4Okq1Oo=;
 b=cX7cSePc1/ogXCpcWV7Y9ZW0M/jjABItcnxTc4ZOk2KXznMtACc5Cwv032PyaxkVGwcmhCY5ASZAR/1JmdASuMxuMkbxigkWwWRHP/9iGL2uMynooeMIRhfNyfCOILD0NndB2SNRDvZeU9/qSu9x6220hT7BGT8sUHsWw85XJQOJtk3pU9gOr9JCQflB1j4nnyjk1P3+JQIfp2NPz06Wij95oFRR2DwG5t9bF+JHNfk42DmlxB/3zPHwoz+zOThNpEqlgt4/H2tevErl4JIQhIOAzz6EHN8PkYmKeXttzZXpKmepgWAMkszeOMEDWSDy9UduH+K3KzEw/q4r7bHNCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm2iqZAQfFIeyYZ6DQKEc3Tpn2J2wOmmOsHA4Okq1Oo=;
 b=xFtU9CFi7OzyTWTkXiECuVU7vQ6llmLUIuDeYDLu0fGao5rqrz7KqgxBa7R4BFdvlnNRI8jd7n/M4Ue8ZwoRm47H3IfOnSvxCLEa/pvnU18INkDEfvC8pAjkxNcY8oVU0T9S6y2AcK9xAyFhJmKpQVeAB2OZRUbWtL17Fe+sQSc=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB4009.namprd12.prod.outlook.com (2603:10b6:5:1cd::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.34; Tue, 12 May 2020 16:15:03 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 16:15:03 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Alex Deucher
 <alexdeucher@gmail.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "broonie@kernel.org" <broonie@kernel.org>,
 "tiwai@suse.de" <tiwai@suse.de>
Subject: RE: [PATCH v2 08/14] ASoC: amd: add ACP PDM DMA driver dai ops
Thread-Topic: [PATCH v2 08/14] ASoC: amd: add ACP PDM DMA driver dai ops
Thread-Index: AQHWJ9oDrYNJH33TTECw442GxzwT+6ijcsMAgAEpRNA=
Date: Tue, 12 May 2020 16:15:03 +0000
Message-ID: <DM6PR12MB26338B02D772799482F1A01997BE0@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200511212014.2359225-1-alexander.deucher@amd.com>
 <20200511212014.2359225-9-alexander.deucher@amd.com>
 <3c1a08a0-31e8-dc0c-a903-190861b7fa11@linux.intel.com>
In-Reply-To: <3c1a08a0-31e8-dc0c-a903-190861b7fa11@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-05-12T15:56:25Z; 
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=d6f2e871-520e-479e-9ed1-0000ee2a7a89;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_enabled: true
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_setdate: 2020-05-12T16:15:00Z
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_method: Privileged
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_name: Non-Business
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_actionid: 25e0592b-c5e6-42db-a99e-00006b5a6f92
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_contentbits: 0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [2401:4900:33af:22e0:290b:e37e:51cd:c5b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ea120726-31a7-4aca-d1e1-08d7f68fa0ef
x-ms-traffictypediagnostic: DM6PR12MB4009:|DM6PR12MB4009:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4009B7199A3961A1083D739997BE0@DM6PR12MB4009.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0401647B7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QJZW2bkHA+IEIfGCO0GafEGPadyWDTJnn2YnUvVjcPl64zKhsgue3kOaAOhjKO55WqOkr4A0db/iljEKmcAb/mdM6hfSu8b8xPpDQbhgVD8kMOuo9zXkeZjn3VyIxQaZ0cOtdWta8VgFUp5pFPyB80yXgVZgqo+NrZLS4Y+omX7d4tCuLXUivpual8ozczA8uaLxkyKAewA4xJ4sQc+aiiRH6otrYhqDPZ8Sb6ze4g0Ug+YMk1GL/L4I6XxFSSWUtIbHS3IXeJkzKo8wJPNgpyWEbajdIKGlBwI7nBdRlSlmbw1WExH+emwa3NtbzoDZpiBGFO51sCFDmh3qYgvTf+TzU8EhwmTgGTWEBLLauVkxcWCcVpwVWtLyDSGDFpjtoqGELJQqSVYY2KOHhK23evOPF8hSFwfpAmLfelEBYqf/hDQdGg2MfcWVFehL9hLQJX6jhwxiGwhNNVMsFdNT+EJGyH0tpo4AXVAdxJtVbbjonhbuXbhg2UgT9XYJW7Z8aV4lD4b0G7UU8AZd/kCGUA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(33430700001)(8936002)(4326008)(86362001)(66556008)(66946007)(66446008)(52536014)(76116006)(2906002)(66476007)(64756008)(478600001)(33440700001)(8676002)(9686003)(55016002)(186003)(71200400001)(110136005)(5660300002)(316002)(53546011)(33656002)(6506007)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 72HRsoqlpUL/ILeGZYJTDdEwvQNkZoCHPmcgBeAmpgFF7gLfTUxSl5nXhqNIcuq50gOsBTBCBhnVap4b7Ph2x9xdGsBY+thYOmwQuVdXCtD5JysSFphnbqjGehLA9PdUyKpWNHfJLXD1HhXKMJVrYd7lBTS0IWTKWFItd8EJpa9M3E7wFIZlUS14O5BrEpOF9hsYfw8XiqoCImZ2W0H4q7tb8M4+R8BVsDe9qriW67G97+jCEpe+SSKeMq/5C0UG3ULBZrhcI7VHHNWBF0fLCnF1FXi8mhZsuEu7XwoLw6hrb7gTz5UwklQpzq93wPa7XMfzzwczvcOVL0l0Ga2i2eFIsKPhxBSM1veKa0AkQe1ZRaZXIwOwz2q31jundFbwSKhJHh2JZFecmW55TY4fmCyrCO+TTMxbRyEYhCpP3cdKeWwLTgCy9oTPU8tSf8EzgmdkoB/t3skCvcTdThRB1QgWtQdAfJh1ARKyXWCj0Bx2TznP/xn1W3wV67j+1zGVzuwYbY2ano5CUmO6u7liVdArtEfKgAILrKM2XYCz++jnKXlRxlzS5TpsOYroYVXf
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea120726-31a7-4aca-d1e1-08d7f68fa0ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2020 16:15:03.6052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RxFmXXxT8doA9NOBArV1K+87CSJDQGgVzesa/HOGShIN3jw2tW6lVyvqeuVc/wDiLNIvp/DliV4D8LZiwIFL0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4009
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
c2RheSwgTWF5IDEyLCAyMDIwIDM6NDIgQU0NCj4gVG86IEFsZXggRGV1Y2hlciA8YWxleGRldWNo
ZXJAZ21haWwuY29tPjsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOw0KPiBicm9vbmllQGtl
cm5lbC5vcmc7IE11a3VuZGEsIFZpamVuZGFyIDxWaWplbmRhci5NdWt1bmRhQGFtZC5jb20+Ow0K
PiB0aXdhaUBzdXNlLmRlDQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVj
aGVyQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDgvMTRdIEFTb0M6IGFtZDog
YWRkIEFDUCBQRE0gRE1BIGRyaXZlciBkYWkgb3BzDQo+IA0KPiANCj4gDQo+IA0KPiA+ICtzdGF0
aWMgaW50IHN0YXJ0X3BkbV9kbWEodm9pZCBfX2lvbWVtICphY3BfYmFzZSkNCj4gPiArew0KPiA+
ICsJdTMyIHBkbV9lbmFibGU7DQo+ID4gKwl1MzIgcGRtX2RtYV9lbmFibGU7DQo+ID4gKwlpbnQg
dGltZW91dDsNCj4gPiArDQo+ID4gKwlwZG1fZW5hYmxlID0gMHgwMTsNCj4gPiArCXBkbV9kbWFf
ZW5hYmxlICA9IDB4MDE7DQo+ID4gKw0KPiA+ICsJZW5hYmxlX3BkbV9jbG9jayhhY3BfYmFzZSk7
DQo+ID4gKwlybl93cml0ZWwocGRtX2VuYWJsZSwgYWNwX2Jhc2UgKyBBQ1BfV09WX1BETV9FTkFC
TEUpOw0KPiA+ICsJcm5fd3JpdGVsKHBkbV9kbWFfZW5hYmxlLCBhY3BfYmFzZSArDQo+IEFDUF9X
T1ZfUERNX0RNQV9FTkFCTEUpOw0KPiA+ICsJcGRtX2RtYV9lbmFibGUgPSAweDAwOw0KPiA+ICsJ
dGltZW91dCA9IDA7DQo+ID4gKwl3aGlsZSAoKyt0aW1lb3V0IDwgQUNQX0NPVU5URVIpIHsNCj4g
PiArCQlwZG1fZG1hX2VuYWJsZSA9IHJuX3JlYWRsKGFjcF9iYXNlICsNCj4gQUNQX1dPVl9QRE1f
RE1BX0VOQUJMRSk7DQo+ID4gKwkJaWYgKChwZG1fZG1hX2VuYWJsZSAmIDB4MDIpID09DQo+IEFD
UF9QRE1fRE1BX0VOX1NUQVRVUykNCj4gPiArCQkJcmV0dXJuIDA7DQo+ID4gKwkJdWRlbGF5KERF
TEFZX1VTKTsNCj4gPiArCX0NCj4gPiArCXJldHVybiAtRVRJTUVET1VUOw0KPiA+ICt9DQo+ID4g
Kw0KPiA+ICtzdGF0aWMgaW50IHN0b3BfcGRtX2RtYSh2b2lkIF9faW9tZW0gKmFjcF9iYXNlKQ0K
PiA+ICt7DQo+ID4gKwl1MzIgcGRtX2VuYWJsZSwgcGRtX2RtYV9lbmFibGUsIHBkbV9maWZvX2Zs
dXNoOw0KPiA+ICsJaW50IHRpbWVvdXQ7DQo+ID4gKw0KPiA+ICsJcGRtX2VuYWJsZSA9IDB4MDA7
DQo+ID4gKwlwZG1fZG1hX2VuYWJsZSAgPSAweDAwOw0KPiA+ICsJcGRtX2ZpZm9fZmx1c2ggPSAw
eDAwOw0KPiA+ICsNCj4gPiArCXBkbV9lbmFibGUgPSBybl9yZWFkbChhY3BfYmFzZSArIEFDUF9X
T1ZfUERNX0VOQUJMRSk7DQo+ID4gKwlwZG1fZG1hX2VuYWJsZSA9IHJuX3JlYWRsKGFjcF9iYXNl
ICsNCj4gQUNQX1dPVl9QRE1fRE1BX0VOQUJMRSk7DQo+ID4gKwlpZiAocGRtX2RtYV9lbmFibGUg
JiAweDAxKSB7DQo+ID4gKwkJcGRtX2RtYV9lbmFibGUgPSAweDAyOw0KPiA+ICsJCXJuX3dyaXRl
bChwZG1fZG1hX2VuYWJsZSwgYWNwX2Jhc2UgKw0KPiBBQ1BfV09WX1BETV9ETUFfRU5BQkxFKTsN
Cj4gPiArCQlwZG1fZG1hX2VuYWJsZSA9IDB4MDA7DQo+ID4gKwkJdGltZW91dCA9IDA7DQo+ID4g
KwkJd2hpbGUgKCsrdGltZW91dCA8IEFDUF9DT1VOVEVSKSB7DQo+ID4gKwkJCXBkbV9kbWFfZW5h
YmxlID0gcm5fcmVhZGwoYWNwX2Jhc2UgKw0KPiA+ICsNCj4gQUNQX1dPVl9QRE1fRE1BX0VOQUJM
RSk7DQo+ID4gKwkJCWlmICgocGRtX2RtYV9lbmFibGUgJiAweDAyKSA9PSAweDAwKQ0KPiA+ICsJ
CQkJYnJlYWs7DQo+ID4gKwkJCXVkZWxheShERUxBWV9VUyk7DQo+ID4gKwkJfQ0KPiA+ICsJCWlm
ICh0aW1lb3V0ID09IEFDUF9DT1VOVEVSKQ0KPiANCj4gaWYgeW91IHJlYWNoIHRoaXMgcG9pbnQs
IHRpbWVvdXQgaXMgYnkgY29uc3RydWN0aW9uIGVxdWFsIHRvIEFDUF9DT1VOVEVSDQo+IHNvIHRo
aXMgdGVzdCBpcyB1c2VsZXNzDQoNCkhlcmUgd2UgYXJlIGNoZWNraW5nIGN1cnJlbnQgZG1hIHN0
YXR1cy4gDQpJZiBETUEgZW5hYmxlIHN0YXR1cyBiaXQgaXMgc2V0IHRvIHplcm8gLCBpdCB3aWxs
IGV4aXQgdGhlIHdoaWxlIGxvb3AuDQpJdCB3aWxsIGNvbnRpbnVlIHJlc3Qgb2YgdGhlIHJlZ2lz
dGVycyBwcm9ncmFtbWluZyB0byBkaXNhYmxlIFBETQ0KZGVjb2RlciBhbmQgZmx1c2hpbmcgZmlm
by4NCg0KV2hlbiAgdGhpcyBjb25kaXRpb24gImlmICgocGRtX2RtYV9lbmFibGUgJiAweDAyKSA9
PSAweDAwKSIgaXMgdHJ1ZSwNCiJ0aW1lb3V0IiBjb3VudGVyIHdvbid0IGJlIGV4aGF1c3RlZCBp
LmUgaXQgd29uJ3QgY3Jvc3MgQUNQX0NPVU5URVINCnZhbHVlLg0KDQpXZSBoYXZlIHRvIHJldHVy
biB0aW1lIG91dCBlcnJvciBvbmx5IHdoZW4gRE1BIGVuYWJsZSBzdGF0dXMgYml0IGlzIA0Kbm90
IGNsZWFyZWQgYW5kIHRpbWVvdXQgcmVhY2hlZCBtYXggdmFsdWUgaS5lIEFDUF9DT1VOVEVSLiBp
LmUgDQpUaGlzIGNoZWNrICIgaWYgKHRpbWVvdXQgPT0gQUNQX0NPVU5URVIpICIgcmVxdWlyZWQg
dG8ga25vdyB0aGUgd2hpbGUgDQpsb29wIGV4aXQgY29uZGl0aW9uLg0KDQo+IA0KPiBZb3UgY291
bGQgYWxzbyB1c2UgYSBoZWxwZXIgd2hlcmUgeW91IGNoZWNrIGlmIHRoZSB2YWx1ZSBpcw0KPiBB
Q1BfUERNX0RNQV9FTl9TVEFUVVMgb3IgemVybyBzbyB0aGF0IHlvdSBkb24ndCBjb3B5IHRoZSBz
YW1lIGxvZ2ljDQo+IHR3aWNlLg0KDQpJIGJlbGlldmUgaXQncyBvbmx5IGEgc2luZ2xlIHJlZ2lz
dGVyIGNoZWNrLCBzdGlsbCBpdHMgaG9sZCB0byBiZSBnb29kLg0KDQoNCg==
