Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 355AC3BF930
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 13:40:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37DBA1676;
	Thu,  8 Jul 2021 13:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37DBA1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625744413;
	bh=rHfq3A/aUfQNU6ElYU1DxU0xMxitdjcWjpcQLFr+HeA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BDLWZEwgEKMYBBfFc4PyrXzxIZlrRA8809UM51c91T41NFrUQicUT3WjTRTKiizG4
	 bsVvW/LJt0t7qB+JC0xcQZkSJz5eWixUktMTs8VE4lfmjbxODEwpW+IX9qrCntWMDY
	 kLEv+BZU9GiW5b/6dpZ4ss7a1l2N5TvUAROxuOjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCCAAF8012A;
	Thu,  8 Jul 2021 13:39:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20CA1F80259; Thu,  8 Jul 2021 13:39:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::60b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2073F80143
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 13:39:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2073F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="tNSD2NzI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hINjLlGaunzuATfvrCSeDyNNQonh2TvyNVCt9B4QE5911F7K4xgcUvNiynKZv/wSYjSJ40vEbPuSnkB2IF/NqrzVLeGD9g9PXw3FOKmQbWpaYfBynAHaXImuqRqlOEFK/TZJzLhgidyOChoVzmFxHrGvwfnwI9EjVmCiGmwxOtcQW8SJ/3qpVHvHYslCwoQuoQlRBPzJk+8w5kdo8tzh/Dz2q9dNslnHhyPF5Ar1mVzq8Vj/GZiBh5c0q9++d4FktDi6ptkp/lyk4KGsi/hq98qH7k8wy0G1SU4IyE3dkgPuK5DDWbxB/0I1qn3NVY6SAquJKmryZTVGUUXOOgPE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYRf+TTBosfNS41ZhUE68MgE/3ZQKTip8thlaOQfxBU=;
 b=TFIy5LHTrHxs+sqe14KQGw2hNLuIoM0DjnwXEN6QBMg5li2aHdmG2YP+kHIj8XKejILe4z0m6/h88wkLFka3JUOOuzZwBYkeb94HbkF8JddtFOI+JtGflfZZsAAmzy8lU1icLSe9+5lHvtPs3Xbh0GsVEo9pG5ulZ0FMl8ORFIwL8DEPTuHs88uHUlR1WrkostP7T4MaQwvT05bUIsF2MxG3xh4DxS1wXHj81Y+Wvx2vbJzjJOizSETGRw9DpCq06DbWkX3JUoNWdpcVKRp5pNkSf+7NU5/6mPkRpJJOSQYk+N2+Nk2brEBxeg80iVpgQPll/ZaFIoEFecs9qvFAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYRf+TTBosfNS41ZhUE68MgE/3ZQKTip8thlaOQfxBU=;
 b=tNSD2NzIVLYIwWzbgCThH212DSud17OcwtsNNIBsv7onHhyyeLti6LhVo6BiDeBCwoWlDMuMpDJhRasu38wqxLm5QgyspYy33GgpxrQKNTuYKt6/7t9P1QnruZzEc+kbVhYJKSHQB46N0GI6Is9uRGIM4u1mNrey5bGYOoasiUE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MW2PR12MB2379.namprd12.prod.outlook.com
 (2603:10b6:907:9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 8 Jul
 2021 11:39:02 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4308.021; Thu, 8 Jul 2021
 11:39:02 +0000
Subject: Re: [PATCH 07/12] ASoC: amd: add ACP5x pcm dma driver ops
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
 <20210707055623.27371-8-vijendar.mukunda@amd.com>
 <c2ca7755-9a28-792f-78b1-5be62474672a@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <af81c118-78cc-9da8-1b1d-405af10b0b6e@amd.com>
Date: Thu, 8 Jul 2021 17:26:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c2ca7755-9a28-792f-78b1-5be62474672a@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::14)
 To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SGXP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Thu, 8 Jul 2021 11:38:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c76d084-d788-4b85-0558-08d94204fbf3
X-MS-TrafficTypeDiagnostic: MW2PR12MB2379:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB2379608B5A71BF5545B0840A97199@MW2PR12MB2379.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9keRAEVHrvzz+X32vEEnAucF9lDfxoRw69qtSugZEUT5eUnoV5+kuDb1rbWyonBeE9w1uV5+Jpq4STbJtjElIrcB2EQ1BcpJJfWK9ZmMp9wmxqECEx0YbErrrm2gXMI8XVEeMar/iFDYHMi4lI0ALRb41/AkK5MCPiwQNZyoEO2UZ/qK4W0bc2XTRHhvgMf3zLxLvu9JVuKaJFMQ9ByOsaFe8JzMy7y9g9ZrGhVqgYQtebaXvu4lbPXNey+UHlhNExqRolTbk1mRzqI/EFng5CK9oQE1Ai6bk7O6oSLufXg6aSIK1j78xj5YBGpBHtYee3ZDhf02gUAHOYG6+yePngB6U4HZyjm+OxQRaTRmsywI1qeMekzjMCKuzAzCOuR15MsWVdwyCp57yNYZ7RGgKALZkoOQJEzhUoeXNpuje8o25mcnsB60H1kJxR1trfEpIbqqny7yPIaVWhK3QER2riQ7z8CCtWYQs5n5b3lH2xVUNIxIp8PSrSGiguwDPgdBkQDk3lA715WDeA7gk4QDHMpYZus1pYbJqxAbtZvseA6lzWlC64e+cs/tAF5O0JxYExHH9uTRzZCF/rhiKYAEPvDRrt1qtI9UJIoAJrmHpBY+SXJc02wDzSXLB6jyEjp+Dg0jiDiLAAu4Mm1FTqWkV/V8qEUif6B1tXLY9rMwxljMSh5r66qnrkLXOBojaMqgnOKZnOVJ5f4+QK72lAp9YtBBbAV0BRWxsGodwymRPul3XXPYs4tkhZnDDUzlcLoc9id35O8hAakworIVJNi4sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(83380400001)(26005)(2906002)(8676002)(31696002)(956004)(2616005)(6486002)(4326008)(6666004)(5660300002)(186003)(478600001)(53546011)(8936002)(16576012)(66556008)(66946007)(31686004)(66476007)(86362001)(38100700002)(316002)(36756003)(54906003)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGNKdmQ3M0tHZkZDSlpnUDFtd1g1TTc2SGxrVi8vc2FkckhBNUxrNWZUVm5v?=
 =?utf-8?B?dUdnd25lVFRkUmx4NXptRXgzTW96dGhwbFRocTBhN1hvZ1lsa01HVWM5czhE?=
 =?utf-8?B?bTBYcWw1SGVoYitscGJoblJIeDYvY0hEeFpCUGdqVGNJSm9BV3VCTW0xY2ZX?=
 =?utf-8?B?MHRuK3VlRDM3aEJjbU5wZ0tqR0pGYzNSUDVCc0Z1anRscFplckZHN0JoWFp0?=
 =?utf-8?B?SkZyNlg5Y095VEp0aDBpb3JtYkNEd1dxK2VaTlV4eUhHcU1YRDdURUNZeVk2?=
 =?utf-8?B?NDRwZHZkV3ZUZTkvS3gvbURaendjYWhrd3pGSER2a0QxQUNISnp3VXRqa0VW?=
 =?utf-8?B?UEQ5bWU0YlBRSElhVU84dFZOaElBNDdaQzFFSEN4R09FUmZ3cmkwRit3b3hG?=
 =?utf-8?B?WWp4c0NHU3QxQTljVWlUUEY1N2FWWWxkejRnU3dLei9oQ0czYzZVRnM0Umlq?=
 =?utf-8?B?VEZMVzNyek56T1pyNnB2bUxqZTRqWjdXUDgwaTVQTXZrdS9FNGZiL3NzTVUx?=
 =?utf-8?B?UzdzMlBRdk81WDRuWFBScHJhVEdXWjRaTDBSRW4wYjNYY1pURjNLUjdtTlg5?=
 =?utf-8?B?bS9QQXJRWTc0d1pocW85Sm05QXlqMlVkb24zQlNpVGMwTlNEZnJvVWZtcHpz?=
 =?utf-8?B?QWMvY1NXbk1WU0M3L09wR3hzZldvYzFHT0xNQTNTKzZaYkZVV0tYWFNoQUNs?=
 =?utf-8?B?b2RkdExLcFFTZmJNbS9FeFJiZ1IzdU9vSnNTME9Wbm8rYnZEWEtjd0JQb0Fw?=
 =?utf-8?B?MnJodktlTDNnOUlhUmJlQVRhQjlkaFVwTU55cVNaTERYRWppck44RXNoUkhj?=
 =?utf-8?B?L3ViTVVweVFpc1doWnoxdC9TdCt5ZGtKRkx6VnNzajR5ME92dmdqVHB0alJY?=
 =?utf-8?B?QndZY1NHaHViQlNJZis1bE1odG1TTDA5Sm1QRE5ZMTZJR1BBQzNmWVc3QVN4?=
 =?utf-8?B?cVFRWkpRcFdGTTdkWHo1SHVHVnJWSFpNbmw4L2x0RGM4NDE0REFxSHpKM1h5?=
 =?utf-8?B?ZVJxaHpBZTZKSW9PVzY0ZW00QXRLZnhCaUJBc2dyRTMvODlyUDEwZzYzNmpZ?=
 =?utf-8?B?V0tOSXg3M1lnZkV2eThtM2Evd2VtMWZjRVVLRjdhbDJQa1pybGFjMzhQa2NF?=
 =?utf-8?B?SWQzdG9IeHFZZHh3djBORCtzeDVETFdxMW82VG5XYWZNbzQ0R3MwSkhOcEQy?=
 =?utf-8?B?NUlBSENZMHNTcGpnREd1eFF2VXVQaUh1NHZZREhBMWh3K25pV0xBQ05Zbk1i?=
 =?utf-8?B?VnZPNWl0ekVMUjIyTzA0Yk5SUm1yaGV6VEdhR3NhSHZYSUJDRUpKZHl0UlZt?=
 =?utf-8?B?aGVOQzhVZmkvOVd4WHZUV1B3N2FoZndtRExoTWtEQUxZOGNYYys1Wm13Y3Ay?=
 =?utf-8?B?cTVaRWNCbWVmQ3VEa1Rqa1pJS2tpMWEwVUt6ZnV5VTZ1dGdSV2toZTZ0TVlz?=
 =?utf-8?B?eHlCbTBPSHU3VXdlSTVaRitrWGNVVmQ1OU04cjZhUi9HTWpXZmdxa2ZmN0hR?=
 =?utf-8?B?SVVqK0xNVzZQZm9MakRpUkYraEFjK251MDJPMkFxSkJoZTlORkVpRkcxSHBn?=
 =?utf-8?B?STY4K0ZOMGlwdG9YQ3NFZCtoSFAyL0s3STRRNmhrdmpBQytSYXYvdmtVQTB1?=
 =?utf-8?B?WDdtSnRNbmx4TEo4RUtJQ3ZCWFB3NjdGaDhBb093TEttNzNjV0p3Z2hlZXN4?=
 =?utf-8?B?QXNSczIzSVptOWRqRFlXSFltUG9tUE9pNTZUR2Jmc040a0d0d2s4K1k1cUFo?=
 =?utf-8?Q?qDM9g0GjErG77Hyg1dv2j0bonfT6ia66KVFYRV+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c76d084-d788-4b85-0558-08d94204fbf3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 11:39:02.6934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqTI8tIQcNHpnlOwm4dYFOD/V1yC8Quw7sydqPmy6orL9JbOnFUVt4At+IqfjV+PouYL9qx42ybMR1sUIoYJNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2379
Cc: Alexander.Deucher@amd.com, Takashi Iwai <tiwai@suse.com>,
 Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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

On 7/7/21 9:57 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 7/7/21 12:56 AM, Vijendar Mukunda wrote:
>> This patch adds ACP5x PCM driver DMA operations.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>  sound/soc/amd/vangogh/acp5x-pcm-dma.c | 306 +++++++++++++++++++++++++-
>>  sound/soc/amd/vangogh/acp5x.h         | 106 +++++++++
>>  2 files changed, 410 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
>> index d79712587d30..a4235cf33548 100644
>> --- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
>> +++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
>> @@ -17,8 +17,42 @@
>>  
>>  #define DRV_NAME "acp5x_i2s_dma"
>>  
>> -static const struct snd_soc_component_driver acp5x_i2s_component = {
>> -	.name		= DRV_NAME,
>> +static const struct snd_pcm_hardware acp5x_pcm_hardware_playback = {
>> +	.info = SNDRV_PCM_INFO_INTERLEAVED |
>> +		SNDRV_PCM_INFO_BLOCK_TRANSFER |
>> +		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
>> +		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
>> +	.formats = SNDRV_PCM_FMTBIT_S16_LE |  SNDRV_PCM_FMTBIT_S8 |
>> +		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
> 
> is S24_4LE supported? seems more useful than 8-bit audio these days, no?
AMD I2S controller doesn't support S24_LE format.
> 
>> +static void config_acp5x_dma(struct i2s_stream_instance *rtd, int direction)
>> +{
>> +	u16 page_idx;
>> +	u32 low, high, val, acp_fifo_addr, reg_fifo_addr;
>> +	u32 reg_dma_size, reg_fifo_size;
>> +	dma_addr_t addr;
>> +
>> +	addr = rtd->dma_addr;
>> +	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
>> +		switch (rtd->i2s_instance) {
>> +		case I2S_HS_INSTANCE:
>> +			val = ACP_SRAM_HS_PB_PTE_OFFSET;
>> +			break;
>> +		case I2S_SP_INSTANCE:
>> +		default:
>> +			val = ACP_SRAM_SP_PB_PTE_OFFSET;
>> +		}
>> +	} else {
>> +		switch (rtd->i2s_instance) {
>> +		case I2S_HS_INSTANCE:
>> +			val = ACP_SRAM_HS_CP_PTE_OFFSET;
>> +			break;
>> +		case I2S_SP_INSTANCE:
>> +		default:
>> +			val = ACP_SRAM_SP_CP_PTE_OFFSET;
>> +		}
>> +	}
>> +	/* Group Enable */
>> +	acp_writel(ACP_SRAM_PTE_OFFSET | BIT(31), rtd->acp5x_base +
>> +		   ACPAXI2AXI_ATU_BASE_ADDR_GRP_1);
>> +	acp_writel(PAGE_SIZE_4K_ENABLE, rtd->acp5x_base +
>> +		   ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1);
>> +
>> +	for (page_idx = 0; page_idx < rtd->num_pages; page_idx++) {
>> +		/* Load the low address of page int ACP SRAM through SRBM */
>> +		low = lower_32_bits(addr);
>> +		high = upper_32_bits(addr);
>> +
>> +		acp_writel(low, rtd->acp5x_base + ACP_SCRATCH_REG_0 + val);
>> +		high |= BIT(31);
>> +		acp_writel(high, rtd->acp5x_base + ACP_SCRATCH_REG_0 + val
>> +			   + 4);
> 
> use single line? I find the indentation style quite an eyesore...
will fix the indentation style.
> 
> 
>> +		/* Move to next physically contiguous page */
>> +		val += 8;
>> +		addr += PAGE_SIZE;
>> +	}
>> +
>> +	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
>> +		switch (rtd->i2s_instance) {
>> +		case I2S_HS_INSTANCE:
>> +			reg_dma_size = ACP_HS_TX_DMA_SIZE;
>> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
>> +					HS_PB_FIFO_ADDR_OFFSET;
>> +			reg_fifo_addr = ACP_HS_TX_FIFOADDR;
>> +			reg_fifo_size = ACP_HS_TX_FIFOSIZE;
>> +			acp_writel(I2S_HS_TX_MEM_WINDOW_START,
>> +				   rtd->acp5x_base + ACP_HS_TX_RINGBUFADDR);
>> +			break;
>> +
>> +		case I2S_SP_INSTANCE:
>> +		default:
>> +			reg_dma_size = ACP_I2S_TX_DMA_SIZE;
>> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
>> +					SP_PB_FIFO_ADDR_OFFSET;
>> +			reg_fifo_addr =	ACP_I2S_TX_FIFOADDR;
>> +			reg_fifo_size = ACP_I2S_TX_FIFOSIZE;
>> +			acp_writel(I2S_SP_TX_MEM_WINDOW_START,
>> +				   rtd->acp5x_base + ACP_I2S_TX_RINGBUFADDR);
>> +		}
>> +	} else {
>> +		switch (rtd->i2s_instance) {
>> +		case I2S_HS_INSTANCE:
>> +			reg_dma_size = ACP_HS_RX_DMA_SIZE;
>> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
>> +					HS_CAPT_FIFO_ADDR_OFFSET;
>> +			reg_fifo_addr = ACP_HS_RX_FIFOADDR;
>> +			reg_fifo_size = ACP_HS_RX_FIFOSIZE;
>> +			acp_writel(I2S_HS_RX_MEM_WINDOW_START,
>> +				   rtd->acp5x_base + ACP_HS_RX_RINGBUFADDR);
>> +			break;
>> +
>> +		case I2S_SP_INSTANCE:
>> +		default:
>> +			reg_dma_size = ACP_I2S_RX_DMA_SIZE;
>> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
>> +					SP_CAPT_FIFO_ADDR_OFFSET;
>> +			reg_fifo_addr = ACP_I2S_RX_FIFOADDR;
>> +			reg_fifo_size = ACP_I2S_RX_FIFOSIZE;
>> +			acp_writel(I2S_SP_RX_MEM_WINDOW_START,
>> +				   rtd->acp5x_base + ACP_I2S_RX_RINGBUFADDR);
>> +		}
>> +	}
>> +	acp_writel(DMA_SIZE, rtd->acp5x_base + reg_dma_size);
>> +	acp_writel(acp_fifo_addr, rtd->acp5x_base + reg_fifo_addr);
>> +	acp_writel(FIFO_SIZE, rtd->acp5x_base + reg_fifo_size);
>> +	acp_writel(BIT(I2S_RX_THRESHOLD) | BIT(HS_RX_THRESHOLD)
>> +		   | BIT(I2S_TX_THRESHOLD) | BIT(HS_TX_THRESHOLD),
>> +		   rtd->acp5x_base + ACP_EXTERNAL_INTR_CNTL);
>> +}
>> +
> 
>> +static int acp5x_dma_hw_params(struct snd_soc_component *component,
>> +			       struct snd_pcm_substream *substream,
>> +			       struct snd_pcm_hw_params *params)
>> +{
>> +	struct i2s_stream_instance *rtd;
>> +	struct snd_soc_pcm_runtime *prtd;
>> +	struct snd_soc_card *card;
>> +	struct acp5x_platform_info *pinfo;
>> +	struct i2s_dev_data *adata;
>> +	u64 size;
>> +
>> +	prtd = asoc_substream_to_rtd(substream);
>> +	card = prtd->card;
>> +	pinfo = snd_soc_card_get_drvdata(card);
>> +	adata = dev_get_drvdata(component->dev);
>> +	rtd = substream->runtime->private_data;
>> +
>> +	if (!rtd)
>> +		return -EINVAL;
>> +
>> +	if (pinfo) {
>> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> +			rtd->i2s_instance = pinfo->play_i2s_instance;
>> +			switch (rtd->i2s_instance) {
>> +			case I2S_HS_INSTANCE:
>> +				adata->play_stream = substream;
>> +				break;
>> +			case I2S_SP_INSTANCE:
>> +			default:
>> +				adata->i2ssp_play_stream = substream;
>> +			}
>> +		} else {
>> +			rtd->i2s_instance = pinfo->cap_i2s_instance;
>> +			switch (rtd->i2s_instance) {
>> +			case I2S_HS_INSTANCE:
>> +				adata->capture_stream = substream;
>> +				break;
>> +			case I2S_SP_INSTANCE:
>> +			default:
>> +				adata->i2ssp_capture_stream = substream;
>> +			}
>> +		}
>> +	} else {
>> +		pr_err("pinfo failed\n");
> 
> that seems like a rather useless message. if you want a log at least use dev_err(component->dev
will fix it and post the new version.
> 
>> +	}
>> +	size = params_buffer_bytes(params);
>> +	rtd->dma_addr = substream->dma_buffer.addr;
>> +	rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
>> +	config_acp5x_dma(rtd, substream->stream);
>> +	return 0;
>> +}
>> +

