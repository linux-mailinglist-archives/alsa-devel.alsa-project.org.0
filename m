Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1FC49351C
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 07:41:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 056923342;
	Wed, 19 Jan 2022 07:40:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 056923342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642574494;
	bh=L97Xye9yYf1Kb8Bg2yBVX9i1MsyPCl5GpK66QFmHPgE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EQlYW8aN+zkFc07cV2cVyHpVvS3jCVuUY+OzcfAKjcGqmqMd6A82uFOxg56H5k5uW
	 ZQRT/Lnq0By+NQ/WhDq9vYyvMOSr7jGK1gu2fpCbR53gxAY3elOAMY9qXNPiZSmup9
	 BoSI/vKecWhwt41GyviZoq8xRo6ydY7K7QyxbM74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79AC5F80212;
	Wed, 19 Jan 2022 07:40:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14BA6F801F7; Wed, 19 Jan 2022 07:40:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D4E9F80128
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 07:40:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D4E9F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Sf5KkRym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642574422; x=1674110422;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L97Xye9yYf1Kb8Bg2yBVX9i1MsyPCl5GpK66QFmHPgE=;
 b=Sf5KkRymF5kigJH6tfmRvjXHJc5zXUVJqKXppaq0gTNnHtuE+cy0n+gN
 TDMIn55ezDVUHeBDHcVnXNJ1+Tq1UShy7avSD06La9ya1abnqm29ItFyf
 daZQVKook4L6HA3V9Y4gQqWca3EPRbNv4FhLrZsMuzHt+bAPV3ev/jF1x
 QyybjxsK2YkSQfE3Dfgw/Y8l1y/cHfYx+VqdtvoNdgRW5lyYrpzreQXN+
 RdqYCHJ8EerGhJ29v5rBDFRFeqHkbWTUr+BW3lFlAheZ93qA+YeI2pFRU
 nwcWjU8cjIWGZNohImSt0n+akvh64TDk8cAoCh09PHNFgsLPzFFeQH0F3 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="244955505"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="244955505"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 22:40:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="625776461"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga004.jf.intel.com with ESMTP; 18 Jan 2022 22:40:16 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 18 Jan 2022 22:40:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 18 Jan 2022 22:40:16 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 18 Jan 2022 22:40:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzDOXFF1I+8ifpn9UrVk457pR/b+PCPCWVDZeaXtMZxKYf16ktALM7zcgr6B1LJAQjMR5v6dcjqUR3tamqvMciufvswC3KHanO1aGlLBKqjWoY+RiWNiBhBFULlagS8gnMRC8nAt84Yc0RXhZjvrLOlpl7FsGj1sdZGlHNkIO0KQFoVgyqT87MSzki7EjADL+iJ8JWwg5I76xV7z5iQLBNgYfMW6+FXCtKKXyK3DmqSCRqWf3m6jK5jAAF/oOEoXWpgedLLfGopnyRo6LLfW6L9DV8lQKesVmjTScxpVo3ol9FYmSO+QZg/6O+7pCaxx3iucs14Y9koq5RcsCsUVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L97Xye9yYf1Kb8Bg2yBVX9i1MsyPCl5GpK66QFmHPgE=;
 b=V5E3CwWqlFMqSHArCdeC7M1WxiJGinnRZyQ4bQy4DqUMuQyUd3aGbqH1QlSYGO5E06Yfgq8S36wk180nVVgjF3DZgfwMxU09nZxHxmkVMZygt84C04nbDXTb04+wRbU0xe2BolNLoDsBPxNdgIp9eu2hXZMYsSugllxY1oEgv83C+QYIVWgC3qf8H9aMmsk1mb2W0ghK4bpYrh88Hj86P6911LYLEpInClzY1sTlstBAJVbvCF76sotBIu4im0SYXCX4NnMq5GVpXMIU5myaeBDmMhKhNQNp3336V0EFa/Q7DzOcHC5TuuunsfMYq/arRYZ/DODyDCe7Wgb4+ftffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by DM6PR11MB4706.namprd11.prod.outlook.com (2603:10b6:5:2a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 06:40:15 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::d131:a091:314e:a310]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::d131:a091:314e:a310%3]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 06:40:13 +0000
From: "Chiang, Mac" <mac.chiang@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: sof_rt5682: add 512FS MCLK clock
 configuration
Thread-Topic: [PATCH] ASoC: Intel: sof_rt5682: add 512FS MCLK clock
 configuration
Thread-Index: AQHYDEiD28XLz6gq+UCgfa9ioKrL9qxo5QaAgADycRA=
Date: Wed, 19 Jan 2022 06:40:13 +0000
Message-ID: <PH0PR11MB583286547DFF8BA8CEB2B0D584599@PH0PR11MB5832.namprd11.prod.outlook.com>
References: <20220118084952.9555-1-mac.chiang@intel.com>
 <6aba2a91-695c-c69b-db0a-59a6b27fb425@linux.intel.com>
In-Reply-To: <6aba2a91-695c-c69b-db0a-59a6b27fb425@linux.intel.com>
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
x-ms-office365-filtering-correlation-id: 9afed20c-9b16-4a76-54b0-08d9db168c45
x-ms-traffictypediagnostic: DM6PR11MB4706:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB4706B2607FF1BDFF21AA397B84599@DM6PR11MB4706.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: it2hNAhoa1E2cRL7rTTExPUT2GpVVC9cRqg0mwZCZLM8prToK7uG6kATReOT2YNoaI+UEKSxIqFLHwtsgKmv6F9v8LaSqFUX++Xv0ejVCgKfdYxq36tNegIcSpmnpTXUmbQZ9h2Z93h2JK9A0H7i9Z7vCC+VElTuJy1yh+wLKWMzyCqXx1gIwt5paMZ00iyrszRt1/bQ4qg5YIwTPTItr+eka3uJ+MG9z8QUXI3sOJVq8ibCPfwtSUnMWdwzyXIpPlnqXFSaGiH4He4DTYV1xoGLOar3D572If97DRFsAifsMKl3Lmb0gzI98eQmB6NYLh28KQQPDs38/IzyZu4g4E2sYAYJUKwqjcFu9VBK89LDnD57WwsJmymTdLQ/ALERUq+911iODSMtt4nmnDKcsxHDfDHXG2H7pHxEiP3inSWucSl9wr+EZaEkhH/RYXyUiR5Tb15Oo7n6iWkld0115Fm14B+8UoZzpwoho70hLpkLOEGzKX6OsxfD8KX0gdT38Lrc1NenG+/nZy+xIqQp3EFZ1cYqbi8Sn7njC0wChPYaxgsLsyIbB3nXJSrzf0JKpCfX9UCMnS/CXyisaRpzcs4OEF3Gei5WoVGfYWIKCIbBnGpVyVLNFkjDN+ay7fMQZ4X7VZHnu6tC27E8NSCSWepcn4iCuwK2xwm++PaAC81HtwEDzRy+e22DhRz+chQ0ZdUb8hAtkoF5MkzS5DxsvQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5832.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(508600001)(316002)(64756008)(66446008)(54906003)(7696005)(8676002)(82960400001)(6506007)(8936002)(2906002)(38070700005)(186003)(110136005)(71200400001)(76116006)(66476007)(66946007)(66556008)(52536014)(86362001)(26005)(55016003)(122000001)(38100700002)(9686003)(4326008)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sk1pSTlIU2NsdGhHWU9uRDR6cm1mb0s5Q1FhYS90R1RmSUZuMTF6QmRMalgx?=
 =?utf-8?B?VTFNakUvNkhFTlJPMDYwbHVleXQ1QTh3MXNhYzJZZnQ1N056M0xhU1hlT094?=
 =?utf-8?B?VThMWHVDdHpTNlVBMWdYZCtKdnFHbGFtZkxKMDR3elpnaU9BU2EybTVLOW13?=
 =?utf-8?B?bkdRa28raUVNQUlGVk1OV1dtQnZmV1BsZ3ozb1dGNkhTQzlmYlNjSGQ2R3RR?=
 =?utf-8?B?UlNNbWRjVWNOVWhRWUtsd2xoZC82bi9nYUp4TkgrdGVSbFdMU1RVMy9uMkxC?=
 =?utf-8?B?ZWhjSTM3YnM5aE5aenFYbEMydm9GL0FGKzdNYTBRT1U3aTVjU0xrZHB6VGxn?=
 =?utf-8?B?K1UwdHBrVnR2djBtRGhlLy94SkFqMkFESXMwbmIvQXVOSEN2Q2RlZmZCQXNh?=
 =?utf-8?B?VTVTb2VOa25rY3VYYkZCR1dkUkJuVW4rc0NGNFNUbDZ6R2JOcTZGcFRhcDRt?=
 =?utf-8?B?cjFEWVQ2d0FjQlVKS1lGemdyVnE3cUp0cUgyN3IybXdwSWlFMjhqT2dBOW9P?=
 =?utf-8?B?VlVCbEk2NmpMUWFDMnArR3VtUGhKYkxiQUFuaWdCOTJjNlkvaE1qUFJOUnpz?=
 =?utf-8?B?TytqZis1M0wyOExmY0lMWTRRdDZIYW5FZ1hsL2ZWWFBQV2xERmdRWFlRSHQ5?=
 =?utf-8?B?enRsTlNhK1VWN0lNSGdHYU5PSFR3bmMzUTZyRXRIRTJwaXMzYlhIb1hIdlJN?=
 =?utf-8?B?QlZiQkk0dmlsb3U3RW5YVzhZN3FMRHl2QWxPdFJpanhUOHZLZHl5MkpZV2k0?=
 =?utf-8?B?T0N5NHh3a3NEN2VXZVN0ZXdibHVlQWFicUlkV21QS3BiSUpzVldEOEo5NHpx?=
 =?utf-8?B?Y0xTZUs3Uy8zOVphTndHWjlEY0h2NzIxK3E0Umgwb1V3SXM5S0pyRHNJZS9J?=
 =?utf-8?B?SVJmUUNDVC9zQVIySzhVK2cxTEJBSmkrVGQxRUcvK2lrRndRZ1EyWFozc0F2?=
 =?utf-8?B?TWtYTGprZGd5Y01mK3lIWW9JVXlJcjhKWnFsZm9BMndLM1QvM3NOY0tVYWk4?=
 =?utf-8?B?QTFFSWltQW1qZWZyNEwyRzIwajUwaFZybC9TUEx5dTdoWWQvUFFKMGtVY1Az?=
 =?utf-8?B?eFo5UHB1M0dxdmxhK0U3eThxMS9SRmY3UFo0L3MrdWFzS3VGVUxCaHVHekpD?=
 =?utf-8?B?ZmNhTm1Lajh0M0pZOWNJOHh1VTlkNDlkY2NRZnpHVzgweEt1NFQwbWhzanY3?=
 =?utf-8?B?NHNScUZRcjJENWFTU0RMNzdNNzE2RlNGa21ONklaY2JvY3ZLN2Q0bEdGcTJh?=
 =?utf-8?B?Vmk0MWxWZi90ZWtGaTVQR2Q4cjZpb3d5TXhlVDErd3VhMUJaMUFnNkVLTzZR?=
 =?utf-8?B?Y2tYcFJPb1QzUUFlY1BST2xnTGo3Z2lhY2VhTWFWdlYrZ1c4Qlh6V0xmTkdD?=
 =?utf-8?B?T3REbEhhVStDOU04Nm5MR01wVzdieXJZMHpzZ0E1YlV6RCt4QjdQZCs3V2dJ?=
 =?utf-8?B?Y2drR2dZdDlFZnpyVWx3Ym9ZK3lRbnhiZnV0ZHBSLzRsUjRBUStFNityR0Jx?=
 =?utf-8?B?SHdJdWRSQ2Zsazc3WWk4VEdNRFRQL0NlVFJ4VWxDazdFeFJKNjB4M3JpVUZY?=
 =?utf-8?B?L2dWOUlzZFVOTC9PU0xNR0J6bzgvRHJseFdyZHBWdU5RQ3BnbUZYRWZSUDlL?=
 =?utf-8?B?dENTUU1HcVp5TldFa3F4VnovN214eHVINXBnVUg3TmVKR1BsMndUVkw5Vnc5?=
 =?utf-8?B?RW5iY1Bad3gzZEhhNDdrcjhUZURBSU5Fem1Na3N4LytFaDFGV1U1MmxKQmpw?=
 =?utf-8?B?OUF3bEVBdGo3djN0aE90U25oSW9hWnpCcFo3UWYyamFVRmJVcEpqejRPTWE3?=
 =?utf-8?B?eVhiTHcxRjIvTzEvaGQ4QVA1Y2wvcXlrZkt6SlFGWktLaS9PTmtsc1BkN3ll?=
 =?utf-8?B?MXVXK0Y3WkYxSTc3OG9pcE1xK2ppcTE5TkNxaVpZVHF6eEhmQzFVZnFjam9I?=
 =?utf-8?B?MWNmalhGeWpzbW5aQnRVTVRuaWZLQlIwRXdGT3ZlVzFzb1gxYm1LSlZYdnpn?=
 =?utf-8?B?NXJXaDZKdUNvbGJ4NTRVYmZnNG5QMXRvcVZiaGJDVkgxMHdpVVBOSFJFYitz?=
 =?utf-8?B?T3oyYlpHc1pGRFAyZVl2Q2JGQnQ0WDlhS1c4QVAvNWlsSGxQbVNLY21aU0hl?=
 =?utf-8?B?czJEalM4QklzTEIwOFljTnJRWTNibjlQcDA1WG9BUWR3L0NPMHc0WGNyVldF?=
 =?utf-8?B?Y1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afed20c-9b16-4a76-54b0-08d9db168c45
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2022 06:40:13.7503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C0awpDRckz2xUCfO9h9eb+kvaDMoSjWWUopOoEn7WgnVGCvRh3HUfHiy0hFibJm/fzabhZvhZqiRH1jxIC6DAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4706
X-OriginatorOrg: intel.com
Cc: "guennadi.liakhovetski@linux.intel.com"
 <guennadi.liakhovetski@linux.intel.com>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "fan, 
 shuming" <shumingf@realtek.com>, "Lu, Brent" <brent.lu@intel.com>
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

PiA+IEBAIC0zNjIsNiArMzYxLDkgQEAgc3RhdGljIGludCBzb2ZfcnQ1NjgyX2h3X3BhcmFtcyhz
dHJ1Y3QNCj4gc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwNCj4gPiAgCWlmIChzb2ZfcnQ1
NjgyX3F1aXJrICYgU09GX1JUNTY4MlNfSEVBRFBIT05FX0NPREVDX1BSRVNFTlQpDQo+IHsNCj4g
PiAgCQlwbGxfaWQgPSBSVDU2ODJTX1BMTDI7DQo+ID4gIAkJY2xrX2lkID0gUlQ1NjgyU19TQ0xL
X1NfUExMMjsNCj4gPiArDQo+ID4gKwkJaWYgKHBsbF9pbiA9PSAyNDU3NjAwMCkNCj4gPiArCQkJ
Y2xrX2lkID0gUlQ1NjgyU19TQ0xLX1NfTUNMSzsNCj4gDQo+IHRoaXMgY2FzZSBvbmx5IGFmZmVj
dHMgdGhlIFJUNTY4MnMgY2FzZS4NClRoYW5rcyBQaWVycmUsIHlvdSBhcmUgcmlnaHQuIFBlciBk
aXNjdXNzZWQgd2l0aCBTaHVtaW5nLCBib3RoIDU2ODJ2cyBhbmQgNTY4MnZkIGhhdmUgdG8gYWZm
ZWN0Lg0KPiANCj4gPiAgCX0gZWxzZSB7DQo+ID4gIAkJcGxsX2lkID0gUlQ1NjgyX1BMTDE7DQo+
ID4gIAkJY2xrX2lkID0gUlQ1NjgyX1NDTEtfU19QTEwxOw0KPiANCj4gZm9yIHRoZSBSVDU2ODIg
d2Uga2VlcCB1c2luZyB0aGUgUExMLiBJcyB0aGlzIGludGVudGlvbmFsPw0KPiANCj4gSSBhbHNv
IHdvbmRlciBpZiB3ZSBjYW4gYXZvaWQgdGhlIGhhcmQtY29kaW5nLiBDYW4gd2UgdXNlIGUuZy4N
Cj4gDQo+IGlmIChwbGxfaW4gPT0gcGFyYW1zX3JhdGUocGFyYW1zKSAqIDUxMikNCkFncmVlLCBu
byBoYXJkLWNvZGluZy4NCj4gPw0KPg0KPiANCj4gPiBAQCAtMzY5LDExICszNzEsMTQgQEAgc3Rh
dGljIGludCBzb2ZfcnQ1NjgyX2h3X3BhcmFtcyhzdHJ1Y3QNCj4gPiBzbmRfcGNtX3N1YnN0cmVh
bSAqc3Vic3RyZWFtLA0KPiA+DQo+ID4gIAlwbGxfb3V0ID0gcGFyYW1zX3JhdGUocGFyYW1zKSAq
IDUxMjsNCj4gPg0KPiA+IC0JLyogQ29uZmlndXJlIHBsbCBmb3IgY29kZWMgKi8NCj4gPiAtCXJl
dCA9IHNuZF9zb2NfZGFpX3NldF9wbGwoY29kZWNfZGFpLCBwbGxfaWQsIHBsbF9zb3VyY2UsIHBs
bF9pbiwNCj4gPiAtCQkJCSAgcGxsX291dCk7DQo+ID4gLQlpZiAocmV0IDwgMCkNCj4gPiAtCQlk
ZXZfZXJyKHJ0ZC0+ZGV2LCAic25kX3NvY19kYWlfc2V0X3BsbCBlcnIgPSAlZFxuIiwgcmV0KTsN
Cj4gPiArCS8qIHdoZW4gTUNMSyBpcyA1MTJGUywgbm8gbmVlZCB0byBzZXQgUExMIGNvbmZpZ3Vy
YXRpb24gYWRkaXRpb25hbGx5Lg0KPiAqLw0KPiA+ICsJaWYgKHBsbF9pbiAhPSAyNDU3NjAwMCkg
ew0KPiANCj4gY2FuIHdlIHVzZSBpZiAocGxsX2luID09IHBsbF9vdXQpID8NCkFncmVlLCB3aWxs
IG1vZGlmeSBhcyBpZiAoIShwbGxfaW4gPT0gcGxsX291dCkpIHsNCj4gDQo+ID4gKwkJLyogQ29u
ZmlndXJlIHBsbCBmb3IgY29kZWMgKi8NCj4gPiArCQlyZXQgPSBzbmRfc29jX2RhaV9zZXRfcGxs
KGNvZGVjX2RhaSwgcGxsX2lkLCBwbGxfc291cmNlLCBwbGxfaW4sDQo+ID4gKwkJCQkJICBwbGxf
b3V0KTsNCj4gPiArCQlpZiAocmV0IDwgMCkNCj4gPiArCQkJZGV2X2VycihydGQtPmRldiwgInNu
ZF9zb2NfZGFpX3NldF9wbGwgZXJyID0gJWRcbiIsDQo+IHJldCk7DQo+ID4gKwl9DQo+ID4NCj4g
PiAgCS8qIENvbmZpZ3VyZSBzeXNjbGsgZm9yIGNvZGVjICovDQo+ID4gIAlyZXQgPSBzbmRfc29j
X2RhaV9zZXRfc3lzY2xrKGNvZGVjX2RhaSwgY2xrX2lkLA0KPiA+DQo=
