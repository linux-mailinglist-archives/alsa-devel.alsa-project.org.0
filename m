Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A62447E04
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 11:30:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD5CA1676;
	Mon,  8 Nov 2021 11:29:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD5CA1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636367434;
	bh=2Btz0Hplx9JUhbAuJd2JLZaFenIHaNNM3zNZDcDBLpE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=njIihjIxfeVel8A7SUs7w7DZOt7epXZ9Wt2M/HTc+v7pgSL1ViLiKd86oSt1vmxd7
	 6r3byWHT6FKlDNUVYMC6It12dNlENACnG6FoeoMuhu5QS2wx78XdSKjfbiAJA/6Lv3
	 55DvFgKvbEbQAanwAxOmAoaeixDCLLG5ERQkMkic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42BC5F804B1;
	Mon,  8 Nov 2021 11:29:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4381EF8049E; Mon,  8 Nov 2021 11:28:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4CA5F801D8
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 11:28:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4CA5F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="w7ZyV6Ef"
X-IronPort-AV: E=McAfee;i="6200,9189,10161"; a="230918437"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="230918437"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 02:28:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="451478935"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 08 Nov 2021 02:28:24 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 8 Nov 2021 02:28:24 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 8 Nov 2021 02:28:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 8 Nov 2021 02:28:23 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 8 Nov 2021 02:28:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyW+hvAc3RhzX1EMYQqBitTO8PIN4ktcT6ne7yuT/Qgb77UeJo/V2MbMfLFV+QVpm86oE/twxzrq0Yj+MDwkPyCIUR/bvqH082hIzJg9ZnVh/CmFqCHRaSNVRFGv8EKyhb6lnGAJXEJw/JWcNcLQvTbeKnAfQXUSsOrISANFZSdqrRD1VIeusx15FmY0trcsCJCOOy2JSGKenma47x2cnX/7RkJvvJ9yEvBe2seeU8w+Iwt9C4ELsSkwfWRvEF4SIDHk0dPt+wYv1WldVrwInIfexwEInMZy425a+moqF6uC0kB3KNPGtsceeqslxUpeeykr6NQyJ3AHq2+or/iGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Btz0Hplx9JUhbAuJd2JLZaFenIHaNNM3zNZDcDBLpE=;
 b=Omh9KbJmtaKMJ52BzSFdxdKv3qH7iPA8YbXIz2q+k1sBITUze83uQD7li/wsvHPb9pnphMCt/B0+4dOuytQ0wyG9xFS1qC1AgpAYA+7pZwaNrfQnxOmxdcMqRr31nnj8Q2piND62zP/pesISGP4yq4aEPMXAY/VAc1lA+VLe0uawpyi8YzYi74SWIfU6vHdYWriuXaiEtYgQUjQF/M1ci1IYZ+Fdu48yvOIgnZUP+mmlW2GIW7lj0KkjQQyQzEE2NZ9zF38hEV6IycZAvEkCQeBnwCBKBOrAlanjmIRKK6x5/KiefHia5OguPOfdn4ffCW/hKT1eK9O1MKs+4GBwUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Btz0Hplx9JUhbAuJd2JLZaFenIHaNNM3zNZDcDBLpE=;
 b=w7ZyV6Efa3UbR9P2rdxmZKnNhQsSw3mPCqWBAc8YnTy2XUSuMQvQjFE8qQxoEK2lUydpgE+XV/vEqHRm/2VKsv5dqxwiPbScs/dO1Nuh3JHvzXydv1FgoXEZwWo5eaV8OJjpCAJXCwsaXq86rDGv2wsETG0DQ4zcVbfYNk49ocE=
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by PH0PR11MB4805.namprd11.prod.outlook.com (2603:10b6:510:32::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Mon, 8 Nov
 2021 10:28:23 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::5878:f359:ea14:4c5c]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::5878:f359:ea14:4c5c%9]) with mapi id 15.20.4669.011; Mon, 8 Nov 2021
 10:28:22 +0000
From: "Chiang, Mac" <mac.chiang@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v2] ASoC: Intel: add sof-nau8825 machine driver
Thread-Topic: [PATCH v2] ASoC: Intel: add sof-nau8825 machine driver
Thread-Index: AQHXzxAL+73CrCg8HU+qi4gGgTZeW6vyA+qAgAdmnBA=
Date: Mon, 8 Nov 2021 10:28:22 +0000
Message-ID: <PH0PR11MB5832F3AFC273BB4FBE0812F484919@PH0PR11MB5832.namprd11.prod.outlook.com>
References: <20211101110050.28384-1-mac.chiang@intel.com>
 <31ae486f-7d0e-30a8-ea55-7cdf70a76020@linux.intel.com>
In-Reply-To: <31ae486f-7d0e-30a8-ea55-7cdf70a76020@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6ae5751-71bc-451f-923e-08d9a2a27dcf
x-ms-traffictypediagnostic: PH0PR11MB4805:
x-microsoft-antispam-prvs: <PH0PR11MB48059600AC37752152ACC81C84919@PH0PR11MB4805.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DAQMf9TNpldrWBWIQZzj6Ua+mJvM6SeHDn+Nds8vMTOhsUGFwznhs+HAEtVMjPeFqkaufjcfi4mw2itJlZSRqPMYFXY8ixf1SnhxjQsuYp7XV/sTQ/HfMAEWxnsXREpcX1EAKGL0QtiE4ifVI7G4V9PMuJTOzyT2uzU7MTjPRUUm+tVFY3ian2uQj3DjXe1ekBcNwfhn/+XvLaRlfMwCJBzoCOh7EhPrK2zr+TiWnEsQdnw6gVPycBSQXHvB3kObE1EbcTWP1u0Gk1kHp9UldxdXmABm+kJBUkXR0XFTRXjevlqZ2q6uOX/U0rhPHuXxNVFTAigXr1IX95CQJXsnGuTb10JJV4KU3RqXb8XcPSP19JKuLyul2FkjagEXtld9gEdK7wqIL5l+1Pr9nDfv1v18pB7F/Qwhq/JdbASY6cKRF690YqasWcsWNtWgyMngMXIUiveQWdpnHt85bcruXvN+Hk0ylxiqlQ2/74nxdyBj/M9rLHqq9iTocbv8g9OW3VQK/fzLR2Iqhu+KSKCiFFTBaLdJZIeLbQ6Ga3/GLjx1Trmt6QQE/mM6iJhEKcegx/C9LoFaqxozmbs5zDHgT2qOue+vQ4tPgPRxuO2KrE35BncvCKWcjI8bX43tFSPzUdrz9kqG3DfDzL/LYAUGX28rrHCGv1bamOGEKnZLhORaimjv1ji+nRTbHsu4OkLZh1HsWopq4KbmCkDfEbGLJQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5832.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(54906003)(66446008)(64756008)(66476007)(76116006)(7696005)(9686003)(8676002)(186003)(5660300002)(66946007)(38070700005)(66556008)(2906002)(55016002)(52536014)(86362001)(33656002)(110136005)(6506007)(316002)(38100700002)(8936002)(122000001)(26005)(71200400001)(53546011)(83380400001)(82960400001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnNHdlBSb2tWVlAybUdVOVZDMUVyaVhuYVFteHBsTVlxMlR6Qk93a2ozeE5U?=
 =?utf-8?B?ZWtPSitveVI1TnZkSkpyTFU0VUdxVytMNVJSSFdPYk1hOVNnMVEzeDgydUlC?=
 =?utf-8?B?ZmpNbEFyV0NtczBNWWtHNE1Ob0xuMzF2T1NMeHJ1NkM2STJaWFM4SFpzUmR4?=
 =?utf-8?B?TXp3K3dpK2VDTjl4cVpBWFRRV05JSmx5YXpFZUt2ZmRHLzlSc3F3L0cvcVVR?=
 =?utf-8?B?SUtlUzR4cXJVRm5hV0RiTmdlMTloVHFWVkx0bk5QdnhNangrdzdWT2ZrUVRP?=
 =?utf-8?B?NEpBYjJud0h6WU9iN0VaT1U5UFlDR2FSdU1kNDl3UGFobTQvM0Z5SUlQdEVP?=
 =?utf-8?B?UnBiSUlCK1JDbUFWQ0QxSFZFQkdOb3gzT1M5MUFGZFlUdEIzcjhmdkIxV0lB?=
 =?utf-8?B?S0lPMkNsbDd0ZGdDMHNMOTZzR0liNzRGdk1nUW1OVnNTSWYvRXg1WENzdEdw?=
 =?utf-8?B?YkErb1I5SWFROFZDWVFROFRrdjhqK0UxS0xpalRQVFFScEZTNGRpMlYyVzNk?=
 =?utf-8?B?RkFNRkhVdzF6ZTc1QzBaNW9XQjN2Rkcxdmx6a2xTbWF6T0ZoRFgyNWdWZTNK?=
 =?utf-8?B?MVR6UXVCekkreGg2MUtERmNtVFR4VkhWQ2tOZEg0RzVZU0RSYU1iZTk2dytq?=
 =?utf-8?B?TG9uUmhZa3NTL2hLdTRtckVSWTM4cjhCdWd6SEw1L1dvdy9xWG56OWhlZlpI?=
 =?utf-8?B?bElVTVVyMytjSnlUZW5EaUduNzFqTkU2UGpPeXVuWHZwNGJqT0c2Mmlucm1J?=
 =?utf-8?B?bmQ4cUtxaVNQMW5HdUFiZ25XTmF6MWxNdzRIZXVBYVQwem5oUGovK1VIaFov?=
 =?utf-8?B?WUR6SU9WT0tPWWIrVXBETVA1d0preXVUTzh5SUY3NkVXcFRJcG81cWVDTXhI?=
 =?utf-8?B?Wnp0bytsLy9YTzlaMkxXb2ZNNGp2VmJQUEg2WXpEbTNDVTd6a3FieDFpYUlD?=
 =?utf-8?B?Z1FXNEtoK1RQQTNuMjIzQW4rdXduRnYrallienlrTTFmRlYyWlBaNHA3bmlC?=
 =?utf-8?B?dENWdkJDMFpXV3VuS1A2ZUp3YjBGdFFZdGFhZXNFc1RvYmxRZGhDeFBxc3lN?=
 =?utf-8?B?bGk3NFFCRWVoUkxlVHpmaEJ1NEc0dGdTSHFUekdieTM2OGY5WnBtV1RpelZQ?=
 =?utf-8?B?YXRZbUNraGRhaXJXOHE3NTE5T2ZBTHNXaGl2a1VFQjdsUTI0ZXB3TC9KUHdD?=
 =?utf-8?B?NTh6M2d0cjZBVEZqaE85UG42TkZFaDVWUkJTSmgxOUp2T3Y2T2VWZUdoblJC?=
 =?utf-8?B?ajFHOENPcDVNbnlkcFlDOHRkelRMNFhNTVdvUHRzNTloRDRUdFBoOFc1RFFp?=
 =?utf-8?B?Zk1CMGxiNEM0YlV2Y1RYMkIxckM2UnVWWlVpdE95Q1FjMlBMTWxDUjRJSGtK?=
 =?utf-8?B?R0UzN29JcGZlU2d5azg1eGcvUUJZcER0OXAyZGhCZGxYSXpmcVJkYTczNDEz?=
 =?utf-8?B?Y3VheXpQOWlla2pqc2lldk1OQTdMMFdQcFFXRWlQS2lpR0pCVzVwT0Nram04?=
 =?utf-8?B?TmJ5NllrMFF5ZnlDTDBmaCtCOXQrMC8wTXpFUjliTkE2RFZQbGJGYlZZaWpV?=
 =?utf-8?B?M1BvVWJ1Y01oUXhIQi83NFh1bVdzNjRNRldXSlF6RWpuTjhBMENCNUlQbm1Q?=
 =?utf-8?B?NEJQSkdna1EySTZvRFgrbWhrdkI2STloZUVCSnk0QmlDTmtETFNxd0l2Rkth?=
 =?utf-8?B?MEs3OExvVjBWOGM2L2hZUXBITlNqMjZyVnB0cnQycmtJeEoya05NUE9yQlRl?=
 =?utf-8?B?anpGMEZ5R3c2NmVCUTA3RXR6V2pQN0RaZ1Z0RkpUWHNETmE0a3VUMkhpZVlz?=
 =?utf-8?B?MXUvYXU5NVBvdWF2bk1iNGo2TjhFVkNraVB4aktZSk1vL3Z6ZDJTNzNzWThS?=
 =?utf-8?B?SDdKQnd3dnNYYW1oMGN2YkJEYWVwbURsU1Z1cEpBYjVGNGh4QjBlSHhGNlRO?=
 =?utf-8?B?S0ROSDFRZWdob2FoQ094SjduTFJGVFdsbmxWVGFoMm1IUklMUEYxOWtCRGxO?=
 =?utf-8?B?NU5CNi9xWXlibW55RXFkV2t6cWVVS1N3VFlBcGFBc29aTTk2RjMySFZKQnRW?=
 =?utf-8?B?bDRORHl3ekZxc1lsNUF5Q3hma25JcG1MTGVBRlliWmIzZ0k0RElZNExQbFlY?=
 =?utf-8?B?eUtZR2J1bURobGRIckhCSHhUZGttekUyL2xORk1JeHBNdWhGRTFPNkJXbEhx?=
 =?utf-8?B?dkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ae5751-71bc-451f-923e-08d9a2a27dcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2021 10:28:22.6980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p6b/BWNFnY0ue+Z0tZ/pEv2VKDASplJFNXykToMrj/0pO1FoPvOx+z6ShasWIlUI4IBQ+Nof3HP2WM1lv+BJHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4805
X-OriginatorOrg: intel.com
Cc: "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "CTLIN0@nuvoton.com" <CTLIN0@nuvoton.com>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>, "M R,
 Sathya Prakash" <sathya.prakash.m.r@intel.com>, "Liao,
 Bard" <bard.liao@intel.com>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaWVycmUtTG91aXMgQm9zc2Fy
dCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2Rh
eSwgTm92ZW1iZXIgNCwgMjAyMSAxMjozNyBBTQ0KPiBUbzogQ2hpYW5nLCBNYWMgPG1hYy5jaGlh
bmdAaW50ZWwuY29tPjsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnDQo+IENjOiBrYWkudmVo
bWFuZW5AbGludXguaW50ZWwuY29tOyBsaWFtLnIuZ2lyZHdvb2RAbGludXguaW50ZWwuY29tOw0K
PiBDVExJTjBAbnV2b3Rvbi5jb207IEdvcGFsLCBWYW1zaGkgS3Jpc2huYQ0KPiA8dmFtc2hpLmty
aXNobmEuZ29wYWxAaW50ZWwuY29tPjsgTSBSLCBTYXRoeWEgUHJha2FzaA0KPiA8c2F0aHlhLnBy
YWthc2gubS5yQGludGVsLmNvbT47IExpYW8sIEJhcmQgPGJhcmQubGlhb0BpbnRlbC5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIEFTb0M6IEludGVsOiBhZGQgc29mLW5hdTg4MjUgbWFj
aGluZSBkcml2ZXINCj4gDQo+IA0KPiANCj4gT24gMTEvMS8yMSA2OjAwIEFNLCBNYWMgQ2hpYW5n
IHdyb3RlOg0KPiA+IEZyb206IERhdmlkIExpbiA8Q1RMSU4wQG51dm90b24uY29tPg0KPiA+DQo+
ID4gVGhlIG1hY2hpbmUgZHJpdmVyIGlzIGEgZ2VuZXJpYyBtYWNoaW5lIGRyaXZlciBmb3IgU09G
IHdpdGggbmF1ODgyNQ0KPiA+IGNvZGVjIHcgb3Igdy9vIHNwZWFrZXIgYWRkaXRpb25hbGx5LiBE
ZXBlbmRpbmcgb24gdGhlIFNPQyBIRE1JLCBETUlDLA0KPiA+IEJsdWV0b290aCBvZmZsb2FkIHN1
cHBvcnQgYXJlIGFkZGVkIGR5bmFtaWNhbGx5Lg0KPiA+DQo+ID4gT25seSBhZGQgaW5mb3JtYXRp
b24gcmVsYXRlZCB0byBTT0Ygc2luY2UgdGhlIG1hY2hpbmUgZHJpdmVyIHdhcyBvbmx5DQo+ID4g
dGVzdGVkIHdpdGggU09GLg0KPiA+DQo+ID4gVGhlcmUgYXJlIGN1cnJlbnRseSA0IGkycyBtYWNo
aW5lIHZhcmlhbnRzIG9mIEFETC4NCj4gPiBUaGlzIHN1cHBvcnRzIHRoZSBoZWFkcGhvbmUgTlVB
ODgyNShTU1AwKSBhbG9uZSBvciB3aXRoIHNtYXJ0IG9yIGR1bWINCj4gPiBzcGVha2Vycy4NCj4g
PiBCb2FyZCAyLDMsNCB1c2UgU1NQMiBmb3IgQmx1ZXRvb3RoIG9mZmxvYWQgc3VwcG9ydCBleGNl
cHQgYm9hcmQgMS4NCj4gPg0KPiA+IEJvYXJkIDEgOiBOQVU4ODI1ICsgUlQxMDE5UChTU1AyKQ0K
PiA+IEJvYXJkIDIgOiBOQVU4ODI1ICsgTUFYOTgzNzMoU1NQMSkNCj4gPiBCb2FyZCAzIDogTkFV
ODgyNSArIE1BWDk4MzYwQShTU1AxKQ0KPiA+IEJvYXJkIDQgOiBOQVU4ODI1DQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBEYXZpZCBMaW4gPENUTElOMEBudXZvdG9uLmNvbT4NCj4gPiBDby1kZXZl
bG9wZWQtYnk6IE1hYyBDaGlhbmcgPG1hYy5jaGlhbmdAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IE1hYyBDaGlhbmcgPG1hYy5jaGlhbmdAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAg
MS4gcmVtb3ZlIGhkYWNfaGRtaSByZWxldmFudCBjb2RlcyBzdXBwb3J0DQo+ID4gICAyLiByZW1v
dmUgZHVwbGljYXRlZCBtYXhfOTgzNjBhX2RhaV9saW5rIGNhbGxzLiBJbnN0ZWFkIG9mIGNoZWNr
aW5nDQo+IG5vX2FtcCBjb25kaXRpb24NCj4gPiAgIDMuIGFsdGVyIG1vZHVsZSBsaWNlbnNlIG5h
bWUgdG8gIkdQTCINCj4gPiAgIDQuIGR1ZSB0byBydDEwMTkgbm9uLWkyYyBtb2RlLCBzbyBjaGFu
Z2UgdG8gU05EX1NPQ19SVDEwMTVQIGluDQo+ID4gS0NvbmZpZw0KPiA+IC0tLQ0KPiANCj4gTG9v
a3MgZ29vZCB0byBtZSwgdGhhbmtzLg0KPiANCj4gQWNrZWQtYnk6IFBpZXJyZS1Mb3VpcyBCb3Nz
YXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+DQpBZGQgTWFyayBmb3Ig
Y29tbWVudHMsIENDOiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+DQpPciBJIG5lZWQg
dG8gUkVTRU5EIFYyIHdpdGggQWNrZWQtYnk6Li4uIGluIGNvbW1lbnQgbWVzc2FnZXMgZm9yIHlv
dXIgYXBwbHlpbmc/DQo=
