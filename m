Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 071AE45F39C
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 19:17:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8003617B2;
	Fri, 26 Nov 2021 19:16:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8003617B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637950633;
	bh=8hpRU3QNO0uYVm5Pqvl57obr9xcXks10B27Z3oEOCvM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MOa37gnJX5sBM8K4mfO77rbltFLHWNpEnsOny97KYv8BU4DPcb1W0pBCUBz77lCoI
	 vs7VfJeZ3kiulsr2+SwrX70nUCUu1Gpri5FgUCK7n0/oBLAc6NV9oBjisQAzIurTgp
	 j8xh7Stf1DYnyRZkob1pgSNyH55XN/wn92TFFE0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8A82F80212;
	Fri, 26 Nov 2021 19:15:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 939F0F80132; Fri, 26 Nov 2021 19:15:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2071.outbound.protection.outlook.com [40.107.101.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9BA3F80087
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 19:15:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9BA3F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="TceVuYFe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVO8g4OEiaVmqfU3SCpcmEi/gUqR5imNzbslg/VCzlNhb/pZa2noYjPbprLRIr2AaSjJgaWSOjDs1I9DwJkH5aeOIPFJddxSoIsVdgIEwXYfg8IuzvYDPL5zeHbrQhnPPTq2xdzy5bodmjcczaz+XYt92ioPRbjv/K0SKd4eYcjtHWJYJJ6DaJvhROGHPmJG1XHTVoW26beeD0g4ARCUZgHV/KisttOqbUwzoQOwE6Tz9OR6fVcrPtUOag+42hz0hxwLtLvr0Si0eLGRArEw39ve585MyH8gf1ZOomjMdqbZ+oVst6zzFfNHOMjWfHYTwr3rDTajUHl5ftCQSrtNvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKfCXxet85C1eZx2qpwUKQ+ksIdqLvTWmMnbEJCzhGc=;
 b=TUi0OjzZ4N5y7KCgTVbKSTR/M21gsAv+jnPPQMTy+dpfu8bfCNh4ChBfzcWQz2sFJ1+A+BAkZCVSI444+42BrljsUYeHTcm/+5mBsGgMjVucWHkAJbCYgP3i0/DAfzcdW9HQ7qP5WGJncgRR5urAGgm+ARTyq1hpWC8PtR3J5mffgfmDlbjqFfYWtKeIx/PdoZCLIozYDNZY8kVkZS/mZaekUEmdSKstSih7eYqHI60PLUx3taCkKpWUGeX5l/wicPTK/ofTd9bQ5AnC9xMY/iqbxcLHGCL637A8hR2PMWlXlZ8mUDUTScAlKP+cf7+6jzceJzQvXIVeBtb4147VzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKfCXxet85C1eZx2qpwUKQ+ksIdqLvTWmMnbEJCzhGc=;
 b=TceVuYFeM2KbEwZNgwwqbAJw07+HCjg79pEDqRZNpKnhdfXPsN/ktac3ZrivLg+m2vOrlCdUutZX9vX7Cxj0UN7sEdi+QPNE3m9EEeA7L1mIrIhqwysN5eaScRlQs/kLu6gM73x6SRwy7pw1sf/ItAoiQ0GbmfFHmpPUTa8PfKo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13)
 by CH2PR12MB4806.namprd12.prod.outlook.com (2603:10b6:610:f::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 18:15:35 +0000
Received: from CH2PR12MB4120.namprd12.prod.outlook.com
 ([fe80::55db:5eee:a595:112a]) by CH2PR12MB4120.namprd12.prod.outlook.com
 ([fe80::55db:5eee:a595:112a%8]) with mapi id 15.20.4690.027; Fri, 26 Nov 2021
 18:15:35 +0000
Subject: Re: [bug report] ASoC: amd: add vangogh machine driver
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20211125145952.GA14210@kili>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <0f422045-bce3-d4c1-5f0b-fa39cabf466c@amd.com>
Date: Fri, 26 Nov 2021 23:44:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211125145952.GA14210@kili>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::7) To CH2PR12MB4120.namprd12.prod.outlook.com
 (2603:10b6:610:7b::13)
MIME-Version: 1.0
Received: from [10.129.9.123] (165.204.159.251) by
 PN3PR01CA0042.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:98::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Fri, 26 Nov 2021 18:15:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e0b8931-7b41-49d3-b05b-08d9b108bdcb
X-MS-TrafficTypeDiagnostic: CH2PR12MB4806:
X-Microsoft-Antispam-PRVS: <CH2PR12MB48060B491874B034BFF78CB097639@CH2PR12MB4806.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UUahcUowDGe23Fcz6oPugpt4SGHKbO+8xJgcDHFrotIxno/gat+qMqxe7oRmr0uvrX4tD1/3dtngDjJuNkEDTzxHa/eB2YeguJkSJXh+Lx3B90MI5LIlU5t8jV4mGjzJrwdGaD2tMamamZGHq0qmLZspbgUN6UH9WGOLqZpG3LVQQBlAD31v9++mtbx51plydezeGQtsHXl5KQjaBPA2a9jJXoJTSwM9cQvWJUhuosmdD3L9xnS1y8GVoQyCDafu335YquxpGyK6Vv9Ge7tRpL6mHaaBMzHIWMct702cl7Kra2O89GsJVixfRcAdP5P2pTUN2UuR8YTdranq/cndQn78dofu1SbuyMad6QvbYTj7JHKb3+edRWJDcFd36hn5c/nXVOwU7noSQ58Q3RZ0vdiF0HcoZ2PPzve8pkUSmH4aEeVpicbtrsznxFJNC8qlPS7uFvZYxGio8LnED7UGG9iry1Dub1Dr2vVGqknx7b64Hlvb2u8Mo4ncX6FzKoYenAEEYLrl8fzNarbFbMUSeIYi1D8gOCUZ0QzCKDSLqkIblfcgQ7YTwlJSqzeGE7AXwq7kO1qBEYY9w5qhs1qzD4wsJJYsQ7ovGlbiOw+XxRLMHbYQ943ohsfv0fagKiLlet3hEEAEVLlKp7jqySCLQZr4K9PuBNnt3MHfvcVaodEr/BPGKs4QxgsCrQoPjImK4kAhWIT3u/VU/9iXIt28ZIYUabXsNY8i1gPq6zhZeEGUJaRuk4lWP9QAFIgeVWmv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4120.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(16576012)(66946007)(316002)(38100700002)(2906002)(5660300002)(66476007)(66556008)(53546011)(86362001)(8936002)(36756003)(4326008)(6486002)(2616005)(83380400001)(956004)(31696002)(8676002)(186003)(6916009)(508600001)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dys5SjMvcFZHd0dHcEhydlJNcEpQbW1yMjNSazRsK1ZvaFFQWHJmdUlwalZE?=
 =?utf-8?B?VmNLLzRWRWhRVDkrZmpnaDdPbHh6K3R0WVhDOTZ2Qlk3WXdvSWhHK1JaeHo4?=
 =?utf-8?B?Y0lOalVWaVlnTW15VXQ5NjZCazJmcGZmSkxlUGY5bzgyN1V6Mi9CZUllaXZ2?=
 =?utf-8?B?TFQ0bW1GcFNSZDN4dnJZT3QrVGxINHVTODk4WjN5RHl6b29nOFpIcXR2OFlU?=
 =?utf-8?B?b2ZvY2pkUEVUU05oVWEzUzVHTVU0RWVWRWphN3A2WTVEWU9pSHA0UmxrSkZG?=
 =?utf-8?B?YXVHKzFoQ1FlMHBnU2FLenBqMDhRbnJQZW9JV2N0VnNtbzlCYS9lWnovVGFK?=
 =?utf-8?B?YnRZZkx6UFl2TG85OUhzdUpJUUhhUFYvYXRMQ1RjWWNDS0dGcVgvVU9ackMr?=
 =?utf-8?B?bW9velNjaXVtc1gwUkpWZEF4ZVdLSjBPRWlueHlkcmRQekxWRit4MStTdCs0?=
 =?utf-8?B?NHlnZjR2RHhuZUVNSnZCQzhBbWFjYUFqT0Q5bDJWUjgwVWYyMTVReXlmT0hK?=
 =?utf-8?B?RVVKL0F6VkV6aE5OaHhwSG5mL0RkK1MxQ01Lc3dabVdHU2pHTGMzTzlOK0tW?=
 =?utf-8?B?SkFPbkRpMFl6TUFIekVLOGxIVkxUUHdOYkpNemNBSTN3VnNPNktpVEkrWDJJ?=
 =?utf-8?B?NjJUOVdQY3RRZVNhYmlTWmtRTnpmcHZIamNoLytza0dnU3RXb3oxOFBtQnRR?=
 =?utf-8?B?UkRMelVuZWIydlF0bTI1dVZ0UFYxTVppaVdWcnltVU9JNjVSaGFsdFZWc2hM?=
 =?utf-8?B?cjgrdDhrajk3aStsdTk3VG5BTi9NUFREMzREKzRHdVlJTlNRSDBvWWZ2eEtz?=
 =?utf-8?B?cjRmeDY2eXJOQmJtaUUxa05xK1ZyMWR3KzVkWGQ0TUJ6WHNMMWl1RFc3QW0y?=
 =?utf-8?B?UHo5MUFmdzdMT2Eyd3AwbXVXZFF5N0VwVWQ0eFpBZmtMQnRmQm4wRUtLeTVT?=
 =?utf-8?B?V0xaRFhqb2xlYUthcXZxTTZZbVpQaUdRN2J3dVhhTXliTG9xTXpZaUNiVnJB?=
 =?utf-8?B?dFNNaDhLN21UTkZHUGlsUEVETHRiSy9Sd0c4cVdaa01mdXk4UzgwbmtyWjlx?=
 =?utf-8?B?cmFJUTF0ZytoeXlhNk5KeU4yWGJLc2NncUpMNTNrQ1lUcGtqTVAydXVZdUtT?=
 =?utf-8?B?Q2NPbkhyRTduY2IxcTgyOGVvbnEzdFZyR1IrUk5QbE43bnFOT2dYdndnVHdX?=
 =?utf-8?B?Ymd4bXV3K3NYVUZxVm1McWJXWG5vSXk2ZHZESmI3TVJMQTNmcHZUMjIrT1BJ?=
 =?utf-8?B?OWQrTzAwOUhuOXBrRDNIZnRDd2pmMFphVzNhOGN4MXdhZ2lZYkhCci8vL2kx?=
 =?utf-8?B?UEJSKzZ0S0pndVJGa1gzZDM3cFMwV2l6a04yQkZsMlNaMHlsbzBUOFkrWHVp?=
 =?utf-8?B?djlYU2JnZytnSnZ3bEJrUEl3Ni81RU1NWXMwd01Oa2FWWkVDc2hSbzJXVEVR?=
 =?utf-8?B?S1I0MnhqMzU2T1EvM0JKVjZpY0JqQ01CclJXUHJBN1FkUzEwSkR3RXJZbDNt?=
 =?utf-8?B?VEpncC9sVXhqT0xoQjhnNDVjd3FPN3lLOENham5XaHd3WUpzcVdNdzI4MC8y?=
 =?utf-8?B?S3R6RnAvaHNYaHV2NlJrVU1TNHJuZFB3aXdmK0JWQ3JuVkdwOGlwNmlhT0ZI?=
 =?utf-8?B?VVFXWmV4QTZMNEJTNWVXd1RyN0FjQmdpNy84bThmK1FRZTl5cERvSnZYNTk5?=
 =?utf-8?B?aWlYSThtcHdmdHFXbVNweVBvOGJVU2Nyd2NuU3hGdDhsWGFzSFlPa3QzYlJm?=
 =?utf-8?B?OXFxRE1PckQrYVR1OTFWS05PeHJlUmlpZ2NyRlVwTFBSTnhGSEhpYUh0bTl4?=
 =?utf-8?B?NDVKUXVXdVo3c2NVSk01c3hsUEcwZWlSblFLWEhteExPQytGcDloQ0FRN2VC?=
 =?utf-8?B?M3pwaStGZnB0Tlh0NGR5S2c5Zm5Yc0t4a1g0eFF4cGlIbFBLZzdLTmJQd1Fp?=
 =?utf-8?B?dHJScVZXaytzNjczOVE4bGRLM3oyaTE5UWFHcWVVTHF2UjVRWUdDNC8wcmp4?=
 =?utf-8?B?blhPSVd3MHNLZE1YRWFPa3puRllIQUlmTXdrSDRIWWk0cW5PUHpoL0k0MWkr?=
 =?utf-8?B?UmFBNzU5Qjh6YllETVByTy9POStObTlyL3Q1aEtFV1kzMzdjRVVPeTFLYkdT?=
 =?utf-8?B?VDNSZWxYZ3gxWmxyc2ZnZisya3RHTERpV1ZHMTYzZjhrOWluZXlJQS9Ed2t1?=
 =?utf-8?Q?DO3/2WnGSGSbyIFiUdL0or0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0b8931-7b41-49d3-b05b-08d9b108bdcb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4120.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 18:15:35.4312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLpHiHwA8sXQT7tEMbFoGdnQ9D3fjuGjnJGLWZpUByIO0nT/KHLnZeWlFZaEr77SFV89bDpiC2Ksr4RVM0a/jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4806
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

On 11/25/21 8:29 PM, Dan Carpenter wrote:
> Hello Vijendar Mukunda,
> 
> The patch 34a0094b9ff7: "ASoC: amd: add vangogh machine driver" from
> Oct 14, 2021, leads to the following Smatch static checker warning:
> 
> 	sound/soc/amd/vangogh/acp5x-mach.c:190 acp5x_cs35l41_hw_params()
> 	error: uninitialized symbol 'ret'.

will fix it.
> 
> sound/soc/amd/vangogh/acp5x-mach.c
>     158 static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *substream,
>     159                                    struct snd_pcm_hw_params *params)
>     160 {
>     161         struct snd_soc_pcm_runtime *rtd = substream->private_data;
>     162         struct snd_soc_card *card = rtd->card;
>     163         struct snd_soc_dai *codec_dai;
>     164         int ret, i;
>     165         unsigned int num_codecs = rtd->num_codecs;
>     166         unsigned int bclk_val;
>     167 
>     168         for (i = 0; i < num_codecs; i++) {
>     169                 codec_dai = asoc_rtd_to_codec(rtd, i);
>     170                 if ((strcmp(codec_dai->name, "spi-VLV1776:00") == 0) ||
>     171                     (strcmp(codec_dai->name, "spi-VLV1776:01") == 0)) {
> 
> How positive are we that we're always going to find one of these codecs?
> Smatch is worried we might not find them.
This code executed for CS35l41 codec DAI's only on VG platform. If both
the Codec dai's didn't found, sound card won't get registered. we have
added condition check so that for only these codec dai's set sysclk
change should be applied.

> 
>     172                         switch (params_rate(params)) {
>     173                         case 48000:
>     174                                 bclk_val = 1536000;
>     175                                 break;
>     176                         default:
>     177                                 dev_err(card->dev, "Invalid Samplerate:0x%x\n",
>     178                                         params_rate(params));
>     179                                 return -EINVAL;
>     180                         }
>     181                         ret = snd_soc_component_set_sysclk(codec_dai->component,
>     182                                                            0, 0, bclk_val, SND_SOC_CLOCK_IN);
>     183                         if (ret < 0) {
>     184                                 dev_err(card->dev, "failed to set sysclk for CS35l41 dai\n");
>     185                                 return ret;
>     186                         }
>     187                 }
>     188         }
>     189 
> --> 190         return ret;
>                 ^^^^^^^^^^
> Also it's a bit more readable to "return 0;" if we know this is a
> success path.
will fix it.
> 
>     191 }
> 
> regards,
> dan carpenter
> 

