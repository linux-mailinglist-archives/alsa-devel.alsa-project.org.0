Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E61D2803FE
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 18:32:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27ACD1925;
	Thu,  1 Oct 2020 18:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27ACD1925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601569959;
	bh=pORInLlRBjEiYh9WV621lMOTEkho8qe3QqQL3ozb3Ps=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lx+bMN5vCcB0VAxbgzC3DbX6dhhXaozGORjgz85nFhxR9eLI4f80TvoX9zl+xXDdg
	 dCM8QH+78lODtvA1ek4jkF0bopN3LJzAbmXm+9GIssbwoNBvj39tGCYTq9mZf6zeHu
	 c0VcACqm9Ftt/lpGeK6yb/00+e+7SMjsEf79ApNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42AD8F8020C;
	Thu,  1 Oct 2020 18:30:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FFE7F801F5; Thu,  1 Oct 2020 18:30:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE, SPF_PASS, URIBL_BLOCKED, URIBL_SBL,
 URIBL_SBL_A autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93CE1F80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 18:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93CE1F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="hmLXzUwF"
IronPort-SDR: O8Zm25GeeUxrJrEr8Yh4TQRDqMs6qthrmHkf7fCBvzZqI7NOtYDWMNQ+CPCeG7Us9vG5NO1Fq1
 +QUr7j+lB0nQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="150567257"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="150567257"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 09:30:44 -0700
IronPort-SDR: Zuth21NW5zqh59ruLa451TTMngu1l/ygjfCSN2E6tpIQfRKqdDOu2vcsOxr1sLdi9usLbUQF6J
 RwbG6TWtvr4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="294493030"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga007.fm.intel.com with ESMTP; 01 Oct 2020 09:30:43 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 09:30:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Oct 2020 09:30:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 1 Oct 2020 09:30:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9T4NfNCN0nKQB6WUe122K3hHvxIJrZ1qvArMeuinAWCdFfCSx70CLj3je562Knp15+zMSbtWn2y+Nlrq24oBlgEA/5sZhrS0k6i67uH5qkv1iHMvopPwlhGefe4b0RovYGQ43SDIODLfE4EkTez1k/wrAd56JiaEcc+BYQmEHRWXGDzcec/KzCZ7fyL8jfVajvJr80qLZgG1k7n68pzU4jvOpk1IM3vZmhGEzm1QUxc5PcWrE0MseMWfcFakKZCrEzPZpcjR9mJ1VOTwpWW9KQDAMsJdVlvODW6QV52HSIHFd5qLGx22Ou+tWaz+SJVrm6sHUmNP++XvxLPy4nGuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pORInLlRBjEiYh9WV621lMOTEkho8qe3QqQL3ozb3Ps=;
 b=SB4rDfo0Q9/piu7y6s26vluev86UN1mcUqayjS1Ppbn3s5r4Uq7yvV2LLjbz3F+qGLpaL5auEjL1d4TX+rBE8RRD+DqKabxx04OHpxXLU0HHNLoseTloSHt2RxYu/Ht8q71nX8khokC68Yggi7WI38Ox5GaYjDP9bz/Uy83duU264U/VzuSb0pMXUOaEViMEu6K8NDWEOtG+qQu13ckw2p051UQm302FA6igYLK6KgOuJUS/QAUNYowLDyT4fRT8ZLPDxz4+KJb512dk9gLvNCLZaUfNzYUxZdjTQu2LORDW7He30vQWYGTq/0lHSEoj2yu3kp7nmsZf8u0n13uzZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pORInLlRBjEiYh9WV621lMOTEkho8qe3QqQL3ozb3Ps=;
 b=hmLXzUwFDc4UFK9Q+kBzWeKit1CqMYbbkVWRz3FVwBo2DMICxcucm0PAFEHrKPC/opKr61wqHVTIIWTJo8XtnEgdNrjvg+5wc/GyPvRhqZCdhxD4PJdaLIztIykoMh7YsAL0RH0Vefpn1S8yJ+JzujDX3oyS0CjaZqvnqyln1xA=
Received: from DM6PR11MB2841.namprd11.prod.outlook.com (2603:10b6:5:c8::32) by
 DM6PR11MB4170.namprd11.prod.outlook.com (2603:10b6:5:19a::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32; Thu, 1 Oct 2020 16:30:35 +0000
Received: from DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a]) by DM6PR11MB2841.namprd11.prod.outlook.com
 ([fe80::6d8e:9b06:ef72:2a%5]) with mapi id 15.20.3433.035; Thu, 1 Oct 2020
 16:30:35 +0000
From: "Ertman, David M" <david.m.ertman@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 1/6] Add ancillary bus support
Thread-Topic: [PATCH 1/6] Add ancillary bus support
Thread-Index: AQHWl3zIjC3xuGt7f0KMPPjPnuvtoamClbcAgABbIUA=
Date: Thu, 1 Oct 2020 16:30:35 +0000
Message-ID: <DM6PR11MB2841B742699AC2F1DCE6B947DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-2-david.m.ertman@intel.com>
 <20201001110226.GC1939744@kroah.com>
In-Reply-To: <20201001110226.GC1939744@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [50.38.47.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd9eded6-c1f3-4297-ad6a-08d86627532d
x-ms-traffictypediagnostic: DM6PR11MB4170:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4170BDC8796EDCF5429EF599DD300@DM6PR11MB4170.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hvogKq8CVALC3roqcDk2i4Rx3qh2YuJAf6B2UifOafDBdENI3NxPjRPBAhDazr2xjy9sw5rxyEhpJ21nNrNU7mjPI3O3KdR1Sg6EXaYm2VQdMJdIAfz9UBb2cTOZzh9+9k2lk6Gj+WG5BlfRWpD4ygm4Tyz4UJFcctG3SmxENIhzruZJhaeCfvmsGG7OCisOWbUdMNjWxRezRh1qLGsXKqaAPtXBqdQpXO+2+JBAdHj3W5vKCy1mR7u7wWDVvWiyNgdEmOz6fg/z2wU2kWQkifYfPeVxYD6YksuhvpnYWwcu+l1WXZn1jPJvFilFEhEHAYQkg4G0FjBFE0a/0mBNgA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2841.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(7416002)(33656002)(64756008)(66476007)(66556008)(2906002)(66946007)(76116006)(66446008)(86362001)(9686003)(26005)(71200400001)(186003)(8676002)(316002)(55016002)(6916009)(54906003)(53546011)(6506007)(83380400001)(8936002)(4326008)(7696005)(478600001)(52536014)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: l3E+tLWzjUrwE/qoe5jsMaRLh1dbwpXLB7M0Q1wdH+GxTHUnldKN+MIHU9WAMJJRogLzmpA6UjOTdHmI7y9pdmuY7x99oCS5nlPr6sKeplO41w8/wXdo23VRq04H0W0EUnBOdzPF1siUZ9ey7x9St8ehplZi7gwmKQZa1gdkR0lJFnFgncN9Fub0Q9Bh/xegbDA+Gm5XxnbB7FCP9bZq9zKnIKz/NTBORUNVEKnjXkFZx4iN48PSyDlK1rQOF9o1Wp2ELjumGQ6fK9IdS2BiZLCOlZXdWDzCzGydvNnoVQR6X6nCLQAQ/RJeMOteCexP6CrWzrupBNjzg6JggQZiiSf5D2t4pVHlP8MM7ZSahGeKtrp7iVkp/LcKUTIrp4lOU0temsCv2/LWy8oJCIZtOmikNdtmVW+e+i8nOOodP2OYHE47/YeJcGPWX+huTWA5BYJihJ1h9beoeYs6V0FeY9slDojpMubW65k3hSJqakGyXJ4bFZGynNyhzdpgh0tgijrvsDDrQg0mlCleStaRDxKigysQut4jIbltpiCqss9it60R8R6TfY6+aZRi5qQQLyGqY16zowFE/pKOpFuZ/PcxDjjqArYyq56fHHXxeIiECwRp841feTKSW+HUkvgyvSzh8a/SFOmhv5FQmdauSw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2841.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9eded6-c1f3-4297-ad6a-08d86627532d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 16:30:35.7725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oJ0bKz5JZeOkVUMWJv4ed+oR7O33eUV7J4Ta48oFylBowrNQTuYZADjMFIAdwv3LYik+m9nxqGP+F4L7tMBxHomTGsLTEZaoRvVfb1zRkyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4170
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Patil,
 Kiran" <kiran.patil@intel.com>, "tiwai@suse.de" <tiwai@suse.de>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "parav@nvidia.com" <parav@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Williams, Dan J" <dan.j.williams@intel.com>, "Saleem,
 Shiraz" <shiraz.saleem@intel.com>, Parav Pandit <parav@mellanox.com>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHcmVnIEtIIDxncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMSwgMjAyMCA0OjAy
IEFNDQo+IFRvOiBFcnRtYW4sIERhdmlkIE0gPGRhdmlkLm0uZXJ0bWFuQGludGVsLmNvbT4NCj4g
Q2M6IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgdGl3YWlAc3VzZS5kZTsgYnJvb25pZUBr
ZXJuZWwub3JnOyBwaWVycmUtDQo+IGxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tOyBTcmlk
aGFyYW4sIFJhbmphbmkNCj4gPHJhbmphbmkuc3JpZGhhcmFuQGludGVsLmNvbT47IGpnZ0Budmlk
aWEuY29tOyBwYXJhdkBudmlkaWEuY29tOyBQYXRpbCwNCj4gS2lyYW4gPGtpcmFuLnBhdGlsQGlu
dGVsLmNvbT47IFJhbmphbmkgU3JpZGhhcmFuDQo+IDxyYW5qYW5pLnNyaWRoYXJhbkBsaW51eC5p
bnRlbC5jb20+OyBGcmVkIE9oIDxmcmVkLm9oQGxpbnV4LmludGVsLmNvbT47DQo+IFNhbGVlbSwg
U2hpcmF6IDxzaGlyYXouc2FsZWVtQGludGVsLmNvbT47IFBhcmF2IFBhbmRpdA0KPiA8cGFyYXZA
bWVsbGFub3guY29tPjsgV2lsbGlhbXMsIERhbiBKIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS82XSBBZGQgYW5jaWxsYXJ5IGJ1cyBzdXBwb3J0DQo+
IA0KPiBPbiBXZWQsIFNlcCAzMCwgMjAyMCBhdCAwMzo1MDo0NlBNIC0wNzAwLCBEYXZlIEVydG1h
biB3cm90ZToNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvTWFrZWZpbGUgYi9kcml2ZXJz
L2J1cy9NYWtlZmlsZQ0KPiA+IGluZGV4IDM5N2UzNTM5MmJmZi4uMWZkMjM4MDk0NTQzIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvYnVzL01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9idXMv
TWFrZWZpbGUNCj4gPiBAQCAtMyw2ICszLDkgQEANCj4gPiAgIyBNYWtlZmlsZSBmb3IgdGhlIGJ1
cyBkcml2ZXJzLg0KPiA+ICAjDQo+ID4NCj4gPiArI0FuY2lsbGFyeSBidXMgZHJpdmVyDQo+IA0K
PiBOaXQsIHlvdSBuZWVkIGEgc3BhY2UgOikNCg0KRml4ZWQgZm9yIG5leHQgdmVyc2lvbiDwn5iK
DQoNCj4gDQo+ID4gK29iai0kKENPTkZJR19BTkNJTExBUllfQlVTKQkrPSBhbmNpbGxhcnkubw0K
PiANCj4gQW5kIHdoeSBub3QgcHV0IHRoaXMgaW4gZHJpdmVycy9iYXNlLz8gIFdoeSB3YXkgb3Zl
ciBoZXJlIGluDQo+IGRyaXZlcnMvYnVzPw0KDQpNeSBvbmx5IHJlYXNvbiB3YXMgdGhhdCB0aGlz
IGlzIGEgYnVzLCBhbmQgSSB3YWdlcmVkIHRoYXQgYnVzZXMgc2hvdWxkDQpnbyBpbnRvIHRoZSBi
dXMgc3ViZGlyZWN0b3J5LiDwn5iKDQoNCj4gDQo+IHRoYW5rcywNCj4gDQo+IGdyZWcgay1oDQoN
Ci1EYXZlRQ0K
