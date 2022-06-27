Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6878B55BAD2
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 17:42:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1725167B;
	Mon, 27 Jun 2022 17:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1725167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656344549;
	bh=nGh2zPRTEgk/Sp75gSTePhV0cIN1POAywOVxEALQm0E=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MsYWNPnfToupqfha7uSGWeRhwseD7lrTz8RKGpP7Hdsf1PLzZunbE1fST9Sy0dmK0
	 ToZf/iriHg9Kspub9psOcrdZNVcW0Sg6hhzbf7x2QL++MaLn7VQRsiQdiZ//fGMTvJ
	 fk4LLIrsfphcFDLFnDqWYqe23SZY9jSoKZwp5OPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B3FFF8028D;
	Mon, 27 Jun 2022 17:41:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D346F80128; Mon, 27 Jun 2022 17:41:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEF1AF80128
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 17:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEF1AF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TN7Hsa4t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656344486; x=1687880486;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nGh2zPRTEgk/Sp75gSTePhV0cIN1POAywOVxEALQm0E=;
 b=TN7Hsa4tBS3a7H1dp2u/owHaCBdaFO9iA060evZijgBqR5qnD+fWHRCW
 c2ovjOuWY77zpzNCehWfB6rwOem1zXA+7S+G4PcVLHHk8aF9ToYz6aGHy
 HU/NGUVtD8lDlkfIhIPQnwoUecLgQkohsDpPqSXlSgWA1sckWg6SlVPam
 CmuWlzOJ+kS0wpibIMJnpfAoGqmeReFkqct1RAxVEcG9ZnDLwk1WkJ7uh
 Tnr0uPce2aYRGhIFW7gXzVaRTquIF49ldJ7rcZsDwYCZSf08yi/54dwky
 4qVII7O+jIVKZeG+fhYx/7nWdEY9XEMXFbV6TdMS4cI0T7I/twngheQdB A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="279018865"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="279018865"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 08:41:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="836241656"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jun 2022 08:41:17 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 08:41:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 27 Jun 2022 08:41:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 27 Jun 2022 08:41:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+9hHzXgmnKUZ8xnkxB0LI5VZdJo+wEHlXO8nr9U12rQ4gejT1r17hYDem6ZCIEO8X4OyAHc55V9IduwqnfqVLAwgylel8umi/mQalQIEA/Wh0fPnVllkcKyNcea4epiIFaQQxBPKhjTc68UTZ5Oayzkw0N5qBoqifuvGA1r3oSfhtFY2xkUVBGuKS74Bf8vPpK6/rISa8URt8Z+31fUqFvrCHrgKzr6xDr4gHUR2LROwn8e8Lpjzn7HihdcY/sXt/3Wz99OrRuhPMtEBTkVJTEeepizdm4i20NZQ2xHvGC1bk0cty7QR5le76noX745YDWZmi2KlDRJiSUpZlVc2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TW97ztcJW36HJXLaSGoQLQ4kFmxE1agoSDd+YwVsrTQ=;
 b=RcdDqmYig91eZEhrHD/p/C8FKivYj2DtYqliwicdbE9L05vlP9j/yUoc+al1lYrBOdUNn3Cq+GIb5FODhE6E0nKIZVQmarwVMP6UjtoMJMLMAWRZ+9DRtw+iwlbw/5N5GlkRt7u3NiL7h+uWCRfSofLlWXR1K7k9n+yWuRXPCgiKRqe8c9WKtTLjR6yWjPAfO55LZJUs+xuLrYZ/dcXVq5bDbfvROWKYiXXE+L8FE+B2SFhLtPoFv8Rcq5ikEurcqbsky3QWBGOVZ/NuETTb4XJgbuKgsbVWZqFgAVkUNsSWhIifKjI/Cquj0Ys7RuXK18F1qIpUBQ9il7fLBcg8TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CY4PR1101MB2245.namprd11.prod.outlook.com (2603:10b6:910:1f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 15:41:14 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691%8]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 15:41:14 +0000
Message-ID: <c668f83e-d9fb-35dc-a06d-6563d20ddc8c@intel.com>
Date: Mon, 27 Jun 2022 17:41:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH 0/4] ASoC: Intel: Mark BE DAIs as nonatomic for hsw and
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220624134317.3656128-1-cezary.rojewski@intel.com>
 <ac2b7d8b-a5be-4fac-169c-eaca185c9746@linux.intel.com>
 <3d9b45c0-b415-21d9-6af5-68fa1001ed17@intel.com>
 <34b54e4e-8997-c2b7-fdf0-24a1b95121ab@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <34b54e4e-8997-c2b7-fdf0-24a1b95121ab@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0015.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::28) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9717d46-52ac-4a51-b57e-08da585377eb
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2245:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DgLq6Ip9Nree901DKNtEmDrsrX9uLQWlfVQdQ17LTqIk/g/p3qZR7DpN/h0rCT3KsHJtqW0bfr8pFVbaKTMBXPLlFv8F0YGyxu2bWuMRdVb4pkPe/scAcYMAbwNYsE9Xfga0rUFaUQV+qlyniMGKaIZ8Pad+dCs0V2eZVC6zulxAhY1BgJgphpY5gjco9PLtag/n+daynrsrht3MN+yCZL0xpiBzy6T83DbQSgCeAE9ZkUt3rBEq0gZn3PHYl5EO6aDQ9AkDSgflAZubpywmoErsINFS4+wwZJjpiMasrC/+gpzPKypuatrBcLNeXv/T1LKvQgXPLE5f55rOeHDaAvGluszR+h+2BfWrFOmRY70rbw3Ru46jajX5q3HYYSCoU24vDxamxaK2E39GUYury9WwX+J6dgHSHbDZGh8QbYdeIi2g9wT2bxUx2CnDU46dySAj+PKHmn+xGUs1O4WQper6BQRYfVfMTh6dbOLASQXo9t9eFkqcveYtoEO++jyFXO0XuuiyeI7WDaXfxlV1AFv7q5MIR7HYHfZrX5wef/DjFredyj6lVGiOV3ftkOR/LPjmPd3lV+yIucDLGFjRQ7cvrJpao93FYf/KXfTms3fbearIrmqWHUDtGExLnbGblepyGryqZmgqxkMmbYh3exTsCIWUSED7DtaGuxFssyo6Kkk8o1E5LL4DRdPGa0FC44aGxnAKNZmMs9w6FqjbwdbUh8o9vdcwdvsS2Azq2eS5u8haMbqDA2qGfNDuaWV7MFZJfitLLmPh4XGby/k4dL9i9QnNEIk81AwasxM2pyorQqUGkKz24M7uk20xUcvO32nJhOn3J6WrgwvMhn7ExlZMsFcctRHK1P47bLDj6eI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(39860400002)(376002)(396003)(366004)(86362001)(82960400001)(6666004)(6506007)(966005)(6486002)(41300700001)(2616005)(186003)(6512007)(478600001)(83380400001)(66476007)(38100700002)(66556008)(4326008)(31696002)(53546011)(66946007)(26005)(36756003)(44832011)(5660300002)(316002)(2906002)(8936002)(8676002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXd1MmhxUHVqaVovU21BbkZqZDZqYWJnKzdhenJ6WGNsN2xCOVEvSFJOQUN2?=
 =?utf-8?B?Z1M0ejhJMWc0WVVUQmF4blk1VWdVS1Q5Mlc0L3BMaDZYWG5zWEQxSEt6Z05V?=
 =?utf-8?B?U05kQmJNQkpWTnd4TDQ4TDUvUUw3UnltSmlqL05RZFFCSWNXdzNIWmJmcG9m?=
 =?utf-8?B?a2JaMlNzR0J5NGpiUnlYM1BMaE42YVdKSUUxMXFKV2tFM1BCT0gwZCsvMm51?=
 =?utf-8?B?eDhFTWFSQU5QUXJhSWNjVkxYbm1YNmg2dVdzVkZBdDFwcDRhczF1d3BCYXRy?=
 =?utf-8?B?TkhRSHJDUmJTVWJUUE5jMjNmcmEvTy94N3JzbC9xMTNMWUhJcW90Z2J2b05L?=
 =?utf-8?B?ZlgyaFozclBoUDlKL2VDSWxOUHgwVHhRd3JmT2lXMXZ1WFNkUFJhZllFbmNa?=
 =?utf-8?B?eG9EMXl0ZDE4ODFVQzVycG8rMnNoc2U4c1oxbHRTVXdBWnN6dXc1UEJOdVZI?=
 =?utf-8?B?VTNBSnpkc0srTFZCNGJDKzVIMmg4QXRVMDQ5UG9sWnducWl5ZzArZSsvWUR2?=
 =?utf-8?B?TnRSTUhkeTV6TURvNWZBNVJ5QVgrby9GNGpvV1R5dXlZdldybEJNYksvOFE4?=
 =?utf-8?B?bEVVbzNqZzFoaERSSm9ucmhNUWFzVzdENjR6cjE2Y2hlajlScGVVUXF5WXpW?=
 =?utf-8?B?c3ViSnhRb1VueEFrazRvZTE0K2JwUjdnUVozRVFXUDhHNTNkMG9DSVRkSFBa?=
 =?utf-8?B?SHo4eVBVWi83RUppUTd2dkdOS1BoM2xIZjZXYXpMdlQzTmlyby9UK2QvdVJ0?=
 =?utf-8?B?cEovVGdzSTB6MU9qSGNZd2tOS2xiVGh6dUJpdkdBZ0l1OVpjbmlXb25GN3RI?=
 =?utf-8?B?WlZ1MkdPUEx5ZytraDVPbGR2SWg4RGU1NjR2TDdKc01wOXBPVVVoSHhQRWs0?=
 =?utf-8?B?cE50UTl0UERpSEE0VlR4MVF2ek83M2tDbUlqcTZSSzU3TXlNYXBVQTdYcTlM?=
 =?utf-8?B?Nmc4UFJIbGVxcUlXaytHTFcwSmJIbFp2ZDdib1VtZnJXWHZnY2ptVnZFVGcy?=
 =?utf-8?B?Q2VnUEtvV0VCTGxLTVpoSkp5OEV6SkZrVEtMSGJjNUE1QTJJL2dlTFBxTStu?=
 =?utf-8?B?eWJabmNyd2xYMmc1R2VxR29TNms1V3lLODA2dmFMcE9FcjFVNWtJYUZTTHEv?=
 =?utf-8?B?R1B5WU1QeTlNZ0NkcGhzWHR6aTlxQUpVdHF4ZCtXb1pYeFhTTGpBMUYxTmgv?=
 =?utf-8?B?d1dPbmlUbFA3WERBbDd2UFgzdWNzWm91aHN6My9vV25CTEVsWElXMXlocE9r?=
 =?utf-8?B?N1dFQmVuUTloV01FUEFoVWdyeWVXOXpScVV0UCtFa1NHbGt3bkg5ZXpwMHUx?=
 =?utf-8?B?QVcwWFYrUnJMc2hGMk5YWkZjSXJNWFZaUklwRmJzOVI3VGs3akRDdDJaSFdk?=
 =?utf-8?B?KzlDVVg3ZFBsZ2M2TmEyaXpqQzMxMHJBQlZPZTFHM2lzWmdUNzJERGNoNFhh?=
 =?utf-8?B?RklNQzZEcnVZQnUwMHpsTGZXdkNpTGh1aUh6SnFsd0VGSjdSVjg4YmZQUGZz?=
 =?utf-8?B?Z05Ma2JjSXYzVlRydDI4ZVdDTXNQTGtGOWh5YmZ4QlUwaXdaL0JINVAwNG5y?=
 =?utf-8?B?L1JiR1dzRFFsUUtET2kvU29uUU94cTNIRmZZcjFEZjYrVjZ2MW54NHFyd1h0?=
 =?utf-8?B?RkdQSEZqdGwrNGFNM3htczJhazFSeTR1MCtSWENvcE9STXBldUZzOTVyTlRp?=
 =?utf-8?B?czNyN2JLdlJtRzNROUJ4YkUvYWxBRkpFYUwreTEyTTFjaDV0anZPRUxNU0hP?=
 =?utf-8?B?clYyanh2WUpJWWh1NklTVW1RYlJYdjArd1NqSitCUTJuczdaQSttQ241N0d6?=
 =?utf-8?B?MDV5aHYxT01LdjgxWDFueHhnTUk0R0x5UGdUNk05UmNxNFhMejBNbGVSU2dX?=
 =?utf-8?B?UWRubTJvTGRMSVhWZ3lRU0RsbGJxbW1oTmYwbTAyY1ZjMFcyeXZlVzc4bnhx?=
 =?utf-8?B?OHN4c2JDU2tYMnF5ZHNmTWNSNXZSUzhZek8ydUQwRDdYTnBVMjQ4OHlySW1o?=
 =?utf-8?B?VFdtc3RmOWUwUko4L3psNDMyT0F2dUlWN0VBcTVlMzUvenJwSjg4VUVISXh5?=
 =?utf-8?B?UTllazdHcmNkVkN6OGtkZGY3eWk4MnRqUC9lK1k5UFJRdVBKd1FIQThEemQr?=
 =?utf-8?B?UmxodVFDUERpOStBbHdKZ2haRzZabERLNEdMRDBLVC92ZHhvUVdkUCtvMCtQ?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9717d46-52ac-4a51-b57e-08da585377eb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 15:41:14.5230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wBUILEtnGQFogAGqhO/oa0E/tDkwt2fk0UfN7lRYKgvm7rslxRj5O0Fuy5rSYCiIwPtGRpcnkuQdEBlsk3tP2dhcZMywazQIP55ZEKLnxF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2245
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
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

On 2022-06-27 4:45 PM, Pierre-Louis Bossart wrote:
> On 6/25/22 03:29, Cezary Rojewski wrote:

>> Hmm.. that's a good feedback. Isn't ASoC's FE<->BE treated as a single
>> PCM substream in sound/core/pcm_native.c though? If so, does it even
>> make sense for card's BE DAI to be atomic, if it's FE counterpart is
>> nonatomic already? Especially if it is specifying platform and cpu_dai
>> that matches Intel's components which we know communicate using IPCs.
> 
> I guess it depends on the cpu_dai implementation. Not all
> implementations implement a delay in the .trigger callback and/or rely
> on IPCs.
> 
>> Warning is one thing, but will you be also getting rid of the
>> if-statement in soc-pcm.c that actually forces nonatomic=1 on BE when FE
>> is already declared as such? If the if-statement stays, I believe the
>> declaring BE DAIs 'correctly' in the way to go.
> 
> I meant just removing the dev_warn() only.
> 
> See https://github.com/thesofproject/linux/pull/3723

So the framework is still fixing the flag for the driver. Ideally we 
would like to have all the drivers assign correct values to ->nonatomic 
flag themselves.

Now when I think about it, the message seems useful - at least as 
dev_dbg(). It _guides_ driver developer to the desired approach: setting 
the ->nonatomic flag for BE to '1' if the corresponding FE is already 
configured as such.

I've provided similar answer in the linked thread.


Regards,
Czarek
