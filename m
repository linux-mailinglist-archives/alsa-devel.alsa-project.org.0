Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 877EB3D04D2
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 00:54:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09F3E16BD;
	Wed, 21 Jul 2021 00:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09F3E16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626821644;
	bh=6GPJYj6RgHs5EfQX9L/ASciNKVydftnlHdGhGG6Zp4s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WWSKTjhe3LEtY6W7osfc+oJKyixYa9kQKe2PUNk++nx+Pgi5jA9MCIAZi2JP5Cd6M
	 WhT9eulczWbJf3W5lggjJFkNYYg39uhxV8ZTFk81tvDMITrvKoENLsKZ+LHHCulWH5
	 rTZwqmxDRhTyVumBz56s7bVrDPbaRQyyYI5i+PyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7447EF80104;
	Wed, 21 Jul 2021 00:52:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE54FF80218; Wed, 21 Jul 2021 00:52:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63B4BF80104
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 00:52:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63B4BF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="FBgigtBD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbI9yq8rlOeroYPJDZzMxbU4TdlyE3K66T2Mmt/EHODX2UpKMKx5oR6RXunNWcFD+HnJrisZFFR6qAhIXK2FgheFRq1DHansCvZ0jJIvcVnc+1AbUiJDfULJ1TAUbT0WqQ4zeMUUcvpgGw7Hb0E4rLP5LYBCKTR3wcy2qJyInR/uX/CxF3jX1vv6ofLsDUts5dvXT7VF/ylWOGFsaqV2pjFIC51nR/ooi2t2x2n8q7tnkD4xI/qQwzwIpCoD8Ic7g+UYFc4EdDueEbAPfu6VAJegrEbhz6WcXBU3FevG2iyxM2rVNeWxIEGhXLWUPMIMbqQseFZopsA04G2Zlr7WYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbFEARqUeUbym80YZAkkNdB3/6HAz0gkf48io9euAc4=;
 b=SxaRLFtRB0vLsADk/oFisfAbj+Z+VEkEoDiskWE8xKwFHcvf1eIfx4HPFxt3/2BFiWliOmy08/gEjdcKuamrheZPYDyJj4P8EK87YBayhVszs0u6f+ACcOnm6kAL1IUgMEfgfL/Lkxbb0X+8j7VzCo/n34zHIoKPUPg2zmwx1hlg+LBwSASkbYfQERCjdt52u5ddzInIPgrxAF7kUmeX8PKzzphI/LVq0W3TYa38jD2hZFNaQZXr8iADGx9IBIWtWTeazHsQu/F5ytRo1uGRdn3WwOIoQzp7AU08PPJbWyF65xo6dZoMkHrPzd0+D8lvSodiBCADeZtON4grB7Dkow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbFEARqUeUbym80YZAkkNdB3/6HAz0gkf48io9euAc4=;
 b=FBgigtBDyyuyt4jVXxHQQ2+zD31rofywQVLmkkeFel5Ut1Jg4bSsOYgpEz5G63du6g+2FFTvTgapMiaZLFOpaAqZ4jg2N/3P//D9MxbsWjfpQ+4i9SEt+ysx5hL2rbV+x1ZqFn2dMac1gJdZ8CdrVb4pTLx2uk6e9uES8Oa/i/0=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MW2PR12MB2507.namprd12.prod.outlook.com
 (2603:10b6:907:c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Tue, 20 Jul
 2021 22:52:25 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::d0a9:a5f1:ca5a:b439%11]) with mapi id 15.20.4331.034; Tue, 20 Jul
 2021 22:52:25 +0000
Subject: Re: [PATCH v4 07/12] ASoC: amd: add ACP5x pcm dma driver ops
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
References: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
 <20210720163732.23003-8-Vijendar.Mukunda@amd.com>
 <331065bd-32d5-45eb-37fc-d4fc76c23fe8@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <c552db37-6736-6e9c-f797-11b25ab45474@amd.com>
Date: Wed, 21 Jul 2021 04:40:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <331065bd-32d5-45eb-37fc-d4fc76c23fe8@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33)
 To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Tue, 20 Jul 2021 22:52:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f2936cf-13b7-4ec1-87af-08d94bd10a89
X-MS-TrafficTypeDiagnostic: MW2PR12MB2507:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB2507BAF6CD0F6039AA7E5FFF97E29@MW2PR12MB2507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ii1X6/fi+QjJJboTDEhP/oRF8VgDUIOWHBgOzhHgvNyMOUUBkd1vK/ToDGh9q/VXwj1j/B9BItQM190ZVVRSU3pWEfrz6aF1naq741MSK6H4YSoR+U7LRJhkWw1Q+3lrosgbgmblNgBwkKnnpEJMEBVU3F++t03LO6O1vcJqcnO0XPcv6ae0GRDJ6lWZ0ZcKctszG+iYhXPouC+6HBISo/a728zjPMc49ihpLEYOMZ8C4r3fdx11FJRnoknj5y14ydolFkTjqoi6W/hw72zP1r0B10UpeXG9TW0yHz6MvOlLbNKMP2BHzhncUkyCc1pxtG+/JzDCUpP5VWUGSGNMxZTpEvWLurHcnG4l7s63mDfFNJmEtuFKu9+AyuEzpB9IkYLPShz3NMKJOsf5FTjhYektq8BjScDeG4I2TpC3qadi293pFMAirBecFz34Lzxso6UEEMGRijboTwfei4Iaug3l8s4D9DIXOtIY6vie/HqjR+CgUjRgFFycxvi7uoOi9FAd6rh2JK4Jov0baCABLFUfOjYaRNZS25nTGwIh81Kpogv+PdOo6zFhPdFq9OzoH6yE7oExHePGTKNR4PWX4XoOyb4bSlE6ZpqcKt2tQ9hNmkI5iW7j7mtO18B4CB0F/Rn2GBUQAIHVUK5/4ppbWsAPp8pIvzWcRhS2hJeOHe2gXi3JEXgG+T6Ei50dOu5acFaF8zJs7GYIiZ9B+XzvInSRuTg4LL9IvHlvUbgpZ9DqXRGoX4oVTMdv6TyfiSIK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(2616005)(956004)(6486002)(31696002)(316002)(16576012)(54906003)(66946007)(186003)(8936002)(8676002)(66556008)(53546011)(4326008)(478600001)(31686004)(6666004)(36756003)(66476007)(86362001)(38100700002)(5660300002)(26005)(2906002)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDZOUS9pL0dxd2JZSUlpZnNFRkZZNnIyMjRNaFR1UTRxaC9uVEY5dFpZSnpo?=
 =?utf-8?B?VHROSTBxdTVLaGdYRXhmV0FuQ0lZYytvekZMTUx3WDFWZ0FEK09XeXJQWFFY?=
 =?utf-8?B?d3V1NFNyeHZGRUh0NHQ0QklXeWJKdDNQcWROb0xJYWlaVURBVVRRcEtKM3hL?=
 =?utf-8?B?eUFRT0xwSXRMdzhQcmd5aERHSHFIOWR2SThxL0FHS21pdjJSWHdTajB0QTNn?=
 =?utf-8?B?WG1lN05GTCsvOVNpSXRyQUsvTlFMdUpEVXBPanlTb0hBT2t1UTQzVFJwT0ds?=
 =?utf-8?B?VWFGUHRQRkU4S200ZitvSVFrWDhmYzY2TkJGeVBwdkdtQmxaandXOTR5UUxG?=
 =?utf-8?B?MUlqU2VHb2Z1YXBzOW1CSGZUL0JWTlJIYyttc00xUXFGbElXWXRpTzI3RFpW?=
 =?utf-8?B?U3V4WnhDSHFEZTNBZWZ4aDBCWVlBdkJaeWxrSC9XbjJZQm16OUlRdDM4K0w0?=
 =?utf-8?B?T2FTTHl0dUtvTitHM1dCRTlXU3UwdXIxN3RPNGNlZ1BKWFFLaktNMUtsRFNL?=
 =?utf-8?B?cUs4ZjAzSGpxekRhV3lQMUtvSjdrQXB5d0pxRzQ4cVJUMHFKMU1IYlRPWSs5?=
 =?utf-8?B?QWRnbW5jOFJNc2ZkTFc4aXRYVlo0RGpjTHd0blZid2xXazFYYXBiWmJscnls?=
 =?utf-8?B?Z0xZZ044TDY4UTNXOWRPZDRKaUIxTUxxK0ZFWkxJek1ueU1VSnYvZ0pwSEti?=
 =?utf-8?B?YVRxZ2Y5eGxpNXVvZ1ZjRnE0MXMwUTR5enA5ZFRQTWVZc1VQVE16aEh5a3d2?=
 =?utf-8?B?SEpQcHhTR0RaYURaM0VQK08xRnNpUCtWbFJIUXN0Nkdud0Z2RlNoY29sNjBO?=
 =?utf-8?B?OTBXVm93QncrYm9HNmJnQll1WmxFRUgrRTZMTFlBQWIvNXcyWjBINVRjODVD?=
 =?utf-8?B?cGxkTDJDWnorYXhDMkZvV1VKZ1I4WjlCZUdkU2tNYm14QjZwWG1HSlVkNTZl?=
 =?utf-8?B?eHpSUEZLY2hXOFR1dndxZnpVMzY5UCsxYzBQRk0zcTB3eHpzWDZ5TDZReVd0?=
 =?utf-8?B?cjcyMGJrc3RoK0h1MnNROTk0ZElidFROQmt1K2pxQ2pkS2J2WTZlbngrbEFC?=
 =?utf-8?B?ZmJPbWFmemJBT1B0Z2FlWFZDRWcvTURiNXJBNkw2QWtKUHlmYVJBK20wbjN3?=
 =?utf-8?B?K0V6aXlIYmNnQmpWV3d4aDJZMjVlSUFITVdJZTJGNkViRjBCN3pBZ2J3VmlS?=
 =?utf-8?B?ekxiZ1NwMVhYendHRy9QcXlhR0p3WjNjeXJ4ZE1Ob2xmNkFmQmtHTEttL2lP?=
 =?utf-8?B?OHR2bFNRdjZoVVM5VlB2QUJ0ejdJZ3hldUdPTkJZZFBYOFRsenRmVGZ1YnFK?=
 =?utf-8?B?NmRQeFpWL2FzWkNqMkErbGVYNUxhZGE5UVNwaFpwRmhGbkFlblFCYmVqdmFF?=
 =?utf-8?B?bHMyWnVHU0JLemtmRVBVa3QrVTI5R2V3Kyt5Q29UWk5LTDd4aVFFbGVhZHJl?=
 =?utf-8?B?VXZ3OVE3UVJRQzQxQzBmRGJDSG85WkxGKzdZY29FMUZ6V083RCtPejhyUHMy?=
 =?utf-8?B?MUpWR2lMRHZ3eHhyaHFlSjllVWljenBCQjQ3STJYeENjYjlIa2tDVHRtWlUw?=
 =?utf-8?B?VFdkUzlidm9JRTFHeGloWG1haDdMWUxTQXhMMnVZaUlsakNYWFJRKzFaQU81?=
 =?utf-8?B?S0J1NTJCYXBaS2p0WE9zL0kvSjVkRFlMWEJXTFJkdXhIN1VkSFZaR3VVUDRq?=
 =?utf-8?B?MWpibWVGY0lGREdjNG5CZERjNUJQSWFsSkhEckQ1dXcxVmUxV01yYzIxc3NE?=
 =?utf-8?Q?LZynMnAMsdJ04aVl/5NBFpV3QqS6dM19izeOmYF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2936cf-13b7-4ec1-87af-08d94bd10a89
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 22:52:25.0027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFPg0IQRxgAAE6+Pa57fPhBGcSmNuk8GBjl7B9O+bWi/JgLb0XKcWMgqd+tDTqAbqNtewwb2vCcmv5juuCoULg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2507
Cc: Sunil-kumar.Dommati@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Alexander.Deucher@amd.com, krisman@collabora.com
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

On 7/20/21 11:57 PM, Pierre-Louis Bossart wrote:
> 
>> +static int acp5x_dma_open(struct snd_soc_component *component,
>> +			  struct snd_pcm_substream *substream)
>> +{
>> +	struct snd_pcm_runtime *runtime;
>> +	struct snd_soc_pcm_runtime *prtd;
>> +	struct i2s_dev_data *adata;
>> +	struct i2s_stream_instance *i2s_data;
>> +	int ret;
>> +
>> +	runtime = substream->runtime;
>> +	prtd = asoc_substream_to_rtd(substream);
>> +	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
>> +	adata = dev_get_drvdata(component->dev);
>> +
>> +	i2s_data = kzalloc(sizeof(*i2s_data), GFP_KERNEL);
>> +	if (!i2s_data)
>> +		return -EINVAL;
> 
> return -ENOMEM?

Will fix it.
> 
>> +
>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>> +		runtime->hw = acp5x_pcm_hardware_playback;
>> +	else
>> +		runtime->hw = acp5x_pcm_hardware_capture;
>> +
>> +	ret = snd_pcm_hw_constraint_integer(runtime,
>> +					    SNDRV_PCM_HW_PARAM_PERIODS);
>> +	if (ret < 0) {
>> +		dev_err(component->dev, "set integer constraint failed\n");
>> +		kfree(i2s_data);
>> +		return ret;
>> +	}
>> +	i2s_data->acp5x_base = adata->acp5x_base;
>> +	runtime->private_data = i2s_data;
>> +	return ret;
>> +}
>> +
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
>> +		dev_err(component->dev, "pinfo failed\n");
> 
> should you bail here with e.g. return -EINVAL?

Will fix it and post the new version.
> 
>> +	}
>> +	size = params_buffer_bytes(params);
>> +	rtd->dma_addr = substream->dma_buffer.addr;
>> +	rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
>> +	config_acp5x_dma(rtd, substream->stream);
>> +	return 0;
>> +}
> 

