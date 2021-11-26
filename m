Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDA545EF7F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 14:57:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6D521938;
	Fri, 26 Nov 2021 14:56:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6D521938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637935030;
	bh=YMx2CuS//JlMX519eSAY5HucpdCHjTtMFSW7h82+3Vk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NCdFtNDEMocmQCjtV2I7wrJ8DqmtByau+K6oH9N/SF35LqRJp9G6TOyh5PTWcuSeH
	 U7C8uYRzxdpp+2/z/Nxoaup7R2XxK/rBKl5LMYyq35N6I3uQ2obVPnnRV7GdOVtKqI
	 cMLOaMytsHpZTBDSR2R9sInjut2fEAhg1hHCQT50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B2D5F80245;
	Fri, 26 Nov 2021 14:55:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 568DAF80212; Fri, 26 Nov 2021 14:55:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB490F80166
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 14:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB490F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="UOs+eHb0"
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="222891954"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="222891954"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2021 05:55:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="510025875"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga007.fm.intel.com with ESMTP; 26 Nov 2021 05:55:40 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 26 Nov 2021 05:55:39 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 26 Nov 2021 05:55:39 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 26 Nov 2021 05:55:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVNzlSCavfR+SJ8gjJYdhBE2kkdaD8BWi7VCF0JWuf0ZdU5rssIFRcT000+AgJINcCN6Hq+kgW4MjHRxHS3Cu7eIi4iGjiaIMwIeTRb5zoH1ruirUkBILP7ZK5g9MJ7LBqhUelD4qoOKdkb1+n14negNl+jE3gp+qH+lpXGKroDLWWXvRAwflLd9bVoRNJGc3UJ1Lbl6TJf0MuC2DcqTpAT+JfGPKKrQ+9LmqyksOXdRcPbUUy59GLV7rGZhKyOML4X1X8teUwDFkSAYxQpRFKx7RzUAMapYR4qxPmKtozz8iKM0q8Z5+EFRB2l4c68BfqZbMX77KNdv8/fL3TUi2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFdCzrGoTGyJdOUUNhiU2eeM3RyutRx5Z2DrN2804D0=;
 b=HAxVHbI1ADp6MhNYCPC1JHouc3cZc/N4ltAhxOtjcOKGQNEjZ4xOlBT9jjo5JeYKdxmCILHhUHeR4YJLdH7yq3588KkCg+UpmqmYjrsxI4/21F+HcSZKg1Fghp1eQ1ufnShv9URmUSjPLNHgZLQ0hvbNefbdZh14o9jH1G5/uRp71f/uAy5EDlzjrwpOt+iLD64VPPJrt5npqx6IRlEa6OQXHjqzwEOD8Zt7Qbxq7EfaO1lR/SvhzAwVYhRrzjPMuLLBeDet5TXwb382gLr7pC631BPNNtp1p5516cy1SkSPxP4Yaa77DpOQ2WZ9BLeDpbfwUXocepugjt8ycNpOWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFdCzrGoTGyJdOUUNhiU2eeM3RyutRx5Z2DrN2804D0=;
 b=UOs+eHb0OeKaWXCHxY5KYAA3DsApdxemmU4kOApv1noRy2MXmDRXS7xkSk1sv8G6d3dAyysDNq8MwlssRjS9OnJ7kthvMSupSXK1qxmyYY4Mm+Scw0ygQG/xDfxsqHPA/ALa6ta9j3Rsyx4wDj/htr0wZoeHF9RwQF/9Y8dYytg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR11MB4018.namprd11.prod.outlook.com (2603:10b6:405:7a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 26 Nov
 2021 13:55:38 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542%6]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 13:55:38 +0000
Message-ID: <accab48e-c553-57e7-5981-cbe11458ee0e@intel.com>
Date: Fri, 26 Nov 2021 14:55:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [PATCH v4 0/3] ALSA: hda: New NHLT functions and cleanup
Content-Language: en-US
To: <alsa-devel@alsa-project.org>
References: <20211126134739.1041596-1-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20211126134739.1041596-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB6PR0301CA0067.eurprd03.prod.outlook.com
 (2603:10a6:6:30::14) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
Received: from [192.168.0.164] (89.64.110.117) by
 DB6PR0301CA0067.eurprd03.prod.outlook.com (2603:10a6:6:30::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.20 via Frontend Transport; Fri, 26 Nov 2021 13:55:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d161b7af-558e-4ff7-c2f0-08d9b0e46cb8
X-MS-TrafficTypeDiagnostic: BN6PR11MB4018:
X-Microsoft-Antispam-PRVS: <BN6PR11MB4018FBD9690439296DC8D167E3639@BN6PR11MB4018.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 01JX2lZWcLja2pNXv+q1sVNSbHrhZLPFdu57916W9I+9nDp/HYQXkCce0BN0Y/EsWzf/8l/D71mQVSKL5xa7RHEoj9F4UuhTF8WcNB3BeiMZOr914LdTre8aii/WBRV4vHZxtyfya6v6FSLUvCEe18lSMh3vdE6bc1KDJ14PsIlweMmhhjLqxC2Dfik/zj1RCxWvEtjNMKYC2kFyfXRncXc2OqfTD39kR7B6bLW/ewQSc+5d7yGsy/22TwQCtwenOMvpJKCeU4hKUiHwrEATCrC42N2uAK5+DUhGkPn34H68+iLF3Mp6AyVtomvXmJCz/oYY6cc1q0rfX+YwdXRvzWEYkgINIUJtzW6vVUwjmHzJ5DSvUjHk9H7xpJ9E56gGS2tmI+SrnHU5NYBowwFI5lsNy4d4MgtnNhasyQQfPbjtMDrHjQuD9pqziFD8KqZ1uPEWo2Jlt2n8ekzkqsVNfS6IkloFLYLZKiWdEuArtvfQHrwleWSb5Kfk2cN/UVWr1nY5z1YZEQpuMMf0BYCzIRDVr9W0VJf1MyutERkJW+y/BWD+DAi35pn8wbs95g8G5tfCa78Bhu1dXdf9e3+fJ9GqQxkZhpV2cB8ECUviY+unlUpCAa71xO5X+y+x5ka3euYJDhsiHfX1KHxymPMLYgVX4p/z34nAJcn6vykuUqkY1L0zVLD70vSwt0eU+DWdlodXTvm6qEre6cE6+y5QYbJmRN67KaRmOKkSqPE2a1FuAMdAB5nTQmL/zi95fNwH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(82960400001)(44832011)(26005)(2616005)(4744005)(83380400001)(53546011)(86362001)(31686004)(6916009)(956004)(4326008)(4001150100001)(66476007)(36756003)(2906002)(66556008)(6666004)(66946007)(6486002)(508600001)(16576012)(316002)(38100700002)(31696002)(8936002)(186003)(5660300002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlZ3UXlnb0xvZnJycnltL21UVmtYczdHWnFtcGlqaWJueUhaNHYvUFBVSFRk?=
 =?utf-8?B?cXIxdlJQY0YreC94bEdLQUwxR0pDY09qUjdOQWt2WUoydVp2UWcwb2trbFJu?=
 =?utf-8?B?MlFQWjVUaGxpSUFPamlNd2VOeFdWYUE1QmZ5RHlEOStIN1ZZSG8rZ0U3YnRw?=
 =?utf-8?B?UUdQUVROelNqdFpKL1hNMmZ3NDJqM01wOFRZU2pLOVdhZG5ad1YxUkJwV3l1?=
 =?utf-8?B?ZDBpWHFNYmYwRTRFYnJHb2JHK0RuV0xPUmVLcGpoRHVLQzRVMUNuSVUzRWhr?=
 =?utf-8?B?WExucWgwZVFzNjdYbjhCYitCRDUvZFdBNlpRZ2Rta3BFb0RuaVhPeHFTcTZV?=
 =?utf-8?B?NHNZOU5OdTdIMldkOWRIWEJySlU4cytmUE5pcTkrV1VaVUtDaU4zaWtNNXNC?=
 =?utf-8?B?NzJpZ3VBTDJJRXhuZXVoMUtlTE51dTdiWElneCtzWmt1RlN6WjZyaVhPM3RT?=
 =?utf-8?B?YWxGNWNPbXFvc21IakxGaGtDWUZ2Z1ltbmNISkNNL0JQUHhQTGtYck9RUGxo?=
 =?utf-8?B?ZWJqazIySVphMVp6WG9nQkFrYWlxTU1pN2V6QVp0N3Q1K1ZCWWI0cFcxUVV1?=
 =?utf-8?B?dng2UllOa3R6VHFteHBkMkVTbFc5VHpQUEF6K1pZVEE1N05qSkVLc0MrazFO?=
 =?utf-8?B?ZGJaVEtpU3pSMXhYNEg1ZUNYTzlXdjZuVzdLTUlCalNHZ1BJRkx3TWM5YWQ2?=
 =?utf-8?B?b3g0TnVNOEJEWnpzTG13aXlpSmdYRTVhOVZSTFZ4RUdlOFVOS1Bld1padWRL?=
 =?utf-8?B?NnA1S3p5UUIrb0JtNkpaOWpjSlZJUE05SFVlZ0J4MnozaDN0LzErVFN6VEF4?=
 =?utf-8?B?aG9OME04SE9iOGVjNEhnQkxZOWxnR0U0aTFGdXhMYmNLanJsT1JHZnR0cGpn?=
 =?utf-8?B?S1ZUWDdmU245R1NueEhsUXp2TmVsdk5ETENOdXhrMjBMSU43eExrNkZESVpM?=
 =?utf-8?B?Mi81akJYdG9NZGxoemJiQTRrM1R1L2FXWEZoNkNQK1V2VlZCS1dFSkxNcVdu?=
 =?utf-8?B?MVIreHZzalh3S0pHanBVWGRRRm8wYzVSMlRORG5yY0NOODBMTW02NHVxVkNa?=
 =?utf-8?B?SE42VDBGQmE4ZFFld2RFa1pmZG1tYTRJNVZ0TnNXNFU0UGNrQVFwM0VnTFFl?=
 =?utf-8?B?dzE4VjIwd2FXSytEZmNxWk9DekNNUzdKOHZ2bnNsN0lxNjNrSUliMDNOckdT?=
 =?utf-8?B?TC9pYklmM0xycnhhWWdSTENlTDYvaFd3Y21NK2YxQ2cwbFNhWkNRb2RvMEdj?=
 =?utf-8?B?cDdEZ2lMcSt1V242QTVISndjeDh5dGxjb1RvMGMyajlQZG8xbHhnNERSWWpr?=
 =?utf-8?B?N2Z2Vzl2RnFQQjhlRkVBNU4zcC9wVVk3dGFVeEhMbFZIK2FyZGNTdUlmVkdo?=
 =?utf-8?B?eXRBTlNYMDlueEJsb3NRWFp3WDBwakZUOThkV1NpUFFOdkh3SVg4RC9JNWdi?=
 =?utf-8?B?aEg3NE9GVVpJT2pxbUJRa0ErZ3d4R0xrd2UxQi9RcWhrT0tIWlYxRmErVG95?=
 =?utf-8?B?cUJ3N1V4ZThkMTdpTC90NU1FYy9kWHdhS2hCakJWbjJiUmdKVjRzTjhGN2c0?=
 =?utf-8?B?N3JxNm9KNklOUHdpNUJ0dUdTWXMrOXpXcjVNNllCN2tZUEVLcDBnckJ2NlJH?=
 =?utf-8?B?VldlVzZZdjRNSVF4WUJwaS94N09pOFJWU1hMYmw0dit5SWswNGJsTlNWTFFv?=
 =?utf-8?B?d1VwVUxjQkJ2eTVIN2lJbXNQTUNucWhZMXdtT0dNblFKcnZ3Rk9aZ0VBd3hW?=
 =?utf-8?B?dkdzWHpoNnNoTTZQR2JZRUJZUzBvY0l4UHNvQUk2d3RxNllPbmt0RHZIcTlH?=
 =?utf-8?B?UGdNdEpSakFpV3VYazZQZ2RjZFJzS01ERFZpNitubjlTbmNKS1lrSUw4Tjlu?=
 =?utf-8?B?cnlIbXI1RWZ1d1NGY1RwTDA0Q0pzNEJaNW41ckNGU0pBaFM2Um1qV2RGSlJk?=
 =?utf-8?B?TUQwYnBkWDBzMlVueW5zQkUrcjIzMzNtaGRDb24wdkkrSGovS1dUcHhBMXFC?=
 =?utf-8?B?alpveFdJVThMZy9rYnMxcER1Z2ZpWG82Tm9VSmt1SVNsakF0NjlkRHlkQXNM?=
 =?utf-8?B?RVpGdVNMS3lsc1MyWWRhMTZ3TURWUVZaR3Zkb2VjV1NJOEVZOFhpeFlmbFFX?=
 =?utf-8?B?aW9WMVk3NzVHb25uSlIrUlRTdEhaZEZvejBPVC8vRjNCaDVNWjVNb2RVM0N1?=
 =?utf-8?B?eDVnaGMyTFc0RXNuczd4U0xqb2VYZkJqMVlGUFBCSnNtNllmSWNwcks4T3V4?=
 =?utf-8?Q?WZl3XL4eTr1ArQCvr7B3gMNHZkNKYdCWEBA2P4+doM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d161b7af-558e-4ff7-c2f0-08d9b0e46cb8
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 13:55:38.0191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gn5c0GTmcW+VcyTjDpMCU0EYv/b3L28xwbuk8EeJnGtWSSoA/5ae7IZRh9sUSfLSrUmWanXjPX1ne+XeLYTF8/2xdlZunIKX0pj3boOFB9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4018
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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

On 2021-11-26 2:47 PM, Cezary Rojewski wrote:
> Changes add two crucial functions: endpoint presence-check and
> retrieval of endpoint's BLOB (hardware configuration) to NHLT API.
> 
> Outside of that, "is DMIC in NHLT?" check is being re-visited. No need
> to check for channel count or anything DMIC-configuration related, just
> straight up verify link_type presence.
> 
> Changes in v4:
> - patch renaming nhlt_acpi_table struct to acpi_nhlt_table has been
>    dropped due to naming conflicts with other parts of the kernel
> - revoked previously appended tags from Mark and Pierre as every patch
>    required an update due to above

I'm sorry, copy-paste caused the tags to be re-added. Ignore this 
series, I'll re-send as v5.


Czarek
