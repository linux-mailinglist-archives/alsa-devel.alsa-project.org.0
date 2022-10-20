Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D518605924
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 09:57:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDFD9B74A;
	Thu, 20 Oct 2022 09:56:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDFD9B74A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666252644;
	bh=hScKAURKsdQKKHYK4Hc6GpkpCxENo4wEnyVBATTkM2U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jDRWwoJx0jluPX00ii/ekfOaFUOpR1jcQbrQagZ7qzz7GDASDEUqBQ+HamLU8N2wS
	 MY1a7k2GotpPIeplzv8UXNcgXxW98U90XUM62rCDKyodtIjfalYhrumtEbFuwPTZp6
	 fLeVLifB/bdm02dEuyV0oaY/ZgfejYdoabfgsmCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52743F804E5;
	Thu, 20 Oct 2022 09:56:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67F51F804D8; Thu, 20 Oct 2022 09:56:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86122F8032B
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 09:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86122F8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UNRr34A3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666252587; x=1697788587;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hScKAURKsdQKKHYK4Hc6GpkpCxENo4wEnyVBATTkM2U=;
 b=UNRr34A3S+yUeMNw3Cb3Z3R1WhWqUljgcEYP3Vb/CxI8WUt6fIX22X2r
 nU/CBEhgaahRSpJnGKwI0YpuCNjdzHoGtJ/gVcOU4kV2IoEhpgQcemCXx
 6wYK5NohKlIRoxlNjGS3NRDEux53u8bB1tjLAG44XDAGk41/jmpsgBQIO
 LOamNN2rFrp5xFgek4/yf4K2NYt0hutNJ1gc09Z5JGYxzsQNP5uc73b16
 0iRbbDWukFraleEXxP84efbKlZGXz+4kBmFwgrZqZ6x7mo/2q86LS+CC5
 yOcQYsnVsIYWWeKeDzCOEjhbONu9S9QeTHAjTzl6jZaEwjfaz2MlFH7lG w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="304254141"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="304254141"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 00:56:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="874849668"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="874849668"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 20 Oct 2022 00:56:14 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 00:56:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 00:56:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 00:56:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4WZa5qtVm6vcUpbTpVT9K9S4miYUm5bIb3qMM1HC4MeXm3R4JGkmocAW18heQYQmAbxJIbu3uN501u0y5nU4CWp3Tk9R3q6dN30eL0w0CHHxYMG6RL2JEXZIAnYZMuxzO3k0n8siqpvkMKDtrskLWd5NAyvdzomp3F72AoyTv5NWpEACk940Q8TI3jXiW08iGrAlwyHLHDnnXm8m2uVBfFtnvj/Igu2jhv/jUyZZkOyO+bUJyWwkT6WWesvnM8DAml8f5yaBBmLtfPDIkEkt9z7MI0wGRi7ZmR8wJpcGd4tf4ti+pzvZuk+upTwp+51rzrQHUEYtdx7bRQTjXJZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fg7snW/4DPju4XKki2NQj/kIWVVgoWtK5z8P4OMOnJg=;
 b=l+/yaHuKgel1J0MDUEq3MxoUgc+FrUHrw6rr6nW0YRqjBAlPUQ8X7b32amSTthArlGdK5cJK+ur6TwEnDggxO1q1sb36a97dLO4fLh/tKCABvLOULQ8XHaGf8kAZES5Lya1Ffnvoo9HF0i8gOhNQbv7EJ5ZGoVhVHQzJCLV5vrkKry+OY6hY5M5Aht9J4PYITqLNZXvS7KJyOgKHziQAPFYpXzAoJGSfTZCtmZ+ar7iq0JgJHpPve2RTCP1kfgTSW5Nm+xuKs6JguNGh00nU6cEeiWWUTx9hedupFXB9Wb4+iVGWOoUkOGEtDqfMU6UWUvhBYgIXHa3bOzdYRhCmVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SJ0PR11MB5615.namprd11.prod.outlook.com (2603:10b6:a03:305::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Thu, 20 Oct
 2022 07:56:13 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087%7]) with mapi id 15.20.5723.032; Thu, 20 Oct 2022
 07:56:13 +0000
Message-ID: <247013af-31a2-2013-aae5-ea55eb4eb482@intel.com>
Date: Thu, 20 Oct 2022 09:56:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Subject: Re: [PATCH 2/8] ASoC: Intel: avs: Introduce PCM power management
 routines
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20221019175317.1540919-1-cezary.rojewski@intel.com>
 <20221019175317.1540919-3-cezary.rojewski@intel.com>
 <2f391106-a73f-fb11-075d-5621bf592633@linux.intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <2f391106-a73f-fb11-075d-5621bf592633@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0082.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::23) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SJ0PR11MB5615:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee40f17-9713-475b-b10b-08dab2708ef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GVAnT2LEtB2gdIJovPgJghhtoiLI64nFhkeCylrrWu7rEFGHKoP4CJddjIXZCaJN4hhciUZCMdL4N/FPetzmzt52lUIfmADjOkKwKOeyHRhKsxUsIb6cR1o62h1X038g3rf3I32HCkeMpmnM9AGcRPXVcVzpCKBZh1higDT8PKLIj8yNmst+I41qPJDuGMJiuGR3Jd38xbUhQdzO+nJWFuQcifyCU2ehkAyL0/OHKa+QgPERdxhKVKlJVVbjJNbC3Q5tEYzccVllxyX/qUw/R45WWpwixosBpGOOhyFPsvtmdKfsvDzHx8njyMliCqOECwgdSX/egl0kAd5m1Ay8GBgXVw+D6VBIng4OsWTTZs18nbmjtTo/cgI8cbebp2alvhFIVD44JFOxlYQVIeucqd2J86xYXF3f6S9ORrgPKux1h9dqeOMChEHmoohs8aruCb1BMiJgbI5shX+56M1c2qr4eg9AuGjJZk8rUUsLSljIkxxX0QcMysypO+1rYinOXxz4TSwWDAOunRTF/uZX0nzJj2lwYKahSFUxibrmZPve85nuUa7nkaLdaXFeyjHQVUyYlsAoHQ+OWb4MWWCdOEblovmu0TQf33eQ1SPGLPQIKmpVmlcZyQR3KP+wfGna83hF69EWrzs/v9LlXuyYB0M5v1qsYOraKgXhvVXfxhTEYAXcV+GJxAO4oOlitRI3CsBKmAaAgEMsTbeT5KaQX5lWm1TeFuapOA0QztQVLve0pRWWl4Z4ccErL4tMDLxtNuxQbuA2QOKaZ1wzMriN/pG7SqG/zW+rq+W9Sqcopqo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(346002)(376002)(366004)(396003)(451199015)(36756003)(31686004)(82960400001)(86362001)(31696002)(44832011)(5660300002)(38100700002)(4001150100001)(2616005)(186003)(2906002)(26005)(316002)(6512007)(41300700001)(6486002)(4326008)(53546011)(6506007)(6666004)(478600001)(66556008)(66946007)(66476007)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mmt0NUJ5SWlSZHJVQzV1cXJpY2NTVjh5YlZ3a2ZYWUs4NnZpQzZVRFY3OUxL?=
 =?utf-8?B?Q1R3NkhVM1Zxa2FjUUpQZEhnU3dqWEE5MzFsY3dZenpDaTFrRm5ZaVdpaFBk?=
 =?utf-8?B?SCtxUWNuWk5FNmhCeXFBRG1qZjdaeXhzSG90cEZEb0JPeWpkbmJhTm5qdEhE?=
 =?utf-8?B?aFN4bGNlRXZSQ3IwZmticzJlTStqLzB5OFk2MWI4bWFVdEMxeXJCbm1GajM5?=
 =?utf-8?B?Z1FoZkZWa0htZk1uMm1MNUZiMXk3NC9qa3RYUFkyZ25IdlVxaUx0ZS8xTU03?=
 =?utf-8?B?WDhwaWxmOS9NckllOFRhaTJlTi9XTDRxcGoyWW1MZlo4UzBPNDhjVitodVBt?=
 =?utf-8?B?cmN6bzNKSTVLV3ZEVGhldjl5ZE9KNWY3b3hVQ21RZFNuSXFOSkN2MnFVOTdQ?=
 =?utf-8?B?aHR0d3VTb1AzZFNWc3pDYVZTN1paMi9HK2tvTnhSWDBxOEYwVEdHVCtYb2lB?=
 =?utf-8?B?SEs1VURWd1dFTnRjbVhHdENkdHVUbTFiS0thOGVvc2I5dW5BdTVsd3l1d0Nl?=
 =?utf-8?B?ZmpqZk04c2E2dDVaNHRZU2FhVkpzSzV3SzdBeU9UWU5zcnhPcjNnOVUyL3VG?=
 =?utf-8?B?N3hweU5tRDBPL2t4RmJ5TlgrM0cwQmtpM3RWbGgyTWwrbWttRTU0MXBaRWFD?=
 =?utf-8?B?dTFHd25ROHJ5SnVVeUMydnpmN3FJS2xxNzR0QjdGSzVjSGRocEkwVzlqWHZi?=
 =?utf-8?B?WHZYWDRta2duR0xhTUwzclFsT2IvMlBKOTRCU05MR0JWck1NTGlQL2hoK0RD?=
 =?utf-8?B?Zm1MeDVHUVZUVHk2VlhSd0c4WlltQXIrY1pXZXRldmxtenVsUTdvaEowaExP?=
 =?utf-8?B?eW0xMmxiUW94UTI2ZVEwdVR0YTNmZGV0NndJVG5hK29WSVVOa2l5eTRDT0Zz?=
 =?utf-8?B?VVV5ODF4eFN3amp2SWV6YXlsQ0lXSXpENUl3RDRyeFY5MEdMUVRkUU51RGdk?=
 =?utf-8?B?QXlMV2ZTM2F6U3F0WFlVdTJkTVFVRmg0KzVDLy90ejgzaGQreXVaS0FDUjMr?=
 =?utf-8?B?cE5kMndvTWVPeFp3MklVcEp4aGVuSTlJSXZocUxEOEhPZmExNmJzOEczeW5N?=
 =?utf-8?B?NTRObm5NK3owaktIbndYa0grMXNCbEc5dStoV3djMFZZTm56RWEyeFd0QmNx?=
 =?utf-8?B?cWs4SXhUeXBXRnZic3BnZndSa2hFbXl0VDhEaGV5cUg4QUtXeDdjQ1RNcCtW?=
 =?utf-8?B?TG01ZVhncy85RUFzbytFSlRoSHVqR0xqYUxYOGhXQVZadlNNMWlPenVoK1I2?=
 =?utf-8?B?Yndza21sNFROMmNPODU3WEgzL2wyTE1VVURzMUJ2Z0w4UGV2SDVPSFNCWXNK?=
 =?utf-8?B?cFlkQVlzdzZIWVZOeGZ3eTRBNHBQdGgwMzBSSzFIQnNwdXpvUXd5M3FuTjlH?=
 =?utf-8?B?M3hzMExIbHhFSi91WENINmFYcSsvaCsraHptT1F4QzZYSE1yMzM3RVcyZkxv?=
 =?utf-8?B?amhmQWkxajk2Q2N2NS9DR1Y4KzVuTzk5dVFEUGJXcUcvZGxlMHJzV09HUU40?=
 =?utf-8?B?blZORmVsZytmcm53UUwrL0xZZmdSZXBPNWdBeUdobVFTWmZIY25XZnRIRnBl?=
 =?utf-8?B?M0MxdTVUU1d2c3AvZHg3UVB2QW1tUWxMTVZ5VGg4MktzQTRTOWRMbW5penFu?=
 =?utf-8?B?ZDlSeGJtWElhL2lWcGQxUTJKajRiaW13TmpCVGFwRkQ4ZlBLNk9jeU5MeDhw?=
 =?utf-8?B?d2RxaFgvN2dOckw5TGZ3VDRvRU9qY2UvTUNhWWpaM2J1N3pBM2Q0VEcwVnVU?=
 =?utf-8?B?QlpmbmlJOExyMktqRWU5SzFJMjRTeXoxME1zY0s1ZHozcnpVVFF1Wmo1Y05w?=
 =?utf-8?B?Ui9vdkFiNlZiZGZ4cThOcTY0V2gxdkM0QWt4eCtXMXE2RllieHFaTHU2Y25h?=
 =?utf-8?B?Rjk2RHhmYlhKbjMyd1RXamJXbU5BY0dNd2pyL0l1cHhCK1Q2ZzdaSytQTW9Q?=
 =?utf-8?B?ajdCZWhPV2pJTW5hK3R3MjFDemtydHZOV29McnFndnJJZklnM3Z5eGtkMEdn?=
 =?utf-8?B?MnZsa1RIWjRZNUl4aVo0Z3BUM1JtdEZaR2JZaE9qYUUrQktiaXdTMjV5dHdo?=
 =?utf-8?B?UjJjZi9hcXNDaFJnRXJ6eWxadk1LSUdzcmxxR2hCM3VTMkNENTFMRm1XZzQy?=
 =?utf-8?B?Qlc4Q3cvaFFuZXlPN2hPa05NRVBobWVpNTBrV2ZqMm1RWTVja2h5Q0xQSUNj?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee40f17-9713-475b-b10b-08dab2708ef1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 07:56:13.2819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpS48XNDVejb3VdZzwe33GaWejMOCyLXIrzto3A8pDDoFgm545+fq2vz7ve8dJ219K94R/wyG3F1R1yrpcfv85TBeTWgoLGGOjkDof6RYJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5615
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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

On 2022-10-19 8:02 PM, Pierre-Louis Bossart wrote:

...

> This is clearly going to conflict with my own rename/move changes in
> "ALSA/ASoC: hda: move SPIB/DRMS functionality from ext layer"
> 
> The SPIB and DRMS handling are not DSP-specific and should be handled in
> the 'generic' sound/hda layer. In theory the HDaudio legacy driver
> should have used those capabilities.
> 
> It should be a simple rebase though for this patch.

No problem with waiting for the series you mention to be merged first. 
Will rebase once it's done.

Also, that's a good point in regard to DRSM. This could indeed be added 
into common sound/hda lib. Something like below perhaps?


int snd_hdac_stream_resume(struct hdac_stream *azx_dev)
{
         struct hdac_bus *bus = azx_dev->bus;
         u32 mask, reg;
         int ret;

         mask = 1 << azx_dev->index;

         ret = readb_poll_timeout(bus->drsmcap + AZX_REG_DRSM_CTL, reg, 
!(reg & mask), 250, 2000);
         if (ret)
                 dev_dbg(bus->dev, "polling RSM 0x%08x failed: %d\n", 
mask, ret);
         return ret;
}
EXPORT_SYMBOL_GPL(snd_hdac_stream_resume);
