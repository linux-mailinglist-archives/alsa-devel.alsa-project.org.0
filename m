Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BF94CE55B
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Mar 2022 15:51:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D519318E1;
	Sat,  5 Mar 2022 15:50:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D519318E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646491875;
	bh=tUAn8pS5hpAKu8ukkYuX7SbHr15ikLLYKxKZA+CcigM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K3LELSY9e0aIpcqfTDXn1jT/gTpBGZfCADNx+TOQZacy0n3YlrzbBKw+tHd7YN4TW
	 cWGNBgjWvN2EOEKlLIBgDlzH0+lhefEDZXqB/Y6WfG9EjM3dKpuV9Jnqh59JVKN9PS
	 OjA8FS3IKuI/6GvDlwvkWGWQWJ6Qqa4GktP8Iiug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 405DBF8025D;
	Sat,  5 Mar 2022 15:50:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20270F80237; Sat,  5 Mar 2022 15:50:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F398AF800D1
 for <alsa-devel@alsa-project.org>; Sat,  5 Mar 2022 15:50:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F398AF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Ccr3dqkN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qt1XcMD2jGi6F+88bndGAaFFLx9hGcZaEXvQy5yMWSuGRnJkdWSDUavw+qXtz84L8tUgWyldXlmQnWht4H6YKdHKp0fgIMMETYQBinufQOVh6Cxp3U82VmA4Esyay3HrJtamRklcovBtv589zs5A3X3TsKHjyn01iiVtLgVNplYYSjHTNOvfTjRCEBKkkenh1Koc7Zrz8cCCCIpzsebxwJhuF4I3Fa6zPcH39L9BwdGp7BVi6kyM+qTFq+DszcQbdBAed0y+QDOVF2ir+Xoen3ob3hVJJDLqDDu9hjBCkmBr9CqogsJRHgLHr056lcBhkEZ4SFXyFECp8azw/KeF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUFlAGqzshl44qm0Q7adnY53+QIYpVsPpqd/4Q4KVjY=;
 b=QsrQVgfLTOpCiuxS//zNBQlCGbNWwTtiJgbXI4VZXRjx9R5wqktvXke5yIfqfuE5JAmSzmouBS7FZltJlqzMCNPguwKQwy/GPsripNG28bGBKeIxf0KBFmhBRfeTAUBjIbb20gGshNhJJ3jCoiYUeM/CBXKgGuhmNH0ygqHhN4XbQZ1qEdtMlwro48zSwsqBUm4m+3X72fkvMH0y45niKVj7ccDk0b8jpY6mDuHPgVu5oaEodEegA2lfMN3VjvoOd0l7rLycmYu7y+QTr/e1SIZmY6UVmyOPQJnUrxkTAFxFxmGrekCRck7im7nZZ8+xcEpFLUJjuhDVeRgJcV60eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUFlAGqzshl44qm0Q7adnY53+QIYpVsPpqd/4Q4KVjY=;
 b=Ccr3dqkNvWSapiiPUG+5cp/Bh3E/EcdwuIAaUTy0iPgPFnU+OPW0tmUjgeEvLlv5e3vNGnrWE8TSgmWWWwAHnX0BAaXj4Y9uR8FMCBfTUHso21H4pQWDLc1xpz3QrpbEI2FrTmullXriejwGRBnTjBs42h3HnmOxuo/vdUlqNvc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3627.namprd12.prod.outlook.com (2603:10b6:5:3e::18) by
 DM4PR12MB5232.namprd12.prod.outlook.com (2603:10b6:5:39c::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.15; Sat, 5 Mar 2022 14:49:54 +0000
Received: from DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::f02e:2787:708b:344b]) by DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::f02e:2787:708b:344b%3]) with mapi id 15.20.5038.017; Sat, 5 Mar 2022
 14:49:54 +0000
Message-ID: <9dcc09ec-a796-b52a-779a-52d4c388fa27@amd.com>
Date: Sat, 5 Mar 2022 20:19:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH -next] ASoC: amd: acp: signedness bug in acp-renoir
Content-Language: en-US
To: YueHaibing <yuehaibing@huawei.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, tangmeng@uniontech.com
References: <20220305123519.26788-1-yuehaibing@huawei.com>
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
In-Reply-To: <20220305123519.26788-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:18::16) To DM6PR12MB3627.namprd12.prod.outlook.com
 (2603:10b6:5:3e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c08c5432-17ea-4cff-f03b-08d9feb768c9
X-MS-TrafficTypeDiagnostic: DM4PR12MB5232:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5232C56F1C6C596C38337FEF82069@DM4PR12MB5232.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: arum6bSPJyaKapoZoW9Spp4R8L1cvXl3C+hbB+8wM+fs4QQNfqPyftI0E0+G6jfz01Qco6PP0aoW1pOS08eqJAbN8a7GeK4h1efr8YWC6YDmByg5nv0BgrCuHtuHw847JzChQyVT+P+4j4bhODTtc3543OEkE3whpibig/IWRkFvnFYsWhH0jMXRO8S4bude2GmhRv3puI8H13kvWtA13baBmp87lncMdpZWqpfvHHwr62Mvium+kKrn4kW1APpngt4uqhBZnbyVMhMM1CXdBtLvRUeQmalNfgtNaQ/xR38u/7ybt16Vcce1dubZQYs56T+TOa40yZMYexATrFbMG1I0Pwzm/Q6wmp+XgCJn3N0TYM6eSanJS+65Zlwm6qk5JxaZ9PUE7I0uqpPQgdqG+tUcam2x0SsRsRm+OpYAkurTZJAGeUvUcuirxBuYXIz9y9YRoGpHvk5Z/klcPELiRg2soZnG0BwVKTm3R9N2SdRj3g3PmLTqtJE6qN2WEqA1iouWjAGKry7SznuzskLR3odkZz0jaahNd3iYuPfL/utNeHTkF7snZ6u6c85rhfUKEw/S7tfdONp8nXPzoH4LIuOPNC7WSJi6AVoeZCP75tbsO8voWSgHx1Ci2P6qygV/MKJD+I8ZMqWhSCxepPiduav+DE3NXwrrQwt9s1iezVAC5jI+nujbmnmwF7GgE8qQbRyDiW8EkB2+q7Nj0HGDNlv/ibllPtV0eNffUQM8dtu9UwDPXuHdqOouXZC9KUMBEeE2NT3iLm2ziuyIucsvU68G7VW2FQ7ljwrr/YosHh27BNyDoiusfZ68Yw1jzlSzxTf9b6yD3kpBdHPdVWX3aA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3627.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(53546011)(6506007)(36756003)(508600001)(8936002)(5660300002)(2616005)(38100700002)(4744005)(66946007)(66556008)(86362001)(66476007)(31696002)(8676002)(4326008)(6512007)(966005)(6486002)(26005)(186003)(31686004)(6666004)(316002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXFQaFI0T3ZVMWxocU5acW1JdGxkK3pVSk85cVovelFRM3JTZTJRajl4Wm9j?=
 =?utf-8?B?a2s4aVJTaThwR0FzQkRqakRUM25EMkRpeUljOHRsUjBxcU50TStkNURralRZ?=
 =?utf-8?B?dVAxbU9lTDZqKzdYMkhNRkRDUnJzYUxVV1loQ0YyOGVoYlJzM0lkeTA2cWFV?=
 =?utf-8?B?OXZKVlhaNVRIaUN1aTRQWlNvTFAzMmZaMDNOeGM3MDkzcXRJL0dQYm9wZXFK?=
 =?utf-8?B?ZExxRklWT3VuSlhqSlBuazNvbWtqc0l6c1NONjhTa05McEtaaWRDV1ZwWHlm?=
 =?utf-8?B?cm9WekZKMnRKS3JTYzBtbUUvRHk4VGx4UGpNREt4Ny9tcU0zWStOM1lLN1U5?=
 =?utf-8?B?bFV2ekZjaEtZemhSUlIvc3hKTGhZazdCRFVPWllqeGVrNlY1YTdiMG1UdU5s?=
 =?utf-8?B?Vng2QVIrRlJ6OEFYYnRLMWtMdGRvTEZ5ZzlwU3o4N3UzMmZjQXVQeGpMMFhD?=
 =?utf-8?B?aHEyY3lDaU1yZFNldTg2Z0l3YThYNklTWjc3NXl6VnJpOTZEb3VHQTVoVElp?=
 =?utf-8?B?Vkpuakk1WXoyNGxlWGE4Wi8wNytXRXFzay9nUjQ2S2tXYnZ1UXVIelZ3cVM2?=
 =?utf-8?B?N0trdi9NK2R5K2JvM2tTN0pZYjRPSE8wLzhReDdnV3JJT3BveDRWa25aUkps?=
 =?utf-8?B?dCtwd0tFQ3NmelBSa3NuRVkvL1BwWnBIY0ZITU9CRVBTNDVxMitZRHNTeHhR?=
 =?utf-8?B?UHVxSGU4c0pucmZUeU1tdUk0MFl0SmU4Q3dwdHR6UnduUVd5QUl3VFRHUFl2?=
 =?utf-8?B?R0N3aGF3WEdjbE1RM2hIK1ZLV3ZXTDBJT2QwdURPY3NzYUtqQjVzTVZYaFl3?=
 =?utf-8?B?Q0pGOGpneFVZY1RmOUhOcUtYcEVybUNEUlNEUWdGVlBtYUdjVmhwRXZQQnFN?=
 =?utf-8?B?SWRPa24ralk2VnFIS1FBQi8vVnE0MGxZWmxIVmJyU1RmeElDQ2gzdEtUMmlr?=
 =?utf-8?B?bVJZT2hBWUszZlY4WFFuNEFGdmRSdllERFB1c1RBMS9aWmp3cEpnNVZja1BI?=
 =?utf-8?B?WGQxczB5VHFEV0t6Z0lscENVdFQ0Q3JJSjJkajZFUTJ4anN6cDdMVWE0UTVI?=
 =?utf-8?B?eU1KSDl1NnNzTzV5Qm1kOTczaDJLbDRIdVFjRVJLK0l5MXR1ZW5QM09RQ0Ra?=
 =?utf-8?B?T3pJamxOZTQrZCtjb0laR3JqNkR4SnhyaUZzYTV5VFZhRloxVWJDTzVTRlRG?=
 =?utf-8?B?SGovS2pzMndBczk2K2c1czRUNlZnNE1rVFdBck5RT1o1cmttdFp0QUtJLzky?=
 =?utf-8?B?T05wV1Z3WnRyR05OZFJHNThKYitIZFN4bTJHMmdLdE9CWXFYcE4rWUxvU2I5?=
 =?utf-8?B?a2lIOXZpb3c1TWl5bTh5Qjk5aitURXdFNldUWGZ6aFhtMjZQbXFNMVI4NGtS?=
 =?utf-8?B?bEpRMjFmMnNsdDRRQ0JObGRlMXp6VGRxNDVwbWtYb1hpUWlzK003NGRjNFdY?=
 =?utf-8?B?ZjRNb0JRbHNraktFTGtxd20xWkRDRGovOWhBSzZacGtRVzRkUjZrMW1IT1Nw?=
 =?utf-8?B?OHRxU2pOcHp0QkMyckF1Qi9EYTMyV01hdGQvUzhNTndWZjNoaHIvM3BPNHd3?=
 =?utf-8?B?QVpRWkRNT2xVTHBoaUE1cWxmbGd4RzJjaVdRM3gyQ3YwSWR4blZXK1pZSU9X?=
 =?utf-8?B?VHZxdFRzd2hkdjZIR3ErOFpHTGpadGV6SW5CK3g1UUVUUnR1b2lMWmtHUkRW?=
 =?utf-8?B?QUpET2lhMjRud0E2Z1kyM1NDYzlzYkNQVHMreis2bUFkb0xQUEZOQnpmMEZT?=
 =?utf-8?B?Z3c5VEY3U1JtK1NRN2dVZjd0UmlhR2xoMlNobFUrdVBSb0hudktXeVJEK3h1?=
 =?utf-8?B?RFBYK0xxNWZNY0FGcER2aUZVVnV4NlBlVFdITlZRc241cW1meUlDZVZqbzJB?=
 =?utf-8?B?b3hjVVRBVDRReWVCUVpIU0RJb09OOW9wcDRVdSttcm9zaWJZSStVZ0dBWDNQ?=
 =?utf-8?B?Zktnc0ZlWHhnKzJiSWRIeWtudXM5QkJCUVVaeXJtbFJjcFpSODVQQ2hMTllW?=
 =?utf-8?B?Qktydk45QXRiWFcvVGFybnlCdU4zdEwrRks3Uk82N2dOZThPSjFtdHd0bXlD?=
 =?utf-8?B?V3Z0bnFuTDgwZWg0TmlDVkZRYUxGQ0VxcWxnUHpDN2NQL3R3a0JTZXdiNjdP?=
 =?utf-8?B?bUFVSTNTa3o5clpHT0ZRbjZ1SUgrSmtRakdRaG15NXB5RkpDMWUvSXVJYndp?=
 =?utf-8?Q?VEEVDzRU+H5lwAn1xoZAPJ0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08c5432-17ea-4cff-f03b-08d9feb768c9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3627.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2022 14:49:54.3920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LQ/D0208F4XZyrBiMBsF2d4ldQytcdgVbRx/t+3U9b6iQtFhyLLE5jW3h0LPoGPVL4wdiRdNa+y/VOBWbsCkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5232
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>
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

This error handling already fixed by Dan here 
https://patchwork.kernel.org/project/alsa-devel/patch/20220304131449.GC28739@kili/

On 3/5/2022 6:05 PM, YueHaibing wrote:
> [CAUTION: External Email]
> 
> In renoir_audio_probe() platform_get_irq_byname() may return error,
> but i2s_irq now is unsigned int so the error handling is never triggered.
> 
> Fixes: 3304a242f45a ("ASoC: amd: Use platform_get_irq_byname() to get the interrupt")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   sound/soc/amd/acp/amd.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
> index 8fd38bf4d3bd..acb50d9fca58 100644
> --- a/sound/soc/amd/acp/amd.h
> +++ b/sound/soc/amd/acp/amd.h
> @@ -96,7 +96,7 @@ struct acp_dev_data {
>          char *name;
>          struct device *dev;
>          void __iomem *acp_base;
> -       unsigned int i2s_irq;
> +       int i2s_irq;
> 
>          /* SOC specific dais */
>          struct snd_soc_dai_driver *dai_driver;
> --
> 2.17.1
> 
