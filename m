Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA676805C3
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 06:53:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5CBA1EB;
	Mon, 30 Jan 2023 06:52:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5CBA1EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675058017;
	bh=5YT8HsK7TdJHwuK25WgKX3hhY7KNdKC7A1uAX532n5I=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=anTEjO9OqIzL5kBum3mKP59IcBXxGZvyFLq8HW4pmCe4Ht3lAma/ZvZB7gQ47kh9u
	 kxgaa5mPInWeUBpn5NG3PgmxTu24hhdqHs0XBsWIP2hDNyFbmTupLV6aT2ZfYCpX4Y
	 P9YMOKmahJ/vQY8bfzaCWqqFapsDxjoEfgVFz1yw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD20AF80423;
	Mon, 30 Jan 2023 06:52:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1772AF8032B; Mon, 30 Jan 2023 06:52:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20DB7F8007C
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 06:52:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20DB7F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=G0DfSeJO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6ffs/aDz7BVLI40iTgoDBk7dRzc5kAjTznPqNBGRmc1YTQjnZwf/DVd7+frpXaTl/iY0ez5D5OCNW4VW3aNYmAyqISIP+Lm3JmfykDIoZpABFyYKeUjUdKep2rkkbXy2Qr7dtlM1aLe6K+6GBM725rx02wwwQnUyXsY1JYcx+rGBzfUaUfwg9uliDBiwsPsyDbS59AKDA/LefW3QFFJeHlulKy8KD3qlaeEtBuaeztlaUYkFO9lrWVp5epG1M4DvrJhlynrm0jgNnHQPMOrXCrz9m+pgC+1YO4MuzgyPrO3ZPMoCEEnNc8WBzWhewQRF3EOw0J92HrXRFR0DJ8v/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hICasy0Y6HwpZhFFLVfGZlE1GQZMFB6DmOlyO3Vyrc=;
 b=JJfU9u61ui5FfO6n/2xof7TK1XoJ8hKRL5ZFqH7Dv4uEv5rc6LL4NhrdeEBAJpX1xq1+tFpm2Budd/7mrg+PJFP+wrrf/awEZTgXbzLM6L6fUUxQSsZXTQvHRsfhvjr2NDz2E+GVeX8fMQUabEHJn/AB+cbnTOqItc9gnKxuSWhokHr9EQZWX+EuDsCpl3Gpj5sGm+caI6UNhvVidF8j/HZ7WaE8gLUr/rxGqagJjDqDW17gyZ2Mja8aipDkAuR0dn/x7VimakcwZxYNcvc4EGKpsf+H3MwkBqiqBgiiBr5yD5hv+C1BmtZBWgiWTGWZsLmgtcc4dcnXTX745eBJiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hICasy0Y6HwpZhFFLVfGZlE1GQZMFB6DmOlyO3Vyrc=;
 b=G0DfSeJOoGG6iVyfZab8K30avtKJSc0FEjcXXD+p8oH6ruBdUv6pSGt1hXFNNzbllsGMJMaccKPi2gsRgCwVC1+0LbZynNhFTUVil0aiD874/hqKb47BYAZaLmZgTFpsPGI6+f0GZc9kKZxGP296Gq79e0/PKfgUVvlyPcISo+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by MN2PR12MB4453.namprd12.prod.outlook.com (2603:10b6:208:260::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 05:52:12 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::14b:5647:a3c4:2c73]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::14b:5647:a3c4:2c73%3]) with mapi id 15.20.6043.033; Mon, 30 Jan 2023
 05:52:12 +0000
Message-ID: <bbf7a435-f391-7158-b9f4-3742dd140ccb@amd.com>
Date: Mon, 30 Jan 2023 11:26:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/5] ASoC: amd: acp: Refactor i2s clocks programming
 sequence
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
References: <20230109132104.1259479-1-venkataprasad.potturu@amd.com>
 <20230109132104.1259479-4-venkataprasad.potturu@amd.com>
 <92052eef-3c61-7f3e-75c1-09b76cd38e24@linux.intel.com>
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
In-Reply-To: <92052eef-3c61-7f3e-75c1-09b76cd38e24@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0163.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::7) To PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5951:EE_|MN2PR12MB4453:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ac2efb-0112-4d6b-0c67-08db028621f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9fqQYzsJauiYqySujLie23lypnQ73aFZg7YvemoCivBY3i+fJRxothL5lEoDKR3cU14RRIWKhZUCwPgSuq0WM9kptWCzXFPf9IJ7f3tMZAyMxFd9XewlMVRBQ40fn6eqxiqnevLT5njici+eSzT6RaC+hCQ6J9PsaACsxWdEh5rTZF20jGWAKpDrydJF8uOof0Y5RHIx1Utau7rQ5xUt+bew3+ATMgFnAK8YkBk74lHFp6drL9QrvvLUdrbAPTCzISL46FU+1aQFD9pCqkc0QRTIU5HOxioPPUsFVpsVd+mL4O6S4Ajaudhtx8JLGeN6pFPoUmXQbaK2pR10Rx+NykbJRo3qlCRGziPkKZh0r62GphYkfwufHMWYLRbc5/YmMoJI2T1X/M19vnK82yb/8GyB56E59Xuy0HWPuRGpWejZhBZ4U4J0xQ5F0BZSt+OzvK1I1OuWuQeD0YXX/mmDN60psI6hQ68e/DMfJWWBZsuoNeja0y75qF22iJskZxOqjgit+n6IfKTbUDxXkedN1MQze/VUvxiI1vA1pdeuz8nVZqLax/0wW4foRIDCPPlE+BdnNM3Idg+5olLFiKd9lNkVtB0PVkLQWW0Qowt67Gbnb0ubalVCrK4sVGa5QzFAwc/iJJI4k9YVHmGUJTKqiejcgDb6nGjkfWsL7cq0GLUkfK2fqbX9Y7oF/blsUGrTrISi8c2sQvNuMPYAQUaz/9sjVX1JpjA4E2OUhItfgfSaj7P7M0ZioOeySP8byQYxCzssoiL69lcwxJzZyS6P0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5951.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199018)(31696002)(31686004)(8676002)(66556008)(66476007)(4326008)(41300700001)(66946007)(8936002)(83380400001)(478600001)(86362001)(316002)(2906002)(38100700002)(6666004)(6486002)(26005)(6506007)(53546011)(186003)(6512007)(5660300002)(966005)(54906003)(36756003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVVGK1hNTHVxd0NiVlB2dUxHNXptWXpkYkZ6cFhNMjhtcGZWanlwWlhCdmQy?=
 =?utf-8?B?Um1zVzd4QW81b0I5RDFlVmZ2TGxjM2RSK1c1bCtGK3BxczJYWTAybDBqUlp1?=
 =?utf-8?B?RW83S1FscmN2M2Q3bUh6N1RYT2kzYmlEcVp4bjlzbUVKR3ZlVWZVdy9vQUlv?=
 =?utf-8?B?V2V1d1N4Nytvdi9JbE9yK1JJL29JVzNORU9WOEZ0aFd6Z1ZWYzErRVhZditj?=
 =?utf-8?B?dU1uaUNmeGVkTmxEUGJYUFVYZVBxZTRDc2ZXbW9GZWFoVEJaZkdKRGQ2OEVi?=
 =?utf-8?B?K2doZ0VZWCtzbHlJUjA5dW5iQzhxejhXNE1lWStxY1JRdVVJdDZ0QitNWCtp?=
 =?utf-8?B?VGl4THpBZWZpSDFybWpDNXljZkhNZjlvVFgxaXJnS3ZVMndvenQ2bFNqN3cz?=
 =?utf-8?B?RzdwTDJaeGdUUTdpOFRFZmZmcDZ1VmJ5MnBlRDloTXloT2cvOEhuRWs1NnFZ?=
 =?utf-8?B?OFBsSnhZNUt4a1N3YjFoemlQZXZBL00rU25CRDV1VXQ0ODRralAvajRWcGcw?=
 =?utf-8?B?Ym1hRS9aVm5CQWtQVkNNdlJzRGorZDUwLytDSE9qTmQrUnNwUzI3NEN1TVJy?=
 =?utf-8?B?TXlWSXpjOUExdS9HNUo0a2k1QW5KUU00cmU3eklzT2oxV2F1TkhldHZ1WFBk?=
 =?utf-8?B?NHlYU0tZbkJXUzlhMW51UENIYWhFdElOMnJDSWRDdk0wakdKTkVhUytTK084?=
 =?utf-8?B?eGZ6VGVRMHpEUlo1cXYxK2FUNVRFUzBKU0NKNms2WVV6M0MwRVRFb3FiaW9J?=
 =?utf-8?B?Y09XeWVqbnFuREVXTTBHRHZsWC95a1duVFozaHB5UmN1Q1dqbmhEUEZTblRv?=
 =?utf-8?B?TjBjbWVJRW8zTE1JeUdNSTVaUUZZNkdFNFlPenRkWHVEZW5FTHUrYjFRUkdI?=
 =?utf-8?B?eE8wcDFTTlFxNGFsTjFoeG9OWFY5K0NwVWhFRnFLcUxZZHhXZm1JZlpMclgv?=
 =?utf-8?B?eEFwZC9FMDNyVEk3L1VpdmNoSko5Sjg0RVJRYnNsMzBobXRuWlU1OXg3akxT?=
 =?utf-8?B?bTRXVUFQdEZFcjFLZC9Yb2wzdUcxWDJkUld6TmxWSzgxRXJaSFpxbWY3TmJl?=
 =?utf-8?B?c3AwL2pDV0d3c2xRSWZ1ME9ZVFkxbXREc1V0ZjRRMlpPQll6SEhnU0pIeUVz?=
 =?utf-8?B?Q1lzdlArVHBMb1p1Zy9Wek94Q0g1TFRUMVp6Zk02VjRibEZObFdDbEN1SDlP?=
 =?utf-8?B?Vm5aWCtDakVkVXBLTHFlTEZZTHQ0VEVGandxaTlEZ2x2dnZLcHA3elF0OEZx?=
 =?utf-8?B?MytlOVZlS3JvblBDbE80MkY5dXhOdEM5OWVjSTZoeENqT2RzK0xOOW1KZkRz?=
 =?utf-8?B?K0pDTDgreFVST3k5ZXhxVy9mcjBTa1FRM0pXa1daSTBjMFhGVE9ON1JjcnVk?=
 =?utf-8?B?c2J1R2dhTlhKSkZnamhWVS9qNW5rbXhydzJuZ3crbmR1OC8yYWl0T1ZHdGcz?=
 =?utf-8?B?NUdvaGpFSUxRVStReUZUS01lOURYWWNzczAxc3I2MTBDc2hjdDIyK1ZKUkp5?=
 =?utf-8?B?TmF2UUk4Rk01djRHSTRubmo0blBnM0g1dWdZZ3QyUUJiQW16S3BSWWtsVnJB?=
 =?utf-8?B?MExjQXpyRG45WlVRVXdaNlF5QitVT1pUTm91N3JPOVVXMHZwQ1EwTW1VQ0VG?=
 =?utf-8?B?Vm02WlhncWRTSzlmbnplajBxcnprYjZUZjZkUjB4N2R6ZldYY1pEY2c0bFF5?=
 =?utf-8?B?bkFYTGE4UXh1VWdzUmNJQmhzaXFiTEREQ3RpU0ZaanRoY1JRV0hYOFlFem1o?=
 =?utf-8?B?S1dsNVV6UGIvSXNHVkVFaEc4d0U1ZUVWRjF0d1dDMDQrTEdmeFdva0l1R1d4?=
 =?utf-8?B?MXp3Z0N0dUxTTWRTSjE5cHB6bE1rNG9namk4bWRvenJ2MG40azI3a2pGSTNQ?=
 =?utf-8?B?c3NnQnNNYXNJVjJuV05NdGxwL0lsVys3ckV6dzJadW9KVm83SWdOTnkvdHJZ?=
 =?utf-8?B?VWNwV3RrMk9wdUF6dVVHVDBIN3U5d2MyZG9QdTRoR0Q5L2N4Ni9GcVY2TjBC?=
 =?utf-8?B?c2pZbjg1MlFtWUdNd0ZqQ1phV2hxTWlHL21hOFRLd3h1eUliUFAzdHQ1dTZq?=
 =?utf-8?B?ZmZxdm43aFoyTlkrak1ZV2crYkhENjdnWjFaUUVEM1hOMTBSL2NCU2tKK1pE?=
 =?utf-8?Q?HuZyQ5Fx+JP2Adq540QKWtj09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ac2efb-0112-4d6b-0c67-08db028621f0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 05:52:12.3654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0V6c7AGG4nqurA7ML1a79Y2GpzOLEX+6CDTWItkCyrPb7TseKxdsXwvfBFwS6mHQn4ZEvO4WHLurF35Ce707pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4453
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, open list <linux-kernel@vger.kernel.org>,
 Jia-Ju Bai <baijiaju1990@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Vijendar.Mukunda@amd.com,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 1/25/23 22:45, Pierre-Louis Bossart wrote:
Thanks for your time Louis.
> This patch adds new Sparse warnings [1]:
>
> sound/soc/amd/acp/acp-mach-common.c:189:35: error: restricted
> snd_pcm_format_t degrades to integer
> sound/soc/amd/acp/acp-mach-common.c:333:35: error: restricted
> snd_pcm_format_t degrades to integer
> sound/soc/amd/acp/acp-mach-common.c:478:35: error: restricted
> snd_pcm_format_t degrades to integer
> sound/soc/amd/acp/acp-mach-common.c:619:35: error: restricted
> snd_pcm_format_t degrades to integer
>
>> @@ -193,7 +163,11 @@ static int acp_card_rt5682_hw_params(struct snd_pcm_substream *substream,
>>   	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
>>   	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>>   	int ret;
>> -	unsigned int fmt;
>> +	unsigned int fmt, srate, ch, format;
>> +
>> +	srate = params_rate(params);
>> +	ch = params_channels(params);
>> +	format = 8 * params_format(params);
> This last line looks suspicious, no? format-to-physical-size conversions
> should be using existing macros.
>
> Should it be
>
> format = params_physical_width(params);
>
> ?

Yes, we will use params_physical_width(params) and update it in the next 
patch.

Thanks for the information.

>
>
>> +	/* Set tdm/i2s1 master bclk ratio */
>> +	ret = snd_soc_dai_set_bclk_ratio(codec_dai, ch * format);
>> +	if (ret < 0) {
>> +		dev_err(rtd->dev, "Failed to set rt5682 tdm bclk ratio: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (!drvdata->soc_mclk) {
>> +		ret = acp_clk_enable(drvdata, srate, ch * format);
>> +		if (ret < 0) {
>> +			dev_err(rtd->card->dev, "Failed to enable HS clk: %d\n", ret);
>> +			return ret;
>> +		}
> [1]
> https://github.com/thesofproject/linux/actions/runs/4005001249/jobs/6874834205
