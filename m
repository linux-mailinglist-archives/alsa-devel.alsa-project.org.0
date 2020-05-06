Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBE51C778F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 19:14:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F4B6178F;
	Wed,  6 May 2020 19:13:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F4B6178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588785283;
	bh=2PEp/XpqguUIIynE5rO78ISU74c8g0sL+uh/UF86ifQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eHs3qMBFDtYrqKtoAlzU5tLBcj8JfgBZm1ZDHrVj2YMaSEz8UUIjopkzbIjtJuxL7
	 ewdZSC8bIpzO+dPVWvVDBj756A6AsG1Ezx3dvLgVSiUEBHsoWdfXgmBI9nkthtozqo
	 aCUWGjlXbPc+lucUH09YKRIyzM/Z7JE3g6uPh/0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 410EAF800DE;
	Wed,  6 May 2020 19:13:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD9CEF80249; Wed,  6 May 2020 19:12:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD67BF800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 19:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD67BF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="oY3VV8FU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OlkrC3aPP3qPpH/JKnGaZcOy/sOypVfLR22bOOVPsdfKVNXqXqnzetF2BVFQHPP+/mNd2o7cZzYHzC9x7orQnw1aRDtJWLllIiHW4oYsEYGiv+J2IbAYISBK82N14DabyoklE0gJcnAya6ItOdeXeUzLiFwONxVc6d1z+/Lkc9PW1FvAc2tS7HH1AfSX7afG4eLf45ZlJOKqOT+ERpL/rHlBOe4Dn+ljBFC6niwLPBR81AGFMfmTmgurPWxfGqurtiV8RkmkMxmxkF4FQZkZLo2D1Bm2RMDuZB9nUemydh/puX3PwBjBPCx11rcSRrZAqFdmhnWtw28g2ERbwi6Kvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PEp/XpqguUIIynE5rO78ISU74c8g0sL+uh/UF86ifQ=;
 b=nu3vN+Q9bmZ/HcvlmO+ffsHxSdEQc4awuw2/XHU1X6478COR9lpPk/SDbhUlIx7ntyDyb/6v5bmVV3/3GiHEMVrK3OhrTbLKwN9T+vC5W/PmpyDyTC3zPZaU3P3l4Acj5VwbH9SisvT75/VQDuki3r64/rAXLqCfSMB6wsJoreJ1QafG5zlZe0c9UmbwEXtv3ox9EE7JH1w9/S0HEwntxdE+4cc4x29ZZd567SRyVCQx1+CDilA+fFQL914/IvPAND4vgNP6tzNzi8rrk4z3mjfdeuYaIrFRXoI/su7FRPtWGQFTzmOot1pMBwazff21ggno7i9UZdigC0dugxu7XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PEp/XpqguUIIynE5rO78ISU74c8g0sL+uh/UF86ifQ=;
 b=oY3VV8FUa0cvb5s72DeK5b65MzsYTzDtm+jZ3Md3c90eFkGgALqsjOth5wEdNToiKlIBWI4WuCq2Oilzhd1SOEJr0ND0UC2M0Q/1MFamtfFM84HpCiwC9fkdK866ltezimbbV1mazedezd2frXhwlCxVpPZQM7B+06mVmgxjk6Y=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB3532.namprd12.prod.outlook.com (2603:10b6:5:182::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.28; Wed, 6 May 2020 17:12:41 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.2958.029; Wed, 6 May 2020
 17:12:41 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Alex Deucher
 <alexdeucher@gmail.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "broonie@kernel.org" <broonie@kernel.org>,
 "tiwai@suse.de" <tiwai@suse.de>
Subject: RE: [PATCH 08/14] ASoC: amd: add ACP PDM DMA driver dai ops
Thread-Topic: [PATCH 08/14] ASoC: amd: add ACP PDM DMA driver dai ops
Thread-Index: AQHWIx9H9i4/61ZpXEWjKn9ypakK/KiaCXwAgAE1BRA=
Date: Wed, 6 May 2020 17:12:41 +0000
Message-ID: <DM6PR12MB2633F1A2705ABC0889B683BB97A40@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-9-alexander.deucher@amd.com>
 <703519fb-de83-103e-63fc-7a6c61f7c720@linux.intel.com>
In-Reply-To: <703519fb-de83-103e-63fc-7a6c61f7c720@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-05-06T17:12:03Z; 
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=65a94b4c-a3a2-491d-a1f1-0000bb891939;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_enabled: true
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_setdate: 2020-05-06T17:12:38Z
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_method: Privileged
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_name: Non-Business
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_actionid: 738283cb-7f11-4f87-a5c2-000035b8ba3c
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_contentbits: 0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 27c29747-ab58-42ad-1435-08d7f1e0af90
x-ms-traffictypediagnostic: DM6PR12MB3532:|DM6PR12MB3532:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB35322F14234542F5873C077297A40@DM6PR12MB3532.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DBE0nMkrerH5wwDfPgp9b+Gh+HurRI75Qx3IKJA+c+cGvCYmmGMAHUKA0MxZG5+jp5L7yA9Ez5/8P5s51e3JwYBDCSAY58TkQ7t5aYomqlqdLq1gFMWDT0Qa/EJhXvAslVpkzOD9j/DrTyqtvsBTYU1X/7rNjEAlWfCU+wkC6222X82/+Yq6TyFDYNPtmVsBYyZqviusmZXP+1wbLjXVhK2Q12GFgtd+9gF3mJvTzRt+ElQcsDjAoJnfknRlLvamHvMHPO5uBbMpIpTTO0ny9RAOCsZd5miE1bP8ah/Ker1160INhe5BN0eFEs+lR4ekmcEnpIPiXvPrhAHjdxBriH4Q3D9OKqCxPeHNG2+CKSWzgRUMqbCFyZvSZNtkJDkOQN3BqAH5TNTFOfeMbkuUse06knzv2om17jUjfQY8mr2zu50HXVfBCXEkgJRi8KceB8GfuFBc+liqmFqJGEcAbk6yJyYSMsuGMPFlXv3GuRs3V4Vs4o5qGRbBqWNBiWeoL8Bl5rY5Eg1SqjgShS3uGA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(33430700001)(66556008)(64756008)(66476007)(66446008)(66946007)(8676002)(186003)(52536014)(6506007)(86362001)(71200400001)(7696005)(33656002)(53546011)(26005)(5660300002)(9686003)(478600001)(55016002)(110136005)(4326008)(33440700001)(316002)(76116006)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: YXQf/g2EuZDUwKzjcZHO/AOg5Qx0kLXH3pmHiguEN5pWC21dw/7Db1gunuvGx+82T/vCtCeE6KCw6wOdi/nlzNB05p7+Cs5Df6f8OZO1XrDIKd3SgRilT1vnHf3udDI01WeAHcefX83zG/v3bLscARSYuUF6UhrF+IoQrLHunewO3jrHZmjWi61cxWOad1V5rZiZRGoMxh14gu8Zb60AHqC7VQpHs7pfB2/yE5/Qble+6MNif8jG5t0rvVz1xgEt6/Ijak0z9e2Y6Z/KUxbCzKsug1u8uPdMTHAWtv+/Gxlmdc4txadbcbueBPZ9coFgG0dK0isHCzbAMDE9FWbgFiJPwvqB08LWPGRWc0/FaGWCHHWZt2EQfPO3RG+zUkmbnt1X636IHLDbmVoccocxCKTJQjl8hyXfnzobC0wc9KYcvZjnKL4dMlepxR2+4F8NUraMTiodp8g+C6WrOGEQetgkJrYpNdy5QuMeTU2RocQ9FJ/wX5gJ52gLz5VDxam1JHagU74r9QRHwDDFxD6OeKMmWhajPMD9EgDYmXxbeAXyYfqye9U7NLdYLniVs7V1S7wiKkKWT2q/Wbj/dJXrzOwsEbryLsLtUFrqOKSyY+T2Kw4VpOiNSBxpeZXcggM20k9J+9FVIF2xJ1XhfvcmWpKXX7rgNUUCBqwWLHsqc4i816J4tmzPtnQYwkyNRuLMgI1YN6K13blWtE8bhs3WjXvUEl/iJk1bDhijvlIg5kINOtw+i1zt+o+HSxFF/oJ9a24/sG+AEaEtHnwgxRis/Hn3YQWDRitx1fIPjUR74Ti/HxZuXdcm5H+8G0nz7z4w
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c29747-ab58-42ad-1435-08d7f1e0af90
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 17:12:41.4519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X0AoYVYndZwA4K6LCvSU2qddvmoqQ2G3MugImVaA57+NjswgKzpbNhojSfLIAbM+SeFM6JlZ5ZmR/uiTfnk1tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3532
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
bmVzZGF5LCBNYXkgNiwgMjAyMCAzOjI1IEFNDQo+IFRvOiBBbGV4IERldWNoZXIgPGFsZXhkZXVj
aGVyQGdtYWlsLmNvbT47IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsNCj4gYnJvb25pZUBr
ZXJuZWwub3JnOyBNdWt1bmRhLCBWaWplbmRhciA8VmlqZW5kYXIuTXVrdW5kYUBhbWQuY29tPjsN
Cj4gdGl3YWlAc3VzZS5kZQ0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1
Y2hlckBhbWQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDA4LzE0XSBBU29DOiBhbWQ6IGFk
ZCBBQ1AgUERNIERNQSBkcml2ZXIgZGFpIG9wcw0KPiANCj4gDQo+IA0KPiA+ICtzdGF0aWMgaW50
IHN0YXJ0X3BkbV9kbWEodm9pZCBfX2lvbWVtICphY3BfYmFzZSkNCj4gPiArew0KPiA+ICsJdTMy
IHBkbV9lbmFibGU7DQo+ID4gKwl1MzIgcGRtX2RtYV9lbmFibGU7DQo+ID4gKwlpbnQgdGltZW91
dDsNCj4gPiArDQo+ID4gKwlwZG1fZW5hYmxlID0gMHgwMTsNCj4gPiArCXBkbV9kbWFfZW5hYmxl
ICA9IDB4MDE7DQo+ID4gKw0KPiA+ICsJZW5hYmxlX3BkbV9jbG9jayhhY3BfYmFzZSk7DQo+ID4g
Kwlybl93cml0ZWwocGRtX2VuYWJsZSwgYWNwX2Jhc2UgKyBBQ1BfV09WX1BETV9FTkFCTEUpOw0K
PiA+ICsJcm5fd3JpdGVsKHBkbV9kbWFfZW5hYmxlLCBhY3BfYmFzZSArDQo+IEFDUF9XT1ZfUERN
X0RNQV9FTkFCTEUpOw0KPiA+ICsJcGRtX2RtYV9lbmFibGUgPSAweDAwOw0KPiA+ICsJdGltZW91
dCA9IDA7DQo+ID4gKwl3aGlsZSAoKyt0aW1lb3V0IDwgMjAwMDApIHsNCj4gPiArCQlwZG1fZG1h
X2VuYWJsZSA9IHJuX3JlYWRsKGFjcF9iYXNlICsNCj4gQUNQX1dPVl9QRE1fRE1BX0VOQUJMRSk7
DQo+ID4gKwkJaWYgKChwZG1fZG1hX2VuYWJsZSAmIDB4MDIpID09DQo+IEFDUF9QRE1fRE1BX0VO
X1NUQVRVUykNCj4gPiArCQkJcmV0dXJuIDA7DQo+ID4gKwkJdWRlbGF5KDUpOw0KPiA+ICsJfQ0K
PiANCj4gbWF5YmUgdXNlIGh1bWFuLXJlYWRhYmxlIGRlZmluZXMgZm9yIHRpbWVvdXQgYW5kIGRl
bGF5Pw0KPiBlLmcuDQo+IA0KPiAjZGVmaW5lIFRJTUVPVVRfTVMgMTAwDQo+ICNkZWZpbmUgREVM
QVlfVVMgNQ0KDQpXaWxsIGZpeCBpdC4NCj4gDQo+ID4gKwlyZXR1cm4gLUVUSU1FRE9VVDsNCj4g
PiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBzdG9wX3BkbV9kbWEodm9pZCBfX2lvbWVtICph
Y3BfYmFzZSkNCj4gPiArew0KPiA+ICsJdTMyIHBkbV9lbmFibGUsIHBkbV9kbWFfZW5hYmxlLCBw
ZG1fZmlmb19mbHVzaDsNCj4gPiArCWludCB0aW1lb3V0Ow0KPiA+ICsNCj4gPiArCXBkbV9lbmFi
bGUgPSAweDAwOw0KPiA+ICsJcGRtX2RtYV9lbmFibGUgID0gMHgwMDsNCj4gPiArCXBkbV9maWZv
X2ZsdXNoID0gMHgwMDsNCj4gPiArDQo+ID4gKwlwZG1fZW5hYmxlID0gcm5fcmVhZGwoYWNwX2Jh
c2UgKyBBQ1BfV09WX1BETV9FTkFCTEUpOw0KPiA+ICsJcGRtX2RtYV9lbmFibGUgPSBybl9yZWFk
bChhY3BfYmFzZSArDQo+IEFDUF9XT1ZfUERNX0RNQV9FTkFCTEUpOw0KPiA+ICsJaWYgKHBkbV9k
bWFfZW5hYmxlICYgMHgwMSkgew0KPiA+ICsJCXBkbV9kbWFfZW5hYmxlID0gMHgwMjsNCj4gPiAr
CQlybl93cml0ZWwocGRtX2RtYV9lbmFibGUsIGFjcF9iYXNlICsNCj4gQUNQX1dPVl9QRE1fRE1B
X0VOQUJMRSk7DQo+ID4gKwkJcGRtX2RtYV9lbmFibGUgPSAweDAwOw0KPiA+ICsJCXRpbWVvdXQg
PSAwOw0KPiA+ICsJCXdoaWxlICgrK3RpbWVvdXQgPCAyMDAwMCkgew0KPiA+ICsJCQlwZG1fZG1h
X2VuYWJsZSA9IHJuX3JlYWRsKGFjcF9iYXNlICsNCj4gPiArDQo+IEFDUF9XT1ZfUERNX0RNQV9F
TkFCTEUpOw0KPiA+ICsJCQlpZiAoKHBkbV9kbWFfZW5hYmxlICYgMHgwMikgPT0gMHgwMCkNCj4g
PiArCQkJCXJldHVybiAwOw0KPiA+ICsJCQl1ZGVsYXkoNSk7DQo+ID4gKwkJfQ0KPiA+ICsJCWlm
ICh0aW1lb3V0ID09IDIwMDAwKQ0KPiANCj4gaWYgdGhpcyB0ZXN0IG5lZWRlZCwgaXQnbGwgYmUg
YWx3YXlzIHRydWUsIG5vPw0KDQpTb3JyeSBpdHMgbXkgYmFkLiBJdCBzaG91bGRuJ3QgcmV0dXJu
IDAgd2hlbiBBQ1AgRE1BIHRyYW5zZmVyIGlzIHN0b3BwZWQuDQpJdCBzaG91bGQgYnJlYWsgdGhl
IHdoaWxlIGxvb3AgdGhlbiBpdCBzaG91bGQgY29udGludWUgdG8gZG8gcmVnaXN0ZXIgcHJvZ3Jh
bW1pbmcgZm9yIHN0b3BwaW5nIHRoZSBQRE0gZGVjb2RlciBhbmQgZmx1c2hpbmcgdGhlIEZJRk8u
Lg0KdGltZW91dCBjaGVjayBvbmx5IHRvIHZlcmlmeSB3aGV0aGVyIGlzIHRoZXJlIGFueSB0aW1l
b3V0IG9jY3VycmVkIGZvciBzdG9wcGluZyB0aGUgUERNIERNQSB0cmFuc2ZlciBvciBub3QuDQoN
CldpbGwgbW9kaWZ5IHRoZSBsb2dpYyBhbmQgIHNoYXJlIHRoZSB1cGRhdGVkIHBhdGNoLg0KPiAN
Cj4gPiArCQkJcmV0dXJuIC1FVElNRURPVVQ7DQo+ID4gKwl9DQo+ID4gKwlpZiAocGRtX2VuYWJs
ZSA9PSBBQ1BfUERNX0VOQUJMRSkgew0KPiA+ICsJCXBkbV9lbmFibGUgPSBBQ1BfUERNX0RJU0FC
TEU7DQo+ID4gKwkJcm5fd3JpdGVsKHBkbV9lbmFibGUsIGFjcF9iYXNlICsgQUNQX1dPVl9QRE1f
RU5BQkxFKTsNCj4gPiArCX0NCj4gPiArCXJuX3dyaXRlbCgweDAxLCBhY3BfYmFzZSArIEFDUF9X
T1ZfUERNX0ZJRk9fRkxVU0gpOw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+IA0K
PiA+ICtzdGF0aWMgaW50IGFjcF9wZG1fZGFpX2h3X3BhcmFtcyhzdHJ1Y3Qgc25kX3BjbV9zdWJz
dHJlYW0gKnN1YnN0cmVhbSwNCj4gPiArCQkJCSBzdHJ1Y3Qgc25kX3BjbV9od19wYXJhbXMgKnBh
cmFtcywNCj4gPiArCQkJCSBzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSkNCj4gPiArew0KPiA+ICsJ
c3RydWN0IHBkbV9zdHJlYW1faW5zdGFuY2UgKnJ0ZDsNCj4gPiArCXVuc2lnbmVkIGludCBjaF9t
YXNrOw0KPiA+ICsNCj4gPiArCXJ0ZCA9IHN1YnN0cmVhbS0+cnVudGltZS0+cHJpdmF0ZV9kYXRh
Ow0KPiA+ICsJc3dpdGNoIChwYXJhbXNfY2hhbm5lbHMocGFyYW1zKSkgew0KPiA+ICsJY2FzZSBU
V09fQ0g6DQo+ID4gKwlkZWZhdWx0Og0KPiA+ICsJCWNoX21hc2sgPSAweDAwOw0KPiA+ICsJCWJy
ZWFrOw0KPiA+ICsJfQ0KPiANCj4gdGhlIHN3aXRjaCBkb2Vzbid0IGFwcGVhciB2ZXJ5IHVzZWZ1
bCBhdCB0aGUgbW9tZW50Pw0KDQpXZSBrZXB0IGl0IGZvciBmdXR1cmUgcmVmZXJlbmNlIHRvIGV4
dGVuZCBzdXBwb3J0IGZvciBtb3JlIHRoYW4gMiBjaGFubmVscy4NCj4gDQo+ID4gKwljb25maWdf
cGRtX3N0cmVhbV9wYXJhbXMoY2hfbWFzaywgcnRkLT5hY3BfYmFzZSk7DQo+ID4gKwlyZXR1cm4g
MDsNCj4gPiArfQ0KPiA+ICsNCg0K
