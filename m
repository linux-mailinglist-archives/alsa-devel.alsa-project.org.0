Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C20D72CAF2
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 18:04:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66FC9823;
	Mon, 12 Jun 2023 18:03:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66FC9823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686585887;
	bh=VUEOEa4SGf3GUi69OlbiGTynJsYqazdK6TXMcGKAp+M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WmAmfqzNbT5+31yJUb7z68Kwu+5AY7FbHhhWfqggO0Ayvy3r3VbAARH8rQReicOkF
	 1Nqc3acjll472onzEaftEbDlNZcaeFr1TzNxsmCSakOi6va9ZVeSg072/yzH5+74u0
	 ArGpbPq9jQuJJUgxFlyr6ofK1L+mpzGFo3zuctBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74F22F80149; Mon, 12 Jun 2023 18:03:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84D26F800BA;
	Mon, 12 Jun 2023 18:03:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3D48F80149; Mon, 12 Jun 2023 18:03:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB555F80130
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 18:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB555F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=U9dbVpdS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ofgp5igecis4xvPjiJCLug5UDr9BKV2uZQ5QddDXMK8SIXg/f6mfpW7bdw+D45rNCg3zIsvroRLEzNEo+08v1YRKTPPbZygj13JyIVUGCcU5on52r0C9lMXYlBX7of48a7AtVJX6C8+oGw1oIPNSQZv8XjMdBCpbaVs9h83gaeieHHjOuGjye47ytdhD63j0l2qGzlNrfNcCYBfQ5+D4dIainkrufJ9MQMzigtKWgJmTNvE449UJr3kHR73r7oIpO/3qoUaiaod1kUTgRPQfg6F/6ZzCBELImYEX82q3dkD9BoPKokR+7CNC1t/tcqp+a+YKj5wagYpR9NkTzjsvWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/CuGEyAnxI5pkvbZvfLRrLdC/9tCUsqhCzMZK6PESY=;
 b=QwdheXDhxN2MzJZsVyZqjoHZ8eM/5khnZ40ezLwOsVTP7bl3Nbeyp2EHvcrbNdj7GJ4yM3CQFLQA44kE2e2/Th+0b8Uzl822SV6Dh0bIgYb7etab36WXR7YB5otstprLr9fJv8zIVuifdKwN/7Blg/fBDIxvWboedvFpnZKkskVXStfnIgvR/CF99qXK9lL6hEmOCXqUJ0nmrejXqICDJzvPMgTOnPeSIB76oK3b3taQL8hRWWkrTJ7vRW88QJX1fR8n8LcPIijhbjNYemCbeBwjwWDjgQKOZj4trVKKTXdpM7+1PPkaxaAMH+11dY/JPxWG4F0rwSFBC4E2k2MxLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/CuGEyAnxI5pkvbZvfLRrLdC/9tCUsqhCzMZK6PESY=;
 b=U9dbVpdSkRstPVGbKmSaGl6g6pPXP0KBizDrZnit3vIoYe+tX3sd2E4ThMFaMRxYnJ5aEvID1JgIj07pwZ2AFhsNdSUjcdE3im3kMjceFciEUvbn7b2PRYy1K1ekiEx7O5gP41sBdwOz4BynqJ/EgcqRbaCgEt/Fx7wVW6+mEkZjo0bxqyiJ6XO2QMgCRX49cHD+t5pHYBhYqMfciiKVPJC87jv25OSuJptJHnElQVYQNvsDIb52vIWZj5MFdh4AITvAHFvsnoETE+4F0o3ZzCBaEj7vLh47AKElsu4obGZFPYUogZUo9kzJ1H3Tm8qeL7D9kxoVOp3uaRZqN/B3Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MN0PR12MB6269.namprd12.prod.outlook.com (2603:10b6:208:3c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.42; Mon, 12 Jun
 2023 16:03:12 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8%4]) with mapi id 15.20.6455.043; Mon, 12 Jun 2023
 16:03:11 +0000
Message-ID: <9f68afaa-3bba-a154-db4d-ac6f3d6795bd@nvidia.com>
Date: Mon, 12 Jun 2023 17:03:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ALSA: pcm: fix wait_time calculations
Content-Language: en-US
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
References: <20230405201219.2197774-1-oswald.buddenhagen@gmx.de>
 <b57c46a6-4446-3418-fc4a-8bef1e28868c@nvidia.com>
 <76082a48-508b-e5cf-6ae0-66c265ecfdd7@nvidia.com> <ZIcrlOSlA233SC2y@ugly>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <ZIcrlOSlA233SC2y@ugly>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0464.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::20) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MN0PR12MB6269:EE_
X-MS-Office365-Filtering-Correlation-Id: ecabed88-a272-4d84-e70b-08db6b5e858a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+odpvrAtZpjHFf6SrAX0un1WB31X/qznNH/IcQboRuz9PG9TDBxaH/rlrlk1W8AtsHg3IX+bAaNCDRdifCJylakeEQIge0ta9V1WVZwa/tgZNt+Fuog2h4iZi2hufEf5M0pcHGW6hxv3uAeHqz50aWKAhJruqL0XsmL/JA1ESDa9F6fF43Rm8YEIcAeNXzMYz3LJ8Knw/cF+oBVu3Xx1UkjUsU5aB8zUuMCANHMiqo/rN9+4xz+rHSxZRN7+LyIv9O56QLBod2/nGRbt+7J5SLOb6goKDTihqAvwwHJtV/I89Jmq6pzOrBA2t3cFX95z3GnbDz1NBDZpV3wMewsJMtQD1pS9oGq/OevP36RmhSH7aVcmKyA6cbb8BnaqfQ+a2rk2DBYk1IE5/iFyoTW4jgfOwqD4GbPM5zjbGz+LeEgwt48Y254s2iBxfVUSY8MHVDDi1GyC5WqxN2VbXSfIsO8zI8GRfJYeieC8FIB9bpWWMlXuwTgHHrhvfyJTXs3DL7l0BC2wRbK7vr/OGu16HW2IrrfZNx92XPRDMAMHtXdXJdfbJTs8//8giDPpkCNqyWfuFvqH7CZk23qnYKTZS+zo+DkDe1RRaDzo2tY6X2pi0Tq271MNgpRA5dBxrjAbMOdXW0ESGfJ8pgus+sEsZA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(451199021)(6486002)(54906003)(508600001)(4326008)(66476007)(6916009)(8936002)(8676002)(66946007)(66556008)(38100700002)(2616005)(186003)(83380400001)(6666004)(53546011)(6506007)(6512007)(5660300002)(86362001)(31696002)(2906002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L2RPQm5QaTd2NE41K3FyR29RMDVpVzR4VUdpWVdiRDJsNkJuSTNrM1F4QStX?=
 =?utf-8?B?anl5MmtaR3lRQ2QvTnVqVmlBRXJVa1NaN3hhU3Z4Q3MrQnpVcUMrZ0JnV2pM?=
 =?utf-8?B?NDEyMGZ5OThVZlBlcFppeXRSQkZ4eno1UWFUZUxWc0w2dHNZTEdwQWJyUmxp?=
 =?utf-8?B?aTZmMERObXBpMEVueWZBc2Q0ajhrSzBHTFQxY3pZR24xMzhVK0V5QWQ5akFq?=
 =?utf-8?B?NzFjTUJuUDEyaXRXRGN2eGhBbzJOVlJVRVB2Z1JsYTRsemgxeGJiSWpVWEpJ?=
 =?utf-8?B?VzgvSFZvaTgxQlJOeDc1NVlCT3JnOWpqVWwyUHh1NERLTnBPVWR6Z1ZvdVE3?=
 =?utf-8?B?UjZkN3k1L0tRNjhIQTdxVUNQeDdnallHeVN6bTZ3VmwwU0d6Sk15UFhkdHdV?=
 =?utf-8?B?TG41RHMwN1dMM2IwZ2J6L25rQS9jWCt0R3VDcExYMnJ6MGNHV2QvSVpWYnZv?=
 =?utf-8?B?S1MvVHRpUVloazQzYlpyYjQ0N1cycU1VWTJuY2VJRFhndmxaM3lmYVlIS2pX?=
 =?utf-8?B?dU1VNDV0NFBCS2pGY1Uwd2gzaTBVK2JlSEVXSXhCUFExOWZpV1FsZXJEakJI?=
 =?utf-8?B?RWNrZXpRYjY3VXF5MFh0VFN1NE1ZZG1OSlptR0hoK0t5a2ZBeVFyNG5RWXdB?=
 =?utf-8?B?M2NGSVZNYWh4SjhOZXlNeFlsdGJUNWdtakVLazdId0hZeW5QYnVLSnpjVEZI?=
 =?utf-8?B?SkpjdkNNY0xBVFlGcmV0dTlwT3p4Q3UxQkpteXRyTVZrSzhqbStwVmdma1FR?=
 =?utf-8?B?MlZ0QVcwbm9XbTY4MGUreHVQcWNBYWxjYTBOeTVVRmN3TWFacjJGZkd5eGNm?=
 =?utf-8?B?anBhZkcxbVRCS2ZpM0FyQ0NKSUZ2dzMxSXNHbWpxQmRTakFQMDBFdEpZem5O?=
 =?utf-8?B?YzFDK3JnRjQ3TTQreGR5eXVwZHlyQ3FFbUYwY0Y3SmdZUjN1SW5Ed1F6SE02?=
 =?utf-8?B?ck9qcGtadHRlNzhBQzhNNWFUeWcyNnlqNExJRWpjam1tcGpoT1pZSmtadG9L?=
 =?utf-8?B?aGFXWjcrTXh0YjRtcnpnbWc0dnE4ZUUrVFVqemttL3RlNTZQVEwyTklFdVhi?=
 =?utf-8?B?SnQ4dUVuNEZ2alcxNjR6bVlGWmFRMHVVbHFvdFd6VFlHZ3NvTVFZbVQwVFdD?=
 =?utf-8?B?d1NqN0lxN3l5WUpqd1U3OEU1d3V5Y2g2Tlg4ZHV5eHhUVkN5Y1gvSlRqS005?=
 =?utf-8?B?cmlKNjlIZDlxcnMweEZ2SDlvSnBJemx3RzNrWU5QRGJUaTNzRHEvb1U0ZTc1?=
 =?utf-8?B?VjAyVmkwbzJhbWlGSE9pYW8xOGFoYWszRWdlbzViUk5FZlA3L2c0TVhCSGVB?=
 =?utf-8?B?K1piMUZGUG5mM2hmUGQ5VWNsUmxaWEhOZUxtZjZ3Qy9vdG0waGlobFltd1dU?=
 =?utf-8?B?REJ6UEVDS1RqSW9VOEVYVE9TVGFPd09XYmxLRHBKNTN6NG5ZZU5UcFlQc0dw?=
 =?utf-8?B?eHJOOUlDNDhtclhGbjNYR1V0ZzhlS1JoUHE2cTNtZk0wTEE5bnRDZm1heFB4?=
 =?utf-8?B?Qit6M2tzOFgxeTVhTmJFekhoU0hKQmNtRTRpQnBvNFBwL0lSTk5OU0prL3k3?=
 =?utf-8?B?UldLVXRzUTNlMWh4djMxYnZ3WWl2OTJ5bDJNQlFEZmRmV0xKQTR0NHhxUHl6?=
 =?utf-8?B?M2xIQkRzOW51MWMzeXp3ZVdsdVJ0QUxpZ0tydThKcjFiaGpQSzVUQXFyRmJH?=
 =?utf-8?B?TXVRL1VJOTJrUkgzSkR0Zk9mNnUwN25NV3Y2dWkwUlVrTHFpZWFaUUVpZ1By?=
 =?utf-8?B?QUUxSEwxQ0hLQVl1Smg5VlZiM3ZLcXp4U1NMbWdBZmt3LzNCcjV1RTZ6TG5r?=
 =?utf-8?B?RWZrZE9UQVdiZjBQVEZaWEFmb3lEcndmTE1ETW5VSjkzZllWNGpmVDFBUzBh?=
 =?utf-8?B?Y1YyOHdsUU93clRucjFrUHprU3lzb1BMb2dZUkZBeHJnWlRERXhsNklJN25B?=
 =?utf-8?B?MVNRaTZVSmZIa3NvZXZiRERuKzhUK0FiRDQ4RGpCMzhXV2lHVjl5bDhLUDl2?=
 =?utf-8?B?MkhDR2xLZlY1SnpiQnVEOFI0SXRQQU4wTHBIaC9DYnBrYTBFRFBubjYrZ1Fy?=
 =?utf-8?B?c25LbHpLU3RwZnM5MWRScVhNTHdYeVBEZ1BwOUhmb0cyUDZ0ekVvSVp6U2Jh?=
 =?utf-8?B?QnpaTnhneDh3RituS2FMb2phaXJKOWdadlNnWTFGaElScWI2OEQxc2lRdEpD?=
 =?utf-8?Q?3biA4HaxPfpEY+nTPej0s3eJb4GLhanJBKRemLSVd6Tq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ecabed88-a272-4d84-e70b-08db6b5e858a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 16:03:11.8596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Krvt1dsHEl/DhnRhsjV7Qt0OJGggYKAQzJitBqke/ZZlLIukAZxBwadUkuzVFPvHOMLUnOcNB23zPDgJP89tkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6269
Message-ID-Hash: JUQSXF56UDVGQH5B5MTFYIPUYCFNYPGY
X-Message-ID-Hash: JUQSXF56UDVGQH5B5MTFYIPUYCFNYPGY
X-MailFrom: jonathanh@nvidia.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JUQSXF56UDVGQH5B5MTFYIPUYCFNYPGY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 12/06/2023 15:28, Oswald Buddenhagen wrote:
> On Mon, Jun 12, 2023 at 02:16:15PM +0100, Jon Hunter wrote:
>> On 12/06/2023 13:18, Jon Hunter wrote:
>>> On 05/04/2023 21:12, Oswald Buddenhagen wrote:
>>>> ... in wait_for_avail() and snd_pcm_drain().
>>>
>>> Sorry for not catching this sooner, but I have just noticed that one 
>>> of our audio tests for Tegra is failing on v6.4-rc and bisect is 
>>> pointing to this commit. Reverting this on top of the current 
>>> mainline fixes it.
>>>
>> If I enable the debug prints, I do see the following messages ...
>>
>>  tegra-audio-graph-card sound: capture read timeout (DMA or IRQ trouble?)
>>
> yes, this is the kind of fallout one would expect from this change, as 
> it significantly shortened the effective timeout under most circumstances.
> 
> first check that there isn't a genuine underlying bug, that is, that the 
> unusually slow timings match expectations.
> 
> if everything looks right, then properly codify the timeout in the 
> driver by setting substream->wait_time as required.
> the lazy approach of more or less restoring the previous status quo 
> would be setting it to 10000 in the `open` callback.
> fwiw, soc/sof sets it to 500, which may actually be a bad idea (it's 
> short enough that a very long period time would exceed it, if such is 
> permitted). and it's not obvious why it does that.


Yes I can see now that reducing the timeout is causing the problem here. 
I can try a few settings to see what works.

Thanks
Jon

-- 
nvpublic
