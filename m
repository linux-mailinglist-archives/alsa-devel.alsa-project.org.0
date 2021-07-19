Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 691183CEB37
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jul 2021 21:01:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C96C1660;
	Mon, 19 Jul 2021 21:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C96C1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626721265;
	bh=iHKiqSmb4AaBsEbBL8sm7x95igxLbuccdh0u3lTKMN4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JuvHeVDez2MfKZbPg0hojY6cwsBkcGLSc9pTAXKmJcQ9lk6m2i8cum5XP1u4wEXg4
	 ErXdxu1btmjIT/2dZNR8ejESm6wpmdc/n01k19Sft6HQVJzMYMBugw8cqzJ3bX8TCt
	 rnS1QTuIOn6qdsFNwgn1q6YaDMVB+z/0Q59mLYfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ECE4F80256;
	Mon, 19 Jul 2021 20:59:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58BAAF80227; Mon, 19 Jul 2021 20:59:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 093EEF80169
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 20:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 093EEF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="B7BTikLm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jh8vbgavik8xuVJXumMr3ojzmvoLR2aNUbfZ5t+r183ZSBBxdWko1P+jvp86BE8kXIj4xvZYfHjcBmiQjNw0C8a/JigSgIjBVkNy9Sy/MvgQ3FzUB7Auu8Uvzl8TPLWakEBxOtB4rcR+HMb1xnGa2Cz0OLy4LhzBIuyW1H3rDGRSvqAvXKHwEMrV9dUrCQssGqhaJ2pr/WzbzeTGk2MEBEcujr0vH/jPOnoCPURLTfTBNRp59twab6W0j6x/Hl8s1j3Qnt95b0jYXXgN1g0riFa4l43lLO8U5DdCwK+80VNWYAylh4k7bchhxmNdasIGl3qmX16SCvjPuB5MShNVQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fVN7qvrhtgvTQt0F7G3JjGzeJUzQIENvcBLC4Cn57E=;
 b=jqVq7mKVVj+3xkt3XHzLOPehSU4SLj8UkjNFNlMrur36mlPgUOBuz/cPtftqntW0Fe9K5TwzSQqkGmmoMfVdBTOtzAtIOJJc3rAepyUPOmT8dvpjikJvHFZddIZWJuji//s6w6/Zb0a4nfkbS++X28hKELUvfNcGA2aAosF6v61GPwLzgNxDCMCOo4Qx+FBfG9n6xMSAGWU+R00Uk9+ACHWStwZa35s+Y9McfgeyIRg5Ki4boD+ADJwBGGeJE01ZyXEu9PshDeEzCLiQe4KNMvNAG4oMI/aan5upLO+n+8XzYc1A+KXhGCIac2tNBU9KpwmGmrSO4HViYRsNCJdqzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fVN7qvrhtgvTQt0F7G3JjGzeJUzQIENvcBLC4Cn57E=;
 b=B7BTikLmYs/8GpM7xmYPADd1pHJAfeSQq/XUCYifFtJkN8HrT1dSh4dk+3DtVPqJxjmof6V8SNM8wf07QjZcZUueAXTbfOxsRydf1cavOcXNzXA/EZhf0CuATSMu/GIones8MY95u+g54BSdVm4oORBS+hCASUwGKK2gCOtdP7M=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR1201MB0221.namprd12.prod.outlook.com
 (2603:10b6:301:56::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Mon, 19 Jul
 2021 18:59:20 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4331.033; Mon, 19 Jul
 2021 18:59:19 +0000
Subject: Re: [PATCH V3 04/12] ASoC: amd: create acp5x platform devices
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
References: <20210719165140.16143-1-vijendar.mukunda@amd.com>
 <20210719165140.16143-5-vijendar.mukunda@amd.com>
 <035b3dbe-bbe0-bf0b-3893-d176418658f7@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <a6c5600b-4d1b-2791-8b61-f241dcdbeb14@amd.com>
Date: Tue, 20 Jul 2021 00:47:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <035b3dbe-bbe0-bf0b-3893-d176418658f7@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR0101CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::22) To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.160] (49.206.46.65) by
 MAXPR0101CA0012.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 18:59:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f76776db-0c0e-47a9-04c3-08d94ae75063
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0221DCF9B69D34B62B268A6197E19@MWHPR1201MB0221.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3LBfh5c6+kXU6efHKjlnB1tIo54BU5iv4lVBRdUUWsuAF564lrUzolLQahURfDhGVV3uetXKO+wBja4L6/wuMeWi/AbwQ5dRJs8c9/51aMRwWTZkWz7Ca8d0QYN3v8lTTnC4cnqmYKT49/T58oSveGzPs+UiM5I73vFyG+6wxpsQPuSWSY6mnNldZloG4IJ/0aiJShOTYKLlYY4NBxeTfvJWHyvlmLcL3KQ2FpMYaptcr1kUvUx0oUILi8vKcKs00wGbLtjqfSWgGmT32A1VaiGceAhgI2gmANxq9rQQMUyUuWZGbotnswcOdmMXHNOge/qKTWpraAco9ikX8Kuf6Ux23LejXifPQ5MhNLsNYEtIwsOBuawL/XEjfat0vuc78+eSFOM6CobtOvQxmgSZVEe64j1y0jQ1LzML4U7kSxe+ih1o9lL0rAFmbHRiZfv3sStHb9sZGglwIDM4ERmuJTShbORLoqaWsgYiXJLSk/Dm/+A1FpcwoKm73c6JCzggCYwfhPIpaxlnjQVdKV3JtWg2TpcQuZMVQbKbXRvxf5DeVpgyqCDVDpPsXyyBXaaU0ecrpMQcPlYuO5X2Ri5kRxgfAY+U48so6DugjQJCSzjkzSULy+acHekNvpN4UVkYRtHGeh78urTd7CT/D907DxAUjqNJfedg2deyHk02tG+fXUu3HMDQktoM6oknpJEdYojjD+0pQ1Z8B98SKrlKIEEugJrc/FpIgFYpDTtFCsFtqbanQ0PVCpL3Hn5ehd/4oJ0uf6/5sg0udLzLA7ymoNnAy6vlmAr8rVeofvs66BE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(2906002)(316002)(956004)(31696002)(2616005)(6486002)(4326008)(16576012)(36756003)(66556008)(54906003)(55236004)(66946007)(26005)(66476007)(186003)(6666004)(8936002)(1006002)(8676002)(31686004)(86362001)(5660300002)(38100700002)(83380400001)(478600001)(53546011)(42413003)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXBmTVI4eHROc1hUNTJHWFpVTFkzYTE1dFFPSlRhQTRDTWwxRVNLKzdrVW1M?=
 =?utf-8?B?NENHZXFCa1VIWWNVUmNaK3RPbWxEWUFrczhaTzlsT3VGaE96a2lEdzNhV2xw?=
 =?utf-8?B?OVpCalg1M1F4L1FGTGZscCtTc3FNVlhGeW9UVkpwWjdMbWlmVVZ3S251Q3Ro?=
 =?utf-8?B?b1NxZFEyR1VjdTNQeXd6b1kxb2xPQkNVbmtoc2dDc3lzUWc1UHZNMFA4TUsv?=
 =?utf-8?B?YWpCdTVtT0R6bnlqZktFTFBySytKeG8rNW41Tmo5RGdRamtZdEgrbG9YZEdt?=
 =?utf-8?B?YSs4TkF6MWZUd3NwVEtpZzJ3YWkyYS9NdTVGRnV5d0VGWUxBcjdxREFiRDlG?=
 =?utf-8?B?K1k2Wk1kODM3bHo5V1pEUU9yd05uSWtrS0l2b0l5RmtVcnVKdFE1b1pSeFVP?=
 =?utf-8?B?T3d1dFNJQmtEbG5FcVlCN0s0blVXeVJ0MHpxczVVN3l1RFlnSXl2T3dPRFVx?=
 =?utf-8?B?bTZxQWN5K2xlVmtKbmtZcEdNOExYbkNVejIvMC9GbURqNkgwOGFqQ05HL1JV?=
 =?utf-8?B?ZURzTno0SGxYeG9SaEsvVlVjbXBPL2hMWnlkNktHcU12MVV1aHpMb3VJMjdo?=
 =?utf-8?B?ekprNHpSWWdqbisycGx3NUpMalNzNXVpWEtqaWExdmVjbytlYzJHU3JHTElv?=
 =?utf-8?B?MjZHNzMyOTlZbldZSnd6ejRnYlp6MWNqSmdmR2NaRVE5QWI4MzN5eGs4VGNZ?=
 =?utf-8?B?Nk5EUFRYRFFUMlJMbEVpWUd3VHR2M2dPYmFBVWZpNEtZVE5PV0tmSkllSGxZ?=
 =?utf-8?B?UmYwcGtQYTA1OW04Ykd3aDhLWkZHR014bGVHUjJZSGoxbUs1OXZzQ0hRNFdG?=
 =?utf-8?B?RmJJNzIxejVMRkZFeXlLeCswaWVkdUJTMUdvN2sxSDVwZUVDUHFuWTNSdXF6?=
 =?utf-8?B?cTAvdFRhT1I5amVFQ1hKaWRoWTJrTFZoUVB2NHlrblFhSEQ0TzJmTVZBaE9S?=
 =?utf-8?B?OERBK0RiUDQvdDNWVHdLbW5uUk9PQzlLeTVjYkkwc1ZvUWhsWDV1RmFxNUxB?=
 =?utf-8?B?RVZ2WUhsS0pPZmNYdGlKWUE4Ym40UFRUYXlscEx0SXdqWTRQMVdJWGdWbXJV?=
 =?utf-8?B?eitvK1ZMYnBEV1h0T0g2cGlBczFJSnhkMWpNcU9vV1pudU8wK09lM28reXhY?=
 =?utf-8?B?T3dubEkxZEdOVTJyRjkwUWNwZlRKMGNyYUhwWENQNkFtdkYwU0ducWdPeng4?=
 =?utf-8?B?QmVWRDMrRnloV1ZySVkrVkNhWXE1QWIrbnRDN0NHTlVkU0dZQWpSSW5maFV6?=
 =?utf-8?B?Y1pGSzhGQSs0Z3N5M2sxSUptbGl2Y2hSTThrbStjZ2k3Z2FWdXdqNE9IQU9J?=
 =?utf-8?B?RTFES1g3ZEhNNXBjSkhJQXA1eERMZmZnMERjWTR2Y1JuQ3JQRS8rV2NTbFpY?=
 =?utf-8?B?TzV4M09YWktReXlRbVcxaTZBRkNUWjdzQlo1T1IzUU5CemJWcUFiNjlxM3E2?=
 =?utf-8?B?U1VQMTRXOGpLVHlnK3VkSmJXaEhIek9Wd29VR0g4Nnlpa1ZJVW9tSmI3eEw1?=
 =?utf-8?B?aFNaZmI2dSt6bml4RHJLVkpPNWFFeEpSUE45SHpoa2k2dnVEQzA4eWhrUVVv?=
 =?utf-8?B?T3c1cDQ3UkVySmVBa3lwanVLRkljbmVpWHFtODN3akJJNmtVaVlHbHlFRUZv?=
 =?utf-8?B?Rk84OFhZanNCRC9MSk4vQndZZXdyNVF5K0tQZk9wZHR0YjJubHY2eFR4NTkw?=
 =?utf-8?B?VlpSSjVtMFcrZzJBZDFHWWdUd2MwaFZxQ1pVTmxPY24raHpsOTd0ekwrYThD?=
 =?utf-8?Q?XjA4UmSuoiHfuTUahoEES3DHnvlcd4Wb+udOlQQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f76776db-0c0e-47a9-04c3-08d94ae75063
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 18:59:19.7882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UekjKRRtUn6alzULIFNRmg5R9xP7eDcnHaYxXyoFQxpN0/hJN8MioUShN91/+MQ05OdahkmIxDOovo2we8HZXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0221
Cc: Sunil-kumar.Dommati@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Alexander.Deucher@amd.com, krisman@collabora.com
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

On 7/19/21 11:37 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 7/19/21 11:51 AM, Vijendar Mukunda wrote:
>> ACP5.x IP has multiple I2S controllers and DMA controller.
>> Create platform devices for I2S HS controller instance, I2S SP controller
>> instance and DMA contrller.
> 
> typo: controller
Will fix it.
> 
>> Pass PCI resources like MMIO, irq to these platform devices.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>  sound/soc/amd/vangogh/acp5x.h     | 10 ++++
>>  sound/soc/amd/vangogh/pci-acp5x.c | 95 ++++++++++++++++++++++++++++++-
>>  2 files changed, 102 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
>> index 708586109315..bbf29fd2b12f 100644
>> --- a/sound/soc/amd/vangogh/acp5x.h
>> +++ b/sound/soc/amd/vangogh/acp5x.h
>> @@ -22,6 +22,16 @@
>>  #define ACP_ERR_INTR_MASK	0x20000000
>>  #define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
>>  
>> +#define ACP5x_DEVS 0x03
> 
> 3?
> 
Will create 3 platform devices for DMA device and two
I2S controllers.

>> +#define	ACP5x_REG_START	0x1240000
>> +#define	ACP5x_REG_END	0x1250200
>> +#define ACP5x_I2STDM_REG_START	0x1242400
>> +#define ACP5x_I2STDM_REG_END	0x1242410
>> +#define ACP5x_HS_TDM_REG_START	0x1242814
>> +#define ACP5x_HS_TDM_REG_END	0x1242824
>> +#define I2S_MODE 0x00
>> +#define ACP5x_I2S_MODE 0x00
>> +
>>  /* common header file uses exact offset rather than relative
>>   * offset which requires substraction logic from base_addr
> 
> typo: subtraction
Will fix it
> 
>>   * for accessing ACP5x MMIO space registers
>> diff --git a/sound/soc/amd/vangogh/pci-acp5x.c b/sound/soc/amd/vangogh/pci-acp5x.c
>> index 523b962fe35e..3cc15a15b745 100644
>> --- a/sound/soc/amd/vangogh/pci-acp5x.c
>> +++ b/sound/soc/amd/vangogh/pci-acp5x.c
>> @@ -8,11 +8,16 @@
>>  #include <linux/module.h>
>>  #include <linux/io.h>
>>  #include <linux/delay.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/interrupt.h>
>>  
>>  #include "acp5x.h"
>>  
>>  struct acp5x_dev_data {
>>  	void __iomem *acp5x_base;
>> +	bool acp5x_audio_mode;
>> +	struct resource *res;
>> +	struct platform_device *pdev[3];
> 
> pdev[ACP5x_DEVS] ?
Will update it.
> 
>>  };
>>  
>>  static int acp5x_power_on(void __iomem *acp5x_base)
>> @@ -114,9 +119,12 @@ static int snd_acp5x_probe(struct pci_dev *pci,
>>  			   const struct pci_device_id *pci_id)
>>  {
>>  	struct acp5x_dev_data *adata;
>> -	int ret;
>> -	u32 addr;
>> +	struct platform_device_info pdevinfo[3];
>> +	unsigned int irqflags;
>> +	int ret, i;
>> +	u32 addr, val;
>>  
>> +	irqflags = IRQF_SHARED;
>>  	if (pci->revision != 0x50)
>>  		return -ENODEV;
>>  
>> @@ -150,6 +158,83 @@ static int snd_acp5x_probe(struct pci_dev *pci,
>>  	if (ret)
>>  		goto release_regions;
>>  
>> +	val = acp_readl(adata->acp5x_base + ACP_PIN_CONFIG);
>> +	switch (val) {
>> +	case I2S_MODE:
>> +		adata->res = devm_kzalloc(&pci->dev,
>> +					  sizeof(struct resource) * 4,
> 
> what is this 4 value?
We are creating 4 resources using MFD framework.
Will use macro instead of hard-coded value.
> 
>> +					  GFP_KERNEL);
>> +		if (!adata->res) {
>> +			ret = -ENOMEM;
>> +			goto de_init;
>> +		}
>> +
>> +		adata->res[0].name = "acp5x_i2s_iomem";
>> +		adata->res[0].flags = IORESOURCE_MEM;
>> +		adata->res[0].start = addr;
>> +		adata->res[0].end = addr + (ACP5x_REG_END - ACP5x_REG_START);
>> +
>> +		adata->res[1].name = "acp5x_i2s_sp";
>> +		adata->res[1].flags = IORESOURCE_MEM;
>> +		adata->res[1].start = addr + ACP5x_I2STDM_REG_START;
>> +		adata->res[1].end = addr + ACP5x_I2STDM_REG_END;
>> +
>> +		adata->res[2].name = "acp5x_i2s_hs";
>> +		adata->res[2].flags = IORESOURCE_MEM;
>> +		adata->res[2].start = addr + ACP5x_HS_TDM_REG_START;
>> +		adata->res[2].end = addr + ACP5x_HS_TDM_REG_END;
>> +
>> +		adata->res[3].name = "acp5x_i2s_irq";
>> +		adata->res[3].flags = IORESOURCE_IRQ;
>> +		adata->res[3].start = pci->irq;
>> +		adata->res[3].end = adata->res[3].start;
>> +
>> +		adata->acp5x_audio_mode = ACP5x_I2S_MODE;
>> +
>> +		memset(&pdevinfo, 0, sizeof(pdevinfo));
>> +		pdevinfo[0].name = "acp5x_i2s_dma";
>> +		pdevinfo[0].id = 0;
>> +		pdevinfo[0].parent = &pci->dev;
>> +		pdevinfo[0].num_res = 4;
>> +		pdevinfo[0].res = &adata->res[0];
>> +		pdevinfo[0].data = &irqflags;
>> +		pdevinfo[0].size_data = sizeof(irqflags);
>> +
>> +		pdevinfo[1].name = "acp5x_i2s_playcap";
>> +		pdevinfo[1].id = 0;
>> +		pdevinfo[1].parent = &pci->dev;
>> +		pdevinfo[1].num_res = 1;
>> +		pdevinfo[1].res = &adata->res[1];
>> +
>> +		pdevinfo[2].name = "acp5x_i2s_playcap";
>> +		pdevinfo[2].id = 1;
>> +		pdevinfo[2].parent = &pci->dev;
>> +		pdevinfo[2].num_res = 1;
>> +		pdevinfo[2].res = &adata->res[2];
>> +
>> +		for (i = 0; i < ACP5x_DEVS; i++) {
>> +			adata->pdev[i] =
>> +				platform_device_register_full(&pdevinfo[i]);
>> +			if (IS_ERR(adata->pdev[i])) {
>> +				dev_err(&pci->dev, "cannot register %s device\n",
>> +					pdevinfo[i].name);
>> +				ret = PTR_ERR(adata->pdev[i]);
>> +				goto unregister_devs;
>> +			}
>> +		}
>> +		break;
>> +	default:
>> +		dev_info(&pci->dev, "ACP audio mode : %d\n", val);
>> +	}
>> +	return 0;
>> +
>> +unregister_devs:
>> +	if (val == I2S_MODE)
> 
> nit-pick: you can't reach this point outside of the I2S_MODE, so this test is not useful
> 
> 
>> +		for (i = 0; i < ACP5x_DEVS; i++)
>> +			platform_device_unregister(adata->pdev[i]);
> 
> only unregister what you registered?

Yes, We are unregistering devices which got registered.
We can refactor the code by moving code to switch case it self rather
than handling by declaring the label for it.

Will fix it and post the new version.

> 
> for (--i; i > 0; i--)
> 
>> +de_init:
>> +	if (acp5x_deinit(adata->acp5x_base))
>> +		dev_err(&pci->dev, "ACP de-init failed\n");
>>  release_regions:
>>  	pci_release_regions(pci);
>>  disable_pci:
>> @@ -161,9 +246,13 @@ static int snd_acp5x_probe(struct pci_dev *pci,
>>  static void snd_acp5x_remove(struct pci_dev *pci)
>>  {
>>  	struct acp5x_dev_data *adata;
>> -	int ret;
>> +	int i, ret;
>>  
>>  	adata = pci_get_drvdata(pci);
>> +	if (adata->acp5x_audio_mode == ACP5x_I2S_MODE) {
>> +		for (i = 0; i < ACP5x_DEVS; i++)
>> +			platform_device_unregister(adata->pdev[i]);
>> +	}
>>  	ret = acp5x_deinit(adata->acp5x_base);
>>  	if (ret)
>>  		dev_err(&pci->dev, "ACP de-init failed\n");
>>

