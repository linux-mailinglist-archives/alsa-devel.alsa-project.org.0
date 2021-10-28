Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D062E43E119
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 14:41:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A62D16A0;
	Thu, 28 Oct 2021 14:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A62D16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635424885;
	bh=HQOuSzZQ9AkUsin2l3Ta633vm/ztjJ2TaCb4fbTUF10=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t0zqh4nCpJskM1aPSKWbV09opefQOMOGfQIgFISTeuN1xIXnYLqnSsjJ40DqWFnkT
	 F2GdxESUvnNNQHTSPh9nPUQHksAFnI1DmCurgKB6YARo/e0mRoz2BJ0sUc7pvpCUI0
	 he4mCvofT1ygvV5bJmKNNICNBwydBHPoL4Lu7y2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A11BAF8010A;
	Thu, 28 Oct 2021 14:40:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21B4AF802C8; Thu, 28 Oct 2021 14:40:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2060.outbound.protection.outlook.com [40.107.95.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB0B2F8014E
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 14:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB0B2F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="EfLwqs7m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gx6wdFUmYBeaGsbWG/zSYPjlAu4yxrx3OjQxJ+IlTvQCr8cSjZ2j7e7y6+FVvFFfUP21KZAcdUb+OFMu3TzIIKhQkqNz1eCHQe1qPqB7B3rVPjxRWFlJelyULkTzYOrINsyC1BuEsH6NqwkgUNlGiFsB8IotFCnaLaLfNB4ysSMhoLzmCXDoJRiyiio87sEaGFU3eEfI7jf+LxcoG4pEqaffw2AcPgpiOqSs+pr2dk9U4ubZlI/HY3RLfOV8JK3yKPOUOkTemy8LW/8dtuIpofQYysrKragCF3g+tVQG/AwFkwD+TwRPa0LOQrklUnGJGYPlYN1shIh+mWgCTupZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LndmvngHnEYyGw8XD1xAAa7FVnUML1cGYjI8swkNls=;
 b=lvnE0SRalaUPqmot3rG49oWWHloyqx9cpq9YhdEJ5fs3KOl0qTr9AR00joWAL/cXg6wcESFpUqRxBUh4BDfakqxVgZ67qSD9ePDWH7NZRQsFxb7UlUwuMplFsFTz9d2XxExtbhbKzZPQUnba8RpcWYDaA1BytYYHtGLbFrTyX+nKUBEp7Mzr1LqEQETHwjXVT9faiCPBUGSS+Lqi+L29sz7ZVEpyR91apEsoFNS1XsGAkBEvV/1S9Rp37l+P6qtd7j+zz+SVcRAwm8ywc3GzF6ol+WnFqg2W4xLCzE1oxLSoz81rBVcDYKWmVdt4OExeX8EGh0psyHg9nthzXCZqdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LndmvngHnEYyGw8XD1xAAa7FVnUML1cGYjI8swkNls=;
 b=EfLwqs7mAojEiwTHjXbP7AwS+BonASu8HEMvVMsA+X7cBNr5S+o6JEXyCzCUnGGsy2dh+L6n04dq9XQGOQ2Z3Pf9s4/2dlGfwjO21f7d24XI5FpPvDFAVYCvUZz+rv/7PFnGxWua/GO9DnJ1a/pFR989c6w3z6TuVszaow+DZpQ=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by DM6PR12MB4465.namprd12.prod.outlook.com (2603:10b6:5:28f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 28 Oct
 2021 12:39:57 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::e887:8ff6:34b5:99b3]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::e887:8ff6:34b5:99b3%8]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 12:39:57 +0000
Subject: Re: [PATCH RESEND] ASoC: fix unmet dependencies on GPIOLIB for
 SND_SOC_DMIC
To: Julian Braha <julianbraha@gmail.com>, broonie@kernel.org, perex@perex.cz, 
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com
References: <20211027184835.112916-1-julianbraha@gmail.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <6ff76018-309d-349e-691a-f504ca29420e@amd.com>
Date: Thu, 28 Oct 2021 18:09:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211027184835.112916-1-julianbraha@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::13) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
Received: from [10.129.9.123] (165.204.159.251) by
 BMXPR01CA0027.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Thu, 28 Oct 2021 12:39:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5042aca9-cae7-4126-7838-08d99a100c8e
X-MS-TrafficTypeDiagnostic: DM6PR12MB4465:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4465ABDD8BFA95C188B3B9BF97869@DM6PR12MB4465.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fv6FxzR4EKJkSKexQRaoEXQsigniZIA7Z6D5IuNS5EThJoQeye/ec48GkFr8YTYbTzzhc4pg7tweQr0yAI1PPrnzlfNTsN+g9yAthkLT1dsAv/stZHyC2ydCVU6ErJUepXMZc1jLTy95I28sw3UxFs6Z0Rocah9367L+oD0HwXbM36bDDk3jFK65LuLadvb8c85MLRpCQjUd4Yo6lLXAeONAfizQpukA4RuOkCEuwMMRCLYICBbdOIMw4bWP983iN2IV2N6lF1VqveijDsHDPwMoGrJ8z4GtrTyh/UgtxAEMJV9uoVhWy43N0XbBw0hXdRjLZROwHW+lzlVyaVmLMaDgdBEOwh4NGE91I1XBG7r1lryTpfZSDRcmtJMBbQsL+EPEJ9OTo8gFHs9BqIPPuBtuLnX8oIoXJXmdhc1oe1bypJvlX+CzRnIsSKLUMYHJxEGnKKj3ISW5VKMupUmgSskzmwAtY0PAtWFjqGpbdQ1alHes73n6rt1UVV7klGxMd+HyzBR0gFaQn6rdDS+ENlICxRoFbuBf/jIEhf3b1QP85OG/MlnCwzlD3jMxu37enRtaBMCtIG9CRcbduGdzPA5eQansEl/yEQmlJT7RyvwnRlc3Uv8c2XdkdIP1m4CCdBx9L3YzAF8osLn+Sal3gZtsD0cSxPkD26AOtyZEHxz3/oWTwMtgdIOLAgQgTxwcn2Afj9TOVKDFm74YMLWvSF+i9wlA0BSWokQ4VBiMJuF7yjA6Q31d1ZJdMCqB4CIB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4123.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(83380400001)(86362001)(31696002)(2616005)(6666004)(956004)(38100700002)(4326008)(53546011)(508600001)(8676002)(5660300002)(66946007)(26005)(66556008)(66476007)(2906002)(31686004)(186003)(8936002)(16576012)(36756003)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGE0OVRud2pmY2VsMDNFVGN3YmM2amZhdGVwSTFLajh0d1JlaVNFM1lMOEpZ?=
 =?utf-8?B?bXZzSDU5SDA5MWg3Z0ZueTBKenU2bHl4Q3A2b0o0d2hrZ2owaGxwYmszZ3dj?=
 =?utf-8?B?VERJcVJXaUo5dmVOZk8rRDN2QjdWM013SFB3dG45Uml2MjNmV1hmbzlaclpL?=
 =?utf-8?B?WkdhSWhJNVd4Tk5kY1pJZllhOGp6RTdKYmlZNlVHSk9jbVB6WnZIM1d0S2FZ?=
 =?utf-8?B?UGlrL1dZak9uZm1uZnh4V25zVWovYU16SjJHRHRGRDcxREZBUFY1L1pqbmNW?=
 =?utf-8?B?a09zZWRwam0vTTRDdlBpSXJRdTJUdzRoOEgrUHRjK2xSeUJGMjJjRnBwcVFz?=
 =?utf-8?B?U0JSdi9yRFcyS2tqSXVFUERkRldXUWFoVkFqUGYxMjhMRU5mYWFOL3BqQ1Vv?=
 =?utf-8?B?Y2tUbjQrZ1IyYjM3clBmQTVEZ2kxRGpBY0RJZVVlQ2lYbUlpZ21XTWxCTUM3?=
 =?utf-8?B?Uk1mYUFWemtvL2N3UzhUdllabEx4K0VMcXZOdGszS3JqeGhyaVB5emUzYjZs?=
 =?utf-8?B?SWtQeGJIV3NMemgraUJLVTcrSW1lNTJZL0dhY2FzeXY0QUE1MWdwOFJiVlla?=
 =?utf-8?B?Qm5VYzg4Z3pRM2QxY0R1Nk1leDZZTGhPT0xralNXclQ2b1d3ejA2UUZNMk1N?=
 =?utf-8?B?VVQzc2pXY1FpQTFjRCtDa3RicEZtZTdWUVFnV1JLMDV1Y0FxVy9EY2pLS25G?=
 =?utf-8?B?S2x0WDVIck5QOS9SNCsxUXFranE5RENoaDl3QTAxbk9TbkpGVCsvS0NxVmNY?=
 =?utf-8?B?MTVRaVdZS1M0S0VpVzg0RXlPb01tUHY3bGIvTnRhUmVkdjNLYTRuTGpMbmdz?=
 =?utf-8?B?Tm1hS240ODN0VFcwclVuMTJUSm05Zk5KbGhjWkVXdVBWNnNpUlRRazB6NHNr?=
 =?utf-8?B?eWxvN3ZTUXVuZWRpNUQ1aHFiaXVzQWpLRDFOK2hkSXNpZyt3em4vaG5zdG1W?=
 =?utf-8?B?K2hTUk9mQUNnWmlJc3g4VWp0cVJkc1F6OU9BZzFzNWF2OWR3aU9xUU9CMjln?=
 =?utf-8?B?NlByMGtrMmk1T2JqLzRzelQxZzdFSE1EQ25BZ0NseSsvdmJKc2dzZ0FGK0FR?=
 =?utf-8?B?MUM4M1hxNlA4cldnVjkzYjd0Z0NMYlIzREN0Y1BEWXgvTkt2V0tpblMxT3gx?=
 =?utf-8?B?WmxoZFFLUFpla21lYWlTQ1JPMnF1dGpySkJ3UkptSUVjeUZwYVErNGlSOUhq?=
 =?utf-8?B?ak14MzhvUEs1eDdYNUJSRkM0VzF2bWhtWXdYL3ZES0hQTnBXcFNKbmg5bkly?=
 =?utf-8?B?VGhMdlQwdWdFRGxXZTFUZUxCTnFyVFgxbTJKdUYzVmNiem1SeHU3STFqUFdP?=
 =?utf-8?B?K3RQTlV0MjBDeUpORHdSYWRobFpFZlRWa1hiRlVaS1NNU1ZYSVF1N3hnRnBO?=
 =?utf-8?B?QVJUL1FtWUpYeXNWNHI0NENCa1E5dkVRcXVTdSt6dHV4UXN5RG4zVEh4OFc0?=
 =?utf-8?B?TllLeHoyM1orRHlhTW8yWmR4OGFPcmtyOXpIQzVVTGZFdldsTVF6b1F6SGYr?=
 =?utf-8?B?ZjRnekZvTlNZWGZrRVZNZnppaFc5K0tTcGNiV0JyaXpobmJFOEFKNW9uWkIw?=
 =?utf-8?B?REVNSjhpOHJXbC96Nm93VlhoNFVyQzU1MFZsNzg4aXVmOWZvaWlYcnduWmhk?=
 =?utf-8?B?S0IyYnBsbHZTZVcrZGRzbHo1SDNVWEdYRkpleHQ0dmt3UThlejlQMTNvSjBv?=
 =?utf-8?B?aFdYUXlNbWI1d2w5RCtJQ0dkdmtGbzJ3UW9RQisrVmJSTkQwemdIRkdEUU16?=
 =?utf-8?B?OG1yU2hVTnk2UVU3Z2RQT1MxcVAxV0c5QytnZjRqWEJLTXB6Z1dlSFZVWllw?=
 =?utf-8?B?STI0MlRPKzcwMlZYRm96NSthY1IvbytjcmxzWTRtdHRyVkszZDBlTEM3WjVO?=
 =?utf-8?B?b3N5SHVBVEx3aTlZQ0VLRE9qK1ZTQ0JzUUwzZERGOElRQXAzRHpPQmxma0xp?=
 =?utf-8?B?V0lnMXVsYnlMQlZicVdGOFoxVWd0UmRkTnRubDBpOW1vWmQ3cjFUREoza0R0?=
 =?utf-8?B?V05rRUxVQ0M2ZUNlSU9Wb1RJRERxSzdINVViZGU2Y0IycU9KamRjcEV6c0pU?=
 =?utf-8?B?QU0zK1VGNTh2UG5vdTNVOHFGcXovRUxiOC9xRnYzcnY1R2ZXTW1RMnZGQnVW?=
 =?utf-8?B?ZUYzRU1tY1lkalVJK05ZK3BmL1pqdnZQZDVjVVhHWUFHK3NKMnhTUG5USU1C?=
 =?utf-8?Q?ujnK4jAB4gdzqOivF1fvnlI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5042aca9-cae7-4126-7838-08d99a100c8e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 12:39:57.2006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TAXE6enNUUcklLTYxm9CCYmZWOK2ekQEMFYmlL2ODhtJcK2RTxFoPJD53vPNfZtrptXRk0uKk6TneZ0oDem7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4465
Cc: alsa-devel@alsa-project.org, fazilyildiran@gmail.com,
 linux-kernel@vger.kernel.org
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

On 10/28/21 12:18 AM, Julian Braha wrote:
> When SND_SOC_AMD_RENOIR_MACH or SND_SOC_AMD_RV_RT5682_MACH
> are selected, and GPIOLIB is not selected, Kbuild gives
> the following warnings, respectively:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_DMIC
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
>   Selected by [y]:
>   - SND_SOC_AMD_RENOIR_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_RENOIR [=y]
> 
> and
> 
> WARNING: unmet direct dependencies detected for SND_SOC_MAX98357A
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
>   Selected by [y]:
>   - SND_SOC_AMD_RV_RT5682_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_ACP3x [=y] && I2C [=y] && CROS_EC [=y]
> 
> This is because SND_SOC_DMIC and SND_SOC_MAX98357A are
> selected by SND_SOC_AMD_RV_RT5682_MACH and SND_SOC_AMD_RENOIR_MACH,
> respectively. However, neither of the selectors depend on or select GPIOLIB,
> despite their selectees depending on GPIOLIB.
> 
> These unmet dependency bugs were detected by Kismet,
> a static analysis tool for Kconfig. Please advise if this
> is not the appropriate solution.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  sound/soc/amd/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
> index 56e7c079deac..2c6af3f8f296 100644
> --- a/sound/soc/amd/Kconfig
> +++ b/sound/soc/amd/Kconfig
> @@ -38,7 +38,7 @@ config SND_SOC_AMD_RV_RT5682_MACH
>  	select I2C_CROS_EC_TUNNEL
>  	select SND_SOC_RT1015
>  	select SND_SOC_RT1015P
> -	depends on SND_SOC_AMD_ACP3x && I2C && CROS_EC
> +	depends on SND_SOC_AMD_ACP3x && I2C && CROS_EC && GPIOLIB
>  	help
>  	 This option enables machine driver for RT5682 and MAX9835.
> 
> @@ -51,7 +51,7 @@ config SND_SOC_AMD_RENOIR
>  config SND_SOC_AMD_RENOIR_MACH
>  	tristate "AMD Renoir support for DMIC"
>  	select SND_SOC_DMIC
> -	depends on SND_SOC_AMD_RENOIR
> +	depends on SND_SOC_AMD_RENOIR && GPIOLIB
For Renoir platform, DMIC driver selected for registering codec dai with
ASOC. No additional functionality handled related to GPIO.
Do you still see necessity adding GPIOLIB dependency?

>  	help
>  	 This option enables machine driver for DMIC
> 
> --
> 2.30.2
> 

