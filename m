Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7747443C7F
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 06:14:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D135168E;
	Wed,  3 Nov 2021 06:13:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D135168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635916474;
	bh=wEICZMNX2CmSHfldg5DIFTe/F4zHr8DEG/hw2eoZHGg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C38jwPJhuhn3aRVSbjCazVeapECrMXWhrKzOnKYWh9T8Y8oeoyPCu2IlrXFCjr1BC
	 DCijw5HoxZXWrUpaDF5xc/k7WbFOX1FqcgR/mKpfMt161HVkS/3qyUzUWxrfzcAear
	 s69S8LTdn7IYm6CXBmJH1AogYyx/Sde1zB6yIsiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB1B3F80269;
	Wed,  3 Nov 2021 06:13:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5F03F8026A; Wed,  3 Nov 2021 06:13:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FC28F800FA
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 06:13:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FC28F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="eTLVSG+y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aazXxz0JhJTRO7ZwLXRSi5pFdJTbb/GbWzOBAbkURpCwsSVLjP6br3e7bGdc0R1J6gi3kkQyVQK0/8Nn+KnnyPRUOEH06yQPCe+vF6UbGUGcGDkmANjAreNuEOtej8VwsfZOcr+rAbpmhknLkkuimKYeAh6IT5ADVeomuvI5HfLA5247OCGY7cKpQODKd2BwfPkK0wKK3VFlNusjZyIW4CSp+76bWyUI58L0zVh4kGvSJq3fZWuLNznE2EJjidAoDvPqhE+Eh+3T8jSw2vYgeaVEbBklecuPOoFRg8CPFhxY0DnDvoV6Sla+REjC7TtOrxZpD6TQDRNxeh2i/RhIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4WGucWg6vQiz05HGaA7eje3aoMLy157WKP7B+4SvME=;
 b=j7t5tVC514rnhN03mEB8sDWiFa5w+bAsmgHt8F+nxqc0XiFt8g9+4FhsgW4EIkqMF6OiGZkAKj5Bc1Pak/wy1B9UqFU1HFid23VWPJpKcl00nALBDXskApFNUnYD5Po35/8LTDRbnOTwURwIcTAgGT1ZvHUsMISVeKbceI6hbVwCX/gyFkH+RRVp1ohhD+65vAuXQ0rQv+szhmK+QCYalpQk/SXpKnRUwWGbXx8nRQSpUxWUKFF9QvZfsukmFPuYXpBexh8+dobqFw4qOGw1e8FbuuyPUEbRI395KwXepLn0seRL6tDVwuvMTekFwuaiKUoIFf9HlBa3tgueVgMpkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4WGucWg6vQiz05HGaA7eje3aoMLy157WKP7B+4SvME=;
 b=eTLVSG+yzdJaru7Ux5E2LuDm31LayYpvZ4H2hCcnvcz1ke5kJBdyLhmtb4snQQ1YJRqjamuQBiMAKqGxs7m2ydDzgBhDT/b/9zpzkvcJvkqZ92wVB5N1+UGOE/K1f6sRzlx8DNaXh2+njGE6nJHAnxJiNQ5IuRqd5eb4Uy5atAnpcpt8cmN1ekN3YdI5bj5xMkp6Ir0Q/wY2MgJ6dPTdbzsiEnvt8GuhV4TqiyWArNIaOiTF98ZGG8SqwILsKIL9Y5S/uTyBiCuO1xiho50bkm8MvcMCNrrDyb1r73Yiv4pGaUwk4p7wbujCFbXiOf48k5H5Kuj6EPeREmvXnfYVvQ==
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=nvidia.com; 
Received: from BL1PR12MB5317.namprd12.prod.outlook.com (2603:10b6:208:31f::17)
 by BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 3 Nov
 2021 05:13:05 +0000
Received: from BL1PR12MB5317.namprd12.prod.outlook.com
 ([fe80::64ed:2ae1:6659:2878]) by BL1PR12MB5317.namprd12.prod.outlook.com
 ([fe80::64ed:2ae1:6659:2878%3]) with mapi id 15.20.4669.010; Wed, 3 Nov 2021
 05:13:05 +0000
Subject: Re: [PATCH] ASoC: tegra: Add master volume/mute control support
To: Jaroslav Kysela <perex@perex.cz>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com
References: <1635159976-17355-1-git-send-email-spujar@nvidia.com>
 <79541c76-2c2b-fd4b-60c8-67ee6b8ea3fa@perex.cz>
 <8cb777f9-b73b-136c-f560-de4c31af931e@nvidia.com>
 <18b61046-ac0b-0fb3-669c-6524a03eecf0@nvidia.com>
 <f709fcff-1bd4-1251-1471-aad01fdfdedd@perex.cz>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <c583b8bd-e032-e0d5-059b-1d13736d22e1@nvidia.com>
Date: Wed, 3 Nov 2021 10:42:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <f709fcff-1bd4-1251-1471-aad01fdfdedd@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To BL1PR12MB5317.namprd12.prod.outlook.com
 (2603:10b6:208:31f::17)
MIME-Version: 1.0
Received: from [10.25.98.39] (202.164.25.5) by
 MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 05:13:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fe2eafd-29a5-484d-2b08-08d99e889e17
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:
X-Microsoft-Antispam-PRVS: <BL1PR12MB512672CCE15B219654C16959A78C9@BL1PR12MB5126.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y1sM1ZTGA/VLHm7jOo2ahPbBFRYBFh+d4QqK26pxy+sReS15wrzvYf+0R+rSgznjMye5VcXV8KLksfLxB1zG6fOf4Mnxgb6frKplEMh3x1b+rmsSfnCuNwbPlwxdAS5quxs5+EywsIIqZJPqBLvZHMe76BAxcZZBnj3qgm6oJsn0DdNRe1juJ5CsTGYdK20juGjQE08YO4OzWcLCkXHezTeFpseqg3m60XTd6FfBZbzswnK2trSkTBFQZMMiYTHI00oSByvBl02xED8Vzlnu0qvEe1+fU0QgtL1ZSzt3odbNAtak68wX0SF1rG1qwcmonohTpuwSTHRyAFvsqvU/70q7HjhmAFe1slSODWr0hVf/5TR1CA5ukz2N2GWMb4sIMrvsXufhWr9xiN2EAT2iGesG5pHbH5+rqbrEwzcvo4XSWvu66TWGcu07xPwbDuLs+uGHE/bNhilyEp5CuTWvM5GBLns8t1oEd2htT0cNWQjUjnyRRxDLeKiD/zvnq/MlWMBJpLcbpdWklz+2Y3WVYtT5TGxxLS9Qxv3RuUQvkBmqXQAi8J4z6MF9+9iBU5FCIaN0C89KMHi93Oz2yIcFKYuEnLBEhAycF251E0A9scHRiQkCjQzYpLapqsPqd2OSHpFjsQyFIuPhJB7hY07orXpuerHOLSoY0txj5IGKikA1X5j79pP7Sqz8k96c4Jf77zWbpSEzSnlbPuaIRQcUE/EtvvLA2B4iPRoryWfylxs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5317.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(316002)(86362001)(16576012)(66476007)(8676002)(6486002)(66556008)(8936002)(31696002)(83380400001)(66946007)(6666004)(26005)(38100700002)(2906002)(31686004)(2616005)(508600001)(5660300002)(36756003)(53546011)(956004)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0V2Mk0zQUlqUXJTQm4zaW4yVFVwQWpuWWU1aTlBSllIYWIwbEFtaFFvSGl1?=
 =?utf-8?B?UTliU2hOV1FpYXl5T0ZaK1o5MTd6eDBmUFVOQ1FvcEIrb2gzSkhVdWZ3UmhI?=
 =?utf-8?B?dlhyVUZXTlZkTTNBK0Voc0tGWVZXV2xVak1YVzZPY1NmZWRBbE44RXNleHFE?=
 =?utf-8?B?aDc3akoxUXdhUFRpdU9Xa2M2Skw0VjZUVlpmRDdicFJXU2JGRDFqRDRVZkNP?=
 =?utf-8?B?cHF5K0VXeHZaV254azh0VHZRcUNsaE4xQlQ3WmRPVWRnclNLNVVLaWQ0MUFZ?=
 =?utf-8?B?R3MramEyZEhmNzZveDh0MUd6L09FSm1WYVMzS09HUDN5Q1oybjNzbXBDVWRW?=
 =?utf-8?B?UGd1VkRLaVdhRUlhZGQxZWNIcHJnQXZyUzlhTmRwQ3VpcFJqY0kydXVNczY3?=
 =?utf-8?B?bFIxQ0dyb0JpMlQ1MkgyNVd6YkM0WFYzc1FBV0I1alN3dGJ4RWZrS3JsWmgx?=
 =?utf-8?B?eEpFL2xqQS84WlJScldkZFA2aktBV0RGOTJIcHVLUFFZZStLaXNBeVYvcUVO?=
 =?utf-8?B?OUZZNFdONi9TdVBrNkJZN0hOUklLeUp6NjNQK1h0YjdheS9vV2VMZlQxbTVv?=
 =?utf-8?B?QUNPc2RseEEwNmdCeU9Na28xZFhnQmYrUUQ4QmxsK2xiWm50WnMwNGIvRGcr?=
 =?utf-8?B?R29jODhoVkxuMkVVMlZoazNlalZ4SmV5WDFYWEpvd0Zjc3FXb3pzcEpCdkRT?=
 =?utf-8?B?a0lhSlg0eHg0eGMrZGhuNHhQWkllZFlSZEFXQ3lLVVVHajV2UEE5ei9CQ2dy?=
 =?utf-8?B?cHE2dmRVMm1TM2EvdlJvREcydWpvVDZXSE56MXkwVFc2MmtEWlg3YzhaWWhk?=
 =?utf-8?B?aERkOW4yMkRRcnNtRlZNVEYwZG9JYWZEZGlFbmNwRUIwWDB5cGszbEZ6bHll?=
 =?utf-8?B?ejdQTS9rdEdyeWJsSERWVCt1MTU5aHhzclFOVmVoZmVlNXJlU3VlMW1QWGNa?=
 =?utf-8?B?ZVZGTUNZMHY5QkJMdjMyV203cVhkcFNCL1FRaTNQL24vaC9mVExYRFNxcjZl?=
 =?utf-8?B?bkp4NmpMY2FXWHo2ekcyS0ZlU2dTRVMrbmpxZktyLzYwM1N0MWJIQjVLeDI1?=
 =?utf-8?B?bjBDK0I0cnN0Q3B1cUNNY3NqY0dzQ3JiQUIvc1FDdC9taGFXY2hiQTdTdjNw?=
 =?utf-8?B?eUNtNkdha2N0RVdzWFN0bmxFQjkxMW1pd3dWMlo3ZjFSK1Rnc0x5OHdRclZ1?=
 =?utf-8?B?OVR6dW1vSFhUZ1JDOGV3U05pa1YyUVVyYnlQK2wxck9pdlVSSE9yMWcwZDdK?=
 =?utf-8?B?WFBWZ2VGNFZLTitBRUc2TnZRNEdaZjdaODRUUzg5aUR3WTI3ZkZoUTR3KzFx?=
 =?utf-8?B?WHNGZmt3b1dtakIzZGNFaXA1VGRZYkNzejdwRnFDVDVtQWdtSWlvUWQ4Ly9i?=
 =?utf-8?B?TlljazhBZ0VabTFLZEtRZU5qNFpkUE9ST3JRNE1MTzN0ZFNMM1hydEdXd0RG?=
 =?utf-8?B?Wm5nbDVwYVFQTTV1VkRzTkhOTTdNVThBMFlwQmNITUtBYTNKSVo5UzJ5aTJZ?=
 =?utf-8?B?OXBsWHRmK1FDWHg2aHVJK1h2TXRCdHpGM2MrcnloKzdwcWh0S05ac1Y1Z0la?=
 =?utf-8?B?WWM0anhRbUN0WGM1aWxLUUFBUG5VVVlxWHFJNWJlYi9xNWdOM3ZqbzVUbE9E?=
 =?utf-8?B?MWVrTnRsUkZCWUF6cy96UFRRTVdyMzR5WlQ2bHQ1eTZyNC9PcTZnOHRDeTJ6?=
 =?utf-8?B?VXNxOXpROVJPUGZCTUlmSmZlZlAxUjBuVnU0MnlMVW5sbjk0MEc1Z0JidzNK?=
 =?utf-8?B?UVMvdStXYkpRczJ2d25HSnBKVjNqbGtVR3hkNnN6V0U5OU11T1VBZlJ2TWVS?=
 =?utf-8?B?clRITFFvZENNUmFMcFFjSFltWENiSVh4b0pNZUoyLzV3QmNEcVgwVTRhR3JK?=
 =?utf-8?B?cjVtNzQyWFc1Nml5NlZUMFJVUHVSL2ZuRmovRDlkeTBwZjMyQ3I2SWdYd2ZM?=
 =?utf-8?B?R1ZPUStrb2l5N1VFeGNFUVUzYUJicDFocEYrQlhsQ1hLbDhNdDZtaTJhdWxX?=
 =?utf-8?B?VUt3a2lqNFhuMTRtV0RyN0poOFRYVVVtU0w2Nnl2bnBaalRDN0tMeUc4OGtw?=
 =?utf-8?B?M2hkRmdBUm5ndlkrR3FZT1hudm9nRm0wWll3RFVZOWM1OXpPN0hJVGJJbldi?=
 =?utf-8?B?Sy9pUFNQUVkxajMyL1hGTXliaXVuWkJRUkpVRTc4VjNWWTF4VDBqem1ORmhG?=
 =?utf-8?Q?jetw12EgnVNSloMlzSYo40E=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe2eafd-29a5-484d-2b08-08d99e889e17
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5317.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 05:13:05.7343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOVa/oxdpK9lcO5zdg+vi1/ovFYS6KHVkHDESTSdDRF5tDI7TIcQFesyWIwImZ+foEfg9lLSV98U77V+2caXkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5126
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 thierry.reding@gmail.com, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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



On 10/29/2021 8:56 PM, Jaroslav Kysela wrote:
> External email: Use caution opening links or attachments
>
>
> On 29. 10. 21 17:08, Sameer Pujar wrote:
>>
>>
>> On 10/26/2021 11:53 AM, Sameer Pujar wrote:
>>>
>>>
>>> On 10/25/2021 6:28 PM, Jaroslav Kysela wrote:
>>>> On 25. 10. 21 13:06, Sameer Pujar wrote:
>>>>
>>>>> @@ -150,11 +186,22 @@ static int tegra210_mvc_put_mute(struct
>>>>> snd_kcontrol *kcontrol,
>>>>
>>>> ...
>>>>>
>>>>>        return 1;
>>>>
>>>> It's a bit unrelated comment to this change, but it may be worth to
>>>> verify all
>>>> kcontrol put callbacks in the tegra code. Ensure that value 1 is
>>>> returned only
>>>> when something was really changed in hardware.
>>
>> There are cases when the mixer control update is not immediately written
>> to HW, instead the update is ACKed (stored in variable) and writen to HW
>> at a later point of time. Do these cases qualify for "return 1" as well?
>
> Yes - assuming that the get callback returns the cached value. The 
> get/put
> implementation should be consistent from the caller view. The driver
> implementation (delayed write) is a separate thing.

Thanks Jaroslav and Mark. I have now sent a separate series to fix 
Tegra210 (and later) drivers.
