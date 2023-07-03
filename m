Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D33745ED6
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 16:43:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44C4B1E0;
	Mon,  3 Jul 2023 16:42:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44C4B1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688395392;
	bh=hHhd/GF4jIVfrXixDaBHKFt/VdrXIcFdkNnZt8sv0pk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=soo461Q9PmoKuGMOXtwmC57tY8nEZWa+xCpJclLWSH5Nd6TjInfMndHp0V9/cNB6W
	 7lKQEoU3PlQJkpS5Z1lJ8ZNS9L9NA449n+K82fdqzInT8w1Ru6YgInut+1veRzqIjJ
	 vXaiLAW8SuXd0y7/a0x+sWmTc9JsCx+THYlAxV6A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5E6CF80104; Mon,  3 Jul 2023 16:42:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BB3AF80124;
	Mon,  3 Jul 2023 16:42:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3DE1F80125; Mon,  3 Jul 2023 16:42:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62CBAF80104
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 16:42:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62CBAF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ZI8WBk/3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0Nxj+1zrxzq6A4C29cJKv2XV+VIssTWpE1IYzJ3ADlptKTaIJg3NtXSXbTT8c+OiizrJimn/vf87zMo6nstuyPoFuqL7ubzSJ+H16kg4ti2Am+uSawzQHNg2hXtKTAKfjA/qj3JnPp0Zzlm8YGeOM2hlh9goqWxhCrkYB5rbFNoIpolPpINs0cDxmVAHVDH3ZWPK34tnltsavt85yHa3OVUVN2kMcR4KUTgtj3Nils2FRqe5BZnJqZN5eSwCwP+RLrIrgWYD3X853f18ajkkmpbpLCfCUukAAoRToTt4p12K7BB8mtiZMZl0iW8XhCEa9e6jiTRW97W0IURbWX79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQ1gE/yZ0B4X0w6O/K+a83BDi04ckVNf8bRTkBN+VXA=;
 b=H/4Ouq4e6WS344nMci7virrz4tQGVXoNZlf5JW6L5IJGegv4JuOMtaxLp1K7ctnt/KVSZqpHSthRPdXO8FSPItnziqkyzMflmLuNGMZOEtqdu+oezgYWR7ySpl2S53bjBLOq7GC5RYBK1bq6Ffq5/TiwvYl4n+B9t+t27F1P12NS4054E/MK9GJwRU8BohrshHXQK5wY7LabGx1pXvPB1v9IuJTYtciq97vP9G0xGaV2hFLtzepw4VRjqs5UC6kr/VypJnWLb5Sn/l9qp/7ybzdMNy0p6pMGMcHaEEh2QvZ+mvjd9q1UJcqN+bwNaSKDi3RI+5ilyYr2ywScqHwdhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQ1gE/yZ0B4X0w6O/K+a83BDi04ckVNf8bRTkBN+VXA=;
 b=ZI8WBk/3Pw1hJETCqHiCEjF4wmX+lgKcJMIXLXoONxR/BLWwriYk1oVcjQGbL0mOI38at2ZttBkgIjqcVSrFJMj7kCQmV2QCctMVJeCh1rqE/bSiC+4ev+tsXxEjj3/49Ei6dzi6ZfFoXM2itKdePlCBCx7/0PTBM3OIuGIhv3Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by BY5PR12MB4243.namprd12.prod.outlook.com (2603:10b6:a03:20f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 14:41:58 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::8760:2e89:1243:2b5d%7]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 14:41:57 +0000
Message-ID: <a8c7ac88-4546-2b57-6f26-5ae2a9e603e4@amd.com>
Date: Mon, 3 Jul 2023 20:16:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/5] ASoC: rt5682-sdw: fix for JD event handling in
 ClockStop Mode0
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20230703090247.25261-1-shumingf@realtek.com>
 <f9e83b61-6e69-2467-d5a5-3c3a6a40e018@linux.intel.com>
 <81bf0fcc0b824c928e2e4e5a77ca37d8@realtek.com>
 <a10894a2-a6af-8c5f-b675-79cc7cfeb899@linux.intel.com>
 <1fb4d8ea138140d291a395dc82e710ae@realtek.com>
 <489e8631-b773-1916-40a7-3fd73af54c19@amd.com>
 <80c35e78-b82b-5d8a-bce7-fa8bb61e16cd@linux.intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <80c35e78-b82b-5d8a-bce7-fa8bb61e16cd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0229.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::11) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|BY5PR12MB4243:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a2dc3e9-ec17-4fa1-51af-08db7bd3a715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nKZI4a2h3J+1Pf4RLYTxSaqXnZ0tBmdnikQKtEDKYjf+0doLRETIKMLBLAjmUR7X++xt1y4jhRXlL2DsF+8PRqwrIrPgPE3CCimrjK7boXASWXqvf1L4RBjp3jWtf87JYSkNfUsLG6rnowfilZVYAXm15znpeMx9KFg/KeXNrnvsnNOyZvrNbrqtUml/hvO+9qoIhGGl1EVJcDFDsEFLU5Wkn9qSvBo5t+LKFStApRTZ8dDDBorCyogYMQRP84X1ICJLBi8FAcEk0UcOeGFmF4tRdIsuIHnvwMHSGzgfO0YU01saRj01VgIcyIbG/9tAR2/ggpN9pNhKef8LS+VxHHaMMoY6QOe3NCTxrna6s1kT6DAxqaRIPEz3ESRkp/mnyBjXr7l4y4Y0vSovOBgdbedUNlzBww7pKrS0mqWKttlC2CD9os528agFZ98JjNzKqb99t8jYMQl+8mchGRuWstSnpp+r2adFfsGw7/wt69Hd+P9YtNXJg5CqSUiZr+3bcyO7EitvLys62BFu7QBNC+B6d1wjb8sBMawHz3H/hrPbXeMpXnuhls3o0DRsJCRLroqb9JPxf827bMkiqWyhqehYMutuPEul1VyFuhVpV4UFZ6z8rZIq6PIPrq3/1sIA45OpQfASQsJ5bdzgEUdAEQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39850400004)(346002)(396003)(366004)(451199021)(6512007)(6506007)(53546011)(38100700002)(316002)(66476007)(4326008)(66946007)(66556008)(2616005)(83380400001)(186003)(26005)(478600001)(110136005)(54906003)(2906002)(8676002)(8936002)(31686004)(36756003)(31696002)(5660300002)(7416002)(86362001)(6486002)(6666004)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NXVxQTFQQ3BXZFUrL1h4dXhLd05TOTduZFdsVG5HOTZpZnBiT1duenZQSHl1?=
 =?utf-8?B?My95OFNONlIyOFRQSjNKTlgvUC91aWtSTng5aHlTT1hDbXZaMGo0c3JCeWZi?=
 =?utf-8?B?R0NTZmN4MGtsT25RL0lKZ3RaLzNMVUpOU0hMZ09tRFFibzRlU2pNaStaK1lY?=
 =?utf-8?B?ekRuK3hGcFZncGRNK3E4Y2JNU3R2dDBJbTVXQkVvKzRoRlVrbitnQkk2NDR5?=
 =?utf-8?B?NnozQkhjRU1WR3RJRWpWelV3TWlvdUVlK01yT3lUUEMreFpQN0tiTnBiNHph?=
 =?utf-8?B?aTVWUTlGNjRCa3dFSnR4RGJZUTNBdis1NUlvbTJZQTUxMXpHTmhNQ1ZkZzhw?=
 =?utf-8?B?aUlwOGxRSnRpSGdsSkJMdWs2QVZjdkxWMTBySWphUnRpRDZHb2JaZkV0MDdz?=
 =?utf-8?B?MjF0ZjRpYm1qY0tvWVdSWFF5Rkg3bUx5UGNCQTNhaFJ5cFdiSTQ5OWJBUGdq?=
 =?utf-8?B?dzR6OGYyZVhoL1J0QjEyaDVWOG02UzdMMnNpdFZ0MFBYOGpjaGpMYjR2dG9k?=
 =?utf-8?B?RFcwUGxIcTYvcm85M3JSRmdPRXZReWxVUmRicWtDUzI2N0hvejNDUDJiVmdq?=
 =?utf-8?B?ZXdzdk9YTkozTVNteVBaQ1gwNWFBMkZ5bHFIQTN6M0lxZkpFR1BhbXlWZ1Zu?=
 =?utf-8?B?a3RPWFdqQUFiUnp6TkZWVWUwOGUvSWQzaFZPZDJwRCtPWDVka1orZ3Y5UExH?=
 =?utf-8?B?WmdYQ1dzVWtFT2I2UmM2NUdvZ3gwZVBEUk1nQzR1NlVoajd5UkNjOFhoMXRl?=
 =?utf-8?B?S3NaVWxTNkFYY1phQnJMZkxLYWZNQnZDbGxxcjRJTGF2YTRzQkV0MndoZFNR?=
 =?utf-8?B?Y2JKcnhuYnhNUDR0WDJObzBDckFwQkpxS3VxSGE2SXJsakJMdktaVHJnLzhz?=
 =?utf-8?B?Q1R3WVZRaUx0T21uUTVGdGNCVnRrTzhuaUNHWE9JTjB2b0VJQjkyZmFWSDd1?=
 =?utf-8?B?NDNQZzlLMk10S3FRYTFZYXVCMVZuQm1oeTd2a25OampKUUVFQzNoQ0JhNmxC?=
 =?utf-8?B?Y010SFdWcW44TWxnTENGTmZKTE9FTWdsdG9TTXU0S0UrMzBpUTlvY2lMWEVT?=
 =?utf-8?B?S0NCOXNEYTU3VnZUYys1b0QxV2pQWktYYVR0WHlFaUhjL0lzYWd0elYvQ1FX?=
 =?utf-8?B?eEhteWlHSDFzMDlscHluSEdUNjBlTWxJZ0dKa1JCRnovczUybi9aOFpBZXhB?=
 =?utf-8?B?WGZ6WWNCVDkwQ0kzNklzc1RaTjV1OEhWejJyVmZ5cTVDTDBXNmFEV3RjSW8w?=
 =?utf-8?B?OEUzNTMyU3MxaW11Ti94VUo3Z0ZrQmlOZjlIT3RDTmFaSDNyOWlObllNWk1j?=
 =?utf-8?B?OXhQRVA1RHVxV0NFOGs3aHdERURsY0NURXZDdnl1WW9LeGF4eER5VmxGQi9j?=
 =?utf-8?B?R2lyeFY3bmFGWkt6TmczWUNRT2JMT3IxY2tqQXU4U0hXTzZCaEU3d3JpckhT?=
 =?utf-8?B?STVhSkxveDN3UXdYZGcwbERlYkNpQ2hOdTBTM0Q1Rm9pN2t1VjRQLytJWmlo?=
 =?utf-8?B?MjVhNU9oME01N0F3cDNVYlJqcFZDTUxHUzRvQ1ErQXFDTGRkdXl5dElpTXFZ?=
 =?utf-8?B?QkdRN2wwK2VtUVFpaUFtTTdtd0pPaGNna05TUGV5bWc3bWZldFBMWmRSL3JZ?=
 =?utf-8?B?YU05QnhQbDh6WGNtc3o1cUdPY0dqTDVPdkNLUHRJd3hIeXo5d25weUNOc0ZS?=
 =?utf-8?B?eXcwbng3YlBHbXZ4NnVjM1h4enBOR0Q0aERzU3l2aWdpRkFWbWc0K1Mzczd4?=
 =?utf-8?B?UlNSUUJBbjNvQzJabThkdXpLd1I4MTIzV2gwM25nZUJiWUZSRjdrVS9GQVVL?=
 =?utf-8?B?eGdnK01BUTc0K3p2bmFJWTJtTTNSaiswcEduUmM5R0E0TGNyaElXRWlJanJo?=
 =?utf-8?B?cVk1K3MzelR0eTczVndoNythY3laVHYrWlZseGEraGpCMlBCTkRyWWUvS2tZ?=
 =?utf-8?B?dTI3dndsZXZYa0llL3lwUWFMNytOa2pVK2J2RzVTVHVsK09hS3BwaURiVFpY?=
 =?utf-8?B?eVlpelExZ1NGejhQKzhWaHlkSGEzNGE0RW1qTjdhbzdjY1dISldvWWlqdWEw?=
 =?utf-8?B?QUVGem9JUXRnUHQ0UDBQemFtRWdCU0pxNEtwb0ZXTzlyYk8vK0RoT0doUUJ3?=
 =?utf-8?Q?iHNKCBtbwKGXlZkdkiVgp2KYG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4a2dc3e9-ec17-4fa1-51af-08db7bd3a715
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 14:41:57.7917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 t7K0UeMbH5fApFJZx+AmhRHemmPxXyDEZIqvwbrl5EBKOOXlbrQUfk9ou525K1f9xrPQdI24AHsxdwl31zknVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4243
Message-ID-Hash: 5P5HETVXEQLRBDHJZNDSIT6JZSONEAWZ
X-Message-ID-Hash: 5P5HETVXEQLRBDHJZNDSIT6JZSONEAWZ
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5P5HETVXEQLRBDHJZNDSIT6JZSONEAWZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03/07/23 19:50, Pierre-Louis Bossart wrote:
>
> On 7/3/23 15:31, Mukunda,Vijendar wrote:
>> On 03/07/23 18:30, Shuming [范書銘] wrote:
>>>>>>> During ClockStop Mode0, peripheral interrupts are disabled.
>>>>>> I can see that the interrupts are disabled in
>>>>>> rt5682_dev_system_suspend(), which is NOT a mode where the clock stop
>>>>>> is used... I don't think this commit message is correct.
>>>>>>
>>>>>> The IMPL_DEF interrupt which is used for jack detection is not
>>>>>> disabled at all during any clock stop mode, and it shouldn't
>>>>>> otherwise that would break the jack detection.
>>>>> You are right. The commit message is wrong and not clear.
>>>>> The situation is that the manager driver uses the clock stop mode0 to do
>>>> system suspension.
>>>>
>>>> No it does not. The clock stop is ONLY used for pm_runtime, never for system
>>>> suspend. We cannot go to system suspend with the link in clock-stop mode,
>>>> that will create lots of issues, that's why we perform a full pm_runtime resume
>>>> in the .prepare stage.
>>> OK, I got your point. Thanks. However, this issue reported by AMD. 
>>> The AMD platform validated system level pm and runtime pm ops with the different modes.
>>>
>>> Hi Vijendar,
>>> Do you have any comments?
>> On AMD platforms, we are supporting two power modes.
>> 1) Bus reset mode
>> 2) Clock Stop Mode
>>
>> In Bus reset mode, bus will re-enumerate the peripheral devices
>> whereas in ClockStop Mode, applying ClockStop Mode0
>> in both pm ops (runtime pm ops and system level pm ops).
>>
>> Currently, SDCA interrupts are disabled on peripheral side, when system level
>> suspend is invoked.
>> For ClockStop mode SDW manager is not receiving any jack alert when
>> SoundWire manager device is in D3 state.
> That was precisely the point of clock stop mode: a peripheral can
> restart the system even when it's in lower-power mode.
>
> If there's no means to let a peripheral restart, the only benefit is
> maybe to skip the enumeration time. That's not what the spec intended....
As per our understanding, you are pointing to ClockStopMode1.
ClockStopMode1 requires re-enumeration as peripherals move
to unattached state.
We have cross-checked ClockStopMode0 description in spec.
It doesn't specify about peripheral device state as Unattached.
We are referring here "ClockStopMode0" only.

>
>> Our expectation is when ClockStop Mode is selected, Only ClockStopMode0
>> should be applied for system level suspend as well.
>> We are not expecting bus reset.
>>
>> We have validated these changes on our platform with Clock stop mode.
>> It's working fine.
>>
>>>>> The SdW device will not be re-attached when the system resume.
>>>> it will re-attach, and in addition it will lose context because the manager
>>>> performs a complete reset of the bus.
>>>>
>>>> So what's needed is to enable the interrupt, no matter what happened in the
>>>> suspend transition.
>>>>
>>>>
>>>> ------Please consider the environment before printing this e-mail.

