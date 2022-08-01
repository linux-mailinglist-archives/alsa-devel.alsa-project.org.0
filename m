Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4BB5863B0
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 06:59:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D10811632;
	Mon,  1 Aug 2022 06:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D10811632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659329973;
	bh=HgGluL8Z6lEv3R1HcMa6tVw+pYvu/qb5rpDkLbUhvDQ=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZG2jsq2m0jocUHqmKG5K+/YUFy2HOb42Qru+tTfCrKpIMm3cbPeWYyi//la/nEKXL
	 uOLPSNXqu07mK/kwoYwHu711xN+ZV+gSyx90Kp2gJTrPROzw/OuF2lZEvqfmfTAxsy
	 v4JSVwHDVy7ZzkJt3GjYbz2Qh9Vy5U94dor0xrv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 600E8F8013D;
	Mon,  1 Aug 2022 06:58:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 518B8F8023B; Mon,  1 Aug 2022 06:58:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02B0BF8013D
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 06:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02B0BF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="lrQYEwXl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBwlaVCThR/PZ3iV3ezakJnI4GxyDPgPvENZ61hshqaGexaphtrn1YjEL375mfSJTmN+ssVZHnpyTvxFz3CPm+S1/hc+IntRozuYLDmCTZNKRNQLWZ1P+TGifzNRkfPDHfHpqZlUxoILNbAvombeYF9wJW9134PSaWwaLm8BXPnNNgBgfJNpink8qmFKJ8+kEEshzwcMjCn/+d78KGDyBmX0J5Z1pm6u0aPNp4wa2bQa0zIr71GeOhfi2U5vhMkZcaRsK/ojhxNimNwETgLBNUtq1Ug5o+ftAS43sVriBnSysOUNGnBMKkN1DyeWbhDeJ2VHBUy0JsueXtu3/E0Few==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oognVm7C1ZpK4aduw153Wwzl7p4kNcGl5mFJluCL7T8=;
 b=YP/8hKiKBSoNMe1kQl6b52D4l+jz9k4OlgNLB9QoY4kc0+Vp4efQKEv+xOGU/0jLCUJSKfR+d6jCgR3axGuutMsU8oXugYYOdC9d10saqsG2FAVQ51CwTxQjuEcLr5hrP41SBmO/DrGOl3VoSwMGAv3q8JGkPt9+ojVRjjqok/ckOp5Q1kJIuRsnSRJSO1i5IXtL3CDEvpF/GbEJV6SKdSzS3aS8pcAsJrwnvFSJt17rPWdy7E0MaJYNVSdJe8Ex2ZcSxMFeIEgzD86AcZSj1g8IOttmNHU6ejUb8y/tYue6j1wBJc7+Pq4YArg3Z6z0Wee/dGFJcGlqBhbKGsPjDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oognVm7C1ZpK4aduw153Wwzl7p4kNcGl5mFJluCL7T8=;
 b=lrQYEwXl/C9lv/X/YjEAtTwZenmt0QGnOfSvPsRUMxQXfp6NaxppWZWNnwj8twT/6djNyGQmAumwnFHK7yYpQe4bgLIMORP8QhAn2k7TVkE+bRnWO8IMy1ruBjrcIHqsRUUaYpBOyKRoPIienm6mIbjDCp/NqTtm6+AYTyb5UI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by MWHPR12MB1775.namprd12.prod.outlook.com (2603:10b6:300:109::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Mon, 1 Aug
 2022 04:58:18 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::3869:b51c:42b3:afac]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::3869:b51c:42b3:afac%3]) with mapi id 15.20.5482.014; Mon, 1 Aug 2022
 04:58:17 +0000
Message-ID: <a218cd09-3ec4-715d-d995-8a93aef16baf@amd.com>
Date: Mon, 1 Aug 2022 10:31:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: "Prasad, Prasad" <venkataprasad.potturu@amd.com>
Subject: Re: [PATCH v3] ASoC: amd: acp: Initialize list to store acp_stream
 during pcm_open
To: Takashi Iwai <tiwai@suse.de>
References: <20220728124057.54259-1-venkataprasad.potturu@amd.com>
 <YuKF4l68sLKkjcmQ@sirena.org.uk>
 <3d351235-c11a-234d-7722-447b4f0442e7@amd.com> <87sfmkp520.wl-tiwai@suse.de>
Content-Language: en-US
In-Reply-To: <87sfmkp520.wl-tiwai@suse.de>
X-ClientProxiedBy: PN2PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::34) To PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87550ab6-29b2-4ce5-892f-08da737a727d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1775:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yWW8YR0/dzUi3lvuAul7ybvLjSoXiOcqNYvlkLjzYn5kdVcShiVGcBBX9y32a6CPaZaRZdi4JdiXhS6KZrpGWDQL6XqDRYqDdbGxMP7iQ0U3gBYqtY3VQl0RVPGCzsjZDV8INFlLhcMCF4ACV5BzbRQo38bPOkAgQaO0D8oKfQk80TwxchswEWHvN7nT1NZA7UZrfto7UqCO5leq2l00S2RJ/UBEil/8XN4g7ZQX6Vj3ZfXyHWjQZwGfjahT1PoKzVOYuuzC203tKRQvvgJmlVZ/eZA2/fUyQrGIXwRxX9isv8PyODfynm08j3K8QWrd7nRZxdNjBzQWWgNRElxnUaekP+Uu8A20ZQX5a+2FhD+hiYOMZL0SvWC8fT3R1+uN8XshLRNTjTh8RQlJ77lW1DAnjvGN2cahK8C61o7U0vRYgxhMh5Aig41S4kshGTCVJPUCVClFuNZRfrrhm5ZVHRfj8gGHPs51RoCB9+d+eyithglsmvzE/q7xhSnAm2XCfCwK8EiCH59HHlcnFRyXI+oxTm8kmhQmSl5/T2f8jDrXIuZcwL63ZnO+cAcauohhDwcJTg4lDfnZUUh2lVVC7+d+6zlX6GW/OxiJZM3qEb1kYomqOqnBsb3UXlK9v56mHrkouudsfiFNCJcZCCEp78JNOmy/Xym5DwKx+CTUSUyoaneTknAVCtiy6ST7wOxHvjbSfWcITNtnepc51l0QZpCbLp5N/v9R9GjLeAZ8j2BHy2OVG+cRdZok+e3cW2bCw+l5Ju9396dOZXB6dn7IfXGFltXOJlzHOXWFWjEEcIIgzKpRBe1BuIaU/ZJN1NYSrA+bTrLKo5vli4FnF9yvlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5951.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(31686004)(66556008)(8676002)(66476007)(4326008)(66946007)(36756003)(5660300002)(41300700001)(54906003)(6916009)(478600001)(8936002)(316002)(7416002)(6486002)(2906002)(6512007)(2616005)(26005)(33964004)(6506007)(186003)(53546011)(83380400001)(38100700002)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blUrdFU1ZXBmQ1dLR0lTK3c1OG1kMVcwZnowaEEyVDhMZ1ZScENueE5zMFVU?=
 =?utf-8?B?OHlJZ1k4NWt3Ui9sU0pJVStPSGc2RmlTWWFHMVljT01qUnZ3blBvMlZMWTEv?=
 =?utf-8?B?UUxKbmtPNnFFZENySmRPYWthQ0N4QlJocjEwODQvYjE2YlJyNTNwUGhFL3ps?=
 =?utf-8?B?ZGo3RDEvQjhEMmpPS3dsYnorbU5SRGhkR0VFTkloOUt4Um9pVVVxTFd6b2FD?=
 =?utf-8?B?WEZveWlVNHFWVmRiL2JXc0Jkb2JHcUlBcG5ENldoZHkyenl2R2RQQ0R4dXIy?=
 =?utf-8?B?NCs4SDJXendVVDZMd1RkMGdMaWxhY3pmdkhQT1VUa1o0cXhsUVA2Q1MxT3NB?=
 =?utf-8?B?RVBaZzVMSllVT1dPUXhKbGFvM2lUa0NQbXBNYmluZHRxQlA0eFFNUXVMYVZO?=
 =?utf-8?B?THBTb00wcjNKOVBRcHpnUzQrWTdyRzNIb1NpN3Q2bmZHRFp6d2NCazBqWEht?=
 =?utf-8?B?V3pVTGNiOExxeTY0eFVDQzkwRHZYRDJqcjFIbEVBL043Q0p6ZEdibGpaWk1l?=
 =?utf-8?B?QVBXbWk0aHNsNUFNWVVrc2dBcVBzS2ZvUklXOWdmUk13b1FDb2RqRHY3VzZp?=
 =?utf-8?B?NkJiN1BJL1hTTWVJay9qeEpqUUlLZ2RIQ05rZ29xd3ZJelh0eGY0UWJHOWVY?=
 =?utf-8?B?K2lmVCsvUVQwUG1CSTIxS1llWXFzb0J5eWl3ZGxpVGQ1MUtsaGlpN0lKa0o5?=
 =?utf-8?B?cmlGcC9RZ3gzTlFGSVRpS1dYUFpyRGxHQ0Z0dDVGQitMMTVpTEROR0QxWW04?=
 =?utf-8?B?bmtka1dhMk52aUV3RkNCWHo1NDdGdFBUeEtwNHJOLzBOcG4xRGhzbFRsVDZO?=
 =?utf-8?B?aUo1czNvYUp5bmZFNVc4MUoxZk0vMlI2RTlBbUNQaHNub09jS2M1RC9vQWla?=
 =?utf-8?B?SEx6Wmk3c3Jyd0x4NDR3Z2g2NVI3TEpHaXBONWxzVVBmSGlrOFlrMU5XRG5v?=
 =?utf-8?B?d2dJZkhpUWpUWHlDZjA1NGdHdmdFZEVQVUNaQTgxNEgxbjlwOG1EUDAzVHNy?=
 =?utf-8?B?eHFTNURqYStBWUlJRUpaVEdHK1A1dUJLTWQ3RURxcStLdmhsQXhUVEVET3Fk?=
 =?utf-8?B?SDVBODlVWWdXdmhaUFRIa2xDRXBKalhYNGdHdmphSjRpSGVpZU9KNmVZQmpL?=
 =?utf-8?B?Tm16VjhKbkFiSXprNm5tQi9zc0xDclEwNzMxWjJKd0JoQlJwV1VqYUQ2anNV?=
 =?utf-8?B?cjY0V0ZuNjlrcFgxUVlkTG83QWZxaUs4WnNWYkpSNC9NZVNvekM3M2RUVVpS?=
 =?utf-8?B?NTBzUS83MGx4eURpVThKcnZWT1BGWjRURTlwTWRVTWRCTUN6anp1eGFyU3pV?=
 =?utf-8?B?TEpvUkJlT05oaFZzQUNWSVhwVFUzTnVuMHVLT29hVkx0RGlQV0pSeXUvMDJx?=
 =?utf-8?B?VUxzV3BwaTVyS0ZhTlB3NUVUSVRlNDRMS0NEYzU2ZzBXZlVQS1RtWlVlU1Q2?=
 =?utf-8?B?M0V1TzFaY2ZsQmgwbFBVWjJHdnFyc0JiMVpXV0xYTGxCQ2Q0L3lwbFZKZDhl?=
 =?utf-8?B?bDB3bGRER2t3VTlscXR2dkdtUXJBY0k1Yi9mdUlSNHlyVnYrVWVqTVMzOWEr?=
 =?utf-8?B?dUFoV3pyV1k4Y2FXOVR5cFFFVWVTQzZlU21rQld0WTNaTURNU2UrTThtNjJE?=
 =?utf-8?B?SG1kUndtYzlqc3kyM0JYOUprTyt2dk1URkdSVHI5aTA4VFAySGJvQnNLL3pS?=
 =?utf-8?B?bVZnVm5oUkQ0SHM1T1IwTldETlEyUVpKOVJubnZZaGFLTWFDL2ZVUWQyaVVC?=
 =?utf-8?B?eGUzQmx4b25ua2VCdVZDZFgvY2xsZERERWJHK2JpZ3E1REZWSWVGdGs2NTVR?=
 =?utf-8?B?Z1NDMkxoTlJuOHJBSEVIcytJMFVyQ1Jhc2g0UGpPN09JSjRuT0V1MjdzaWJ2?=
 =?utf-8?B?MXMwcXpvZ0E3dDNPTzBzT25jK0pnNXZGYTR2N0JncWN6dmZRNHBCaTFGQnRi?=
 =?utf-8?B?MmdiK1hULzRSNTJlWktoOTZBUTkyb1U5b05vZStZNVJzenU3TGFnY2VrZmZ5?=
 =?utf-8?B?RTBzaEtQaVJoYzZWVUpWUWp1d0tRS3pNdjFsNWlNd3phM01qbXBaLzFGK0hC?=
 =?utf-8?B?Y3ZDU0l4RkhxenpjaENLbXVIUTMwYzJmZmNZajR4ZTdlbGFYNkNYQkU0U1JL?=
 =?utf-8?Q?h4BCeYfnrlpFksYddPp4AQcL+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87550ab6-29b2-4ce5-892f-08da737a727d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 04:58:17.3974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d9JBuywjiuACtQN3iJT/CJMOfB/6kYttKC1E5aph4ocpmhHs/TUTjVM8rU3L1vN0XT55zrJJrWB3zPw4myxm4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1775
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Yang Yingliang <yangyingliang@huawei.com>, Mark Brown <broonie@kernel.org>,
 Vijendar.Mukunda@amd.com, vsujithkumar.reddy@amd.com
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


On 7/29/2022 4:19 PM, Takashi Iwai wrote:
Thanks for your time.
> [CAUTION: External Email]
>
> On Fri, 29 Jul 2022 12:34:51 +0200,
> Venkata Prasad Potturu wrote:
>> On 7/28/22 18:19, Mark Brown wrote:
>> Thanks for your time.
>>
>>      On Thu, Jul 28, 2022 at 06:10:50PM +0530, Venkata Prasad Potturu wrote:
>>
>>          @@ -104,14 +105,13 @@ static irqreturn_t i2s_irq_handler(int irq, void *data)
>>
>>                ext_intr_stat = readl(ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
>>
>>          -     for (i = 0; i < ACP_MAX_STREAM; i++) {
>>          -                           stream = adata->stream[i];
>>          +     spin_lock_irqsave(&adata->acp_lock, flags);
>>          +     list_for_each_entry(stream, &adata->stream_list, list) {
>>
>>      If we're already in an interrupt handler here (presumably not a threaded
>>      one) why are we using irqsave?
>>
>> Yes, your statement make sense, I have followed below statement in kernel
>> document. so used irqsave in interrupt context as well.
>>
>> We will change it to spin_lock() and send it in the next version.
>>
>> statement:- spin_lock_irqsave() will turn off interrupts if they are on,
>> otherwise does nothing (if we are already in an interrupt handler), hence
>> these functions are safe to call from any context.
> Also the open and close callbacks are certainly non-irq context, hence
> you can use spin_lock_irq() instead of irqsave(), too.

One doubt, if we use *spin_lock_irq()* it will do *local_irq_disable() 
*even if interrupts are already disabled, and when we call 
*spin_unlock_irq() *after critical section it  will forcibly re-enable 
interrupts in a potentially unwanted manner.

If we use *spin_lock_irqsave();* and *spin_unlock_irqrestore(); *will 
save and restore the interrupt state.

My understanding is *spin_lock_irqsave();* is better instead of improper 
interrupt enable and disable as like *spin_lock_irq();*

Could you please let me know is there any other thing to use 
*spin_lock_irq(); *particularly here.

> Takashi
