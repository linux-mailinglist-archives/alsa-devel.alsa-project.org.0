Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C76E35634FE
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 16:19:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E986A16A1;
	Fri,  1 Jul 2022 16:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E986A16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656685164;
	bh=L2eJJXq4cDFi6uLhHfOoNrxIy2+SqJlSDMk2A0UZyGU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yp9DBdfu+7Qk26cloJ5FdsxPf9I9QVoBeHRMwoDN58opnUQMlWY1z0oINsLL0rYsa
	 FPsXd8NPdx8rZDDWKYIRfSPxx6e9oY7WTwiJpivqtEGgyTjJbTwQHE2JDBrwEY+fW1
	 sxI34YOmG9eWD1SUdPEaw2OCB/XMlSjLNzhLaSVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51D51F80256;
	Fri,  1 Jul 2022 16:18:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9683BF80155; Fri,  1 Jul 2022 16:18:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9389DF800E8
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 16:18:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9389DF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aBdZwaJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656685095; x=1688221095;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L2eJJXq4cDFi6uLhHfOoNrxIy2+SqJlSDMk2A0UZyGU=;
 b=aBdZwaJZiiEaGCJnCs5Z+KaZRoikKXZcqWnjfdRzz4n//f8Mz7F9aFWO
 BrpyWWNKMjrbEDQ3dvicPv1ddiH5CAQ1gQxgFXCs+mXZdlcIOTYoBJLGH
 8LzeDOZksyBqMhlI1df2WmFUwp7hGpyQlxlI9WlHzh9yn7mXk/5qSP7Nk
 +tS6H6Nhuq+s8Qsa/LVSlthmD+7xTQNTTO7q1OWVB0wE6R7rgBMaEQtVn
 doplqherzjcvL3FxoEmQNeyxMLVh9vWum/8s+mlu0lH3Pzf0RAt7SRO0w
 0WUIxWYjBBO1Ym61F1yP5XooVrdh9Z//xDg7owWxN8IgO8nYE2ummE//D g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="280213241"
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; d="scan'208";a="280213241"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 07:18:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; d="scan'208";a="589348092"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga007.jf.intel.com with ESMTP; 01 Jul 2022 07:18:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Jul 2022 07:18:09 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Jul 2022 07:18:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 1 Jul 2022 07:18:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 1 Jul 2022 07:18:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKxA94IbMYkirjP9bf+jbNpi7NzyoN+sPXrMN4N9wKTD26sWjZdVCSMtbgVutQkd4ezW+yLiD4yrJpqgpMc8yUzeMQUzOrPi5ZuF8E3MtoGHNLa6V+B8YB5d+FY1BQErTfkNS6WATrttBBb8knUcFpOgHn8TCe9BLqLyHg3tzcSE2a14bTDQIKo+i7BkzVPiDAHOTd+6MOqOz4eEpClAy2arEKabEOvKd6CuWq3nw+5bIGWBvv6uJqliRYhnSIlKU11kO2gwE/NwCUssL/QeuB2Q8VslucoC0wseAgi3Bw2DODBsaVfGXlmEZhUtC3gyUHFYJv+Ldg1REmbLHEa9gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2eJJXq4cDFi6uLhHfOoNrxIy2+SqJlSDMk2A0UZyGU=;
 b=QiBuxT9pb77wEnaGAUeHoo6conR0wXQ4d3Z0vOkvoxb+98ujQfpKKjkEPolskIn7aF5tsEOQ7PJJvDHdV2jq9FrDPUpEu6RJ+cR7iAXqF8vSMyu+3JYhITt/4OTic/+nw6QHYlwfjKC4nZbdAHMrF8YIxrcyjTqhWkWAJOfGQZ97X0MXpSdcSZ+dO8jqGJlQJveS613col30/sD39d3hRGx5CtFGHpd84CBSbsEHAu7Va+/0Kd+QC1sVj9MgSyG/erwCWWwP/N98hHb8rs5NyOzbJF5ojOFSeS1onQLRfFAGyelPW+g+hrJnQewojBe6ITPDNm+hr2fLCj893WJixw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 14:18:07 +0000
Received: from CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::cb5:9c1e:a762:adf9]) by CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::cb5:9c1e:a762:adf9%3]) with mapi id 15.20.5373.018; Fri, 1 Jul 2022
 14:18:07 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: =?utf-8?B?UMOpdGVyIFVqZmFsdXNp?= <peter.ujfalusi@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: sof_rt5682: fix out-of-bounds array access
Thread-Topic: [PATCH] ASoC: Intel: sof_rt5682: fix out-of-bounds array access
Thread-Index: AQHYjSPIjTC3ehIXiU6GYyfr3UYZjq1pWNKAgAA3fUA=
Date: Fri, 1 Jul 2022 14:18:07 +0000
Message-ID: <CY5PR11MB62576242A8647E781F926B3597BD9@CY5PR11MB6257.namprd11.prod.outlook.com>
References: <20220701081908.248239-1-brent.lu@intel.com>
 <b38b3159-2d77-f4fd-f269-d708eb1a90a5@linux.intel.com>
In-Reply-To: <b38b3159-2d77-f4fd-f269-d708eb1a90a5@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ed5271b-c2cd-47f3-6f8b-08da5b6c8510
x-ms-traffictypediagnostic: BL1PR11MB5255:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SmFr2sOYAfxAr7Fa3WKEvFLi08gI4GH2cApXkPDd5XzKtCJEbHYU20kohiQLGtGfuLm/Goi9+iHO2ZF9DZVcHPIEa1Noc8CBEzt2yLD93FmCksvvFBKPaL15zDubIpA0bRS+t3Xeu83UXC7jjuH2AW3UAaVgYNtynkyXtt6gfsNhpXfdSENFTpY3ZHGnwwQmBvST4PWvcN5YVznZfIDh0cPLNqITrAzAM9RUAFWg8/mnqOgx58QLaIrKBMkiyqTlQ6AtfLpU8hevHJpNVH5uyaLWWobNKLxYXNws7X3CEUQDlyJnzt8A6objhqxPy4Co/Qv70PAFqejZcd5ha84fjKW3cXm4zRiK2318p7r3Qe2DibYBqV4xQ0pan9NduraPiOhPUVDM4H8C+fFJAtX9xWy8ILFFhGQN59yLM/igYeltJWd8HznbUkkRjAFNP/KLXyT9f0lZ3LmEMe97jslktnVNTiWlz/VePkRtPyuh5rm2TJlAuV9hLDoNd6bWpct3xLpWXIK9ekOnlqZs0U52kWw/R1r601GKupqdRGP4sNj2jHtqqXahGdsE0AM2UZLyjacPyegv/ngC+B0Xi9y5x5FKJFdckQXRNHA+bC33YIaGqpiZ0YfD5LxMa5x65MdmLOyzyYktkBSxZjPkwfDzqRKMWc2/N6AMbC6wxnzwJcd9HA9TZ+RMj9Af5orOOdPeB3hODuoZSjGdnC8EaetQPlXgKqqoyl/fZMqxr/aHMnJndxdVFMsQlB/45Zks2xaRJeG1iPmtPk32dzTTlk/XnziJkiikPjpVPi91kv5EQvU8Vy15nComRWcqYZhX1PXZCQ7hooPTq7tLZw+hJGKnlg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6257.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(376002)(346002)(396003)(39860400002)(38070700005)(9686003)(26005)(5660300002)(53546011)(8676002)(7416002)(478600001)(66446008)(2906002)(41300700001)(8936002)(6506007)(33656002)(4744005)(7696005)(52536014)(122000001)(54906003)(186003)(110136005)(86362001)(38100700002)(82960400001)(83380400001)(76116006)(71200400001)(66476007)(316002)(66556008)(4326008)(64756008)(66946007)(55016003)(11716005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDlTS1ZqaHBrYlNFTWJZNXVsVmJJOExUSkFRWE4yT0p0amVpUHZGaEsyeXhO?=
 =?utf-8?B?NWxZZHdUUFpBZ0JEdTNSSmMyRldsTk1Id3g1R3RiZWE1RzlJbmFpRWMvZGZJ?=
 =?utf-8?B?cmVya21PT1RaaGM4L1o3RGtMcHFpcW1CZ3FjcWJJcGlhdTNia210QlBsN2p5?=
 =?utf-8?B?T2Z4TDBQVFdjK3NnNDZDR0RDMTBQdzZnZW5qZ002QktUOGYxdkRBUjFUeG5S?=
 =?utf-8?B?dXJRL3BjNS9YS0IwTlp0NjZjN1hhd2NGaVlqcTFUdkpXM3lUeVc2dllQNzB4?=
 =?utf-8?B?L2ptTDY5eUlIZDdXc1NXRW1IK2pUdVFseUpwaVRBK2pVbExvdmN3OWphTk1v?=
 =?utf-8?B?ZDB6emg5cElVU2pxWnhOK2s2U3BrbjQ4QjlWWmtrUUsvVXUyV09Yd2hFYnRB?=
 =?utf-8?B?dklVeTZ3dmM5OEViWGtnVU9aTVRVQ0lESVpUOGZ1Y1FlNk44MmJuaEsxMFYy?=
 =?utf-8?B?Y2xvNTdReHVZdFk0eHFPcklGOGZoNTVaVHR4V3hna2h4VGRNellSVzRuSDRO?=
 =?utf-8?B?NmhBc3ZIQnpNRk9NUG43SWtuaFhkRmh1QjRKOXhiNWJKQ1NNUnM5YjRRZ3pJ?=
 =?utf-8?B?Z0dacnZhZEl4Rmt3SlI3cjFuR3ZhT3RiR0wxMmM0bU9FcVZORS82a3hna3lk?=
 =?utf-8?B?aGliNzFZeG04MHZNSXloNzY4QVRTZXFCWVVMZ2w2cWJGeWtWYVBWc3oxaWZE?=
 =?utf-8?B?a1JkOVVlTS9mcEUySmxkMVZSR0doaGFWcG8yZFJmd244Ylg5VEswbldta2dZ?=
 =?utf-8?B?c3VETmZCMkV2L1JLVmJGbjZmbkEzWVI5Rm5RYjRuUkxRL240eGpJVUw5RjFV?=
 =?utf-8?B?UlBWanUrUjMwMDJGM3RIaU1HbFcwMnVkaWZQczlmbGN4bkFDd2xwWUcyY09w?=
 =?utf-8?B?bHQxcHgwNnFqcmRWWE5NcFQ1cnBmZThFdU1Ud09LaXBnVXpiR0xIY2lpdGJL?=
 =?utf-8?B?cnROSnpPTmIyZDJuZkMrbmNPWkM1RVFGQ0llUXdQYlQrRyszV0VkWkZKOGx1?=
 =?utf-8?B?aWtxODZOMnduZWlTcE4vWGFlTU54TG5xOFNOU0Iyb0pyU1FGNTRMejhjTnBk?=
 =?utf-8?B?cVVJWjgrSjF6VmpyS1dJMkhhVWJMZTBGSUUrQlE0M2I1ZTlMU1N2MVFwa2pX?=
 =?utf-8?B?b3l5aHQ2aDA2TG1pUlg4Nm01S1JaKyt1YjZoNkI2MGQ1N2dCOXRjM3NJTDA0?=
 =?utf-8?B?SFpvTGJsTFRuck9UVDBhSFYwTTBWR3hJaE90RHZEeEQ3SWE4bm1iTUFZNG02?=
 =?utf-8?B?WkJJc2Vlb0dsdmErVTN2MTlDZEFHam90ZklCOHgwUUZXMGpXbkRYK21HaVBq?=
 =?utf-8?B?bFptY3RMSHRSZ2IyRFZielBpSGp5eCsvTnh2ZDZqMFF4bUJxZ0Y4d3ZJeG5D?=
 =?utf-8?B?S0tiODRacjhZakJRb21LbjNoNlIzclBVaTgzL01nSHFIQlJvbXUzbmxLMVJo?=
 =?utf-8?B?Z09WQ1d4dDNmeUkxU0gyNkxFd01GNGtDeGlyNUFZVmNqMDdVYjdSTXc2UUcz?=
 =?utf-8?B?WG1DQXdUSXMwQkcwcGdIZWdLQytOejdTU0N4NG5kUmV3T2Y3aHlvTEZuMnJu?=
 =?utf-8?B?TS8rcldBTUJaaTM4cXdmdGNOQmN6THRuTm9MMitJWjBNS2t3ajhwYitPeHk0?=
 =?utf-8?B?ZHNqTGJjSXVPL25HNWZGMVZ4cXB6OXZKUHlrcjVJT21zTDkvL2F2Y1RhY1pZ?=
 =?utf-8?B?em9rd0JhOWtNYnZ1SDh3RDkxZG1Zc3hZMjlUYXBHOVQwSVo3bDFjbXlLMHNm?=
 =?utf-8?B?L1l6NkVDNTg1VEhieFdCbWJFZFp3L2x3WEdlOXViZmpNTHZyTVVSeSt6MDhu?=
 =?utf-8?B?YVRrUlE4Q3BaYzVkMVNVS3h5ZmtnL3RYMDdZOVM0dExTdzNiWksvdVMyVXV1?=
 =?utf-8?B?WVdPM0VzeFVncUJ2aFJXd2R3Vkl4U1cyajl1bUtOQXBiNmc1L1NwTE5rRUtm?=
 =?utf-8?B?MXNxaUEwWXFSWWlwRWhCRENxWmhWTkREK2VkbEd6ZVkvb1ZFNGw0am1jZnlK?=
 =?utf-8?B?bi9Pbk9DUWplU0FhcERjK0VIMmY2RE5xdCtWSi9tL0taWTdkandvNGZQbTE3?=
 =?utf-8?B?d0Nuc01WSnZaOURzUjVVOVc3d2ZtK0M3VTFrVjAzU1k0OTdmaGp6Q1JlWVd0?=
 =?utf-8?Q?HOF8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed5271b-c2cd-47f3-6f8b-08da5b6c8510
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 14:18:07.3076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xRJcf1K9R3gKXihL2AaFo49Jy30MZD2VGivBF6VGtFIqfbZnrAY97OHdqhOIx5xpSmZ3yNwPzFwU2iZN2emNMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
X-OriginatorOrg: intel.com
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Ajye Huang <ajye.huang@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "Chiang, Mac" <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhi,
 Yong" <yong.zhi@intel.com>
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

PiBPbiAwMS8wNy8yMDIyIDExOjE5LCBCcmVudCBMdSB3cm90ZToNCj4gPiBTdGFydGluZyBmcm9t
IEFETCBwbGF0Zm9ybSB3ZSBoYXZlIGZvdXIgSERNSSBQQ00gZGV2aWNlcyB3aGljaCBleGNlZWRz
DQo+ID4gdGhlIHNpemUgb2Ygc29mX2hkbWkgYXJyYXkuIFNpbmNlIGVhY2ggc29mX2hkbWlfcGNt
IHN0cnVjdHVyZQ0KPiA+IHJlcHJlc2VudHMgb25lIEhETUkgUENNIGRldmljZSwgd2UgcmVtb3Zl
IHRoZSBzb2ZfaGRtaSBhcnJheSBhbmQgYWRkIGENCj4gPiBuZXcgbWVtYmVyIGhkbWlfamFjayB0
byB0aGUgc25kX3NvY19qYWNrIHN0cnVjdHVyZSB0byBmaXggdGhlDQo+IA0KPiAibmV3IG1lbWJl
ciBoZG1pX2phY2sgdG8gdGhlIHNvZl9oZG1pX3BjbSBzdHJ1Y3R1cmUgdG8gZml4IHRoZSINCj4g
DQo+ID4gb3V0LW9mLWJvdW5kcyBwcm9ibGVtLg0KPiANCj4gT3RoZXIgdGhhbiB0aGF0Og0KPiBS
ZXZpZXdlZC1ieTogUGV0ZXIgVWpmYWx1c2kgPHBldGVyLnVqZmFsdXNpQGxpbnV4LmludGVsLmNv
bT4NCj4gDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4gV2lsbCBmaXggaXQgaW4gVjIgcGF0Y2gu
DQoNCkJyZW50DQoNCg==
