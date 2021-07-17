Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5583CBD95
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 22:16:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D20916CE;
	Fri, 16 Jul 2021 22:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D20916CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626466604;
	bh=KlNp67PTASHLVv0m+YWNsJLP5yxsidmcEGguxNV1DHE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n/HaQH/zNiX3UY8AxVd498oBLufpxX1K7Vbvp0IP/A9GN1+UX6O7Pn0y3Wxd2Zc+D
	 oWE42luAAceHYMJ05OJJqk4pLzLkPBygoG7wfvZFWP3GJpTYCXz3mQF17YuttKD1OA
	 IjlqJbGlh6iDhFXPeH4PcEFgXeNhQK2PI21+J+Do=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A948F8013C;
	Fri, 16 Jul 2021 22:15:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41C0FF80254; Fri, 16 Jul 2021 22:15:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2059.outbound.protection.outlook.com [40.107.100.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C00B0F800FB
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 22:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C00B0F800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="yyJMyDzx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEzpEJDpJyvfQ8ET0IJVbzbmJdb8ZpM4SpybR+ng6j4F/gcadT+c9FWvef9gxzca3JnyKRY8me17M4/T97OVhERUbtO8LvFD8RvJJPDeY5S0NBQ+v6EjjzZfHnhRIGnOT8HZtGMhU7dBmeDcnoxUi9uWtg1mCnZIdWiYbcO1EWz1qXruz/zmW8/NHcE0d8WqeWZXXNHKoC+z20gpht4NoY373YovtqOlmJoPn3tscxT/v+qQunMyE6ChfNki0RjylfGBeMwOKmPOuTy2m2A3zXkXGthjK97NZ4Ol4aiI/8sKdUvDS5ifjJJnabjFJU9uHgCvugBIp4cwKDjtm1/5Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKp+/1egWXM1737FBZIzdcDWoEgu92MkCemU1bC+fL8=;
 b=eaYDCfGy1gxij1K6Lc+k3rxdAzeUv6FQ24wWqlz7Jq3UPi5PayuCbblPrTDel+74YgrQqmEFfEzjWgcps17820cQjP/4ptXDbYodN2xLzbIg9PvcnG+muTTXpti9N7K/F/4GKXNrQegpPyd8dWgWt6/soHiZPmpxMOFhTmN59upEYSSYO7y6FjwihU/zGH42AT4DYVxddy0qHmnm13kkO+1LlHJkF79fqojYjmp4oXcWC9zz9RRrWCfyTBrPJcOtNW54kCnQcKVy0KKDFKSrabx4Dt4YQR9jE3uvlaex6TpYVbC0QcUIMduJv9H0rP/j5idP5d7j2aHxglink/tAFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKp+/1egWXM1737FBZIzdcDWoEgu92MkCemU1bC+fL8=;
 b=yyJMyDzxA/nZufxCwz/Ctx/C901rZVVDCQwu6IqGKWvDbJuidCcPBZex2DBPVURNWgTIyWgwG5kuY9ynNFFL9cFHtTUstPytfEPVMAaaspSMP13PnZNDL8p7IqtbyDPykQpqi/2HtSF3hojeA/Quwrp4a6xFk8rDCWpLogg3JKc=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR1201MB2558.namprd12.prod.outlook.com
 (2603:10b6:300:e5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 20:15:07 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4331.026; Fri, 16 Jul
 2021 20:15:07 +0000
Subject: Re: [PATCH RESEND V2 00/12] Add Vangogh ACP ASoC driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
References: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
 <5673f620-fec1-d2a3-0b78-a1cfdda04acd@linux.intel.com>
From: "Mukunda,Vijendar" <Vijendar.Mukunda@amd.com>
Message-ID: <ff857faa-c8c4-0f73-4ede-f8f3ded4e923@amd.com>
Date: Sat, 17 Jul 2021 10:04:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <5673f620-fec1-d2a3-0b78-a1cfdda04acd@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::35)
 To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.129.9.28] (165.204.159.251) by
 SG3P274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 20:15:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4f6fdf3-c14a-4424-ef95-08d94896672a
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2558:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2558CAA02D6907AFD547B63897119@MWHPR1201MB2558.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XJ97xvi5vuMoqEyFZpUZcRxAqV7PbCZWqlNw1r7m2hGkF5NQauXmj1W0T0HWhnpNmJnSGc9o1sG45EBvZpCsrrLm59O5eeMNee9pny8o/RQoDgEFSKBLC2C3Gsrpe5X2BkMEqlNFLpSMnhrUmAzKIUl74y6ZNHux7OHrD1D4WJgt7cxkysOKGwmbqIFoGp/QVi2rtVYRGk+zywFxkDSXSyxKfaB7sni1mmqui9gazJ7sSQDIsyF+yGO9y25D9q+rECu7Obku0ybfzWBEgs0k+09FbFsrjvjJwWjdfeiMBv3AbKzKJXSmN32MdXuMevsh5+0HDGqzanWC6hQXsFta0t19LxYqe3qAbQchhAM6fYPXBV6VM1TrAfqEfj0YARoDu4GzhKhKSaXbuIJiGBwkn5cEQuTGvNZ1RGgyFMy5ItMKMU4bXDJMRFTpTJsMAsZ+OOLRHEjYkNrAtvcMu6kJ/cNCe26FJHcNRz1DC/yT0KvWIT6oRBK4TGdIY3DaOwfnTbQdv3LmQ/mrc4+n8LYDEge+Cov7Zac/V9c9A0IlnvljxeVi035KlO2g1p/n24EnmF6nXcYHjiZuAy8UhymXv3VYRf5sdcFx6ZlrPCGCpiEftkrldQSglTrb0HX2tfeXVMWE5WFPHBGwlAvSpIvnLxe5k15dk3HG77oNSensNF+bQHrFggw2Rwj3zyow6qvXrgUnRFvOUEmeKw6M+5we8afbgsh9YRUNeTLgzjoijS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(38100700002)(31696002)(86362001)(186003)(26005)(83380400001)(53546011)(2616005)(16576012)(66556008)(6486002)(66946007)(66476007)(478600001)(956004)(316002)(6666004)(36756003)(31686004)(5660300002)(4326008)(8936002)(8676002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajJEV3gvWFVrcDF3YzBpbDFLUEhickNhT3NXSmRVV291ekhTbld4VWk5Q0xH?=
 =?utf-8?B?OUJ4Z3RmZ0pmWm9oSmZzYTNsN3AzcUtsVm9hMklEWUV5Q3YzaVVjQzJ0WGU1?=
 =?utf-8?B?dE1FVktwaW5BQllVYjlZQlJxdmRTQWc3SEJacHhla0FwUDNYNWlvbmtuNDU0?=
 =?utf-8?B?eUUxYkJrdW82K09iM0ZWSTJEQ2g0bjFTZWlHTjN2NXZGRGJhSjY2clZQQUFl?=
 =?utf-8?B?RnhkZU9Oc2kwL3k5VE9wV3p3ZTUvTkx2RW1ydWpCMmpNM3lEcHpqL2o5Tmpa?=
 =?utf-8?B?cXhnWFJKVjBYK0hnV1BCQXBVYmEvSVZuV1NkMy9GTzh5QVV5VVlySk12L1cv?=
 =?utf-8?B?MEdLVWJQRUhoZDVvTEdtaDdZekVlaHEraUJHMUNSbzlLWmtoeVczQmg1K1RD?=
 =?utf-8?B?VlhBdkw2VUdWdkMrUms0emVWSG9HZ1Fydi9vWDlSMVlQbGZ4Nm1qNFg2cTJ1?=
 =?utf-8?B?d2ZmbzNzTlRjMUk0UjU2bGZGQXFFTGJDZWtvMTlWbGtiRi9jcEQyVkpqcFFj?=
 =?utf-8?B?VHNDdkZ1ZzVtYlJ3ZklxYWtOanU0YmtFMzlpamR6TG1oeXJyWEdZMVFpMzBj?=
 =?utf-8?B?ZEFDU2kvRktYR0U4aWljaDRWakplbDdZKzF2Q0FWMSsyTHAzRzZscEl1ZWN4?=
 =?utf-8?B?ZUdVQWFtQ2pCZ2lkWG15NU1EbWlqSmwrUWRka29GLyt4dkU0OGtlNTlHY1Bh?=
 =?utf-8?B?R3NPbzVvUm5ZanlWYWFMNWZDZWhyQjIwd0RtakhpRUE1TU96UUJuc1RJaWpL?=
 =?utf-8?B?c2M4Q2xjMmNZcEpZcDZWbWZPc0c4ZnFhNmc1SnJjWXFQdWZOYXlUa2xpd2Fu?=
 =?utf-8?B?S0JaSmhkeEtNN296cEM2aGdPOTlWM2xvdmRWSXZFbnMyRFF1cTNnRHUvMjBa?=
 =?utf-8?B?MGpHV3RpbE03LzY3YkVoTHBwM1pReWJCQm04V0ZzcFgyMFd6UDBMaFFWTkdU?=
 =?utf-8?B?Uk84SGVEZFUza3lSRkg2RCtISzMvNlVGMDJtOHRrZVh4WlIyekVwNEk4OWYy?=
 =?utf-8?B?amdsMHFEMXd1a3puckE1a2l1VmozNS96WTBvcitYbXBNMnZYNExNWGIzV3Iv?=
 =?utf-8?B?alB4SzJzRFpOVi9helVMN0FUWFRBczZLcFJTMXBVUFlldzNnSGxEa283b0RH?=
 =?utf-8?B?QVZGTDB6alVsMkpQTlErZ3NiL3c3TVpMbHRlSElDUXpuMU1SaFBoS2xZMk8x?=
 =?utf-8?B?ZzZVS01IMXhQRWtGYURwdGw4b3hMMzlBL2lNM2gvVWczUWt1WnBNbWY2cjZ5?=
 =?utf-8?B?Nnlvcmwza3V5UDMzNXZzcVIyZDFvbkZZVmhkdXNMMUsrUEdDNWoybzhCUms2?=
 =?utf-8?B?VFk5em40MXR4REJJd0JrUGgzSEV2eHBlYUd5K0V2ZUtrOG1kUytpQlBtb2c3?=
 =?utf-8?B?UU8wZnlGU3lnMS9lb1FpTWp6T1o4WXRjaVhpbThJZUlJYmJ4WWF1R2JaTnFC?=
 =?utf-8?B?ZTdsMkdJZ3RpR2d6U1laZ1BWQUVROGhlQXlKeHNkemQvcmsydjdVY1F0M0Rp?=
 =?utf-8?B?MFJOazY1ZEl4SlZGOG9DN0R2clphZ21QQmdUbUpHdHFTdElMR1dSYWlyOXdx?=
 =?utf-8?B?anJJOXl1UW1LQVRHYUZrdHIyeVNvd0U5bkZzWXNVcTA3TXgzSytITnR5Tmw4?=
 =?utf-8?B?SHdDOGUwbjVaUGQrdldoTEVpSXlwZFhEMk1UcXY1RGxxanp2bkpXSC9KdDRC?=
 =?utf-8?B?b000bWpqeDdldG1JR0dMckx6SHNXRy9oZGlvSUdIaDQ3Mkk3bVlremJFbTRN?=
 =?utf-8?Q?aavTrXCrkXQ6wRaG5MMprgsN2NSE2c51mKqonZJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f6fdf3-c14a-4424-ef95-08d94896672a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 20:15:06.9654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/SzWCi8emhZ4RPYyo3K44ON92qdXsqolmI/8Ny46513mg1iUh62smLJSqjfZpeL9fRNsVtsOg6TCWvsWyLN8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2558
Cc: Alexander.Deucher@amd.com, Sunil-kumar.Dommati@amd.com,
 krisman@collabora.com
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



On 7/17/21 1:22 AM, Pierre-Louis Bossart wrote:
> 
> 
> On 7/16/21 11:00 PM, Vijendar Mukunda wrote:
>> This adds an ASoC driver for the ACP (Audio CoProcessor)
>> block on AMD Vangogh APU.
>>
>> Vijendar Mukunda (12):
>>   ASoC: amd: add Vangogh ACP5x IP register header
>>   ASoC: amd: add Vangogh ACP PCI driver
>>   ASoc: amd: add acp5x init/de-init functions
>>   ASoC: amd: create acp5x platform devices
>>   ASoC: amd: add ACP5x PCM platform driver
>>   ASoC: amd: irq handler changes for ACP5x PCM dma driver
>>   ASoC: amd: add ACP5x pcm dma driver ops
>>   ASoC: amd: add vangogh i2s controller driver
>>   ASoC: amd: add vangogh i2s dai driver ops
>>   ASoC: amd: add vangogh pci driver pm ops
>>   ASoC: amd: add vangogh i2s dma driver pm ops
>>   ASoC: amd: enable vangogh acp5x driver build
>> ---
>> v1 -> v2: fixed review comments
> 
> usually the version number is at the patchset level, here you included v1, v2 and v3 patches and all but the last one use the RESEND prefix?
> 
> is this intentional?

As We have respin the patch series, we have updated cover letter with
version as V2.
Got your point. Cover letter shouldn't have any version number.

We have updated patches as v2 version with fixes.

It's my bad. For last patch, We have removed extra stuff which we have
added earlier and marked patch version as V3.

> 
>> ---
>>  sound/soc/amd/Kconfig                       |   9 +
>>  sound/soc/amd/Makefile                      |   1 +
>>  sound/soc/amd/vangogh/Makefile              |   9 +
>>  sound/soc/amd/vangogh/acp5x-i2s.c           | 429 ++++++++++++++++
>>  sound/soc/amd/vangogh/acp5x-pcm-dma.c       | 525 ++++++++++++++++++++
>>  sound/soc/amd/vangogh/acp5x.h               | 192 +++++++
>>  sound/soc/amd/vangogh/pci-acp5x.c           | 327 ++++++++++++
>>  sound/soc/amd/vangogh/vg_chip_offset_byte.h | 337 +++++++++++++
>>  8 files changed, 1829 insertions(+)
>>  create mode 100644 sound/soc/amd/vangogh/Makefile
>>  create mode 100644 sound/soc/amd/vangogh/acp5x-i2s.c
>>  create mode 100644 sound/soc/amd/vangogh/acp5x-pcm-dma.c
>>  create mode 100644 sound/soc/amd/vangogh/acp5x.h
>>  create mode 100644 sound/soc/amd/vangogh/pci-acp5x.c
>>  create mode 100644 sound/soc/amd/vangogh/vg_chip_offset_byte.h
>>
