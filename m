Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A13923DC02
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 18:43:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 256001661;
	Thu,  6 Aug 2020 18:42:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 256001661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596732217;
	bh=yBNRaYdebOZPatFDnTdRZezksjjppy9sxjIqU3rrukM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sdeGKj5RWYWi8OmZaptUasCyvBXX1lYOZpztnddgIkpaftR8Eae9BubLY/9jt1Uk5
	 FrxTqgi4eHBdYbXqHk3zKzf4f1m2raYXoHCgXLjm5KVouUA3/LwxIugsZyznYUpAoO
	 Vadh8/t4NDULsMzXOh4RG3Bzi7pQecwuk+SJfYHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CD05F8015A;
	Thu,  6 Aug 2020 18:41:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7653F80159; Thu,  6 Aug 2020 18:41:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7871F80124
 for <alsa-devel@alsa-project.org>; Thu,  6 Aug 2020 18:41:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7871F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="NVr3jDzX"
IronPort-SDR: nbQWCuYNkvGfMogUFKq64wvnPYilGxQcQQ2EbxB+y7Qn1U4bCHRBRFhcZ+DmeJBFdcEEeg7oHD
 6urw0XEO8pFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="152819203"
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; d="scan'208";a="152819203"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2020 09:41:35 -0700
IronPort-SDR: GAJDbnXkDa7psZvnylCK7oMXGkpXam4dSXEvrD0A8r1wUuweOn7oVZcUFgd9UYPa4Lz3bAb5RD
 mqceOhtePsQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; d="scan'208";a="325441387"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2020 09:41:35 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 6 Aug 2020 09:41:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 6 Aug 2020 09:41:34 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 6 Aug 2020 09:41:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 6 Aug 2020 09:41:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImriYgzARA4S0+6SW9EA4eY/r5TyzQwwWjERbm2feRpOJAdIr2VpTgqumaWYzaF0AbJZzY0VoxU9pB9RCfK204r72N+9whOHCJk9/f3ndJY9Vr8Hr6tPSv/xy4URiGgAthDQgyPqVgkrFInh1QEQvc6YL9aYyWZtUzEgpPAWCXOoWsMxDaCn6WrtaE7fqhLeLvwQH5vhvvOlZncIJ5RI6sHaLZC5ad6hVwV71tHf38/526Ze+0XSgxXX6kIK/1MEJSvNMyiznd+36iNimeTQCmWTRYjqjJjrOOw+FUn36sLmvTNJuWt3mUIPror4F1ncquzsd4UdXaNtTTz/zsRZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBNRaYdebOZPatFDnTdRZezksjjppy9sxjIqU3rrukM=;
 b=hkZiebtxwUhFbgYmyKswH6iDhb2pmCBwSShljqubiRYUr+O8y9Fy4MsYNb0NILOKVSYm0T5TrHRwXli2w0NBIAW86gWSmY6QwB7rxGKqe2dvmpAkissB1iVjDpH5TfhnXDLAd3YyUItntaymTiFRxO5R8rtlSUSbqTuIkgsLw+pCoNwcFq7L2XFaaz+HlrkfbO6zmX2vRcGqhiMNnNXl0/MRaho354DyWRf0/ExB65R7ReOdofEpQ1BSyEtC32rX8ox6uK60v9BZM5vLJx6nnEvYlA1lvw8NhtjfPtDyxi5ZLwIdrRvK+x5oOCpiQKJN36v3QFmoksA/Y0JaxNzvDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBNRaYdebOZPatFDnTdRZezksjjppy9sxjIqU3rrukM=;
 b=NVr3jDzX5eP+T0OPvNadOnGnlg6gDQgASjPTzG6GA/tmpYUaAlZpRP0kOOJqZl495zA7vDW6nayqF3/a1Wihb8N7lUGCqTrX0SaaIYzWNHqd8UE04Z4wfDLgd6E9+0FmFy8URAYd9PK3pKJ0wwfp/YoEI/OXqLBsC3wyWqzlK7w=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM5PR11MB0044.namprd11.prod.outlook.com (2603:10b6:4:64::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Thu, 6 Aug
 2020 16:41:28 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41%5]) with mapi id 15.20.3239.022; Thu, 6 Aug 2020
 16:41:28 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Takashi Iwai
 <tiwai@suse.de>
Subject: RE: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Topic: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Index: AQHWZzZzIgMFwAI7HkKT1/DPVspAl6khsDgAgAFDasCAAAm3gIADX8DAgAAlz4CAABcIUIAABbiAgACx9iCAALX6gIADSeRA
Date: Thu, 6 Aug 2020 16:41:28 +0000
Message-ID: <DM6PR11MB364259049769F6EF3B84AABD97480@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <1596020585-11517-1-git-send-email-brent.lu@intel.com>
 <1596198365-10105-1-git-send-email-brent.lu@intel.com>
 <1596198365-10105-3-git-send-email-brent.lu@intel.com>
 <s5h5za3ajvb.wl-tiwai@suse.de>
 <DM6PR11MB3642AE90DF98956CCEDE6C2F974F0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <s5hd04a90o4.wl-tiwai@suse.de>
 <DM6PR11MB3642B5BC2E1E0708088526D8974D0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <63bca214-3434-16c6-1b60-adf323aec554@linux.intel.com>
 <DM6PR11MB3642D9BE1E5DAAB8B78B84B0974D0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <s5hpn873by6.wl-tiwai@suse.de>
 <DM6PR11MB36423A9D28134811AD5A911F974A0@DM6PR11MB3642.namprd11.prod.outlook.com>
 <6466847a-8aae-24f7-d727-36ba75e95f98@linux.intel.com>
In-Reply-To: <6466847a-8aae-24f7-d727-36ba75e95f98@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [114.36.92.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e59278e5-c1aa-4476-1622-08d83a279148
x-ms-traffictypediagnostic: DM5PR11MB0044:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB0044481720407480655A565F97480@DM5PR11MB0044.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H5yaxC4riSiGOK79R3+9ZcyeCD4PvpsgO8b0rTMWiTLnRouTkMDjK1G0OxBYvr4tLPfTiP+5KR/bSH4JUsaCzsOWgeSZO2pixLqk5ufTmVce5HECXVwlaQTLmAUWXY5io+wbdt+CwR0Jfoid3MBJe+SbnePXGoM1pzA2wGUHVn08HYtOeNsmtBptrQXjznoJyFB/Sy1O5in1q5ID3+nRs0jz2swiQj+UcSqIMCc5WgluGs8zfIV4zPNrdDQcx52cpvfTMrlDXmu6YDx3txtsxnMTsaGXsWI8iurePvPwj6PvODHqZ/Wl1MsxXbQr8D3K7j76Y06PjzUu/7SvHrh3IjmoDeLDNrUJKiPvClc+tI/ho48d0UIfCWUZ3OLGsFW+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(26005)(186003)(6506007)(86362001)(2906002)(52536014)(5660300002)(7416002)(76116006)(54906003)(110136005)(8676002)(316002)(8936002)(55016002)(33656002)(64756008)(66556008)(66476007)(66946007)(66446008)(4326008)(7696005)(9686003)(71200400001)(83380400001)(478600001)(11716003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 8TMLMdksh0jtDJVNU4PlcauhIa2QNo8QO1Y15nVTFosh1Y+uT5oGAi1Ak4h0jMkhE2GOvr2hzoe2fj1uwJnrwnWifCHAnMdOYf+XQaWe7aRaTScq/2/sRpb33cRYks3rXR+u1n2t3mNV71S/JbI77DRnSG8YRDdqFWNWQQWEUP/pHGal01TFubDqUiv7c5I9MVDyEf70qDE+8AwsxeuQY2xNpDHKStp2Nq3bMcjIAOV8PT3D+QJq6wSlddzS/RBL3ELn/3+N9mwbNWzQOoaAOLb287h3oTawLLtaOb/CAMYfODD580XdUEuTFn1b6rfXZx+bEfvrdcDSTqCSmQxR0oSKj+iZyEgQuwV72aXjXn2gNeKWSxW4J1/em8vmEXEbDjeZYApB6JZqpPMVPSeu3zLUbuRPfHlAd/bWKc3l8VyPGz9KhkwP9NsulVeN1U4Lj9qPkx35QEbAfuFwx679QizLMbwtU59QXhf5Mq/AcZtyM/68CHonRxMfLjDBQ0070lyeWCL0sONcEKW0TBNOdWFeI0YWSHr0rCoOkOmKWyLSunbclJ3VlLxa29lYRej/jKOjlYgEOdbJdCPtmiHVB4wqmcGPgqa+8AZYjFMFYQdwZnzJLja/MWPPIFoBPOVu2SZccivy0+xh7pz70YUnzA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e59278e5-c1aa-4476-1622-08d83a279148
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2020 16:41:28.7881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XBH4LLHM86mvjwGSYiNX8gEF7mCQTHQGgF7/QfCLNWxBiMB+EGZKoCpGwaiosrMBDYzZ+hH/AbbbowHqDVe3hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0044
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yuhsuan@google.com" <yuhsuan@google.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Damian van Soelen <dj.vsoelen@gmail.com>
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

PiANCj4gSSBkb24ndCBnZXQgdGhpcy4gSWYgdGhlIHBsYXRmb3JtIGRyaXZlciBhbHJlYWR5IHN0
YXRlZCAyNDAgYW5kIDk2MCBzYW1wbGVzIHdoeQ0KPiB3b3VsZCA0MzIgYmUgY2hvc2VuPyBEb2Vz
bid0IHRoaXMgbWVhbiB0aGUgY29uc3RyYWludCBpcyBub3QgYXBwbGllZD8NCg0KSGkgUGllcnJl
LA0KDQpTb3JyeSBmb3IgbGF0ZSByZXBseS4gSSB1c2VkIGZvbGxvd2luZyBjb25zdHJhaW50cyBp
biBWMyBwYXRjaCBzbyBhbnkgcGVyaW9kIHdoaWNoDQphbGlnbnMgMW1zIHdvdWxkIGJlIGFjY2Vw
dGVkLg0KDQorCS8qDQorCSAqIE1ha2Ugc3VyZSB0aGUgcGVyaW9kIHRvIGJlIG11bHRpcGxlIG9m
IDFtcyB0byBhbGlnbiB0aGUNCisJICogZGVzaWduIG9mIGZpcm13YXJlLiBBcHBseSBzYW1lIHJ1
bGUgdG8gYnVmZmVyIHNpemUgdG8gbWFrZQ0KKwkgKiBzdXJlIGFsc2EgY291bGQgYWx3YXlzIGZp
bmQgYSB2YWx1ZSBmb3IgcGVyaW9kIHNpemUNCisJICogcmVnYXJkbGVzcyB0aGUgYnVmZmVyIHNp
emUgZ2l2ZW4gYnkgdXNlciBzcGFjZS4NCisJICovDQorCXNuZF9wY21faHdfY29uc3RyYWludF9z
dGVwKHN1YnN0cmVhbS0+cnVudGltZSwgMCwNCisJCQkgICBTTkRSVl9QQ01fSFdfUEFSQU1fUEVS
SU9EX1NJWkUsIDQ4KTsNCisJc25kX3BjbV9od19jb25zdHJhaW50X3N0ZXAoc3Vic3RyZWFtLT5y
dW50aW1lLCAwLA0KKwkJCSAgIFNORFJWX1BDTV9IV19QQVJBTV9CVUZGRVJfU0laRSwgNDgpOw0K
DQpSZWdhcmRzLA0KQnJlbnQNCg0KPiANCj4gPiBbICAgNTIuMDExMTQ2XSBzb3VuZCBwY21DMUQw
cDogaHdfcGFyYW0NCj4gPiBbICAgNTIuMDExMTUyXSBzb3VuZCBwY21DMUQwcDogICBBQ0NFU1Mg
MHgxDQo+ID4gWyAgIDUyLjAxMTE1NV0gc291bmQgcGNtQzFEMHA6ICAgRk9STUFUIDB4NA0KPiA+
IFsgICA1Mi4wMTExNThdIHNvdW5kIHBjbUMxRDBwOiAgIFNVQkZPUk1BVCAweDENCj4gPiBbICAg
NTIuMDExMTYxXSBzb3VuZCBwY21DMUQwcDogICBTQU1QTEVfQklUUyBbMTY6MTZdDQo+ID4gWyAg
IDUyLjAxMTE2NF0gc291bmQgcGNtQzFEMHA6ICAgRlJBTUVfQklUUyBbMzI6MzJdDQo+ID4gWyAg
IDUyLjAxMTE2N10gc291bmQgcGNtQzFEMHA6ICAgQ0hBTk5FTFMgWzI6Ml0NCj4gPiBbICAgNTIu
MDExMTcwXSBzb3VuZCBwY21DMUQwcDogICBSQVRFIFs0ODAwMDo0ODAwMF0NCj4gPiBbICAgNTIu
MDExMTczXSBzb3VuZCBwY21DMUQwcDogICBQRVJJT0RfVElNRSBbOTAwMDo5MDAwXQ0KPiA+IFsg
ICA1Mi4wMTExNzZdIHNvdW5kIHBjbUMxRDBwOiAgIFBFUklPRF9TSVpFIFs0MzI6NDMyXQ0KPiA+
IFsgICA1Mi4wMTExNzldIHNvdW5kIHBjbUMxRDBwOiAgIFBFUklPRF9CWVRFUyBbMTcyODoxNzI4
XQ0KPiA+IFsgICA1Mi4wMTExODJdIHNvdW5kIHBjbUMxRDBwOiAgIFBFUklPRFMgWzQ3NDo0NzRd
DQo+ID4gWyAgIDUyLjAxMTE4NV0gc291bmQgcGNtQzFEMHA6ICAgQlVGRkVSX1RJTUUgWzQyNjYw
MDA6NDI2NjAwMF0NCj4gPiBbICAgNTIuMDExMTg4XSBzb3VuZCBwY21DMUQwcDogICBCVUZGRVJf
U0laRSBbMjA0NzY4OjIwNDc2OF0NCj4gPiBbICAgNTIuMDExMTkxXSBzb3VuZCBwY21DMUQwcDog
ICBCVUZGRVJfQllURVMgWzgxOTA3Mjo4MTkwNzJdDQo+ID4gWyAgIDUyLjAxMTE5NF0gc291bmQg
cGNtQzFEMHA6ICAgVElDS19USU1FIFswOjBdDQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+IEJyZW50
DQo+ID4NCj4gPj4NCj4gPj4NCj4gPj4gVGFrYXNoaQ0KPiA+DQo+ID4NCg==
