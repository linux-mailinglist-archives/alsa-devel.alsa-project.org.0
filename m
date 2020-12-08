Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE592D2165
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 04:23:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EADC916AC;
	Tue,  8 Dec 2020 04:22:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EADC916AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607397788;
	bh=VETsu9vL/dZQgtgwQFF2dJ3LBfGkPqFWLGgDxrkKKFI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dq0bZ05coZORUV3BotHkOYPZZgWjqgyncitVIoGWFBLzDl6UwTXhCXLDG0EVGxK1E
	 lPfClAj5Sq16Yuw2isr/8598e/d9/dHo+y6Gh2AUVUTSd3agvIgL1IuFMTTluSX0Yv
	 xSArznL4VqoRQ/+JUdhtg+LZU6LFZHO+RlgBnLic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CA83F800E1;
	Tue,  8 Dec 2020 04:21:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84AC4F8019D; Tue,  8 Dec 2020 04:21:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 675D6F80130
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 04:21:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 675D6F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="PI/x2bkG"
IronPort-SDR: mdBs/jJ3T9mljKGr0RiYVg8mafKiTnPeqUCPIUT1ITPkIZzd4CW9ozF/xHIM4WlSIIwNvMobLW
 uTSWzfRpdekQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173970733"
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="173970733"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 19:21:20 -0800
IronPort-SDR: BEHk4NTJ2IwKe7SMr/tdWXfu+SToofAEWnCb0vAvb1dJw9RBxZ7RIRxlOe2rHv1aIn+Q3gLqRz
 rs1L0wDp15HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="332368827"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 07 Dec 2020 19:21:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 7 Dec 2020 19:21:19 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 7 Dec 2020 19:21:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 7 Dec 2020 19:21:19 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 7 Dec 2020 19:21:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdtocRWfnkUoyW3mr2wlVWovNazdQ4CUsFAA2c1LtZUgiTv5WqYJTZYomdJH4r/lRByWlxdygt+ZdfjqdW8jj+EyshKcuaE58G4Cgp4Ngc1IXbl6l+T2gw7uancg1QDR8e7QVlukfAIJF8jic7O2IhchseHGZMxz1lm/FkIgdYBO19izEAAVNOLn8RW67huB051jLKWvesXCXu9IR3Y/HNBDQXW0nrYIYi4zuIWwamBymvepCEBIePwlqmSE1AlcUZV6fRgmx938GZeAXMIVzLXU8Kx4oZUSZQHOgHxr8fKQAGfcpoqOyV9InzoQY/jwkplWwFseLz9FlqkMIN4UJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VETsu9vL/dZQgtgwQFF2dJ3LBfGkPqFWLGgDxrkKKFI=;
 b=BPoxl/JMRz7xW4iAWNNhphdSctPiedFD0Yv+xb5b6GaLcJ3KgygoB/FbDf8RgDnbYDBI1a4JnzilBi6KCBg/IcCvhIhgrac/HerdCDgkT3CmGJbcvnnvC4HtBpKhVt7b9zfQH9tIrgt9bAapGeF0acqInBVN7h6CNV1G8MFS+mzWzUg/g+urG61Fzo55g/pDDHRWXWAhX2FwiQsxRZCmX200Swu1rqhsG8xW3rhNI9Ry3abP87xo8wkfRGzbGzucIjv5THPLuWvcXZpVKIOcJAmQJ4mwU6aluHK8ulKuIC0WRExer/TE8ywkFgvGdEabqb34cJyX7nMwEPq0E2tkGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VETsu9vL/dZQgtgwQFF2dJ3LBfGkPqFWLGgDxrkKKFI=;
 b=PI/x2bkGeC2bDkYtHfbEKxjM32rTmYJosEGl4yxy+44y1zyqqLQlsfxlnpaO6NYcVEsQPEqbdpOmYURfImQ34vrLW1Wb6SaNqp8PoMd1R+B9cVH3xkNjAf4cJaZGglDzpJsVhXqn2NPrWkFVW7Od06aV7HwpA5OouwU9F4HOi1k=
Received: from CO1PR11MB5026.namprd11.prod.outlook.com (2603:10b6:303:9c::13)
 by MWHPR1101MB2141.namprd11.prod.outlook.com (2603:10b6:301:50::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 03:21:11 +0000
Received: from CO1PR11MB5026.namprd11.prod.outlook.com
 ([fe80::4820:6e90:3d0e:3b5f]) by CO1PR11MB5026.namprd11.prod.outlook.com
 ([fe80::4820:6e90:3d0e:3b5f%4]) with mapi id 15.20.3632.018; Tue, 8 Dec 2020
 03:21:11 +0000
From: "Sia, Jee Heng" <jee.heng.sia@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Lars-Peter
 Clausen" <lars@metafoo.de>, "Sit, Michael Wei Hong"
 <michael.wei.hong.sit@intel.com>, "Shevchenko, Andriy"
 <andriy.shevchenko@intel.com>
Subject: RE: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Topic: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Index: AQHWvLkz/K4udK7YCEaiWD6EQ6aik6nMeVcAgACNiCCAAPQdgIAIspZAgAnXR4CAAA18gIAABrOAgAFjtACAAAhM8IAFxBAAgAO+YoCAAFxvgIAAv5tg
Date: Tue, 8 Dec 2020 03:21:11 +0000
Message-ID: <CO1PR11MB5026545F07968DBC5386CF45DACD0@CO1PR11MB5026.namprd11.prod.outlook.com>
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
In-Reply-To: <2e29264a-a64d-f1f7-8695-ae7463a773a5@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90d0b6e8-8b75-4329-3f66-08d89b285022
x-ms-traffictypediagnostic: MWHPR1101MB2141:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB214163451CAA5A3C49DFE03DDACD0@MWHPR1101MB2141.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KTK5HBETDQ8hq+GKBI3POPASwfhnviO2kMWcbHdLFO8ZdBAvdSGClItOcWVNbe9R1r2W/jEU4hJOMAFCBrbqDe5sRUl/qUHJkbqWTEoMF4DvsnnM+m2U7MGhDABHkdCJmCYzloML2WcUHSi185vF08WUA960cYPiNG24zNPhu9YDEb1rquPJFHd4gr6CWY/6KgUVqB7siIdkg24BG3KW5uXACP78AlOSmMwc11NgUvYcQFRDsOsUVIo6MI2frafDwSgjp5/isOlXGHcBWlpcd12EvCAYXYvEB4BKG3s8m0gGW2tXKOH158GlpZp6MapQ/HJCPOxVVnEJTFfEAX5L/aCKvdwdLuHq5g5PHFA5xcbU19O4OTkkc04WAMQlijTX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5026.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(54906003)(5660300002)(76116006)(110136005)(64756008)(6636002)(52536014)(8676002)(53546011)(83380400001)(66946007)(66446008)(66556008)(4326008)(2906002)(86362001)(26005)(8936002)(478600001)(33656002)(7696005)(55016002)(71200400001)(6506007)(66476007)(186003)(316002)(9686003)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZjJPVkhwczduVlM4WTBoa2N5NmM2eWF4QWluT09IV2p2YXJLQ3ZaK0VCNmgz?=
 =?utf-8?B?emxsVDk2ZDR2TGJYT1NFSVE1MFowT1Eyd1ZsM2hqeTUzbjBMTHV6dmJ0QW1J?=
 =?utf-8?B?bHg3OUNCblh2alVLUnlyMURJWlIyY3NhTnhNSTBINmVPTDRUdEkrZ0xaejdQ?=
 =?utf-8?B?dTc2Q3ZZWFJoR2VWOENPNWZLTkZTZEpMT0hLMDhGcW04Unkrd2lXa1VmM05j?=
 =?utf-8?B?OC9tbUZUVHhaL2gycjZMemxOMHhINXM5VHVFTkZUSmw1SGQ2dEJJWVUzLzBt?=
 =?utf-8?B?emxBU2xpV292SUFFcWg0QkNwZThPYU9aOXlFWGpDd3pOL0FxNStGZW93bWtZ?=
 =?utf-8?B?TzJXWjJhbXRZRGpyVXVkVjl5QkpjWUUveDN0WXkxOGxzejdEY2hrRis4bXZN?=
 =?utf-8?B?VTZUY0R0TFM3YlkxbzBrMEwybUlLaDRkUHUxbGVmZ2hSY1FqRzBsd1ZXV3R1?=
 =?utf-8?B?UCs1eDJCZWIxYy80d3E1ZDRnY0FnSlNMenZ3bUtHTVppbWVab2Z2YWNhQUM4?=
 =?utf-8?B?VHo4N2hRczlOcUZCNnF3NlhGN3NYZTFHZ0tSQXlMSnByUmxzWHIxamEzNGVS?=
 =?utf-8?B?NzRUQUl3Y3NPeXRId1Rxd09PY2l3cGhXdjJaRzkzMTV6U0R1eXAvbmx3R3Y2?=
 =?utf-8?B?dlpaNE9Oa3ZaWXdyMkx4TlgzVFNGRkZubXBCbFVCMXVzQVFxRS8ySG9IUDVY?=
 =?utf-8?B?dnpMRDJpNEs5NWpHUHh5UzU5ZGpmTitOMXF3S0dGWmJUZmJ6OTd2azZnMHpK?=
 =?utf-8?B?TXh0WGgvczVOYVpJblFlUkhaRGt2UElqQ2RKL1JFdU1BTWorK25ESjNEK3No?=
 =?utf-8?B?QTJXYXBVclJOSERxS3RReE1BR3h0cGs4cmhvL1pEL2FIcXdqM3VMUzhLejJC?=
 =?utf-8?B?MVBlOXlZT2pkZ2ZrR3cwaGZlUW1RKytKNGs4NC9rRUpSOFBlNjBJZDVXUlNk?=
 =?utf-8?B?MlFLM2pIYk5iWTlmTE9keHhJUlhxZmIxdzdaODQwS1pZOVdSRWZpYzFPVlht?=
 =?utf-8?B?c3Y3dlhZWXRuQWsrdFBrWW8yc051Y3RPc1ByNmEzaVQ1SkVnYy9ucmRJSWh3?=
 =?utf-8?B?WmovSFhGVm41d0lLamk1bG9LRGQ0RzJpWnVKS01saWRTVDFFVlJJWjBReVdp?=
 =?utf-8?B?SURIRDZPUnFyNUhucGdiRzdqS3lES3I5OTdkVkdTOGFUc3FtbGF6NkdqSWJZ?=
 =?utf-8?B?OHMvNERuQUpjYmJEWk1Hd2c3Ull0NHhWYUdwLzlneVpLd0hxVmVGaFh1TFpw?=
 =?utf-8?B?OTI5ZnVVN3Bza3hSQzZMdGpYWnkxMkVMNmZqTHNEa1VpMmlMOFN1Q3QwZDlt?=
 =?utf-8?Q?twe4jyC5p7+18=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5026.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d0b6e8-8b75-4329-3f66-08d89b285022
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2020 03:21:11.7109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 36KA2P0oBLDbuOCRextxXCbQx3jdiqDWv9xjDVOGE0DGktWls2BC6vVqw3rWs3M2c57+b1x92FJ+P6fQCPEeNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2141
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogMDcg
RGVjZW1iZXIgMjAyMCAxMTozNiBQTQ0KPiBUbzogTGFycy1QZXRlciBDbGF1c2VuIDxsYXJzQG1l
dGFmb28uZGU+OyBTaXQsIE1pY2hhZWwgV2VpIEhvbmcNCj4gPG1pY2hhZWwud2VpLmhvbmcuc2l0
QGludGVsLmNvbT47IFNpYSwgSmVlIEhlbmcNCj4gPGplZS5oZW5nLnNpYUBpbnRlbC5jb20+OyBT
aGV2Y2hlbmtvLCBBbmRyaXkNCj4gPGFuZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNvbT4NCj4gQ2M6
IFJvamV3c2tpLCBDZXphcnkgPGNlemFyeS5yb2pld3NraUBpbnRlbC5jb20+OyBhbHNhLWRldmVs
QGFsc2EtDQo+IHByb2plY3Qub3JnOyB0aXdhaUBzdXNlLmNvbTsgbGlhbS5yLmdpcmR3b29kQGxp
bnV4LmludGVsLmNvbTsNCj4gdmtvdWxAa2VybmVsLm9yZzsgYnJvb25pZUBrZXJuZWwub3JnDQo+
IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIDIvNF0gQVNvQzogc29jLWdlbmVyaWMtZG1hZW5naW5l
LXBjbTogQWRkDQo+IGN1c3RvbSBwcmVwYXJlIGFuZCBzdWJtaXQgZnVuY3Rpb24NCj4gDQo+IA0K
PiANCj4gDQo+ID4gSWYgeW91IHJlYWxseSB3YW50IHRvIGxpbWl0IHlvdXIgcGVyaW9kIHNpemUg
eW91IG5lZWQgdG8gaW5zdGFsbCBhDQo+ID4gcmFuZ2UgY29uc3RyYWludCBvbiB0aGUgU05EUlZf
UENNX0hXX1BBUkFNX1BFUklPRF9TSVpFDQo+IHBhcmFtZXRlci4NCj4gPg0KPiA+IEJ1dCBJJ2Qg
aGlnaGx5IHJlY29tbWVuZCBhZ2FpbnN0IGl0IGFuZCBqdXN0IHNwbGl0IHRoZSB0cmFuc2ZlciBp
bnRvDQo+ID4gbXVsdGlwbGUgc2VnbWVudHMgaW4gdGhlIERNQSBkcml2ZXIuIE5lZWRsZXNzbHkg
bGltaXRpbmcgdGhlIHBlcmlvZA0KPiA+IHNpemUgd2lsbCBpbmNyZWFzZSB0aGUgbnVtYmVyIG9m
IGludGVycnVwdHMgZHVyaW5nIGF1ZGlvDQo+ID4gcGxheWJhY2svcmVjb3JkaW5nIGFuZCBodXJ0
IHRoZSBwb3dlciBlZmZpY2llbmN5IG9mIHlvdXIgc3lzdGVtLg0KPiANCj4gWWVzIHRoYXQgd2Fz
IGFsc28gYW4gb2JqZWN0aW9uIGZyb20gbWUsIHRoZSBmaXggc2hvdWxkIGJlIGluIHRoZSBETUEN
Cj4gbGV2ZWwuIFRoZSAxMDI0IGJsb2NrIGxpbWl0YXRpb24gd291bGQgbWVhbiByZXN0cmljdGlu
ZyB0aGUgcGVyaW9kIHNpemUNCj4gdG8gYmUgYXQgbW9zdCA1LjMgb3IgMTAuNm1zICgxNiBhbmQg
MzItYml0IGNhc2VzKS4gVGhhdCdzIHdheSB0byBzbWFsbC4NCls+Pl0gU2VlbXMgbGlrZSBjb21w
bGV4aXR5IGluY3JlYXNlcyBpZiBzcGxpdHRpbmcgdGhlIHNlZ21lbnRzIGluIEFTb0MuIFRoaXMg
aXMgbm90IGEgZnJhbWV3b3JrIGlzc3VlIG5vciBhcmNoaXRlY3R1cmUgaXNzdWUuIA0KSWYgaW50
cm9kdWNpbmcgbmV3IEFQSSB0byBETUFFTkdJTkUgdG8gY29uc3RyYWludCB0aGUgbnVtYmVyIG9m
IGl0ZW1zIGlzIG5vdCByZWNvbW1lbmRlZCwgdGhlbiBsZXRzIHNwbGl0IHRoZSBzZWdtZW50cyBp
biBETUEgZHJpdmVyLg0KDQo=
