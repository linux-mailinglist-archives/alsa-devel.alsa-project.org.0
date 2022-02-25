Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4B24C4B82
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 17:58:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF0DB1ED8;
	Fri, 25 Feb 2022 17:57:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF0DB1ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645808286;
	bh=TpG/XhIeMTh7JdEkzT2bPr3rShO+PveF+Wm9vc5Td/c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aA4EmRS5TLIsjC2NPutP10ndg6eGdvsKf0rLh+h5ufQlrpJTxJ5fEnlKMgQBtcIPO
	 xMBRb7ArvFGnIWWeguylj4Qq6WGg14vQQKSsk6ToVl2x4fyM7sT0+NS/jscoJHR9Rn
	 rhuNlSvOufCw4K+iGl0MfZTgb4F8T70Mx282FsYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FB85F80159;
	Fri, 25 Feb 2022 17:57:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDE6EF800E1; Fri, 25 Feb 2022 17:56:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAD26F800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 17:56:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAD26F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MpNM+c3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645808212; x=1677344212;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TpG/XhIeMTh7JdEkzT2bPr3rShO+PveF+Wm9vc5Td/c=;
 b=MpNM+c3CIg78LCppCjZuKS2VX9o+HgKJlgGkQbpEHdpDGv1xHiPjuuBT
 ESEzse6tqzO4utPR/3MxV4mAUuG3Lmt8RTUemjzJ03lByqdIo4aJi3Sn1
 Sk/2CkeJFyIr+siF8SHntUOTMEl7iiEdE4TNhkAFjVM0+rwMGM3/vBUFt
 pR/9PYg1qpC0g2G6y3GdkBxtruoPbryWejQoRQjbDBOfU5xSgzjG9M0pV
 ooW7ME5XkDORk9vpCn8qGDEzxdNRnqIPyTK3u9q3DwODVevD0EEqU9OuR
 BCzwb/hIXTN1WneMsSReWzUZj4QbpbJNtcYJAa21SRwfRXTisbpSJDy10 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252728310"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="252728310"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 08:56:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="533632654"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga007.jf.intel.com with ESMTP; 25 Feb 2022 08:56:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 08:56:47 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 08:56:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 08:56:47 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 08:56:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRBcYM6ZTTlmB3BhjCVfgPn3UczaJ31gD6n7417aOzea6kan1zMVGngOwtSPp4vFRsq75n4JDKMaG1+6Yh7JSn3MtbrKzfEszUl2CvkLvYNEy/3uFR0Gj+SkxYpyVS0BAroZzN8WpsbKK4eW5HdJPvPhdGWAIXWeZbHWPPATKLkI8mlqz66rtS70RZ2OpWWTEdyzRR5djhF8FlUr6bTxuKAEEeZCrulgVAD4YWxCa7iA/yn/ZJLQyt5s1NN6ME0d836d89zdJ9aqQG/ZXhXRqV4inyJT8sHeXtyLzks4wvyMRcihnn6jX1vkgMylp5RXDdDQRLIJx8yOsbYc4VgT6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtIARhXHci3S8xNzjunvQ8cCZcPu1DdSp9vru4x4YPQ=;
 b=oX67nQyiMEXH0zWM1GQYgS93WO+OngN+eHlbGnHSZqKaVOS/pY/Dpt0hUu+OGHAWugyRQFWmcHKWh/WfuwUUZbu2cfxMILcKutC3xLP6TZdmOzk4CW784fZGgCjzbdZkFGLgpAIkso7FkoVoDk/WHx52f5VeqWb/GJmGfw0g2PDz7eo7PE1eMT85Usw5M4ndoZt+ujLiVG+7apAg9DR3vnpXVU5umBslGarn7ZGVzgGlIiZlGENwGCMHN82pkDvbWLkn01YSCHTJ4fOFUZ5Ug+UbFSbF3OkYuaR9GAf0ghhL4hYiz47Q2kibbHYAB3XG5NQE2VyyLGx9pog7jVtkvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by PH0PR11MB5029.namprd11.prod.outlook.com
 (2603:10b6:510:30::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 16:56:40 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 16:56:40 +0000
Message-ID: <f1b0144e-94bd-deff-67e3-97bb310b0860@intel.com>
Date: Fri, 25 Feb 2022 17:56:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 03/17] ASoC: Intel: Introduce AVS driver
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-4-cezary.rojewski@intel.com>
 <bde92ad1-0eda-d70a-4435-4963aa617cb4@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <bde92ad1-0eda-d70a-4435-4963aa617cb4@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0075.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::8) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63b84c6d-14e8-4331-51a0-08d9f87fcaf3
X-MS-TrafficTypeDiagnostic: PH0PR11MB5029:EE_
X-Microsoft-Antispam-PRVS: <PH0PR11MB5029264133B27554BB1E370BE33E9@PH0PR11MB5029.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8k9umoQ98gsD1UbSqGsAXXFwbzuzDszC50l52NM6K0oGvE9HpsLXJWuwI6KQGMPxegtXadGr0Gmzrl7ikYRdqapLN8IABucc80/7EwBNY6YNJrVYnR/igEL1KE6Mdsxh33I+C3cmmcn2xUFxLBJ0xUWAr5YTSxnhmNQ5Q7joQCGaTy/7Zv24fEYoAT8DLuPy2awZsDfsvEaMOMSWeOU8EnZalh1zcSLEPlgkAzjbvHcHnWwZPwjTG16UdgKmHOfF4Xsb4rLLfgFMqQXkzKV51k25MuM4nTZ32pU+kk1VlQ8wcGjfw1DFvSz8FSxU8Zrqr1K/7xF/os+W+eSAk65dLwiaJGdvwCpwakqI89gfEpA+7iRTqfkL9bWlaVKBm4TYNE3lutGUiuJhVexWXLJr1+B79vN2j2CBSc7pz4y53ogTCI6zwsh4QkzhJWpHEFJ0AOBBGsbdc+ME44PBn+VM2iM9vRQzr//bHK/YX8KbTHJc1Zy1W2Tv4htBTlQsbc4fCPz5w4RrXI5f0S4tZaYkiKx4VxeSu1LJH23EUewIZzdzPGYV94eYuV/blnph4hu97k29GM6usZBEhkFBNs9x7rq4qCaFCkb7xFWc8YbEaN7+7pfxyqySHKCwApUGhL2WNUfVxDZLC2djK5Om9qFCqueH+M2iw9KWgmooA7gYh6qCP3/qhU9uV8ss7eQzr5/TL08C5rvuXwPVMzOtI/3Lzhx5PKOnyXnLxvj5vj2C0xY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(186003)(26005)(6666004)(38100700002)(31696002)(4326008)(53546011)(2616005)(66946007)(316002)(6512007)(66476007)(66556008)(8676002)(36756003)(2906002)(86362001)(82960400001)(8936002)(31686004)(5660300002)(508600001)(44832011)(7416002)(83380400001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEZyRGhKNWNVUWgxUkNQMmt5ckcxc25HNHo2aDVraGUxV2FXNldBaTRQNXpn?=
 =?utf-8?B?QzB3d2xzSWJ6eXM2WXdKY2dGcFBjeEJQMmpVdlhSVHp0c1VibFNNN2Z6dGln?=
 =?utf-8?B?WFJ0RmhwMXFLQUZtRFpOSy9zWlByOGtrdkdXRUZ4bkpVQ1Y2RHdmNHFJNFJO?=
 =?utf-8?B?cmVlY2dLUVA3SjVRd2VVNCtsbTdiQWJ1V0lGcm1qOW11Tmd5UVcxc1RsZ0ph?=
 =?utf-8?B?cHBEVmcremJIbHVXQlprTTA1RzVFN2cybXhYTHBhaXBoR0dLNytLeDNxWG5a?=
 =?utf-8?B?M3g0elhTNVUxMzZ2aTZRQVF4SUMzc2svcW1KWnVGV0JyQTE2cVR4Ym9pWGVt?=
 =?utf-8?B?a1BVMHVreE0yNVFUTGRrd0Y4MnB0TFU4SU1VRXd0OXpUOXcyektYUHh1NE9Q?=
 =?utf-8?B?dm9rK1FZWEgrcUhMZFd6WWtiRUorMHM0ZWNRVFM0S0tqVlpRQUNCR2ZNbjlU?=
 =?utf-8?B?WnhPUnFodjc4NmcwQlFIV0Vzd1kyeW1nMHZ0YVVpTUZORG1yR3FPQXRxMnRl?=
 =?utf-8?B?NDI2TjdVd3RsaGpZL3lTS1lMTDUzMXh3L01pZmttc3lvaVU0d29XSnlQNmpu?=
 =?utf-8?B?VzRTK2dRQ1JRMUxCejYwcFRLUU03M28yM2pSRFE4VmsvalhuVmtRNWNoTnlO?=
 =?utf-8?B?SmlKaUJQSnlQcGhSTEtSSlhvUXhKelNVN3FqVmVBaDdYNWhPL3JxMHRqU3FM?=
 =?utf-8?B?Y1orTEwvSFhQQmtLUmVxQ2ZYSmxrZlY1aHBZOTlRbUdkeDRZTnhqUXNoTzBF?=
 =?utf-8?B?WVFNOVN0ZEpuQlNBdkdhWE0xNHVORFgvSU0zUVFWRWdONEtRbFdyKzJhWElp?=
 =?utf-8?B?a2VDbzRVZGM1YzdVVU1UaEtJZnhEU29yN3hxVzUwR1FTa3NhdEMrTUh3NnJJ?=
 =?utf-8?B?V0J4a0x6RXN6NVZZVnhDK2VWT2d2MFFzSzhSK09SMzgycjY1M2t1TmFoTDBr?=
 =?utf-8?B?TFFmMWZQU01tQ2VUcTErdWlvQlFVelNUOG1NNVo0cjR6WmEzZHBTeUN0aVhv?=
 =?utf-8?B?SVBkcnBhL0NDUnlvV21GbFFyTU1OeSt3STFkQyt1YnhZWS9xNzgvcEpIT1lq?=
 =?utf-8?B?MXdVVjlwZDVtRVhoRm9pZnBxTkx5TVlOMXFXR0ZNSnV6MldBbFl4ZUY5Mkdl?=
 =?utf-8?B?cHUxc1FudVJvR3dPR0IwNHcwYnRIMkJMTERpeStjWnNDcGpObjNvcnNyTFlk?=
 =?utf-8?B?L3hzVlpQR0tud2tXMDh1ZmlWMm44eExhaUJoa1NNZWdQTUFVV3hQTlFTN0t5?=
 =?utf-8?B?aHdVanZ0NWtUc2lFK2JHbHRJdGpHQWVsaCtDTU1CVVJheGxYMm5ZOEFqMkp2?=
 =?utf-8?B?NDIyOWZzVkFiQTdTMGJ0VlNwRDBTZlIzeHc4dXQ0c3ZuSEtCRUhyUzFUVHlQ?=
 =?utf-8?B?T0RveHV0WFJmZHJEeVRyYmk2SmVYVHMxak9BRXVjNG5KZDlSZUIyRC8xekti?=
 =?utf-8?B?M2oraWxIVVJLZ0oxTTJWM3pQWU4yVXpKYTZqdjZsZFlqamtRTXJrZmFIVEhG?=
 =?utf-8?B?RnJLMXJEM01xY1hoUVNRVTNQSEN6NjZHY0pweHhKcUhkSmRoVmNZc2o5NkZJ?=
 =?utf-8?B?K2ZTUE5hcENPQjZQNXhTcUMxclRZTHhicVF5aVdObHQrV3VHT2lGdG9QbWhW?=
 =?utf-8?B?NTluV1JoTFlJdDVheFNCRnZkK2lwNDBZRHdGQWI3c2lENzdNRUdDQUZYWUM5?=
 =?utf-8?B?cThmd0tPMU5GMEhjcWsxNmFONDRKcUpHbU01eTJ4bmUxc0xvcnl3azFvL29L?=
 =?utf-8?B?enQ0RVQ3QnhHQXlERU1ua3JxQXEvWHpHZE83dDhoVGRpTndrRjk4R0tGaEJW?=
 =?utf-8?B?NlZvUWYxMU1OTmN6NjFBSklLeUhNUE5uQ3ZIYjdMOUUvbXBTbDVaVE43bHI5?=
 =?utf-8?B?LzFFcVNKYnVXMEhLODVCMkdDbjR0YmJocHhWZnpUQWk0dTk0Y0pVUzFXSGtt?=
 =?utf-8?B?Y2JXV2hmT2Y0WS8rdjE3aHZkeWZHMGpvdlhua2U5Z3RPbGttNndDVnRSdnR0?=
 =?utf-8?B?Uyt4bThuaUF4TFFxYkJrYyt2Smtxd1JHWTlqcXdwWHB4RTl6SXJNTGNvZ2pE?=
 =?utf-8?B?eGhwWkJZZTgvSWVBOWJ1d2NxS0R5ZEhtQ0E3eTUxZUQ1SVdkNGdjZElaRTVl?=
 =?utf-8?B?VDdkMEp2UTd2OUV1bERHV3ZtUVhQb0tNclE4RmQ3VkMySnFDZW5IbDJsUXhR?=
 =?utf-8?B?SklOTmJORUdWN3FkdFA2cEttQ2pHaTZGaFRTQWlZQ3V0UHN2Yit6NjQ0U3lW?=
 =?utf-8?B?UHdvYmVMUXNKQmFrc3VRMlo5eHd3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b84c6d-14e8-4331-51a0-08d9f87fcaf3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 16:56:40.2551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fu8AWwyUrWeQps5caWa3Jt+5uk4bPQj3P+nxSmWchHPxP5FmYBuJexFMs8ItrnuCfStlG9ghBOyfEWUL4qRp3+w7Mab2KOUrtsW7NlSHxjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5029
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

On 2022-02-25 12:55 AM, Pierre-Louis Bossart wrote:
>> +config SND_SOC_INTEL_AVS
>> +	tristate "Intel AVS driver"
>> +	depends on PCI && ACPI
>> +	depends on COMMON_CLK
>> +	depends on SND_SOC_INTEL_SKYLAKE_FAMILY=n
>> +	default n
> 
> default is already n


Ack.

>> +	select SND_SOC_ACPI
>> +	select SND_HDA_EXT_CORE
>> +	help
>> +	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
>> +	  capabilities. This includes Skylake, Kabylake, Amberlake and
>> +	  Apollolake. This option is mutually exclusive with SKYLAKE
>> +	  driver.
> 
> The feedback from the RFC was that this is not desirable if you want
> anyone to use this driver. The suggested solution was to use the
> intel_dspcfg layer with e.g. dsp_driver=4 for avs. That would allow
> distributions to build this solution for early adopters.


Indeed, this description needs an update!

>> +/* Platform specific descriptor */
>> +struct avs_spec {
>> +	const char *name;
>> +
>> +	const struct avs_dsp_ops *const dops;
> 
> dsp_ops would be clearer. 'd' could refer to just about anything.


Ack.

>> +	const u32 core_init_mask;	/* used during DSP boot */
>> +	const u64 attributes;		/* bitmask of AVS_PLATATTR_* */
>> +};
>> +
>> +struct avs_dev {
>> +	struct hda_bus base;
>> +	struct device *dev;
> 
> question: could you directly embed a struct device instead of a pointer,
> that would simplify the conversion through dev_get_drvdata below.
> 
> Unless this *dev is related to the PCI device, in which case you could
> add a comment.


Pointer 'dev' translates to PCI device. No problem adding a comment.

>> +
>> +	void __iomem *adsp_ba;
> 
> I would guess 'ba' is base address? this could be added with comments or
> kernel-doc


Ack.

>> +	const struct avs_spec *spec;
>> +};
>> +
>> +/* from hda_bus to avs_dev */
>> +#define hda_to_avs(hda) container_of(hda, struct avs_dev, base)
>> +/* from hdac_bus to avs_dev */
>> +#define hdac_to_avs(hdac) hda_to_avs(to_hda_bus(hdac))
>> +/* from device to avs_dev */
>> +#define to_avs_dev(dev) \
>> +({ \
>> +	struct hdac_bus *__bus = dev_get_drvdata(dev); \
>> +	hdac_to_avs(__bus); \
>> +})
>> +
>> +int avs_dsp_core_power(struct avs_dev *adev, u32 core_mask, bool active);
> 
> does this mean 'active' affects all bits in the core_mask? that doesn't
> seem very intuitive.


Can reword to 'power' to match its siblings.

>> +int avs_dsp_core_reset(struct avs_dev *adev, u32 core_mask, bool reset);
>> +int avs_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stall);
>> +int avs_dsp_core_enable(struct avs_dev *adev, u32 core_mask);
>> +int avs_dsp_core_disable(struct avs_dev *adev, u32 core_mask);
> 
> it's a bit inconsistent to have enable/disable but a boolean for other
> functions?


While there may be a grain of inconsistency, the order of operations 
does not change for power/reset/stall regardless if the operation is 
"positive" or "negative". In _enable() and _disable() case, the order 
does matter with _disable() being the reverse of its counterpart. As 
functions calling either of these already know which one to use, we can 
avoid an if-statement by providing two separate handlers.

>> +#include <linux/module.h>
>> +#include <sound/hdaudio_ext.h>
>> +#include "avs.h"
>> +#include "registers.h"
> 
> consider renaming as avs_registers.h?


This header is for internal use only and is found within directory 
already named 'avs'. "avs.h" header covers a wider range of types and 
that's why its name is generic. All others are specific and thus are not 
prefixed with "avs_".

>> +
>> +#define AVS_ADSPCS_INTERVAL_US		500
>> +#define AVS_ADSPCS_TIMEOUT_US		10000
> 
> these values don't match with anything that was previously used for
> Intel platforms, where the values could be different depending on
> generations.


Im most cases I'm relying on closed-source equivalents.

> bxt-sst.c:#define BXT_BASEFW_TIMEOUT    3000
> bxt-sst.c:#define BXT_ROM_INIT_TIMEOUT  70
> cnl-sst.c:#define CNL_INIT_TIMEOUT      300
> cnl-sst.c:#define CNL_BASEFW_TIMEOUT    3000
> skl-sst-cldma.h:#define SKL_WAIT_TIMEOUT                500     /* 500
> msec */
> skl-sst-dsp.h:#define BXT_INIT_TIMEOUT          300
> skl-sst-ipc.c:#define IPC_TIMEOUT_MSECS         3000
> skl-sst.c:#define SKL_BASEFW_TIMEOUT    300
> skl-sst.c:#define SKL_INIT_TIMEOUT      1000
> 
> please add a comment on how they were determined or align on hardware
> recommendations.


I'm unsure wheather the above is actually correct : )

e.g.: IPC timeout in skylake-drvier are inflated due to incorrect IPC 
protocol handling. Reply sent by firmware may be delayed due to 
unsoliciated notifications and the aforementioned driver did not take 
that into account extending IPC timeout to avoid the problems.

>> +int avs_dsp_core_power(struct avs_dev *adev, u32 core_mask, bool active)
>> +{
>> +	u32 value, mask, reg;
>> +	int ret;
>> +
>> +	mask = AVS_ADSPCS_SPA_MASK(core_mask);
>> +	value = active ? mask : 0;
>> +
>> +	snd_hdac_adsp_updatel(adev, AVS_ADSP_REG_ADSPCS, mask, value);
>> +
>> +	mask = AVS_ADSPCS_CPA_MASK(core_mask);
>> +	value = active ? mask : 0;
>> +
>> +	ret = snd_hdac_adsp_readl_poll(adev, AVS_ADSP_REG_ADSPCS,
>> +				       reg, (reg & mask) == value,
>> +				       AVS_ADSPCS_INTERVAL_US,
>> +				       AVS_ADSPCS_TIMEOUT_US);
>> +	if (ret)
>> +		dev_err(adev->dev, "core_mask %d %spower failed: %d\n",
>> +			core_mask, active ? "" : "un", ret);
> 
> unpower is an odd wording.


Ack.

>> +
>> +	return ret;
>> +}
>> +
>> +int avs_dsp_core_reset(struct avs_dev *adev, u32 core_mask, bool reset)
>> +{
>> +	u32 value, mask, reg;
>> +	int ret;
>> +
>> +	mask = AVS_ADSPCS_CRST_MASK(core_mask);
>> +	value = reset ? mask : 0;
>> +
>> +	snd_hdac_adsp_updatel(adev, AVS_ADSP_REG_ADSPCS, mask, value);
>> +
>> +	ret = snd_hdac_adsp_readl_poll(adev, AVS_ADSP_REG_ADSPCS,
>> +				       reg, (reg & mask) == value,
>> +				       AVS_ADSPCS_INTERVAL_US,
>> +				       AVS_ADSPCS_TIMEOUT_US);
>> +	if (ret)
>> +		dev_err(adev->dev, "core_mask %d %sreset failed: %d\n",
>> +			core_mask, reset ? "" : "un", ret);
> 
> unreset is even more odd. enter reset or exit reset.


Ack.

>> +
>> +	return ret;
>> +}
>> +
>> +int avs_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stall)
>> +{
>> +	u32 value, mask, reg;
>> +	int ret;
>> +
>> +	mask = AVS_ADSPCS_CSTALL_MASK(core_mask);
>> +	value = stall ? mask : 0;
>> +
>> +	snd_hdac_adsp_updatel(adev, AVS_ADSP_REG_ADSPCS, mask, value);
>> +
>> +	ret = snd_hdac_adsp_readl_poll(adev, AVS_ADSP_REG_ADSPCS,
>> +				       reg, (reg & mask) == value,
>> +				       AVS_ADSPCS_INTERVAL_US,
>> +				       AVS_ADSPCS_TIMEOUT_US);
>> +	if (ret)
>> +		dev_err(adev->dev, "core_mask %d %sstall failed: %d\n",
>> +			core_mask, stall ? "" : "un", ret);
> 
> that was probably a copy/paste of stall/unstall in the two cases
> above...this one works, the two above not so much.


Yeah, that's a result of copy/paste. Agree, the wording can be improved.

>> +
>> +	return ret;
>> +}
>> +
>> +int avs_dsp_core_enable(struct avs_dev *adev, u32 core_mask)
>> +{
>> +	int ret;
>> +
>> +	ret = avs_dsp_op(adev, power, core_mask, true);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = avs_dsp_op(adev, reset, core_mask, false);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return avs_dsp_op(adev, stall, core_mask, false);
>> +}
>> +
>> +int avs_dsp_core_disable(struct avs_dev *adev, u32 core_mask)
>> +{
>> +	/* Be permissive to allow for full DSP shutdown in disable path. */
> 
> that comment isn't very clear, what is permissive here?


There is no error checking below.

>> +	avs_dsp_op(adev, stall, core_mask, true);
>> +	avs_dsp_op(adev, reset, core_mask, true);
>> +
>> +	return avs_dsp_op(adev, power, core_mask, false);
>> +}
>> +
>> +MODULE_LICENSE("GPL v2");
> 
> "GPL"


Ack.
