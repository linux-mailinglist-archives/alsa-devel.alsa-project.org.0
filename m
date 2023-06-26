Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4E273D7C1
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 08:30:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1733683B;
	Mon, 26 Jun 2023 08:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1733683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687761059;
	bh=GktO6eDXuv2DOuK48h7KcBk8kIHUDINsHqrkqhSYXqo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hwoVOoW1p2Rye/cQ57CidIPkZdUUjezaY1HJU0F8A66e9JVqnHhSUYXwcUQOshdYu
	 F8RUrsggIgE88ju31Lklk7mOyuHYkoxcpCKP0ayLfkNgrbAPOCGURjhorVfpC+lmWo
	 V2h3oRLIMXr3WX0pW4OpW7zED/OUsiHn1ESVi85U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B112EF80212; Mon, 26 Jun 2023 08:29:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29738F80212;
	Mon, 26 Jun 2023 08:29:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9039DF80246; Mon, 26 Jun 2023 08:27:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15977F800E3
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 08:27:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15977F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=f7TqkScz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErIuxmRQhm5qyH+bAeYlpHuWuHRmE/1aCLlv9tJd7evaeov92hZThkDclBZNQLbMtaw3tOQ2bTIRRa7mPDtWK8umjBOtevfbyME5zxXbQMYjJSLj8yamWsw0mUZSKDmw4TCeHkgXaXsGdcwws/NNvoMzk0E8UkvRqcWDjG8n3nG0NWTbcjT1lNTnD32zzU63UFHBBAycbyBpifJaw0dCn4i1Kypy+MSlxp31Lxb98Qsz3KC+C265PzEfzHbyomdbuf6PAXOtdbGJ3WXsqTdcaw96KhDDaUhM7AggamsmZ2e8GCv6uQhQaYM+Un4tLuscMSgquoFN19dJXYV1u8+OSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzMfJVO70xe0E3tH8zN7rufz4UverhPwignVPwkV1yA=;
 b=GrCaFhnvDCehFJ/YNjj200F4azdOSCCNbAHnjRuho3vO4O6c1f/XWXzGoJK3SOoT9Cys2xGTIcNUPZ3okw7EP7G12lsUmUZFhX8NcbG/bMpSL6k8Rl1dBehxSKmbfXV17+pp2hhizNv/BLrTEDBugXF4b/7CdFeze+jxqrlHJYot9y1GBjJixrtm8rufWEI0prJj4jQxFNlTlMwNeU8nXuN6Xhf6IzhnJGFccSd5/B7DB6u3FgGlrbFykeMjEmdkP4G4g7y65huG62aW9PCMboWokq76jUWmor8+n2UfhEcglPC1FN/9Ek+tl5AMMmXZBtBXPzhlJBTyXe0HfET6ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzMfJVO70xe0E3tH8zN7rufz4UverhPwignVPwkV1yA=;
 b=f7TqkSczJawTVtyFD6KzWsVTcDFQAZG7iKvkXJbChyJAPhKHX0R5RS437jOJUh3B4R23L8lOu7k5Y37rVApEZcYfocgk2CYiJMT39MV0EI2DMDDlGVGGzFw/ZUOHJV+mCXv8WndEpaiAJ9WoTYqO2L6+vRu68YViLcElWtw6x8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB4770.namprd12.prod.outlook.com (2603:10b6:408:a1::30)
 by DM4PR12MB5866.namprd12.prod.outlook.com (2603:10b6:8:65::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.23; Mon, 26 Jun 2023 06:27:02 +0000
Received: from BN8PR12MB4770.namprd12.prod.outlook.com
 ([fe80::2dd2:bbdb:58c0:9bec]) by BN8PR12MB4770.namprd12.prod.outlook.com
 ([fe80::2dd2:bbdb:58c0:9bec%5]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 06:27:02 +0000
Message-ID: <38c6b1c6-0e9b-bf44-a452-d7f97d6a2401@amd.com>
Date: Mon, 26 Jun 2023 11:55:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] ASoC: amd: update pm_runtime enable sequence
Content-Language: en-US
To: "Limonciello, Mario" <mario.limonciello@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 sunil-kumar.dommati@amd.com, venkataprasad.potturu@amd.com,
 syed.sabakareem@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230623214150.4058721-1-arungopal.kondaveeti@amd.com>
 <80e86035-f6e5-3059-6cf9-7f6cd93fa2ee@amd.com>
From: "kondaveeti, Arungopal" <arungopal.kondaveeti@amd.com>
In-Reply-To: <80e86035-f6e5-3059-6cf9-7f6cd93fa2ee@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::23) To BN8PR12MB4770.namprd12.prod.outlook.com
 (2603:10b6:408:a1::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB4770:EE_|DM4PR12MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: ff0a7565-c2b0-4248-9539-08db760e59fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IasEJQO5Di5lFQ4+OtKkKzv+cZ5IZbf21SX9PbvhmXRFx4YhhGIls78QL3Kk4PKuSd5mUhBxUeJgKfRwkU4RBwe1Cj3HfwdZ6t3i9vp2fdSIkT6um7WUmUyPHfuuREn278sZf6XuKf4kyKz37335/zwyUTYrqubP7KwvIhrXiALgmCG/V14UKlUj2JxOOuqpr42bi4aNCtxL7MorX8D3khoO/7OHlGaCV/WAl3tEOx/d2aj3du5HiFMRoMp/9aKkCqzYWEiHTfjf8BYQ8rt8bz2Jpaijeg+AGF7W56BhXVpiOTjLB6LcUuR/WWZcmU5yyb0yrGozld/p/15kBuNFoix4COzeDADP5D/KLcJiLDGx1XSpTgZ+iYwIg8IKF71reZWPKlrZWU0Ym/IVoGqA02mN3kimT76Bi3kvQNg+PDz5DW8yLgcFqPxa/mYer1HsOLFCQFBpDQJ1iKQq0dzNpuOjbefHXEQJpMFlpLD6rjSae/CB5Mwe7/dtHoQ3lQcbzJVV4mNnWawYlgcg3xBB1YpmcdR/O6xfqSSk5Dj9aVa9pcvHrWsGXR0rJfe38OK/qcC9uwsltm+Rlw3E5EOfAIkXt4r/jaEBolaI81ZDQO3gOC3c5U2sOnlOjFsg7Y3pRsnj/YY0hDQctgUYBSkPFnVn/2RuINd6DLkpeoOMkKtq+wPf7f0AQ3ZVQ2PJaCEGkPNFkVDiJkdufUcQTiKR9w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB4770.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199021)(15650500001)(53546011)(26005)(5660300002)(83380400001)(38100700002)(2616005)(6506007)(186003)(8936002)(41300700001)(2906002)(66556008)(6666004)(36756003)(6486002)(478600001)(4326008)(66946007)(66476007)(86362001)(54906003)(31696002)(6512007)(316002)(31686004)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OWwrNVBJV2lQOUtkVkhDNk42RXRBb1Vaa3VSQWpjYWxWdHZMekpZRGlUWFAr?=
 =?utf-8?B?UU1WK0NiM1c4Slg2VDBvUUpKR1owc3ZlUXJLRVYxUDFPbWpaM1hITXV1dHNt?=
 =?utf-8?B?dTlGR01JTnNWKzBLMlU0Ymt0QWJzQm8xNk1YMmhhZFVpREJla2hiMGNnN2F5?=
 =?utf-8?B?MnE1QVZxN2tvbXRFUUsyRnNiRDYwWXlCa1lwcHRqN0h6R0ZQZjlDUmMyS3kz?=
 =?utf-8?B?TElXMkpPRVRFRmJnNjNEWHdoMnZ4R0VxUDJxd2EwdnNraU93RzZqM2I5OHlq?=
 =?utf-8?B?WXB3emtYVS83TEEvTE1kWVJmQ2M2V0ovL2ljOFhsZFJTTUpmRzJaK2NjZS9s?=
 =?utf-8?B?aitZcnFZd0lTUkFCUXhUV0V5SGloMTd0dmc5RG8rVG4rY2FPRTNqOVdrWjlO?=
 =?utf-8?B?ang2UmlhQUlVL2g1R21oZExtY0hkR2s2U1hBMXNEOTdTU0V6elRBeW16VkdE?=
 =?utf-8?B?SXhpUDYwQlM0N0syaEJ0NjlnZm9GMFFtVm9TWDI4ZDN6bjlWeGpGaXBaN1Vn?=
 =?utf-8?B?cmgwRU5EK0JVOXRZUmZOam1pU2tsRmxLS1BmT1RsODc1QjZ2TUsyYUxVMDFr?=
 =?utf-8?B?WlFacmtVQkZoMitwb2JSSXJwTXNEc2RPY0JxSkxoRzlwaUNGNkc3dHBTVjRS?=
 =?utf-8?B?djExVTRHYVUxSEFsYmVWYy9zMFg2cytSVFFjeHZySkFyMksxRWtLYlZXNEQz?=
 =?utf-8?B?OXNvRFhteWNLR3RWTnkxdXBRQmhkVlNITGVncmVHQVNja2t6eFBqMkdtOUNm?=
 =?utf-8?B?S0xJOXBPTExVbjhuSDltcnluSmhHS2d5dC9KV1FJZDRiVmJnbHhCME9OdDFv?=
 =?utf-8?B?ZWdVRzNSYko0bXhmYithWDlndlJnZ3V4ZXhaNzI2VnJ0V283d0l5dGZVa3Uw?=
 =?utf-8?B?OU9jTW9IYTZuYzNneDRyYWZheXlQQlNpenAvaWlxZEk4c3B6K3RlVUR2K0dD?=
 =?utf-8?B?UnJyTnpQTE1qcnk5Q0cxVDREbWVXTkJuaGtLOSt3eTlQMVR5WG9sS2xuZFpt?=
 =?utf-8?B?czZNQ1pRZllnWW5EUTFOL1hDOU83WnJMaVRpQi91L09xQ2xRL1RXYnBqREU5?=
 =?utf-8?B?N2h0ZWdDNlBlY1dHekkrTGRGa29kUnFMY1lkNm40TXBiQnYxdnlHKzVYVjd2?=
 =?utf-8?B?WVF0MU9meHJPTmprWlRFaU56cnRsU3dnNXJtaktFTEJ2cGdCcDNKQlRpdyt1?=
 =?utf-8?B?dEcveEVoZ0VFcTlqK1VLT0NrN1E4MjhvWjRacTNyUmk2S2l2NUM3RWlpRWZr?=
 =?utf-8?B?eEhxTDgxaCtYWEpZS0xjVGVRU2hOalhZaDdRVGNNbVREbW8weG9UcnFzdXNp?=
 =?utf-8?B?cDJWVXk3M2lUdDI5alRMekRmL1NyZ0RrSjJZQmdJLzdsNHFsRU1JTTN4UVV4?=
 =?utf-8?B?MjZselZ5ZGpsOE5TakpTYzlqenRCNG92SFU1cTNHajlheGRuSml3VWNwV3Bw?=
 =?utf-8?B?Q0pxQ01MY1g0SlRBTmtsNGhJVEVJOUVMNG9tU1FxUEtzVC94dERMb05VNjV1?=
 =?utf-8?B?c2tldjBXRC9uOGRJNm1xSVdNelZNRHdvYVp5RTltcGZuTVVPZXhYR2lLNFQ2?=
 =?utf-8?B?L3lyOGdVVWF5V1orOUxwb3dIckQyUW94RDc4ZlJZdE13eGlLT3hHNm9lOHNm?=
 =?utf-8?B?OWN4Q0Y4OGZqZzhHMHRYOGx3bmFyZWNDZCtwZzB0Z21IS1VjckxLei85bnh5?=
 =?utf-8?B?M0hPVkxkUzlYL29td2ZmanBYS3hIWEVSYlNaVkxueE5ZL2xTYmZBa0lsM3Fn?=
 =?utf-8?B?ZnFRMUVrMW5CcHRZbU81alFSeXZpdnExTWRHb0EvMkx3UXJxRTZpVWQ2TjhJ?=
 =?utf-8?B?c3dmNU1kWjMxMW1lejVhTzJLc2pGeGxFcURaRnRXZXBhM3VyR3ZxY3Vlc0JV?=
 =?utf-8?B?SnRVcDdqaUdaWTFpSGVPdWV1N1drUVZ3YWRpOFNzMUVaRlRwSWUxRFo4UGdn?=
 =?utf-8?B?ZVA1UHBRQzFzZXRyc1dpZ2htVlZaNG5kbWd1NTVMdWxWNzVKWG1lRFd0ckhw?=
 =?utf-8?B?enNYbEtQWFk3RHRmWC9MOWpHdFpjZHJEMklJdGUzcFlJU2ptY3dZcVlBWnRz?=
 =?utf-8?B?TTBrcm10eDZXdTBrZEtZUzhva09UM2dFOWlwdzc1YVozdG1UOHIxaTlFZmow?=
 =?utf-8?Q?F/qIq/kHrd56+tRKPssu6wVrC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ff0a7565-c2b0-4248-9539-08db760e59fd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4770.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 06:27:01.8351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oFXJ9P0+CA2bjg8C6+Co63oC6sj/cBGr3n/zETepnszvUEJeNphIGBMve6YqleqCHKf+Yek1o2AYMbcAe3znCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5866
Message-ID-Hash: 3T5Y6KEJCBWGUZ7K2HEKUSCPUPIEQL3I
X-Message-ID-Hash: 3T5Y6KEJCBWGUZ7K2HEKUSCPUPIEQL3I
X-MailFrom: Arungopal.kondaveeti@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3T5Y6KEJCBWGUZ7K2HEKUSCPUPIEQL3I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 6/23/2023 7:10 PM, Limonciello, Mario wrote:
>
> On 6/23/2023 4:41 PM, Arun Gopal Kondaveeti wrote:
>> pm_runtime_allow() is not needed for ACP child platform devices.
>> Replace pm_runtime_allow() with pm_runtime_mark_last_busy()
>> & pm_runtime_set_active() in pm_runtime enable sequence for
>> ACP child platform drivers.
>
> Can you explain what prompted this?
>
> Does this fix a particular bug, or is it just to correct
> things?  If it fixes a particular bug; I think it should be
> split up across 5 patches (one for each APU) and then
> appropriate Fixes tags applied for each on the code they're
> fixing.

> it is not a fix.
just correct things.
>
>>
>> Signed-off-by: Arun Gopal <arungopal.kondaveeti@amd.com>
>> ---
>>
>> Changes since v1:
>>      -- Updated commit message
>>
>> ---
>>   sound/soc/amd/ps/ps-pdm-dma.c         | 3 ++-
>>   sound/soc/amd/raven/acp3x-pcm-dma.c   | 3 ++-
>>   sound/soc/amd/renoir/acp3x-pdm-dma.c  | 3 ++-
>>   sound/soc/amd/vangogh/acp5x-pcm-dma.c | 4 ++--
>>   sound/soc/amd/yc/acp6x-pdm-dma.c      | 3 ++-
>>   5 files changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/soc/amd/ps/ps-pdm-dma.c 
>> b/sound/soc/amd/ps/ps-pdm-dma.c
>> index bdbbb797c74d..d48f7c5af289 100644
>> --- a/sound/soc/amd/ps/ps-pdm-dma.c
>> +++ b/sound/soc/amd/ps/ps-pdm-dma.c
>> @@ -391,8 +391,9 @@ static int acp63_pdm_audio_probe(struct 
>> platform_device *pdev)
>>       }
>>       pm_runtime_set_autosuspend_delay(&pdev->dev, 
>> ACP_SUSPEND_DELAY_MS);
>>       pm_runtime_use_autosuspend(&pdev->dev);
>> +    pm_runtime_mark_last_busy(&pdev->dev);
>> +    pm_runtime_set_active(&pdev->dev);
>>       pm_runtime_enable(&pdev->dev);
>> -    pm_runtime_allow(&pdev->dev);
>>       return 0;
>>   }
>>   diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c 
>> b/sound/soc/amd/raven/acp3x-pcm-dma.c
>> index 7362dd15ad30..9538f3ffc5d9 100644
>> --- a/sound/soc/amd/raven/acp3x-pcm-dma.c
>> +++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
>> @@ -416,8 +416,9 @@ static int acp3x_audio_probe(struct 
>> platform_device *pdev)
>>         pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
>>       pm_runtime_use_autosuspend(&pdev->dev);
>> +    pm_runtime_mark_last_busy(&pdev->dev);
>> +    pm_runtime_set_active(&pdev->dev);
>>       pm_runtime_enable(&pdev->dev);
>> -    pm_runtime_allow(&pdev->dev);
>>       return 0;
>>   }
>>   diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c 
>> b/sound/soc/amd/renoir/acp3x-pdm-dma.c
>> index 4e299f96521f..c3b47e9bd239 100644
>> --- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
>> +++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
>> @@ -430,8 +430,9 @@ static int acp_pdm_audio_probe(struct 
>> platform_device *pdev)
>>       }
>>       pm_runtime_set_autosuspend_delay(&pdev->dev, 
>> ACP_SUSPEND_DELAY_MS);
>>       pm_runtime_use_autosuspend(&pdev->dev);
>> +    pm_runtime_mark_last_busy(&pdev->dev);
>> +    pm_runtime_set_active(&pdev->dev);
>>       pm_runtime_enable(&pdev->dev);
>> -    pm_runtime_allow(&pdev->dev);
>>       return 0;
>>   }
>>   diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c 
>> b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
>> index 29901ee4bfe3..587dec5bb33d 100644
>> --- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
>> +++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
>> @@ -409,9 +409,9 @@ static int acp5x_audio_probe(struct 
>> platform_device *pdev)
>>       }
>>       pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
>>       pm_runtime_use_autosuspend(&pdev->dev);
>> +    pm_runtime_mark_last_busy(&pdev->dev);
>> +    pm_runtime_set_active(&pdev->dev);
>>       pm_runtime_enable(&pdev->dev);
>> -    pm_runtime_allow(&pdev->dev);
>> -
>>       return 0;
>>   }
>>   diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c 
>> b/sound/soc/amd/yc/acp6x-pdm-dma.c
>> index d818eba48546..72c4591e451b 100644
>> --- a/sound/soc/amd/yc/acp6x-pdm-dma.c
>> +++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
>> @@ -383,8 +383,9 @@ static int acp6x_pdm_audio_probe(struct 
>> platform_device *pdev)
>>       }
>>       pm_runtime_set_autosuspend_delay(&pdev->dev, 
>> ACP_SUSPEND_DELAY_MS);
>>       pm_runtime_use_autosuspend(&pdev->dev);
>> +    pm_runtime_mark_last_busy(&pdev->dev);
>> +    pm_runtime_set_active(&pdev->dev);
>>       pm_runtime_enable(&pdev->dev);
>> -    pm_runtime_allow(&pdev->dev);
>>       return 0;
>>   }
