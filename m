Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6589506B8B
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:56:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70C7A186C;
	Tue, 19 Apr 2022 13:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70C7A186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369388;
	bh=SjnU4kNROm2mv3T2kNwnaI60QJSZH6uNGfG1oYNCaHQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q2sufXLBI9HjzDFQ3jWyahHKLljBhVx+NElMKLoEy3zi0S0V4o/ZhDVWSNZMOgP+1
	 GTUnZ02mwiRZNDw9C/RRqAnAuq/ZQ97RvJMfW5LdZVvGGCPhE2PLDb3AnamJATFFan
	 88BTzUAWZPOEplDUVMiMGbuS06p3/zAQrVl2DvRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AB55F80552;
	Tue, 19 Apr 2022 13:52:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 698D8F80095; Fri, 15 Apr 2022 10:17:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C9CFF80095
 for <alsa-devel@alsa-project.org>; Fri, 15 Apr 2022 10:17:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C9CFF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="n73QOOus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650010634; x=1681546634;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SjnU4kNROm2mv3T2kNwnaI60QJSZH6uNGfG1oYNCaHQ=;
 b=n73QOOus0CdqU6UWtNNEbUOfplY+TKZglaFvKoH+TQAQV8XXBGeCCkeF
 oXorxd+ey6u6q3HgE0ECRPOVgnS7hc8s9e7ttrtMKDCnh1sGMgpMX52Ll
 SpefZiUGvCKyCbnFoThbMhLENg6gkz4/NHhzC22BMMOWFp0HvVORg2h4P
 gZtIGY7CjkY2T/3pVaseyEJ2MM5rGxfJGYEtEeLMossWTPyUaau9x3xdq
 Tk1xZHj9MbDpN+JZWDuQEAs/1amip+kUAFzAa/Y+4ChHzI6TE+u4IJgKY
 R+HJk4KmDPwqtgbf0dwz05hHH/awiUMqMatM024PAEOTagdvZAPUMj0+R g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="263295907"
X-IronPort-AV: E=Sophos;i="5.90,262,1643702400"; d="scan'208";a="263295907"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 01:17:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,262,1643702400"; d="scan'208";a="527215650"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 15 Apr 2022 01:17:06 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Apr 2022 01:17:06 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Apr 2022 01:17:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 15 Apr 2022 01:17:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 15 Apr 2022 01:17:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAdWIdvSQ3TNiu6rZa4SWnpFn5CbLY8FHsC2XukA+KTcXpmhDIer/DpFfZalHyGdmmAfr5UKFqr5XKqvcIUm3uqpzbcNQMLQMjLgTaox3cqI9gx2BuF00OL3RfckAVe0XW6UeaQv3Ydj3gTktGGWAqhKF0m1gIMSxC+hu9YFKHt41aWXx6fy0UNkqFwyvQxEtSzTKJ00ucxdFyKFQbw32KXqp6XFkJaS1QtnvZPnWy9glJgdWsD8T2ZpJ2hcqj5XKetmegfQnfvtRfc+Qulpnqn+Ui6hGmM3rM7AbOOySS0eyuILL3F81ldEbeiPQQWCdJ1n9xspi3zTNqpEDbAHnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nwBVuDKK0feHu/qaKlWxfJ8ZgtwPe8P3VbpytCTCI8=;
 b=DbN9l6J5DXGbjaZQ86ZqWf2RmZoHTyLE+IqjMhj6UX7TobAewP0kxVJqY7lxLOl8ypyJbilmZYas07p+iRX/wsg3rx1oGc1p7fetbO1xlKt0+YfOYCkgLfF53/ozkedrB6+LAgKDTesLwVGcrhMG72GopSO5FaZZ0ihg9X8uSLihhV2xNp9awSf8Bt29VWmowCzYWAHgMnv85OwCwBZtIewQ8mR9LagpuMCUwmhuW/fLHtd0TM56XQyfmOQ6AdEzcYRx0jlZZMkk65n9tsf+HGySVxp+3jlh1BIGAWLqe26XQAiE36Ij/KkAkfzP8/yUIa6uFTgXVjvw/HBxgq8MRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by BN8PR11MB3796.namprd11.prod.outlook.com (2603:10b6:408:90::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Fri, 15 Apr
 2022 08:17:04 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::109e:c1bf:57a6:c1fc]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::109e:c1bf:57a6:c1fc%6]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 08:17:04 +0000
Message-ID: <52cf7f2f-ea63-8095-6147-750af9a5f2dc@intel.com>
Date: Fri, 15 Apr 2022 10:16:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] ALSA: hda: handle UAF at probe error
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220414182437.14944-1-nirmoy.das@intel.com>
 <s5h5yna4xil.wl-tiwai@suse.de>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <s5h5yna4xil.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0059.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::34) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a29f5b38-deea-49e1-6406-08da1eb852c1
X-MS-TrafficTypeDiagnostic: BN8PR11MB3796:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN8PR11MB3796D3EA001F534DE18293CF99EE9@BN8PR11MB3796.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5L9GncOQ17oNZSH/4sMUEHT3rSGmR8lphdPymQ/+7Gj2x3NyJj5T7GYInAbBX+QnhAwGSV3IRZaU1/0qwUcyM2vlQdw8uuCSD7fYrDS6Hl1MYpqFw0iyG3kh0F2MlpNEwNer9xy0Aoz2k761783s+e/AbpXc5VoAF8odoH8ptARIm53RO+6Xg7BBOgQe3mNebi2PF+QZVWVP70eyYmlbSSaz5URCSFeV3SDDflFPZQL18niA9HgPsCSjcSgckPmqwyrelx7lvIFHLi0SPEKErSNZnLa71bMsjCds6RpvIQTifA1Z42CpuLme7mJFSJYzkySvaRJBG47K7UvOS7FK2sf3XAxZeAuw+B6h4UmEwIKqmnWE5xoNvvraOzs5P5EzyEGzknqtEU0W5P7hhgD5E66bKolU2BBdvTuGR/GnGy2TE9uFlY4zu5C3XV2200I31dPmtpZuM6ey2t3EnTfBQn/6tZriGrWJ9kiMC3JzZyGTQlEFFMz0mh/qUeH2kOmnqMKnJoxWNMJ7XymY6C8pU1zBouwRDLYLY3zLyy3y7kqZmenIL5r7I370CgXFahUoLR09/bgEzw8OsyCAVuvRkdBFlqfkr6E62ghKY3ElLA9J3//GReFTo0quldyNK8lVpNqBeLw3poG8umHW2UOyENP+9Rs2LZS3eTJovNcyp8h3LLbp20BuF4Pu8c7jGmuo//Em7UbF8aln+3O29dwfRI5QEA6UivHjf1UeqMA+y/Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(6512007)(2616005)(83380400001)(66946007)(6506007)(2906002)(5660300002)(6916009)(86362001)(31686004)(36756003)(6486002)(508600001)(316002)(966005)(8936002)(31696002)(186003)(4744005)(4326008)(26005)(53546011)(8676002)(82960400001)(66556008)(38100700002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFI5OGZIaWhmVmRLaGJ0M2xSS0ZDM29IcTA3MjdLSllHdVZJa2hRRVRxZERu?=
 =?utf-8?B?Y0dVUWtRM3FZS2ZkR3VxL29JMFk4cTRnZnVQN095dWpjOUN6T21oSnk4WDZ0?=
 =?utf-8?B?ODZQZkZic3lBZWNqUUM3WE1mbm9WL2dGbUp4Q3pXczcya3B1NmVlank2dGxE?=
 =?utf-8?B?TjJ3bGlIZEpXWmZYMU82bjRaMGpoSC9kOEV1blRocDhyWW1UYjdHTGVkbFM3?=
 =?utf-8?B?TXlXYStXUUIycGJiRHF0THlRZzVrUG5sdG5KZW9hdzJTU1lqeXkzelhwVllr?=
 =?utf-8?B?b3l0bVBFMU5yZVFrQ0dNSFMwOSs5cm03dWRZQ3lYZ0Z3VUxFYlNNUmNWTzIz?=
 =?utf-8?B?LzI5Nk1CV2xtZS9rZHNoUGhEcE5YZDVTYVBjK2QrQTVJR2tTZisrWVFWZ2xx?=
 =?utf-8?B?TEI3Z0JnWWF4LzNNUkRBeG9WU1dCdGtEWDZJTkZiN2tlU0VybUdpTitzVEov?=
 =?utf-8?B?dkZYOVBGTVJYQVlJa09vNnJGOVFZUlgzMUR1REtzcm91N0VLRCtFTndTK3h5?=
 =?utf-8?B?Ykl0VkpJVS9LQW5INTFSQUZ1Ukc3MDFQcFdhaUptVDhYZW82R1cxdDR2c1R5?=
 =?utf-8?B?RTk2RTBKQVhCYzhNNEdIVThCSUdnOER6QWVLblJOTVhWQjVJZjNiZUplU0dY?=
 =?utf-8?B?TEIrbyt5Tnp4anluSUFIZXVnMzNTVGFiOFN0SEo3cUhiKzRBZDZQWStuZE51?=
 =?utf-8?B?My9hTEd1ZGxUdkVnYWZNeFI5cXZGS3dNODFzUjlTZ2lTZkZvNXZENVdoRHZv?=
 =?utf-8?B?SnNubW80SWJ6RXQwbFhwVlpoZlYzc0t5OHk5UE9CYWJ5d2ovM1h6NXN6eU1t?=
 =?utf-8?B?UHdpSEJ1Q0ExUG9ZajNnR3l2WC9wQkNJQ0tjYnFKamJZcE0vdWlBenp2U25q?=
 =?utf-8?B?bWdZL1BKRDFPTDdjQW4rbjJCZzdyYkZxTmRnK2w0bzRlMnNGT0EzeVZNOWJj?=
 =?utf-8?B?dUlKcEV4WEVRWmRyeDYvY0NrNnhOQ2xCRDFrcWJzUng0elhsT1ZYS3hjYmVh?=
 =?utf-8?B?LzlUYzJETEZ2dG5xamJGQk9mLzBkSHFmd3hYZDJyV1lNZlZNZ3FsNEMxMXIy?=
 =?utf-8?B?UTB5TjdQMXVkNUFFR2xWTWNBN3B2d0FNbytLMlJnN01kQVFSUmpFdHd4dVB4?=
 =?utf-8?B?V0VIbit6SmF3MFpLVFNzeHZjSjdvQW1XeWVXQXMyRGpIeDlBSE43andjMG1S?=
 =?utf-8?B?WSsrdGM2djh3eFVMNXUyS3IwMVJQZkN6RURJVVdRclhzaCtSMVNuWk9Ea2l0?=
 =?utf-8?B?UG95TnpWdWZTWFkvelN6bWx6MUdNM00yWjhyUEZNd0sxOHphMG1FVDdpeXpn?=
 =?utf-8?B?NERwQk9ZYWY5MHh4c2hVUWlIdGdvdkFhTFVvcEFQV3hiSkU5bEhIMW40MSs2?=
 =?utf-8?B?N3pSNm5TM1lXZUJWcmpBTjBGQTFMYzhEdTRhb0tiUSt0Z29Od2Q4Y25UL0Z0?=
 =?utf-8?B?S2pBcVBnQS9udnhlNTU1anY5dkpaeGgwL3JtbWFJZmJoemplbHFKRTg2Z3px?=
 =?utf-8?B?RmFNbG53VTVETEJNM1dBanc5R3VaYjVuZnpmS3FzNDV1dm04dEI4MWx3ZjhP?=
 =?utf-8?B?VnlhQjhYSmlYOGJnWEZ3L1k0TUJJby9QaGhOOWNvbStqNHEwQ29Sak9Ndzk2?=
 =?utf-8?B?MW95WjltRFhZTDlEUTFOd3pZVG03MW9DRTJZUWQrZEUrdDRFRFhMLzZMNkc5?=
 =?utf-8?B?SjFpWFFxRFpLekMzMUI5cmJML2RyUzFlcTBhQ1haYVhER3hWVUNna25XcnVj?=
 =?utf-8?B?QjRIYitXdk1tS3M1SjJEa3E1aGMxN3lYNkt1S2h5OGxwZ01XQnhCSmtxcWVs?=
 =?utf-8?B?MFpMMU1oalNROXhwdWxGUTNMb2lLS0NCNFdtNFo3S25qQmpmVng3K3haQVFz?=
 =?utf-8?B?NUYvWGFHQ1dwa2w1NFRkeVA0Ykt3Z0JtUXJqNlFQcGtYb1hNSi82WXAwdFh3?=
 =?utf-8?B?MnZhTG5UMTZyV2liSGZMVFhtbzVSVHJiUDdHcCtJdG14cmxIQXNkS1hjdWIx?=
 =?utf-8?B?UnZtS2o2a3Q3SWZ2ZDhVSVNPSUtjaHI5Z3pzRGptMWdjRkJJT0FxQ053SjdY?=
 =?utf-8?B?V2ZDcTh2Vng4eHFnQkVrcU9zelZLTWdGYkNaNUpSdS9MR3lvQUNmbGNRUHdV?=
 =?utf-8?B?SkVFUTc5c3dOSWxKZW01OW9ZdFQyaVliTU9Ia1VObURWQ09tZzd2K1h3dW5X?=
 =?utf-8?B?dHdkdzBVOFprU1BuVSttWVFxT1IzRC9oZGE5WG5jQVM3SU13a2NoM2Z6MmNC?=
 =?utf-8?B?MmNEWmN4THJYRlc4bEF4cGV0N1MxazNRVGN3dUsvK3c2cG8xT3dyTVdJc25U?=
 =?utf-8?B?Z1gwb2xzVlYzQ0NxamEwQzI5YkM2ZzFndWMyOGFaU0UvR0djKzNzUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a29f5b38-deea-49e1-6406-08da1eb852c1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2022 08:17:03.9755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8H3Q3dCds12PDSBhUMmemBaltVG5o931Aci6IWIZkPEUWeuwfAnBHUg7fAXvwhtK7KhXHwAyKFESTt1SebPEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3796
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:23 +0200
Cc: alsa-devel@alsa-project.org, lucas.demarchi@intel.com, tiwai@suse.com,
 kai.vehmanen@linux.intel.com, matthew.auld@intel.com
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


On 4/15/2022 9:27 AM, Takashi Iwai wrote:
> On Thu, 14 Apr 2022 20:24:37 +0200,
> Nirmoy Das wrote:
>> Call snd_card_free_on_error() on probe error instead of
>> calling snd_card_free() which should handle devres call orders.
> This won't change any practical behavior, because HD-audio driver
> doesn't use snd_devm_card_new().

OK, I guess I am looking into some timing dependent issue because with the

patch I didn't see the UAF.


Thanks,

Nirmoy


>   snd_card_free() still gets called
> explicitly in the relevant code paths.
>
>> Issues: https://gitlab.freedesktop.org/drm/intel/-/issues/5701
> So it must be a different cause for this problem...
>
>
> thanks,
>
> Takashi
