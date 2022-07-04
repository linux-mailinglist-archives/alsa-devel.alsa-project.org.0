Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4D0565C39
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 18:35:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33118171E;
	Mon,  4 Jul 2022 18:35:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33118171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656952550;
	bh=45fHTqMFR+7FglIxoyJtA/YesDEdVbkLBLFs82EunxI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LI9ZlLMcKW6iF8Hp1rgYZLpwauCUW1BzwnPcBGhQDQeAtNMAuNLDvHqNGnNKpQLgD
	 CD47AK1t83Hv2yiuVYuL5grAue2R7yq6LIQPPXcuQQ6sEsr4i/dW7RNTjQtiL8FnfH
	 dJ5Jzzx9lpedvOUkqhVY+GMnT8cEOxNoUH3BpUUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D47F80165;
	Mon,  4 Jul 2022 18:34:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3DB2F8014E; Mon,  4 Jul 2022 18:34:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76A27F8012A
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 18:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76A27F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="IyjAd6s9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8zy7dqcWLaNCdfhQnWQR9lRKGBlBmHkC70xi2b5yd28MqARGRVPuNO1ztHbFgxdxK84vjJybndStt+/HXGeXiU7eHMMnXfxz8AefZxrBlsnSuQgyxioTZKLFupRMVMGl3jL/ln1+kUL0Q4PRcjSPd+AEtlqjFHQbq5JPnTexuDSeVHOLeDWqNAC62AxZce2HFoNp3lqB+eZ3t/jc2NKqeSE4AvuvcqbZkiDwLakaU+uV9Hf+8GPJrc4iCu/v8FS5igVCNy3af7cPlOw6BBHelGepV8lKG00R9l71XQuOmWnlN2dhKyDHyfa2TTmM9Tr7uJXIu81cIOc4aQRnRTjfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6s0CqIMydvo6nichuccO89m7vrDhcyi+AgExCjMHnXk=;
 b=WaDfaxWFdqBKmg6uNP0qdcVBYkJbwkQe6gUqQEwVICgu/+nDuvHFfffNT1FKsAz4bD6sy3xOFfDTBron4oy8S0Aq9zGDhFYhL0DWmZz/NaVjSo3xbZhQbvCPmizSElpWAIDmYn5bxAtGtatjD0YBDzEIFmhg8SrnLTN9y8UiWurEp2OjhjCMUbMdeap5kMBZpEcEwAXqVv+RQUqCsjc/tKu/ZEdduf49hpeQK2tNkPkeoAvqVk+VkbrGkZiNksQcQrB0Xhrrj5KNf5gxwPesSEr0gCJqYy3lE1xD/3hics80OQCVzN+vBagRnwhxhBOo4Of5d8LKJPoGc3wsETaTqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6s0CqIMydvo6nichuccO89m7vrDhcyi+AgExCjMHnXk=;
 b=IyjAd6s9OJ6R9ttvQidefZ9Jfhus8qxCVnJ7d+B/+hgMjV35Z0UC9Dnx4cSciV8H91UrAixQ+83FqpQf66na5XUbL7/CC6ycppnbd3d2trBlkNpg52q6Rj4ALu6kqVns8FFxL8B7fUVWnIs0Ls/cRX8ILrmQ2eABiQb7UNGIGsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by DM5PR12MB1482.namprd12.prod.outlook.com (2603:10b6:4:a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.15; Mon, 4 Jul 2022 16:34:34 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::6d50:f6c5:cea4:1d95]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::6d50:f6c5:cea4:1d95%6]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 16:34:34 +0000
Message-ID: <9462763e-b99e-b530-ee16-81502f245614@amd.com>
Date: Mon, 4 Jul 2022 22:07:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RESEND V2 2/3] ASoC: amd: add Machine driver for Jadeite
 platform
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220704140837.1215534-1-Vijendar.Mukunda@amd.com>
 <20220704140837.1215534-2-Vijendar.Mukunda@amd.com>
 <684b0081-5dc7-73c1-67c0-b707941b7043@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <684b0081-5dc7-73c1-67c0-b707941b7043@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::11) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b20c572-3041-475c-e7f3-08da5ddb13f8
X-MS-TrafficTypeDiagnostic: DM5PR12MB1482:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ePeZdID5Pj7JXo7NMyi1JbTA86sL7/aBk3zOl9baxK51Ro9DnEmGogfqbG9GapvIzGt2RYe9xLuzWd7F1XTVoV93KAmevCySwGR8vLTsxnirChzc00RamL/CbuPqDERwkEMk2CVsIC3g5oGSanFG09ISwvZicBhj+AL4MvNgJyBATEowJInHdr3tkmFxzbPD/ZC07ca6Lz6drcOJg6PiAMevG4ClAvtL7kfQtOkaZjo2/dfKpTMVEEKBh8U1i0ZRZqVPhe0BK3htPoqr5oHnKJGs47Mq/KqE5t2sCiaTvASpv5EUOyo6ugaknQeAYai/mtSBShRb2/Z4qb4HJRwKqcBFXTDs2kwltAXvgYR2DN78MpHCSILV8PaB+IC9O2Kgwbc2KgJNlRdk2fN3JQU3HjNQINF9B3A3wK0rDRJARfY7lo8m1+cErG85ZDm/zRI6Hl4gBlQMBZw8AIBxa9r4WQtJv60x7p8Nz95JJlzntO7egNLHQH2ThLSa+OAA+2V0AOicXBLwJmjbr/LB1HgqdoFXIsywda0RO5biSF9Nom2txtpOTAjPo0HdqV2upG7D622OYfl5+mBUxD6V8z0ETQJ8ccD8bf8kw1NKojQvH3h/pRNm1SCVpTDjnVkMD0DNhcuT4YTLGtZVslGui7FjEyWUoPEU7Y8CmKPQUUw2Xz6+UokXJWDUQVjWxgX/Bouz88bJJVcQt490iSbitOSs/rCJWCKhUYKbTCP/kkqVs7zRLZvc6NQODZsItmUuWNsKy6jKQaqmGfOSFmY/ku6KND+z45AiYOChXpdzzLrEphYxLauyhaIdNWd4tN12datrl1o+/k3DEFp7alc1ieDIpyAp32XlwHM8KqLKyQ5H7Wo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4123.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(6512007)(186003)(26005)(53546011)(31686004)(2616005)(38100700002)(5660300002)(6506007)(8936002)(36756003)(2906002)(478600001)(41300700001)(4326008)(6486002)(8676002)(66556008)(66476007)(316002)(86362001)(66946007)(6666004)(54906003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ciszMmFGZjk4YmpaaVQxdXRhd0lDRDhYUWtZTWdEeVFVVmUzNDZ4bjhiQUpx?=
 =?utf-8?B?T2Y5VkVMTWNYS0t4WlNiMEgycTZtank2b3cvSWlIaldicWFpZmJPVUs4OTI5?=
 =?utf-8?B?QzFlRklwNXpXcmp4SWdpd21LV1VpOVMwVlRhbm10amVpallTZHBhOEV1OWpv?=
 =?utf-8?B?MXNTOXJUcU92SmhvYVRkeVZIMUYyTGFDdGlXeDZqR0hhd2hXUnozWVM0bVFk?=
 =?utf-8?B?Ulp5NHROUUYyZHRSS1FIUkZiTCtBVmRNa0lkZFMxVmZhU1BaR0dpSXJOZXZv?=
 =?utf-8?B?cUVJVVJnbzEyWU4vLzljZm4xUndDYkh4MWRsV3piektIek9UK005MDRlYnZr?=
 =?utf-8?B?Z01Dc3p4ODVWZGZZekVCTmZEZXJKSDA3ZmRtazZ4SDRPWTNzQXNkMTFLTERD?=
 =?utf-8?B?bHRjMnFMa1oySHU0UkE4b3V6aFNEM0hGcXVzWEhoc2hKMkVqdUxnYXI2Ylcr?=
 =?utf-8?B?YWI5djZXWEpMVCs3ZFBFTm85c09qbWU4SHBYT0JkMWZtTDRzUEhuZGhxR0tK?=
 =?utf-8?B?dzQ5QlFGN2gzRHRtRzFXZitFOFJZY21obWVmaW12NXl0LzR6cTZiSUI4cXZM?=
 =?utf-8?B?UmpSUE1vREpQbkxob1RKK21WQ2w0dFNlWjEwZWJPU2lpbUtOT0VVVkU2QnVT?=
 =?utf-8?B?SWVpNG9tcTFxa21kYkc1VWxGL25lUXhyWE9jOTdIZ2FPLzI0WmJKWTdXNUth?=
 =?utf-8?B?N04zMTVKY2VYQVNHNkhaUld4ZW40dm9EZG5Oc0RpWCtXUHp0UmtTQzFPcktG?=
 =?utf-8?B?L2NqNTMvVHdVSVNlaGNJbnZlSmlEQXZLeTFudnpIalAwMS8xemg2QkhhU25x?=
 =?utf-8?B?MjZiNTIwSEdqMUFPZGlxNjlRSVlxbW5SemxHdjhQL2JjWUIveUdYbkRlWDFm?=
 =?utf-8?B?RjdFTG1YYjE5TlZ2K2RidTM3R1RpZmtqVWhCb2w4MEp0R3RDSk11cXpGV09P?=
 =?utf-8?B?UDgvdTlwYkVqYjRpY1hzSGNycStNL0ZpVG1NTG45c3FpeXFXdTZCRjJ3NmxJ?=
 =?utf-8?B?bjl6am9aZy9Lb0xIQnlOa2hWM2E4SnA2WUVzK1NZMEROdVZQRytxZjVWVFA4?=
 =?utf-8?B?OURJQWdvTzJSczBqWmxIVTV5azJZNkZpVTBjc2FwNG5nWHdoUDNRaERBTUVJ?=
 =?utf-8?B?TXJpZlRYbktBcE1zR3g4c3BOR01NbG8yMlNFMlBBMjNFQnRuMUJyRStnNVRa?=
 =?utf-8?B?MnJzblZJV09IZU5wU0luVzc3cm8rY2N5OXEwSjM5N2VBMlFzdm93bklnL2d0?=
 =?utf-8?B?cnFEdVVqVEE0NTFCWk1ndUppVS9RNEJaV3U5U3BpMDJpK0ZUa0taTEZ0KzFI?=
 =?utf-8?B?eXQ3MUhZK2FNTFBvekJBSGpEeU1pb3lRMnIyb1c1d2JoTkhrUmk3NzdGWDdq?=
 =?utf-8?B?UWpnanpoNDdrZTExMTRHQ2RLQXVzc1Y0ZnBHczNGeEwzRnVIYnBnOFpvbUlE?=
 =?utf-8?B?c3M1YUU2MGpORUphY1B6dXUwVVllNm9ZU05NdWkwZkJyOHZEWWxMeDB6K2pI?=
 =?utf-8?B?MTArQjlIY2VaUWdhSXZyZzJkSVZVaER5cTVqaHRRL1VmYS94ai9LUzlWT0Zn?=
 =?utf-8?B?VHhLaHhJRStxNnIza0xiUFNQN1J6UEMxa3hUdTFJWHlVYTRjT0FjVEFURU5H?=
 =?utf-8?B?Z0ZhazBxSGI3TjFVaWNZWEwyTjdSQldjUzJXYnllY2oyMERaenpuT0FqNms5?=
 =?utf-8?B?WUJ1Y01Fcm5OT1l4bllDb0J3K0N1TC9OMTk1dkdKdVZJcDRidlV2SURhaHIz?=
 =?utf-8?B?dVZHYTd5U3YyQUtlbGJ5RHFaUE1Ib1NGNlFGbWthQzFOYzNKWEJmMFMrRmNH?=
 =?utf-8?B?eU9uWkhYVGtEekk1YmtIYUc0bjNLK2hVZGxtWVhFZlRuZmhmNmNZN2dmNzA2?=
 =?utf-8?B?MW0wS2NCczBBM04wTnVCNC9UczJXdzBFenVNMGczeEt3S2t3eTVHV29Ob0N4?=
 =?utf-8?B?dEVuVDlCLzd0MXhRMFRMOFUycVFPTXptN3FJVHZaWTU0NVhwYWdlaTRjSUNQ?=
 =?utf-8?B?T1lPbTNOZVJMenJQUkJkS2tqNVUxQiswUDBxclJHWk5UT2M0bXdLcXU5YkpH?=
 =?utf-8?B?R0ZGM2dPNDlZVDJLM29PNHRXUjNUbU5JQ1Rzb0RlVjRwRFJHeWRabUhtVUFj?=
 =?utf-8?Q?2SxoIVNWXcJ+LAxgR5dZPQddt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b20c572-3041-475c-e7f3-08da5ddb13f8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 16:34:34.4708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFVrnATDphwENbVbpdXUA6zRadWEcLwutoz3IJgsTeIrOLgPKrmIq6AyFz6uw/3RDDyrzGEQ0XR1THCj/HWjHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1482
Cc: Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Alexander.Deucher@amd.com,
 zhuning@everest-semi.com
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

On 7/4/22 8:27 PM, Amadeusz Sławiński wrote:
> On 7/4/2022 4:08 PM, Vijendar Mukunda wrote:
>> Add Machine driver for Jadeite platform which uses ES8336 codec.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>>
>> Changes since v1:
>>        - as sysclk is fixed, moved code to startup() callback.
>>        - Removed unused macros (ST_PLAT_CLK & ST_ES8336_GPIO_QUIRK)
>> from code.
>> ---
>>   sound/soc/amd/acp-es8336.c | 324 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 324 insertions(+)
>>   create mode 100644 sound/soc/amd/acp-es8336.c
>>
>> diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
>> new file mode 100644
>> index 000000000000..eec3d57092fa
>> --- /dev/null
>> +++ b/sound/soc/amd/acp-es8336.c
>> @@ -0,0 +1,324 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Machine driver for AMD Stoney platform using ES8336 Codec
>> + *
>> + * Copyright 2022 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <sound/core.h>
>> +#include <sound/soc.h>
>> +#include <sound/pcm.h>
>> +#include <sound/pcm_params.h>
>> +#include <sound/soc-dapm.h>
>> +#include <sound/jack.h>
>> +#include <linux/gpio.h>
>> +#include <linux/device.h>
>> +#include <linux/dmi.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/gpio/machine.h>
>> +#include <linux/i2c.h>
>> +#include <linux/input.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/module.h>
>> +#include <linux/acpi.h>
>> +
>> +#include "../codecs/es8316.h"
> 
> Any reason to include this header? From quick check I see that it only
> defines ES8316_* defines and those don't seem to be used anywhere in
> this driver?

Agreed. There are no references to ES8316_*.
Will drop the header inclusion.
> 
> (...)
> 
>> +
>> +static int st_es8336_remove(struct platform_device *pdev)
>> +{
>> +    return 0;
>> +}
> 
> No need to provide .remove handler when it only returns.
> 
Will remove this API and post the new patch .
