Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3AF2D5565
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 09:26:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 860A711C;
	Thu, 10 Dec 2020 09:25:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 860A711C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607588782;
	bh=1+iZODhl463/CZ2bytxzpUMePGj7cqVTaCHpMZCfKqQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WCZhNZZH5kxPVsr6p+do2WYLGvZjGuIMbjZxzkV5GDletZhu4OGjYqzeKYmnw5Chr
	 fxmT1RGID6oK2DKXd5+vlAWULhre5YKUyD88wYkASt+wKQEebJX70Pkg1/p67h1v78
	 RMk1RKfnD2AWF5a40jav25BC9UwmGM1K0hUA2SYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF33DF8019D;
	Thu, 10 Dec 2020 09:24:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF931F8016E; Thu, 10 Dec 2020 09:24:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2CFAF800EF
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 09:24:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2CFAF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="xACCTkkb"
IronPort-SDR: klpM3lvElugvIF1TMqd4UxCJxOuqbVX2J6e66iMjdn5rWIlRyMI6mjS32tUb8dtr9iyuiNfrpx
 sOV2/12YEicw==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="161975823"
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="161975823"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 00:24:32 -0800
IronPort-SDR: +Vq1AWk9RdOweMfbH5xZCb3Q9Esfx9SjlfdvxVAnZ/D38ceDOr51mKAxDcsH3g55xaX5iS6E/s
 zeBubTN8LgeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="318885540"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 10 Dec 2020 00:24:32 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 10 Dec 2020 00:24:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 10 Dec 2020 00:24:31 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 10 Dec 2020 00:24:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hll8iNZrzm2Rxiz1Trgqq1XHj5RqCog/lDW5a5etfVXPpNaqNUYO5OGDYMGYixGMtpUUMNqorxrqI1uhIt9eGe72aaebA5MESnsW+mWhn6j+Ay5/IPKOylWpXPTB7Y2rPjOGOcI1XGVrKuiMC5l0OhccjSYBsdjaUxrvhL1qrE8I99B34mTlyxDFfNBHZnn/rA0U6ymiONnt4lZB0yuh6lRWuuFaUy42uL914SLN1ZGaVGCjK//i1BJXlCt+KOanEXutl+lFbNBS+ZWxvOi9ahI95B/RSQAIwyQNCn+Od6eB1kwwrg+VoIoQGs+r97fW2LQTpS3NINHSjVqYyAUxXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+iZODhl463/CZ2bytxzpUMePGj7cqVTaCHpMZCfKqQ=;
 b=jdyFDW8W0f0xBjqrvluAV8BTprLCwpwDKGKi1tImHur2exUtd5l87DmH9lhVrT6lJfWj+FitrDv0u6oJxi7u85ThM9lNExuuqJadvgCqLF2l19AdxCkut4R6Avm9JTMcrFR6dP9jAqHMJf/b7n0uDZs5Z9gc+nV/Z2ClXRbErAPwQBrycIIpyo6DGVyl0fNZJ1GN6e+7C8kxoKtvogStshauRbRENNUNdlwhljdIZHLZaT2dunuyfQJd79h+i9sBH6qV1heK5TRLThMLRNGSy3dADTo5sKRPnOb8x5S/quY7wit6Uk3K2099OyDdx/kWuaiIvwFTfF+FGRes3OSVXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+iZODhl463/CZ2bytxzpUMePGj7cqVTaCHpMZCfKqQ=;
 b=xACCTkkbrkQn9KquRP88pHg0mMNAPBAa9n5vyX3DUaLWAwc1CkBDsF3bqVAb4BqCdrYwvG9rOo2BmUZaWC3MRADJu0Jb+6i/Qzr7c2qKL8DzYEWfdukl2Ti4vgmU//07M6dkJ3gOXvKLivmyT6KMLY5rnU06uVcpfWJTLYb8OPw=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Thu, 10 Dec
 2020 08:24:25 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::b544:5491:32e8:f230]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::b544:5491:32e8:f230%3]) with mapi id 15.20.3632.024; Thu, 10 Dec 2020
 08:24:25 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: "Sia, Jee Heng" <jee.heng.sia@intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Subject: RE: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Topic: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Index: AQHWvLmNGvsTxGs990eX9gpk7gsGM6nMeVYAgACSVQCAAO9RgIAIta8AgAnQR9CAABFjgIAABrKAgAFjtACAAA1/AIAFvdWggAO/aoCAAFxvgIAAxP+AgAN4nyA=
Date: Thu, 10 Dec 2020 08:24:25 +0000
Message-ID: <BYAPR11MB3046A125098F7D5F1A67F9759DCB0@BYAPR11MB3046.namprd11.prod.outlook.com>
References: <20201117080354.4309-1-michael.wei.hong.sit@intel.com>
 <20201117080354.4309-4-michael.wei.hong.sit@intel.com>
 <20201117155038.GO4077@smile.fi.intel.com>
 <CO1PR11MB50269CF832CD14BA2D2A883CDAE10@CO1PR11MB5026.namprd11.prod.outlook.com>
 <20201118145055.GW4077@smile.fi.intel.com>
 <CO1PR11MB5026A81C4294BEF4EE5EF923DAFB0@CO1PR11MB5026.namprd11.prod.outlook.com>
 <BYAPR11MB30465A81744EA686D2502DB69DF50@BYAPR11MB3046.namprd11.prod.outlook.com>
 <e9bae9eb-6b8b-5a8c-eba0-d7f5da955987@metafoo.de>
 <20201130110915.GI4077@smile.fi.intel.com>
 <74ed61e1-67d9-d7b7-0619-fbe61ad7a583@metafoo.de>
 <CO1PR11MB502600945CC303756DBBC30ADAF40@CO1PR11MB5026.namprd11.prod.outlook.com>
 <BYAPR11MB3046DFC48A045ADA72D0F9369DF00@BYAPR11MB3046.namprd11.prod.outlook.com>
 <17462280-244f-0c1e-61f2-6dd197dbcd2d@metafoo.de>
 <2e29264a-a64d-f1f7-8695-ae7463a773a5@linux.intel.com>
 <CO1PR11MB5026545F07968DBC5386CF45DACD0@CO1PR11MB5026.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB5026545F07968DBC5386CF45DACD0@CO1PR11MB5026.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [14.192.243.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 987a5101-fb1c-47dd-5828-08d89ce50179
x-ms-traffictypediagnostic: BY5PR11MB3992:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB3992FB7E5988C7B3BC87A3AA9DCB0@BY5PR11MB3992.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hpjff/JyQEiMkyfIBiXgVIp4iqApQOxciYOO9VIMYCoovcGAacJngjVft6ShzOyKFTSWfp7Wmao0sqgXCvixKXkriLYApyGzhgbMevziDAWtABoOJo/r4k41XkecXd8gNPfbh7gdBD5bYAxHKEwowMqFofcifZVhSaAE3EkcC26XdPDHB7iN2lq682QwsrLKrs/bvuDiNb2qe8FID1yr04h5EzSWCyRtg4u64j+jogDSooU/5ePLgIH5VQnFa1N9pk7ZdXS6TZ8oaqJjLD34h2WsuqzMPn15hDw2fSAOD1g4eqi/zjJeCXWMwQeUQteQJqc0wcHW485toTTLPkyIMeeXRYsOYmepPlDwpvnCbbOppo43ip5iyRBAwhhkziZB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(71200400001)(86362001)(52536014)(6636002)(83380400001)(55016002)(54906003)(9686003)(5660300002)(4326008)(508600001)(66446008)(66946007)(26005)(8676002)(53546011)(7696005)(2906002)(6506007)(66476007)(110136005)(64756008)(186003)(33656002)(8936002)(76116006)(66556008)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZDdNOXVVNnpYdjQ5dU1CZjNMNkZYYWZ5RlNqS1VTQWVQbmhhSUZHRVpac2Ri?=
 =?utf-8?B?SGMwSEZLNjkyZ3Jwa3doVUdHU1RsVXNhRFgvcTB6L2dRRVNqRHlQaUlWYUt0?=
 =?utf-8?B?YldBd1hZeThOOGFweUEzU2RiaW9oSkthVEltOWdOYjJ1MHV1OTdGZGlBV3F0?=
 =?utf-8?B?bmNXWXlmSHlrVFlUQXQzUitiZmtuaXBJTDVzRVo0eWJvSkFZQTA4SXpaMXlN?=
 =?utf-8?B?cUNra0UvTmgxdVpZd0tndmtrZGRrN2p0M245dHpLWlR5RHBxQm8zRU1JaWJj?=
 =?utf-8?B?RUJ6Y0krRVptdUhxSEdKOXZmeGdkZThUOWVwa3kvckJqazlFbVFOSzVUR2lm?=
 =?utf-8?B?N293SEZkUGZCYzY0UEZVOVJNR3dMWWkwcXlVY1pqZ3BLZmxnL3BGdEZLYzE5?=
 =?utf-8?B?YzlVdlZFelQ0bWdFWFdoRGRhUDE3ejh0WE5NRnMzK2llRTN1UHZZa2VBQS9T?=
 =?utf-8?B?RUx0S1NPbndzZlJJVzJxZTBNQlphN3JSYkRZRnA2YjBGeXFUS0FURkxmeWNu?=
 =?utf-8?B?VThWdzZlRTVnV1hpTVEwSEQ0UXRDVURYSVRhUzdqQ0d2R25NT01YRmxUNTdv?=
 =?utf-8?B?dFFxUHkxRnBKb2loTm1FTjlHZ05EUnYwa2ZkN3YyMW80U3Z5ZWloRGwrTFVw?=
 =?utf-8?B?V0pWajJ0L3hrdml6VmFrWUdzMzJPZlY4MlZXSitucmM5TXhuZHBpREpoUXdH?=
 =?utf-8?B?R3o4MGk3bGd0ZXh5eWthMXpaWnUyRDFxb2ZaTUN0V2hkZU1HWWs3UzFsSWM3?=
 =?utf-8?B?SDc4K2NQZWpCaFgvT3M5ZktqQnNId3FyaVBvMkNETmRtbEdPSkc3TEF0dE1x?=
 =?utf-8?B?RUZnVlJBRnVWdThGSHVBSzJzMjFrR1cwM251ZXlZWFBHT0kxcU1wMWdtRUtY?=
 =?utf-8?B?ODlmbDd4c3V0RDFSckZ1TThucUN6MHhSdEd6V2hnMUEvNERibnF0ZEVLMENj?=
 =?utf-8?B?R3VwMVFoQktnT2kraFVhakJXNk5hUU5PWC9vNnRHeEd1NG9qOGh1R2t3MXdU?=
 =?utf-8?B?bVBYQjEzRlpkanVYNzhJU09mcTBOT0s1ZEJkWnRzeUtmQjh1ckRKdmI2NWZL?=
 =?utf-8?B?Y1JvNldYdTZKU2JiRU8zWGhJK0RNdjNkaUhvZmswYWNVTVlIUnV4MXlDMUVQ?=
 =?utf-8?B?S3B2NjExMjhMTk5OV28vdWNqZzZpVTNaamFiNEh6d0lqenl2OFhmZ08wT081?=
 =?utf-8?B?K3lkR2JndWNyRHFWblFnM2xOdjZSZmxVdTFNVW94NG9RdVZ0Z2VuZHFhenhh?=
 =?utf-8?B?ZGFHeWE2K1RMRS8yVTJhNmtod2Riby9sNDFwT1hSVFNOV0ppejJ6a3NOYTYv?=
 =?utf-8?Q?q/r7nTbK7K4qc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 987a5101-fb1c-47dd-5828-08d89ce50179
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 08:24:25.7219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6COGXFT/UoeoBv/CxCRlD6nmKvjyShRske0DEyh3NLSDNGJEGJ/FkQJRy3PN3j7RD4gKRZvPX3FD6AN7PSsTIq2Aitbh5wtG0cTBqwx1lbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3992
X-OriginatorOrg: intel.com
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2lhLCBKZWUgSGVuZyA8
amVlLmhlbmcuc2lhQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgOCBEZWNlbWJlciwgMjAy
MCAxMToyMSBBTQ0KPiBUbzogUGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3Nz
YXJ0QGxpbnV4LmludGVsLmNvbT47DQo+IExhcnMtUGV0ZXIgQ2xhdXNlbiA8bGFyc0BtZXRhZm9v
LmRlPjsgU2l0LCBNaWNoYWVsIFdlaSBIb25nDQo+IDxtaWNoYWVsLndlaS5ob25nLnNpdEBpbnRl
bC5jb20+OyBTaGV2Y2hlbmtvLCBBbmRyaXkNCj4gPGFuZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNv
bT4NCj4gQ2M6IFJvamV3c2tpLCBDZXphcnkgPGNlemFyeS5yb2pld3NraUBpbnRlbC5jb20+OyBh
bHNhLQ0KPiBkZXZlbEBhbHNhLXByb2plY3Qub3JnOyB0aXdhaUBzdXNlLmNvbTsNCj4gbGlhbS5y
LmdpcmR3b29kQGxpbnV4LmludGVsLmNvbTsgdmtvdWxAa2VybmVsLm9yZzsNCj4gYnJvb25pZUBr
ZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJFOiBbUkZDIFBBVENIIDIvNF0gQVNvQzogc29jLWdlbmVy
aWMtZG1hZW5naW5lLXBjbToNCj4gQWRkIGN1c3RvbSBwcmVwYXJlIGFuZCBzdWJtaXQgZnVuY3Rp
b24NCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206
IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtDQo+IGxvdWlzLmJvc3NhcnRAbGludXguaW50
ZWwuY29tPg0KPiA+IFNlbnQ6IDA3IERlY2VtYmVyIDIwMjAgMTE6MzYgUE0NCj4gPiBUbzogTGFy
cy1QZXRlciBDbGF1c2VuIDxsYXJzQG1ldGFmb28uZGU+OyBTaXQsIE1pY2hhZWwgV2VpDQo+IEhv
bmcNCj4gPiA8bWljaGFlbC53ZWkuaG9uZy5zaXRAaW50ZWwuY29tPjsgU2lhLCBKZWUgSGVuZw0K
PiA+IDxqZWUuaGVuZy5zaWFAaW50ZWwuY29tPjsgU2hldmNoZW5rbywgQW5kcml5DQo+ID4gPGFu
ZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNvbT4NCj4gPiBDYzogUm9qZXdza2ksIENlemFyeSA8Y2V6
YXJ5LnJvamV3c2tpQGludGVsLmNvbT47IGFsc2EtDQo+IGRldmVsQGFsc2EtDQo+ID4gcHJvamVj
dC5vcmc7IHRpd2FpQHN1c2UuY29tOyBsaWFtLnIuZ2lyZHdvb2RAbGludXguaW50ZWwuY29tOw0K
PiA+IHZrb3VsQGtlcm5lbC5vcmc7IGJyb29uaWVAa2VybmVsLm9yZw0KPiA+IFN1YmplY3Q6IFJl
OiBbUkZDIFBBVENIIDIvNF0gQVNvQzogc29jLWdlbmVyaWMtZG1hZW5naW5lLQ0KPiBwY206IEFk
ZA0KPiA+IGN1c3RvbSBwcmVwYXJlIGFuZCBzdWJtaXQgZnVuY3Rpb24NCj4gPg0KPiA+DQo+ID4N
Cj4gPg0KPiA+ID4gSWYgeW91IHJlYWxseSB3YW50IHRvIGxpbWl0IHlvdXIgcGVyaW9kIHNpemUg
eW91IG5lZWQgdG8gaW5zdGFsbCBhDQo+ID4gPiByYW5nZSBjb25zdHJhaW50IG9uIHRoZQ0KPiBT
TkRSVl9QQ01fSFdfUEFSQU1fUEVSSU9EX1NJWkUNCj4gPiBwYXJhbWV0ZXIuDQo+ID4gPg0KPiA+
ID4gQnV0IEknZCBoaWdobHkgcmVjb21tZW5kIGFnYWluc3QgaXQgYW5kIGp1c3Qgc3BsaXQgdGhl
IHRyYW5zZmVyDQo+IGludG8NCj4gPiA+IG11bHRpcGxlIHNlZ21lbnRzIGluIHRoZSBETUEgZHJp
dmVyLiBOZWVkbGVzc2x5IGxpbWl0aW5nIHRoZQ0KPiBwZXJpb2QNCj4gPiA+IHNpemUgd2lsbCBp
bmNyZWFzZSB0aGUgbnVtYmVyIG9mIGludGVycnVwdHMgZHVyaW5nIGF1ZGlvDQo+ID4gPiBwbGF5
YmFjay9yZWNvcmRpbmcgYW5kIGh1cnQgdGhlIHBvd2VyIGVmZmljaWVuY3kgb2YgeW91cg0KPiBz
eXN0ZW0uDQo+ID4NCj4gPiBZZXMgdGhhdCB3YXMgYWxzbyBhbiBvYmplY3Rpb24gZnJvbSBtZSwg
dGhlIGZpeCBzaG91bGQgYmUgaW4gdGhlDQo+IERNQQ0KPiA+IGxldmVsLiBUaGUgMTAyNCBibG9j
ayBsaW1pdGF0aW9uIHdvdWxkIG1lYW4gcmVzdHJpY3RpbmcgdGhlDQo+IHBlcmlvZA0KPiA+IHNp
emUgdG8gYmUgYXQgbW9zdCA1LjMgb3IgMTAuNm1zICgxNiBhbmQgMzItYml0IGNhc2VzKS4gVGhh
dCdzIHdheQ0KPiB0byBzbWFsbC4NCj4gWz4+XSBTZWVtcyBsaWtlIGNvbXBsZXhpdHkgaW5jcmVh
c2VzIGlmIHNwbGl0dGluZyB0aGUgc2VnbWVudHMgaW4NCj4gQVNvQy4gVGhpcyBpcyBub3QgYSBm
cmFtZXdvcmsgaXNzdWUgbm9yIGFyY2hpdGVjdHVyZSBpc3N1ZS4NCj4gSWYgaW50cm9kdWNpbmcg
bmV3IEFQSSB0byBETUFFTkdJTkUgdG8gY29uc3RyYWludCB0aGUgbnVtYmVyDQo+IG9mIGl0ZW1z
IGlzIG5vdCByZWNvbW1lbmRlZCwgdGhlbiBsZXRzIHNwbGl0IHRoZSBzZWdtZW50cyBpbg0KPiBE
TUEgZHJpdmVyLg0KDQpXaXRoIHRoZSBpbmNyZWFzZWQgY29tcGxleGl0eSBvZiBpbnRyb2R1Y2lu
ZyBuZXcgQVBJcyBjYW4gd2UgbW92ZSB0aGUgc2VnbWVudCBzcGxpdHRpbmcgdG8gdGhlIERNQSBk
cml2ZXI/DQpBbnltb3JlIGNvbmNlcm5zIHdpdGggZG9pbmcgc28/DQoNCg==
