Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8BF4B9B3E
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 09:38:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A342518B5;
	Thu, 17 Feb 2022 09:37:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A342518B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645087114;
	bh=o0vbaeLcMuPak4k1PezCxiqfdyjc3om6C15lqZTYKjo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fg2REctuWLojhYB6IuLkrc7H2Fmzj1PGYBEAA/3U3suKvK7JC3ZMYIKpnadprp/Qa
	 j2MJVwkm11UVegKpOgUGRlH2/GZc/P01V5kPqaOUoUDZwbNaziLskF2QKoAzBPwjYp
	 7KyG37vOMmtcbqWsTq8EIO2uUSjkbUnY1eT7RXAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19FF1F80246;
	Thu, 17 Feb 2022 09:37:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6452DF80240; Thu, 17 Feb 2022 09:37:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::612])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAF66F80118
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 09:37:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAF66F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="ARtNoKX3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHJRx20aXXME5HZb61Uqy9i3SQNAThcEgzgPDkm+X6ijCTUSyy3vCaJTu0sbAc53Sz7h5PmNnzxSkVXE09Q7sIUPfhZgh0ctg9U1Vs1gMWDhS+Y8uNxoRAuA4TqCrZrY8WYlWoNdbfDRCajx6NH5RKVRQtn4E0L63IS6M4Rk+V+Y6koFDOACWgtzpKGCJlEqhMqubRHlUV6VME/b3SouxD12IQoio0PbRctQ9cuUnEHhds1L5dF6zCBtMZwaKU4rjAbH5SKnguvB6bqM10fZLsDwRVFuLfa5WWnw4hM5cOypxXk3qI+2r6EYNk8iRs0gQwq+r6wtEv6HrYsZPqW0Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raBT96nBBOzeH65kZzfTsl6uxtmh5aDYClS9Rbd1HGo=;
 b=QCTCV5XOdCb4tyBfsU5TBU9hiY7hTvrEj4GetJQmFy9uMyUSO7n9T9rcyTyNYStlcR3DXga8hzNSCcb2AK+hRWWHcKZYaomITRmVEWPJCaotALFY07lK87wI7M0OSa9PjvyurCU0OwHgsjSt1YFaHG1rQSceGNf1Y0WfwrOUxeA6Rq/mh5b8eGc4uifoAMEJhsKdAIGt56qd1DXefVIL8CV/ObxcG4hdjukNr4bWEeKwm3BUc8/FbA2WoSOKVYydKYoOHbvBkmG2tOa+bcJS6b8Ujg0NlZaI6qLVWPjQjWbKrr+0izq/nbctqHvuWgZ6aBrcM6xB31T9picAZd1f4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raBT96nBBOzeH65kZzfTsl6uxtmh5aDYClS9Rbd1HGo=;
 b=ARtNoKX3Rx14M/0IrADfFpPUXaDtWmySWjb+23Le5lOLLKRXvM5Z4IlfZWyynHLtzPEwybkQO4GA1xnmoruVXIrRO+m1zH5FHXGeTYFrz/swsRPPg3XeNUHLWT0Y3WnqJIAxEFFbU+TJsvxQLYfCu4bVqi5SLNQGhBX26eJjYFhW21QeZDVG/YGv73ehH8uV9p8DcProw1r998ZnSWD71Z0abCly80e7cJlfcLYCYMJmtithnEGg09bmxHwJanNEPHXsRb3bsghgMJmPbb6JmUpIOBppTBls0bznx3txI5JoDmhpgAxOLo7ncVt5l8EcgZd3fPXjWZfZ+cy9F4d6QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY4PR12MB1576.namprd12.prod.outlook.com (2603:10b6:910:10::9)
 by MWHPR12MB1629.namprd12.prod.outlook.com (2603:10b6:301:3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 08:37:12 +0000
Received: from CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::851:858e:bc7d:fb3a]) by CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::851:858e:bc7d:fb3a%12]) with mapi id 15.20.4975.019; Thu, 17 Feb 2022
 08:37:12 +0000
Message-ID: <69ce4562-5b68-93e5-e291-99d7a75ed76f@nvidia.com>
Date: Thu, 17 Feb 2022 14:07:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 2/5] dt-bindings: Add Tegra234 APE support
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
References: <1643373476-8538-1-git-send-email-spujar@nvidia.com>
 <1643373476-8538-3-git-send-email-spujar@nvidia.com> <Yg36oUdUiB/H+Ngf@orome>
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <Yg36oUdUiB/H+Ngf@orome>
X-ClientProxiedBy: MA1PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::22) To CY4PR12MB1576.namprd12.prod.outlook.com
 (2603:10b6:910:10::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9223deba-09e2-4754-3e1d-08d9f1f0b19f
X-MS-TrafficTypeDiagnostic: MWHPR12MB1629:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1629853B319126ECD0305E88A7369@MWHPR12MB1629.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0zJUoqEhjAy9rwjc8Au1R+BzYnriB2YpJowHffyMt6JshSHMEweb4+R0r/YHQj1qRru5MBDaRg8MT2jjhLak6Cn5bOYIZglbhOlCmLRgdHMNCj96nWs9e9RQW4ETqyG6C1DpjmQH2upgYbT6+Fkh6TtrsTZvim4ISMS5LXHh+MZbIpXFXr66pxeZKdpPCowLJ+/o1oMFAD76a6uyZH0CdAedQmgBv7P24h0KcEUZFcSJZHQIGubeYxOWs88lbWx0Zu5Im6KopAGtIRg1eiOljbKwnJftVcgnCJUAYnc/iEdpA4MNo26Moa/6CE6wWJ7m5sVF9peOTN9/SeSJHlQnD8sX3/6RDEfdKMLdKzELRBoq3IoAlvFzM0V9ytGhQueOJnrkwcdOpowvzcth27809k54BhebMiGljSAfaqIRJpO0iUFuouj+JP9Hh9u2owbdOLSPXWW09eOzRzPe5alL6eQy7i41WeQkugkm9b3wzqLC6fG2Z1YmPXKKlUK9wqBbErvU3jtr+aKPK1z2Trksutvds2qyQz+qBNC3Ki8LVJP5FIrpWRF8PDmuGHBpoNjcNdyiBbwYAQxoAolRAWk3WqMt7R1s3zcE0cEE9qB42HbYyDQIIB7yDwcWKFQR4Bj5ZchVlAYrwd+suzrPhdDOdltYAAlnmhDvyApXtIezBDyYVS/iJY2Kq78XM1Ujxhk0zDdb5Su8B5sZZcHDPQCIy3rdnLRIcMD2WG3TdeEpQOeeqNDV1cLR+YBOF+6ryek5TOBroA1cWByZll4pIM5CUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1576.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33964004)(6512007)(52116002)(7416002)(6666004)(66946007)(66556008)(66476007)(2616005)(5660300002)(38350700002)(6506007)(8936002)(6486002)(26005)(53546011)(186003)(508600001)(31696002)(86362001)(4326008)(8676002)(36756003)(31686004)(38100700002)(83380400001)(316002)(2906002)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0ttdWdvK0JHbzhFS0JxeWFGRUNHYitCRTVFYWM5TVJ3Y1dPSElHQzBOUWlp?=
 =?utf-8?B?ZnV6ZHdLRWJuU2lmeHpXY1NlZ25WaUNMWnNoZkl1STVBL2lVaVNvTUxhcHo5?=
 =?utf-8?B?RUF2RU9SZzhmcHRYSkhZc24xS2x2T2NlaTlpNERBdHdtUDk5aGgwMm9VOWJN?=
 =?utf-8?B?ZUJBT2ZSUnJNT3lTUVZCbFVpd1RwaFU0VVlmYVA4QktXUG8zN0tBbHJWTnlN?=
 =?utf-8?B?WjJraTRRdzNWc2w4NnRFbktKaHF1ejByMThubXVKY0t6bVlGbVZDK2hvR3k5?=
 =?utf-8?B?SzF0UlAvemcwL0FlSVBMYTIrWmxiajNJVTA4a0hpYlBPdEtvZ2NtWGd5VE1Q?=
 =?utf-8?B?YzJGeGV0Ym44MzRnSU5hWGJqNDVSakRUY0t3UHNkaElIMlBhNFZRSU40a1BR?=
 =?utf-8?B?N1cvU1VOZVdIYTUveExJd0xjYlpRSW9MUzloN0JSUk4zangzWDkrUXpGVGxR?=
 =?utf-8?B?NHJ6cWh0M3YrUnBSUkVMU2h6WXppRUxYK1M4dGdYb21mL3NSdHoyeUtjVitY?=
 =?utf-8?B?Qi9KWVRkOHpBemZSTXhuNmV0eGdISEp2OXFVODVhdXE0Rm1wYXU3UGw5a0xr?=
 =?utf-8?B?QWpnRXBTbXVxK1V2TnhWcmo0bWU5S1BTanJVVjF5bkh5K1dBaW1XUXZFdUJ6?=
 =?utf-8?B?blBIMWRXdThOYk9lM2FBaEZZVDYwamVRSEt3NHExKzh0NzVUWUhnWE5MV09Y?=
 =?utf-8?B?c1Y0Zk41VkdVNE93T0IxMWVsZEhROGhqdVljdjJTQnVpcVBmQWlPclVwR1hD?=
 =?utf-8?B?V1pKYkN3UnM5TUpxNDQvQTc3NnpINnlDajVlYUtlUjF3KzlxU3NZK1JQL0Yw?=
 =?utf-8?B?ZXpYRjVvd0s4MHRxWVBxL2tQeXZQQ1htMTJ4YzBoYi9uWlZhMlArekdQVlVF?=
 =?utf-8?B?UVdLMUxiNjZmeW45L09aZklQcUZZcFJwSnJqZTUwS2tYUzFQRGh6RG02Umdv?=
 =?utf-8?B?eHFNUlNmNEFhbnRtWVRTQkE5dFlOYXk3SG9WT2EzQ0RFd0FJVlFzZ1JTVlJX?=
 =?utf-8?B?NE5HdjJqS01pM3poV0pQYjFsSm9HanpFR1N4NXRQUXZDUVFyTU1rc2N0VitB?=
 =?utf-8?B?R3VZNXFFRWlsdytKM2pKc1RQc2NlK29SdFQzK09nUWdVeHQrK2Y5Y3A0Tnhm?=
 =?utf-8?B?ZG94U0NZa2pZUEVET2JpMlYvSFJScFgzL0J2UDMwOFZUaDRiMGx3NW90NnFF?=
 =?utf-8?B?QzJUdWtKaktLdE9FbytpOFNBSU0zOW8rQXBVZFVYOCtRbTQyUmRzeS9rVGlW?=
 =?utf-8?B?UzNCam5HampRZkxSK2lTUHZ3VU51OWlncmpxUnAvU3M5Z1hpRWtubkFOanFp?=
 =?utf-8?B?bTF2c0ZJdm42RkFPZG5xdDE4OCtETE9qbDUwOGZUcitmY2JpK0VxWFcxTGt2?=
 =?utf-8?B?RmlkUjZWZTV0d2xKa1lKM3BrMkZDcC9iaUsvNWVWZVRXSkJFODJUbHFGQnd4?=
 =?utf-8?B?OVc0U2NMNm5GMnJGWW0vTTdwbnl4M3phRU1ud3pKYzJzUFlaaHE0UjlRVFVW?=
 =?utf-8?B?NXV5NFZoWGcvZ0JuRFBhTFIxdmpNUm9EbmVnU1BBWmxGQlRtUnVkejZHWGVo?=
 =?utf-8?B?ay9pRWdScm9keVp0S1lWZ2VEMlVHY2d0M2xTaWMxRFJabTFhd0tjYVVPd3h5?=
 =?utf-8?B?VHZLdHRXNzVEVCtZWGZoekZoenlyUms3enpuYzd3VnhlMEdjZ0xwbFk1Q2NN?=
 =?utf-8?B?ZW4vOC83eGZ6UUxPbWoySm1sVG1rOTdzZlRPTlJIOG1yRmhkR1E4QUgzUGli?=
 =?utf-8?B?aGVCdUxFWkFIcTZpU1FCS1hadWJablhNdlpIcGRubG45dU80djhhSHp6ekRG?=
 =?utf-8?B?VUl4NG1zL0tVRW1FRmM2WjNPQy9ubEJsVmp1SlhoSnVWZmVYaFpjNWlnaWkr?=
 =?utf-8?B?UTBuTFFkQUtlOUFoUGQ5WFExMWlRYTF1YjBSTXVseTNzcGJwQ3RQQTAwOEFp?=
 =?utf-8?B?ZGh2SVZ2akZzMmtZTnBmT2xKVFRtSUlOeHBoblllWUlXdG1PVnBBcjRtakp2?=
 =?utf-8?B?OWx1enN4SXhnbWx6S2ErSENDekhaLy9kM2xoQ1NWUVZSanViYVN6cmR1VWNT?=
 =?utf-8?B?SjhpRWE3TDBMMDYxMHdtMWtMK1c5eS9Kb0w1QUw4R1FSVzhKWmtkQU9rdHBD?=
 =?utf-8?B?Zk9LWUNJUHV1VUtEZWNiTms3ZzVuVUxmdUlkZzRTYnhPQXo1QWxJanR2YUdn?=
 =?utf-8?Q?E1x/54JdhJvN5y4yBkS1AUw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9223deba-09e2-4754-3e1d-08d9f1f0b19f
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1576.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 08:37:12.8302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8hB/GHVr13ho+IEcWgT2rxesnv4QHr6ZFAqZMySe/mCBc+B9XDOQSAnLtrqQP9QFqGshzP0qwnOLm0s+srFRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1629
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, linux-tegra@vger.kernel.org,
 jonathanh@nvidia.com, mkumard@nvidia.com
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


On 17-02-2022 13:04, Thierry Reding wrote:
> On Fri, Jan 28, 2022 at 06:07:53PM +0530, Sameer Pujar wrote:
>> Add clocks, power-domain and memory bindings to support APE subsystem
>> on Tegra234.
>>
>> Signed-off-by: Sameer Pujar<spujar@nvidia.com>
>> ---
>>   include/dt-bindings/clock/tegra234-clock.h     | 74 +++++++++++++++++++++++++-
>>   include/dt-bindings/memory/tegra234-mc.h       |  7 +++
>>   include/dt-bindings/power/tegra234-powergate.h |  9 ++++
>>   3 files changed, 89 insertions(+), 1 deletion(-)
>>   create mode 100644 include/dt-bindings/power/tegra234-powergate.h
> [...]
>> diff --git a/include/dt-bindings/memory/tegra234-mc.h b/include/dt-bindings/memory/tegra234-mc.h
>> index 2662f70..444e62d 100644
>> --- a/include/dt-bindings/memory/tegra234-mc.h
>> +++ b/include/dt-bindings/memory/tegra234-mc.h
>> @@ -1,4 +1,5 @@
>>   /* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
>> +/* Copyright (c) 2018-2022, NVIDIA CORPORATION. All rights reserved. */
>>   
>>   #ifndef DT_BINDINGS_MEMORY_TEGRA234_MC_H
>>   #define DT_BINDINGS_MEMORY_TEGRA234_MC_H
>> @@ -7,6 +8,8 @@
>>   #define TEGRA234_SID_INVALID		0x00
>>   #define TEGRA234_SID_PASSTHROUGH	0x7f
>>   
>> +/* NISO0 stream IDs */
>> +#define TEGRA234_SID_APE	0x02
>>   
>>   /* NISO1 stream IDs */
>>   #define TEGRA234_SID_SDMMC4	0x02
>> @@ -20,6 +23,10 @@
>>   #define TEGRA234_MEMORY_CLIENT_SDMMCRAB 0x63
>>   /* sdmmcd memory write client */
>>   #define TEGRA234_MEMORY_CLIENT_SDMMCWAB 0x67
>> +/* Audio Processing (APE) engine read clients */
>> +#define TEGRA234_MEMORY_CLIENT_APER 0x7a
>> +/* Audio Processing (APE) engine write clients */
>> +#define TEGRA234_MEMORY_CLIENT_APEW 0x7b
>>   /* BPMP read client */
>>   #define TEGRA234_MEMORY_CLIENT_BPMPR 0x93
>>   /* BPMP write client */
> This usually needs to be accompanied by a corresponding addition to the
> memory controller driver. Unfortunately it seems like the changes
> targetted at v5.17-rc1 never made it upstream, so I've queued them up
> again for v5.18-rc1. They should show up in today's linux-next. When
> they do, can you please follow up with a patch to the memory controller
> driver that adds the various registers for these clients?

OK, I will follow up.
