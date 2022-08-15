Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A355933B4
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 18:58:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AA391622;
	Mon, 15 Aug 2022 18:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AA391622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660582728;
	bh=YW1IGDsKualWY/082wp6Gf2e60p7VH5b3DwpSNS7B7U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EuFSNfCwYwDTb4NA1eCm4vxgT1ANeFsAUFVnaPgLADz/L36ja5D0RvLrVty91AQJV
	 Mv1dyngb+4Y0R+tob1XwcvT5tnnh4E3/PizwxBUudH9SWxosq7+JImrh6Cj2vJPTWi
	 5rm9LXvxkUEiVaZJHeJu8rrxvHGDR+0NgkUpWqkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A6A0F80271;
	Mon, 15 Aug 2022 18:57:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45347F8025A; Mon, 15 Aug 2022 18:57:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55F69F80082
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 18:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55F69F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TJcACtTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660582665; x=1692118665;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YW1IGDsKualWY/082wp6Gf2e60p7VH5b3DwpSNS7B7U=;
 b=TJcACtTftSNemmpEaYHvK7FxYZZIY89hmmOudobnk7LDLshzzsYuWPQJ
 WJD72P+75FM2+B4TgrfSAVXZX9bzx9Kk22HfqxuW8L6kLYBDl2yydNU7/
 EKgGHD1LS4Z4aFuquNK0DXspkrDkaHbstBEQU0bCIn2W4iASkkZR/CswV
 rDIWATft6+qarnUnamB5UrlbDMa6wOTexcf68ndsB1fJ1S9TwaJL5KB9S
 WNmBvrzeVZDLssyzEH2DG2Dmy0s4Sm54TKuQ5u/t8jpA0gmM4NB0ynQs2
 2afi8s+KGruHQzm0EnlTSv/q+e4qJFT38OC0eUJxYL6drkvIr1Eq9fsBI A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="290757761"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="290757761"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 09:57:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="582949994"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 15 Aug 2022 09:57:34 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 09:57:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 15 Aug 2022 09:57:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 15 Aug 2022 09:57:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McqlTBGZ8IJO7kUmeuA+cV+PfxVxig9agVeXGrHQDkCcvkYH6sb7BShVmA7GbVqdobWza4wBa+1XKNXnRpPv254jy6pHS89mlngC05mEeZwuladiESubWofNNb/1fE8bd4GEAR+ZgiwictjiwdT/dNjVwbIJeZifGjzvr7RLjpkrlwajKQ/O6SWkFN0Lxrp3XsGEgdQol5nMOt2xodZ0oh9sBY866+54U3lrihy3Z1NwgZogxSz9XxkhaD4/1BsKfj4VzEdL0MrlBb9T/NAP/v2s9CzPj0BqfO+JkNmsjBfEFBmQsOMGUS4JgUna9lBS4kZ+tlLzP8mfh45qhsJq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32PWXk0FwzFK5IJAyr8HiUclQzdFoozgWYNMtr5mkJc=;
 b=CEQqt7fyHXv90uXsU4/5+78DeEmc4iR8qODaX8QdTqDRh9k15s13yJjixkc31wYz0IeSS1Jn/yO2sjkk6N2aVUbbYErkHHZVukPe0iyEggNFWhmno955bmYHIJEipVMcgOz63KcNUhoru+SqbZzpv8lFd3RUGOXXbG1KIv/7kN+O2X5s+QA86siYIYQJTfZwJxv1Fu8jvAt7XY28m0BRrghidKywhVLItEjRryq+YgoxUiKU6KymYibQ3tU0/BD771iMYmMAYi68+RZ+wZ841bjmTVNsLtwGBBprhFbpG0sbdwXQ1ltE/FAjU+473XIjA9CQ+xJ6wWHyiY4mlSPxKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SJ0PR11MB5679.namprd11.prod.outlook.com (2603:10b6:a03:303::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Mon, 15 Aug
 2022 16:57:30 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::75e3:4009:a5d1:c3ae]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::75e3:4009:a5d1:c3ae%5]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 16:57:30 +0000
Message-ID: <f1b2b244-c230-c3ba-8694-f3c3b5baa626@intel.com>
Date: Mon, 15 Aug 2022 18:57:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH 0/4] ASoC: Intel: HSW and BDW updates
Content-Language: en-US
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220815165818.3050649-1-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220815165818.3050649-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0103.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::18) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8057ed4f-6a10-4d2a-63d7-08da7edf3d8c
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5679:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KOtkTk7UEu6qnPD+mqOvo6NzxYAvaPBaiYyxVQgJXbzYQEGRLGMDHFIwGeN9DwFtreVkUVNFrvjAW4go/ibBNE9WXGDztBFBlgIC6mCFI2o0CE8TvuB6WzcBU4VBWEZUuxgMEt+loBHM4dilncvVshHnAO2l7smTjnl4R/WM3vGnqks7+Mu+K9CcUCqUHJJ5k9fIERZE56Ml3uSVPOvuY3WGD3zgvhCN4N25d5HGQKDVhTj1UXbc1wKPXA+QuWbNBQwJnfRvO/GdAYiNZTSp62XyWJdu/9regI32CZR/7WS5yq/je2m2dlPJA1M/Uy/d+XxPgbKzki0IrW8xJ6CxfD6+fTHwAdHLEqLu53YyZEne/KT9xrfNomtPp0EgvV4lzgMLI/BkWi9yhjaL8TaLHGe0zxiZj3uvhL5cBYgoXiNUxiix/wx9sC2vKWGb0RrGP+armcN5ZVluwOvVWhI4JLqjkFIhy25kVQ9J90P36A8GRQ4tDi639RiNYqhLARCfF4IMt7EPXU0m+fkWblAkcOnwTW6eZ7pwKxUvID6+z5BaP8paRY4vWIy2lgpe46SQAeeDKIAzv5bY8X0RKu9AEdgLLUH/Bi7mivE80kiyDiWUTyVmttt+nH0EvXaTvW5TYNq9SpVRDR8zgQ00A5mpZHdwtcEYN9IpQGOpnWmBBV5sb6yxIWaj3EFoC9ozktZKosl+XG/vanI1iyQqLNPpeMC1AiJFWXj419lje6+K99ZW/pMfiRu00iCldueGA0LMMLtRMiOvs4nuEZGzUPO+lmJQLO9G80+aEAF7oInL1LbaeOLgtHQEoA9ywkdCP2SPEgwSuWlzsI9LoS3voyziaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(39860400002)(376002)(366004)(136003)(396003)(8676002)(66556008)(31686004)(186003)(41300700001)(66946007)(6666004)(2906002)(4326008)(66476007)(36756003)(316002)(2616005)(38100700002)(6512007)(82960400001)(26005)(86362001)(31696002)(5660300002)(8936002)(4744005)(6506007)(53546011)(478600001)(6486002)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1Y3NDkzMkpWbzB6NisydTlXWGhXc0tWYnpnRmNjWTJ4VVpmUTJuMTN1Vmoz?=
 =?utf-8?B?eGxBdTB3cHBVVUVnNVQxRDhrcm1KOFFWT3BNcmt4SXk1VWVUSFJUTnoxUFRJ?=
 =?utf-8?B?ZzZmVXkwaTNwclRuU2ZrTXprdmZuTi9CQVhEaDFxY1NLNGQ5OHAycHk1WXAy?=
 =?utf-8?B?Z0FGZjhOVmlVbHJDOWRtVlRZSjZjTVMxUnVjMGhsVWNFTTMyUW5lQ0doQ2dl?=
 =?utf-8?B?b2l2aGxYamRmazJvV1BzenBja3UwbWlscno3TzBZb2crdEhPNkJVM09vd05j?=
 =?utf-8?B?Qjl1ekYySGdyRGhPNWFUcXA4VkRkcEdydk9ncGRVa2d1Ylhtb2FLY0hzN0Z5?=
 =?utf-8?B?aUJHT0FLV0pMcFltSkxSSXRGRHpIbGhSWWZaNUdpM0N2Z05VaXJPS0RxQVhu?=
 =?utf-8?B?UnV6MWllNVBJZ0hFYktrdHJoZ3AyQmhNNjZ6VFpnMldjZ2hzMnFtaHJNWkp5?=
 =?utf-8?B?aUVqV2Q1ZGNHaktLZFc2MWtiSSt4VEE3MVRwd2hsQzhNRUZYUFBOS1Q4azEy?=
 =?utf-8?B?NzRsdWpCZWJnK1Q3Q0hOMmlaUThZbVB5dzh3OUhmVUlwT0l1K2ZxdUR1Y0VQ?=
 =?utf-8?B?dmliWTBZbHVEZU1NY3gxazY0ay9HVitZZThraHlBVWtSWFBZUTJuS2pJdlVK?=
 =?utf-8?B?VzVHTC9pTndiNHhOMDJVNWJKYXhjVy9CM3IwUTRRZXpyd1J2Q3Y2MkdjU0kv?=
 =?utf-8?B?NmpSYUQ2bDJWV0dlU2dXSWFGei82dXMrbG9Va3JySlVoeWlZL016Z2d0ZXZ6?=
 =?utf-8?B?blloQ3FiQ3BCSFBpa3FZTGdJVnlvMHhDQ1JlSFlCckNrVHdBbHRYZVBzMElB?=
 =?utf-8?B?SFJTQjBQT2RlNDk4SUQvTzlzcTlsS1MvTjRneHNMWC82QStyTWxRZURyOGh5?=
 =?utf-8?B?ZFlKdmMxRnpNaFZ0QWhsKzVwREx1ZVJGb1c2N09UK1ZmVzB5SUxVNmFITE5s?=
 =?utf-8?B?WFBCODREaFc4VHAyV01QSktXUkkwVWRGejZkNzhoWWhEMnB4Qy83aktVT1M3?=
 =?utf-8?B?WHRNd0VMOHpWVXE4akllTTE0USs0cWFLTERHYkZobXJBcUNKRlJOU2ZpS1Fx?=
 =?utf-8?B?THpPTzgweGZoM1FKM1J1SVoybW50UjRpeEdxa2JEdDVHQ3ZFK3M3ZXFBK0x5?=
 =?utf-8?B?Zmhtb0RJQ2NpL01zTHBKcG9aK2ZtYVdmQnNhSFp2RkY4dWVKei9OWlBqVC8r?=
 =?utf-8?B?cjNHbGovekZDNHJNYmU3RTdDUERaMEhzd0FTQWRQSnFxbHhrQnRDS3hia2No?=
 =?utf-8?B?Q2djd0s5Q1hEdThncFJBMGRFeDd0aDcyWk9MNXUvelNEQ3lycDkydlNYMjJJ?=
 =?utf-8?B?UHpaa3NzREYvb2NYSENYZWtGaGRhcnBtRlhjT0NPUDVzR2xOdkpnc2ZmWlUr?=
 =?utf-8?B?MXNyaWhuWXFHdXp2WmUxRk96VXJIam96Wk1uclhSRmFNbVJzeDk5QkpCSHZQ?=
 =?utf-8?B?SkJlS2FTU2N4WUV0c3dxSEdwQXRnUUNLb3hFVnFQRUpIeGJmRzhqYWpHMTVB?=
 =?utf-8?B?WVdzWTJZRHJxUkptT2lvcXU1L0JGdnVSMWttL0dOaWNpV1F4UUtidmY3MHoz?=
 =?utf-8?B?N0wzZmNydkJGN2ZqVDJnSXA1bjIvcFJEdXJXMGJjcVY3VnBLdkdZSjdsbUtY?=
 =?utf-8?B?NUZ2VXQ1ck9vNVR3UFZXaEh6WDlSMi8rOXhuUzBrSXd5OTY5bDhwbXZ6bW1r?=
 =?utf-8?B?VVZXdWVhUzg4N001VUNGNkw1M3ZoU3crUWYxS3hGZXNWS3pnZkx2ZnJtRGtr?=
 =?utf-8?B?WVNjYUpGYituNWdoeUJxQ05UVjlKS0hKOUZ4bnI1VEJCc1RqUjRWLzB4aDJR?=
 =?utf-8?B?c1MwbXkwdkFVL2JSZXZqWWpFUFFkdWg2cmNENFFjMWtFb2FNeVl5UjdXRnpl?=
 =?utf-8?B?V2pobERxOU56ZDB1NlVHdXcycjVCcEllYnBVanhjL1BLK1VSdWppdWwyVHdz?=
 =?utf-8?B?bjkvTGNyOHFlWFg4WGZQNEx4SkZ2M3g2ajJrb2k4bjIvM1FubXNHOFlONDYr?=
 =?utf-8?B?b0xjRjhlVUhIQkloVTRSb1FZaDZtNTU2aGNuTENFbXlkTXM5SkIwWHFxV3Np?=
 =?utf-8?B?cHpKMGhuM2docDZxam12SGhXdThTa2xuTmhaNC84cXE2dUdrdEVIYWNRczYr?=
 =?utf-8?B?bWFlSlVSRXdXRWpob3BzYnlqb0RaaElXQ2IxdFIrQmVRSlNZYnlEcWdkWUpi?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8057ed4f-6a10-4d2a-63d7-08da7edf3d8c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 16:57:30.4107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+mW4LI73Skmub3xkd3SkGI22gmDujRJxEK05XVDaghfGHefyX6vVfh+uqKTPb1z4xuPj1aUN+UgvXMrd2nsDqpoNPIopoX90NUa5xBbGJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5679
X-OriginatorOrg: intel.com
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

On 2022-08-15 6:58 PM, Cezary Rojewski wrote:
> Sharing this PR as it touches on cross-driver subjects. Four commits yet
> two subject. Given the small delta, decided to combine within single PR
> here. I plan to send these subjects separately to the mailing list
> though.


I have forgotten to edit some parts of the cover-letter before sending, 
sorry for that. This is basically a copy-paste description from 
thesofproject/linux PR #3799. Patches are OK though.

Mark, let me know if this needs a re-send.
