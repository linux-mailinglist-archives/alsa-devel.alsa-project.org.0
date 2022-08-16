Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE74595308
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 08:51:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A92984B;
	Tue, 16 Aug 2022 08:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A92984B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660632709;
	bh=X9qvK4wXvpPLBWTl8R4TPA2lAVFx005G7MOOqKDDcdA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A5+PNrXshQOjp3tqW+sPuZXkYAT2TlKoF7tMOJnt2xZMP5jfmennkFismqUUzstoQ
	 d3jRRs9nh2doczJAY9usLBF7QTBb9piywZxqI8/xR/sCOs0Fgl3WNcVpsbGhj4XbgL
	 WiTXIg4+dfekT6l08xR3tlMumR0NjopCZf4gV8gc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B90F4F80424;
	Tue, 16 Aug 2022 08:50:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF8B8F8032D; Tue, 16 Aug 2022 08:50:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B482F80095
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 08:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B482F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="MRXhGXqH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIOWhQ3RWe8Ri7IS6uGkJtNU/kKFar+jKiEJaZcIhsVjqI814h2kpm9+hHu8+JLJbFwqg3BU2p/NBagbSjuxZB4gKHjSqt4miXftvImh4UqL4Kk7cookPFWgY1gaYPaC5/Q7cj8sNt0jPOlrnxTktxfW/w+EPumP7oR/ZlB6GDYMLXTOIUejIzxEgFea4lYulZdTcoo7RP2uyB0CRD83n6FCO0jX71BwfXWlLzwZ4eESw2mnOQSsuqAJhKKBPXTNeugwVDWK2a+3DRKUP53x8IfMbjcIIbzHooISFwPXE41EbGjYgJ5X2jRNUFuyY6pSzfw9tB667b9aKe7Kjgdlhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=np71dPLODEgLprda5zkgYZFO64HrNQajDvml38U6i3w=;
 b=BLpq9vyv/XazdOitD1WJMAv6XLPQEKNZ5A7ly0zf4dFdoC8YcJovwtaRN1I7qBp22smhZlHA+nePzKP2WCOVier1L0sTCpRNtQut2l4MXNQNWmzXhwQl4gy9+IsOGkHfc+gX3kZ2g/q6bEp/LpOPBMUq1I1xc6fbYpHmuQGTgOOm1DmHV3hE7aAcRjercNilobII0t3Ta2/TSK8SZdEXF/LtGB5lGr+RJBjYDKuBPKJQgG0bbcu9+xmyLILuTywoCS5H6uWDLx8rtZ62w2+y1V4iAPBIUnFPsfTqH2ptwfSs1b7czCfxwGYT/w63ag2KmpCWFyn2NxilA8Z7FPumZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=np71dPLODEgLprda5zkgYZFO64HrNQajDvml38U6i3w=;
 b=MRXhGXqHl83NZNWsQlFJzr5o8l0A41rPy1W/ILkSyQKJQiDJQ9EmXRP33K/jMBs2C74Jmkjyc4vaLs64m5Beyt/8X2XfvB68Mz7X8dFaIX/Ssjh8y11zX4UNr5ms5itRRz0EX/ZqeytxlvudI8Eg7OugGKhKpycwj0Kw3vGoXEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3661.namprd12.prod.outlook.com (2603:10b6:208:169::31)
 by DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 16 Aug
 2022 06:50:36 +0000
Received: from MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::bc80:d6e7:d73f:d955]) by MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::bc80:d6e7:d73f:d955%5]) with mapi id 15.20.5504.027; Tue, 16 Aug 2022
 06:50:35 +0000
Message-ID: <d4af3093-a0d4-554d-5b16-438c81af4d14@amd.com>
Date: Tue, 16 Aug 2022 12:18:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/13] ASoC: amd: add acp6.2 init/de-init functions
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Syed Saba kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220812120731.788052-1-Syed.SabaKareem@amd.com>
 <20220812120731.788052-4-Syed.SabaKareem@amd.com>
 <08ef0e7e-bc7a-9db5-23a4-4fd4fb70dd9a@linux.intel.com>
From: Syed Saba Kareem <ssabakar@amd.com>
In-Reply-To: <08ef0e7e-bc7a-9db5-23a4-4fd4fb70dd9a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::22) To MN2PR12MB3661.namprd12.prod.outlook.com
 (2603:10b6:208:169::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77973c8b-e2cd-4be9-acd1-08da7f539f20
X-MS-TrafficTypeDiagnostic: DM6PR12MB4435:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SiQquua0FGNQopmmW+dgyZEDEYB3tH6eWbFwVLKDWELHQkLWpP4LQ2CO5rY2M1L6ODjnbouKpjfLqM2tb5FFOwqpomZLz8y47Bpo23HZj2xr6nBfXQEPPA/FG8IE+hwloJ5C0KU3x6+RspGYrwLDudcTTYF1lnUXlLHdUw+nhZvPg/0iRNu2g3NaPt1/dPJA28x0dGQraz7rQxWesoA1ivSYoPwXd4QnpDSr/VgfX5C41U3KDzHyLKeSIk60vTp6q++TE0XMU9MbA0X9gAKMcdUb2oarKjOK18yE0cZL0/ON4CB7omGP9o9fk4sYnfyZIRJoxTPK5EY34UNKZ3gkpDFA13RR1Ke0sV3R772gg7W/0JnIG20bcdtj+B2guipmr/YYY1AB1BLGBWgWE91pStC723kyVXnBKkOtfHuO9g9OuuRX+vvFYwRSijcMT9eoI8lLUPedYGdL/bHbgcaLYA2FnmPKoSEKVqppyVfITOLaKJuoGZIHVekaAPLwPFr0mPnE4kcLO/zILiEAnVW/w5jIXeqvPx49+yg6BvKXu0PiWd28pEwXH9nf5o52QToeuYL58j+mo14CkOj6SZRNQzV5hYJt+Q7yFPWF+xCZtcbsZshxRYJI/P7s5RtGtTKfyib5ZKww7NvMi8tJxeaJ12tq3AEhIGkmitciDDqqWCnMFFmr4ncsocj4e2XblJY9UMQL7qa38NClx0C3K6SN0yYwcSrpIEDcQIr3iPNyeAHwmv+n1RQqBdD/bmCbljs0eYivr9jrLp3XY7CwGq4wES7F45sV3fjKbNhN/EpxUNyxZxQqdt55r44Qljujjj7ZZem/jWUAvYqcAztahhnz1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3661.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(54906003)(5660300002)(6506007)(53546011)(41300700001)(26005)(31696002)(6512007)(8936002)(66946007)(6486002)(66476007)(478600001)(110136005)(8676002)(316002)(66556008)(36756003)(2906002)(4326008)(2616005)(31686004)(38100700002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWxKN0NDVHB5VFhYaVdZSjc2TStHdks5ZUVwalF2OXNZUDNUYlcvYWlrL3dy?=
 =?utf-8?B?ZjJGMmZjNHNPVzdEdTJWdU1va3d5SllieDF1czUvNzJ0c3laYXg0bWVkOUdm?=
 =?utf-8?B?VmlraDcwQytTa0VzN0ZTNzlGUHJ2MTJMWWFoUjh0ZDhpenNISngzUFZ1Mnoz?=
 =?utf-8?B?NXNHT29LZ0JaSUhWU0llMVgzNTR6TkVHalA1OXZqWW1MaTMyb21VZ1k1aXZN?=
 =?utf-8?B?dUZ2TFF6RTgwOE9MV3hRRzZRQnNMb1BxM1JxQWlGTmRRUU9HZCt5N09oYTYw?=
 =?utf-8?B?bE0yRTlVWFgrczhoOE1wcXd2TU9sbGxkQjRETTB0QThsMmc2YklxK1RyUkdG?=
 =?utf-8?B?UFU2YlAvcENIaE1HazVTa21zY2RvdkRBSURJVEtnbXNsT0NjMm5zNjNodmlp?=
 =?utf-8?B?Z3I1ZWJ2ODg5aHFYUHcxTnhmeG1ndlh0dWYrSmdVay92aVNnbGdJQUJnZFhJ?=
 =?utf-8?B?YjNKUm5iTndMVTl1STlsWXQ5QmN5UE8zZEVvd1R3dnZmSGFpVyt1VXVJUHJl?=
 =?utf-8?B?UXdiNmZIZmlvTGJ5YzlMM1hFVUhXYkRiUGhVVHV2d2YzMGVIcjBIb1NpSUxo?=
 =?utf-8?B?YmNrOWVpcTA3RzNaYnZhRTZuQk9RcExScjJXZExGbU1vNnhxQ1NCTS9uSVpt?=
 =?utf-8?B?Q1REb2o4MDNSbVc3NTVqSUtMM2trWmpZb2FMNENPV0lZSGJOVFJJV3pPUU9k?=
 =?utf-8?B?S0w0b2xDRzRsNll6ZDFWSitZVVhvcENEcitSOStuNXlSd1ZNakFMeVVEUU13?=
 =?utf-8?B?MzcyeGxrRTdyVHdVeGhxdk82VEphVW9vUWd1VFBXNkdoZnZBSE1td00vQzJ5?=
 =?utf-8?B?MlphWTBWZjBUNTM0TjBOb2xqYjVkS3Mvc2VFYzQwczR4UEtMRXo5WnJvTzV4?=
 =?utf-8?B?cVBtMVRPUlQzMVhvejROR0t1S3JPYXRnYlYxMVA1VXJaMksyQmxHK3F5eWM5?=
 =?utf-8?B?QVB2cWVoaUYvRFMyVld6T0FEZDI2b2hwNE54QkpxSjIxaEk2MFh1Z2dBMlRa?=
 =?utf-8?B?SmEwWHJLRVJVWnoxYThVd1BzK04vL29jd3VFQ2lvbmxUa0ZpVHpFYXQrODg0?=
 =?utf-8?B?TjVMWUpWZnBvVHJHZGZodWtkQUhFNWJMbGJBUEF6RmVnaFVUeG5wWmdHbFJT?=
 =?utf-8?B?TUhDNjdpd1V6M0NaVnhBeHNvTjhYWkdNMnFJQnEyeTJTWE5RK1RTYzhGenhL?=
 =?utf-8?B?TzdVeXBhRzl5SHhXQUdQSFVKdXFpNVFLTllhZnVRdUJxbHZwZVFPS3Mwam1p?=
 =?utf-8?B?U0o1T3RQT3hjZG96dDFuaGVJdkhmVVBEbUFQSjBia2hZQXNqMzFyRjdDR1o5?=
 =?utf-8?B?S2ZHZGs1clA3czBaNEtMRU5oNGhzbThOUGJrb1BJT1lvdW5wZUxhYmRaWm1p?=
 =?utf-8?B?dGxrRnBFVEZKeU5TZnFIOURYdUlxNE81eWdoKzc4YUFkajF3NWl2VUNXVHdM?=
 =?utf-8?B?S1ZBQ1ZtZUpYZ0E3bUhzZ2JLWTV4cTlmbnNCVHdVZ3MxZm96RzdEQ2Qxa1N4?=
 =?utf-8?B?eml2MSsyeHBqRXI1QjVKRmgvdit0REZhOW9iRHNheWIxMVhTTlNTT3FIQ1l1?=
 =?utf-8?B?OEw2N0pGT1YvRU9WWVZ0Ri9SY05ZRTd6Um5wNnVNV0xCNFFwWVowNWFEa0U0?=
 =?utf-8?B?a2ROblhqNFdzMDdkeHY5dnI0R3d3a3NhcFZnMU8vNmltTW05bGNuYitYOXZD?=
 =?utf-8?B?UG9WS3VqVWtsZ0JSSTZLOE1wam9BWjg1Sm1sVmlSRjdjM0V6bVM1WnFxa1ho?=
 =?utf-8?B?THZXWkJNSng3QUl4cWVoM1M1ZnNOSjB1R2JONmlpczJqZHhKNXUycEVjOWJo?=
 =?utf-8?B?aUp0cGFLMFFRODV5NXphR3U2cm1aNENSRDVFdUxLczhTTDdwSjZSVXQxVjU0?=
 =?utf-8?B?Qkw4VDFCK0tCYWx2bTJ5RHBGQnAxUjhuWmVkR2RkMzNEblRvZiszN1hYd3d5?=
 =?utf-8?B?d0ZGMVR2bENnaWJ4U1hBK0F0NDVPMjdJYlZvZGQrcUdEZ2s0TDMxdDZpWnI0?=
 =?utf-8?B?SjFLSDhZWlNLK3U3YVNvempvUVFQVXpsSE01QUhoMTBUNjdUWkVPSk9ONzRx?=
 =?utf-8?B?ZEd4TVovaVVlekl2OEpvWERYUmtvbHdNSVc0Qlh4NEZMWkdNemlDcEFxZ2w3?=
 =?utf-8?Q?aeUSEaRk1HPoueVAXwm20ohfJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77973c8b-e2cd-4be9-acd1-08da7f539f20
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3661.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 06:50:35.9140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2a4xfotvd1NR02TG5a9EBitkNB7SiK/7scN+yqHiaYkshQ0xKyKPZKAmUcnZ1IkCFuHF2Q5AcI3ktMT+cGx5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435
Cc: Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, mario.limonciello@amd.com,
 Vijendar.Mukunda@amd.com
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


On 8/12/22 19:49, Amadeusz Sławiński wrote:
> [CAUTION: External Email]
>
> On 8/12/2022 2:07 PM, Syed Saba kareem wrote:
>> Add Pink Sardine platform ACP6.2 PCI driver init/deinit functions.
>>
>> Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>   sound/soc/amd/ps/acp62.h  |  12 +++++
>>   sound/soc/amd/ps/pci-ps.c | 109 ++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 121 insertions(+)
>>
>> diff --git a/sound/soc/amd/ps/acp62.h b/sound/soc/amd/ps/acp62.h
>> index e91762240c93..8e734f190b11 100644
>> --- a/sound/soc/amd/ps/acp62.h
>> +++ b/sound/soc/amd/ps/acp62.h
>> @@ -10,6 +10,18 @@
>>   #define ACP_DEVICE_ID 0x15E2
>>   #define ACP62_PHY_BASE_ADDRESS 0x1240000
>>
>> +#define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK        0x00010001
>> +#define ACP_PGFSM_CNTL_POWER_ON_MASK 1
>> +#define ACP_PGFSM_CNTL_POWER_OFF_MASK        0
>> +#define ACP_PGFSM_STATUS_MASK                3
>> +#define ACP_POWERED_ON                       0
>> +#define ACP_POWER_ON_IN_PROGRESS     1
>> +#define ACP_POWERED_OFF                      2
>> +#define ACP_POWER_OFF_IN_PROGRESS    3
>> +
>> +#define ACP_ERROR_MASK 0x20000000
>> +#define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
>> +
>>   static inline u32 acp62_readl(void __iomem *base_addr)
>>   {
>>       return readl(base_addr - ACP62_PHY_BASE_ADDRESS);
>> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
>> index 25169797275c..2014f415af15 100644
>> --- a/sound/soc/amd/ps/pci-ps.c
>> +++ b/sound/soc/amd/ps/pci-ps.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/pci.h>
>>   #include <linux/module.h>
>>   #include <linux/io.h>
>> +#include <linux/delay.h>
>>
>>   #include "acp62.h"
>>
>> @@ -15,6 +16,103 @@ struct acp62_dev_data {
>>       void __iomem *acp62_base;
>>   };
>>
>> +static int acp62_power_on(void __iomem *acp_base)
>> +{
>> +     u32 val;
>> +     int timeout;
>> +
>> +     val = acp62_readl(acp_base + ACP_PGFSM_STATUS);
>> +
>> +     if (!val)
>> +             return val;
>> +
>> +     if ((val & ACP_PGFSM_STATUS_MASK) != ACP_POWER_ON_IN_PROGRESS)
>> +             acp62_writel(ACP_PGFSM_CNTL_POWER_ON_MASK, acp_base + 
>> ACP_PGFSM_CONTROL);
>> +     timeout = 0;
>> +     while (++timeout < 500) {
>> +             val = acp62_readl(acp_base + ACP_PGFSM_STATUS);
>> +             if (!val)
>> +                     return 0;
>> +             udelay(1);
>> +     }
>> +     return -ETIMEDOUT;
>> +}
>> +
>> +static int acp62_reset(void __iomem *acp_base)
>> +{
>> +     u32 val;
>> +     int timeout;
>> +
>> +     acp62_writel(1, acp_base + ACP_SOFT_RESET);
>> +     timeout = 0;
>> +     while (++timeout < 500) {
>> +             val = acp62_readl(acp_base + ACP_SOFT_RESET);
>> +             if (val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK)
>> +                     break;
>> +             cpu_relax();
>> +     }
>> +     acp62_writel(0, acp_base + ACP_SOFT_RESET);
>> +     timeout = 0;
>> +     while (++timeout < 500) {
>> +             val = acp62_readl(acp_base + ACP_SOFT_RESET);
>> +             if (!val)
>> +                     return 0;
>> +             cpu_relax();
>> +     }
>> +     return -ETIMEDOUT;
>> +}
>> +
>> +static void acp62_enable_interrupts(void __iomem *acp_base)
>> +{
>> +     acp62_writel(0x01, acp_base + ACP_EXTERNAL_INTR_ENB);
>
> In function before you just write decimal 1 and 0, and here and later in
> patch you use hex values? Should probably be consistent.
>
Will fix it.
>> +}
>> +
>> +static void acp62_disable_interrupts(void __iomem *acp_base)
>> +{
>> +     acp62_writel(ACP_EXT_INTR_STAT_CLEAR_MASK, acp_base +
>> +                  ACP_EXTERNAL_INTR_STAT);
>> +     acp62_writel(0x00, acp_base + ACP_EXTERNAL_INTR_CNTL);
>> +     acp62_writel(0x00, acp_base + ACP_EXTERNAL_INTR_ENB);
>> +}
>> +
>> +static int acp62_init(void __iomem *acp_base)
>> +{
>> +     int ret;
>> +
>> +     /* power on */
> Unnecessary comment? Called function name is already self explanatory,
> no need to repeat it.
Will remove it.
>> +     ret = acp62_power_on(acp_base);
>> +     if (ret) {
>> +             pr_err("ACP power on failed\n");
>> +             return ret;
>> +     }
>> +     acp62_writel(0x01, acp_base + ACP_CONTROL);
>> +     /* Reset */
> Same here?
Will remove it.
>> +     ret = acp62_reset(acp_base);
>> +     if (ret) {
>> +             pr_err("ACP reset failed\n");
>> +             return ret;
>> +     }
>> +     acp62_writel(0x03, acp_base + ACP_CLKMUX_SEL);
>> +     acp62_enable_interrupts(acp_base);
>> +     return 0;
>> +}
>> +
>> +static int acp62_deinit(void __iomem *acp_base)
>> +{
>> +     int ret;
>> +
>> +     acp62_disable_interrupts(acp_base);
>> +     /* Reset */
> Again
Will remove it.
>> +     ret = acp62_reset(acp_base);
>> +     if (ret) {
>> +             pr_err("ACP reset failed\n");
>> +             return ret;
>> +     }
>> +     acp62_writel(0x00, acp_base + ACP_CLKMUX_SEL);
>> +     acp62_writel(0x00, acp_base + ACP_CONTROL);
>> +     return 0;
>> +}
>> +
>>   static int snd_acp62_probe(struct pci_dev *pci,
>>                          const struct pci_device_id *pci_id)
>>   {
>> @@ -56,6 +154,10 @@ static int snd_acp62_probe(struct pci_dev *pci,
>>       }
>>       pci_set_master(pci);
>>       pci_set_drvdata(pci, adata);
>> +     ret = acp62_init(adata->acp62_base);
>> +     if (ret)
>> +             goto release_regions;
>> +
>>       return 0;
>>   release_regions:
>>       pci_release_regions(pci);
>> @@ -67,6 +169,13 @@ static int snd_acp62_probe(struct pci_dev *pci,
>>
>>   static void snd_acp62_remove(struct pci_dev *pci)
>>   {
>> +     struct acp62_dev_data *adata;
>> +     int ret;
>> +
>> +     adata = pci_get_drvdata(pci);
>> +     ret = acp62_deinit(adata->acp62_base);
>> +     if (ret)
>> +             dev_err(&pci->dev, "ACP de-init failed\n");
>>       pci_release_regions(pci);
>>       pci_disable_device(pci);
>>   }
>
