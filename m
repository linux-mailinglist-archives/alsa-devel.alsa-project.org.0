Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CC83D1E6F
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 08:43:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 241F4169E;
	Thu, 22 Jul 2021 08:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 241F4169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626936231;
	bh=zCZ0n7qLZuLWYbT5zMUu/VdJsTylGtHG75leSIWJLhY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CQYcNsLYGBZ2kKIyh72Y+gDi81tGrdkP+w7t7Z6YcunfkBOCpYhytuu7Lqwr5IIxL
	 +PeGxJtqlCj4KnA/WLLfSIKWk3kq/SU6v3ETRhZbaD24hrPs3Clby8W3+0oM4BE47r
	 ZUieRb6M3+ARK6fW2+XX6GzT+AMareT98r2AtRlM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C4DFF80256;
	Thu, 22 Jul 2021 08:42:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E322F80227; Thu, 22 Jul 2021 08:42:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC86DF800DA
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 08:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC86DF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="kpSQ4Q/U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTl2rFT4x4zpL1urVnFrLoEICEeZmwxm4xpe4bNCVKK56oXeiweOtq2OOzhNnZKAPIOcCbYxjcGTjDA2h0EX3Pns7PhErFWqJKJOHKmmZg6/2s57Mh1Hc5WekJyGaWa90hNbpozWbfzjSYx37mZkuqtyXP6TuUewnO6IcCw/6XQDFSA5NulCPmdD4Humyowa2TswjuLlZgoBIwnGjXOoAn5IdqhFdnChTiwi4MF+55qzQDsu3qPBDcmfNLCsy+7oqyfVYtwYEwTMZN1tVtv1x3xfNP6O2lgzUF4/E4j6nPWd2KRY1XMDzlJga8E+erJS2Kg63pUE3BTt88ROfeUKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5O6LSEQ6pghWMCoGDNW9cDKL5h3ofKMhgiMbrNtDO0=;
 b=AClbNjdgDyL8eZDC2485x8nbcBSKwtJc9vbpklPVmQGlWTS/npvb+D6oue+T/5thuTuIwYwzzNNktpbUtulELUPnY70pzr/Z/G9+nPj4kEHbw4yRelgP2VYzRvCmYGWTffGGaWCzjei30qw5TPJ01lgoQOBEFP80V73AT0DWJtebq5IPWesF9lMP7VkAggJkG3DYEPTWe8zGBt7z0TM4/a+MvGmekrdcOJ+lcPS72H9uq5bEoiKTW3J5xwSWDosVoUVdmzkaxea/jIJQ3sfewMkeVN6QKN2zBYmw6J0Q7tC/OT3RB3xRX2djBxyV+2uYrdSPx9c35MdenypH/PazWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5O6LSEQ6pghWMCoGDNW9cDKL5h3ofKMhgiMbrNtDO0=;
 b=kpSQ4Q/UkZuIrkT4enyNn2SDtSCGwATBU5fv+RyyV6I3NWZYwtzDv3hVAFPvWhnsdFqf8NKZnoGddFCs0D8kC7WXeQW6YWbeZTV5jc99dZtJKWpSO5Fq3aE82voga3wCZZeuDgIUlAbflH8ppAcLFf+wcl0aagWd2sTDOHbhOIo=
Authentication-Results: lenovo.com; dkim=none (message not signed)
 header.d=none;lenovo.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR12MB1645.namprd12.prod.outlook.com
 (2603:10b6:301:b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Thu, 22 Jul
 2021 06:42:10 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4352.026; Thu, 22 Jul
 2021 06:42:10 +0000
Subject: Re: [PATCH v2] ASoC: amd: Don't show messages about deferred probing
 by default
To: Mario Limonciello <mario.limonciello@amd.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>
References: <20210721183603.747-1-mario.limonciello@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <d646f9ba-966e-0faa-0eec-8c8d2a4aede6@amd.com>
Date: Thu, 22 Jul 2021 12:29:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210721183603.747-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::29)
 To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SGXP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25 via Frontend Transport; Thu, 22 Jul 2021 06:42:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 706427cc-6754-44db-1d61-08d94cdbd491
X-MS-TrafficTypeDiagnostic: MWHPR12MB1645:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1645A9B92BDEF31A7C181F6697E49@MWHPR12MB1645.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:119;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xdxeei1ItbvQa640XYeOJlnQiZ0ZQBAVM4Rtn0aAgG62Bzq0u0ZXwo/dAFX7tMq1qEIbjtQTXWXIw98LLoSi5zBmze7nJytaaA6hyxbatxxWptq1eC/93jmNg4FdBDsA3ODyx2yjfe1+1ne9/RECPiuKnAJe6lpAiftqGn56XNcvIdiq5dYTiJotEKy1HDSj24sZwAdiTYlHgUXkmvYcRwJmXMGQ/BH0JZkbAGoQz+ERZeBIYnkuGjw8dTrx4wjj02kQpB/XDTY/G+z6iX7Qly9HVaoR4BP3Y/T0OH72oOxbQj8turVksVrCu2GbMUCRLsX/XqbybSx29653D0KPFCgSzVfX279I/oCrGBdRIME40a284oKDh5xl6QSdA70vcgXaWZpNt3qjP1bA3+2DW/atU6itQPaN3bES1EZPiY4nFlIxyzRf0Zda6zFUFv/8EZziUsPPeWdrAY6H3DsZy9H/ySZPCKBot3gQGvGM2oalBW9fQvt/EAIonqIAvlsulnHoF1k+/eSr3wWrGh0VP6oioE/ECoERyzp/Aj6akAzaUY8HCkGlbsNq45lwg+OEbrN19vEb2xz0F94sfge2xuNkzoaN9HO3NRFjy6PC9/Jv4gmIsrMLtJ66zY7jQnl9eagYuSqaKJaGU3yvLGz+3NtyPkV2qyFkKaKnJOyroY/lzmx3GWM0sib+SeM1dXvsfsWdIf02VSKK4NyZWJ9co+/KZeu+FVoOmFqpvv5ijco=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(36756003)(86362001)(31686004)(15650500001)(31696002)(478600001)(2616005)(110136005)(956004)(53546011)(6486002)(316002)(38100700002)(16576012)(26005)(4326008)(83380400001)(66476007)(5660300002)(66556008)(8676002)(6666004)(8936002)(2906002)(186003)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3BXc0ZJRkFRQkxUYVF0UkxDNTJUZkNhc3JmUnc1YWVYUUJVOVZ4TnRLK3A3?=
 =?utf-8?B?RXFzM24yc213NXFZS2FVWXAyOHVOMHczL3daZ29CNnprc0pkdEZXTkV5Q21t?=
 =?utf-8?B?andyeC8zUmJmb0ZtdlVRNTM3THRnSGF4dDNFT2hmUU1HcDcrUkNVdDhHNHgv?=
 =?utf-8?B?cWM2empHa1pKRTEwYlpkWkNGMzVpbC9nYTJ5WjhnRU85MkNCMjhRYzRLTW5l?=
 =?utf-8?B?bDhmUnl5NUtwVmx1TWFNK3pCTk9CNzNjby9zTDR6RzlPOS9MS2lNZVJHQ3Jt?=
 =?utf-8?B?V0JMbVRHc3VWL0RnVy82WURUTHFmS2RhdTR4YU1hOWoyZ1VlL3pRbm5DVVdX?=
 =?utf-8?B?WndtMkkwdms3dU5UaXVMUHhnT3Rnb0ZSV2U5enFrRWRrN05aZ0tnT1hxU3lS?=
 =?utf-8?B?d2hsWFNGNXV2RzliTGREMDdnLyt4c2U5QlI5NExraXA3WTFobFhMSTBiVys1?=
 =?utf-8?B?cDRpOGZ2Y2Q1NEF5TjAxT21OZ2VZVE92NDhyK0t3blJRZXJIbXY3VmRmTS9Z?=
 =?utf-8?B?RzRzTE5lcEJtUm9Wa1V5RFVPMjVOcHlOQjJwdnZhcmIvNVVlNjNhOStQSGpE?=
 =?utf-8?B?ZGdHN2pPL3JGaVhjSFVqeHU0dE5wa2xlVFZTQXFRMVhSTnA2bTh3MjBCc3l1?=
 =?utf-8?B?Z2pBaUM2YmlLNjRoWklnbnI5N1A2QldXemNnZ3E2ZmZObGtvajI1QkFwN0F2?=
 =?utf-8?B?VGtlTEYwYlRRMHdTeUx4empjY0lxU3V1bEVINXBVOUp6UmlEeTQ5TTFyQkZP?=
 =?utf-8?B?cGlDSnRaSkJFUStWM2pwYkNLZi9ZNkdsai9OZStFZDNtMXU2a3F4ZDlIMnZa?=
 =?utf-8?B?RVpIT29RSnlwTmJWYm85RnM1R0FmTTFRZFUyejlDeDJrTVZRNExBdjE3M1E1?=
 =?utf-8?B?VFJ4OXlUNjNjU2c1MUNUZS9VaEVjSXJqaU5kV2JHeWw2RTcrUTVMTEY5WGJm?=
 =?utf-8?B?QlZlUEtxd1FnK1VNdExtcER4T3VHK042a1VHY3YzallmcFlSemJ3OUtueGJK?=
 =?utf-8?B?RmRyQjJZTkZoU1dleUk3VVkyNVFGK0Q1dkNHdStJeVFPVCt4NUFrZFRuRUF3?=
 =?utf-8?B?MkxzVFZTYWhWNzQyZHVSRE16YnRVaDRjTVAxSzhHbTU0NEU0dkZETmhxK0Fh?=
 =?utf-8?B?OStlQzBTWllQdld1Z01icUFFdko2OUg4VFZ2Vm01WU9WZGIwNlAzdTRRM00y?=
 =?utf-8?B?Zk10Tjl5blNiQkYwMXZrMHdXRlhJalU0VFZIbFpVWmVTVkVaYVo5UW5KYmdX?=
 =?utf-8?B?R3FoWXVpalhVZTZDZTZlMDNPMnhnK2dnTnRBVnNQcnJ6SHUyYW9OK00zVFhz?=
 =?utf-8?B?Y0MwOUkwQlJjR21kb1UvMFRYdjJETStsN0kvbjhxV3Q1NTA1eEVqT1EvWXpH?=
 =?utf-8?B?ZkVYUXhVbzYxR0ZQS3pMb1JYSjl3VGdiVW0reWJZZDNscEp5c2tTMnZ5MXpu?=
 =?utf-8?B?UitYTDVWT3RvSFR4bmt3RTFkeWFyTXlaVURrVklVM3NxeEt5SENHNHd5Y3Nw?=
 =?utf-8?B?WEFobVdPUkJXOCs4TE9yY0xzVGUxS1ZPT0tyMVNIaDJVVzZvRDlIZ2pJRmw0?=
 =?utf-8?B?VXdoUCtoUFhndTJtb0x1R3c5L2tSbG9EMEdhSnFSaldxVTlkaWlURWpaRU9B?=
 =?utf-8?B?azJXSzJXekVWVzhyMlpIZlRGR2FHeWNzU1BRdGlSbE5XaHVCUFFsUEhmUERP?=
 =?utf-8?B?MGFlQmllcmR2ODFGU05aVE16UVBDVnVydmFlSzNFd1VPVC91Ym8reGVEdEVj?=
 =?utf-8?Q?nkOLUxhHGe2suioDT68ChmR1I3ogkquYMz+Q5xG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706427cc-6754-44db-1d61-08d94cdbd491
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 06:42:10.1113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDKWq2x2crWU4YXV+b8JQ/I+RhhiuzfHNlAhw+IRNKJ/Uh6KHm5dDUIbVAGFQz2hmzfMU/uO+ntn/oBAyzLLDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1645
Cc: markpearson@lenovo.com
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

On 7/22/21 12:06 AM, Mario Limonciello wrote:
> Nearly every boot with a Lenovo P14s is showing
> acp_pdm_mach acp_pdm_mach.0: snd_soc_register_card(acp) failed: -517
> 
> This isn't useful to a user, especially as probing will run again.
> Downgrade the message to debug, and only show errors.
> 
> CC: markpearson@lenovo.com
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/renoir/acp3x-rn.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> Changes from v1->v2:
>  * Simplify down to one return line.
> 
> diff --git a/sound/soc/amd/renoir/acp3x-rn.c b/sound/soc/amd/renoir/acp3x-rn.c
> index 306134b89a82..ed73da496744 100644
> --- a/sound/soc/amd/renoir/acp3x-rn.c
> +++ b/sound/soc/amd/renoir/acp3x-rn.c
> @@ -54,12 +54,16 @@ static int acp_probe(struct platform_device *pdev)
>  	snd_soc_card_set_drvdata(card, machine);
>  	ret = devm_snd_soc_register_card(&pdev->dev, card);
>  	if (ret) {
> -		dev_err(&pdev->dev,
> -			"snd_soc_register_card(%s) failed: %d\n",
> -			acp_card.name, ret);
> -		return ret;
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev,
> +				"snd_soc_register_card(%s) failed: %d\n",
> +				card->name, ret);
> +		else
> +			dev_dbg(&pdev->dev,
> +				"snd_soc_register_card(%s) probe deferred: %d\n",
> +				card->name, ret);
>  	}
> -	return 0;
> +	return ret;
>  }
>  
>  static struct platform_driver acp_mach_driver = {
> 

