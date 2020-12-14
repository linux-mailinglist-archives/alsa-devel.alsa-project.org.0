Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7E62D9208
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 04:26:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96E401719;
	Mon, 14 Dec 2020 04:25:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96E401719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607916369;
	bh=9Jh9kywzesce44gfc/K7UJCNSpYMQ7Qnw3RvzqUCdNo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iDZqd6XQ6hApejTUK4jWUjjU7EReu0nAtkXb+R3BsYmDFMFUGvj1XVekw4/oQpnam
	 IQfuquzTYmSv/YOLrht8BL4EbchupuiadeVwN/gP17Wxa/KdXI+c/7FKqpJSfUVS3w
	 QioAm+Ne3JB0oi/ZzApCjLQUTFqN2P0SpkTiq2zI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE8B4F800ED;
	Mon, 14 Dec 2020 04:24:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CF9CF801F7; Mon, 14 Dec 2020 04:24:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56516F800ED
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 04:24:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56516F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="FncrfsVH"
IronPort-SDR: asxtHmJl7lUE/RV5RYOkyigSU0ehLLawGKH9R5GXThJmilHGevvTt1UhKchgj7xt9S1MakzeP+
 5vsPxtCgaMuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238751730"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; d="scan'208";a="238751730"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 19:24:06 -0800
IronPort-SDR: /hwUSGnTGAlF4XwlXJ3nXi1a6yRoCee+PUDMzCDylmBcZxH9DdJIetHEElOnlAxRRm0ueb1Axc
 RVUiKX30eJgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; d="scan'208";a="551961518"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 13 Dec 2020 19:24:04 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 13 Dec 2020 19:24:04 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 13 Dec 2020 19:24:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 13 Dec 2020 19:24:03 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 13 Dec 2020 19:24:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWjX7JhXkt5EDgen0vLluC/NoKyBhDXV6cJeBgT9sz7k0J8Q7zwxHfM7FZCgicmyg8Wi87VYoHQfHR4aJ/GwKgG6viKeb9DE7hVBUqEwEoZWz+dySATLFiNkPzI9J0yXv9aQDnFZ9FPitusjD+XPjQhPhVVwhnwlsqHvzKr66cG0LXAiCKZ6n04S32cdzplMgvxY8/rAzT6rakqfjkMrl+87N6wCP7b08CG/uqqZ9RShGkc0gGctQ5FrVSTDNURWrJqR/bBsrouDfbXFHSgmEtI+rKVxY+rSrXsLuMU0BDgRQGBWO7cUFzDSXY3d9L6jId/WFmgvg0Lx1nRC0icUog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Jh9kywzesce44gfc/K7UJCNSpYMQ7Qnw3RvzqUCdNo=;
 b=FecV/4jE2EYJeN9FhjzzN9H7Rpd8MGRc5z+woaSOnhiDa9HP0q5PGpadPr+UlA8bdGkHBdldvy4BmxGFQ9Hy3uT1Dp52Zm93Q87NyJ4xm+Y72RE3r4OqAuI/iKEmzVk+SN/jxdLSM3vAr5b+qLMlJI8mPG0sa0cbSK7yrlVCKIpirPnBHVuNGFkTDjL1z+1dwIEFZzKJdWgy71KbXqDfUwHRVovyfDmTCGtVrQWp/yg6c95X4N+NCqEkYG157FDwhSFnrK/8T7Xhde/NCslXsfco4kOP0uJdVM2NxAHGMpGDkn9EVm0SElnHF4gj5YUqHxm5axN2ATld+UbpTAZTlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Jh9kywzesce44gfc/K7UJCNSpYMQ7Qnw3RvzqUCdNo=;
 b=FncrfsVH3Gt0Un/k9gZ6Umb5NZlpYjOzxOggHQ7OIT6D+/ajKMvyb1kzxlKEOUmzrqN+SA3svOfH28wizhee/eT2vhqp7DsMbIQ0MXN/9y/TJUfSn7xVUpHpuzsWkWAPO01RalafhZmjzWBWazoI8quqkreMjXSSM9h8EvTTomg=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BYAPR11MB3317.namprd11.prod.outlook.com (2603:10b6:a03:7b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Mon, 14 Dec
 2020 03:23:56 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::b544:5491:32e8:f230]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::b544:5491:32e8:f230%3]) with mapi id 15.20.3654.020; Mon, 14 Dec 2020
 03:23:56 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: "Sia, Jee Heng" <jee.heng.sia@intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Subject: RE: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Topic: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Index: AQHWvLmNGvsTxGs990eX9gpk7gsGM6nMeVYAgACSVQCAAO9RgIAIta8AgAnQR9CAABFjgIAABrKAgAFjtACAAA1/AIAFvdWggAO/aoCAAFxvgIAAxP+AgAN4nyCABfWCgA==
Date: Mon, 14 Dec 2020 03:23:56 +0000
Message-ID: <BYAPR11MB3046A010FB842FDF6A2642F09DC70@BYAPR11MB3046.namprd11.prod.outlook.com>
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
 <BYAPR11MB3046A125098F7D5F1A67F9759DCB0@BYAPR11MB3046.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB3046A125098F7D5F1A67F9759DCB0@BYAPR11MB3046.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [121.123.66.105]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3726bd92-80d6-4c4d-7ad0-08d89fdfb0e7
x-ms-traffictypediagnostic: BYAPR11MB3317:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3317F2B49DBC5E075E3B3C6D9DC70@BYAPR11MB3317.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UV1kpnpyPeHctLl8ZP2nniCPBKXiFhH9C/QbdRhGuLSjYNV3mkJBpH/y1uUXomI9kOSc69HIs8yA1jC7jNm9xWN++Sd8sKT4GyyvE1AyaeQD2syM6fJDx6mvrjOGnJYYjrSqTElijb8nVmBGvcAlXgTgQRqqckxlQTw5jrm68oYGOh3M3v4abBku6wZW+nge6VbyPybsbN+Ucnkz3dmjXg78Ez9BU3VkuKb0upnasb/qdI2URWweL84IDOirUf42dz8PYbsT7DqCSVTeTjpnmxfmmhD9XcSqGCpiHmdIUki7+R5jbVHojhal4O6dO8+yHiu5j+1e2VjaRqORRNzygSzUNun5gL3tFg3Cx5bcAnU20XUYztLHXOqNPfVWorHY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(66446008)(86362001)(110136005)(7696005)(66556008)(55016002)(8936002)(9686003)(508600001)(71200400001)(2906002)(33656002)(5660300002)(64756008)(8676002)(66476007)(83380400001)(186003)(66946007)(52536014)(54906003)(6506007)(6636002)(26005)(76116006)(4326008)(53546011)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cTdUZW1xZEVqZGdOajM4SFZWOFBWRkxOVDRlMHNkakV6REdVY3VJMG9jRUU5?=
 =?utf-8?B?bHNQZ2pnd09TYjNnekt0dG9zSkpyRXB2WHNBWUFvMHhlYmw1eUJLM01CelRu?=
 =?utf-8?B?MURCbDRpc1dLb3RIaER6TUtDaUJoV0U4SkVyTGJ6dUVULzVwVGNzaXBTWGVX?=
 =?utf-8?B?L0FraFcvTGlOVGtqQXp1aEpkZkFad003czRKTzllU1drd00ya0wwbTlVOEk3?=
 =?utf-8?B?bWJwNGFlaDM1dzdrOXpLNHlZU25SbnFjWGhoRG80UmE0MVh1UW0wVDRodkM4?=
 =?utf-8?B?TVdsMHVQSTdEQTUrejRNQjR3TGR2cWg5Nkg2SktFR2dEckk3ZGJacnpqazZ6?=
 =?utf-8?B?czJMemMrZjQ4WnREa2NYRWZ2OElGOGFrOU5jTlR5TFBnWG1VVG00MTlrbDRq?=
 =?utf-8?B?NnRPejdPWUY3cXVLOXdYbDJacFNzM0xuK1lxZHF4UVNZU0FuUFROUGZYL2M3?=
 =?utf-8?B?UTI4ODU5Ri9xZzNSZkV1Z3VQbFBHNVBNd2M4TnI1QzcveDA5eFhRdDgwTjdF?=
 =?utf-8?B?N2JYUDBrUjNMMmlLM1JkRk9yNHFtcFJLMkQxL2R6S0ZsUjAyOGhOYTVMTUIv?=
 =?utf-8?B?YWlYNWJTcTFFcU9Qckg0TzlheFIvdXNCWHhVNlJjVWN1M0xJZWliVUNXWnRv?=
 =?utf-8?B?NGlNaTExdVZvNU10RUQ3R2h5TEwvQjNNYXpFdk92ZjhWRnVLTUgrRnp4Q2Fh?=
 =?utf-8?B?Vk9yK3M4NTVzV1RLQzM3bkdHNEl1MmkvRVBReXZ5eGxUK3h3QWExcm5Pc0ZR?=
 =?utf-8?B?YUcwTk1GM2QxeXd4M1c2YWZTVmNSTXBqTDRsLzRqV1ZTMlBRcjFzL0NQdWxS?=
 =?utf-8?B?MnBvelRkd3VzK0ptWEg5VWxtM0kyeEFEVnBnUGl3eDgrV2pvdllEcXFrc1FT?=
 =?utf-8?B?S21KOWd4YlV6Uy9mdTFFNmhjQ3psTmZCaFNXNEcvTHJMWHRQY091VGVaTXJO?=
 =?utf-8?B?YWdnOTRQdzVYcTJ5Qm5MWEoyNTZaWjlRMDNyQW5uRC80amJFd3czUFlPTk40?=
 =?utf-8?B?L0RlOHUyYkRmejFWM25udlMvai9zczNBZnk4NDJxTlp6SXhJV2NmbnYxaER3?=
 =?utf-8?B?aDBSYit0NitncWpMeUlzR1JhVFVuTVUyZGVkZTZ1MHdpTDBEeDdSZnVJTmo0?=
 =?utf-8?B?QUc1eW5TanY3aE9EaFZwWXh3YkNQakJ1YkdwMzd0S0N1Qm8yL0JrRXcyRERm?=
 =?utf-8?B?d3Evdk1QRVhVaHZmVlY1dDJqbE5pVlo5cUcvaWxQSnA1cUhJQURUMWZteUpU?=
 =?utf-8?B?ZGlhNmZvaWUySGpYVjIxWHJLNm1naDVSSHBHRHBNWkJHS0Y4WUQvdVNaVmNq?=
 =?utf-8?Q?pwEeDl+UaBWoM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3726bd92-80d6-4c4d-7ad0-08d89fdfb0e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2020 03:23:56.6629 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m6YPcdXtxCHz5d7jScbLPqIVLGhng+XmZjMdd/GdS4DJjY9ygDlgul9YNI27c1bhc6Vhjyj7iYL0msItXreDP4RLrKROik09BrxK2MX7lk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3317
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2l0LCBNaWNoYWVsIFdl
aSBIb25nDQo+IFNlbnQ6IFRodXJzZGF5LCAxMCBEZWNlbWJlciwgMjAyMCA0OjI0IFBNDQo+IFRv
OiBTaWEsIEplZSBIZW5nIDxqZWUuaGVuZy5zaWFAaW50ZWwuY29tPjsgUGllcnJlLUxvdWlzIEJv
c3NhcnQNCj4gPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT47IExhcnMtUGV0
ZXIgQ2xhdXNlbg0KPiA8bGFyc0BtZXRhZm9vLmRlPjsgU2hldmNoZW5rbywgQW5kcml5DQo+IDxh
bmRyaXkuc2hldmNoZW5rb0BpbnRlbC5jb20+DQo+IENjOiBSb2pld3NraSwgQ2V6YXJ5IDxjZXph
cnkucm9qZXdza2lAaW50ZWwuY29tPjsgYWxzYS0NCj4gZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsg
dGl3YWlAc3VzZS5jb207DQo+IGxpYW0uci5naXJkd29vZEBsaW51eC5pbnRlbC5jb207IHZrb3Vs
QGtlcm5lbC5vcmc7DQo+IGJyb29uaWVAa2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSRTogW1JGQyBQ
QVRDSCAyLzRdIEFTb0M6IHNvYy1nZW5lcmljLWRtYWVuZ2luZS1wY206DQo+IEFkZCBjdXN0b20g
cHJlcGFyZSBhbmQgc3VibWl0IGZ1bmN0aW9uDQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBTaWEsIEplZSBIZW5nIDxqZWUuaGVuZy5zaWFAaW50
ZWwuY29tPg0KPiA+IFNlbnQ6IFR1ZXNkYXksIDggRGVjZW1iZXIsIDIwMjAgMTE6MjEgQU0NCj4g
PiBUbzogUGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4Lmlu
dGVsLmNvbT47DQo+ID4gTGFycy1QZXRlciBDbGF1c2VuIDxsYXJzQG1ldGFmb28uZGU+OyBTaXQs
IE1pY2hhZWwgV2VpIEhvbmcNCj4gPiA8bWljaGFlbC53ZWkuaG9uZy5zaXRAaW50ZWwuY29tPjsg
U2hldmNoZW5rbywgQW5kcml5DQo+ID4gPGFuZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNvbT4NCj4g
PiBDYzogUm9qZXdza2ksIENlemFyeSA8Y2V6YXJ5LnJvamV3c2tpQGludGVsLmNvbT47IGFsc2Et
DQo+ID4gZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgdGl3YWlAc3VzZS5jb207DQo+ID4gbGlhbS5y
LmdpcmR3b29kQGxpbnV4LmludGVsLmNvbTsgdmtvdWxAa2VybmVsLm9yZzsNCj4gYnJvb25pZUBr
ZXJuZWwub3JnDQo+ID4gU3ViamVjdDogUkU6IFtSRkMgUEFUQ0ggMi80XSBBU29DOiBzb2MtZ2Vu
ZXJpYy1kbWFlbmdpbmUtcGNtOg0KPiA+IEFkZCBjdXN0b20gcHJlcGFyZSBhbmQgc3VibWl0IGZ1
bmN0aW9uDQo+ID4NCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+ID4gRnJvbTogUGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS0NCj4gPiBsb3Vpcy5ib3Nz
YXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gPiA+IFNlbnQ6IDA3IERlY2VtYmVyIDIwMjAgMTE6MzYg
UE0NCj4gPiA+IFRvOiBMYXJzLVBldGVyIENsYXVzZW4gPGxhcnNAbWV0YWZvby5kZT47IFNpdCwg
TWljaGFlbCBXZWkNCj4gPiBIb25nDQo+ID4gPiA8bWljaGFlbC53ZWkuaG9uZy5zaXRAaW50ZWwu
Y29tPjsgU2lhLCBKZWUgSGVuZw0KPiA+ID4gPGplZS5oZW5nLnNpYUBpbnRlbC5jb20+OyBTaGV2
Y2hlbmtvLCBBbmRyaXkNCj4gPiA+IDxhbmRyaXkuc2hldmNoZW5rb0BpbnRlbC5jb20+DQo+ID4g
PiBDYzogUm9qZXdza2ksIENlemFyeSA8Y2V6YXJ5LnJvamV3c2tpQGludGVsLmNvbT47IGFsc2Et
DQo+ID4gZGV2ZWxAYWxzYS0NCj4gPiA+IHByb2plY3Qub3JnOyB0aXdhaUBzdXNlLmNvbTsNCj4g
bGlhbS5yLmdpcmR3b29kQGxpbnV4LmludGVsLmNvbTsNCj4gPiA+IHZrb3VsQGtlcm5lbC5vcmc7
IGJyb29uaWVAa2VybmVsLm9yZw0KPiA+ID4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMi80XSBB
U29DOiBzb2MtZ2VuZXJpYy1kbWFlbmdpbmUtDQo+ID4gcGNtOiBBZGQNCj4gPiA+IGN1c3RvbSBw
cmVwYXJlIGFuZCBzdWJtaXQgZnVuY3Rpb24NCj4gPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+
ID4gPiA+IElmIHlvdSByZWFsbHkgd2FudCB0byBsaW1pdCB5b3VyIHBlcmlvZCBzaXplIHlvdSBu
ZWVkIHRvIGluc3RhbGwNCj4gYQ0KPiA+ID4gPiByYW5nZSBjb25zdHJhaW50IG9uIHRoZQ0KPiA+
IFNORFJWX1BDTV9IV19QQVJBTV9QRVJJT0RfU0laRQ0KPiA+ID4gcGFyYW1ldGVyLg0KPiA+ID4g
Pg0KPiA+ID4gPiBCdXQgSSdkIGhpZ2hseSByZWNvbW1lbmQgYWdhaW5zdCBpdCBhbmQganVzdCBz
cGxpdCB0aGUNCj4gdHJhbnNmZXINCj4gPiBpbnRvDQo+ID4gPiA+IG11bHRpcGxlIHNlZ21lbnRz
IGluIHRoZSBETUEgZHJpdmVyLiBOZWVkbGVzc2x5IGxpbWl0aW5nIHRoZQ0KPiA+IHBlcmlvZA0K
PiA+ID4gPiBzaXplIHdpbGwgaW5jcmVhc2UgdGhlIG51bWJlciBvZiBpbnRlcnJ1cHRzIGR1cmlu
ZyBhdWRpbw0KPiA+ID4gPiBwbGF5YmFjay9yZWNvcmRpbmcgYW5kIGh1cnQgdGhlIHBvd2VyIGVm
ZmljaWVuY3kgb2YgeW91cg0KPiA+IHN5c3RlbS4NCj4gPiA+DQo+ID4gPiBZZXMgdGhhdCB3YXMg
YWxzbyBhbiBvYmplY3Rpb24gZnJvbSBtZSwgdGhlIGZpeCBzaG91bGQgYmUgaW4NCj4gdGhlDQo+
ID4gRE1BDQo+ID4gPiBsZXZlbC4gVGhlIDEwMjQgYmxvY2sgbGltaXRhdGlvbiB3b3VsZCBtZWFu
IHJlc3RyaWN0aW5nIHRoZQ0KPiA+IHBlcmlvZA0KPiA+ID4gc2l6ZSB0byBiZSBhdCBtb3N0IDUu
MyBvciAxMC42bXMgKDE2IGFuZCAzMi1iaXQgY2FzZXMpLiBUaGF0J3MNCj4gd2F5DQo+ID4gdG8g
c21hbGwuDQo+ID4gWz4+XSBTZWVtcyBsaWtlIGNvbXBsZXhpdHkgaW5jcmVhc2VzIGlmIHNwbGl0
dGluZyB0aGUgc2VnbWVudHMgaW4NCj4gPiBBU29DLiBUaGlzIGlzIG5vdCBhIGZyYW1ld29yayBp
c3N1ZSBub3IgYXJjaGl0ZWN0dXJlIGlzc3VlLg0KPiA+IElmIGludHJvZHVjaW5nIG5ldyBBUEkg
dG8gRE1BRU5HSU5FIHRvIGNvbnN0cmFpbnQgdGhlIG51bWJlcg0KPiBvZiBpdGVtcw0KPiA+IGlz
IG5vdCByZWNvbW1lbmRlZCwgdGhlbiBsZXRzIHNwbGl0IHRoZSBzZWdtZW50cyBpbiBETUEgZHJp
dmVyLg0KPiANCj4gV2l0aCB0aGUgaW5jcmVhc2VkIGNvbXBsZXhpdHkgb2YgaW50cm9kdWNpbmcg
bmV3IEFQSXMgY2FuIHdlDQo+IG1vdmUgdGhlIHNlZ21lbnQgc3BsaXR0aW5nIHRvIHRoZSBETUEg
ZHJpdmVyPw0KPiBBbnltb3JlIGNvbmNlcm5zIHdpdGggZG9pbmcgc28/DQoNCklmIHRoZXJlIGFy
ZSBubyBtb3JlIGNvbW1lbnRzIG9uIHRoaXMsIEkgd2lsbCBzdGFydCBjbGVhbmluZyB1cCB0aGUg
Y29kZSB0byByZW1vdmUgdGhlIERNQSBzcGxpdHRpbmcgaW4gdGhlIEFTb0MgbGF5ZXIsIGFuZCBw
dXNoIHRoZSBjb2RlIGZvciByZXZpZXcgc29vbi4NClRoZSBETUEgc2VnbWVudCBzcGxpdHRpbmcg
d2lsbCBiZSBkb25lIGluIHRoZSBETUEgZHJpdmVyIGluc3RlYWQuDQoNCg==
