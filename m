Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F08A459B5C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 06:05:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF1A61658;
	Tue, 23 Nov 2021 06:04:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF1A61658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637643899;
	bh=OkVLvxKOrLQnEXyizATAi6t/Ged10mlzY4YGjpWbEx0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H+i8Us5NoilIg9senOx/7Zp2GCywoowY/jgRcgxydHQ5edXpkz1PdLFhRUnp+CN+b
	 xbIGqjweFd9XnVW0ceKbiKh8WwvzjZqTWtHmm880jC/zaMQ3Xhe0QNJfW4vII477FX
	 /FMOty0p/OD9JVeB4CePDB4ul00PiqcjjNa7UNpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E1BBF800E7;
	Tue, 23 Nov 2021 06:03:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 095C3F8049E; Tue, 23 Nov 2021 06:03:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EED6CF80087
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 06:03:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EED6CF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="FOolwitA"
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="233672063"
X-IronPort-AV: E=Sophos;i="5.87,256,1631602800"; d="scan'208";a="233672063"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 21:03:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,256,1631602800"; d="scan'208";a="570880609"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga004.fm.intel.com with ESMTP; 22 Nov 2021 21:03:26 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 22 Nov 2021 21:03:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 22 Nov 2021 21:03:25 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 22 Nov 2021 21:03:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwZlF5/nnxhBOp8Fi9ZjF3Ab35qlQsGsxV1hOy1Y/Om9sTfgTHySxp0bhnrOg5HSPNIYdt6OK47w65s74Lw9k3z3JuD6DDYnU/0JoMZmNGhoyJT43D+X0vvI1pYmBVVMF9v+Ne2ZZGcSs7u1veN+8LdvMPSqE6bbf8U0EMqvRzqztka+QNG7MRGQs3yFH7Y4J00J9cqHUKK4XK29KDVSF8jCBsXs0t6I+6fxc5zLpiakwdfAdhHt0AOPraxg0x/Uyd+qYkA0cfl90T6a0dI8x3MJ+L0eslhjDFBi+qpRjC8CUaabhZ8n4zSe7xZqAUdVWzmahsdWkfMx2iLwJrk9zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkVLvxKOrLQnEXyizATAi6t/Ged10mlzY4YGjpWbEx0=;
 b=SfE8HvT8KOdXW29tf9r3zsbO7Ksb4P/6NWwNCMP94OhzUmiIGFj+c+hNIycPpLqwPEuSE2WHmcRL13f/U7FLUqcQsIgdiIEWucgb82dkAX+t/lktVEzw0oQ0AcHSz1Ae2bpRLTd3Kd9qZzAb2NwCvGW5MtNYbNWuyU2gOtw/EbFhpyEBxPLVw/8U47johA8LysGQ5RM0QuUpyiheGEvhcoOsfQktTbhomRCQPi9NrPSIF2ofwCYrglkBT2bWYsLQg7rOfeetFieYz/mEYEjbgA1czRXfR75xW/sV4yRiIjLI4izP6D9SztfrHqK46GQPN6TmBHoT+mhaTztW4RC2fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkVLvxKOrLQnEXyizATAi6t/Ged10mlzY4YGjpWbEx0=;
 b=FOolwitAMfpEGzrDEzQyV+537o39Qv9za8Mc3zbKTKERpmtRmwPN2/hK6zIgWCQBsC+4EY5LZBE8Wk1BMQX3HsImAQRPeojk2Hu2lfcBwRWSMDUYFOmSfwfqZhv3vtWuNg+9FECfCdshOziFDZ2k3ocSfY1+Kj9vgbkxJZsJ/fg=
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by PH0PR11MB5208.namprd11.prod.outlook.com (2603:10b6:510:3b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Tue, 23 Nov
 2021 05:03:23 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::5878:f359:ea14:4c5c]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::5878:f359:ea14:4c5c%8]) with mapi id 15.20.4690.016; Tue, 23 Nov 2021
 05:03:23 +0000
From: "Chiang, Mac" <mac.chiang@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [RESEND,v3] ASoC: Intel: boards: add max98390 2/4 speakers support
Thread-Topic: [RESEND,v3] ASoC: Intel: boards: add max98390 2/4 speakers
 support
Thread-Index: AQHX35/ZZRVGqXifA0uXRuuw16FK1KwPxLUAgACwd+A=
Date: Tue, 23 Nov 2021 05:03:23 +0000
Message-ID: <PH0PR11MB5832CA74B93E45C1302048A084609@PH0PR11MB5832.namprd11.prod.outlook.com>
References: <20211122125002.3206-1-mac.chiang@intel.com>
 <18529913-3d3f-9dfd-7f27-5672e2300c45@linux.intel.com>
In-Reply-To: <18529913-3d3f-9dfd-7f27-5672e2300c45@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5a7ec85-748c-4ff6-9009-08d9ae3e9358
x-ms-traffictypediagnostic: PH0PR11MB5208:
x-microsoft-antispam-prvs: <PH0PR11MB5208EB8E64393970DE2B867384609@PH0PR11MB5208.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6ZKKJkGaqt6alZw713bbt/ffaFdET3pJR4z6vsqg2s6mGLBDtNBW0WrIxf1C7QO4lOsOeFgrcYEdRdXUtwKxjM80kNJZwYoamm7E2mJ/X1Vqq/XNmwkGsY7jFqoJhkxxXK/f+uzSWYmEetGlVLCltCb8EDaCC7eYn3n4h76BYReg/j+HZ+rgP/K6Z3rSNCWUYSN8KtRKYlTNb45Xi2CsezyAdZJcp0VaCBXQf5VlBuH0id8fymWep97R4Joe0dg2qbH4ae5j/J3jwnzVMy5DmnsRQwV+KNMs2/RNmE5oNcQmQDe/KQ/uf4QyqRVA9ztcPZGkgMJ88S3/G0jT2hmIy7cFIdv31MS801L+1rMAiAqoIqriB9o1ghOXhSbImGlJeSNw1W5j0Uo2XCEAldnUUcNCefJy4LG8oj8MPognSLNDWn5fzmGZ9hfT28wjJSGfXJR+6lpEYUQGd3MVcrM+FoRHSC1KKHxKmyxSaEcM/bNxQgTPAw8MsNIRi0f7WM72Vn1IAj1xVwGW6Ce7KC1jVApuSFkTCQDGA9CDyUgBjeOa09CDjwUUpZqVjYuEYk9PsNXy/g81I/JnGYtde57nZ+RZB9HYGOCrbhMDnpvc7cN3iDp2ykDeip3WjET+TRETcDW2yMy4ylTmrxcURYUMQSho99zS4T0WEQZdESOoFECotckRwQai9T+60p0/m2OugpnZEsifrqjf8YBGGi/C9g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5832.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(9686003)(86362001)(71200400001)(4326008)(5660300002)(8676002)(122000001)(8936002)(82960400001)(64756008)(110136005)(33656002)(66476007)(66946007)(76116006)(66446008)(38100700002)(2906002)(26005)(52536014)(316002)(508600001)(7696005)(6506007)(54906003)(186003)(38070700005)(55016003)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDFlOW1PWXZwNFhhL09XUkZ1OVJUbTJva0lFQjBGWjVzR0xjYy9SUWczOGlw?=
 =?utf-8?B?SERRWmZRRzYrOU12QU5FTEprYmlLY09rS3NsLzVlK3gydEdEVnlqZ3NKb2dV?=
 =?utf-8?B?UERYM1JsWHVQTGgwUU9EcXRBMTlsckwxVVdZaHNIdUZnRzdWOTF0UGg1RjdW?=
 =?utf-8?B?aWtwZ0tXSVZYc0czanI0b3BHT0FnTU5pVldTR2g4cmJUTUI2dnlEVXNLd2ho?=
 =?utf-8?B?bmNGNUVQQlU1UkZvYjRlWWNscjUwYU0yRTVJYVVab253MFVHUHIrRTY4SExh?=
 =?utf-8?B?TGljc3cwdFNOWk5PM3lrM040bU4vdkdGZDVLVGZRYjA1R1k3dVdDMjVqazMz?=
 =?utf-8?B?L1BRd0xQTlc3R2pLU1pCbm8rYlFsczRwQTNoYklDMmYwcnRLSFY4WWt3bENz?=
 =?utf-8?B?dEpEUXRYbkh2azZIaU5oVDd1TGxnSDBEVXVjZzZjY3p6eDdOd2ZzUjJ6a2lm?=
 =?utf-8?B?YlNxSDRxVm96aFhidEloYmxmNlU2T0k0YnFvczZ4NDRVT0xWUUd0N25JTE1p?=
 =?utf-8?B?MnlteFFJZml0ZjRtTlFBZ2pWUm91d0t6YXBLdHVibmx3dEdFMlJWTUR3aEdL?=
 =?utf-8?B?a3JEK1AvQ1pZTEJTdllQY3B3SWZHVkN6elJXMjdzeGRsUGZwU1B2azBRZitH?=
 =?utf-8?B?Umhrd1BoNkt3eTN0VFg2YTVsK2NLMzN3TmxiaGxrWFBrNUpsTVR3eG9BbUhK?=
 =?utf-8?B?RWhIZFQrQmZ3M2xSL0U4VjN1V2dmcC93WXdpbHg1Ny96VnBUemt3VzZDOWVJ?=
 =?utf-8?B?TC9SdW82dWkxZUVpL1l5WFg0azBpVHY0SXU5YWlUamdWdHAyRG9JMlhudlFS?=
 =?utf-8?B?T3dKNE11VEpoalczRlozcXdZMEJteHl5WjYxVUNUWHB4REVIOFVjQWdsTUJV?=
 =?utf-8?B?WEI5UUo0NE5raXQydWd5ZGF6eFZUQUsxeHRSWjA2VGlTOTdLek9RaVNscHRk?=
 =?utf-8?B?Q09FNnI2MTRqMUhwQ1pqMXIwcHRqMkhEZXhsZWs0VmZhT0c2cFo3TlppcVkw?=
 =?utf-8?B?OWNKYjJBNnhqMTEyZVdZWnVGWFR5aEttOVhZQnFvakJmVlBHUXN4aEpOQU5n?=
 =?utf-8?B?Q2x2M2NrL28xeVBDWVo1WkV6V2MvbmdYb1JHRFRoR0J2S3h1akVQWWRqTnpO?=
 =?utf-8?B?TkdUT1lnaXdrRThaTUhtakhwN3Z3Ym5IVDlRMVp2cmhsMHVHdjg5cXR0NERN?=
 =?utf-8?B?N002NWppSW1MN1hiRE1iTUk1OEY4NUxFZEdXY04wbEJwQXpLM0lRR1FmcVV6?=
 =?utf-8?B?M205V29jSjRteGVWNHZwMVpLUlAzdmk3cHdEZnorSCtmZ2dFTGswcHV1M3Ns?=
 =?utf-8?B?NXFoYjRWdW1CR0E4RWkrVVFXK0lzcVBNbFhjNXdMbk13cWdaWDB2eGVvdVFD?=
 =?utf-8?B?MnpDQWpQRGdvYXc4WmpuY0RBMkNLK1lVL2FVWkF4cjFHU2ZodUtMMmVGamYx?=
 =?utf-8?B?SmNGbzR5V0JsWWR1MGVyNDlvR0JiMEQ5NFZOeUx3U1pYUlJybVVteVB0bkVp?=
 =?utf-8?B?SjJ1NXhRSURJNzBTV1dKcEdscDhXaGVKbk1HSWVzOWl3K1UrdEZQQk9ha25r?=
 =?utf-8?B?WXpVT21Fb0lTZ0tmOUpwL1F5UXQ1SEc0Q2sxTkNFWU1mM2lvTjR2R0o4Uk0w?=
 =?utf-8?B?OWNhNk41T0FFaHF2aUpQMytIalJ4S2xjcWFFakJtanRINXhmZXZCam5JdWJM?=
 =?utf-8?B?cGZrRk5QV0FxbHVURlRUNTVTTHQrZW9uRVQ1VlphYjZXWHZrcFVPMS92SmJC?=
 =?utf-8?B?NHFIMmJ1enBXbWxEYjNlTEk5RU14OTdHNGVpK21QSXpaeEQvaXp6Nit4UVMz?=
 =?utf-8?B?cVlWUktGQzE3bEhGMXhzUWpsbFh2eERSSFJxN2hpSGt4MXdTZTMvQWlHOXd4?=
 =?utf-8?B?Z1pDMWNwcVBEQndMWmhrSTd0Zmx2bWU0UHE4bzZ5L3lVeUJkNjN1NHNlYUcx?=
 =?utf-8?B?bFZkd1JoMUNNK3cvMU80M1A4WjlYckZFZ1hoam9laEp1cFU3TG1Gd3FWZUt5?=
 =?utf-8?B?U0VOc0lFQmtMQnM0Rms0NEVBek1xSVBnbXNidll3QkhpMjRhUExJdUk2UFBi?=
 =?utf-8?B?cC9rTzJjSjM0VTJOZkpVeUVtY2NVK0tLUzFEcWhTcnBXdGp6SjlzMFhFTVAw?=
 =?utf-8?B?RmRxYkVqcVBoc1VqYXVpaEhGQWZ6cFZ5eW5FMEovRTE2NGh5S2N5OXJHaXhT?=
 =?utf-8?B?bmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a7ec85-748c-4ff6-9009-08d9ae3e9358
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 05:03:23.1561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TxXUinmI4rnT0+MSKCOmNUcqWvcwLlRtxd4+XjkuTKw5VFocTz3/KO5UNFGKSKQYwg2cESbLjAOcHWXulmiB5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5208
X-OriginatorOrg: intel.com
Cc: "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "yang.jie@linux.intel.com" <yang.jie@linux.intel.com>, "Liao,
 Bard" <bard.liao@intel.com>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>
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

PiBUaGlzIGlzIHRlY2huaWNhbGx5IG5vdCBhICdSRVNFTkQsIHYzJyBzaW5jZSBpdCdzIGRpZmZl
cmVudCBmcm9tIHYzLg0KPiBQbGVhc2UgZG9uJ3QgZG8gdGhpcy4NCj4gDQo+ID4gLS0tDQo+ID4g
Y2hhbmdlcyBpbiByZXNlbmQgdjM6DQo+ID4gICAtIHVzZSAuY29tcF9pZHMgdG8gc2NhbiBhY3Bp
IHN1cHBvcnQgQUxDNTY4MkktVkQgb3IgQUxDNTY4MkktVlMNCj4gDQo+IGFuZCB0aGlzIGluZGVl
ZCBzaG93cyB5b3UgbW9kaWZpZWQgdGhlIGNvZGUuLi4NCg0KU29ycnkgZm9yIHRoZSBjb25mdXNp
b24uIE15IG1pc3Rha2VzLi4uIEl0IGlzIG5vdCBhIHJlc2VuZCBjYXNlIGJlY2F1c2UgSSBkaWQg
Y2hhbmdlcy4gSSB3aWxsIHNlbmQgbmV3IG9uZSBhbmQgYWxzbyBmaXggYmVsb3cgeW91IG1lbnRp
b24uDQoNCj4gDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19hY3BpX2NvZGVjcyBh
ZGxfbWF4OTgzOTBfYW1wID0gew0KPiA+ICsJLm51bV9jb2RlY3MgPSAxLA0KPiA+ICsJLmNvZGVj
cyA9IHsiTVg5ODM5MCJ9DQo+ID4gK307DQo+ID4gKw0KPiA+ICBzdHJ1Y3Qgc25kX3NvY19hY3Bp
X21hY2ggc25kX3NvY19hY3BpX2ludGVsX2FkbF9tYWNoaW5lc1tdID0gew0KPiA+ICAJew0KPiA+
ICAJCS5jb21wX2lkcyA9ICZhZGxfcnQ1NjgyX3J0NTY4MnNfaHAsIEBAIC00MzQsNiArNDM5LDIy
DQo+IEBAIHN0cnVjdA0KPiA+IHNuZF9zb2NfYWNwaV9tYWNoIHNuZF9zb2NfYWNwaV9pbnRlbF9h
ZGxfbWFjaGluZXNbXSA9IHsNCj4gPiAgCQkuc29mX2Z3X2ZpbGVuYW1lID0gInNvZi1hZGwucmki
LA0KPiA+ICAJCS5zb2ZfdHBsZ19maWxlbmFtZSA9ICJzb2YtYWRsLW5hdTg4MjUudHBsZyIsDQo+
ID4gIAl9LA0KPiA+ICsJew0KPiA+ICsJCS5jb21wX2lkcyA9ICZhZGxfcnQ1NjgyX3J0NTY4MnNf
aHAsDQo+ID4gKwkJLmRydl9uYW1lID0gImFkbF9tYXg5ODM5MF9ydDU2ODIiLA0KPiA+ICsJCS5t
YWNoaW5lX3F1aXJrID0gc25kX3NvY19hY3BpX2NvZGVjX2xpc3QsDQo+ID4gKwkJLnF1aXJrX2Rh
dGEgPSAmYWRsX21heDk4MzkwX2FtcCwNCj4gPiArCQkuc29mX2Z3X2ZpbGVuYW1lID0gInNvZi1h
ZGwucmkiLA0KPiA+ICsJCS5zb2ZfdHBsZ19maWxlbmFtZSA9ICJzb2YtYWRsLW1heDk4MzkwLXJ0
NTY4Mi50cGxnIiwNCj4gPiArCX0sDQo+ID4gKwl7DQo+ID4gKwkJLmNvbXBfaWRzID0gJmFkbF9y
dDU2ODJfcnQ1Njgyc19ocCwNCj4gPiArCQkuZHJ2X25hbWUgPSAiYWRsX214OTgzOTBfcnQ1Njgy
cyIsDQo+ID4gKwkJLm1hY2hpbmVfcXVpcmsgPSBzbmRfc29jX2FjcGlfY29kZWNfbGlzdCwNCj4g
PiArCQkucXVpcmtfZGF0YSA9ICZhZGxfbWF4OTgzOTBfYW1wLA0KPiA+ICsJCS5zb2ZfZndfZmls
ZW5hbWUgPSAic29mLWFkbC5yaSIsDQo+ID4gKwkJLnNvZl90cGxnX2ZpbGVuYW1lID0gInNvZi1h
ZGwtbWF4OTgzOTAtcnQ1NjgyLnRwbGciLA0KPiA+ICsJfSwNCj4gDQo+IEkgZG9uJ3QgZm9sbG93
IHRoZSBsYXN0IHR3byBlbnRyaWVzLi4gVGhleSB1c2UNCj4gDQo+IHRoZSBzYW1lICdjb21wX2lk
cyc6DQo+IA0KPiBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfYWNwaV9jb2RlY3MgYWRsX3J0
NTY4Ml9ydDU2ODJzX2hwID0gew0KPiAJLm51bV9jb2RlY3MgPSAyLA0KPiAJLmNvZGVjcyA9IHsi
MTBFQzU2ODIiLCAiUlRMNTY4MiJ9LA0KPiB9Ow0KPiANCj4gdGhlIHNhbWUgbWFjaGluZSBxdWly
azoNCj4gc25kX3NvY19hY3BpX2NvZGVjX2xpc3QsDQo+IA0KPiB0aGUgc2FtZSBxdWlya19kYXRh
Og0KPiAmYWRsX21heDk4MzkwX2FtcCwNCj4gDQo+IGJ1dCBhIGRpZmZlcmVudCBkcml2ZXIuDQo+
IC5kcnZfbmFtZSA9ICJhZGxfbWF4OTgzOTBfcnQ1NjgyIiwNCj4gLmRydl9uYW1lID0gImFkbF9t
eDk4MzkwX3J0NTY4MnMiLA0KPiANCj4gaXQgbG9va3MgbGlrZSB0aGUgc2Vjb25kIGVudHJ5IHdp
bGwgbmV2ZXIgYmUgc2VsZWN0ZWQuDQo+IA0KPiBDYW4geW91IHBsZWFzZSBleHBsYWluIGhvdyB0
aGlzIHdvcmtzIGlmIGl0J3MgaW50ZW50aW9uYWwgb3IgZG91YmxlLWNoZWNrIGlmIHRoaXMNCj4g
aXMgY29ycmVjdC4gSSB0aGluayBpdCdzIGEgY29weS1wYXN0ZSBmcm9tIHRoZSBjYXNlIHdoZXJl
IHRoZSBhbXBsaWZpZXIgaXMNCj4gZGlmZmVyZW50LCBidXQgaGVyZSBvbmx5IHRoZSBoZWFkc2V0
IGNvZGVjIGlzIGRpZmZlcmVudC4NClllcywgeW91IGFyZSByaWdodCEgSGVyZSBpcyBvbmx5IGhw
IGRpZmZlcmVuY2UuIEkgZG9uJ3QgaGF2ZSB0byBjb3B5IHR3by4NCldpdGggc2luZ2xlIGRydl9u
YW1lIGFuZCByZW1vdmUgdGhlIHJlZHVuZGFudCBlbnRyeSBpbiBzb2ZfcnQ1NjgyIGJvYXJkX2lk
IHRhYmxlLg0K
