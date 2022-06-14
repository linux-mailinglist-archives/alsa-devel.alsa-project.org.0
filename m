Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 043BF54A7C6
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 06:18:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A21018B7;
	Tue, 14 Jun 2022 06:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A21018B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655180324;
	bh=6D/BR2e0OqM85kXgA2DBX6ZPZXLp/MEJAEo5WGsfuW8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gvbroq0UoD5BiRAJRhKnVE1nLDDlsjcbqm4TRRibfl61FUyXVkP7whTpu3piV1k9h
	 nZht9X1b7BHEtjpxWaNEZxHJb04+MznComSCa+smKFvSd1eO2hE3kcvIVXDuJmXoJ5
	 nejDD7sivYxL54QAWWZyYhKf5isgvA06xYV+cPIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3250F80165;
	Tue, 14 Jun 2022 06:17:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDB8EF80139; Tue, 14 Jun 2022 06:17:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::618])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B51FAF8012B
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 06:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B51FAF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="ThK9jopD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjIU/EmQ1PDTP/cz4oD8uWaY+47UGVXXZGE4AR/iAYgJoG5Sl95lqBO8qC+f6VDj8RPZCzJ57Wt0E4wNzt7OAuu2UGMbnMRxlZdQzeNykPho+keFMmplXRzVmD4/GcOoyOb2CYEzEqC3VUMCiDIpvjPFNJQRmbBqyHsnmivlcPYrJdUjgSblpbbJGeGV8BP7JSI+pr6niLbeKONgh1aEre2/Y29ST1GzwU/IewkUlC3QXaC5aoV5nTMvbKnlXnMfYaOp2BbydKHvvmWXoM8fON8QFn/j4licd7EfhRqx2KA1LOBPaHXqa9QnuTiXDDK6Zdj//JSFrmkrfkLRE34xxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKNdITrCX1x/7S04+y+E4i3oD6pTf+ybw0UdEUHCctk=;
 b=bvH6W3eHktV9/qTjx5tRs1zjZJgFIDjiMF4DrTY500zOG5DzKzfrxJ2WEkwVwi7c6v36BSuNnlkd06XM6g7YF18xFehFenB15nk5s6og15oH21vwWIIfLI9xxmp7IEmLUVqqIGRCl6Bo7rPq+z7EUVXgHTbzUGLiyql19UCBbYF94ZHjy9aox7k2sRfgoipRrwav4vP9FacX5ThWvgTtcmthpP3BUVhVjOMVnXaob7P9DAJmFVEgweDmqq8nMaQd+ZhIi5N78l3LKZHI3y//FVjmSqq/ouIyZLCAj5vyJSp6PrV89dKi2MQ4EGC/q/r7Zs5hjcaLiNPoVn+wAgdMzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKNdITrCX1x/7S04+y+E4i3oD6pTf+ybw0UdEUHCctk=;
 b=ThK9jopDyM2EeuROesZmDtkgBUly/+QLlH+I/AQer+5g4EcVXjTiJTbD1X/bu0IMa8kcmXTpuwN9br42B+0IyP/CmVUQbRVZXegO3xPzY7WFRfKnNQVELFmqpQsYhK/Sffhfd/8lN5l7nnx0cqFgBkadXmypMuzCAUpHrT+3M3+uIIi0hcsgFIQujl15QoASnaGaM3HSiyF8aHmGugatQrPgtlk2K7ExISCON1dBCewfQcMyV7KwOjSyGnWCitpLQLZl3r0ZwlcUeucF2JFgwhco5gQm2UZSuDOzHhW6nd01M41kRjz9kovs0IRXauOl1hZpavOLlHo9NZG4aq0a9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY4PR12MB1576.namprd12.prod.outlook.com (2603:10b6:910:10::9)
 by SN6PR12MB4702.namprd12.prod.outlook.com (2603:10b6:805:e4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Tue, 14 Jun
 2022 04:17:31 +0000
Received: from CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::16b:eff7:847b:19e7]) by CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::16b:eff7:847b:19e7%10]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 04:17:30 +0000
Message-ID: <8553b100-efd6-cd6f-f57b-671fe830a577@nvidia.com>
Date: Tue, 14 Jun 2022 09:47:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [bug report] ASoC: tegra: Add Tegra210 based OPE driver
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <YqdFcPETMQGZm9AK@kili>
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <YqdFcPETMQGZm9AK@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0089.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::29)
 To CY4PR12MB1576.namprd12.prod.outlook.com
 (2603:10b6:910:10::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 904712c6-af80-4038-7289-08da4dbccc66
X-MS-TrafficTypeDiagnostic: SN6PR12MB4702:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB47025301D1D49CBC6BADE763A7AA9@SN6PR12MB4702.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SwOq/7bveEkBPcfu/m7eVj8nlkjJGlQA+aokltK4Z+GfQOJoIuKvECNy2mnGybS7yDZf0iug9aHRy3dj6wJsoVTtni59jcNo59VyhV1tI7F0+LXvLxt3B8XVsrWZ16iPnPPHbE/T31BokZcZfpQAvt0LTeGqcelODqPtsQAwl2//3sR0HjqRNANfcUcZLdR54Y3ptYNdiWvLlYRGYKCmEShKO9IvZKaot+0G7M8oOICOMQYAsidI0nrE+0HOn3bkUcnbRfpyYqw2hm75AG6wTq7LHJw4CtgHZcBvl8xA5FxiPLfNRLy8fLEXbq62GxMsFu7tw966IP09bJbPcNwAHTKmKmOI5GbySoGm/RZDrzfwoFFwLJs8F1UK983zx/zq334lRXg2Kok28Fnn30ncON3IJeUAl/XEpgKGx4PhxgkPdj+so4D/bK39pUPrtOg+ojszo4NkaXG1RzAtsmdGAlItIdyEenJ9AqNJgzDyqWmDB+tpGK6QTt2AAl4giEJAXf6h9CUFIIzis6o08KxeugT5gymUE+0bz+LNDzZEL51kWMhx7NFP+1NquF1rJOpq7zTzLh5h4FHpph3pgQV/o9P/MZ84iu9+zjUE+T/iPFXjviZVUHuc7TS+R8f1M9zUd8jPUY8cgYl6VVoFA0i6g+GIgcnQGyMerreanzI2D/ud2oDtpcsshcC7sbb7gEaDrYy5L5xdF7j3qKVFzDlTQm5RbrEWdQSPTUwhj3fiqeI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1576.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(2906002)(83380400001)(66946007)(38100700002)(66556008)(66476007)(4326008)(53546011)(8676002)(6916009)(26005)(8936002)(31696002)(186003)(86362001)(508600001)(2616005)(6506007)(6486002)(6666004)(6512007)(36756003)(5660300002)(316002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWVac1pRaU5icjE3WkVQQU1lcUM4dlhjK3V6bXJYNXA4MDQxRklMbUdaQmZT?=
 =?utf-8?B?ekU5dmhBTzlOQS9takp6akN0RXc0NDNFZEZvQVc1WmtyZmR2S2pxNmFPNE80?=
 =?utf-8?B?cERRUHJkd3dPUWZFbnM3d0tUcllpcWE0ZUxtQ3MrMDRTSnNrSm5wUmJ5Slhy?=
 =?utf-8?B?V0YxVWZYbGdLTlpLSXRwY1V4V0NjTmd1NjljY2V6Q1hRT3ZtaWRJQ1UzOGor?=
 =?utf-8?B?VUtrV1B0TDl4ZFZmbHpZTUZCOWhocDZHYUtodzJjcnFJWEFyZjF6NG13b3ky?=
 =?utf-8?B?S1o2enlpcmdFbi8rMU1UNGJhTGswS0VnT2J2aXNuMjZGQkFLalhweVNzaUUw?=
 =?utf-8?B?MVZZT1VodTREem5sL0xSWGpoZTBTTjh5YkdYVTA1Z0RuL0dCUFh4cjdLbEtj?=
 =?utf-8?B?bDFpS1I5K0FxM3FDTU51QWludTJYcEhQdUdhYmZEaWRiRkJORzJVUlM2Nm10?=
 =?utf-8?B?ZDc0SjNRTnRTV2doeFg2NVJIM2ZFOW5MZ2dkVVlCMzBKUjlYOWFvZkh1elcv?=
 =?utf-8?B?dE9kRndtTGZZQ2dRQWtXWWtHRzhHUHpYZlZYZ3RUdFJjeXEwK0RtSVhidlpL?=
 =?utf-8?B?RWNNanlVS3lXS3NyR1N1d3EvaFBWbVhsdVhjd3FRNGFudlRKZEVCYmJ6RU10?=
 =?utf-8?B?eTQyNVJJOWNUS2hvRkNudmJMcmxFL1hQUW5FdGdEbFZZWGM5NCs0OUR4dVE0?=
 =?utf-8?B?UWp2SWMrSEVsME1xbUpPVW44S3V5U25mMFU5WDR1YUJocGVDVjcycnRDOUsx?=
 =?utf-8?B?MzNoTFZrR0FDaVNjdUNpT0V2R1ZLOWhNNTJLbmd2REsra3lybU05NXRtbkdx?=
 =?utf-8?B?TTdxQTVkaFhxdDdETk1LVk5kVDNQdVcyQ0NPSWJObDV3ZkMvdVVCWWNaRG44?=
 =?utf-8?B?Qkd2RUpwbDdBLzhaMkx1akZWWUh0Z1Y0QWxLb1BJUUowcHpWalNsNmYraFRy?=
 =?utf-8?B?Tm5QVlZGWnE3ZnFjdXNTYk42ak5EVkhaS3VYS1VjcGRkWkZVUGpEN3M2ajNz?=
 =?utf-8?B?a0g5VUs1aGJ2akpNVGNMZWM1cy9lY2dCb2RYS2ViOWFUMG1hZ1llb0xWSVhU?=
 =?utf-8?B?ZFRUK2lpbS9Ta0wyVW9LR2FVeTBsaXdTNHlYY1h6cUpjSXphTUZSWU01VGJy?=
 =?utf-8?B?V0szNE9zQnRsSU1XeW1JeG9JS2IwYVYxakdzZTljWHZFVERybGZXQm5xUnJY?=
 =?utf-8?B?SzEwRExKR24vWmNhbk1pN0VFNjlGRkhQMGR0Q1JJRnEvL0NuTkgySVdEeWg4?=
 =?utf-8?B?eW1pSU5GTnRnZ3g2NzMrWjAva3ZEWUc4SGRzUTZ2NmFrdnhCNjFoM013c1Q1?=
 =?utf-8?B?S3JzT1llRUNkd1orZ3VVaDF0UFhNMXZaNWFkVWN0QUVsektxQTVwaTIrN1A3?=
 =?utf-8?B?bkxDZ0JUdENoOVNzWVlEUWdzM3pZcTVaOWo3VFBZRnNKcnZMWG5lNndGais1?=
 =?utf-8?B?Z1pGa25BeitiT3JXajJ2OHExYVB0R0JML3pyNko1UWpmWmY5bEpvbUZSbDQ2?=
 =?utf-8?B?dGR4VVUwMFJqeGUzSWIvL1pSQjZqNE9CdFB2bHlQOUZVOVJpRHBONmMvSlVp?=
 =?utf-8?B?TmVoV3FCcUsvRkd4ZWFGWVg1NTM5TzdweThHT3RVcm4yV0xZY1pUZjBrYi9B?=
 =?utf-8?B?TGFKMmVmaTE3eS96TWVJWlhCZ2NoMzhoemt3eTR3NzBRQjlydVlZbUtueU9L?=
 =?utf-8?B?SnozTGJ0cHdla3pVTmR4aDBITzlMUzFLYzJKcUVRaExsaVd0bVpnVlh3Q2dv?=
 =?utf-8?B?ZmcvMG9YbUpWUXhJV2QzaytwMkRoYkl5VllXVHRzV3VWcGY4T0J1OU9uSmpF?=
 =?utf-8?B?REZGS1VQRTFaMklBNWVHRkdsK2hwVlFSRnZHZ2ZxVGRoUEJjT0ljUjFnRTVS?=
 =?utf-8?B?ZjliNmNEY0RBYlRuUUhZdHhQYXhNTjRoOHphUE9BSldDd25lSmx3NVFGcnM1?=
 =?utf-8?B?YUxuV3RSMzBFV2lNR0NBRmxMMnA5NkkvaGd3KzFTSGJiaGExaWRJR25RYnh5?=
 =?utf-8?B?L3QyQkdwU1NSY1dEUUxXNEdBaE5vT0p6OVY2bXJpN0xKdytidWdBMCtCWERz?=
 =?utf-8?B?Y21VeEh4NEhKbjBrMkVGdUFFUTc2dU0wMHgwdTgxWE8vZzhTOE9hTSs5Qm4z?=
 =?utf-8?B?VW1RemRXdkphNkFEMU9MSXg4aVFtcFV3L0MvU05wOFZKc1F5VU8yZWdMcjZX?=
 =?utf-8?B?RlJnYkdhNDgzRGVkelpEQ3EwdkVva1VIODY4bkFWbzV4OU13dDE1a0wzTUR4?=
 =?utf-8?B?S0d0VUZXbUZYdStFZnJvQUJMN3BsMmdya29neFdGOGtibXNVc3dGZlhhd3gw?=
 =?utf-8?B?RVVpS2JTKzBQUFJkSi9jMExYVmY4V1pCSzdjZWpnUWRqTUNraGR2dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 904712c6-af80-4038-7289-08da4dbccc66
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1576.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 04:17:30.8552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4Vx6H/8ivIVmeCMrlQMrC6W0ZeAzrEzhLERmKiazkTWJZSvBgRVETnEiV5pQw8ALlB8UGKGPPwMvADNki7Geg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4702
Cc: alsa-devel@alsa-project.org
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


On 13-06-2022 19:40, Dan Carpenter wrote:
> Hello Sameer Pujar,
>
> The patch 7358a803c778: "ASoC: tegra: Add Tegra210 based OPE driver"
> from Jun 3, 2022, leads to the following Smatch static checker
> warning:
>
>          sound/soc/tegra/tegra210_mbdrc.c:778 tegra210_mbdrc_hw_params()
>          warn: bitwise AND condition is false here
>
> sound/soc/tegra/tegra210_mbdrc.c
>      769 int tegra210_mbdrc_hw_params(struct snd_soc_component *cmpnt)
>      770 {
>      771         struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
>      772         const struct tegra210_mbdrc_config *conf = &mbdrc_init_config;
>      773         u32 val = 0;
>      774         unsigned int i;
>      775
>      776         regmap_read(ope->mbdrc_regmap, TEGRA210_MBDRC_CFG, &val);
>      777
> --> 778         if (val & TEGRA210_MBDRC_CFG_MBDRC_MODE_BYPASS)
>                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> TEGRA210_MBDRC_CFG_MBDRC_MODE_BYPASS is zero so this can't be true.
>
> #define TEGRA210_MBDRC_CFG_MBDRC_MODE_BYPASS            (0 << TEGRA210_MBDRC_CFG_MBDRC_MODE_SHIFT)
>
> The common false positive with this warning is that the macro is
> something which depends on the .config and in that case I just add it
> to the list in smatch_data/kernel.unconstant_macros.  But in this case
> the macro is just always zero...  Is there a plan to make it
> configurable or something?

Thanks Dan for reporting this. The device is actually configurable. I 
will provide a patch to fix above condition.

