Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCEB3B3A48
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Jun 2021 02:57:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AF01165D;
	Fri, 25 Jun 2021 02:57:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AF01165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624582677;
	bh=NDTT4lOdxcJyCmwMGLSjWjknFuFv6HkEocpFD7NtJQg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dWHXwqXP99bfNVBSTLapCwfgCHEzra3ORHhMlDc0hkT+5ZNNqlB7x4jFj0ub67SFA
	 h07OROe5WsZlbkF2KU8+CJxA+w0OKg5jXnvWGh6Xvzk4uequcU6pG4jegecRsIdgKz
	 V5y7JBc+gFdSwqQKHOn9Eh2Dv/CwfPWEApMYuz8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC8FEF80268;
	Fri, 25 Jun 2021 02:56:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FF53F8025F; Fri, 25 Jun 2021 02:56:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 968CDF800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Jun 2021 02:56:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 968CDF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="tJkKZ7yK"
IronPort-SDR: YNX2CO3+er0so1fk9A0rjIcDa7kGz6z73vEHyMHU4RpL7q04MkhODtbVM7hdyvwszFoLGDpHK9
 QgFXRq94gL7Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="187275052"
X-IronPort-AV: E=Sophos;i="5.83,297,1616482800"; d="scan'208";a="187275052"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 17:56:13 -0700
IronPort-SDR: +oGxZ8LYg9IeM0IYjSu8ODJ859E4gxjATolmdRA88Su+oknwCQjIcQo44Un48xoRMHFLB6/pPx
 urpZ0B07E+Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,297,1616482800"; d="scan'208";a="474703881"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga004.fm.intel.com with ESMTP; 24 Jun 2021 17:56:13 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 24 Jun 2021 17:56:13 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 24 Jun 2021 17:56:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Thu, 24 Jun 2021 17:56:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Thu, 24 Jun 2021 17:56:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqVL85OP/C7NQIrfO/gzJzQUXAjitCDDxvUFp2ptxpTsbNW4MIfphJL9qqNhlUxgWiqL/041tfGfQtzVHSvoAEfXx+zoJEnhMfGw2bfpjOEr1yZbYi1Xv1R5BxlUjQCGgkLs9rpltvj/MY/34++V5L6BqVroHZZvg8kCa00JQ0m6BC59pMD9RRHOmzxNAMdt8p2oI/wXMWgbDkbuvAMIroHmUCWA0DJ5rJ4xMQfp/Nw/04meVJ+SgwdzYMEPZIL4gfcTOpyETDuBWbOmNBMjXjwe7iMbzC4bAhDUJGpa+Ls3l6Up+DipdbM9QQ1lTgL7BuvYMl9ezg5ipFAVhHzuSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDTT4lOdxcJyCmwMGLSjWjknFuFv6HkEocpFD7NtJQg=;
 b=m+BCtXR4qWtNXGWUDe5ycDmisvNHjkByG5+OIrH8y3nva0JvSQ5ugy5Aat6EoJ5dNXVmhVaFhl4q4oUKPyPWRf2BP9OmBwdv4t8C5xYPkaSYTrlLSes1dvrt3zrV3uaZSyb6nM5fKICtSAcCNVS13ncIt07ZA/nS7r/uf8KMmZ1i2jEY2fTLeHuaej8uIxKtixSAW5xE8yWOk+w5jckWJwh2vexmgwNbn45EnWY5NMguoDDWhyCUiy63bGilypRH8dK5ZT1sXtl6dzZr6uibhV0Gax4UXSrgLaILjcKHALdDOIG1ODLv97cvEykwZgO1OC5mOqvEsWrW27tAyRS/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDTT4lOdxcJyCmwMGLSjWjknFuFv6HkEocpFD7NtJQg=;
 b=tJkKZ7yK7xrZj2Pg8DMwN8FMPgODx1XEARFfC3l74uX3FGwA6sASOaNNUEfk9ROlpjST07Lg7G4st+kLOQoGDjnQ7CD2UDoWqw7CdlmxSA+YT0jWvwCFcivEKaS2f+2AkgriTtz0bpWEsNAwtL5ZMa+SiJsAI7T1P34Isnpq90E=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM5PR11MB2025.namprd11.prod.outlook.com (2603:10b6:3:8::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.22; Fri, 25 Jun 2021 00:56:11 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::ac3a:8a82:30eb:91ac]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::ac3a:8a82:30eb:91ac%6]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 00:56:11 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
 <shumingf@realtek.com>
Subject: RE: [PATCH 1/2] ASoC: rt711: remap buttons
Thread-Topic: [PATCH 1/2] ASoC: rt711: remap buttons
Thread-Index: AQHXY1iPnr5JvNkGm0yu9KqwB95MFasYJN0AgAAN7+SAAA87gIALr7XQ
Date: Fri, 25 Jun 2021 00:56:11 +0000
Message-ID: <DM6PR11MB36429932EACD0E41AF832A6B97069@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <20210617090809.16901-1-shumingf@realtek.com>
 <20210617123914.GD5067@sirena.org.uk>
 <d6374c5158c844d69b4f546fd741f07f@realtek.com>
 <20210617132716.GE5067@sirena.org.uk>
 <638be5ea-a310-3711-df08-798f7bee5804@linux.intel.com>
In-Reply-To: <638be5ea-a310-3711-df08-798f7bee5804@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [36.230.112.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 508edf67-4bfb-4b2b-9fb8-08d93774069d
x-ms-traffictypediagnostic: DM5PR11MB2025:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB2025408929C4F3D4C6AC31A797069@DM5PR11MB2025.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1169;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OfBLodcC4VOMVlHXVvg9OQ98fAbjtGG6p/UhvrKd+0WFimiXr0hhuwIKD2OYqKYs8Dg/ysfRpgtfmsQuqcvSyiSBRkOG8oHbnGEtYrhX4qjIqf+RdXIlaB4P6YP8Kk2wgIhPTKUwvlIu/1qm111syuE3ZIozeKqypOlQDKqQBYHa5K9MNZhFgC9WN/thPPStDEFS0xrmadfFGFCpZmfBIQPvVvT0FYRyE4l14XboAVYEmlfw+BECYKZl/7pCEU78J4gwdT0SSFxUa3F1Dc0vmLGrQp5nvlepkv90Ma8x2n+N2Bs+erUdGofBv2jHUfbE68Son3h3AMn7aAj1S5lwuCnOiFZnzCTEeK4fkcIEXmEyvpbxppJX2zTRZspsVs+iAMqY0qmebP6OLdYaSlApAf6ejAhaK4n9VEJ9bYKrTDfDuBkXmdlr2KC/uSSf10XwrizKS18xFnPWTumKacbktMaJwKjqDCbDJhzIRdrmZSWY5merrPySFN2jvGd2VNH/t0vMTtxPY0Z29c29wN953L4RmjEqQhxNP2cNZIUxwktJukIjaXLjEr+lJaekWi2Sn+mYJQz7Rs6N+Qgupn0Igq52gBTOrQZE7rrm4uYChQ/4d46OUk/XJx7FPWVijJr9WJWYykY/9eId/9WaZGqs+XNpsaXog/gXD15Ux3rak973c9hZOMHqShI9jpxJ5Lz+PWDZyt87v8zsUIknpN67Fn/hSeuuCB8Ny8YlpmWspSjXtVGRr+N48svnQ3BR7HY8i42dOVdWed31OyO24k17Zg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(346002)(366004)(396003)(86362001)(478600001)(5660300002)(122000001)(7696005)(2906002)(38100700002)(4326008)(8936002)(316002)(110136005)(52536014)(9686003)(966005)(66946007)(6506007)(7416002)(76116006)(66476007)(64756008)(66446008)(66556008)(26005)(186003)(55016002)(54906003)(33656002)(83380400001)(8676002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RThoZkZLbzVyOTVUMmdmRTNwUEIyY0lNSU5iMUZzajF0TVlZNHNjNHN2SVFT?=
 =?utf-8?B?NlVDUUp1OE81ckU3NFdFcjVCWGhkZ2M3aFNBcVNHdDB2SVRVaWE5QmR0TTRa?=
 =?utf-8?B?TXpzalk5VmJPY1VuSk50ZjFXUjNHNjF4ZExsVlhraUU1cVo2Q3VmVU1IK0R1?=
 =?utf-8?B?QUpVeTdndkdvOFhXZE0wNDNFSWNGUTROamdrR2lhbEo3d3pLUzJSQUJGcm42?=
 =?utf-8?B?aGIwdENLQjc2aTNsOEI5aEk5clZIS3lhMmo4SkY4bWFaRkpCT29veVh2TUxu?=
 =?utf-8?B?bS9xaGI2d0YwT0t0YjFldVFuTFp5c0h2UVhnQWI0ZDZRL2VpNElIVUNLT0xT?=
 =?utf-8?B?dU1kSG04TW84UVFxQkxaRG9lQVV3enFzUXFrbTd4ZjNhRVlLZjd4Q3BzNzkw?=
 =?utf-8?B?dnBBUzN3Z1IwQldLMnFrUEFqT2VLbldUZHRhdW9YbG40Y2lZcUxlb1lValRt?=
 =?utf-8?B?VSt2NG81a2t3MG5BRk96aFU3NmhscTVZMEdkQ0ZuWDdKT2tOZE9SK2taTjBD?=
 =?utf-8?B?ZlhOTE5mbDIwUkNNMTFOaGFaYkdWR1NabVlXdGhWaC9zamJaQUYrL3B0WHJD?=
 =?utf-8?B?cjBGTUt6aFV4MmU1ellNYWp4TnhMSmYwZnU1bkxEbmJzb3ZSSW9Od0JZdW9N?=
 =?utf-8?B?SHdrTHAwRXdLVy83NWxBbDBNbm8zOUNzQmN2algybkYxVEU4Y29FTlRhcHVE?=
 =?utf-8?B?ME1DZU5MU1hBU0Z6Z3d1c3BJN3hkbGZSV2ltdEo4NXhKTnF6Rzh2dVVMRkU0?=
 =?utf-8?B?a0JzK0RlOGhnSDl5VlJJLy9CSlVLaDdnMFppQU9GTWxlc0FNbWN6VXZ2YndZ?=
 =?utf-8?B?U0hmb3c0d0pPcTVycDBZQzBNdGJTd1dvNDlSaUNaWldNMEZaYURzb0o3ZWhK?=
 =?utf-8?B?Y242UEZSazlxSHR5NC9FU3JrMjhhRmVTQkNzMTNmQWJvbVFTalZMY1B1UG1k?=
 =?utf-8?B?dnNpMm8yQUhwemdSeUtmNlB6aFJySm9XeGZySHg1cUFHdW1BTUJ4c0F6WW1w?=
 =?utf-8?B?bVNNb0UrcTExdWRYdERPTFdpTHcxSWZtaGU5c2M4Q0lVMk9OYUNhQTFETGVq?=
 =?utf-8?B?ay9sampWUGYwYW9qaUo1cTNsZzRIRUFPVXorb1dPZHluSEFhNEQzc1dXOEFu?=
 =?utf-8?B?MmhGMEpTMjZGTFBDanltODI0OGZuTDYySkNoS2thd0pRQ05pRm9yUUpJSHhR?=
 =?utf-8?B?QzkrR2UvbERLSXZJbWM2N3JDd2J1Z2dSU0xDYlVyQjhHTmthQ1J4NHdxNnZJ?=
 =?utf-8?B?NFo0bmlhcHNLL2ZpSmM0NlpZeDE0N1VRWUxqTkRHZzhXTkpPaG9JcEhaR1Nm?=
 =?utf-8?B?Q2ZpdHlFY3JtTExxV1gyYkFRZ3R0Q2xIZmNENDBwQmVwOHd3a0JlSjNyNk1O?=
 =?utf-8?B?V3dzdnF0WHpqMm9zNWFnWVQxNU5GMWNlZTh5NmR3M3BrREZZRG1IS2llQXJD?=
 =?utf-8?B?ODdVdnEraHNqZWFta0x4YTF4cmpjSFUwUmtEZEc5TWhBcXpmTjB0YUpZbDZK?=
 =?utf-8?B?QVBndU15UHNKNjVwam5zY1FCYUZkbG5QUDVyaTJmeGUzRjJjbVdIOGFWTGo3?=
 =?utf-8?B?R3NCZ2tzL2FrNllqQTVOODVaR2xaenc1a1M0OFRKRkk0TW4reTltUFFkV2s1?=
 =?utf-8?B?azBReUZOZTNLN3JKT0tnb05NTFNiT0xCc0dXSDZVUGxKZTNsbmxwRVlJTGRR?=
 =?utf-8?B?RDlHUTBwRDF0cG9sOW5TOGFwVGJhWnpad2Q1WGZhdDBOS005OEFLaWFhUm1G?=
 =?utf-8?Q?IwzXEwZlF/pQR6lXWo2rR2IR7kwJ6y3k3GpsYvb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 508edf67-4bfb-4b2b-9fb8-08d93774069d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 00:56:11.5343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TtPtZvgihxzSJEhbSDXqAInCOqEA2CSV2AC+U1cI81yr4Yx05EnnszHUN1PeaNpGwo8SAZrtEwfP2oyxnR3FDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2025
X-OriginatorOrg: intel.com
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Arava,
 Jairaj" <jairaj.arava@intel.com>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>, "M R,
 Sathya Prakash" <sathya.prakash.m.r@intel.com>,
 Curtis Malainey <cujomalainey@chromium.org>, "Liao,
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

PiANCj4gSW50ZWwgaGFzIG5vIHNwZWNpZmljIHJlcXVpcmVtZW50LCB3ZSBqdXN0IGZvbGxvdyB3
aGF0IHRoZSBHb29nbGUgNC1idXR0b24NCj4gZGVzY3JpcHRpb24gc2F5cyBbMV0NCj4gDQo+IFRo
YXQgc2FpZCwgSSBjYW4ndCByZWNhbGwgd2h5IGhhbGYgb2YgdGhlIG1hY2hpbmUgZHJpdmVycyBm
b2xsb3cgb25lIHBhdHRlcm4gYW5kDQo+IHRoZSBvdGhlciBoYWxmIGEgZGlmZmVyZW50IG9uZS4N
Cj4gDQo+IFNhbWUgYXMgc3BlYzoNCj4gc29mX2RhNzIxOV9tYXg5ODM3My5jOiAgc25kX2phY2tf
c2V0X2tleShqYWNrLT5qYWNrLCBTTkRfSkFDS19CVE5fMCwNCj4gS0VZX1BMQVlQQVVTRSk7DQo+
IHNvZl9kYTcyMTlfbWF4OTgzNzMuYy0gIHNuZF9qYWNrX3NldF9rZXkoamFjay0+amFjaywgU05E
X0pBQ0tfQlROXzEsDQo+IEtFWV9WT0xVTUVVUCk7DQo+IHNvZl9kYTcyMTlfbWF4OTgzNzMuYy0g
IHNuZF9qYWNrX3NldF9rZXkoamFjay0+amFjaywgU05EX0pBQ0tfQlROXzIsDQo+IEtFWV9WT0xV
TUVET1dOKTsNCj4gc29mX2RhNzIxOV9tYXg5ODM3My5jLSAgc25kX2phY2tfc2V0X2tleShqYWNr
LT5qYWNrLCBTTkRfSkFDS19CVE5fMywNCj4gS0VZX1ZPSUNFQ09NTUFORCk7DQo+IA0KPiBzb2Zf
Y3M0Mmw0Mi5jOiAgc25kX2phY2tfc2V0X2tleShqYWNrLT5qYWNrLCBTTkRfSkFDS19CVE5fMCwN
Cj4gS0VZX1BMQVlQQVVTRSk7DQo+IHNvZl9jczQybDQyLmMtICBzbmRfamFja19zZXRfa2V5KGph
Y2stPmphY2ssIFNORF9KQUNLX0JUTl8xLA0KPiBLRVlfVk9MVU1FVVApOw0KPiBzb2ZfY3M0Mmw0
Mi5jLSAgc25kX2phY2tfc2V0X2tleShqYWNrLT5qYWNrLCBTTkRfSkFDS19CVE5fMiwNCj4gS0VZ
X1ZPTFVNRURPV04pOw0KPiBzb2ZfY3M0Mmw0Mi5jLSAgc25kX2phY2tfc2V0X2tleShqYWNrLT5q
YWNrLCBTTkRfSkFDS19CVE5fMywNCj4gS0VZX1ZPSUNFQ09NTUFORCk7DQo+IA0KPiBzd2FwIHdy
dC4gc3BlYzoNCj4gc29mX3Nkd19ydDcxMS5jOiAgICAgICAgc25kX2phY2tfc2V0X2tleShqYWNr
LT5qYWNrLCBTTkRfSkFDS19CVE5fMCwNCj4gS0VZX1BMQVlQQVVTRSk7DQo+IHNvZl9zZHdfcnQ3
MTEuYy0gICAgICAgIHNuZF9qYWNrX3NldF9rZXkoamFjay0+amFjaywgU05EX0pBQ0tfQlROXzEs
DQo+IEtFWV9WT0lDRUNPTU1BTkQpOw0KPiBzb2Zfc2R3X3J0NzExLmMtICAgICAgICBzbmRfamFj
a19zZXRfa2V5KGphY2stPmphY2ssIFNORF9KQUNLX0JUTl8yLA0KPiBLRVlfVk9MVU1FVVApOw0K
PiBzb2Zfc2R3X3J0NzExLmMtICAgICAgICBzbmRfamFja19zZXRfa2V5KGphY2stPmphY2ssIFNO
RF9KQUNLX0JUTl8zLA0KPiBLRVlfVk9MVU1FRE9XTik7DQo+IA0KPiBrYmxfcnQ1NjYzX21heDk4
OTI3LmM6ICBzbmRfamFja19zZXRfa2V5KGphY2stPmphY2ssIFNORF9KQUNLX0JUTl8wLA0KPiBL
RVlfUExBWVBBVVNFKTsNCj4ga2JsX3J0NTY2M19tYXg5ODkyNy5jLSAgc25kX2phY2tfc2V0X2tl
eShqYWNrLT5qYWNrLCBTTkRfSkFDS19CVE5fMSwNCj4gS0VZX1ZPSUNFQ09NTUFORCk7DQo+IGti
bF9ydDU2NjNfbWF4OTg5MjcuYy0gIHNuZF9qYWNrX3NldF9rZXkoamFjay0+amFjaywgU05EX0pB
Q0tfQlROXzIsDQo+IEtFWV9WT0xVTUVVUCk7DQo+IGtibF9ydDU2NjNfbWF4OTg5MjcuYy0gIHNu
ZF9qYWNrX3NldF9rZXkoamFjay0+amFjaywgU05EX0pBQ0tfQlROXzMsDQo+IEtFWV9WT0xVTUVE
T1dOKTsNCj4gDQo+IEJyZW50LCBDdXJ0aXMsIEppbW15LCBjYW4geW91IGNvbW1lbnQgb24gdGhl
IG9yZGVyPw0KPiANCj4gDQo+IFsxXSBodHRwczovL3NvdXJjZS5hbmRyb2lkLmNvbS9kZXZpY2Vz
L2FjY2Vzc29yaWVzL2hlYWRzZXQvcGx1Zy1oZWFkc2V0LQ0KPiBzcGVjI2NvbnRyb2wtZnVuY3Rp
b25fbWFwcGluZw0KPiANCkhpIFBpZXJyZSwNCg0KSSBqdXN0IHNoYXJlZCB0aGUgbGluayBbMV0g
d2l0aCBPRE0gYW5kIGNvZGVjIHZlbmRvciB0byBkb3VibGUgY2hlY2sgdGhlIA0KbWFwcGluZyBp
cyBmb2xsb3dpbmcgdGhlIHJlcXVpcmVtZW50Lg0KDQpSZWdhcmRzLA0KQnJlbnQNCg0KDQo=
