Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6463428BEF
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 13:26:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48FDF167D;
	Mon, 11 Oct 2021 13:25:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48FDF167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633951601;
	bh=dtVbb/N7UdQ7pb9K7K1aQuSxeD8RrrrpA7qjzVxfuRU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KR4lpQxTzbbk2arwy3doF+BmKbMKY/zVBdwiwG+u1ARr8kPnThgqb3TmKhvG7rOKY
	 SmGjSH+m18dZp4Qvahv0ejedNYypGtc5VZ2XguxMMlF46NMgKdC8owfHP2R5d44xlp
	 Y6rKhZXDaDnGlzlLnrz0J2lPvydTXr6B3R7v/+YQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABBABF8025B;
	Mon, 11 Oct 2021 13:25:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36B02F80269; Mon, 11 Oct 2021 13:25:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51C95F8016D
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 13:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51C95F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="JQur6/gZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEO4RzFCavzoRoqEBKklnYTemF4n5j3qihsU3aPKegf8q6x+WHteVlC1MkUkE824yH+T0gs3x5wHGU3uz+m0wm0CwN3m2f87IDbl3m7vJJ/IrVdMuunswaIL3vG7uqiM8u/7apyz/m7f/mpUKQ758bCu4dTDkis8OCWBL3+dtpAPdyRFKiF1EsIOIroTe06qFiT0q7EogJ9dZ20W0ykC8iATiWygJpXMhRQZ2ykkeGVU+ZgwdUM0j14LlhmTod/swXnewFTwWOv9mTr5Cx9VROCrvZRfwystork7fCKGNaiHrME2AZIMbxrkY5cqCZTGauaBn8OMKn4FCvN+jeVB3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZiLSZd5gI0xbxSmL3i0Kfx3wb+ajEfUfax68v3dvAw=;
 b=LVdugOb0hmxy460tC8oVSM66c56Ov19axwq5H+3t8BmzWlw/CsW6bqBJZCjA9IIrW8tfUB5PEbC40fZJ4DOrQVLu0ffTsjAHlrzC9uMSE076TZYLFd4lNSmvsx078bHl4dj573JMkXIz0SOOT5usvZn38UQRI77ipbfMmwgweZFr0/oWooDPoM41CtLrZWWUy7cBchd2c1cVZ+f88zgavynm+P661Mb1lL9LtYPGX+WWGLyLrpAAT5rDMSecIxQhuBVmsfhRZ0bCeoE9D5NZH9YU55gXyi+g/YHV5CKzx9JL+9EruQnc2dcE1ROqiZzUEYVuUbc9blBTtH0FQyyqcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZiLSZd5gI0xbxSmL3i0Kfx3wb+ajEfUfax68v3dvAw=;
 b=JQur6/gZhHo1/eZVya1s5FDgV2HoCcto/VKs3mmW8/P9QIjwI1eCVDzP+NqIBrmPNQpANApu+OjO+pxRbB8J8HsPQodJqR31/el06bZT+wIUSEdlKPy3mVrrVXRCdwixbHI85NG/guFC+V9NYLEmCF4lx9rhMLiAl7sKDjONncU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by DM5PR12MB1849.namprd12.prod.outlook.com (2603:10b6:3:107::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 11:25:05 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::e887:8ff6:34b5:99b3]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::e887:8ff6:34b5:99b3%9]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 11:25:05 +0000
Subject: Re: [PATCH 02/13] ASoC: amd: add Yellow Carp ACP PCI driver
To: "Gong, Richard" <richard.gong@amd.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
 <20211011055621.13240-3-Vijendar.Mukunda@amd.com>
 <e61fa81d-bf63-8b41-03d8-12bd3e61af59@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <95e0a6c8-c4fa-6471-d19b-27fd8e5599f7@amd.com>
Date: Mon, 11 Oct 2021 17:13:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <e61fa81d-bf63-8b41-03d8-12bd3e61af59@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::27) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
Received: from [10.129.9.123] (165.204.159.251) by
 PN2PR01CA0082.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:23::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.20 via Frontend Transport; Mon, 11 Oct 2021 11:25:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1919a799-0838-41cc-f6d2-08d98ca9c659
X-MS-TrafficTypeDiagnostic: DM5PR12MB1849:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB184930AA1074DEEBC2DE38F097B59@DM5PR12MB1849.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qccWs/BWAGUkN94WJ2nUSvZL/unBVqLQYtMDr2O91hFpsXejr2Wixr6plxItLrohsrN7sjpY/15oHnu323D20DEVyXyZ6UqLHQ1aYt51+DOw+WIM7yCJ/2le96cYOlHtxN/zM8EAK0fiL2c8Sx7b7EMQGQwZCw/KUkYhz/9mEhn1WDR8NKkc6gMlfLpTYVuUzkBN56POKkO89EbFJQBNb1N8ra1Jyms56ErkCV/GWtN0+3v0ZKivSuLbUqHcv5rcuhr3Pa0bC6XP5dkE561BBMAcE1JI1bfHUx1HzdQkwp2l9zqHbEHfShtxXMNapTRw01NxVVM9pSY1CNeBacv3UIST9FGGFM7b0lG+D+YdnLJy+PZYn3U8pEQCQkNCVxtsn224u3VSIG99N9m/0Y41HJKJDFQKnff27NwLUPC+JGGV1Z21h0Qpb6ZnQXt+UB8kkotyWIVX5fydXc6icI6HK1f9pUhtVMg7we2c6EF/GoeiYsazw2/io4qE6lfwD8Xzmm3+y8wYtmGc23ghT7mYnztioPdwry3mrKvdIOGf1yJv1lhaSI4IrPPsoOGsUE7p0dBEsMaG6sNPCwrfNpPHjYBDjGXCxmbIHuQJoiL6/Gf7YbhbGe+Zl/tkmMldFnoxCz6Dx4UctDWp964DoiV5Ar0OLQHKv21cpM50LLCXZd/jr0baS+U1uGik0Nl9nK/4VN5xDLNbhlKNJUcr0BM0h3NJZ2oLiaxexqn/B4Kt/O940fDuGL2pLBC0FH1KcJFo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4123.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(66476007)(83380400001)(31686004)(86362001)(66946007)(31696002)(2616005)(956004)(36756003)(2906002)(53546011)(186003)(4326008)(6486002)(8676002)(508600001)(5660300002)(8936002)(26005)(316002)(54906003)(110136005)(16576012)(6666004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1E5OGo4WXZuSURVZTl5YWkxUm9UOGNsSjBWK3gvWitHTTg1NSs0OVVSVG53?=
 =?utf-8?B?dXhWRVQ0bzQxNzlveWh3cTNBZmsvTVFrakQ4azFjTXpla0hKRkxhK1JEK1VT?=
 =?utf-8?B?NlkxNTAzdUJmSVEwZm1vZDI2U2tyME9zZVlERXUwbUs0eUxXMUlSd1N2QXZ3?=
 =?utf-8?B?MTl1QllzRFp6cFVrQlpWMVJMbnNuVEorWlB3UDJ4a3RLL2FUbitsOU9CMUVi?=
 =?utf-8?B?V3lCa3NobCthZlArYTVCYWNKZWNsajByRDJ1U0FXYmhWeHhkenVJQzl5Tnp6?=
 =?utf-8?B?dG9za25kSWNuZlBndXhrT0lPbG1NRHJSNDBVYnFhTGxHMGFhcFJYRzlHR2t6?=
 =?utf-8?B?ZkJZZW1CdnoyeC91SlI0UlJZTlAzeHFLaTUyS2FHeXcyYWE3eE1XbDJoUDB5?=
 =?utf-8?B?cmlKZC8vcHhqSzcvMlBORjQ0aHB4LytQL3VoNXp6eEFpUE9rTDR0Zk9UVysv?=
 =?utf-8?B?UmRScWM5ejBlc2tCVVlXY0htbkdkT2dZTS9NeEs1SGxDNVRjYTV6cEtCd0V3?=
 =?utf-8?B?YzBhYzdRZFNBYWkwVGdmN1ppemlDQk1jTFFZckJKVFB5amN6UXR0U216MG14?=
 =?utf-8?B?TkUycjBUZTUrVUQwT0wrd29LeUVQWHZqeXJRamJrUUhQa08yZGJoR1ZwcTlM?=
 =?utf-8?B?b3d1aEdRdXdxRG40SzBtUnpNTDdrdWEzaHVvbEdHOTlxUUh2Nm1Db1BNM3Y0?=
 =?utf-8?B?NjZZVnBqWUZVSmdiYkFnTThOVXhnYXZ1VWg0M1IvNnBlMERHOCtpSytGUXJh?=
 =?utf-8?B?WXBwaUp2bkczanUvYjNFK0VaU3dDZjBUY3JVci9RNVJVNUxnaWd0R05qbXdr?=
 =?utf-8?B?ZTlnU2V1c21GRDdYS2hscEkwcHh2MDl5cDFvam8vd0ZRcEYxaCtzNGNsUXZY?=
 =?utf-8?B?QXVGMXlGOTZmK1YzV2p0NVZ1Q05mUW02K2tJZFZhRWt6N042SWdtTkF5OEpo?=
 =?utf-8?B?cENPUzJNVU9RYWRuZWhld2t2S3FFSVIwMXR6WExadFNzRk5nTUU3RnVsL0xT?=
 =?utf-8?B?cVpPZk9LZy91blQxOHFMOGZjMUlOZnhEZEN2RGJLdFlHZk9VQ3Zmb0JUMWIz?=
 =?utf-8?B?dWhzbEZUUDJ4Y0lEbGRtV1VHVkMrQTR4Q2FLUThLbVNyeEhranZTdTBZYS9H?=
 =?utf-8?B?UFVueEszZjlIbzdLSTk1QzBOY1g2V09LMmpPNjdsaGsrRG1TTEtkQXdoMFNi?=
 =?utf-8?B?ZlZORWd0T0NCZnJ3TjZBdWF2RTFkcENreldHeHhsRVgvdFhUVk9GMHR2MGl5?=
 =?utf-8?B?d2RwNTNFWHhGb3pBRXJwejBpRndyNUhGdks0UjJZMjc4bWI5N1VXVGNqY2VV?=
 =?utf-8?B?NmVQT2UxNkpKRHgrTGdxNE5vbkdxRXJKcm5nYm9tb3J5UE5mZUFGczFaLzdE?=
 =?utf-8?B?cENRRFhoRHAvLzVBbWJkZXNUdFduU2VMTHpWQXR5QmFYVDA4U3RtMk5QeHVE?=
 =?utf-8?B?QURRc0IzTkFIUnhXc2RwdFRnSnQ2VHJkbnhJWnhJUTIzc2pXOTZWNHQvM05v?=
 =?utf-8?B?TkRwc3BkcXh5Q0tOaU5SWlRNV0RoTVRZYVJ3VjRvSDJla3doOXFKVllMZjZ3?=
 =?utf-8?B?UGNab1RUcWpodGtQalRhcXM2MTgwQStXNEZZSXo1bWZEbS9KZEQzVU5hdkps?=
 =?utf-8?B?VTRraXRoN2E4WHlVVm9MQnY1ZjVNejh5c09MaTZoVDZ4Wjl0R0lUNmg2UE4w?=
 =?utf-8?B?VFRLTFBUcWIwcEVvTGV4TWlUSXhZSW5RaVk4akx3enRMYlhTd3pYMVE3SnVS?=
 =?utf-8?Q?jeHRr2j7UvcHpOus49Hln64Ou841hQxtR8Gu0Ta?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1919a799-0838-41cc-f6d2-08d98ca9c659
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 11:25:05.5688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JR8oXakqCYnZtPJrKOyQsYMu6C3YpchB5Omy9Gnw1zQfygv0moM3oHn1NhhwsD41uma1L65EooYQja5RfU+gng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1849
Cc: "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 open list <linux-kernel@vger.kernel.org>, "Hiregoudar,
 Basavaraj" <Basavaraj.Hiregoudar@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
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

On 10/11/21 4:31 PM, Gong, Richard wrote:
> 
> On 10/11/2021 12:56 AM, Vijendar Mukunda wrote:
>> ACP is a PCI audio device.
>> This patch adds PCI driver to bind to this device and get
>> PCI resources.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>   sound/soc/amd/yc/acp6x.h     | 21 +++++++++
>>   sound/soc/amd/yc/pci-acp6x.c | 89 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 110 insertions(+)
>>   create mode 100644 sound/soc/amd/yc/acp6x.h
>>   create mode 100644 sound/soc/amd/yc/pci-acp6x.c
>>
>> diff --git a/sound/soc/amd/yc/acp6x.h b/sound/soc/amd/yc/acp6x.h
>> new file mode 100644
>> index 000000000000..62a05db5e34c
>> --- /dev/null
>> +++ b/sound/soc/amd/yc/acp6x.h
>> @@ -0,0 +1,21 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
> Use // here

Will fix it and post the new version.

>> +/*
>> + * AMD ALSA SoC PDM Driver
>> + *
>> + * Copyright (C) 2021 Advanced Micro Devices, Inc. All rights reserved.
>> + */
>> +
>> +#include "acp6x_chip_offset_byte.h"
>> +
>> +#define ACP_DEVICE_ID 0x15E2
>> +#define ACP6x_PHY_BASE_ADDRESS 0x1240000
>> +
>> +static inline u32 acp6x_readl(void __iomem *base_addr)
>> +{
>> +    return readl(base_addr - ACP6x_PHY_BASE_ADDRESS);
>> +}
>> +
>> +static inline void acp6x_writel(u32 val, void __iomem *base_addr)
>> +{
>> +    writel(val, base_addr - ACP6x_PHY_BASE_ADDRESS);
>> +}
>> diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
>> new file mode 100644
>> index 000000000000..2965e8b00314
>> --- /dev/null
>> +++ b/sound/soc/amd/yc/pci-acp6x.c
>> @@ -0,0 +1,89 @@
>> +// SPDX-License-Identifier: GPL-2.0+
> It's correct to use // here.
>> +//
>> +// AMD Renoir ACP PCI Driver
>> +//
>> +//Copyright 2021 Advanced Micro Devices, Inc.
>> +
> Use /*  */ rather than //

Will fix it and post the new version.

-Vijendar
>> +#include <linux/pci.h>
>> +#include <linux/module.h>
>> +#include <linux/io.h>
>> +
>> +#include "acp6x.h"
>> +
>> +struct acp6x_dev_data {
>> +    void __iomem *acp6x_base;
>> +};
>> +
>> +static int snd_acp6x_probe(struct pci_dev *pci,
>> +               const struct pci_device_id *pci_id)
>> +{
>> +    struct acp6x_dev_data *adata;
>> +    int ret;
>> +    u32 addr;
>> +
>> +    /* Yellow Carp device check */
>> +    if (pci->revision != 0x60)
>> +        return -ENODEV;
>> +
>> +    if (pci_enable_device(pci)) {
>> +        dev_err(&pci->dev, "pci_enable_device failed\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    ret = pci_request_regions(pci, "AMD ACP3x audio");
>> +    if (ret < 0) {
>> +        dev_err(&pci->dev, "pci_request_regions failed\n");
>> +        goto disable_pci;
>> +    }
>> +
>> +    adata = devm_kzalloc(&pci->dev, sizeof(struct acp6x_dev_data),
>> +                 GFP_KERNEL);
>> +    if (!adata) {
>> +        ret = -ENOMEM;
>> +        goto release_regions;
>> +    }
>> +
>> +    addr = pci_resource_start(pci, 0);
>> +    adata->acp6x_base = devm_ioremap(&pci->dev, addr,
>> +                     pci_resource_len(pci, 0));
>> +    if (!adata->acp6x_base) {
>> +        ret = -ENOMEM;
>> +        goto release_regions;
>> +    }
>> +    pci_set_master(pci);
>> +    pci_set_drvdata(pci, adata);
>> +    return 0;
>> +release_regions:
>> +    pci_release_regions(pci);
>> +disable_pci:
>> +    pci_disable_device(pci);
>> +
>> +    return ret;
>> +}
>> +
>> +static void snd_acp6x_remove(struct pci_dev *pci)
>> +{
>> +    pci_release_regions(pci);
>> +    pci_disable_device(pci);
>> +}
>> +
>> +static const struct pci_device_id snd_acp6x_ids[] = {
>> +    { PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_DEVICE_ID),
>> +    .class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
>> +    .class_mask = 0xffffff },
>> +    { 0, },
>> +};
>> +MODULE_DEVICE_TABLE(pci, snd_acp6x_ids);
>> +
>> +static struct pci_driver yc_acp6x_driver  = {
>> +    .name = KBUILD_MODNAME,
>> +    .id_table = snd_acp6x_ids,
>> +    .probe = snd_acp6x_probe,
>> +    .remove = snd_acp6x_remove,
>> +};
>> +
>> +module_pci_driver(yc_acp6x_driver);
>> +
>> +MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
>> +MODULE_DESCRIPTION("AMD ACP Yellow Carp PCI driver");
>> +MODULE_LICENSE("GPL v2");

