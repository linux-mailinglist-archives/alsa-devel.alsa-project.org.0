Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDE72C9B15
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 10:12:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8731917A4;
	Tue,  1 Dec 2020 10:11:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8731917A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606813951;
	bh=L9MKlj8R9ZTUwUEbcoxbe9R7Opr4GIVYYaVb//kDNcE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZUvbBnq1Z58CBgKRK29Hz0jIED+/pOCmoKOh/PgDf2Zutq4Uq8S09kN3ojZVlZGiY
	 xryRjSn8BOvIzavD9zLbg+ls6+q6ifchSnUnfiaspdJ2ZM82nEKU3WIYNqR7RlOuJZ
	 zz34PP9BH6J0svX8bMRDaAloHzNPEdf/WxB6JeJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6792F80168;
	Tue,  1 Dec 2020 10:10:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E04DCF80139; Tue,  1 Dec 2020 10:10:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6812FF80139
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 10:10:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6812FF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="m2DamJq0"
IronPort-SDR: RhccC2Y4OEhjL28y0wmK8Fclh0IZX0Ul4QWANvdH/uNtfVVepdNUt3p2aqD7GGHKsKmrV/X+3h
 z0JGTGy6YNXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="160565146"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="160565146"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 01:10:44 -0800
IronPort-SDR: tc8WD9yCKP4pjDmD4n/KfA6iBVH/XQ/hnrG5SqitoZz+kLSWscH2ZG0kKQv7eZ153co/EThgqA
 /Lam6cJx6AOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="315596463"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga007.fm.intel.com with ESMTP; 01 Dec 2020 01:10:43 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 1 Dec 2020 01:10:42 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 1 Dec 2020 01:10:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 1 Dec 2020 01:10:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 1 Dec 2020 01:10:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esqPb4PWyQtXQswnBR9rpJCHwoFmeXQlDFS+lgLZ+Svf6Tfy286ndsghMlAn8Q8lsHBEzWFLhwaSDtsNhvcSZLtLwYFuC40MqPAewL9VRaosu4R/ULRhGnxmcneoWDrUm6tN3ZMLTacW1m1nj0/dd9fXxc5Gg6b/WQZtO7BV7n+ew1+fvWlPfuKbsfHW4uHknlMgTBsq6xBg420lgpVT5JeO61eJm6npj3Z0XkFCWuyTZiUVe9skbAi79mN10Yqj8cRNwiGYdOk9HisvgugdswJd81SulKvO3AuZW3i+iwHI7fg2fykLHLnpfNn8gV4qS87/qizKb4Fbm4GKkzJMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9MKlj8R9ZTUwUEbcoxbe9R7Opr4GIVYYaVb//kDNcE=;
 b=anAbLv0CwzOsVDwlGxpIoJtOtNuluDRtsGyJxAarecP+tkdl4E5Cwb/0zpE5CXlIY8wbo/gOm8xyqbd6eeG2a2Uc/qXsG/dcBLaYEWdeWu3eNoUHd7iBUBeUzJhPDa1CXm6WJE33g24I/c1RfuQ5fkax6J+TNCt/GbMyxuurBtHJaXx4kXVCQXGZjezSRowarcm8+EefGkiB1576TAo423MFqjchjiszeRen8LGfmU2Euawz2+VsiYJ5sp/eIYzKNzELFF/J9S/Bp3IGmSueohVoz/sZXc/LhmUDxKSlq2KLSQCB2HfYX5FkwF3AVOLNmFQban/jr6xCY6+cVZk0Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9MKlj8R9ZTUwUEbcoxbe9R7Opr4GIVYYaVb//kDNcE=;
 b=m2DamJq0qV8JdAR+SWwDsaMT+vTnV7NsddSPOO0k1BQyCMr6QrqjtWSXbMFgeJtuhbhgccdOO3Dsv2NHyitOA8qWRQZtwwN6BXdxcif0TCMiLyi6TueFZoRY/9JvWef6E56+5wlhMnCZ3hZ8ypBJssMXNwWnbJibgJNrWpTe1fM=
Received: from CO1PR11MB5026.namprd11.prod.outlook.com (2603:10b6:303:9c::13)
 by CO1PR11MB4994.namprd11.prod.outlook.com (2603:10b6:303:91::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 1 Dec
 2020 09:10:40 +0000
Received: from CO1PR11MB5026.namprd11.prod.outlook.com
 ([fe80::4820:6e90:3d0e:3b5f]) by CO1PR11MB5026.namprd11.prod.outlook.com
 ([fe80::4820:6e90:3d0e:3b5f%4]) with mapi id 15.20.3611.022; Tue, 1 Dec 2020
 09:10:40 +0000
From: "Sia, Jee Heng" <jee.heng.sia@intel.com>
To: Lars-Peter Clausen <lars@metafoo.de>, "Shevchenko, Andriy"
 <andriy.shevchenko@intel.com>
Subject: RE: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Topic: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Thread-Index: AQHWvLkz/K4udK7YCEaiWD6EQ6aik6nMeVcAgACNiCCAAPQdgIAIspZAgAnXR4CAAA18gIAABrOAgAFjtACAAAhM8A==
Date: Tue, 1 Dec 2020 09:10:40 +0000
Message-ID: <CO1PR11MB502600945CC303756DBBC30ADAF40@CO1PR11MB5026.namprd11.prod.outlook.com>
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
In-Reply-To: <74ed61e1-67d9-d7b7-0619-fbe61ad7a583@metafoo.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: metafoo.de; dkim=none (message not signed)
 header.d=none;metafoo.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cd2a69e-4168-4b05-aaba-08d895d8f996
x-ms-traffictypediagnostic: CO1PR11MB4994:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB4994AFA610B6F60E63ED7BC6DAF40@CO1PR11MB4994.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HKPZLd4zaqKrasILbhsVNML69M17jPOeRMurTXOsSrbWr8kr5M1wMZzXayvo1Fl0fIFt0o3sVySvhALUrI9JngD0qm9uEFfFic9LffCDPg6hxZNDmdWpZLAzXNrHUqVdqN+1zCuHTOly3CSB6ujkVAD+8k7jdroysQ7vYXzjAqrr2m4D2BjpwJtMFzAqVi4HOFezBU4CQdRs9qzrQ9XWgSTUwedm+X4fzxYff/AFQfreKE6muY1WyOzD7Xqd0s/wwe2UiiiNHmViq5ChsH4Q7OfxeAEm7XgV1RQ5MpOpAZeYpb/RMUHGlNYmfMAzPbY4Mipjw7rQO4c10XT2GzFPtkGpjdSzF+9KsKYGaFEzIuA03loxLGDTbXCM9T5Ovnzh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5026.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(7696005)(52536014)(33656002)(316002)(5660300002)(6636002)(8936002)(9686003)(2906002)(8676002)(55016002)(110136005)(54906003)(66556008)(64756008)(76116006)(4326008)(83380400001)(6506007)(66476007)(53546011)(71200400001)(66446008)(66946007)(86362001)(186003)(478600001)(26005)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?b0lhS1FSc3RZYlBSNUZaNEltYVhEWDE0SFk2QUxkNkQ1SDdhMkcwcUt1K2N2?=
 =?utf-8?B?T2NrUkNYNi8ySzNRL0hpT0Qwc1dUczNTbTFhM2lFcFkyeUFEWkJFUDk2SWx6?=
 =?utf-8?B?NStlQklPZWsrMEQ4TVBEMjhNOW1XbmFaSFJCM1dmN0FkSjBmaDNsZHA0N1B0?=
 =?utf-8?B?Yi9TWVM2ZGl3Z09vU3c4blpzRjB5eUlHK0lCSVBONFhuejJsMlhWOFMzK29a?=
 =?utf-8?B?M24vZGQ5bGpWKytwUlFPdWlRM1pWaDVqK1h4MmdjY0c0ZkZGK2p6a0duZXI2?=
 =?utf-8?B?T1dCdnM0U25aRlIycEdsNjBGWis2SVM3d2dFSllPZDB2aGVzV2NlV21lQXV6?=
 =?utf-8?B?ck4rWHJhdmorWUJZcGs5NlBWTG1mV3FZSHRqaFhVK3U5UGhVM2hMMW8vOWlq?=
 =?utf-8?B?bzFqdWxFVy9MNFE1djVBNE1yZTU5Y2NhRHl6eUpwWG4wV0JhT1c3SlNtOGZM?=
 =?utf-8?B?OVFMUE1OQ2VYTlF2ZVpGTjhFN1lGQWk1RjE1b216U0w1VGlOandnd3Y0ZXp0?=
 =?utf-8?B?Z3BFMVhDK0J0Mi81YTlaYlhJeWRZWEFkeENBanBqQS8vYjhmeDNlZUtkU295?=
 =?utf-8?B?V3N3MHcwYnJ0eHFhVmVtT3hwVWpXN3FwelRQK1Q0cFpGRFVvNDFHSVJIV2dw?=
 =?utf-8?B?OHBLaXRZSGk1L1A4LzV3QTlhdVlwekJ5VDFBempUdUF4WDBFemRlQ3ZmczFo?=
 =?utf-8?B?SGRtS0JvT2EwNE0vN0dOYWhlY3IzeEM4eklEcml1eFY5aVVvTlliWG03RG83?=
 =?utf-8?B?citlTEVvYUx2bSsya2M3WmlFWVE1aERIOHVGamkrSFM1cmF1WFFNUmhQYm1o?=
 =?utf-8?B?d0tRbXNJRno0RWZFYnMxd1N1VWJzL2l4WjJuN1F3YmRTOUxvZDFPRmJZekkw?=
 =?utf-8?B?ZVBxUWRZeUY0MXB0Y2pFd1ZqQ1FabXBPaXFTb1FaY2oxTUZZSUJ2ZW5Pd1NR?=
 =?utf-8?B?QWRlQ0FDaTExVVFkTjNQMzBMQ2ZUNGNrQU5GTnhzc1FyNUYwZElVWVFpNTcz?=
 =?utf-8?B?QllJN2Q4LzZ0SThMM1ZDaWwxelloZkR0M3FiZ2tTbGpGNmQ4K01xbGVDL3JU?=
 =?utf-8?B?eG9OdWl3MlJwWkxrc3NORW5paCtKa1Q3WXJPSngxM3RtSGlPVWRVYkJZL3VB?=
 =?utf-8?B?VEMxdmpDdys1RFFCL0svalJva2hlcThESi8rY0VMaW1QODlnM3hhZzF3VEVr?=
 =?utf-8?B?QkVublZVQzRhekhETVFUUDF0SkNvNnJrU2loeVlZM2RDK2xrT3pyeWdtVVNF?=
 =?utf-8?B?VVNUeS9pYzhSWm9zaWU5c3VqY3dXakoweEROTmlVcXl6RDVySWd6bGVOWDFt?=
 =?utf-8?Q?1FdceWJse3+7g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5026.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd2a69e-4168-4b05-aaba-08d895d8f996
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 09:10:40.4934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ElBEkzXf5XKo7WUoSfVwLFaZvKQrYsDbjZfzJUfKzZ3+q4hZWkCTL8FtfHbrRk5bZgcJQJgJ7hxCLDFwIne+Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4994
X-OriginatorOrg: intel.com
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGFycy1QZXRlciBDbGF1
c2VuIDxsYXJzQG1ldGFmb28uZGU+DQo+IFNlbnQ6IDAxIERlY2VtYmVyIDIwMjAgNDoyMiBQTQ0K
PiBUbzogU2hldmNoZW5rbywgQW5kcml5IDxhbmRyaXkuc2hldmNoZW5rb0BpbnRlbC5jb20+DQo+
IENjOiBTaXQsIE1pY2hhZWwgV2VpIEhvbmcgPG1pY2hhZWwud2VpLmhvbmcuc2l0QGludGVsLmNv
bT47IFNpYSwgSmVlDQo+IEhlbmcgPGplZS5oZW5nLnNpYUBpbnRlbC5jb20+OyBwaWVycmUtbG91
aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb207DQo+IFJvamV3c2tpLCBDZXphcnkgPGNlemFyeS5y
b2pld3NraUBpbnRlbC5jb20+Ow0KPiBsaWFtLnIuZ2lyZHdvb2RAbGludXguaW50ZWwuY29tOyB2
a291bEBrZXJuZWwub3JnOyB0aXdhaUBzdXNlLmNvbTsNCj4gYnJvb25pZUBrZXJuZWwub3JnOyBh
bHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMi80
XSBBU29DOiBzb2MtZ2VuZXJpYy1kbWFlbmdpbmUtcGNtOiBBZGQNCj4gY3VzdG9tIHByZXBhcmUg
YW5kIHN1Ym1pdCBmdW5jdGlvbg0KPiANCj4gT24gMTEvMzAvMjAgMTI6MDkgUE0sIFNoZXZjaGVu
a28sIEFuZHJpeSB3cm90ZToNCj4gPiBPbiBNb24sIE5vdiAzMCwgMjAyMCBhdCAxMTo0NToxN0FN
ICswMTAwLCBMYXJzLVBldGVyIENsYXVzZW4NCj4gd3JvdGU6DQo+ID4+IE9uIDExLzMwLzIwIDEw
OjU3IEFNLCBTaXQsIE1pY2hhZWwgV2VpIEhvbmcgd3JvdGU6DQo+ID4+PiBJcyB0aGVyZSBhbnlt
b3JlIGNvbW1lbnQgb24gdGhpcyBSRkM/DQo+ID4+PiBXZSB3aWxsIGJlIHVzaW5nIHRoZSBBU29D
IGZyYW1ld29yayB0byBzcGxpdCB0aGUgbGlua2VkLWxpc3QsIHNpbmNlDQo+IHJlc3BsaXR0aW5n
IHRoZSBsaW5rZWQtbGlzdCBpbiBETUEgaXMgYSBubyBnby4NCj4gPj4+IElmIHRoZXJlIGlzbid0
IGFueSBtb3JlIGNvbW1lbnRzLCB3ZSB3aWxsIHB1c2ggdGhlc2UgcGF0Y2hlcyBmb3INCj4gcmV2
aWV3IGFuZCBtZXJnaW5nLg0KPiA+PiBXaHkgaXMgc3BsaXR0aW5nIHRoZSBsaXN0IGluIHRoZSBE
TUFlbmdpbmUgZnJhbWV3b3JrIGEgbm8gZ28/DQo+ID4+DQo+ID4+IFRoZSB3aG9sZSBpZGVhIG9m
IHRoZSBETUFlbmdpbmUgZnJhbWV3b3JrIGlzIHRvIGhpZGUgaGFyZHdhcmUNCj4gPj4gc3BlY2lm
aWNzLiBJdCBvZmZlcnMgYW4gQVBJIHdpdGggY2VydGFpbiBzZW1hbnRpY3MgYW5kIGl0IGlzIHVw
IHRvDQo+ID4+IHRoZSBkcml2ZXIgdG8gcHJvdmlkZSBhbiBpbXBsZW1lbnRhdGlvbiB0aGF0IGlt
cGxlbWVudHMgdGhlc2UNCj4gPj4gc2VtYW50aWNzLiBUaGVyZSBkb2VzIG5vdCBuZWNlc3Nhcmls
eSBoYXZlIHRvIGJlIGEgMS10by0xIG1hcHBpbmcNCj4gdG8NCj4gPj4gaGFyZHdhcmUgcHJpbWl0
aXZlcyBpbiBzdWNoIGFuIGltcGxlbWVudGF0aW9uLg0KPiA+IEkgd291bGQgc2F5IGl0J3Mgbm90
IGRlc2lyYWJsZS4NCj4gPg0KPiA+IFdoeSBzaG91bGQgd2Ugc3BsaXQgdGhhbiByZXNwbGl0IGlm
IHdlIG1heSBkbyBpdCBpbiBvbmUgZ28/DQo+ID4gV2h5IHRoZW4gd2UgaGF2ZSBETUEgY2FwYWJp
bGl0aWVzIHJldHVybmVkIHRvIHRoZSBjb25zdW1lcnMuDQo+ID4NCj4gPiBTbywgSSBoYXZlIHRo
YXQgd2UgbmVlZCB0byBvcHRpbWl6ZSBETUEgU0cgbGlzdCBwcmVwYXJhdGlvbiBpbiBhIHdheQ0K
PiA+IHRoYXQgY29uc3VtZXIgZ2V0cyBTRyBsaXN0IGNvb2tlZCBpbiBhY2NvcmRhbmNlIHdpdGgg
RE1BDQo+IGxpbWl0YXRpb25zIC8gcmVxdWlyZW1lbnRzLg0KPiANCj4gVGhlIEFQSSB0aGF0IHRo
ZSBhdWRpbyBkcml2ZXJzIHVzZSByZXF1ZXN0IGEgcGVyaW9kIERNQSB0cmFuc2ZlciBmb3INCj4g
bGVuZ3RoIE4gc3BsaXQgaW50byBNIHNlZ21lbnRzIHdpdGggdGhlIGNhbGxiYWNrIGJlaW5nIGNh
bGxlZCBhZnRlcg0KPiBlYWNoIHNlZ21lbnQuDQo+IA0KPiBIb3cgdGhhdCBpcyBpbXBsZW1lbnRl
ZCBpbnRlcm5hbGx5IGluIHRoZSBETUEgZG9lcyBub3QgbWF0dGVyIGFzDQo+IGxvbmcgYXMgaXQg
bWF0Y2hlcyB0aG9zZSBzZW1hbnRpY3MuIEUuZy4gaWYgdGhlIHNlZ21lbnQgaXMgbG9uZ2VyIHRo
YW4NCj4gd2hhdCB0aGUgRE1BIGNhbiBoYW5kbGUgaXQgY2FuIHNwbGl0IGl0IGludG8gdHdvIHNl
Z21lbnRzIGludGVybmFsbHkNCj4gYW5kIGNhbGwgdGhlIGNhbGxiYWNrIGV2ZXJ5IHNlY29uZCBz
ZWdtZW50Lg0KPiANCj4gVGhlIHdheSB0aGlzIEFQSSB3b3JrcyB0aGVyZSBpc24ndCBldmVuIHJl
YWxseSBhIHBvc3NpYmlsaXR5IGZvciB0aGUgY2xpZW50DQo+IHNpZGUgdG8gc3BsaXQgcGVyaW9k
aWMgdHJhbnNmZXJzLg0KPiANCj4gQnR3LiAxMDI0IGJlYXRzIHBlciBzZWdtZW50IHNlZW1zIGV4
Y2Vzc2l2ZWx5IHNtYWxsLCBJIGRvbid0DQo+IHVuZGVyc3RhbmQgaG93IHNvbWVib2R5IHdvdWxk
IGRlc2lnbiBzdWNoIGFuIERNQS4gV2FzIHRoZQ0KPiBhc3N1bXB0aW9uIHRoYXQgdGhlIERNQSB3
aWxsIG5ldmVyIHRyYW5zZmVyIG1vcmUgdGhhbiBQQUdFX1NJWkUgb2YNCj4gY29udGlndW91cyBt
ZW1vcnk/IE9yIGRvIHdlIG5vdCB1bmRlcnN0YW5kIHRoZSBkb2N1bWVudGF0aW9uDQo+IGNvcnJl
Y3RseT8NCls+Pl0gVGhlIHNlZ21lbnQgc2l6ZSBpcyAxMDI0IGl0ZW1zLiBUaGUgaXRlbSBzaXpl
IGNvdWxkIGJlIDhiaXRzLA0KMTZiaXRzIG9yIDMyYml0cy4gU28sIHNldF9tYXhfc2VnX3NpemUo
KSBpcyBzZXQgdG8gMTAyNCo0Ynl0ZXMuDQogDQoNCj4gDQo+IC0gTGFycw0KDQo=
