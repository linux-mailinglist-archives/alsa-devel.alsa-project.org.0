Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B912CF861
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 01:57:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A1E018AA;
	Sat,  5 Dec 2020 01:56:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A1E018AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607129824;
	bh=RZpRsJakxfxqTRo1cZ/IJhTDocG7TAz3xNeNwRlC9Lg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FV3u5MDAQJxsdTgF10Cax2XSbXDdIRHzR0pIDVm1CPzLcN+VdlujkfGh357kKswZb
	 qluN+sMbCteDAVbBt70yvpyKZUsU4GXXQebY29qppNlUxwNnFTYIsEbEbzkjdTwgLE
	 8vH6oskniZ1WeAUjifU8LYdzsvc42YLR0dZzU8kY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77AB8F8049C;
	Sat,  5 Dec 2020 01:55:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92415F80278; Sat,  5 Dec 2020 01:55:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E9C9F800E8
 for <alsa-devel@alsa-project.org>; Sat,  5 Dec 2020 01:55:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E9C9F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="hR51mvL+"
IronPort-SDR: T78eJQcTKgkYjRl+9mUObaPgwIVwwtAwRsV4s6jGgpGC2IfisYtDnOKpK63bkoUt5DOrluGbrV
 PjQhiEisH08w==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="172692234"
X-IronPort-AV: E=Sophos;i="5.78,394,1599548400"; d="scan'208";a="172692234"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 16:55:11 -0800
IronPort-SDR: tfdTT6JO0qee1GlqAhY6ZlO0w5QPJnVd6ddx4Z1TN1zFurL84QO+eGckLtMoaML4iPMolnZGxP
 oRY2K+1vGTOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,394,1599548400"; d="scan'208";a="551158727"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 04 Dec 2020 16:55:11 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 4 Dec 2020 16:55:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 4 Dec 2020 16:55:10 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 4 Dec 2020 16:55:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4FZn7XQDoYv5ydiuhBlqdu5fZ8jn3ZLJ4zbM0jqXgc6ZpwAJVNq4K2VqcylhXSDuAmIjGZms90Q8iLnb/cpvhaHms0oKTlNQl8DKnPUD3Va/APb9wuYJBDVickTyT2Ovi2PezaLFQnXmFDa/flxaByPnY8PmB+/D0HHUBPkQ9RmGnP8XAElgNIjuRZfaWZcbnpB7MzUD5F/pPm8o+F4rzHrT6CG96RZuPJM8nOGU4+bMXU6QiD1Ei0NyIcQqgZOW0jM7EIaGZfX7Fun5eUIe+dGbjb+d2f4dTRwCr/v0MrcGGnsz9SoEj6bbq0XWTzxZYYnsySB83wGe22hLNuOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZpRsJakxfxqTRo1cZ/IJhTDocG7TAz3xNeNwRlC9Lg=;
 b=XBh9wO7JiWCWgMpphOesHDegOedb0OQMzfoOpmiRA/FI7ndhxmpGfpMLNCmcCIyKyUuVgz//xck6LgSRAlREXatWit4ch4TpRUmwZ80eSWoc4DFvA/vZ+jdEoYErk0QJL0RHp56Xmrs4iVX9T4elIhwKCSwZDeIHET+Xnqa02puqeESgurnztAiUUdksKvneXlYAThntMDpJa03i7NqZjmA6apytwnGwE3rvi2bt/iVytusZ9ju5WmMdnpuaereQ3fD5p8umcaQz9xRK3qY8AS/FhUw+j+PeQyiuUhZwvUT7VSxTZJ01L52zT0/3Yxk7mQxxU/KGNrFts4a5iKCh/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZpRsJakxfxqTRo1cZ/IJhTDocG7TAz3xNeNwRlC9Lg=;
 b=hR51mvL+sHlYyv9z9fXDP6hLRFn7m4rJDMX2vNkhrG27n0PRuBjcpMygPgXOiWtiTBzbkTUBEWg6UrvpWAWOMHtPCgQlGEybtwtRe2AOPHHtvDDXcwRRBSKgWMJJ7MdCQDW5eUUYRXjGaAyju8WcGb6Yzzpaxbiz0RsHZfydZCs=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BYAPR11MB3494.namprd11.prod.outlook.com (2603:10b6:a03:86::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Sat, 5 Dec
 2020 00:55:06 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::b544:5491:32e8:f230]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::b544:5491:32e8:f230%3]) with mapi id 15.20.3632.021; Sat, 5 Dec 2020
 00:55:06 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: "Sia, Jee Heng" <jee.heng.sia@intel.com>, Lars-Peter Clausen
 <lars@metafoo.de>, "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Subject: RE: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Topic: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Index: AQHWvLmNGvsTxGs990eX9gpk7gsGM6nMeVYAgACSVQCAAO9RgIAIta8AgAnQR9CAABFjgIAABrKAgAFjtACAAA1/AIAFvdWg
Date: Sat, 5 Dec 2020 00:55:06 +0000
Message-ID: <BYAPR11MB3046DFC48A045ADA72D0F9369DF00@BYAPR11MB3046.namprd11.prod.outlook.com>
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
In-Reply-To: <CO1PR11MB502600945CC303756DBBC30ADAF40@CO1PR11MB5026.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: edc3c8d5-61c6-4092-13c6-08d898b8686f
x-ms-traffictypediagnostic: BYAPR11MB3494:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3494E7C3D1175BD9DFF30BCF9DF00@BYAPR11MB3494.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h0Rq+0SR5HxiSUX6q6UNj4nlYx0WNaa0ShUdf7Z9ACYXeVXsOkGXCveqrkLV/dWBlGsE/zozQAgSNDtNmbfsUc6J8na3KId0UkNDr8hdLFI+mDIq/4aHwEEjGqsOrXYHE8s1Adhyog1S7ardHyES1+5TUcyQF9R3gcCfT08gqiC1MAdF1aT5z4/X1A1dwv3LJ8GZ5i1CEPUfIjxh0TZ7BrwbaEJtCZiRb7yae214+jiqgkqyi4w0sH32/gIW9wwvfmgTyCF93xLSjJ2NqF9gaHy4AaXhv3MAMyptQs84u0BR/D8GxPKl16p+URy34uWli6ZpxFya4Jzx7cXmO/Wh+JF+84LtAZ7fuXCXba3r4xwh64cCQCbEy7ZWvXxkgt19tLEeWunu9WGqsI2I/T6POg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(71200400001)(76116006)(478600001)(86362001)(7696005)(64756008)(66446008)(186003)(33656002)(9686003)(2906002)(8676002)(6636002)(54906003)(4326008)(316002)(110136005)(55016002)(6506007)(26005)(5660300002)(52536014)(83380400001)(53546011)(66946007)(8936002)(66556008)(66476007)(41533002)(6606295002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Wi9DOElEeUxVQXhIdHkyVkYrSDNFaEVQNkRSeVFoOWJQZlMwL1VlL1FFYlV2?=
 =?utf-8?B?Q0FYeGt2K1NibGQ5YnI1WmhkTnMvenM0cjlIQXlnNW1rNk81YVZpS1AxQVlr?=
 =?utf-8?B?NDVqTUlQaDg3eURDcld2NGhTOWRYSzBucGsveFBoL2pDZnlOOUZJZzhiby83?=
 =?utf-8?B?Qk1heVV6b2Z0UzlPTTFSRjFmRzdFc2RHK3Rubkk1YTE2NGJRdEJRNDZ5ektK?=
 =?utf-8?B?TzBKazhqc1h2dEVEejFENmU1blljaElqNDc4LzU5ZklzSW1zMjBCOElWakQ1?=
 =?utf-8?B?QVFEMTZDc2tQN25Hdjk3cUlqT25rbkRldll3TTRjTk5qbzhrd1cxaHpEQWtF?=
 =?utf-8?B?czJpMWNtK0FpWWUxVGlpMEFIUnNqQ2dOODhXOWlyU3RxYzh6ZUNvNzNZeTdU?=
 =?utf-8?B?QXU5cldRbnQ0dzcwaTFpcUdZQ2dsU3BNTEh6NnNUUmxWRzAwVHhXZVluMVNC?=
 =?utf-8?B?NS8rYktqYjlJa1NCWW1zMTcrcElwTURJTytyUGt1M3htTThDZjloUEJXZ0pT?=
 =?utf-8?B?NjljL1pwM2Rxays3d3diTUx2K1NOeWVsQk5CbUxWcTdrNzVQTU04bkg3WGhn?=
 =?utf-8?B?UkVEejRZd2ttbkg4cGRBcGJBdzlwU1lpYkxoZDQvQjdGS3Ftbi9ub1ZZMlRG?=
 =?utf-8?B?amlxdXlFTW02WFFUbGVRT25GeFVndkJ6NUpoRDVSV1RmRjZodVFXVmtna0JE?=
 =?utf-8?B?RkZPM1kxQmlTUnMvSFZKaS82UkV1OEdhK2FUeEpkZmZWMVFqM2R2N0Rnai93?=
 =?utf-8?B?MG9LcVRjSUlRSkZIaGI3RVZQaG5Xbm90Sm5KY2lQUFRQYktPSFl5MVFZNi8r?=
 =?utf-8?B?ckpZQlZVYlVPUEJMNElaR2ZsSGloVmlmWHd4bDRmUXdVaUNEZXZRU0p4dmNj?=
 =?utf-8?B?TnNBTVdOeTJEeG81d25yRHJJZlNSWktFcWxOb0NkY0VOdERCSkJEMmdVWDBI?=
 =?utf-8?B?VHBxeUlnaE50ZEtjUkJKS3BlS2pPQzNMd084QkRDYmdmUWRFWXMrTUN2MFE4?=
 =?utf-8?B?MnJReURERzJDMkJqYTUyVjJrZWJyTkpmazl4OWtEUlRONFNaRGVrcUZ1MDlG?=
 =?utf-8?B?ZFNzYUJOQ09FVU45d3VUWnc2S211VEdkalhKR0lPVmtZN2JsaUVPR3V5dXdN?=
 =?utf-8?B?QlNrK2lxb3plWitOc05wN2wwZW9VSkFKNjhrTTRpR3g0L1RsWXlQOTYweUph?=
 =?utf-8?B?czVJWjltU2t6enY3YVhDeFdVcmlaY0N5RmVKd2lnallwQTMxV2F1Y2lHUW80?=
 =?utf-8?B?WjBaVXNPYjJHR2hyTWJNT3psVVNaSTA4cXpGY1ZuK1JYUjRrUHRGc1JOcGR2?=
 =?utf-8?Q?XrpPyK3clXFYg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edc3c8d5-61c6-4092-13c6-08d898b8686f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2020 00:55:06.4960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZC9u15xlPO2/Dhvz5T+sAm5gCW1Dr5fEXlOSw/eAKbqQBq0GHNLL4uHj5a1iPH8EDUDP2+9WpeNKeR551XqcCWQrVRxQfpS5H9qiU0AOz9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3494
X-OriginatorOrg: intel.com
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
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

DQoNCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IExhcnMtUGV0ZXIg
Q2xhdXNlbiA8bGFyc0BtZXRhZm9vLmRlPg0KPiA+IFNlbnQ6IDAxIERlY2VtYmVyIDIwMjAgNDoy
MiBQTQ0KPiA+IFRvOiBTaGV2Y2hlbmtvLCBBbmRyaXkgPGFuZHJpeS5zaGV2Y2hlbmtvQGludGVs
LmNvbT4NCj4gPiBDYzogU2l0LCBNaWNoYWVsIFdlaSBIb25nIDxtaWNoYWVsLndlaS5ob25nLnNp
dEBpbnRlbC5jb20+Ow0KPiBTaWEsIEplZQ0KPiA+IEhlbmcgPGplZS5oZW5nLnNpYUBpbnRlbC5j
b20+OyBwaWVycmUtDQo+IGxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tOw0KPiA+IFJvamV3
c2tpLCBDZXphcnkgPGNlemFyeS5yb2pld3NraUBpbnRlbC5jb20+Ow0KPiA+IGxpYW0uci5naXJk
d29vZEBsaW51eC5pbnRlbC5jb207IHZrb3VsQGtlcm5lbC5vcmc7DQo+IHRpd2FpQHN1c2UuY29t
Ow0KPiA+IGJyb29uaWVAa2VybmVsLm9yZzsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnDQo+
ID4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMi80XSBBU29DOiBzb2MtZ2VuZXJpYy1kbWFlbmdp
bmUtDQo+IHBjbTogQWRkDQo+ID4gY3VzdG9tIHByZXBhcmUgYW5kIHN1Ym1pdCBmdW5jdGlvbg0K
PiA+DQouLi4NCj4gPiA+IFdoeSBzaG91bGQgd2Ugc3BsaXQgdGhhbiByZXNwbGl0IGlmIHdlIG1h
eSBkbyBpdCBpbiBvbmUgZ28/DQo+ID4gPiBXaHkgdGhlbiB3ZSBoYXZlIERNQSBjYXBhYmlsaXRp
ZXMgcmV0dXJuZWQgdG8gdGhlDQo+IGNvbnN1bWVycy4NCj4gPiA+DQo+ID4gPiBTbywgSSBoYXZl
IHRoYXQgd2UgbmVlZCB0byBvcHRpbWl6ZSBETUEgU0cgbGlzdCBwcmVwYXJhdGlvbg0KPiBpbiBh
IHdheQ0KPiA+ID4gdGhhdCBjb25zdW1lciBnZXRzIFNHIGxpc3QgY29va2VkIGluIGFjY29yZGFu
Y2Ugd2l0aCBETUENCj4gPiBsaW1pdGF0aW9ucyAvIHJlcXVpcmVtZW50cy4NCj4gPg0KPiA+IFRo
ZSBBUEkgdGhhdCB0aGUgYXVkaW8gZHJpdmVycyB1c2UgcmVxdWVzdCBhIHBlcmlvZCBETUENCj4g
dHJhbnNmZXIgZm9yDQo+ID4gbGVuZ3RoIE4gc3BsaXQgaW50byBNIHNlZ21lbnRzIHdpdGggdGhl
IGNhbGxiYWNrIGJlaW5nIGNhbGxlZA0KPiBhZnRlcg0KPiA+IGVhY2ggc2VnbWVudC4NCj4gPg0K
PiA+IEhvdyB0aGF0IGlzIGltcGxlbWVudGVkIGludGVybmFsbHkgaW4gdGhlIERNQSBkb2VzIG5v
dCBtYXR0ZXINCj4gYXMgbG9uZw0KPiA+IGFzIGl0IG1hdGNoZXMgdGhvc2Ugc2VtYW50aWNzLiBF
LmcuIGlmIHRoZSBzZWdtZW50IGlzIGxvbmdlciB0aGFuDQo+IHdoYXQNCj4gPiB0aGUgRE1BIGNh
biBoYW5kbGUgaXQgY2FuIHNwbGl0IGl0IGludG8gdHdvIHNlZ21lbnRzIGludGVybmFsbHkNCj4g
YW5kDQo+ID4gY2FsbCB0aGUgY2FsbGJhY2sgZXZlcnkgc2Vjb25kIHNlZ21lbnQuDQo+ID4NCj4g
PiBUaGUgd2F5IHRoaXMgQVBJIHdvcmtzIHRoZXJlIGlzbid0IGV2ZW4gcmVhbGx5IGEgcG9zc2li
aWxpdHkgZm9yDQo+IHRoZQ0KPiA+IGNsaWVudCBzaWRlIHRvIHNwbGl0IHBlcmlvZGljIHRyYW5z
ZmVycy4NCj4gPg0KPiA+IEJ0dy4gMTAyNCBiZWF0cyBwZXIgc2VnbWVudCBzZWVtcyBleGNlc3Np
dmVseSBzbWFsbCwgSSBkb24ndA0KPiA+IHVuZGVyc3RhbmQgaG93IHNvbWVib2R5IHdvdWxkIGRl
c2lnbiBzdWNoIGFuIERNQS4gV2FzDQo+IHRoZSBhc3N1bXB0aW9uDQo+ID4gdGhhdCB0aGUgRE1B
IHdpbGwgbmV2ZXIgdHJhbnNmZXIgbW9yZSB0aGFuIFBBR0VfU0laRSBvZg0KPiBjb250aWd1b3Vz
DQo+ID4gbWVtb3J5PyBPciBkbyB3ZSBub3QgdW5kZXJzdGFuZCB0aGUgZG9jdW1lbnRhdGlvbg0K
PiBjb3JyZWN0bHk/DQo+IFs+Pl0gVGhlIHNlZ21lbnQgc2l6ZSBpcyAxMDI0IGl0ZW1zLiBUaGUg
aXRlbSBzaXplIGNvdWxkIGJlIDhiaXRzLA0KPiAxNmJpdHMgb3IgMzJiaXRzLiBTbywgc2V0X21h
eF9zZWdfc2l6ZSgpIGlzIHNldCB0byAxMDI0KjRieXRlcy4NCj4gDQo+IA0KPiA+DQo+ID4gLSBM
YXJzDQoNCkhpIEFsbCwNCiANCkluIG9yZGVyIHRvIGZ1bGZpbCBBbmR5IHJlcXVlc3Qgb24gb3B0
aW1pemluZyB0aGUgbGlua2VkLWxpc3QgYXQgdGhlIERNQSBjbGllbnQgc2lkZSwgd2UgcHJvcG9z
ZWQgYSBmZXcgY2hhbmdlcyB0byB0aGUgc29jLWdlbmVyaWMtIGRtYWVuZ2luZSBhbmQgRE1BRU5H
SU5FIEFQSSBkdWUgdG8gdGhlIEF4aURNQSdzIG5hdHVyZSBvcGVyYXRpb24gaW4gbnVtYmVyIG9m
IGl0ZW1zLg0KIA0KQWRkIE5ldyBETUFFTkdJTkUgQVBJOg0KLy8gRm9yIERNQSBkcml2ZXIgdG8g
c2V0IHRoZSBtYXggaXRlbXMgaW4gYSBzZWdtZW50IDEuIGRtYV9zZXRfbWF4X3NlZ19pdGVtcyhz
dHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBzaXplKQ0KDQovLyBGb3IgRE1BIGNsaWVu
dCB0byByZXRyaWV2ZSB0aGUgbWF4IGl0ZW1zIHN1cHBvcnRlZCBpbiBhIHNlZ21lbnQgMi4gZG1h
X2dldF9tYXhfc2VnX2l0ZW1zKHN0cnVjdCBkZXZpY2UgKmRldikNCg0KIzEgYW5kICMyIGFib3Zl
IGFyZSB0aGUgY3JpdGljYWwgQVBJIG5lZWRlZCB0byBiZSBleHBvc2VkIHRvIHRoZSBETUEgQ2xp
ZW50cyBzbyB0aGF0IERNQSBDbGllbnRzIGNhbiB1c2UgaXQgdG8gY2FsY3VsYXRlIHRoZSBhcHBy
b3ByaWF0ZSBzZWdtZW50IGxlbmd0aCBiZWZvcmUgcGFzcyBpdCB0byB0aGUgRE1BIGRyaXZlci4N
CklmICMxIGFuZCAjMiBhcmUgTm8gR28sIHRoZW4gc3BsaXR0aW5nIGxpbmtlZC1saXN0IGluIERN
QSBjbGllbnQgY2FuJ3QgYmUgYWNoaWV2ZS4NCg0KQVNvQyBjaGFuZ2VzOg0KMS4gQWRkaW5nIHZh
cmlhYmxlIHRvIHNuZF9wY21faGFyZHdhcmUgdG8gc3RvcmUgRE1BIGxpbWl0YXRpb24gaW5mb3Jt
YXRpb24uDQoyLiBzb2MtZ2VuZXJpYy1kbWFlbmdpbmUtcGNtIHRvIHJlZ2lzdGVyIERNQSBsaW1p
dGF0aW9uIGV4cG9zZWQgYnkgRE1BIGRyaXZlciB1c2luZyBBUEkgcHJvdmlkZWQgYWJvdmUuDQoz
LiBkbWFlbmdpbmVfcGNtX3ByZXBhcmVfYW5kX3N1Ym1pdCBpbiBwY21fZG1hZW5naW5lLmMgdG8g
Y2hlY2sgdGhlIG51bWJlciBvZiBpdGVtcyBuZWVkZWQgY2FsY3VsYXRlZCBmcm9tIHVzZXJzcGFj
ZSBhbmQgY29uZmlndXJlIHRoZSBkbWEgYWNjb3JkaW5nbHkgaWYgdGhlIG51bWJlciBvZiBpdGVt
cyBleGNlZWRzIHRoZSBETUEgaXRlbXMgbGltaXRhdGlvbi4NCjQuIGRtYWVuZ2luZV9wY21fZG1h
X2NvbXBsZXRlIGluIHBjbV9kbWFlbmdpbmUuYyB0byBjaGVjayB0aGUgbnVtYmVyIG9mIGl0ZW1z
IG5lZWRlZCBjYWxjdWxhdGVkIGZyb20gdXNlcnNwYWNlIGFuZCB1cGRhdGUgcG9zaXRpb24gYWNj
b3JkaW5nIHRvIERNQSBsaW1pdGF0aW9uLCB0byB0cmlnZ2VyIHBlcmlvZF9lbGFwc2UgYXBwcm9w
cmlhdGVseS4NCg0KQWxsIG9mIHRoZSBhYm92ZSBhcmUgbmVlZGVkIGluIG9yZGVyIHRvIGZhY2ls
aXRhdGUgc3RvcmluZyBvZiB0aGUgRE1BIGxpbWl0YXRpb24gaW5mbyBhbmQgdXNpbmcgdGhlIGlu
Zm8gdG8gY29uZmlndXJlIHRoZSBETUEgYXBwcm9wcmlhdGVseSB3aXRoaW4gdGhlIERNQSBsaW1p
dHMuDQojMyBhbmQgIzQgaW1wbGVtZW50cyBhIGNoZWNrIGFnYWluc3QgdGhlIG51bWJlciBvZiBp
dGVtcyBuZWVkZWQgYmFzZWQgb24gdXNlcnNwYWNlIHByb3ZpZGVkIGluZm9ybWF0aW9uIGFuZCB0
aGUgRE1BIGl0ZW0gbGltaXQsIGlmIHRoZSBsaW1pdCBpcyBleGNlZWRlZCwgdGhlIG1heGltdW0g
bGltaXQgb2YgdGhlIERNQSBpcyB1c2VkIHRvIGNvbmZpZ3VyZSB0aGUgRE1BIHRyYW5zZmVycy4N
CmUuZy4NCmJ5dGVzX3RvX3NhbXBsZXMgcmV0dXJucyBhIHZhbHVlIGhpZ2hlciB0aGFuIHRoZSBt
YXhpbXVtIGl0ZW0gbGltaXQgb2YgdGhlIERNQSwgdGhlIGRyaXZlciB3aWxsIHBhc3MgdGhlIG1h
eGltdW0gdXNhYmxlIGxpbWl0IG9mIHRoZSBETUEgdXNpbmcgc2FtcGxlc190b19ieXRlcyB0byB0
aGUgRE1BIGRyaXZlci4gVGhpcyB3aWxsIG1ha2UgdGhlIERNQSBkcml2ZXIgdG8gdXNlIGxvbmdl
ciBsaW5rZWQtbGlzdCBhbmQgd291bGQgbm90IG5lZWQgdG8gZG8gdGhlIHJlc3BsaXR0aW5nIGF0
IHRoZSBETUEgZHJpdmVyLg0KDQpCZWxvdyBpcyB0aGUgc25hcHNob3Qgb2YgdGhlIGNvZGUgc2hv
d2luZyBob3cgc29jLWdlbmVyaWMtIGRtYWVuZ2luZSBtYWtlIHVzZSBvZiB0aGUgbmV3IEFQSSB0
byBjYWxjdWxhdGUgdGhlIHNlZ21lbnQgbGVuZ3RoLg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQpDb2RlIGNoYW5nZSBpbiBwY20uaA0KDQpzdHJ1Y3Qgc25kX3BjbV9oYXJkd2FyZSB7DQoJ
Li4uLi4uDQoNCglzaXplX3QgYnVmZmVyX2J5dGVzX21heDsJLyogbWF4IGJ1ZmZlciBzaXplICov
DQoJc2l6ZV90IHBlcmlvZF9ieXRlc19taW47CS8qIG1pbiBwZXJpb2Qgc2l6ZSAqLw0KCXNpemVf
dCBwZXJpb2RfYnl0ZXNfbWF4OwkvKiBtYXggcGVyaW9kIHNpemUgKi8NCgl1bnNpZ25lZCBpbnQg
cGVyaW9kc19taW47CS8qIG1pbiAjIG9mIHBlcmlvZHMgKi8NCgl1bnNpZ25lZCBpbnQgcGVyaW9k
c19tYXg7CS8qIG1heCAjIG9mIHBlcmlvZHMgKi8NCglzaXplX3QgZmlmb19zaXplOwkJLyogZmlm
byBzaXplIGluIGJ5dGVzICovDQoNCi0tPiBBZGQgdmFyaWFibGUgZm9yIGRtYSBtYXggaXRlbSBu
dW1iZXJzDQoJZS5nOiB1bnNpZ25lZCBpbnQgZG1hX2l0ZW1fbWF4OwkvKiBtYXggIyBvZiBkbWEg
aXRlbXMgKi8NCg0KCS4uLi4uLg0KfTsNCg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
CkNvZGUgY2hhbmdlIGluIHNvYy1nZW5lcmljLWRtYWVuZ2luZS1wY20uYw0KDQpzdGF0aWMgaW50
DQpkbWFlbmdpbmVfcGNtX3NldF9ydW50aW1lX2h3cGFyYW1zKHN0cnVjdCBzbmRfc29jX2NvbXBv
bmVudCAqY29tcG9uZW50LA0KCQkJCSAgIHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3Ry
ZWFtKSB7DQoJLi4uLi4uDQoNCgltZW1zZXQoJmh3LCAwLCBzaXplb2YoaHcpKTsNCglody5pbmZv
ID0gU05EUlZfUENNX0lORk9fTU1BUCB8IFNORFJWX1BDTV9JTkZPX01NQVBfVkFMSUQgfA0KCQkJ
U05EUlZfUENNX0lORk9fSU5URVJMRUFWRUQ7DQoJaHcucGVyaW9kc19taW4gPSAyOw0KCWh3LnBl
cmlvZHNfbWF4ID0gVUlOVF9NQVg7DQoJaHcucGVyaW9kX2J5dGVzX21pbiA9IDI1NjsNCglody5w
ZXJpb2RfYnl0ZXNfbWF4ID0gZG1hX2dldF9tYXhfc2VnX3NpemUoZG1hX2Rldik7DQoJaHcuYnVm
ZmVyX2J5dGVzX21heCA9IFNJWkVfTUFYOw0KCWh3LmZpZm9fc2l6ZSA9IGRtYV9kYXRhLT5maWZv
X3NpemU7DQoNCi0tPiBBZGQgY29kZSB0byByZWdpc3RlciBNQVhfRE1BX0l0ZW1zIGxpbWl0YXRp
b24gdXNpbmcgQVBJIGV4cG9zZWQgYnkgDQotLT4gZG1hDQoJZS5nOiBody5kbWFfaXRlbV9tYXgg
PSBkbWFfZ2V0X21heF9pdGVtX251bWJlcihkbWFfZGV2KTsNCg0KCS4uLi4uLg0KfQ0KDQotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkNvZGUgY2hhbmdlIGluIHBjbV9kbWFlbmdpbmUuYw0K
DQpzdGF0aWMgdm9pZCBkbWFlbmdpbmVfcGNtX2RtYV9jb21wbGV0ZSh2b2lkICphcmcpIHsNCgku
Li4uLi4NCg0KCXN0cnVjdCBzbmRfcGNtX3J1bnRpbWUgKnJ1bnRpbWUgPSBzdWJzdHJlYW0tPnJ1
bnRpbWU7DQoJaW50IGJsb2NrczsNCg0KLS0+QWRkIGNvZGUgdG8gY29udmVydCBwZXJpb2QgYnl0
ZXMgdG8gbnVtYmVyIG9mIERNQSBpdGVtcyBwYXNzZWQgZG93biANCi0tPmZyb20gdXNlciBzcGFj
ZQ0KCWUuZyA6IGJsb2NrcyA9IGJ5dGVzX3RvX3NhbXBsZXMocnVudGltZSwgc25kX3BjbV9saWJf
cGVyaW9kX2J5dGVzKHN1YnN0cmVhbSkpOw0KLS0+IEFkZCBjb2RlIHRvIGNoZWNrIG51bWJlciBv
ZiBETUEgaXRlbXMgZnJvbSB1c2VyIHNwYWNlIHZzIERNQSANCi0tPiBsaW1pdGF0aW9uIGFuZCB1
cGRhdGUgcG9zaXRpb24gYWNjb3JkaW5nbHkNCgllLmc6DQoNCglpZiAoYmxvY2tzID4gaHcuZG1h
X2l0ZW1fbWF4KQ0KCQlwcnRkLT5wb3MgKz0gc2FtcGxlc190b19ieXRlcyhydW50aW1lLCBNQVhf
RE1BX0JMT0NLUyk7DQoJZWxzZQ0KCQlwcnRkLT5wb3MgKz0gc25kX3BjbV9saWJfcGVyaW9kX2J5
dGVzKHN1YnN0cmVhbSk7DQoNCgkuLi4uLi4NCn0NCg0Kc3RhdGljIGludCBkbWFlbmdpbmVfcGNt
X3ByZXBhcmVfYW5kX3N1Ym1pdChzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSkg
ew0KCS4uLi4uLg0KDQoJc3RydWN0IHNuZF9wY21fcnVudGltZSAqcnVudGltZSA9IHN1YnN0cmVh
bS0+cnVudGltZTsNCglpbnQgYmxvY2tzOw0KDQotLT4gQWRkIGNvZGUgdG8gY29udmVydCBwZXJp
b2QgYnl0ZXMgdG8gbnVtYmVyIG9mIERNQSBpdGVtcyBwYXNzZWQgZG93biANCi0tPiBmcm9tIHVz
ZXIgc3BhY2UNCgllLmc6IGJsb2NrcyA9IGJ5dGVzX3RvX3NhbXBsZXMocnVudGltZSwgc25kX3Bj
bV9saWJfcGVyaW9kX2J5dGVzKHN1YnN0cmVhbSkpOw0KCS4uLi4uLg0KDQotLT4gQWRkIGNvZGUg
dG8gY2hlY2sgaWYgdGhlIG51bWJlciBvZiBibG9ja3MgdXNlZCBleGNlZWQgdGhlIERNQSANCi0t
PiBsaW1pdGF0aW9uIGFuZCBwcmVwYXJlIERNQSBhY2NvcmRpbmcgdG8gbGltaXRhdGlvbiBpbnN0
ZWFkIG9mIA0KLS0+IGluZm9ybWF0aW9uIHRha2VuIGZyb20gdXNlcnNwYWNlDQoJZS5nOg0KCWlm
IChibG9ja3MgPiBody5kbWFfaXRlbV9tYXgpDQoJCWRlc2MgPSBkbWFlbmdpbmVfcHJlcF9kbWFf
Y3ljbGljKGNoYW4sDQoJCQlzdWJzdHJlYW0tPnJ1bnRpbWUtPmRtYV9hZGRyLA0KCQkJc25kX3Bj
bV9saWJfYnVmZmVyX2J5dGVzKHN1YnN0cmVhbSksDQoJCQlzYW1wbGVzX3RvX2J5dGVzKHJ1bnRp
bWUsIE1BWF9ETUFfQkxPQ0tTKSwgZGlyZWN0aW9uLCBmbGFncyk7DQoJZWxzZQ0KCQlkZXNjID0g
ZG1hZW5naW5lX3ByZXBfZG1hX2N5Y2xpYyhjaGFuLA0KCQkJc3Vic3RyZWFtLT5ydW50aW1lLT5k
bWFfYWRkciwNCgkJCXNuZF9wY21fbGliX2J1ZmZlcl9ieXRlcyhzdWJzdHJlYW0pLA0KCQkJc25k
X3BjbV9saWJfcGVyaW9kX2J5dGVzKHN1YnN0cmVhbSksIGRpcmVjdGlvbiwgZmxhZ3MpOw0KDQoJ
Li4uLi4uDQp9DQoNCg==
