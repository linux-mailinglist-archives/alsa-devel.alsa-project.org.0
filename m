Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FE6546BA5
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 19:27:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89A461878;
	Fri, 10 Jun 2022 19:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89A461878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654882045;
	bh=hQWu07vnyp5SF+GgLJ75ytLYEmWUx69bu8PXFlrQEzA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W7Z0rIZ1NT+Xefcag6RK5w6TY4n1xd41vyqBTJ7Ltgtunzb9AQ4eviVEZODfOc7a3
	 dMpSSbw8xHT0c1lHZdGefeK1bW7CFkBh86nXKeUF1VcKYnymtZ8YEF2EAYksxawu8R
	 6Q6Yp0k7lNziNeltsI/UXGJA+u60nyLrpVsUnIxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1FEAF804D8;
	Fri, 10 Jun 2022 19:26:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20E68F804D2; Fri, 10 Jun 2022 19:26:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9108F800DF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 19:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9108F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="c5OgzlaV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654881974; x=1686417974;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hQWu07vnyp5SF+GgLJ75ytLYEmWUx69bu8PXFlrQEzA=;
 b=c5OgzlaVlLTkMcgVVTeWb+HToPivHYFh3SiSOcb7cuOo1L/fq/LQ0Uvk
 ZOPxYzHbgRiXF3PTVkD2UEH7Vy8TbbUnV1Db6BCJUaH9KoVztRAHAOvpo
 WnsFjGG7b2h9VRD+gDfW2ZbhVy22Ffn0HlwYRu5LtCI/YiMxYTf/JZX8m
 DMBKN4c7M6GlgkVZ0rOz7bbre7UWyG1mwFblbYhwsNhOnl7M0l6pRaqrE
 N2+CTOL4B7a7MU8KPkqWAWGpBGl9YO2qYZqBNE41UAAuYGqgvjQEIDtEk
 FG8njm/TmyzYDcKlVkGgXPErAPp2V4Fsn7P2wjEyT0+UjlDp1UTYwsPmE w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="257521261"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="257521261"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 10:26:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="638226960"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga008.fm.intel.com with ESMTP; 10 Jun 2022 10:26:05 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 10 Jun 2022 10:26:05 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 10 Jun 2022 10:26:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 10 Jun 2022 10:26:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 10 Jun 2022 10:26:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ga9xqq6BQE6aPXkftckn3Kbs2uy7xJRYIj2+Lb4XybONOOdojCLJpE7pkJslYokSAo4CiwfHsfRM2azb/8uSJz/MEpTmwS7yUGQfh0XcV6HlgZOt6fhkjsFSqkWZTsEQZ33NaKigXahMR2AidUQPuVe+b5iUME/REXVHG4HjpHO8RJN4+fyDZzIu8xy5moLZPnBm828a7I+Fil2s/g2xTVT2DrZTwtAJRbQmTHs7kQwXqrdPnW/8YK2bHqHAg4x1QxQUzH0k1l0tJylrQdPgbuyJtHgXorMsSatl49YmjvP/PQyV8NymVt/bLxUtW59mEC3VJg+34fujW5uBwCVLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1j12US/91wgXttS8QcztAFmyqlCvaq1zkzndkIxBW0=;
 b=oNoDRO+8LUKZBx6kFVlEOW+y+uMF8JiF2tTqJifyRlagIwbP6XyaqnOp/6q4ektNtpMEIliNfOHcMTWprKFN28AVHJ4Evkmqxq0Wmf1oiW/c+BKG2b/1qlEgti2insShCYZea+cgz7rkfSPacqNvJ9/wNAkyRTiMhDx4aljLSEqRrbztBztuhN/YHLJRSLh6XQue8bzCfUvSr4pDGgUf3L5GXNVD+3aeid0+B4eIc8b7wQ4CY3Wc8NsyFeO3rU84FfIM2LtE9Bz5sjWIplCUKZoXhv97Fl0pzRpC9glQPPTerdtNbBL9I/lr8T509voP6rkDsQ/8wdiz5DTYlCxW2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 LV2PR11MB6047.namprd11.prod.outlook.com (2603:10b6:408:179::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Fri, 10 Jun
 2022 17:26:03 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1530:7c7a:bfbf:6b9c]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1530:7c7a:bfbf:6b9c%7]) with mapi id 15.20.5332.014; Fri, 10 Jun 2022
 17:26:03 +0000
Message-ID: <c677bd58-83df-3b73-c14c-0679cb827ce1@intel.com>
Date: Fri, 10 Jun 2022 19:25:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 09/17] ASoC: Intel: bdw_rt286: Reword prefixes of all
 driver members
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220610123627.1339985-1-cezary.rojewski@intel.com>
 <20220610123627.1339985-10-cezary.rojewski@intel.com>
 <59f2fd76-ac1e-9fdf-401b-2c09e5be8cc8@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <59f2fd76-ac1e-9fdf-401b-2c09e5be8cc8@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR0301CA0031.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::31) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91a0406c-d109-4b52-429a-08da4b064b45
X-MS-TrafficTypeDiagnostic: LV2PR11MB6047:EE_
X-Microsoft-Antispam-PRVS: <LV2PR11MB6047D8371B74FCED23139A69E3A69@LV2PR11MB6047.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lzvN7yol47+K9Etqj56u1AfW9B+/BNs/+RSk0MUCIeKs3H0EVyH6fc+tOHUS6Ps5D29gzfJdd+T2PJcqQgOKS3EfE/Fxkq6ig6eRdvdH3OIog284ejNDgrhmTEBnyqUZO2xuLc962zIN394WBiEpzFWn847VJiHHsS5/SsH/EolppI6Z+0Sk6UnGHkwi/cIqj3JymYLJpAUJsZ5E9W7CmSpFafnmMdMqr+YX7lyIeMCILKlOtY8HXflV3gLwkQmEx8aOJLRVhcmwc5udN/l1r+qHKb7WsJoLRVKMLcpSz/G3SpL08Cmk5NZxqYgvsGY3eKFKdrgAZ3Hy0JrH05fyieMLwV0zT0NM2pvX0l5jGZfdXsb3RUsiEzWgqtjIM9Lq/yRyriN0rI5AwYTSfpTwdLjkx8xPGxdhOy2gq/2OPfemnaT6vyXSHHdOjHX92UQuLSbcfqbxPBGDx5VQ9bWkpdZ4YnUU6Et4iqsjH7uPGjwA972I1roG9ZOFhAiMte/zl3sv7ydrqbDENNEK7XpYgJ45JPspfwhXZMIVnGn896po+WS5Zg1iPA/bNyd9AjZEIcMv/tDUyEiApYlWNoHfLYOype3sc6PbBJDAptMMzWdrzYbsFXJ0JBzIKxUvPvxdLBVG+XWRGBkGnifVeLOGwUS+vx2gTckdDB6AmYa8lCkdjCmDOOb1meRZ0p1NaOJI7TSLEUJxhYXDJYmr2R3VC7H5SSVD946lBv0jhmKXGfsw2RvjPYE4+47okDfbjKV+sUUj58hTiLN00Z+T3pGXcQhsSDnykTeYL0ZPwKKQEoNTGs4+BzQaRjli2hzrvGmP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(53546011)(44832011)(4744005)(6506007)(38100700002)(316002)(66946007)(4326008)(31696002)(8676002)(86362001)(66556008)(66476007)(6486002)(5660300002)(508600001)(966005)(82960400001)(8936002)(186003)(2616005)(31686004)(36756003)(83380400001)(66574015)(6512007)(26005)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3JCTkNnZnNMZEE1OTBQT0VuYlBQRFdkbGhnRGRzYk5Zek5JSndhYjNMenp0?=
 =?utf-8?B?amNJVUlham9QNjQrOWdIUWtFN004bmFTdTBXT2ZHSGJJRnllV3RWbmgyK1E3?=
 =?utf-8?B?UTEvang2eDFZM043VUlaN3R6dUJRQVFTR2hJSkVwem1jNjExYVlhVlZtMExv?=
 =?utf-8?B?UzhSYXg1aXl4bmlrOFlzMmNRV2FZZVhiZExhSmNFdHplSmp6cStvVk83Z3pa?=
 =?utf-8?B?OVkzOEtVeHZDVXV0NGh6N1ZUc0N3S2RoeGcydlRWOUVKRng0MUtyeTFyWDNP?=
 =?utf-8?B?RG9NSjhONlh0OU9LZHNNdUp4WjZETlZxelJDaEFWaStRT242elUwdUVBbjJm?=
 =?utf-8?B?a1phWEw2UU5BckMvVlJqR25CRHRPcktJRUR1WXFRZFVyaFRaYUtCWHBIUDNH?=
 =?utf-8?B?NU52djN6UjBqM1JmZ1BybnY2MEQ2YmkwejRWeHdrYmV0MU11YXE3K0dOZDJJ?=
 =?utf-8?B?ZVRmaWVPVXJBNnVuVldxcUpYZEF0UmpmMzZpa083UTVESjJWVjRmNjQ1YkNC?=
 =?utf-8?B?NkNJWElmdjBvUEI0R29QM1NTT1FPUkZtclhLQUpYbk9RcFBDMk42Q09HTGV6?=
 =?utf-8?B?Wk1KazdWNlJEYzFpQWYzaDU4L21VT2RrbEpISzRZbjN2TDJRNDI1eXNBWkNG?=
 =?utf-8?B?eG5yeGE5UFVnRW5wQ05oVnU2QmtJb2VnNlJtY3BuWmZYTDNIOUoraVRVby9J?=
 =?utf-8?B?Z3pHMk1PYjBGNlFkblEyajBWcURaandQNUQyQnlGNEoyVmRBZmRvTEpLTHRn?=
 =?utf-8?B?dHBaZ2hVTmh5TkdxNjlFMTZwRTA0R3Z3TWVIN3R5c1lPeWl3Z2xvUjZ6ZFFY?=
 =?utf-8?B?Ulg0cE1RZkZWdXlqZ1B5a0NWRDBhNVBoeWFmN3JDQTJZTmJBemxGU0w4c3dL?=
 =?utf-8?B?VnJqV0tpV21ncjJhclJsM2k4andDendaNHhUdWNPSTBzNk9wMGV0TjRISVhQ?=
 =?utf-8?B?OUtyOEJzSm11Qm94eGtQU0orTHhtTjdBR3JueUhSNGJ6UTVLR252Z055d2VB?=
 =?utf-8?B?OEo4Y2RpKzd2Q0Y5NkxGNHNwMUh2UnR4a0tCWk9UYjJnOWRUY3cxdEwyRXc5?=
 =?utf-8?B?VVdQZWpuaUljeXdiN0lsbUI0SkowbUdpSTlCWDNpMFlaQm4zd3lNRk5kdmhB?=
 =?utf-8?B?RWxjTDJ4NktKV0xCZmk5VzZBQjA2U1I2SzRLVUJQWnhFaStaQWdKZkczRXV5?=
 =?utf-8?B?enhiRkRaSHVtRjhpN1gyNmQvbW4xQzlQN29lbkM5c2QyMXdJT3lNZTBGdVFL?=
 =?utf-8?B?TnQ1eWlrYk1oTk5IcjVoMzdwb1hWc0dDaGRDZWpZbS9UekZlUSs2ZW84QkN4?=
 =?utf-8?B?OTRETFpHWGpoenR3dnNHcVNwMGhDUmZyaXMzeEx0QkhZcWl3aXZzZmdQNzZP?=
 =?utf-8?B?TnNGckhvL2xtbk1TcG9ENU5VZUZNSHlLNzJEa2F5b0pXT1pWci8zSlpzTmRT?=
 =?utf-8?B?SkRGNy8wQjRvUG1lWWdiTkdzaXJmNXArT1lSZXhxWmFHWnJYamk4L3FzQmxp?=
 =?utf-8?B?L2p2MWpoTDAyNlJXVTJRNFVlNWpIYi9RbXhTbG9xcHZ5REtiZ1F4d0JKUlM1?=
 =?utf-8?B?dzBZaTZvWHFac0dzKzVVR2N1MVhWVWlMS1EzL0xVZElsdzV6UmlxVDl5VE1q?=
 =?utf-8?B?STE1djVTajViLzVhL2l1dXBiOTB2ZUdsc3JTSTNXR0lCRkJlVHVwRy9TcExQ?=
 =?utf-8?B?SkV3eVdTNXlWSWlzM0x0bzVwbkhzSG9vU2M2U3VIaWx6dnRMNjUyY0N5TkFh?=
 =?utf-8?B?K1hDYXBLUGtpRmV2bCtLazExUWE3Nllsd29BRTVYOC9iamVkdjdxWmR4TGY5?=
 =?utf-8?B?S0NRM0FpeUxQYlVjY1pTSURVcG4yVDVVNVRRbVFneE1CdElnQm5lYU9laXdJ?=
 =?utf-8?B?Q0lQYkVoWHNiZ1ludkRWa2lTblNzZWhaT1BqOHlwZDRIN1FHUVNOQWJqQzcx?=
 =?utf-8?B?K3ZEYkI0ZUdSTnVMbERjZzNjN0lpUG5TOXdTbmdqV0VZSWdFbmRlaGVSdzY1?=
 =?utf-8?B?SE1POGxWckhWakkwRzJwV21rbXY0UjYyRFRoUTZubzFXMG9IUUY5WnpjOXU1?=
 =?utf-8?B?bk85Z1ZFd3R3bFNYbkFNVC9DMzhSYzNCWkhjdTZ1Qi8rZk5YclVlS09ENGhM?=
 =?utf-8?B?djZEZnFCc2M0dThOamRtZTJEdU4wZVFES0NlMkVUQjJENHN2UDFZOHRwUWpT?=
 =?utf-8?B?R0dqTWg4NDNJNzYzdm1sVyt3TGthNjh0RTNGcVMyM25UbFdrb1E0ZHZTOUln?=
 =?utf-8?B?MzlXanpTaGM5djFETEM3Q0kwR2xWbjQ1NWZGb1ZHaDdMYmlwZXJ4ejBJKy9p?=
 =?utf-8?B?elh0MUw4eFVPSXRJSFIxN3kvOHdzNTlySlcvbTR5ZkJ4dms0NjlQNXZUeFRB?=
 =?utf-8?Q?pOQm6E49y7ASWwQE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a0406c-d109-4b52-429a-08da4b064b45
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 17:26:03.2469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6qNxgejLO/loWZYLIDbgkLAeWeedTcuhQqVrR59uD18ZxgGm62KtwRpYXhmxJNzRvDSpzeiI8Xz3BvtAOAQU5qgVcsTXAmOrANF/k/A3Yg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6047
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

On 2022-06-10 6:34 PM, Pierre-Louis Bossart wrote:
> On 6/10/22 07:36, Cezary Rojewski wrote:
>> Replace ambiguous 'broadwell_rt286_' prefixes in favour of 'card_',
>> 'link_' and other similar strings to clearly state which object given
>> member implements behavior for.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> 
> This doesn't apply or assumes something else was applied already?


I believe it conflicted with "ASoC: codecs: rt286: Reorganize jack 
detect handling" [1] as that patch updates the users of 
rt286_mic_detect(). That patch was just merged to 
broonie/sound/for-next. Forgotten about those few lines being modified 
there. Will update in v2.

[1]: 
https://lore.kernel.org/alsa-devel/20220609133541.3984886-3-amadeuszx.slawinski@linux.intel.com/


Regards,
Czarek
