Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 475EF604DE0
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 18:55:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3A5CAEF6;
	Wed, 19 Oct 2022 18:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3A5CAEF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666198515;
	bh=MaBNJr8TNyPLZdEw5FIUku77jXzsv/JFNHeYkj1fz4k=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LbE7RIpCRb/UrlhVy/Ux4GPBIUGZTIusQgHqmdtvaW2s7EfqRXHh/1BVVOMA3QjL8
	 gYu2OnRPxuyqJt1/OZKtbwUv3y6c/9Coz5nKfPAED/fpEsJ1fCqyzpe3gjHOFm0gTH
	 ilqrQ26/xlhR/w/EiE2iA9jH4749of8w4EO7EzNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57F74F80166;
	Wed, 19 Oct 2022 18:54:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5C73F804CC; Wed, 19 Oct 2022 18:54:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28DD5F804CC
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 18:54:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28DD5F804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="M65IGgRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666198454; x=1697734454;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MaBNJr8TNyPLZdEw5FIUku77jXzsv/JFNHeYkj1fz4k=;
 b=M65IGgRPSIWmSV4i4KnEK0twRUEuraJb5zfdYvh6bqUjImMKuxlg8C4V
 cYkdjhqSKYHlPHP/DibP9FTCpzQckxqP0beoFMGHpBD+8Xy3TvdVvnyPR
 qZGPl1yZzeyuKTaf/XkBtaG2DErVUPgTrVTeZYI4nD6MIOUCBNiDty2rq
 l6T/EZREDJUtgBe73VuYTCk7efLyNegf9TBc+ioFAfOqsATeht8N/ENhV
 0sC/Ggs8ULfRPa1XTqCJT6Jhe5aOcqsVnsXR8Qg0hosq/Ben4nDFFtsFx
 HUyplwBdIJZF3C5i1ukLq6jwddRS4gxgzgDRNAX/1uM+d5DJSR3K71+rt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="289786372"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="289786372"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:54:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="718575701"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="718575701"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Oct 2022 09:54:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 09:54:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 09:54:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 09:54:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 09:54:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4KISTYpQiJyxciENcmoYWLVcvrW4Bu9edqXfSmKqNZuvzZvMXcPzCBvTK+Anu8Qw/6rKaNX+3NbSHidVHRh2pwu6BSsjK7y1XymTGa2fZu3UUJl7RrU4kLFah+gzamTFJ5WZM696qD1UkK0fR1WEENoPTLRDmKoIxLD2Nc02nxHguWOtWpFIl0KcRP3KwXXMfR7gVkF6gPD2T6y6PoHzaPFr/TAN14WKuhvelQiEobbnUjXMkVi6pMtYWnAvuDWjkGMWlb40oPWf+WkxFNK1y662UUfCdiBfN4+df/d9Dic7QJMCRwKZcHmgYrb+XkFEWzZesIVO6olxL9NBRvnqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pN3bZlpkoYkUxnRem5Jy3sqEVSL0RwIe0iVcB3q6U6g=;
 b=GW0KuRM+Va0wcdbrqgRggy6tDWV6kbfbalE5tJk2oLpEdxkoqZ/cMs8BrM/FKbDslKpE4u1YIdRvUU7T7FEkiyfX2G8O6IlbveN7LivX7LdaklyqfuWAVfuylfrssBwS57Cequxo78Ieg+nycRdAYjkj261VmMZWz0ggkxJC9GqWrnUhX1HsvBl+rTFqophgmLMSMmlido9htOo+NQDlGqwpZBvmdAmKxnIl3EOKE75+PIVQF7ZEZ+rVXSrZ6J6DzX/a6NZ+xL3OlSs77TxZivZOLc8mulEIXYZjvSs+4UBoQj5tD7X8Mtd5i+n+DriwTEpYduCqy24vNGeMtV/pIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH0PR11MB5126.namprd11.prod.outlook.com (2603:10b6:510:3a::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32; Wed, 19 Oct 2022 16:54:06 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087%7]) with mapi id 15.20.5723.032; Wed, 19 Oct 2022
 16:54:06 +0000
Message-ID: <f18b40f1-9e85-d936-6610-b72d850712b2@intel.com>
Date: Wed, 19 Oct 2022 18:53:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Subject: Re: [PATCH 01/10] ALSA: hda: ext: hdac_ext_controller: use helpers in
 loop
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
 <20221019162115.185917-2-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20221019162115.185917-2-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0158.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::17) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH0PR11MB5126:EE_
X-MS-Office365-Filtering-Correlation-Id: cf60c207-2a41-46f7-bddc-08dab1f288e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2X/yLLE1Rwtk29/uMNXQnwRnyUEhtFxZpeqpSbi4cqo7dAabJQ9o8+QoO9uHIiIkatDIPPy/uVGSI2k60hQKNfiTOQZXC4bKiPcalqzLnS2yY2222Sh6SfrhtK3sYGpW5R1St/EI4MZIcikWhsWlCHxOf6DmEqGFzDHsjizlbP1+eu/EgFWna2Srln+Yw5T4zxjDCTe9HaCpSt9Eaot4dSr1QfzRTqDfBUg4BTQjQTM8nMSleulEAvuB4BVV/sS+OJYup1ZjHz2ye/pE8aXYmMwSjtQkDtFtVoW31RjprSifyBMVyOhSNaMI9WhuD1hKtosmGXcJA7uWRn8pZakwx65aLKsyeEQa54/0B18C1ruVsGA1uSIzPElzwOsAOL338NEjgkgpsJxaqXanK0s8ZV4wgU6P+hcdq+145xO/jYoVEOq7Z92QG6Af7t8pD9EWndDFRtGpfFJnIg3xXASjPf/clscjeW79i3Z67jdsQYjDKvqWyOaX5uwepWvEt/VvOEzdlBAncL9xcM+BSR8O8ys8fudV4BF2FE7Uiz0x0+df/fuXfbGfbsSAczYfAXTJzhgaI9P4DbhMSf12JmJs34M2GM2bGuG8v/L37USX4JAJIXcq7FX+d81U0GxacCnyDfPOwZ2Vb7uo3n+m8PuWWu84hWar9F2gysXjiyDD4r9aJBb2+pWDGeNycsYJuiqrejue1PYGTi975fITtBIgvG8byDzeWV6a+4ry3ahQbRIpyvBk4w4YoprBqZkBLQMMtFUCHmCgI6A/TEZQil703h1H004yHUGVBLwuYv1kpbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199015)(36756003)(6486002)(6506007)(478600001)(66946007)(8676002)(6666004)(54906003)(4326008)(66556008)(41300700001)(66476007)(6512007)(26005)(2616005)(31696002)(38100700002)(53546011)(82960400001)(186003)(86362001)(4744005)(5660300002)(31686004)(44832011)(316002)(8936002)(4001150100001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDdBbUFvZUh5SlowTWZtQWxMMHlqQmFoTFZoU1JvMFc5WGFLa1JzdEtnelJz?=
 =?utf-8?B?VTFPbGNxZ1lVckdCSnowL1pKaEJERjk2SlM0VzFwZVEyRWM3VW50bzVjcXVC?=
 =?utf-8?B?QzdZdVRvVTRWeTFKenU2RFFsb2dJbmMyZjJEZkFIWU5uR1gwY3VvVkRPaGI4?=
 =?utf-8?B?U1ZBV3J2QjBGa05XbSt1c0JzL3VhY0puMThtSytDMVhzRzc5TzFKam5IQndz?=
 =?utf-8?B?a3VBV2lXSjBqVm9KVWw1eG8zRERzUVl3OTBqYmxnUGMxaHJGZzlDRi9iWnU3?=
 =?utf-8?B?Wno0S2loZVZsUmxqWk9LVWgwQ3NpenFnWkhEMEpLQ0NqS0dEQmRpb0VGRExy?=
 =?utf-8?B?R2E3WG90Tk9MNTNDYXh0UVJ3VHVaelFiRDkvcFErR3NmQTEzOHNIZ1RTVmJF?=
 =?utf-8?B?aTZuaUp6SUh6RzRVL2NqRDI0R2luMFB2VHU2T09rZml4MjUzNER6ZDA5S0RZ?=
 =?utf-8?B?UzgyMytMVXhtQmlTRVY0ajRlY3V3NUJJazdHTWE4Y2NCZFFJK0EyQUdLZFhQ?=
 =?utf-8?B?WnRJMGQ1dnpxZWd3ZUxPZXQ0QnhuenpnOUx5K2xWTHlZZVpERVVlckVDUUpP?=
 =?utf-8?B?YnBuNkNFemhhTWVPVk14MDZaWHgrUnhpcm1VbXRKSFJQWGVpTGpMcEordnM2?=
 =?utf-8?B?dEhEYTRaaFNidXhyK3h3NWZPcHBRcnlHVE1ydW1KVjM1ZHpXcjVWRDN3QlQ0?=
 =?utf-8?B?OEdYSUlob1NWcDR3RzlBckt4c1ZLeWRsejI0ZGQvcWFxYy9kSUIzQzl6Z0pu?=
 =?utf-8?B?MnpjalBLQkZsS28wT0ExR09YYzBZSmJvVXdZNjFYMGtrc2ZyNzFtMFFzTG53?=
 =?utf-8?B?MFgra1ZrNHdiZ1dleEZSM292ZWNIc2J3a1hBbWRRTmlmWWQ4cjl0SFFKOFRL?=
 =?utf-8?B?NHFZWEtNaCsvbkk2aG1sS1g0RDhJUWJYWm1ZZENPVnByaCtlVUV3L2VRbWdh?=
 =?utf-8?B?a0RBL2g1Q2pQcXNUN05YSVE1MytpcDdUZjUrMkZveW9lNUZaRHFBTjdkL0hP?=
 =?utf-8?B?TXVPanA2Mm5YY1ZhU1Q5ZFdwNGd4QjkxZkVUcFJkMHpFWVVTRmFTNUd4cEcv?=
 =?utf-8?B?UDZpYSt4ZVlLY1BzRWdJN0dYaFpJR2E0dWFoclQ1OWVMN0pUaUxaRDREN2VC?=
 =?utf-8?B?VThOUkMzazF6RHdEbldha1Uzc1FKQ0hlbjZ1Y29jak16MlJ0azNHMUg5aU9T?=
 =?utf-8?B?RGVlQTk2ZUVmZmVWWmdJYmZ4R1VHOVYweHJCSmUrdGU3cFhPbEFSU01SSEpq?=
 =?utf-8?B?OXdQNElPeGNXbHpHYTJ0bEF5WVpXdWMvek9BbStkbjN1dy8vQ2FWQk1LcUtZ?=
 =?utf-8?B?d0ZvWlJhRkxkUlFMUGdJWXdQVGFWYkJ3Zlh2aWYvUlMwY3pwdStybDNDWVBm?=
 =?utf-8?B?QXdaaTkwanViTTBRSldQOXJPMTd6Ukx1TFZ0SDJsVHBnQVNQNnVGdzI4Smd2?=
 =?utf-8?B?REpORUtzUEd4dG1CNEdMTWN0QUJsZUR4aUtVbjI3eHpFVi9PZlIxT241Q3dZ?=
 =?utf-8?B?MURWRUl5S29jTS9yeEZFV1BhRTRCZ2RpYUZseFhUb3BNV2dDdXJ1TUN0RzMx?=
 =?utf-8?B?UGd3NXY4dG40Zk14ai85Z1BGRFNrVkVoeXYrSWlqWC9XMklvQkJhbWlwNE9Z?=
 =?utf-8?B?MFZSdDNTcWE0WDJxalFLeTVjZmtTZERiYzl3ZUEvY2Q3bTlsd1dCOXpvUzMz?=
 =?utf-8?B?VXJDcXllMW4xdzlYNWlveThVM2R5dnRvNmhxNzNKMzFVSEh2WlR4dTZGbm02?=
 =?utf-8?B?TFNRZDFOdW9RdFBlUlg3RVZjd0p1WlYyaG56eFUxa1lseHRoZit1cmwxdnBR?=
 =?utf-8?B?cFNJTm5XVll1Q3dxU0VxbEYxaDJwL3hJMlRRZkZta0FFTC92MlpveFlCbm9E?=
 =?utf-8?B?cG9ZVlJsN3FXWGdqKzA0anVkU0FubS9uZ3UvWUlTMlBMNkJQODNwWFBWczEx?=
 =?utf-8?B?cGNKWDViV3IwbjBkdGRJbXRoYW1RQjJ6RkN4aHNrUmFqY01iV3FmRmhoSFla?=
 =?utf-8?B?OVZYT3BlM0czVEVyQkVmY3dHelU2dEtrT0ZLK3pCdEtWRWY2Nk1Jc09mMENL?=
 =?utf-8?B?OXM3MHAraDdiUWdubzZkeHh4ZWFUaXhCeFNWaEIxaU9pSEZjTzd2bDBiTmNq?=
 =?utf-8?B?ckVUN2ZRVTVTOE1LZ3NxMlpHUU5ObVRZRUViMWNLZFQ5ekdiRU4rRFRyWk5T?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf60c207-2a41-46f7-bddc-08dab1f288e0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 16:54:06.4228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2dFVdV5oAAUaOLHmESw7P9aC1pY6AG1nk2UnOSMgO/HoC7029L296Eyfq3IWeV7VZ69xDk04HGS+Dhc/EysegOoQ4SVRbnUlGfPBULk264=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5126
X-OriginatorOrg: intel.com
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
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

On 2022-10-19 6:21 PM, Pierre-Louis Bossart wrote:
> No need to copy/paste code, use helper instead.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>

LGTM

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
